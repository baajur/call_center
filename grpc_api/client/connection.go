package client

import (
	proto "github.com/webitel/call_center/grpc_api/cc"
	"google.golang.org/grpc"
	"google.golang.org/grpc/connectivity"
	"time"
)

type ccConnection struct {
	name   string
	host   string
	client *grpc.ClientConn
	agent  proto.AgentServiceClient
}

func NewCCConnection(name, url string) (*ccConnection, error) {
	var err error
	connection := &ccConnection{
		name: name,
		host: url,
	}

	connection.client, err = grpc.Dial(url, grpc.WithInsecure(), grpc.WithBlock(), grpc.WithTimeout(2*time.Second))

	if err != nil {
		return nil, err
	}

	connection.agent = proto.NewAgentServiceClient(connection.client)

	return connection, nil
}

func (conn *ccConnection) Ready() bool {
	switch conn.client.GetState() {
	case connectivity.Idle, connectivity.Ready:
		return true
	}
	return false
}

func (conn *ccConnection) Name() string {
	return conn.name
}

func (conn *ccConnection) Close() error {
	err := conn.client.Close()
	if err != nil {
		return ErrInternal
	}
	return nil
}

func (conn *ccConnection) Agent() proto.AgentServiceClient {
	return conn.agent
}
