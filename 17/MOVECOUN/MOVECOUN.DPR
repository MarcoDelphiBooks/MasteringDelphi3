program Movecoun;

uses
  Forms,
  Moveform in 'MOVEFORM.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
