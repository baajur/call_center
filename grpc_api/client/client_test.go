package client

import (
	"github.com/webitel/engine/discovery"
	"testing"
)

func Test(t *testing.T) {
	t.Log("CC")

	sd, err := discovery.NewServiceDiscovery("", "10.9.8.111:8500", func() (b bool, appError error) {
		return true, nil
	})

	if err != nil {
		panic(err.Error())
	}

	cc := NewCCManager(sd)
	cc.Start()
	cc.Agent().Login(50, 100)
	defer cc.Stop()
}
