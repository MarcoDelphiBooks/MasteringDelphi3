library XFMulti;

uses
  ComServ,
  XItalyI in 'XItalyI.pas' {XItaly: TActiveForm} {XItaly: CoClass};

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
