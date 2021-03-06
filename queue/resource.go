package queue

import (
	"github.com/webitel/call_center/model"
	"go.uber.org/ratelimit"
	"math/rand"
)

const (
	MASK_CHAR = 'X'
)

type ResourceObject interface {
	Name() string
	IsExpire(updatedAt int64) bool
	CheckCodeError(errorId string) bool
	GetDisplay() string
	Id() int
	SuccessivelyErrors() uint16
	Variables() map[string]string
	Take()
	Gateway() *model.SipGateway
}

//type Gateway interface {
//	GetId() int64
//	Name() string
//	Variables() map[string]string
//	Endpoint(destination string) string
//}

type Resource struct {
	id                    int
	updatedAt             int64
	name                  string
	rps                   uint16
	rateLimiter           ratelimit.Limiter
	variables             map[string]string
	displayNumbers        []string
	errorIds              model.StringArray
	successivelyErrors    uint16
	maxSuccessivelyErrors uint16
	gatewayId             *int64
	emailProfileId        *int
	gateway               model.SipGateway
}

func NewResource(config *model.OutboundResource, gw model.SipGateway) (ResourceObject, *model.AppError) {
	r := &Resource{
		id:                    config.Id,
		updatedAt:             config.UpdatedAt,
		name:                  config.Name,
		rps:                   config.Rps,
		errorIds:              nil,
		successivelyErrors:    config.SuccessivelyErrors,
		maxSuccessivelyErrors: config.MaxSuccessivelyErrors,
		variables:             model.MapStringInterfaceToString(config.Variables),
		displayNumbers:        config.DisplayNumbers,
		gateway:               gw,
	}

	if config.ErrorIds != nil {
		r.errorIds = config.ErrorIds
	}

	if r.rps > 0 {
		r.rateLimiter = ratelimit.New(int(config.Rps))
	}

	return r, nil
}

func (r *Resource) Name() string {
	return r.name
}

func (r *Resource) GetDisplay() string {
	var l = len(r.displayNumbers)
	if l == 0 {
		return ""
	} else {
		return r.displayNumbers[rand.Intn(l)]
	}
}

func (r *Resource) IsExpire(updatedAt int64) bool {
	return r.updatedAt != updatedAt
}

func (r *Resource) Id() int {
	return r.id
}

func (r *Resource) SuccessivelyErrors() uint16 {
	return r.successivelyErrors
}

func (r *Resource) Variables() map[string]string {
	return model.UnionStringMaps(
		r.variables,
		r.gateway.Variables(),
	)
}

func (r *Resource) Gateway() *model.SipGateway {
	return &r.gateway
}

func (r *Resource) Take() {
	if r.rateLimiter != nil {
		r.rateLimiter.Take()
	}
}

func (r *Resource) CheckCodeError(errorCode string) bool {
	if r.maxSuccessivelyErrors < 1 || r.errorIds == nil {
		return false
	}

	e := []rune(errorCode)
	for _, v := range r.errorIds {
		if checkCodeMask(v, e) {
			return true
		}
	}
	return false
}

func checkCodeMask(maskCode string, code []rune) bool {
	if len(maskCode) != len(code) {
		return false
	}

	for i, v := range maskCode {
		if v == MASK_CHAR {
			continue
		}
		if v != code[i] {
			return true
		}
	}
	return false
}
