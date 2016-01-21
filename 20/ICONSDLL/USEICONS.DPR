program Useicons;

uses
  Forms,
  UseIconF in 'UseIconF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
