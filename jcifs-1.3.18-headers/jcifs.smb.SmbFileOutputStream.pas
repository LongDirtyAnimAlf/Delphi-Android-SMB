unit jcifs.smb.SmbFileOutputStream;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  jcifs.smb.SmbFile;

type
  JSmbFileOutputStream = interface;

  JSmbFileOutputStreamClass = interface(JObjectClass)
    ['{E03DEE8A-7E54-4A01-839B-6DE5482AACEB}']
    function init(&file : JSmbFile) : JSmbFileOutputStream; cdecl; overload;
    function init(&file : JSmbFile; append : boolean) : JSmbFileOutputStream; cdecl; overload;
    function init(url : JString) : JSmbFileOutputStream; cdecl; overload;
    function init(url : JString; append : boolean) : JSmbFileOutputStream; cdecl; overload;
    function init(url : JString; shareAccess : Integer) : JSmbFileOutputStream; cdecl; overload;
    function isOpen : boolean; cdecl;
    procedure &write(b : Integer) ; cdecl; overload;
    procedure &write(b : TJavaArray<Byte>) ; cdecl; overload;
    procedure &write(b : TJavaArray<Byte>; off : Integer; len : Integer) ; cdecl; overload;
    procedure close ; cdecl;
    procedure writeDirect(b : TJavaArray<Byte>; off : Integer; len : Integer; flags : Integer) ; cdecl;
  end;

  [JavaSignature('jcifs/smb/SmbFileOutputStream')]
  JSmbFileOutputStream = interface(JObject)
    ['{38EE2899-B3EA-40A6-A645-DD5D9B3162FF}']
    function isOpen : boolean; cdecl;
    procedure &write(b : Integer) ; cdecl; overload;
    procedure &write(b : TJavaArray<Byte>) ; cdecl; overload;
    procedure &write(b : TJavaArray<Byte>; off : Integer; len : Integer) ; cdecl; overload;
    procedure close ; cdecl;
    procedure writeDirect(b : TJavaArray<Byte>; off : Integer; len : Integer; flags : Integer) ; cdecl;
  end;

  TJSmbFileOutputStream = class(TJavaGenericImport<JSmbFileOutputStreamClass, JSmbFileOutputStream>)
  end;

implementation

end.
