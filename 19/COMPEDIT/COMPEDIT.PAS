unit CompEdit;

interface

uses
  DsgnIntf;

type
  TMd3TabListEditor = class (TComponentEditor)
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  SysUtils, Dialogs, TabList2, StdCtrls;

function TMd3TabListEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

function TMd3TabListEditor.GetVerb (Index: Integer): string;
begin
  case Index of
    0: Result := 'Md3TabbedList (©Cantù)';
    1: Result := '&About this component...';
    2: Result := '&Reset Tabs';
  end;
end;

procedure TMd3TabListEditor.ExecuteVerb (Index: Integer);
var
  I: Integer;
begin
  case Index of
    0..1: MessageDlg (
      'This is a simple component editor'#13 +
      'built by Marco Cantù'#13 +
      'for the book "Mastering Delphi 3"',
      mtInformation, [mbOK], 0);
    2: begin
      with Component as TMd3TabbedList do
        for I := Low (TTabsArray) to High (TTabsArray) do
          TabStops [I] := I * 100;
      // data has changed
      Designer.Modified;
    end;
  end;
end;

procedure TMd3TabListEditor.Edit;
begin
  // produce a beep and show the about box
  Beep;
  ExecuteVerb (0);
end;

procedure Register;
begin
  RegisterComponentEditor (
    TMd3TabbedList, TMd3TabListEditor);
end;

end.
 