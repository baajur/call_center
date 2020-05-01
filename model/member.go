package model

import (
	"encoding/json"
	"time"
)

const (
	MEMBER_CAUSE_SYSTEM_SHUTDOWN     = "SYSTEM_SHUTDOWN"
	MEMBER_CAUSE_ABANDONED           = "abandoned"
	MEMBER_CAUSE_TIMEOUT             = "timeout"
	MEMBER_CAUSE_CANCEL              = "cancel"
	MEMBER_CAUSE_SUCCESSFUL          = "SUCCESSFUL"
	MEMBER_CAUSE_QUEUE_NOT_IMPLEMENT = "QUEUE_NOT_IMPLEMENT"
)

const (
	MEMBER_STATE_END          = -1
	MEMBER_STATE_IDLE         = 0 // ~Reserved resource
	MEMBER_STATE_RESERVED     = 1
	MEMBER_STATE_ORIGINATE    = 2
	MEMBER_STATE_FIND_AGENT   = 3
	MEMBER_STATE_PROGRESS     = 4 // offering TODO
	MEMBER_STATE_ACTIVE       = 5
	MEMBER_STATE_POST_PROCESS = 6
	MEMBER_STATE_CANCEL       = 7
)

/*

{"id": 0, "type": {"id": 1, "name": ""}, "state": 0, "display": "", "attempts": 0, "priority": 0, "resource": null, "last_cause": "", "description": "912908.9643714452", "destination": "696232.3886641971", "last_activity_at": 0}
*/

type Communication struct {
	Id   int    `json:"id"`
	Name string `json:"name"` // TODO
}

type MemberCommunication struct {
	Destination string        `json:"destination"`
	Type        Communication `json:"type"`
	Priority    int           `json:"priority"`
	Display     *string       `json:"display"`
}

type MemberAttempt struct {
	Id             int64 `json:"id" db:"id"`
	QueueId        int   `json:"queue_id" db:"queue_id"`
	QueueUpdatedAt int64 `json:"queue_updated_at" db:"queue_updated_at"`

	QueueCount        int `json:"queue_count" db:"queue_count"`
	QueueActiveCount  int `json:"queue_active_count" db:"queue_active_count"`
	QueueWaitingCount int `json:"queue_waiting_count" db:"queue_waiting_count"`

	State               uint8     `json:"state" db:"state"`
	MemberId            int64     `json:"member_id" db:"member_id"`
	CreatedAt           time.Time `json:"created_at" db:"created_at"`
	HangupAt            int64     `json:"hangup_at" db:"hangup_at"`
	BridgedAt           int64     `json:"bridged_at" db:"bridged_at"`
	ResourceId          *int64    `json:"resource_id" db:"resource_id"`
	ResourceUpdatedAt   *int64    `json:"resource_updated_at" db:"resource_updated_at"`
	GatewayUpdatedAt    *int64    `json:"gateway_updated_at" db:"gateway_updated_at"`
	Result              *string   `json:"result" db:"result"`
	Destination         []byte    `json:"destination" db:"destination"`
	ListCommunicationId *int64    `json:"list_communication_id" db:"list_communication_id"`
	AgentId             *int      `json:"agent_id" db:"agent_id"`
	AgentUpdatedAt      *int64    `json:"agent_updated_at" db:"agent_updated_at"`
	TeamUpdatedAt       *int64    `json:"team_updated_at" db:"team_updated_at"`
	Variables           []byte    `json:"variables" db:"variables"`
	Name                string    `json:"name" db:"name"`
	MemberCallId        *string   `json:"member_call_id" db:"member_call_id"`
}

type AttemptTimeout struct {
	Id        int64  `json:"id" db:"id"`
	Timestamp int64  `json:"timestamp" db:"timestamp"`
	AttemptId *int64 `json:"attempt_id" db:"attempt_id"`
	Result    string `json:"result" db:"result"`
}

type EventAttempt struct {
	AttemptId int64  `json:"attempt_id"`
	Timestamp int64  `json:"timestamp"`
	Channel   string `json:"channel"`
	Status    string `json:"status"`
	AgentId   *int   `json:"agent_id"`
	UserId    *int64 `json:"user_id"`
	DomainId  int64  `json:"domain_id"`
}

type EventAttemptOffering struct {
	MemberId int64 `json:"member_id"`
	EventAttempt
}

func (e *EventAttemptOffering) ToJSON() string {
	data, _ := json.Marshal(e)
	return string(data)
}

func (e *EventAttempt) ToJSON() string {
	data, _ := json.Marshal(e)
	return string(data)
}

type AttemptOfferingAgent struct {
	AgentId        *int  `json:"agent_id" db:"agent_id"`
	AgentNoAnswers *int  `json:"agent_no_answers" db:"agent_no_answers"`
	Timestamp      int64 `json:"timestamp" db:"cur_time"`
}

type AttemptCallback struct {
	Status        string
	MinOfferingAt *int64
	ExpireAt      *int64
	Variables     map[string]string
	Display       bool
	Description   string
}

type AttemptResult2 struct {
	Success bool `json:"success"`

	Status      string `json:"status"`
	Description string `json:"description"`
	Display     bool   `json:"display"`
	ExpireAt    *int64 `json:"expire_at"`
	NextCall    *int64 `json:"next_call"`
}

type AttemptReportingResult struct {
	Timestamp    int64   `json:"timestamp" db:"timestamp"`
	Channel      *string `json:"channel" db:"channel"`
	AgentCallId  *string `json:"agent_call_id" db:"agent_call_id"`
	AgentId      *int    `json:"agent_id" db:"agent_id"`
	AgentTimeout *int64  `json:"agent_timeout" db:"agent_timeout"`
	//AgentCallAppId *string `json:"agent_call_app_id"`
}

type HistoryAttempt struct {
	Id     int64  `json:"id" db:"id"`
	Result string `json:"result" db:"result"`
}

type AttemptResult struct {
	Id         int64   `json:"id" db:"id"`
	State      int8    `json:"state" db:"state"`
	OfferingAt int64   `json:"offering_at" db:"offering_at"`
	AnsweredAt int64   `json:"answered_at" db:"answered_at"`
	BridgedAt  int64   `json:"bridged_at" db:"bridged_at"`
	HangupAt   int64   `json:"hangup_at" db:"hangup_at"`
	AgentId    *int    `json:"agent_id" db:"agent_id"`
	Result     string  `json:"result" db:"result"`
	LegAId     *string `json:"leg_a_id" db:"leg_a_id"`
	LegBId     *string `json:"leg_a_id" db:"leg_a_id"`
}

type InboundMember struct {
	QueueId  int64  `json:"queue_id"`
	CallId   string `json:"call_id"`
	Number   string `json:"number"`
	Name     string `json:"name"`
	Priority int    `json:"priority"`
}

func (ma *MemberAttempt) IsTimeout() bool {
	return ma.Result != nil && *ma.Result == CALL_HANGUP_TIMEOUT
}

func MemberDestinationFromBytes(data []byte) MemberCommunication {
	var dest MemberCommunication
	json.Unmarshal(data, &dest)
	return dest
}
