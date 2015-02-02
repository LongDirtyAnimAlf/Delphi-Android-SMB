program SMBFileBrowser;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  jcifs.Config in 'jcifs-1.3.18-headers\jcifs.Config.pas',
  jcifs.dcerpc.ndr.NdrBuffer in 'jcifs-1.3.18-headers\jcifs.dcerpc.ndr.NdrBuffer.pas',
  jcifs.dcerpc.rpc_sid_t in 'jcifs-1.3.18-headers\jcifs.dcerpc.rpc_sid_t.pas',
  jcifs.smb.ACE in 'jcifs-1.3.18-headers\jcifs.smb.ACE.pas',
  jcifs.smb.NtlmPasswordAuthentication in 'jcifs-1.3.18-headers\jcifs.smb.NtlmPasswordAuthentication.pas',
  jcifs.smb.SID in 'jcifs-1.3.18-headers\jcifs.smb.SID.pas',
  jcifs.smb.SmbFile in 'jcifs-1.3.18-headers\jcifs.smb.SmbFile.pas',
  jcifs.smb.SmbFileInputStream in 'jcifs-1.3.18-headers\jcifs.smb.SmbFileInputStream.pas',
  jcifs.smb.SmbFileOutputStream in 'jcifs-1.3.18-headers\jcifs.smb.SmbFileOutputStream.pas',
  android.net.Proxy in 'android-19-headers\android.net.Proxy.pas',
  android.widget.Toast in 'android-19-headers\android.widget.Toast.pas',
  java.io.FileOutputStream in 'android-19-headers\java.io.FileOutputStream.pas',
  java.io.FilterInputStream in 'android-19-headers\java.io.FilterInputStream.pas',
  java.io.FilterOutputStream in 'android-19-headers\java.io.FilterOutputStream.pas',
  java.lang.JClass in 'android-19-headers\java.lang.JClass.pas',
  java.lang.reflect.GenericDeclaration in 'android-19-headers\java.lang.reflect.GenericDeclaration.pas',
  java.lang.reflect.JType in 'android-19-headers\java.lang.reflect.JType.pas',
  java.net.FileNameMap in 'android-19-headers\java.net.FileNameMap.pas',
  java.net.InetAddress in 'android-19-headers\java.net.InetAddress.pas',
  java.nio.ByteBuffer in 'android-19-headers\java.nio.ByteBuffer.pas',
  java.nio.ByteOrder in 'android-19-headers\java.nio.ByteOrder.pas',
  java.nio.channels.FileChannel in 'android-19-headers\java.nio.channels.FileChannel.pas',
  java.nio.channels.FileChannel_MapMode in 'android-19-headers\java.nio.channels.FileChannel_MapMode.pas',
  java.nio.channels.ReadableByteChannel in 'android-19-headers\java.nio.channels.ReadableByteChannel.pas',
  java.nio.channels.WritableByteChannel in 'android-19-headers\java.nio.channels.WritableByteChannel.pas',
  java.nio.CharBuffer in 'android-19-headers\java.nio.CharBuffer.pas',
  java.nio.DoubleBuffer in 'android-19-headers\java.nio.DoubleBuffer.pas',
  java.nio.FloatBuffer in 'android-19-headers\java.nio.FloatBuffer.pas',
  java.nio.IntBuffer in 'android-19-headers\java.nio.IntBuffer.pas',
  java.nio.LongBuffer in 'android-19-headers\java.nio.LongBuffer.pas',
  java.nio.MappedByteBuffer in 'android-19-headers\java.nio.MappedByteBuffer.pas',
  java.nio.ShortBuffer in 'android-19-headers\java.nio.ShortBuffer.pas',
  java.security.acl.Permission in 'android-19-headers\java.security.acl.Permission.pas',
  java.security.cert.Certificate in 'android-19-headers\java.security.cert.Certificate.pas',
  java.security.cert.CertPath in 'android-19-headers\java.security.cert.CertPath.pas',
  java.security.CodeSigner in 'android-19-headers\java.security.CodeSigner.pas',
  java.security.Permission in 'android-19-headers\java.security.Permission.pas',
  java.security.Principal in 'android-19-headers\java.security.Principal.pas',
  java.security.PublicKey in 'android-19-headers\java.security.PublicKey.pas',
  java.security.Timestamp in 'android-19-headers\java.security.Timestamp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
