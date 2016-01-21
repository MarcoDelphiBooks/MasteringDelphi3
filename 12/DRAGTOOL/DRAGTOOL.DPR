program Dragtool;

uses
  Forms,
  ToolForm in 'ToolForm.pas' {ToolbarForm},
  TBoxForm in 'TBoxForm.pas' {ToolBox};

{$R *.RES}

begin
  Application.CreateForm(TToolbarForm, ToolbarForm);
  Application.CreateForm(TToolBox, ToolBox);
  Application.Run;
end.

