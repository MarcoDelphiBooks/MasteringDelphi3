program Backbmp;

uses
  Forms,
  BackbF in 'BackbF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
