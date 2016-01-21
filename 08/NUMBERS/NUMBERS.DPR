program Numbers;

uses
  Forms,
  NumberF in 'NumberF.pas' {NumbersForm};

{$R *.RES}

begin
  Application.CreateForm(TNumbersForm, NumbersForm);
  Application.Run;
end.

