program Createg;

uses
  Forms,
  GraphF in 'GraphF.pas' {GraphForm},
  TablesF in 'TablesF.pas' {TablesForm};

{$R *.RES}

begin
  Application.CreateForm(TGraphForm, GraphForm);
  Application.Run;
end.
