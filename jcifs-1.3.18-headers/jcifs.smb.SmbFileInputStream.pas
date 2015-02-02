unit jcifs.smb.SmbFileInputStream;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  jcifs.smb.SmbFile;

type
  JSmbFileInputStream = interface;

  JSmbFileInputStreamClass = interface(JObjectClass)
    ['{68C060A2-BCFA-45B4-B581-7FEEF768BA35}']
    function &read : Integer; cdecl; overload;
    function &read(b : TJavaArray<Byte>) : Integer; cdecl; overload;
    function &read(b : TJavaArray<Byte>; off : Integer; len : Integer) : Integer; cdecl; overload;
    function available : Integer; cdecl;
    function init(&file : JSmbFile) : JSmbFileInputStream; cdecl; overload;
    function init(url : JString) : JSmbFileInputStream; cdecl; overload;
    function readDirect(b : TJavaArray<Byte>; off : Integer; len : Integer) : Integer; cdecl;
    function skip(n : Int64) : Int64; cdecl;
    procedure close ; cdecl;
  end;

  [JavaSignature('jcifs/smb/SmbFileInputStream')]
  JSmbFileInputStream = interface(JObject)
    ['{F6F53927-6B0A-465C-AC38-8C2F30218C1B}']
    function &read : Integer; cdecl; overload;
    function &read(b : TJavaArray<Byte>) : Integer; cdecl; overload;
    function &read(b : TJavaArray<Byte>; off : Integer; len : Integer) : Integer; cdecl; overload;
    function available : Integer; cdecl;
    function readDirect(b : TJavaArray<Byte>; off : Integer; len : Integer) : Integer; cdecl;
    function skip(n : Int64) : Int64; cdecl;
    procedure close ; cdecl;
  end;

  TJSmbFileInputStream = class(TJavaGenericImport<JSmbFileInputStreamClass, JSmbFileInputStream>)
  end;

implementation

end.
