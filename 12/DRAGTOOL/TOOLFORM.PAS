unit ToolForm;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Menus, Buttons, ExtCtrls;

type
  TToolbarForm = class(TForm)
    Panel1: TPanel;
    SpeedButtonNote: TSpeedButton;
    SpeedButtonBig: TSpeedButton;
    SpeedButtonBold: TSpeedButton;
    SpeedButtonItalic: TSpeedButton;
    SpeedButtonUnderline: TSpeedButton;
    SpeedButtonLeft: TSpeedButton;
    SpeedButtonCenter: TSpeedButton;
    SpeedButtonRight: TSpeedButton;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Toolbar1: TMenuItem;
    Visible1: TMenuItem;
    DisableSound1: TMenuItem;
    DisableStyles1: TMenuItem;
    Help1: TMenuItem;
    AboutToolbar1: TMenuItem;
    DisableSize1: TMenuItem;
    procedure SpeedButtonNoteClick(Sender: TObject);
    procedure SpeedButtonLeftClick(Sender: TObject);
    procedure SpeedButtonCenterClick(Sender: TObject);
    procedure SpeedButtonRightClick(Sender: TObject);
    procedure SpeedButtonBoldClick(Sender: TObject);
    procedure SpeedButtonItalicClick(Sender: TObject);
    procedure SpeedButtonUnderlineClick(Sender: TObject);
    procedure SpeedButtonBigClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure DisableSound1Click(Sender: TObject);
    procedure DisableStyles1Click(Sender: TObject);
    procedure AboutToolbar1Click(Sender: TObject);
    procedure DisableSize1Click(Sender: TObject);
    procedure Label1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Label1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  public
    BarPos: TAlign;
    PanelSize: Integer;
    BoxOn: Boolean;
    function GetBarPos (X, Y: Integer): TAlign;
    procedure RotateSpeedbar;
    procedure MoveButtons (Win: TWinControl);
  end;

var
  ToolbarForm: TToolbarForm;

implementation

{$R *.DFM}

uses TBoxForm;

procedure TToolbarForm.SpeedButtonNoteClick(Sender: TObject);
begin
  Beep;
end;

