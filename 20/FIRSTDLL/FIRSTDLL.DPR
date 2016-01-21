library Firstdll;

{changing the uses statement, as suggested in
the comments, the size of the DLL changes}

uses
  Dialogs; // larger code
{uses
  Windows; // minimal}

function Triple (N: Integer): Integer; stdcall;
begin
  ShowMessage ('Triple function called');
{  MessageBox (0, 'Triple function called',
    'First DLL', mb_OK);}
  Result := N * 3;
end;

function Double (N: Integer): Integer; stdcall;
begin
  ShowMessage ('Double function called');
{  MessageBox (0, 'Double function called',
    'First DLL', mb_OK);}
  Result := N * 2;
end;

exports
  Triple, Double;

begin
end.
