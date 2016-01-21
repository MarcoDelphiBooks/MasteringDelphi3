program Statusb;

uses
  Forms,
  StatusF in 'StatusF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
