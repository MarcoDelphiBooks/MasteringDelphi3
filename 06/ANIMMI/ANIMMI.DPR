program AnimMI;

uses
  Forms,
  AnimForm in 'AnimForm.pas' {Form1},
  anim in 'Anim.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
