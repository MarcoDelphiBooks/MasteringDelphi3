program Buttons;

uses
  Forms,
  ButtonF in 'ButtonF.pas' {ButtonsForm};

{$R *.RES}

begin
  Application.CreateForm(TButtonsForm, ButtonsForm);
  Application.Run;
end.

