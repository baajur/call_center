package dialing

import (
	"fmt"
	"github.com/webitel/call_center/mlog"
	"github.com/webitel/call_center/model"
)

type VoiceBroadcastQueue struct {
	CallingQueue
}

func NewVoiceBroadcastQueue(callQueue CallingQueue, settings *model.Queue) QueueObject {
	return &VoiceBroadcastQueue{
		CallingQueue: callQueue,
	}
}

func (voice *VoiceBroadcastQueue) FoundAgentForAttempt(attempt *Attempt) {
	panic(`Broadcast queue not reserve agents`)
}

func (voice *VoiceBroadcastQueue) AddMemberAttempt(attempt *Attempt) {
	if attempt.member.ResourceId == nil || attempt.member.ResourceUpdatedAt == nil {
		panic(123)
	}

	r, e := voice.resourceManager.Get(*attempt.member.ResourceId, *attempt.member.ResourceUpdatedAt)
	if e != nil {
		panic(e.Error())
	}

	if attempt.GetCommunicationPattern() == nil {
		panic("no pattern")
	}

	endpoint, e := voice.resourceManager.GetEndpoint(*attempt.GetCommunicationPattern())

	go voice.makeCall(attempt, r.(ResourceObject), endpoint)
}

func (voice *VoiceBroadcastQueue) makeCall(attempt *Attempt, r ResourceObject, endpoint *Endpoint) {

	info, err := voice.queueManager.Originate(attempt)
	if err != nil {
		panic(err.Error())
	}

	dst := endpoint.Parse(r.GetDialString(), info.Number)
	fmt.Println(dst)

	callRequest := &model.CallRequest{
		Endpoints:    []string{dst},
		CallerNumber: info.Number,
		CallerName:   info.Name,
		//Timeout:      5,
		//Strategy: model.CALL_STRATEGY_MULTIPLE,
		Variables: map[string]string{
			"domain_name": "10.10.10.25",
			//"ignore_early_media": "true",
			//"progress_timeout":           "5",
			"call_timeout":               "50",
			model.QUEUE_NODE_ID_FILD:     voice.queueManager.GetNodeId(),
			model.QUEUE_ID_FILD:          fmt.Sprintf("%d", voice.id),
			model.QUEUE_NAME_FILD:        voice.name,
			model.QUEUE_SIDE_FILD:        model.QUEUE_SIDE_MEMBER,
			model.QUEUE_MEMBER_ID_FILD:   fmt.Sprintf("%d", attempt.member.Id),
			model.QUEUE_ATTEMPT_ID_FILD:  fmt.Sprintf("%d", attempt.Id()),
			model.QUEUE_RESOURCE_ID_FILD: fmt.Sprintf("%d", r.Id()),
		},
		Destination: "1003",
		//Extensions: []*model.CallRequestExtension{
		//	{
		//		AppName: "park",
		//		Args:    "",
		//	},
		//	{
		//		AppName: "hangup",
		//	},
		//},
	}

	r.Take() // rps
	uuid, cause, err := voice.queueManager.app.NewCall(callRequest)
	if err != nil {
		voice.queueManager.LeavingMember(attempt, voice)
		voice.queueManager.SetAttemptError(attempt, model.MEMBER_STATE_END, cause)
		return
	}

	mlog.Debug(fmt.Sprintf("Create call %s for member id %v", uuid, attempt.Id()))

	err = voice.queueManager.SetBridged(attempt, model.NewString(uuid), nil)
	if err != nil {
		panic(err.Error())
	}
}

func (voice *VoiceBroadcastQueue) SetHangupCall(attempt *Attempt) {
	i, err := voice.queueManager.StopAttempt(attempt.Id(), 1, model.MEMBER_STATE_END, model.GetMillis(), model.MEMBER_CAUSE_SUCCESSFUL)
	if err != nil {
		panic("todo")
	} else if i != nil {
		fmt.Println(i)
	}

	voice.queueManager.LeavingMember(attempt, voice)
}
