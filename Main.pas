unit Main;

{
 Original author: Alfred.

 Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted.

 THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT,
 OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
 ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Threading,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.StdCtrls, FMX.ListView, FMX.Layouts, FMX.Memo,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit,
  AndroidAPI.JNIBridge,
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  jcifs.smb.SmbFile,
  jcifs.smb.NtlmPasswordAuthentication,
  jcifs.smb.SmbFileInputStream,
  jcifs.smb.SmbFileOutputStream,
  jcifs.Config,
  java.io.FileOutputStream
  ;

type
  TToastLength = (LongToast, ShortToast);

  TForm1 = class(TForm)
    Layout2: TLayout;
    Layout1: TLayout;
    UserEdit: TEdit;
    PassLabel: TLabel;
    btnApply: TButton;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Memo1: TMemo;
    Label2: TLabel;
    FileServerEdit: TEdit;
    ListView1: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ImageFolder: TImageControl;
    ImageFile: TImageControl;
    ImageUp: TImageControl;
    UserLabel: TLabel;
    PassEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ListView1PullRefresh(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FileServerEditChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    auth             : JNtlmPasswordAuthentication;
    networkworkgroup : JSmbFile;
    networkshare     : JSmbFile;
    networkfile      : JSmbFile;
    JC               : TJConfig;
    procedure GetFileList;
    procedure CreateFile(localfile : JSmbFile);
    procedure CopyFile(source : JSmbFile; dest:String);
  public
    { Public declarations }
  end;

  procedure Toast(const Msg: string; Duration: TToastLength = ShortToast);

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  FMX.Helpers.Android,
  android.widget.Toast,
  System.IOUtils,
  System.IniFiles,
  Generics.Defaults,
  System.Generics.Collections,
  EditSettingsFile,
  Androidapi.JNI;

const
  UpText      = '../ (up)';
  RootText    = 'smb://';
  INIFILENAME = 'settings.ini';

function CompareLowerStr(const Left, Right: string): Integer;
begin
  Result := CompareStr(AnsiLowerCase(Left), AnsiLowerCase(Right));
end;

{ TForm1 }

procedure TForm1.FileServerEditChange(Sender: TObject);
begin
  networkshare := TJSmbFile.JavaClass.init(StringToJString(RootText+Uppercase(TEdit(Sender).Text)+'/'),auth);
  GetFileList;
  //ListView1.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 ini : TIniFile;
begin

  Ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.tpath.GetHomePath,INIFILENAME));
  try
    UserEdit.Text:=Ini.ReadString( 'Security', 'Username', 'enterusername' );
    PassEdit.Text:=Ini.ReadString( 'Security', 'Password', 'enterpassword' );
  finally
    Ini.Free;
  end;

  try
    JC.JavaClass.registerSmbURLHandler;
    JC.JavaClass.setProperty(StringToJString('resolveOrder'),StringToJString('DNS'));
    networkworkgroup := nil;
    networkfile      := nil;
    //auth:=TJNtlmPasswordAuthentication.JavaClass.init(StringToJString(TJNtlmPasswordAuthenticationBLANK));
    //auth:=TJNtlmPasswordAuthentication.JavaClass.init(StringToJString(''),StringToJString(''),StringToJString(''));
    auth:=TJNtlmPasswordAuthentication.JavaClass.init(StringToJString(''),StringToJString(UserEdit.Text),StringToJString(PassEdit.Text));
    networkshare := TJSmbFile.JavaClass.init(StringToJString(RootText),auth);
    GetFileList;
  except
    on E: Exception do
       Memo1.Lines.Append('Create: '+E.ClassName + ': ' + E.Message);
  end;
end;


procedure TForm1.FormDestroy(Sender: TObject);
begin
  System.IOUtils.TDirectory.Delete(System.IOUtils.TPath.GetTempPath,True);
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  localsharefile : JSmbFile;
  //localtempfile  : JSmbFile;
begin
  if NOT networkshare.exists then exit;

  if Assigned(AItem) then
  begin

    //if AItem.Index=0 then // go up !!
    if AItem.Text=UpText then // go up !!
    begin
      if ( (networkshare.getType=TJSmbFile.JavaClass.TYPE_SERVER) AND (Assigned(networkworkgroup)) )
         then localsharefile := networkworkgroup
         else localsharefile := TJSmbFile.JavaClass.init(networkshare.getParent,auth);
    end
    // remember : workgroup NOT replaced by host with method : ERRORS !!!!
    //else localsharefile := TJSmbFile.JavaClass.init(networkshare.toString,StringToJString(AItem.Text),auth);
    // remember : workgroup replaced by host with method : OK !!
    else localsharefile := TJSmbFile.JavaClass.init(networkshare,StringToJString(AItem.Text));

    if localsharefile.getType=TJSmbFile.JavaClass.TYPE_WORKGROUP then
       networkworkgroup:=localsharefile;

    if localsharefile.isFile then
    begin
      Toast('Downloading file !! Please wait ');

      networkfile:=localsharefile;
      // opening remote file does not work ... and will never work !!
      // OpenURLorFile(JStringToString(localsharefile.toString));

      // second method ... download a (local) copy and open this local file !
      // System.IOUtils.TPath.GetDownloadsPath
      // System.IOUtils.TPath.GetCachePath
      // System.IOUtils.TPath.GetTempPath
      CopyFile(networkfile,System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetTempPath,JStringToString(networkfile.getName)));
      OpenURLorFile(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetTempPath,JStringToString(networkfile.getName)));

      // third method ... also not working yet ... and will never work !!
      // localtempfile := TJSmbFile.JavaClass.init(StringToJString(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDownloadsPath,JStringToString(networkfile.getName))));
      // localtempfile.createNewFile;
      // networkfile.copyTo(localtempfile);
      // OpenURLorFile(JStringToString(networkfile.toString));
    end
    else
    begin
      networkfile:=nil;
      networkshare := localsharefile;
      TThread.CreateAnonymousThread(
      procedure
      begin
        TThread.Synchronize(
          TThread.CurrentThread,
          procedure
          begin
            sleep(25);
            GetFileList;
          end
        );
      end
      ).Start;

    end;

  end;
