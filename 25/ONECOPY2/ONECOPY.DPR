program Onecopy;

uses
  Forms,
  Windows,
  Messages,
  OneF in 'OneF.pas' {Form1};

{$R *.RES}

var
  Hwnd: THandle;

begin
  Hwnd := FindWindow ('TForm1', 'One Copy');
  if Hwnd = 0 then
  begin
    Application.CreateForm(TForm1, Form1);
  Application.Run;
  end
  else
  begin
    if not IsWindowVisible (Hwnd) then
      PostMessage (Hwnd, wm_User, 0, 0);
    SetForegroundWindow (Hwnd);
  end
end.

