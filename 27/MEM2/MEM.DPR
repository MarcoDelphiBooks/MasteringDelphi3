program Mem;

uses
  Forms,
  Resform in 'RESFORM.PAS' {MemForm};

{$R *.RES}

begin
  Application.CreateForm(TMemForm, MemForm);
  Application.Run;
end.

