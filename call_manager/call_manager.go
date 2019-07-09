package call_manager

import (
	"fmt"
	"github.com/webitel/call_center/model"
	"github.com/webitel/call_center/mq"
	"github.com/webitel/storage/utils"
	"github.com/webitel/wlog"
	"sync"
)

const (
	MAX_CALL_CACHE        = 10000
	MAX_CALL_EXPIRE_CACHE = 60 * 60 * 24 //day
)

type CallManager interface {
	Start()
	Stop()
	ActiveCalls() int
	NewCall(callRequest *model.CallRequest) Call
}

type Call interface {
	Id() string
	HangupCause() string
	GetState() uint8
	Err() *model.AppError
	SetHangupCall(event mq.Event)

	OfferingAt() int64
	AcceptAt() int64
	BridgeAt() int64
	HangupAt() int64

	DurationSeconds() int
	BillSeconds() int
	AnswerSeconds() int
	WaitSeconds() int

	WaitForHangup()

	Hangup(cause string) *model.AppError
	Hold() *model.AppError
}

type CallManagerImpl struct {
	nodeId       string
	callCommands model.Commands
	mq           mq.MQ
	calls        utils.ObjectCache
	stop         chan struct{}
	stopped      chan struct{}
	startOnce    sync.Once
}

func NewCallManager(nodeId string, cc model.Commands, mq mq.MQ) CallManager {
	return &CallManagerImpl{
		nodeId:       nodeId,
		callCommands: cc,
		mq:           mq,
		stop:         make(chan struct{}),
		stopped:      make(chan struct{}),
		calls:        utils.NewLruWithParams(MAX_CALL_CACHE, "CallManager", MAX_CALL_EXPIRE_CACHE, ""),
	}
}

func (cm *CallManagerImpl) Start() {
	wlog.Debug("CallManager started")

	cm.startOnce.Do(func() {
		go func() {
			defer func() {
				wlog.Debug("Stopped CallManager")
				close(cm.stopped)
			}()

			for {
				select {
				case <-cm.stop:
					wlog.Debug("CallManager received stop signal")
					return
				case e, ok := <-cm.mq.ConsumeCallEvent():
					if !ok {
						return
					}

					cm.handleCallEvent(e)
				}
			}
		}()
	})
}

func (cm *CallManagerImpl) Stop() {
	wlog.Debug("CallManager Stopping")
	close(cm.stop)
	<-cm.stopped
}

func (cm *CallManagerImpl) NewCall(callRequest *model.CallRequest) Call {
	id := model.NewId()
	callRequest.Variables[model.CALL_ID] = id
	callRequest.Variables[model.QUEUE_NODE_ID_FIELD] = cm.nodeId

	call := NewCall(callRequest, cm.callCommands.GetCallConnection())
	if call.Id() != "" {
		cm.SetCall(id, call)
	}
	return call
}

func (cm *CallManagerImpl) ActiveCalls() int {
	return cm.calls.Len()
}

func (cm *CallManagerImpl) GetCall(id string) (Call, bool) {
	if call, ok := cm.calls.Get(id); ok {
		return call.(Call), true
	}
	return nil, false
}

func (cm *CallManagerImpl) SetCall(id string, call Call) {
	wlog.Debug(fmt.Sprintf("save store call %s %s", id, call.Id()))
	cm.calls.AddWithDefaultExpires(id, call)
}

func (cm *CallManagerImpl) RemoveCall(id string) {
	wlog.Debug(fmt.Sprintf("remove store call %s", id))
	cm.calls.Remove(id)
}
