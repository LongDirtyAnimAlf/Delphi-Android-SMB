unit jcifs.smb.SID;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  jcifs.smb.NtlmPasswordAuthentication,
  //jcifs.dcerpc.DcerpcHandle,
  //jcifs.dcerpc.msrpc.LsaPolicyHandle,
  jcifs.dcerpc.rpc_sid_t;
//  jcifs.dcerpc.msrpc.SamrDomainHandle;

type
  JSID = interface;

  JSIDClass = interface(JObjectClass)
    ['{F919B937-574B-477B-8800-3257FE3D3531}']
    function _GetCREATOR_OWNER : JSID; cdecl;
    function _GetEVERYONE : JSID; cdecl;
    function _GetSID_FLAG_RESOLVE_SIDS : Integer; cdecl;
    function _GetSID_TYPE_ALIAS : Integer; cdecl;
    function _GetSID_TYPE_DELETED : Integer; cdecl;
    function _GetSID_TYPE_DOMAIN : Integer; cdecl;
    function _GetSID_TYPE_DOM_GRP : Integer; cdecl;
    function _GetSID_TYPE_INVALID : Integer; cdecl;
    function _GetSID_TYPE_UNKNOWN : Integer; cdecl;
    function _GetSID_TYPE_USER : Integer; cdecl;
    function _GetSID_TYPE_USE_NONE : Integer; cdecl;
    function _GetSID_TYPE_WKN_GRP : Integer; cdecl;
    function _GetSYSTEM : JSID; cdecl;
    function equals(obj : JObject) : boolean; cdecl;
    function getAccountName : JString; cdecl;
    function getDomainName : JString; cdecl;
    function getDomainSid : JSID; cdecl;
    function getGroupMemberSids(authorityServerName : JString; auth : JNtlmPasswordAuthentication; flags : Integer) : TJavaArray<JSID>; cdecl;
    function getRid : Integer; cdecl;
    function getServerSid(server : JString; auth : JNtlmPasswordAuthentication) : JSID; cdecl;
    function getType : Integer; cdecl;
    function getTypeText : JString; cdecl;
    function hashCode : Integer; cdecl;
    function init(domsid : JSID; rid : Integer) : JSID; cdecl; overload;
    function init(sid : Jrpc_sid_t; &type : Integer; domainName : JString; acctName : JString; decrementAuthority : boolean) : JSID; cdecl; overload;
    function init(src : TJavaArray<Byte>; si : Integer) : JSID; cdecl; overload;
    function init(textual : JString) : JSID; cdecl; overload;
    function toByteArray(sid : Jrpc_sid_t) : TJavaArray<Byte>; cdecl;
    function toDisplayString : JString; cdecl;
    function toString : JString; cdecl;
    procedure resolve(authorityServerName : JString; auth : JNtlmPasswordAuthentication) ; cdecl;
    procedure resolveSids(authorityServerName : JString; auth : JNtlmPasswordAuthentication; sids : TJavaArray<JSID>) ; cdecl; overload;
    procedure resolveSids(authorityServerName : JString; auth : JNtlmPasswordAuthentication; sids : TJavaArray<JSID>; offset : Integer; length : Integer) ; cdecl; overload;
    property CREATOR_OWNER : JSID read _GetCREATOR_OWNER;
    property EVERYONE : JSID read _GetEVERYONE;
    property SID_FLAG_RESOLVE_SIDS : Integer read _GetSID_FLAG_RESOLVE_SIDS;
    property SID_TYPE_ALIAS : Integer read _GetSID_TYPE_ALIAS;
    property SID_TYPE_DELETED : Integer read _GetSID_TYPE_DELETED;
    property SID_TYPE_DOMAIN : Integer read _GetSID_TYPE_DOMAIN;
    property SID_TYPE_DOM_GRP : Integer read _GetSID_TYPE_DOM_GRP;
    property SID_TYPE_INVALID : Integer read _GetSID_TYPE_INVALID;
    property SID_TYPE_UNKNOWN : Integer read _GetSID_TYPE_UNKNOWN;
    property SID_TYPE_USER : Integer read _GetSID_TYPE_USER;
    property SID_TYPE_USE_NONE : Integer read _GetSID_TYPE_USE_NONE;
    property SID_TYPE_WKN_GRP : Integer read _GetSID_TYPE_WKN_GRP;
    property SYSTEM : JSID read _GetSYSTEM;
  end;

  [JavaSignature('jcifs/smb/SID')]
  JSID = interface(JObject)
    ['{38625257-001C-4DA5-998D-4FFD3946D8C1}']
    function equals(obj : JObject) : boolean; cdecl;
    function getAccountName : JString; cdecl;
    function getDomainName : JString; cdecl;
    function getDomainSid : JSID; cdecl;
    function getGroupMemberSids(authorityServerName : JString; auth : JNtlmPasswordAuthentication; flags : Integer) : TJavaArray<JSID>; cdecl;
    function getRid : Integer; cdecl;
    function getType : Integer; cdecl;
    function getTypeText : JString; cdecl;
    function hashCode : Integer; cdecl;
    function toDisplayString : JString; cdecl;
    function toString : JString; cdecl;
    procedure resolve(authorityServerName : JString; auth : JNtlmPasswordAuthentication) ; cdecl;
  end;

  TJSID = class(TJavaGenericImport<JSIDClass, JSID>)
  end;

const
  TJSIDSID_TYPE_USE_NONE = 0;
  TJSIDSID_TYPE_USER = 1;
  TJSIDSID_TYPE_DOM_GRP = 2;
  TJSIDSID_TYPE_DOMAIN = 3;
  TJSIDSID_TYPE_ALIAS = 4;
  TJSIDSID_TYPE_WKN_GRP = 5;
  TJSIDSID_TYPE_DELETED = 6;
  TJSIDSID_TYPE_INVALID = 7;
  TJSIDSID_TYPE_UNKNOWN = 8;
  TJSIDSID_FLAG_RESOLVE_SIDS = 1;

implementation

end.
