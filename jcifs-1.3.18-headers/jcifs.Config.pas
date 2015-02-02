unit jcifs.Config;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  java.net.InetAddress;

type
  JConfig = interface;

  JConfigClass = interface(JObjectClass)
    ['{B1E03A11-BC84-489B-BE1E-8E94216CB4C4}']
    function _GetDEFAULT_OEM_ENCODING : JString; cdecl;
    function _GetsocketCount : Integer; cdecl;
    function get(key : JString) : JObject; cdecl;
    function getBoolean(key : JString; def : boolean) : boolean; cdecl;
    function getInetAddress(key : JString; def : JInetAddress) : JInetAddress; cdecl;
    function getInetAddressArray(key : JString; delim : JString; def : TJavaArray<JInetAddress>) : TJavaArray<JInetAddress>; cdecl;
    function getInt(key : JString) : Integer; cdecl; overload;
    function getInt(key : JString; def : Integer) : Integer; cdecl; overload;
    function getLocalHost : JInetAddress; cdecl;
    function getLong(key : JString; def : Int64) : Int64; cdecl;
    function getProperty(key : JString) : JString; cdecl; overload;
    function getProperty(key : JString; def : JString) : JString; cdecl; overload;
    function setProperty(key : JString; value : JString) : JObject; cdecl;
    procedure list(&out : JPrintStream) ; cdecl;
    procedure load(&in : JInputStream) ; cdecl;
    procedure registerSmbURLHandler ; cdecl;
    procedure setProperties(prp : JProperties) ; cdecl;
    procedure store(&out : JOutputStream; header : JString) ; cdecl;
    property DEFAULT_OEM_ENCODING : JString read _GetDEFAULT_OEM_ENCODING;
    property socketCount : Integer read _GetsocketCount;
  end;

  [JavaSignature('jcifs/Config')]
  JConfig = interface(JObject)
    ['{8F576449-A231-440B-B3AD-9BFD786CC7BA}']
  end;

  TJConfig = class(TJavaGenericImport<JConfigClass, JConfig>)
  end;

implementation

end.