procedure TToolbarForm.SpeedButtonLeftClick(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
end;

procedure TToolbarForm.SpeedButtonCenterClick(Sender: TObject);
begin
  Label1.Alignment := taCenter;
end;

procedure TToolbarForm.SpeedButtonRightClick(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
end;

procedure TToolbarForm.SpeedButtonBoldClick(Sender: TObject);
begin
  if SpeedButtonBold.Down then
    Label1.Font.Style := [fsBold]
  else
    Label1.Font.Style := [];
end;

procedure TToolbarForm.SpeedButtonItalicClick(Sender: TObject);
begin
  if SpeedButtonItalic.Down then
    Label1.Font.Style := [fsItalic]
  else
    Label1.Font.Style := [];
end;

procedure TToolbarForm.SpeedButtonUnderlineClick(Sender: TObject);
begin
  if SpeedButtonUnderline.Down then
    Label1.Font.Style := [fsUnderline]
  else
    Label1.Font.Style := [];
end;

procedure TToolbarForm.SpeedButtonBigClick(Sender: TObject);
begin
  if SpeedButtonBig.Down then
  begin
    Label1.Font.Size := 24;
    SpeedButtonBig.Hint := 'Shrink';
  end
  else
  begin
    Label1.Font.Size := 12;
    SpeedButtonBig.Hint := 'Expand';
  end;
end;

procedure TToolbarForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TToolbarForm.Visible1Click(Sender: TObject);
begin
  {hide or display the toolbar or toolbox,
  setting the menu item checkmark}
  if BoxOn then
    ToolBox.Visible := not ToolBox.Visible
  else
    Panel1.Visible := not Panel1.Visible;
  Visible1.Checked := not Visible1.Checked;
end;

procedure TToolbarForm.DisableSound1Click(Sender: TObject);
begin
  {disable or enable button and set menu check mark}
  SpeedButtonNote.Enabled := not SpeedButtonNote.Enabled;
  DisableSound1.Checked := not DisableSound1.Checked;
end;

procedure TToolbarForm.DisableStyles1Click(Sender: TObject);
begin
  {disable or enable buttons and set menu text properly}
  if SpeedButtonBold.Enabled then
  begin
    SpeedButtonBold.Enabled := False;
    SpeedButtonItalic.Enabled := False;
    SpeedButtonUnderline.Enabled := False;
    DisableStyles1.Checked := True;
  end
  else
  begin
    SpeedButtonBold.Enabled := True;
    SpeedButtonItalic.Enabled := True;
    SpeedButtonUnderline.Enabled := True;
    DisableStyles1.Checked := False;
  end;
end;

procedure TToolbarForm.AboutToolbar1Click(Sender: TObject);
begin
  MessageDlg ('Draggable Toolbar by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TToolbarForm.DisableSize1Click(Sender: TObject);
begin
  SpeedButtonBig.Enabled := not SpeedButtonBig.Enabled;
  DisableSize1.Checked := not DisableSize1.Checked;
end;

function TToolbarForm.GetBarPos (X, Y: Integer): TAlign;
begin
  if X < PanelSize then
    GetBarPos := alLeft
  else if Y < PanelSize then
    GetBarPos := alTop
  else if X > ClientWidth - PanelSize then
    GetBarPos := alRight
  else if Y > ClientHeight - PanelSize then
    GetBarPos := alBottom
  else
    GetBarPos := alNone;
end;



procedure TToolbarForm.Label1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TToolbarForm.Label1DragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  ReqPos: TAlign;
begin
  ReqPos := GetBarPos (X + Label1.Left, Y + Label1.Top);
  if ReqPos = alNone then
  begin
    Panel1.Visible := False;
    BoxOn := True;
    if BarPos in [alLeft, alRight] then
      RotateSpeedbar;
    {move buttons to the toolbox}
    MoveButtons (ToolBox);
    ToolBox.Show;
  end
  else
  begin
    Panel1.Align := ReqPos;
    if (ReqPos in [alTop, alBottom]) <>
      (BarPos in [alTop, alBottom]) then
      RotateSpeedbar;
    BarPos := ReqPos;
  end;
end;

procedure TToolbarForm.MoveButtons (Win: TWinControl);
var
  I, J: Integer;
begin
  {move the speed buttons to a new parent component}
  for I := 0 to ComponentCount - 1 do
    if Components [I] is TSpeedButton then
      TSpeedButton (Components [I]).Parent := Win;
  if Win = ToolBox then
  begin
    {place the buttons on two lines}
    for J := 0 to Win.ControlCount - 1 do
      if Win.Controls [J].Left > 110 then
      begin
        Win.Controls [J].Left := Win.Controls [J].Left - 112;
        Win.Controls [J].Top := 30;
      end;
  end
  else
  begin
    {place back the buttons on one line}
    for J := 0 to Win.ControlCount - 1 do
      if Win.Controls [J].Top = 30 then
      begin
        Win.Controls [J].Left := Win.Controls [J].Left + 112;
        Win.Controls [J].Top := 2;
      end;
  end
end;

procedure TToolbarForm.RotateSpeedbar;
var
  I, X, Y: Integer;
begin
  for I := 0 to Panel1.ControlCount - 1 do
  begin
    {reverse X and Y}
    X := Panel1.Controls [I].Top;
    Y := Panel1.Controls [I].Left;
    Panel1.Controls [I].Top := Y;
    Panel1.Controls [I].Left := X;
  end;
end;

procedure TToolbarForm.FormCreate(Sender: TObject);
begin
  BarPos := alTop;
  PanelSize := Panel1.Height;
  BoxOn := False;
end;

end.

