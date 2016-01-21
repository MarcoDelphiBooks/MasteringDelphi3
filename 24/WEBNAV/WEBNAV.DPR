program WebNav;

uses
  Forms,
  WebNavF in 'WebNavF.pas' {FormWebNav};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormWebNav, FormWebNav);
  Application.Run;
end.
