program Digtest;

uses
  Forms,
  DigTestF in 'DigTestF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
