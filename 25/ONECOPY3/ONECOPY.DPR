program Onecopy;

uses
  Forms,
  Windows,
  Messages,
  SysUtils,
  OneF in 'OneF.pas' {Form1};

{$R *.RES}

type
  PHWND = ^HWND;

var
  OldHwnd: THandle;

function EnumWndProc (Hwnd: THandle;
  FoundWnd: PHWND): Bool; stdcall;
var
  ClassName, ModuleName, WinModuleName: string;
  WinInstance: THandle;
begin
  Result := True;
  SetLength (ClassName, 100);
  GetClassName (Hwnd, PChar (ClassName), Length (ClassName));
  ClassName := PChar (ClassName);
  if ClassName = 'TForm1' then
  begin
    SetLength (ModuleName, 200);
    SetLength (WinModuleName, 200);
    GetModuleFileName ( HInstance,
      PChar (ModuleName), Length (ModuleName));
    ModuleName := PChar (ModuleName); // adjust length
    WinInstance := GetWindowLong (Hwnd, GWL_HINSTANCE);
    GetModuleFileName ( WinInstance,
      PChar (WinModuleName), Length (WinModuleName));
    WinModuleName := PChar(WinModuleName); // adjust length
    if ModuleName = WinModuleName then
    begin
      FoundWnd^ := Hwnd;
      Result := False;
    end;
  end;
end;

begin
  OldHwnd := 0;
  EnumWindows (@EnumWndProc, Longint (@OldHwnd));
  if OldHwnd = 0 then
  begin
    Application.CreateForm(TForm1, Form1);
  Application.Run;
  end
  else
  begin
    if not IsWindowVisible (OldHwnd) then
      PostMessage (OldHwnd, wm_User, 0, 0);
    SetForegroundWindow (OldHwnd);
  end;
end.

