program Strparam;

uses
  Dialogs, SysUtils;

{var
  Params: PChar;}

begin
  // version 1: show the full string
  // ShowMessage (cmdLine);

  // version 2: remove the application name
  {Params := StrScan (CmdLine, '"') + 1;
  Params := StrScan (Params, '"') + 2;
  if StrLen (Params) > 0 then
    ShowMessage (Params)
  else
    ShowMessage ('No command line');}

  // version 3: use ParamStr
  if ParamCount > 0 then
    ShowMessage (ParamStr (1))
  else
    ShowMessage ('No command line');
end.
