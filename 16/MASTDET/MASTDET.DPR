program Mastdet;

uses
  Forms,
  MastdetF in 'MastdetF.pas' {Form2};

{$R *.RES}

begin
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
