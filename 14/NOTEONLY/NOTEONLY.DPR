program Noteonly;

uses
  Forms,
  Italy in 'ITALY.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

