// Code generated by protoc-gen-go. DO NOT EDIT.
// source: protos/cc/agent.proto

package cc

import (
	context "context"
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

type LoginRequest struct {
	AgentId              int32    `protobuf:"varint,1,opt,name=agent_id,json=agentId,proto3" json:"agent_id,omitempty"`
	DomainId             int64    `protobuf:"varint,2,opt,name=domain_id,json=domainId,proto3" json:"domain_id,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *LoginRequest) Reset()         { *m = LoginRequest{} }
func (m *LoginRequest) String() string { return proto.CompactTextString(m) }
func (*LoginRequest) ProtoMessage()    {}
func (*LoginRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_105db670aa3a7dc9, []int{0}
}

func (m *LoginRequest) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_LoginRequest.Unmarshal(m, b)
}
func (m *LoginRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_LoginRequest.Marshal(b, m, deterministic)
}
func (m *LoginRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_LoginRequest.Merge(m, src)
}
func (m *LoginRequest) XXX_Size() int {
	return xxx_messageInfo_LoginRequest.Size(m)
}
func (m *LoginRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_LoginRequest.DiscardUnknown(m)
}

var xxx_messageInfo_LoginRequest proto.InternalMessageInfo

func (m *LoginRequest) GetAgentId() int32 {
	if m != nil {
		return m.AgentId
	}
	return 0
}

func (m *LoginRequest) GetDomainId() int64 {
	if m != nil {
		return m.DomainId
	}
	return 0
}

type LoginResponse struct {
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *LoginResponse) Reset()         { *m = LoginResponse{} }
func (m *LoginResponse) String() string { return proto.CompactTextString(m) }
func (*LoginResponse) ProtoMessage()    {}
func (*LoginResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_105db670aa3a7dc9, []int{1}
}

func (m *LoginResponse) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_LoginResponse.Unmarshal(m, b)
}
func (m *LoginResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_LoginResponse.Marshal(b, m, deterministic)
}
func (m *LoginResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_LoginResponse.Merge(m, src)
}
func (m *LoginResponse) XXX_Size() int {
	return xxx_messageInfo_LoginResponse.Size(m)
}
func (m *LoginResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_LoginResponse.DiscardUnknown(m)
}

var xxx_messageInfo_LoginResponse proto.InternalMessageInfo

func init() {
	proto.RegisterType((*LoginRequest)(nil), "cc.LoginRequest")
	proto.RegisterType((*LoginResponse)(nil), "cc.LoginResponse")
}

func init() { proto.RegisterFile("protos/cc/agent.proto", fileDescriptor_105db670aa3a7dc9) }

var fileDescriptor_105db670aa3a7dc9 = []byte{
	// 161 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0x12, 0x2d, 0x28, 0xca, 0x2f,
	0xc9, 0x2f, 0xd6, 0x4f, 0x4e, 0xd6, 0x4f, 0x4c, 0x4f, 0xcd, 0x2b, 0xd1, 0x03, 0xf3, 0x85, 0x98,
	0x92, 0x93, 0x95, 0xdc, 0xb8, 0x78, 0x7c, 0xf2, 0xd3, 0x33, 0xf3, 0x82, 0x52, 0x0b, 0x4b, 0x53,
	0x8b, 0x4b, 0x84, 0x24, 0xb9, 0x38, 0xc0, 0x4a, 0xe2, 0x33, 0x53, 0x24, 0x18, 0x15, 0x18, 0x35,
	0x58, 0x83, 0xd8, 0xc1, 0x7c, 0xcf, 0x14, 0x21, 0x69, 0x2e, 0xce, 0x94, 0xfc, 0xdc, 0xc4, 0xcc,
	0x3c, 0x90, 0x1c, 0x93, 0x02, 0xa3, 0x06, 0x73, 0x10, 0x07, 0x44, 0xc0, 0x33, 0x45, 0x89, 0x9f,
	0x8b, 0x17, 0x6a, 0x4e, 0x71, 0x41, 0x7e, 0x5e, 0x71, 0xaa, 0x91, 0x1d, 0x17, 0x8f, 0x23, 0x48,
	0x63, 0x70, 0x6a, 0x51, 0x59, 0x66, 0x72, 0xaa, 0x90, 0x1e, 0x17, 0x2b, 0x58, 0x81, 0x90, 0x80,
	0x5e, 0x72, 0xb2, 0x1e, 0xb2, 0x9d, 0x52, 0x82, 0x48, 0x22, 0x10, 0xdd, 0x4a, 0x0c, 0x49, 0x6c,
	0x60, 0x37, 0x1a, 0x03, 0x02, 0x00, 0x00, 0xff, 0xff, 0x8f, 0xc6, 0x05, 0x9d, 0xbc, 0x00, 0x00,
	0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// AgentServiceClient is the client API for AgentService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type AgentServiceClient interface {
	Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*LoginResponse, error)
}

type agentServiceClient struct {
	cc *grpc.ClientConn
}

func NewAgentServiceClient(cc *grpc.ClientConn) AgentServiceClient {
	return &agentServiceClient{cc}
}

func (c *agentServiceClient) Login(ctx context.Context, in *LoginRequest, opts ...grpc.CallOption) (*LoginResponse, error) {
	out := new(LoginResponse)
	err := c.cc.Invoke(ctx, "/cc.AgentService/Login", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AgentServiceServer is the server API for AgentService service.
type AgentServiceServer interface {
	Login(context.Context, *LoginRequest) (*LoginResponse, error)
}

// UnimplementedAgentServiceServer can be embedded to have forward compatible implementations.
type UnimplementedAgentServiceServer struct {
}

func (*UnimplementedAgentServiceServer) Login(ctx context.Context, req *LoginRequest) (*LoginResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Login not implemented")
}

func RegisterAgentServiceServer(s *grpc.Server, srv AgentServiceServer) {
	s.RegisterService(&_AgentService_serviceDesc, srv)
}

func _AgentService_Login_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(LoginRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AgentServiceServer).Login(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/cc.AgentService/Login",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AgentServiceServer).Login(ctx, req.(*LoginRequest))
	}
	return interceptor(ctx, in, info, handler)
}

var _AgentService_serviceDesc = grpc.ServiceDesc{
	ServiceName: "cc.AgentService",
	HandlerType: (*AgentServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Login",
			Handler:    _AgentService_Login_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "protos/cc/agent.proto",
}
