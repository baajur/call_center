package queue

import (
	"fmt"
	"github.com/webitel/call_center/agent_manager"
	"github.com/webitel/call_center/mlog"
	"github.com/webitel/call_center/model"
)

type PreviewCallQueue struct {
	CallingQueue
}

func NewPreviewCallQueue(callQueue CallingQueue) QueueObject {
	return &PreviewCallQueue{
		CallingQueue: callQueue,
	}
}

func (preview *PreviewCallQueue) RouteAgentToAttempt(attempt *Attempt) {
	Assert(attempt.Agent())
	go preview.makeCallToAgent(attempt, attempt.Agent())
}

func (preview *PreviewCallQueue) JoinAttempt(attempt *Attempt) {
	Assert(attempt.resource)

	attempt.Info = &AttemptInfoCall{}

	err := preview.queueManager.SetAttemptState(attempt.Id(), model.MEMBER_STATE_FIND_AGENT)
	if err != nil {
		//TODO
		preview.StopAttemptWithCallDuration(attempt, model.MEMBER_CAUSE_ABANDONED, 0)
		preview.queueManager.LeavingMember(attempt, preview)
		return
	}
	attempt.Log("find agent")
}

func (preview *PreviewCallQueue) makeCallToAgent(attempt *Attempt, agent agent_manager.AgentObject) {

	info := preview.GetCallInfoFromAttempt(attempt)

	if attempt.GetCommunicationPattern() == nil {
		panic(123)
	}
	endpoint, e := preview.resourceManager.GetEndpoint(*attempt.GetCommunicationPattern())
	if e != nil {
		panic(e.Error())
	}

	endpoint.Parse(attempt.resource.GetDialString(), attempt.Destination())

	callRequest := &model.CallRequest{
		Endpoints:    agent.GetEndpoints(),
		CallerName:   attempt.Name(),
		CallerNumber: attempt.Destination(),
		Timeout:      preview.Timeout(),
		Variables: model.UnionStringMaps(
			attempt.resource.Variables(),
			preview.Variables(),
			attempt.Variables(),
			map[string]string{
				model.CALL_TIMEOUT_VARIABLE:            fmt.Sprintf("%d", preview.Timeout()),
				model.CALL_IGNORE_EARLY_MEDIA_VARIABLE: "true",
				"ignore_display_updates":               "true",
				model.CALL_DIRECTION_VARIABLE:          model.CALL_DIRECTION_DIALER,
				model.CALL_DOMAIN_VARIABLE:             preview.Domain(),
				model.QUEUE_ID_FIELD:                   fmt.Sprintf("%d", preview.id),
				model.QUEUE_NAME_FIELD:                 preview.name,
				model.QUEUE_TYPE_NAME_FIELD:            preview.TypeName(),
				model.QUEUE_SIDE_FIELD:                 model.QUEUE_SIDE_AGENT,
				model.QUEUE_MEMBER_ID_FIELD:            fmt.Sprintf("%d", attempt.MemberId()),
				model.QUEUE_ATTEMPT_ID_FIELD:           fmt.Sprintf("%d", attempt.Id()),
				model.QUEUE_RESOURCE_ID_FIELD:          fmt.Sprintf("%d", attempt.resource.Id()),
				model.QUEUE_ROUTING_ID_FIELD:           fmt.Sprintf("%d", attempt.GetCommunicationRoutingId()),
			},
		),
		Applications: make([]*model.CallRequestApplication, 0, 4),
	}

	if preview.RecordCallEnabled() {
		preview.SetRecordCall(callRequest, model.CALL_RECORD_SESSION_TEMPLATE)
		info.UseRecordings = true
	}

	callRequest.Applications = append(callRequest.Applications, &model.CallRequestApplication{
		AppName: "answer",
		Args:    "",
	})

	callRequest.Applications = append(callRequest.Applications, &model.CallRequestApplication{
		AppName: "bridge",
		Args:    "{bridge_early_media=true,cc_side=member,origination_caller_id_number=777}sofia/external/dialer-12@10.10.10.25:5080",
	})

	preview.queueManager.agentManager.SetAgentState(agent, model.AGENT_STATE_OFFERING, 0)

	call := preview.NewCallUseResource(callRequest, attempt.GetCommunicationRoutingId(), attempt.resource)
	if call.Err() != nil {
		preview.CallError(attempt, call.Err(), call.HangupCause())
		preview.queueManager.LeavingMember(attempt, preview)
		return
	}
	preview.queueManager.agentManager.SetAgentState(agent, model.AGENT_STATE_TALK, 0)
	mlog.Debug(fmt.Sprintf("Create call %s for member %s attemptId %v", call.Id(), attempt.Name(), attempt.Id()))

	call.WaitHangup()

	if call.HangupCause() == "" {
		preview.StopAttemptWithCallDuration(attempt, model.MEMBER_CAUSE_SUCCESSFUL, 10) //TODO
	} else {
		preview.StopAttemptWithCallDuration(attempt, call.HangupCause(), 10) //TODO
	}

	preview.queueManager.LeavingMember(attempt, preview)
	preview.queueManager.agentManager.SetAgentState(attempt.Agent(), model.AGENT_STATE_REPORTING, 10)

}
