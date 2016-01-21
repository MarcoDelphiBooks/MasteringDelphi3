unit Wizard1;

interface

uses
  ExptIntf, Windows;

type
  TMd3Expert = class (TIExpert)
  public
    function GetStyle: TExpertStyle; override;
    function GetName: string; override;
    function GetAuthor: string; override;
    function GetComment: string; override;
    function GetPage: string; override;
    function GetGlyph: HICON; override;
    function GetState: TExpertState; override;
    function GetIDString: string; override;
    function GetMenuText: string; override;
    procedure Execute; override;
  end;

procedure Register;

implementation

uses
  Dialogs, ToolIntf, SysUtils;

function TMd3Expert.GetStyle: TExpertStyle;
begin
  // show up in the Help menu
  Result := esStandard;
end;

function TMd3Expert.GetName: String;
begin
  // official name
  Result := 'Md3 Wizard'
end;

function TMd3Expert.GetAuthor: string;
begin
  Result := 'Marco Cantù';
end;

function TMd3Expert.GetComment: String;
begin
  Result := 'Mastering Delphi 3 Wizard';
end;

function TMd3Expert.GetPage: string;
begin
  Result := '';
end;

function TMd3Expert.GetGlyph: HICON;
begin
  Result := 0;
end;

function TMd3Expert.GetState: TExpertState;
begin
  // always enabled, never checked
  Result := [esEnabled];
end;

function TMd3Expert.GetIDString: String;
begin
  // must be unique
  Result := 'MarcoCantu.Md3Wizard'
end;

function TMd3Expert.GetMenuText: String;
begin
  // the text of the menu item
  Result := '&Md3 Wizard...'
end;

procedure TMd3Expert.Execute;
begin
  // the actual code
  MessageDlg (
    'Mastering Delphi 3 Wizard'#13#13+
    'Project:'#13 +
    ToolServices.GetProjectName,
    mtInformation, [mbOK], 0);
end;

procedure Register;
begin
  RegisterLibraryExpert(TMd3Expert.Create);
end;

end.
