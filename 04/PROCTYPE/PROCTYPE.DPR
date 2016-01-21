program Proctype;

uses
  Forms,
  ProcForm in 'ProcForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
