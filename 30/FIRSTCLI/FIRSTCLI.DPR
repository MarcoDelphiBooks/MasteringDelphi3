program Firstcli;

uses
  Forms,
  ClientF in 'ClientF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
