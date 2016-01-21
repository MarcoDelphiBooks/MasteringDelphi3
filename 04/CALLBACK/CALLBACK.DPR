program Callback;

uses
  Forms,
  CbackF in 'CbackF.pas' {FormCallback};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormCallback, FormCallback);
  Application.Run;
end.
