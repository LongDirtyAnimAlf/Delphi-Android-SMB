unit jcifs.smb.SmbFile;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  java.lang.JClass,
  java.security.Principal,
  jcifs.smb.NtlmPasswordAuthentication,
  jcifs.smb.ACE;

type
  JSmbFile = interface;

  JSmbFileFilter = interface;

  JSmbFileFilterClass = interface(JObjectClass)
    ['{E7A54D51-FA40-43DD-B3E2-5DB71CE59276}']
    function accept(JSmbFileparam0 : JSmbFile) : boolean; cdecl;
  end;

  [JavaSignature('jcifs/smb/SmbFileFilter')]
  JSmbFileFilter = interface(JObject)
    ['{313ED411-BA7E-4077-BF32-B457B3A011C9}']
    function accept(JSmbFileparam0 : JSmbFile) : boolean; cdecl;
  end;

  TJSmbFileFilter = class(TJavaGenericImport<JSmbFileFilterClass, JSmbFileFilter>)
  end;

  JSmbFilenameFilter = interface;

  JSmbFilenameFilterClass = interface(JObjectClass)
    ['{54233C05-9BF5-48C2-8B87-C549E378AAD5}']
    function accept(JSmbFileparam0 : JSmbFile; JStringparam1 : JString) : boolean; cdecl;
  end;

  [JavaSignature('jcifs/smb/SmbFilenameFilter')]
  JSmbFilenameFilter = interface(JObject)
    ['{A5445FA4-2788-4489-84D1-424E1F1149FA}']
    function accept(JSmbFileparam0 : JSmbFile; JStringparam1 : JString) : boolean; cdecl;
  end;

  TJSmbFilenameFilter = class(TJavaGenericImport<JSmbFilenameFilterClass, JSmbFilenameFilter>)
  end;

  JSmbFileClass = interface(JObjectClass)
    ['{F6E39252-95E6-42F1-A54E-1A5AD69BEBC6}']
    function _GetATTR_ARCHIVE : Integer; cdecl;
    function _GetATTR_DIRECTORY : Integer; cdecl;
    function _GetATTR_HIDDEN : Integer; cdecl;
    function _GetATTR_READONLY : Integer; cdecl;
    function _GetATTR_SYSTEM : Integer; cdecl;
    function _GetATTR_VOLUME : Integer; cdecl;
    function _GetFILE_NO_SHARE : Integer; cdecl;
    function _GetFILE_SHARE_DELETE : Integer; cdecl;
    function _GetFILE_SHARE_READ : Integer; cdecl;
    function _GetFILE_SHARE_WRITE : Integer; cdecl;
    function _GetTYPE_COMM : Integer; cdecl;
    function _GetTYPE_FILESYSTEM : Integer; cdecl;
    function _GetTYPE_NAMED_PIPE : Integer; cdecl;
    function _GetTYPE_PRINTER : Integer; cdecl;
    function _GetTYPE_SERVER : Integer; cdecl;
    function _GetTYPE_SHARE : Integer; cdecl;
    function _GetTYPE_WORKGROUP : Integer; cdecl;
    function canRead : boolean; cdecl;
    function canWrite : boolean; cdecl;
    function createTime : Int64; cdecl;
    function equals(obj : JObject) : boolean; cdecl;
    function exists : boolean; cdecl;
    function getAttributes : Integer; cdecl;
    function getCanonicalPath : JString; cdecl;
    function getContentLength : Integer; cdecl;
    function getDate : Int64; cdecl;
    function getDfsPath : JString; cdecl;
    function getDiskFreeSpace : Int64; cdecl;
    function getInputStream : JInputStream; cdecl;
    function getLastModified : Int64; cdecl;
    function getName : JString; cdecl;
    function getOutputStream : JOutputStream; cdecl;
    function getParent : JString; cdecl;
    function getPath : JString; cdecl;
    function getPrincipal : JPrincipal; cdecl;
    function getSecurity : TJavaArray<JACE>; cdecl; overload;
    function getSecurity(resolveSids : boolean) : TJavaArray<JACE>; cdecl; overload;
    function getServer : JString; cdecl;
    function getShare : JString; cdecl;
    function getShareSecurity(resolveSids : boolean) : TJavaArray<JACE>; cdecl;
    function getType : Integer; cdecl;
    function getUncPath : JString; cdecl;
    function hashCode : Integer; cdecl;
    {class} function init(context : JSmbFile; &name : JString) : JSmbFile; cdecl; overload;
    {class} function init(context : JSmbFile; &name : JString; shareAccess : Integer) : JSmbFile; cdecl; overload;
    {class} function init(context : JString; &name : JString) : JSmbFile; cdecl; overload;
    {class} function init(context : JString; &name : JString; auth : JNtlmPasswordAuthentication) : JSmbFile; cdecl; overload;
    {class} function init(context : JString; &name : JString; auth : JNtlmPasswordAuthentication; shareAccess : Integer) : JSmbFile; cdecl; overload;
    {class} function init(url : JString) : JSmbFile; cdecl; overload;
    {class} function init(url : JString; auth : JNtlmPasswordAuthentication) : JSmbFile; cdecl; overload;
    {class} function init(url : JString; auth : JNtlmPasswordAuthentication; shareAccess : Integer) : JSmbFile; cdecl; overload;
    {class} function init(url : JURL) : JSmbFile; cdecl; overload;
    {class} function init(url : JURL; auth : JNtlmPasswordAuthentication) : JSmbFile; cdecl; overload;
    function isDirectory : boolean; cdecl;
    function isFile : boolean; cdecl;
    function isHidden : boolean; cdecl;
    function lastModified : Int64; cdecl;
    function length : Int64; cdecl;
    function list : TJavaObjectArray<JString>; cdecl; overload;
    function list(filter : JSmbFilenameFilter) : TJavaObjectArray<JString>; cdecl; overload;
    function listFiles : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function listFiles(filter : JSmbFileFilter) : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function listFiles(filter : JSmbFilenameFilter) : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function listFiles(wildcard : JString) : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function toString : JString; cdecl;
    function toURL : JURL; deprecated; cdecl;
    procedure connect ; cdecl;
    procedure copyTo(dest : JSmbFile) ; cdecl;
    procedure createNewFile ; cdecl;
    procedure delete ; cdecl; overload;
    procedure mkdir ; cdecl;
    procedure mkdirs ; cdecl;
    procedure renameTo(dest : JSmbFile) ; cdecl;
    procedure setAttributes(attrs : Integer) ; cdecl;
    procedure setCreateTime(time : Int64) ; cdecl;
    procedure setLastModified(time : Int64) ; cdecl;
    procedure setReadOnly ; cdecl;
    procedure setReadWrite ; cdecl;
    property ATTR_ARCHIVE : Integer read _GetATTR_ARCHIVE;
    property ATTR_DIRECTORY : Integer read _GetATTR_DIRECTORY;
    property ATTR_HIDDEN : Integer read _GetATTR_HIDDEN;
    property ATTR_READONLY : Integer read _GetATTR_READONLY;
    property ATTR_SYSTEM : Integer read _GetATTR_SYSTEM;
    property ATTR_VOLUME : Integer read _GetATTR_VOLUME;
    property FILE_NO_SHARE : Integer read _GetFILE_NO_SHARE;
    property FILE_SHARE_DELETE : Integer read _GetFILE_SHARE_DELETE;
    property FILE_SHARE_READ : Integer read _GetFILE_SHARE_READ;
    property FILE_SHARE_WRITE : Integer read _GetFILE_SHARE_WRITE;
    property TYPE_COMM : Integer read _GetTYPE_COMM;
    property TYPE_FILESYSTEM : Integer read _GetTYPE_FILESYSTEM;
    property TYPE_NAMED_PIPE : Integer read _GetTYPE_NAMED_PIPE;
    property TYPE_PRINTER : Integer read _GetTYPE_PRINTER;
    property TYPE_SERVER : Integer read _GetTYPE_SERVER;
    property TYPE_SHARE : Integer read _GetTYPE_SHARE;
    property TYPE_WORKGROUP : Integer read _GetTYPE_WORKGROUP;
  end;

  [JavaSignature('jcifs/smb/SmbFile')]
  JSmbFile = interface(JObject)
    ['{1219FD67-7CAA-47F7-A97F-2351951B7BDA}']
    function canRead : boolean; cdecl;
    function canWrite : boolean; cdecl;
    function createTime : Int64; cdecl;
    function equals(obj : JObject) : boolean; cdecl;
    function exists : boolean; cdecl;
    function getAttributes : Integer; cdecl;
    function getCanonicalPath : JString; cdecl;
    function getContentLength : Integer; cdecl;
    function getDate : Int64; cdecl;
    function getDfsPath : JString; cdecl;
    function getDiskFreeSpace : Int64; cdecl;
    function getInputStream : JInputStream; cdecl;
    function getLastModified : Int64; cdecl;
    function getName : JString; cdecl;
    function getOutputStream : JOutputStream;
    function getParent : JString; cdecl;
    function getPath : JString; cdecl;
    function getPrincipal : JPrincipal; cdecl;
    function getSecurity : TJavaArray<JACE>; cdecl; overload;
    function getSecurity(resolveSids : boolean) : TJavaArray<JACE>; cdecl; overload;
    function getServer : JString; cdecl;
    function getShare : JString; cdecl;
    function getShareSecurity(resolveSids : boolean) : TJavaArray<JACE>; cdecl;
    function getType : Integer; cdecl;
    function getUncPath : JString; cdecl;
    function hashCode : Integer; cdecl;
    function isDirectory : boolean; cdecl;
    function isFile : boolean; cdecl;
    function isHidden : boolean; cdecl;
    function lastModified : Int64; cdecl;
    function length : Int64; cdecl;
    function list : TJavaObjectArray<JString>; cdecl; overload;
    function list(filter : JSmbFilenameFilter) : TJavaObjectArray<JString>; cdecl; overload;
    function listFiles : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function listFiles(filter : JSmbFileFilter) : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function listFiles(filter : JSmbFilenameFilter) : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function listFiles(wildcard : JString) : TJavaObjectArray<JSmbFile>; cdecl; overload;
    function toString : JString; cdecl;
    function toURL : JURL; deprecated; cdecl;
    procedure connect ; cdecl;
    procedure copyTo(dest : JSmbFile) ; cdecl;
    procedure createNewFile ; cdecl;
    procedure delete ; cdecl; overload;
    procedure mkdir ; cdecl;
    procedure mkdirs ; cdecl;
    procedure renameTo(dest : JSmbFile) ; cdecl;
    procedure setAttributes(attrs : Integer) ; cdecl;
    procedure setCreateTime(time : Int64) ; cdecl;
    procedure setLastModified(time : Int64) ; cdecl;
    procedure setReadOnly ; cdecl;
    procedure setReadWrite ; cdecl;
  end;

  TJSmbFile = class(TJavaGenericImport<JSmbFileClass, JSmbFile>)
  end;

