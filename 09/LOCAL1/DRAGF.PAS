unit DragF;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Menus, Dialogs;

type
  TDraggingForm = class(TForm)
    LabelRed: TLabel;
    LabelAqua: TLabel;
    LabelGreen: TLabel;
    LabelYellow: TLabel;
    PopupMenu1: TPopupMenu;
    BackgroundColor1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    ColorDialog1: TColorDialog;
    PopupMenu2: TPopupMenu;
    Colors1: TMenuItem;
    Red1: TMenuItem;
    Aqua1: TMenuItem;
    Green1: TMenuItem;
    Yellow1: TMenuItem;
    Alignment1: TMenuItem;
    Left1: TMenuItem;
    Right1: TMenuItem;
    Center1: TMenuItem;
    N2: TMenuItem;
    Transparent1: TMenuItem;
    Userdefined1: TMenuItem;
    StaticTarget: TStaticText;
    procedure StaticTargetDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure StaticTargetDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BackgroundColor1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Red1Click(Sender: TObject);
    procedure Aqua1Click(Sender: TObject);
    procedure Green1Click(Sender: TObject);
    procedure Yellow1Click(Sender: TObject);
    procedure Transparent1Click(Sender: TObject);
    procedure Left1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
    procedure Right1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure Userdefined1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DraggingForm: TDraggingForm;

implementation

{$R *.DFM}

procedure TDraggingForm.StaticTargetDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  StaticTarget.Color := (Source as TLabel).Color;
end;

procedure TDraggingForm.StaticTargetDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TLabel;
end;

procedure TDraggingForm.BackgroundColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := Color;
  if ColorDialog1.Execute then
    Color := ColorDialog1.Color;
end;

procedure TDraggingForm.About1Click(Sender: TObject);
begin
  MessageDlg ('Example of the use of a pop-up menu,' +
    #13 + 'from the book "Mastering Delphi"',
    mtInformation, [mbOk], 0);
end;

procedure TDraggingForm.Red1Click(Sender: TObject);
begin
  StaticTarget.Color := clRed;
end;

procedure TDraggingForm.Aqua1Click(Sender: TObject);
begin
  StaticTarget.Color := clAqua;
end;

procedure TDraggingForm.Green1Click(Sender: TObject);
begin
  StaticTarget.Color := clGreen;
end;

procedure TDraggingForm.Yellow1Click(Sender: TObject);
begin
  StaticTarget.Color := clYellow;
end;

procedure TDraggingForm.Transparent1Click(Sender: TObject);
begin
  StaticTarget.ParentColor := True;
end;

procedure TDraggingForm.Userdefined1Click(Sender: TObject);
begin
  ColorDialog1.Color := StaticTarget.Color;
  if ColorDialog1.Execute then
    StaticTarget.Color := ColorDialog1.Color;
end;

procedure TDraggingForm.Left1Click(Sender: TObject);
begin
  StaticTarget.Alignment := taLeftJustify;
  Left1.Checked := True;
  Center1.Checked := False;
  Right1.Checked := False;
end;

procedure TDraggingForm.Center1Click(Sender: TObject);
begin
  StaticTarget.Alignment := taCenter;
  Left1.Checked := False;
  Center1.Checked := True;
  Right1.Checked := False;
end;

procedure TDraggingForm.Right1Click(Sender: TObject);
begin
  StaticTarget.Alignment := taRightJustify;
  Left1.Checked := False;
  Center1.Checked := False;
  Right1.Checked := True;
end;

procedure TDraggingForm.PopupMenu2Popup(Sender: TObject);
var
  I: Integer;
begin
  {un-checks all menu items 
    (not required for radio menu items)}
  with Colors1 do
    for I := 0 to Count - 1 do
      Items[I].Checked := False;
  {checks the proper item}
  case StaticTarget.Color of
    clRed: Red1.Checked := True;
    clAqua: Aqua1.Checked := True;
    clGreen: Green1.Checked := True;
    clYellow: Yellow1.Checked := True;
  else
    if StaticTarget.ParentColor then
      Transparent1.Checked := True
    else
      UserDefined1.Checked := True;
  end;
end;

end.

