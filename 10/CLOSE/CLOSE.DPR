program Close;

uses
  Forms,
  CloseF in 'CloseF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
