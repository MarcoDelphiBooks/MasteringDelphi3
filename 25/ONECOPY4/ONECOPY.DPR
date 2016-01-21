program OneCopy;

uses
  Forms, Windows,
  OneF in 'OneF.pas' {Form1};

{$R *.RES}

var
  hMutex: THandle;

begin
  HMutex := CreateMutex (nil, False, 'OneCopyMutex');
  if WaitForSingleObject (hMutex, 0) <> wait_TimeOut then
  begin
    Application.Initialize;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end;
end.
