unit jcifs.smb.NtlmPasswordAuthentication;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type
  JNtlmPasswordAuthentication = interface;

  JNtlmPasswordAuthenticationClass = interface(JObjectClass)
    ['{1B7C2BB2-F3D5-4EA2-A510-D1E9F7191641}']
    function _GetANONYMOUS : JNtlmPasswordAuthentication; cdecl;
    function equals(obj : JObject) : boolean; cdecl;
    function getAnsiHash(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getDomain : JString; cdecl;
    function getLMv2Response(domain : JString; user : JString; password : JString; challenge : TJavaArray<Byte>; clientChallenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl; overload;
    function getLMv2Response(responseKeyLM : TJavaArray<Byte>; serverChallenge : TJavaArray<Byte>; clientChallenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl; overload;
    function getNTLM2Response(nTOWFv1 : TJavaArray<Byte>; serverChallenge : TJavaArray<Byte>; clientChallenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getNTLMResponse(password : JString; challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getNTLMv2Response(responseKeyNT : TJavaArray<Byte>; serverChallenge : TJavaArray<Byte>; clientChallenge : TJavaArray<Byte>; nanos1601 : Int64; targetInfo : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getName : JString; cdecl;
    function getPassword : JString; cdecl;
    function getPreNTLMResponse(password : JString; challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getSigningKey(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getUnicodeHash(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getUserSessionKey(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl; overload;
    function getUsername : JString; cdecl;
    function hashCode : Integer; cdecl;
    {class} function init(domain : JString; username : JString; challenge : TJavaArray<Byte>; ansiHash : TJavaArray<Byte>; unicodeHash : TJavaArray<Byte>) : JNtlmPasswordAuthentication; cdecl; overload;
    {class} function init(domain : JString; username : JString; password : JString) : JNtlmPasswordAuthentication; cdecl; overload;
    {class} function init(userInfo : JString) : JNtlmPasswordAuthentication; cdecl; overload;
    function nTOWFv1(password : JString) : TJavaArray<Byte>; cdecl;
    function nTOWFv2(domain : JString; username : JString; password : JString) : TJavaArray<Byte>; cdecl;
    function toString : JString; cdecl;
    property ANONYMOUS : JNtlmPasswordAuthentication read _GetANONYMOUS;
  end;

  [JavaSignature('jcifs/smb/NtlmPasswordAuthentication')]
  JNtlmPasswordAuthentication = interface(JObject)
    ['{82671B68-5D9E-4B0F-8E6C-6C3F0FA12CD9}']
    function equals(obj : JObject) : boolean; cdecl;
    function getAnsiHash(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getDomain : JString; cdecl;
    function getName : JString; cdecl;
    function getPassword : JString; cdecl;
    function getSigningKey(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getUnicodeHash(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl;
    function getUserSessionKey(challenge : TJavaArray<Byte>) : TJavaArray<Byte>; cdecl; overload;
    function getUsername : JString; cdecl;
    function hashCode : Integer; cdecl;
    function toString : JString; cdecl;
  end;

  TJNtlmPasswordAuthentication = class(TJavaGenericImport<JNtlmPasswordAuthenticationClass, JNtlmPasswordAuthentication>)
  end;

const
  TJNtlmPasswordAuthenticationBLANK = '';

implementation

end.
