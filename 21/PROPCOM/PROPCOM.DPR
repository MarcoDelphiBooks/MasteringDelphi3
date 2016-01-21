library PropCom;

uses
  ComServ,
  DllClass in 'DllClass.pas';

exports
  DllGetClassObject resident,
  DllCanUnloadNow resident,
  DllRegisterServer resident,
  DllUnregisterServer resident;

{$R *.RES}
  
end.
