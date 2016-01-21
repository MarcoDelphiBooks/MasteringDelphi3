program Firstser;

uses
  Forms,
  ServerF in 'ServerF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
