program RichNote;

uses
  Forms,
  RichForm in 'RichForm.pas' {FormRichNote};

{$R *.RES}

begin
  Application.CreateForm(TFormRichNote, FormRichNote);
  Application.Run;
end.
