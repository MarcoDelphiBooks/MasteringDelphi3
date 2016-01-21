program Objuse;

uses
  Forms,
  Objuse_f in 'OBJUSE_F.PAS' {Form1},
  Dates in 'DATES.PAS';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
