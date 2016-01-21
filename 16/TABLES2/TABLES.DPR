program Tables;

uses
  Forms,
  TablesF in 'TablesF.pas' {MainForm},
  FieldsF in 'FieldsF.pas' {FieldsForm};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFieldsForm, FieldsForm);
  Application.Run;
end.
