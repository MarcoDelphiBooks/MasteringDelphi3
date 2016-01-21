library XArrow;

uses
  ComServ,
  XArImpl in 'XArImpl.pas' {Md3WArrowX: CoClass},
  XArAbout in 'XArAbout.pas' {Md3WArrowXAbout},
  XAPPage in 'XAPPage.pas' {PropertyPage1: TPropertyPage};

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
