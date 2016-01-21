program CheckId;

uses
  Forms,
  CheckIdf in 'CheckIdf.pas' {FormCheckId};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormCheckId, FormCheckId);
  Application.Run;
end.
