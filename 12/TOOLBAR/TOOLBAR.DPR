program Toolbar;

uses
  Forms,
  ToolForm in 'ToolForm.pas' {ToolbarForm};

{$R *.RES}

begin
  Application.CreateForm(TToolbarForm, ToolbarForm);
  Application.Run;
end.

