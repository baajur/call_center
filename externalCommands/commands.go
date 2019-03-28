package externalCommands

import "github.com/webitel/call_center/model"

type Commands interface {
	NewCall(settings *model.CallRequest) (string, string, *model.AppError)
	HangupCall(id, cause string) *model.AppError
	SetCallVariables(id string, variables map[string]string) *model.AppError
	Close()
}
