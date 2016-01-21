program RealTBar;

uses
  Forms,
  TBarForm in 'TBarForm.pas' {RealBarForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TRealBarForm, RealBarForm);
  Application.Run;
end.
