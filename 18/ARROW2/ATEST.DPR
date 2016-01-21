program Atest;

uses
  Forms,
  ATestF in 'ATestF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
