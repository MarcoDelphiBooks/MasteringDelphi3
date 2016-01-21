program TestPrj;

uses
  Forms,
  TestForm in 'TestForm.pas' {Form1},
  Base in 'Base.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
