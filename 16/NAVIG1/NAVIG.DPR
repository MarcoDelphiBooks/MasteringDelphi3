program Navig;

uses
  Forms,
  navform in 'navform.pas' {NavigForm};

{$R *.RES}

begin
  Application.CreateForm(TNavigForm, NavigForm);
  Application.Run;
end.
