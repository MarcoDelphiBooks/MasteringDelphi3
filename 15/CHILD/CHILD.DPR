program Child;

uses
  Forms,
  MainF in 'MainF.pas' {MainForm},
  ChildF in 'ChildF.pas' {ChildForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
