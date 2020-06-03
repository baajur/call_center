package queue

import (
	"fmt"
	"github.com/webitel/call_center/agent_manager"
	"github.com/webitel/call_center/call_manager"
	"github.com/webitel/call_center/model"
	"github.com/webitel/wlog"
	"time"
)

/*
TODO: 1. можливо при _discard_abandoned_after брати максимально відалений ABANDONED
ringtone_id
*/

type InboundQueue struct {
	CallingQueue
	props model.QueueInboundSettings
}

func NewInboundQueue(callQueue CallingQueue, settings model.QueueInboundSettings) QueueObject {
	return &InboundQueue{
		CallingQueue: callQueue,
		props:        settings,
	}
}

func (queue *InboundQueue) DistributeAttempt(attempt *Attempt) *model.AppError {
	mCall, ok := queue.CallManager().GetCall(*attempt.member.MemberCallId)
	if !ok {
		return NewErrorCallRequired(queue, attempt)
	}

	team, err := queue.GetTeam(attempt)
	if err != nil {
		return err
	}

	go queue.run(attempt, mCall, team)

	return nil
}

func (queue *InboundQueue) run(attempt *Attempt, mCall call_manager.Call, team *agentTeam) {
	var err *model.AppError
	defer attempt.Log("stopped queue")

	attempt.Log("wait agent")
	if err = queue.queueManager.SetFindAgentState(attempt.Id()); err != nil {
		//FIXME
		panic(err.Error())
	}
	attempt.SetState(model.MEMBER_STATE_FIND_AGENT)

	attempts := 0

	var agent agent_manager.AgentObject
	var agentCall call_manager.Call

	var calling = mCall.HangupAt() == 0

	ags := attempt.On(AttemptHookDistributeAgent)

	//TODO
	timeout := time.NewTimer(time.Second * 360)

	for calling {
		select {
		case <-timeout.C:
			fmt.Println("TIMEOUT")
			calling = false
		case <-attempt.Context.Done():
			calling = false
		case <-mCall.HangupChan():
			calling = false
			break

		case <-ags:
			agent = attempt.Agent()
			attempts++
			if mCall.HangupCause() != "" {
				attempt.Log(fmt.Sprintf("agent %s LOSE_RACE", agent.Name()))
				calling = false
				break
			}

			attempt.Log(fmt.Sprintf("distribute agent %s [%d]", agent.Name(), agent.Id()))

			cr := queue.AgentCallRequest(agent, team, attempt)
			cr.Applications = []*model.CallRequestApplication{
				{
					AppName: "sleep",
					Args:    "5000",
				},
			}
			cr.Variables["wbt_parent_id"] = mCall.Id()

			agentCall = mCall.NewCall(cr)

			// fixme new function
			queue.Hook(agent, NewDistributeEvent(attempt, agent.UserId(), queue, agent, mCall, agentCall))
			agentCall.Invite()
			team.Offering(attempt, agent, agentCall, mCall)

			wlog.Debug(fmt.Sprintf("call [%s] && agent [%s]", mCall.Id(), agentCall.Id()))

		top:
			for agentCall.HangupCause() == "" && mCall.HangupCause() == "" {
				select {
				case state := <-agentCall.State():
					attempt.Log(fmt.Sprintf("agent call state %d", state))
					switch state {
					case call_manager.CALL_STATE_ACCEPT:
						team.Answered(attempt, agent)
						printfIfErr(agentCall.Bridge(mCall))
					case call_manager.CALL_STATE_BRIDGE:
						fmt.Println("TODO")
						//team.Bridged(attempt, agent)
						//attempt.Emit(AttemptHookBridgedAgent, agentCall.Id())
					case call_manager.CALL_STATE_HANGUP:
						break top
					}
				case s := <-mCall.State():
					if s == call_manager.CALL_STATE_BRIDGE {
						timeout.Stop()
						team.Bridged(attempt, agent)
						attempt.Emit(AttemptHookBridgedAgent, agentCall.Id())
					}
				case <-mCall.HangupChan():
					attempt.Log(fmt.Sprintf("call hangup %s", mCall.Id()))
					if agentCall.HangupAt() == 0 {
						if mCall.BridgeAt() > 0 {
							agentCall.Hangup(model.CALL_HANGUP_NORMAL_CLEARING, false)
						} else {
							agentCall.Hangup(model.CALL_HANGUP_ORIGINATOR_CANCEL, false)
						}

						agentCall.WaitForHangup()
					}

					attempt.Log(fmt.Sprintf("[%s] call %s receive hangup", agentCall.NodeName(), agentCall.Id()))
					break top // FIXME
				}
			}

			if agentCall.BridgeAt() == 0 {
				team.MissedAndWaitingAttempt(attempt, agent)
				if agentCall != nil && agentCall.HangupAt() == 0 {
					//TODO WaitForHangup
					//panic(agentCall.Id())
				}
				agent = nil
				agentCall = nil
			}

			calling = mCall.HangupAt() == 0
		}
	}

	if agentCall != nil && agentCall.HangupAt() == 0 {
		//panic(agentCall.Id())
	}

	if agentCall != nil && agentCall.BridgeAt() > 0 { //FIXME Accept or Bridge ?

		// FIXME
		if team.PostProcessing() && agentCall.ReportingAt() > 0 {
			team.WrapTime(attempt, agent, agentCall.ReportingAt())
		} else {
			wlog.Debug(fmt.Sprintf("attempt[%d] reporting...", attempt.Id()))
			team.Reporting(attempt, agent)
		}
	} else {
		queue.queueManager.Abandoned(attempt)
	}

	go attempt.Emit(AttemptHookLeaving)
	go attempt.Off("*")
	queue.queueManager.LeavingMember(attempt, queue)
}