end;

procedure TForm1.ListView1PullRefresh(Sender: TObject);
begin
  GetFileList;
end;

procedure TForm1.GetFileList;
var
  I             : Integer;
  Item:           TListViewItem;
  testfiles:      TJavaObjectArray<JSmbFile>;
  localtestfile:  JSmbFile;
  folders, files: TStringDynArray;
begin
  if NOT Assigned(networkshare) then exit;

  if NOT networkshare.exists then exit;

  Toast('Receiving file list !');

  ListView1.Items.BeginUpdate;

  try
    ListView1.ClearItems;

    if JStringToString(networkshare.toString)<>(RootText+'//') then
    begin
      Item := ListView1.Items.Add;
      Item.Text := UpText;
      Item.BitmapRef := ImageUp.Bitmap;
      Item.Height := 56;
    end;

    try
      testfiles:=networkshare.listFiles;
      if testfiles <>  nil then
      begin
        for i := 0 to Pred(testfiles.Length) do
        begin
          // This (localtestfile := testfiles.Items[I]) does not work as expected !!
          // Change TJavaArray --> TJavaObjectArray : And wrap up the raw object ID manually
          localtestfile := TJSmbFile.Wrap(testfiles.GetRawItem(i));
          if Assigned(localtestfile) then
          begin
            if localtestfile.isFile then
            begin
              SetLength(files, Length(files) + 1);
              files[Length(files) - 1] := JStringToString(localtestfile.getName);
            end
            else
            begin
              SetLength(folders, Length(folders) + 1);
              folders[Length(folders) - 1] := JStringToString(localtestfile.getName);
            end;
          end;
        end;

        if Length(folders)>0 then
        begin
          TArray.Sort<String>(folders, TComparer<String>.Construct(CompareLowerStr));
          for I := Low(folders) to High(folders) do
          begin
            Item := ListView1.Items.Add;
            Item.Text := folders[i];
            Item.BitmapRef := ImageFolder.Bitmap;
            Item.Height := 56;
          end;
          Finalize(folders);
        end;

        if Length(files)>0 then
        begin
          TArray.Sort<String>(files, TComparer<String>.Construct(CompareLowerStr));
          for i := Low(files) to High(files) do
          begin
            Item := ListView1.Items.Add;
            Item.Text := files[i];
            Item.BitmapRef := ImageFile.Bitmap;
            Item.Height := 56;
          end;
          Finalize(files);
        end;

      end;
    except
      on E: Exception do
         Memo1.Lines.Append('List: '+E.ClassName + ': ' + E.Message);
    end;
  finally
    ListView1.Items.EndUpdate;
  end;
end;

procedure TForm1.CreateFile(localfile : JSmbFile);
var
  outfile : JSmbFileOutputStream;
begin
  // Ceate a file on the share the Android way
  try
    outfile := TJSmbFileOutputStream.JavaClass.init(localfile);
    outfile.write(65);
    outfile.write(66);
    outfile.write(67);
    outfile.write(StringToJString('Testing....and writing to a file').getBytes());
    outfile.close;
  except
    on E: Exception do
       Memo1.Lines.Append('Create file: '+E.ClassName + ': ' + E.Message);
  end;
end;


procedure TForm1.btnApplyClick(Sender: TObject);
var
 ini : TIniFile;
begin

  Ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.tpath.GetHomePath,INIFILENAME));
  try
    Ini.WriteString( 'Security', 'Username', UserEdit.Text );
    Ini.WriteString( 'Security', 'Password', PassEdit.Text );
  finally
    Ini.Free;
  end;

  try
    auth:=TJNtlmPasswordAuthentication.JavaClass.init(StringToJString(''),StringToJString(UserEdit.Text),StringToJString(PassEdit.Text));
    networkshare := TJSmbFile.JavaClass.init(networkshare.toString,auth);
    GetFileList;
  except
    on E: Exception do
       Memo1.Lines.Append('Auth: '+E.ClassName + ': ' + E.Message);
  end;
end;

procedure TForm1.CopyFile(source : JSmbFile; dest : String);
const
  bufferSize = 4096*2;
var
  noOfBytes          : Integer;
  b                  : TJavaArray<Byte>;
  localinfile        : JInputStream;
  localfileoutstream : JFileOutputStream;
begin
  // Copy a file from share to local the Android way
  try
    localinfile := source.getInputStream;
    localfileoutstream := TJFileOutputStream.JavaClass.init(StringToJString(dest));
    b := TJavaArray<Byte>.Create(bufferSize);
    noOfBytes := localinfile.read(b);
    while (noOfBytes > 0) do
    begin
      localfileoutstream.write(b, 0, noOfBytes);
      noOfBytes := localinfile.read(b);
    end;
    localfileoutstream.close;
    localinfile.close;
  except
    on E: Exception do
       Memo1.Lines.Append('Copy file: '+E.ClassName + ': ' + E.Message);
  end;
end;

procedure Toast(const Msg: string; Duration: TToastLength);
var
   ToastLength: Integer;
begin
   if Duration = ShortToast then
     ToastLength := TJToast.JavaClass.LENGTH_SHORT
   else
     ToastLength := TJToast.JavaClass.LENGTH_LONG;
   CallInUiThread(procedure
   begin
     TJToast.JavaClass.makeText(SharedActivityContext, StrToJCharSequence(msg),
       ToastLength).show;
   end);
end;

end.