const
  TJSmbFileO_RDONLY = 1;
  TJSmbFileO_WRONLY = 2;
  TJSmbFileO_RDWR = 3;
  TJSmbFileO_APPEND = 4;
  TJSmbFileO_CREAT = 16;
  TJSmbFileO_EXCL = 32;
  TJSmbFileO_TRUNC = 64;
  TJSmbFileFILE_NO_SHARE = 0;
  TJSmbFileFILE_SHARE_READ = 1;
  TJSmbFileFILE_SHARE_WRITE = 2;
  TJSmbFileFILE_SHARE_DELETE = 4;
  TJSmbFileATTR_READONLY = 1;
  TJSmbFileATTR_HIDDEN = 2;
  TJSmbFileATTR_SYSTEM = 4;
  TJSmbFileATTR_VOLUME = 8;
  TJSmbFileATTR_DIRECTORY = 16;
  TJSmbFileATTR_ARCHIVE = 32;
  TJSmbFileATTR_COMPRESSED = 2048;
  TJSmbFileATTR_NORMAL = 128;
  TJSmbFileATTR_TEMPORARY = 256;
  TJSmbFileATTR_GET_MASK = 32767;
  TJSmbFileATTR_SET_MASK = 12455;
  TJSmbFileDEFAULT_ATTR_EXPIRATION_PERIOD = 5000;
  TJSmbFileTYPE_FILESYSTEM = 1;
  TJSmbFileTYPE_WORKGROUP = 2;
  TJSmbFileTYPE_SERVER = 4;
  TJSmbFileTYPE_SHARE = 8;
  TJSmbFileTYPE_NAMED_PIPE = 16;
  TJSmbFileTYPE_PRINTER = 32;
  TJSmbFileTYPE_COMM = 64;

implementation

end.
