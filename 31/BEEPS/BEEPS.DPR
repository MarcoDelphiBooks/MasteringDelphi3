program Beeps;

uses
  Forms,
  BeepsF in 'BeepsF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
