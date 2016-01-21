library PasCHook;

uses
  ComObj,
  ComServ,
  PasCH in 'PasCH.pas';

exports
  DllGetClassObject resident,
  DllCanUnloadNow resident,
  DllRegisterServer resident,
  DllUnregisterServer resident;

end.
