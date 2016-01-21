program RichNote;

uses
  Forms,
  RichForm in 'RichForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
