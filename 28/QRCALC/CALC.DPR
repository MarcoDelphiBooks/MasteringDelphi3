program Calc;

uses
  Forms,
  CalcF in 'CalcF.pas' {CalcForm},
  ReportF in 'ReportF.pas' {QForm1};

{$R *.RES}

begin
  Application.CreateForm(TCalcForm, CalcForm);
  Application.CreateForm(TQForm1, QForm1);
  Application.Run;
end.
