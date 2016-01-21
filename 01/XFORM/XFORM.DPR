library XForm;

uses
  ComServ,
  XFormF in 'XFormF.pas' {XForm1: TActiveForm} {XForm: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

{$E ocx}

begin
end.
