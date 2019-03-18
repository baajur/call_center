package dialing

import (
	"fmt"
	"github.com/webitel/call_center/mlog"
	"github.com/webitel/call_center/model"
	"github.com/webitel/call_center/utils"
	"sync"
)

const (
	SIZE_RESOURCES_CACHE = 10000
	EXPIRE_CACHE_ITEM    = 60 * 60 * 24 //day
)

type ResourceManager struct {
	resourcesCache utils.ObjectCache
	patternsCache  utils.ObjectCache
	app            App
	sync.Mutex
}

func NewResourceManager(app App) *ResourceManager {
	return &ResourceManager{
		resourcesCache: utils.NewLruWithParams(SIZE_RESOURCES_CACHE, "ResourceManager", EXPIRE_CACHE_ITEM, ""),
		patternsCache:  utils.NewLruWithParams(SIZE_RESOURCES_CACHE, "ResourcePatternCache", -1, ""),
		app:            app,
	}
}

func (r *ResourceManager) Get(id int64, updatedAt int64) (ResourceObject, *model.AppError) {
	r.Lock()
	defer r.Unlock()
	var dialResource ResourceObject
	item, ok := r.resourcesCache.Get(id)
	if ok {
		dialResource, ok = item.(ResourceObject)
		if ok && !dialResource.IsExpire(updatedAt) {
			return dialResource, nil
		}
	}

	if config, err := r.app.GetOutboundResourceById(id); err != nil {
		return nil, err
	} else {
		dialResource, _ = NewResource(config)
	}

	r.resourcesCache.AddWithDefaultExpires(id, dialResource)
	mlog.Debug(fmt.Sprintf("Add resource %s to cache", dialResource.Name()))
	return dialResource, nil
}

func (r *ResourceManager) GetEndpoint(pattern string) (*Endpoint, *model.AppError) {
	var endpoint *Endpoint

	if p, ok := r.patternsCache.Get(pattern); !ok {
		var err *model.AppError

		if endpoint, err = NewResourceEndpoint(pattern); err != nil {
			return nil, err
		}

		mlog.Debug(fmt.Sprintf("Add endpoint pattern %s to cache", pattern))
		r.patternsCache.AddWithDefaultExpires(pattern, endpoint)
	} else {
		endpoint = p.(*Endpoint)
	}

	return endpoint, nil
}
