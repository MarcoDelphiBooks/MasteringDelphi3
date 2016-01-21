program WHandle;

uses
  Forms,
  WHandleF in 'WHandleF.pas' {FormWHandle};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormWHandle, FormWHandle);
  Application.Run;
end.
