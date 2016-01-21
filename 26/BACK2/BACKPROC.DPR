program Backproc;

uses
  Forms,
  BackPF in 'BackPF.pas' {Form1},
  DebugF in 'DebugF.pas' {DebugForm};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDebugForm, DebugForm);
  Application.Run;
end.
