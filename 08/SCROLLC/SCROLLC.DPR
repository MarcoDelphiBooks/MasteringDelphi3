program Scrollc;

uses
  Forms,
  ScrollF in 'ScrollF.pas' {FormScroll};

{$R *.RES}

begin
  Application.CreateForm(TFormScroll, FormScroll);
  Application.Run;
end.
