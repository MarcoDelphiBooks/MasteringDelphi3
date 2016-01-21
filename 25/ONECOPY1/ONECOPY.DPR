program Onecopy;

uses
  Forms,
  Dialogs,
  Windows,
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
    MessageDlg (
      'You cannot run a second copy of the application!' +
      #13'The form of the older copy will be displayed',
      mtInformation, [mbOk], 0);
    SetForegroundWindow (Hwnd);
  end
end.

