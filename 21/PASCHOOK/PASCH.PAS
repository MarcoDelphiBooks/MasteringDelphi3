unit PasCH;

interface

uses
  Windows, ComObj, ComServ, ShlObj, ShellAPI,
  SysUtils;

const
  CLSID_PascalCopyHook: TGUID =
    '{80A06FA0-7DF2-11D0-98D0-444553540000}';

type
  TPasCopyHook = class(TComObject, ICopyHook)
  public
    function CopyCallback (Hwnd: THandle;
      wFunc, wFlags: UINT; pszSrcFile: PAnsiChar;
      dwSrcAttribs: DWORD; pszDestFile: PAnsiChar;
      dwDestAttribs: DWORD): UINT; stdcall;
  end;

implementation

function TPasCopyHook.CopyCallback (Hwnd: THandle;
  wFunc, wFlags: UINT; pszSrcFile: PAnsiChar;
  dwSrcAttribs: DWORD; pszDestFile: PAnsiChar;
  dwDestAttribs: DWORD): UINT; stdcall;
var
  Msg: string;
begin
//  Application.Handle := Hwnd;
//  MessType := mtConfirmation;
  case wFunc of
   FO_COPY: Msg := Format (
     'Are you sure you want to copy the %s folder to the %s destination',
     [pszSrcFile, pszDestFile]);
   FO_DELETE:
   begin
     Msg := Format ('Caution... the folder %s is about to be deleted, unless you say no',
       [pszSrcFile]);
//     MessType := mtWarning;
   end;
   FO_MOVE: Msg := Format (
     'Are you sure you want to move the %s folder to the %s destination',
     [pszSrcFile, pszDestFile]);
   FO_RENAME: Msg := Format (
     'Are you sure you want to rename the %s folder as %s',
     [pszSrcFile, pszDestFile]);
   else
     Msg := '';
  end;
  if Msg <> '' then // ask for confirmation
    Result := MessageBox (Hwnd, PChar(Msg),
      'PasCHook Demo', mb_YesNoCancel)
  else
    Result := idYes;
end;

initialization
  TComObjectFactory.Create(ComServer, TPasCopyHook,
    CLSID_PascalCopyHook, '',
    'CopyHook Demo from Mastering Delphi 3',
    ciMultiInstance);
end.
