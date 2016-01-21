program IfTest;

uses
  Forms,
  IfForm in 'IfForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
