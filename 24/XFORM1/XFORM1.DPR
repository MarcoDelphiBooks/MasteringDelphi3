library XForm1;

uses
  ComServ,
  AXF1Impl in 'AXF1Impl.pas' {AXForm1: TActiveForm} {AXForm1: CoClass};

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
