program Loops;

uses
  Forms,
  LoopsF in 'LoopsF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
