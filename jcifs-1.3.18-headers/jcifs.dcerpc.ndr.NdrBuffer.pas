unit jcifs.dcerpc.ndr.NdrBuffer;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes;

type
  JNdrBuffer = interface;

  JNdrBufferClass = interface(JObjectClass)
    ['{82620D78-8086-4E11-871F-9DD9DBF32F2A}']
    function _Getbuf : TJavaArray<Byte>; cdecl;
    function _Getdeferred : JNdrBuffer; cdecl;
    function _Getindex : Integer; cdecl;
    function _Getlength : Integer; cdecl;
    function _Getstart : Integer; cdecl;
    function align(boundary : Integer) : Integer; cdecl; overload;
    function align(boundary : Integer; value : Byte) : Integer; cdecl; overload;
    function dec_ndr_hyper : Int64; cdecl;
    function dec_ndr_long : Integer; cdecl;
    function dec_ndr_short : Integer; cdecl;
    function dec_ndr_small : Integer; cdecl;
    function dec_ndr_string : JString; cdecl;
    function derive(idx : Integer) : JNdrBuffer; cdecl;
    function getBuffer : TJavaArray<Byte>; cdecl;
    function getCapacity : Integer; cdecl;
    function getIndex : Integer; cdecl;
    function getLength : Integer; cdecl;
    function getTailSpace : Integer; cdecl;
    function init(buf : TJavaArray<Byte>; start : Integer) : JNdrBuffer; cdecl;
    function toString : JString; cdecl;
    procedure _Setbuf(Value : TJavaArray<Byte>) ; cdecl;
    procedure _Setdeferred(Value : JNdrBuffer) ; cdecl;
    procedure _Setindex(Value : Integer) ; cdecl;
    procedure _Setlength(Value : Integer) ; cdecl;
    procedure _Setstart(Value : Integer) ; cdecl;
    procedure advance(n : Integer) ; cdecl;
    procedure enc_ndr_hyper(h : Int64) ; cdecl;
    procedure enc_ndr_long(l : Integer) ; cdecl;
    procedure enc_ndr_referent(obj : JObject; &type : Integer) ; cdecl;
    procedure enc_ndr_short(s : Integer) ; cdecl;
    procedure enc_ndr_small(s : Integer) ; cdecl;
    procedure enc_ndr_string(s : JString) ; cdecl;
    procedure readOctetArray(b : TJavaArray<Byte>; i : Integer; l : Integer) ; cdecl;
    procedure reset ; cdecl;
    procedure setIndex(&index : Integer) ; cdecl;
    procedure setLength(length : Integer) ; cdecl;
    procedure writeOctetArray(b : TJavaArray<Byte>; i : Integer; l : Integer) ; cdecl;
    property &index : Integer read _Getindex write _Setindex;
    property buf : TJavaArray<Byte> read _Getbuf write _Setbuf;
    property deferred : JNdrBuffer read _Getdeferred write _Setdeferred;
    property length : Integer read _Getlength write _Setlength;
    property start : Integer read _Getstart write _Setstart;
  end;

  [JavaSignature('jcifs/dcerpc/ndr/NdrBuffer$Entry')]
  JNdrBuffer = interface(JObject)
    ['{E09B3097-E092-494A-9B01-BB4CA9011312}']
    function _Getbuf : TJavaArray<Byte>; cdecl;
    function _Getdeferred : JNdrBuffer; cdecl;
    function _Getindex : Integer; cdecl;
    function _Getlength : Integer; cdecl;
    function _Getstart : Integer; cdecl;
    function align(boundary : Integer) : Integer; cdecl; overload;
    function align(boundary : Integer; value : Byte) : Integer; cdecl; overload;
    function dec_ndr_hyper : Int64; cdecl;
    function dec_ndr_long : Integer; cdecl;
    function dec_ndr_short : Integer; cdecl;
    function dec_ndr_small : Integer; cdecl;
    function dec_ndr_string : JString; cdecl;
    function derive(idx : Integer) : JNdrBuffer; cdecl;
    function getBuffer : TJavaArray<Byte>; cdecl;
    function getCapacity : Integer; cdecl;
    function getIndex : Integer; cdecl;
    function getLength : Integer; cdecl;
    function getTailSpace : Integer; cdecl;
    function toString : JString; cdecl;
    procedure _Setbuf(Value : TJavaArray<Byte>) ; cdecl;
    procedure _Setdeferred(Value : JNdrBuffer) ; cdecl;
    procedure _Setindex(Value : Integer) ; cdecl;
    procedure _Setlength(Value : Integer) ; cdecl;
    procedure _Setstart(Value : Integer) ; cdecl;
    procedure advance(n : Integer) ; cdecl;
    procedure enc_ndr_hyper(h : Int64) ; cdecl;
    procedure enc_ndr_long(l : Integer) ; cdecl;
    procedure enc_ndr_referent(obj : JObject; &type : Integer) ; cdecl;
    procedure enc_ndr_short(s : Integer) ; cdecl;
    procedure enc_ndr_small(s : Integer) ; cdecl;
    procedure enc_ndr_string(s : JString) ; cdecl;
    procedure readOctetArray(b : TJavaArray<Byte>; i : Integer; l : Integer) ; cdecl;
    procedure reset ; cdecl;
    procedure setIndex(&index : Integer) ; cdecl;
    procedure setLength(length : Integer) ; cdecl;
    procedure writeOctetArray(b : TJavaArray<Byte>; i : Integer; l : Integer) ; cdecl;
    property &index : Integer read _Getindex write _Setindex;
    property buf : TJavaArray<Byte> read _Getbuf write _Setbuf;
    property deferred : JNdrBuffer read _Getdeferred write _Setdeferred;
    property length : Integer read _Getlength write _Setlength;
    property start : Integer read _Getstart write _Setstart;
  end;

  TJNdrBuffer = class(TJavaGenericImport<JNdrBufferClass, JNdrBuffer>)
  end;

implementation

end.
