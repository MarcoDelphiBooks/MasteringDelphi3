program ColGrid;

uses
  Forms,
  GridForm in 'GridForm.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
