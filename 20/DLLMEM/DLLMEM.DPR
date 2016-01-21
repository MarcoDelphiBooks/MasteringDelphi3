library dllmem;

uses
  SysUtils;

// global DLL data
var
  Data: Integer;

procedure SetData (I: Integer); stdcall;
begin
  if I <> Data then
    Data := I
  else
    Beep;
end;

function GetData: Integer; stdcall;
begin
  Result := Data;
end;

exports
  SetData, GetData;

begin
  // initialization
  Data := 1;
end.
