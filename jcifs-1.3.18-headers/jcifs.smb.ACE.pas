unit jcifs.smb.ACE;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes,
  jcifs.smb.SID;

type
  JACE = interface;

  JACEClass = interface(JObjectClass)
    ['{E619581E-01AF-4868-AE2D-8729234010BC}']
    function _GetDELETE : Integer; cdecl;
    function _GetFILE_APPEND_DATA : Integer; cdecl;
    function _GetFILE_DELETE : Integer; cdecl;
    function _GetFILE_EXECUTE : Integer; cdecl;
    function _GetFILE_READ_ATTRIBUTES : Integer; cdecl;
    function _GetFILE_READ_DATA : Integer; cdecl;
    function _GetFILE_READ_EA : Integer; cdecl;
    function _GetFILE_WRITE_ATTRIBUTES : Integer; cdecl;
    function _GetFILE_WRITE_DATA : Integer; cdecl;
    function _GetFILE_WRITE_EA : Integer; cdecl;
    function _GetFLAGS_CONTAINER_INHERIT : Integer; cdecl;
    function _GetFLAGS_INHERITED : Integer; cdecl;
    function _GetFLAGS_INHERIT_ONLY : Integer; cdecl;
    function _GetFLAGS_NO_PROPAGATE : Integer; cdecl;
    function _GetFLAGS_OBJECT_INHERIT : Integer; cdecl;
    function _GetGENERIC_ALL : Integer; cdecl;
    function _GetGENERIC_EXECUTE : Integer; cdecl;
    function _GetGENERIC_READ : Integer; cdecl;
    function _GetGENERIC_WRITE : Integer; cdecl;
    function _GetREAD_CONTROL : Integer; cdecl;
    function _GetSYNCHRONIZE : Integer; cdecl;
    function _GetWRITE_DAC : Integer; cdecl;
    function _GetWRITE_OWNER : Integer; cdecl;
    function getAccessMask : Integer; cdecl;
    function getApplyToText : JString; cdecl;
    function getFlags : Integer; cdecl;
    function getSID : JSID; cdecl;
    function init : JACE; cdecl;
    function isAllow : boolean; cdecl;
    function isInherited : boolean; cdecl;
    function toString : JString; cdecl;
    property DELETE : Integer read _GetDELETE;
    property FILE_APPEND_DATA : Integer read _GetFILE_APPEND_DATA;
    property FILE_DELETE : Integer read _GetFILE_DELETE;
    property FILE_EXECUTE : Integer read _GetFILE_EXECUTE;
    property FILE_READ_ATTRIBUTES : Integer read _GetFILE_READ_ATTRIBUTES;
    property FILE_READ_DATA : Integer read _GetFILE_READ_DATA;
    property FILE_READ_EA : Integer read _GetFILE_READ_EA;
    property FILE_WRITE_ATTRIBUTES : Integer read _GetFILE_WRITE_ATTRIBUTES;
    property FILE_WRITE_DATA : Integer read _GetFILE_WRITE_DATA;
    property FILE_WRITE_EA : Integer read _GetFILE_WRITE_EA;
    property FLAGS_CONTAINER_INHERIT : Integer read _GetFLAGS_CONTAINER_INHERIT;
    property FLAGS_INHERITED : Integer read _GetFLAGS_INHERITED;
    property FLAGS_INHERIT_ONLY : Integer read _GetFLAGS_INHERIT_ONLY;
    property FLAGS_NO_PROPAGATE : Integer read _GetFLAGS_NO_PROPAGATE;
    property FLAGS_OBJECT_INHERIT : Integer read _GetFLAGS_OBJECT_INHERIT;
    property GENERIC_ALL : Integer read _GetGENERIC_ALL;
    property GENERIC_EXECUTE : Integer read _GetGENERIC_EXECUTE;
    property GENERIC_READ : Integer read _GetGENERIC_READ;
    property GENERIC_WRITE : Integer read _GetGENERIC_WRITE;
    property READ_CONTROL : Integer read _GetREAD_CONTROL;
    property SYNCHRONIZE : Integer read _GetSYNCHRONIZE;
    property WRITE_DAC : Integer read _GetWRITE_DAC;
    property WRITE_OWNER : Integer read _GetWRITE_OWNER;
  end;

  [JavaSignature('jcifs/smb/ACE')]
  JACE = interface(JObject)
    ['{EEEB58D5-5BD6-4EE7-882F-947D985E8A5D}']
    function getAccessMask : Integer; cdecl;
    function getApplyToText : JString; cdecl;
    function getFlags : Integer; cdecl;
    function getSID : JSID; cdecl;
    function isAllow : boolean; cdecl;
    function isInherited : boolean; cdecl;
    function toString : JString; cdecl;
  end;

  TJACE = class(TJavaGenericImport<JACEClass, JACE>)
  end;

const
  TJACEFILE_READ_DATA = 1;
  TJACEFILE_WRITE_DATA = 2;
  TJACEFILE_APPEND_DATA = 4;
  TJACEFILE_READ_EA = 8;
  TJACEFILE_WRITE_EA = 16;
  TJACEFILE_EXECUTE = 32;
  TJACEFILE_DELETE = 64;
  TJACEFILE_READ_ATTRIBUTES = 128;
  TJACEFILE_WRITE_ATTRIBUTES = 256;
  TJACEDELETE = 65536;
  TJACEREAD_CONTROL = 131072;
  TJACEWRITE_DAC = 262144;
  TJACEWRITE_OWNER = 524288;
  TJACESYNCHRONIZE = 1048576;
  TJACEGENERIC_ALL = 268435456;
  TJACEGENERIC_EXECUTE = 536870912;
  TJACEGENERIC_WRITE = 1073741824;
  TJACEGENERIC_READ = -2147483648;
  TJACEFLAGS_OBJECT_INHERIT = 1;
  TJACEFLAGS_CONTAINER_INHERIT = 2;
  TJACEFLAGS_NO_PROPAGATE = 4;
  TJACEFLAGS_INHERIT_ONLY = 8;
  TJACEFLAGS_INHERITED = 16;

implementation

end.
