program XChart;

uses
  Forms,
  XChartF in 'XChartF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
