//
// Generated by JavaToPas v1.5 20140918 - 093209
////////////////////////////////////////////////////////////////////////////////
unit java.net.InetAddress;

interface

uses
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes;

type
  JNetworkInterface = interface; // merged
  JInetAddress = interface;

  JInetAddressClass = interface(JObjectClass)
    ['{63EBE905-95B3-473B-B954-A4CFCD629429}']
    function equals(obj : JObject) : boolean; cdecl;                            // (Ljava/lang/Object;)Z A: $1
    function getAddress : TJavaArray<Byte>; cdecl;                              // ()[B A: $1
    function getAllByName(host : JString) : TJavaArray<JInetAddress>; cdecl;    // (Ljava/lang/String;)[Ljava/net/InetAddress; A: $9
    function getByAddress(hostName : JString; ipAddress : TJavaArray<Byte>) : JInetAddress; cdecl; overload;// (Ljava/lang/String;[B)Ljava/net/InetAddress; A: $9
    function getByAddress(ipAddress : TJavaArray<Byte>) : JInetAddress; cdecl; overload;// ([B)Ljava/net/InetAddress; A: $9
    function getByName(host : JString) : JInetAddress; cdecl;                   // (Ljava/lang/String;)Ljava/net/InetAddress; A: $9
    function getCanonicalHostName : JString; cdecl;                             // ()Ljava/lang/String; A: $1
    function getHostAddress : JString; cdecl;                                   // ()Ljava/lang/String; A: $1
    function getHostName : JString; cdecl;                                      // ()Ljava/lang/String; A: $1
    function getLocalHost : JInetAddress; cdecl;                                // ()Ljava/net/InetAddress; A: $9
    function getLoopbackAddress : JInetAddress; cdecl;                          // ()Ljava/net/InetAddress; A: $9
    function hashCode : Integer; cdecl;                                         // ()I A: $1
    function isAnyLocalAddress : boolean; cdecl;                                // ()Z A: $1
    function isLinkLocalAddress : boolean; cdecl;                               // ()Z A: $1
    function isLoopbackAddress : boolean; cdecl;                                // ()Z A: $1
    function isMCGlobal : boolean; cdecl;                                       // ()Z A: $1
    function isMCLinkLocal : boolean; cdecl;                                    // ()Z A: $1
    function isMCNodeLocal : boolean; cdecl;                                    // ()Z A: $1
    function isMCOrgLocal : boolean; cdecl;                                     // ()Z A: $1
    function isMCSiteLocal : boolean; cdecl;                                    // ()Z A: $1
    function isMulticastAddress : boolean; cdecl;                               // ()Z A: $1
    function isReachable(networkInterface : JNetworkInterface; ttl : Integer; timeout : Integer) : boolean; cdecl; overload;// (Ljava/net/NetworkInterface;II)Z A: $1
    function isReachable(timeout : Integer) : boolean; cdecl; overload;         // (I)Z A: $1
    function isSiteLocalAddress : boolean; cdecl;                               // ()Z A: $1
    function toString : JString; cdecl;                                         // ()Ljava/lang/String; A: $1
  end;

  [JavaSignature('java/net/InetAddress')]
  JInetAddress = interface(JObject)
    ['{5FDBA4DB-1F52-46F5-BED6-C3B942B8574F}']
    function equals(obj : JObject) : boolean; cdecl;                            // (Ljava/lang/Object;)Z A: $1
    function getAddress : TJavaArray<Byte>; cdecl;                              // ()[B A: $1
    function getCanonicalHostName : JString; cdecl;                             // ()Ljava/lang/String; A: $1
    function getHostAddress : JString; cdecl;                                   // ()Ljava/lang/String; A: $1
    function getHostName : JString; cdecl;                                      // ()Ljava/lang/String; A: $1
    function hashCode : Integer; cdecl;                                         // ()I A: $1
    function isAnyLocalAddress : boolean; cdecl;                                // ()Z A: $1
    function isLinkLocalAddress : boolean; cdecl;                               // ()Z A: $1
    function isLoopbackAddress : boolean; cdecl;                                // ()Z A: $1
    function isMCGlobal : boolean; cdecl;                                       // ()Z A: $1
    function isMCLinkLocal : boolean; cdecl;                                    // ()Z A: $1
    function isMCNodeLocal : boolean; cdecl;                                    // ()Z A: $1
    function isMCOrgLocal : boolean; cdecl;                                     // ()Z A: $1
    function isMCSiteLocal : boolean; cdecl;                                    // ()Z A: $1
    function isMulticastAddress : boolean; cdecl;                               // ()Z A: $1
    function isReachable(networkInterface : JNetworkInterface; ttl : Integer; timeout : Integer) : boolean; cdecl; overload;// (Ljava/net/NetworkInterface;II)Z A: $1
    function isReachable(timeout : Integer) : boolean; cdecl; overload;         // (I)Z A: $1
    function isSiteLocalAddress : boolean; cdecl;                               // ()Z A: $1
    function toString : JString; cdecl;                                         // ()Ljava/lang/String; A: $1
  end;

  TJInetAddress = class(TJavaGenericImport<JInetAddressClass, JInetAddress>)
  end;

  // Merged from: .\android-19\java.net.NetworkInterface.pas
  JNetworkInterfaceClass = interface(JObjectClass)
    ['{15EAFD0E-8F54-4C0C-AFD0-B45F1D11F2DE}']
    function equals(obj : JObject) : boolean; cdecl;                            // (Ljava/lang/Object;)Z A: $1
    function getByIndex(&index : Integer) : JNetworkInterface; cdecl;           // (I)Ljava/net/NetworkInterface; A: $9
    function getByInetAddress(address : JInetAddress) : JNetworkInterface; cdecl;// (Ljava/net/InetAddress;)Ljava/net/NetworkInterface; A: $9
    function getByName(interfaceName : JString) : JNetworkInterface; cdecl;     // (Ljava/lang/String;)Ljava/net/NetworkInterface; A: $9
    function getDisplayName : JString; cdecl;                                   // ()Ljava/lang/String; A: $1
    function getHardwareAddress : TJavaArray<Byte>; cdecl;                      // ()[B A: $1
    function getIndex : Integer; cdecl;                                         // ()I A: $1
    function getInetAddresses : JEnumeration; cdecl;                            // ()Ljava/util/Enumeration; A: $1
    function getInterfaceAddresses : JList; cdecl;                              // ()Ljava/util/List; A: $1
    function getMTU : Integer; cdecl;                                           // ()I A: $1
    function getName : JString; cdecl;                                          // ()Ljava/lang/String; A: $1
    function getNetworkInterfaces : JEnumeration; cdecl;                        // ()Ljava/util/Enumeration; A: $9
    function getParent : JNetworkInterface; cdecl;                              // ()Ljava/net/NetworkInterface; A: $1
    function getSubInterfaces : JEnumeration; cdecl;                            // ()Ljava/util/Enumeration; A: $1
    function hashCode : Integer; cdecl;                                         // ()I A: $1
    function isLoopback : boolean; cdecl;                                       // ()Z A: $1
    function isPointToPoint : boolean; cdecl;                                   // ()Z A: $1
    function isUp : boolean; cdecl;                                             // ()Z A: $1
    function isVirtual : boolean; cdecl;                                        // ()Z A: $1
    function supportsMulticast : boolean; cdecl;                                // ()Z A: $1
    function toString : JString; cdecl;                                         // ()Ljava/lang/String; A: $1
  end;

  [JavaSignature('java/net/NetworkInterface')]
  JNetworkInterface = interface(JObject)
    ['{F14718D3-C157-4358-B932-71E3E5F0938A}']
    function equals(obj : JObject) : boolean; cdecl;                            // (Ljava/lang/Object;)Z A: $1
    function getDisplayName : JString; cdecl;                                   // ()Ljava/lang/String; A: $1
    function getHardwareAddress : TJavaArray<Byte>; cdecl;                      // ()[B A: $1
    function getIndex : Integer; cdecl;                                         // ()I A: $1
    function getInetAddresses : JEnumeration; cdecl;                            // ()Ljava/util/Enumeration; A: $1
    function getInterfaceAddresses : JList; cdecl;                              // ()Ljava/util/List; A: $1
    function getMTU : Integer; cdecl;                                           // ()I A: $1
    function getName : JString; cdecl;                                          // ()Ljava/lang/String; A: $1
    function getParent : JNetworkInterface; cdecl;                              // ()Ljava/net/NetworkInterface; A: $1
    function getSubInterfaces : JEnumeration; cdecl;                            // ()Ljava/util/Enumeration; A: $1
    function hashCode : Integer; cdecl;                                         // ()I A: $1
    function isLoopback : boolean; cdecl;                                       // ()Z A: $1
    function isPointToPoint : boolean; cdecl;                                   // ()Z A: $1
    function isUp : boolean; cdecl;                                             // ()Z A: $1
    function isVirtual : boolean; cdecl;                                        // ()Z A: $1
    function supportsMulticast : boolean; cdecl;                                // ()Z A: $1
    function toString : JString; cdecl;                                         // ()Ljava/lang/String; A: $1
  end;

  TJNetworkInterface = class(TJavaGenericImport<JNetworkInterfaceClass, JNetworkInterface>)
  end;


implementation

end.