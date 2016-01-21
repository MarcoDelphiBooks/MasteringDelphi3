program StrRef;

uses
  Forms,
  StrRefF in 'StrRefF.pas' {FormStrRef};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormStrRef, FormStrRef);
  Application.Run;
end.
