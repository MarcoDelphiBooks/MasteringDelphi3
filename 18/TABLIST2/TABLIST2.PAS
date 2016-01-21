unit TabList2;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TTabsArray = array [0..9] of Integer;

  TMd3TabbedList = class(TListBox)
  private
    FTabStops: TTabsArray;
    function GetTabStops (Index: Integer): Integer;
    procedure SetTabStops (Index, Value: Integer);
    function GetTabsString: string;
    procedure SetTabsString (Value: string);
  protected
    procedure UpdateTabStops;
  public
    procedure CreateParams (
      var Params: TCreateParams); override;
    procedure CreateWnd; override;
    property TabStops [Index: Integer]: Integer
      read GetTabStops write SetTabStops;
  published
    property TabsString: string
      read GetTabsString write SetTabsString;
  end;

procedure Register;

implementation

procedure TMd3TabbedList.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams (Params);
  Params.Style := Params.Style or lbs_UseTabStops;
end;

procedure TMd3TabbedList.CreateWnd;
var
  I: Integer;
begin
  inherited CreateWnd;
  for I := Low (FTabStops) to High (FTabStops) do
    FTabStops [I] := I * 100;
  UpdateTabStops;
end;

procedure TMd3TabbedList.SetTabStops (Index, Value: Integer);
begin
  if FTabStops [Index] <> Value then
  begin
    FTabStops [Index] := Value;
    UpdateTabStops;
    Invalidate;
  end;
end;

function TMd3TabbedList.GetTabStops (Index: Integer): Integer;
begin
  Result := FTabStops [Index];
end;

procedure TMd3TabbedList.UpdateTabStops;
var
  I: Integer;
  HUnits: Integer;
  ConvertedTabs: TTabsArray;
begin
  {determine the horizontal dialog box units
  used by the list box, which depend on
  its current font}
  Canvas.Font := Font;
  HUnits := Canvas.TextWidth (
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz')
    div 52;

  {convert the array of tab values}
  for I := Low (ConvertedTabs) to High (ConvertedTabs) do
    ConvertedTabs [I] := FTabStops [I] * 4 div HUnits;

  {activate the tabs stops in the list box,
  sending a Windows list box message}
  SendMessage (Handle, lb_SetTabStops,
    1 + High (ConvertedTabs) - Low (ConvertedTabs),
    LongInt (@ConvertedTabs));
end;

function TMd3TabbedList.GetTabsString: string;
var
  Text: string;
  I: Integer;
begin
  SetLength (Text, 100);
  Text := '';
  for I := Low (FTabStops) to High (FTabStops) do
    Text := Text + IntToStr (FTabStops [I]) + ';';
  Result := Text;
end;

procedure TMd3TabbedList.SetTabsString (Value: string);
var
  Text: string;
  I, Len : Integer;
begin
  Text := Value;
  for I := Low (FTabStops) to High (FTabStops) do
  begin
    Len := Pos (Text, ';');
    FTabStops [I] := StrToIntDef (
      Copy (Text, 1, Len), 0);
    Delete (Text, 1, Len);
  end;
  UpdateTabStops;
  Invalidate;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3TabbedList]);
end;

end.

