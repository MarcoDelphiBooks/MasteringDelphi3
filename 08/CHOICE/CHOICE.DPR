program Choice;

uses
  Forms,
  ChoiceF in 'ChoiceF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

