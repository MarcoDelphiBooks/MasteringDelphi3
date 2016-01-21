program RsPrint;

uses
  Forms,
  ReportF in 'ReportF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
