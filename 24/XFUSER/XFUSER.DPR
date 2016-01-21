library XFUser;

uses
  ComServ,
  XUserI in 'XUserI.pas' {XUser: TActiveForm} {XUser: CoClass};

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
