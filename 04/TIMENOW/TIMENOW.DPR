program TimeNow;

uses
  Forms,
  TimeNowF in 'TimeNowF.pas' {FormTimeNow};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormTimeNow, FormTimeNow);
  Application.Run;
end.
