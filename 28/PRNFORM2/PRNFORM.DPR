program PrnForm;

uses
  Forms,
  PrintD in 'PrintD.pas' {PrintDlg},
  ToolForm in 'ToolForm.pas' {ToolbarForm};

{$R *.RES}

begin
  Application.CreateForm(TToolbarForm, ToolbarForm);
  Application.CreateForm(TPrintDlg, PrintDlg);
  Application.Run;
end.

