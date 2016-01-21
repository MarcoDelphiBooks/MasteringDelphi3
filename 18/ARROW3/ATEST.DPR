program Atest;

uses
  Forms,
  ATestF in 'ATestF.pas' {Form1},
  Arrow3 in 'ARROW3.PAS';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
