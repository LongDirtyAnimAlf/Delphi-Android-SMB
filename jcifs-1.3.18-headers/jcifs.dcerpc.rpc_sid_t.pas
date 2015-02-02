unit jcifs.dcerpc.rpc_sid_t;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  jcifs.dcerpc.ndr.NdrBuffer;

type
  Jrpc_sid_t = interface;

  Jrpc_sid_tClass = interface(JObjectClass)
    ['{FB8AC70B-6946-4A59-970E-8307372A07CF}']
    function _Getidentifier_authority : TJavaArray<Byte>; cdecl;
    function _Getrevision : Byte; cdecl;
    function _Getsub_authority : TJavaArray<Integer>; cdecl;
    function _Getsub_authority_count : Byte; cdecl;
    function init : Jrpc_sid_t; cdecl;
    procedure _Setidentifier_authority(Value : TJavaArray<Byte>) ; cdecl;
    procedure _Setrevision(Value : Byte) ; cdecl;
    procedure _Setsub_authority(Value : TJavaArray<Integer>) ; cdecl;
    procedure _Setsub_authority_count(Value : Byte) ; cdecl;
    procedure decode(_src : JNdrBuffer) ; cdecl;
    procedure encode(_dst : JNdrBuffer) ; cdecl;
    property identifier_authority : TJavaArray<Byte> read _Getidentifier_authority write _Setidentifier_authority;
    property revision : Byte read _Getrevision write _Setrevision;
    property sub_authority : TJavaArray<Integer> read _Getsub_authority write _Setsub_authority;
    property sub_authority_count : Byte read _Getsub_authority_count write _Setsub_authority_count;
  end;

  [JavaSignature('jcifs/dcerpc/rpc_sid_t')]
  Jrpc_sid_t = interface(JObject)
    ['{48D0C7D1-293F-4600-B473-A792226B30D6}']
    function _Getidentifier_authority : TJavaArray<Byte>; cdecl;
    function _Getrevision : Byte; cdecl;
    function _Getsub_authority : TJavaArray<Integer>; cdecl;
    function _Getsub_authority_count : Byte; cdecl;
    procedure _Setidentifier_authority(Value : TJavaArray<Byte>) ; cdecl;
    procedure _Setrevision(Value : Byte) ; cdecl;
    procedure _Setsub_authority(Value : TJavaArray<Integer>) ; cdecl;
    procedure _Setsub_authority_count(Value : Byte) ; cdecl;
    procedure decode(_src : JNdrBuffer) ; cdecl;
    procedure encode(_dst : JNdrBuffer) ; cdecl;
    property identifier_authority : TJavaArray<Byte> read _Getidentifier_authority write _Setidentifier_authority;
    property revision : Byte read _Getrevision write _Setrevision;
    property sub_authority : TJavaArray<Integer> read _Getsub_authority write _Setsub_authority;
    property sub_authority_count : Byte read _Getsub_authority_count write _Setsub_authority_count;
  end;

  TJrpc_sid_t = class(TJavaGenericImport<Jrpc_sid_tClass, Jrpc_sid_t>)
  end;

implementation

end.
