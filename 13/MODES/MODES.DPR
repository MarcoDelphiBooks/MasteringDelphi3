program Modes;

uses
  Forms,
  Mainform in 'MAINFORM.PAS' {MainAppForm},
  Modal in 'MODAL.PAS' {ModalForm},
  Modeless in 'MODELESS.PAS' {ModelessForm};

{$R *.RES}

begin
  Application.CreateForm(TMainAppForm, MainAppForm);
  Application.Run;
end.

