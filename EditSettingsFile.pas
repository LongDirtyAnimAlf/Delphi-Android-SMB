unit EditSettingsFile;

interface

uses
 System.SysUtils, System.Classes
 {$IFDEF MSWINDOWS }, WinAPI.ShellApi, WinAPI.Windows {$ENDIF}
 {$IFDEF ANDROID}
 ,FMX.Dialogs
 ,IdGlobalProtocols
 ,Androidapi.JNI.GraphicsContentViewText
 ,Androidapi.JNI.Net
 ,Androidapi.JNI.JavaTypes
 ,idUri
 ,Androidapi.IOUtils
 ,Androidapi.Helpers
 {$ENDIF ANDROID}
 {$IFDEF IOS}
  ,iOSapi.Foundation, FMX.Helpers.iOS
 {$ENDIF IOS};

function OpenURLorFile(URL: string; const DisplayError: Boolean = False): Boolean;

implementation

function OpenURLorFile(URL: string; const DisplayError: Boolean = False): Boolean;
{$IFDEF MSWINDOWS}
begin
 ShellExecute(0, 'OPEN', PChar(URL), '', '', SW_SHOWNORMAL);
end;
{$ELSE}
{$IFDEF ANDROID}
var
  Intent: JIntent;
  idMimeTable: TIdMimeTable;
begin
// There may be an issue with the geo: prefix and URLEncode.
// will need to research
  if URl.toLower.StartsWith('http://') then
    Begin
      Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
      TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(URL))));
    End
  Else
    Begin
     try
       idMimeTable := TidMimeTable.Create;
       Intent := TJIntent.Create;
       Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
       if not url.ToLower.StartsWith('file://') then
         url := 'file://' + url;
       Intent.setDataAndType(StrToJURI(Url),  StringToJString(idMimeTable.GetFileMIMEType(Url)));

     Finally
       try idMimeTable.Free; except end;
     End;

    End;
  try
    SharedActivity.startActivity(Intent);
    exit(true);
  except
    on e: Exception do
    begin
      if DisplayError then ShowMessage('Error: ' + e.Message);
      exit(false);
    end;
  end;
end;
{$ELSE}
{$IFDEF IOS}
var
  NSU: NSUrl;
begin
  // iOS doesn't like spaces, so URL encode is important.
  NSU := StrToNSUrl(TIdURI.URLEncode(URL));
  if SharedApplication.canOpenURL(NSU) then
    exit(SharedApplication.openUrl(NSU))
  else
  begin
    if DisplayError then
      ShowMessage('Error: Opening "' + URL + '" not supported.');
    exit(false);
  end;
end;
{$ELSE}
begin
  raise Exception.Create('Not supported!');
end;
{$ENDIF IOS}
{$ENDIF ANDROID}
{$ENDIF WINDOWS}
end.
