program Notes;

uses
  Forms,
  NotesF in 'NotesF.pas' {NotesForm};

{$R *.RES}

begin
  Application.CreateForm(TNotesForm, NotesForm);
  Application.Run;
end.

