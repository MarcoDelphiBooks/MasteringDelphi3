program MenuOne;

uses
  Forms,
  MenuOneF in 'MenuOneF.pas' {FormColorText}; {FormColorText}

{$R *.RES}

begin
  Application.CreateForm(TFormColorText, FormColorText);
  Application.Run;
end.

