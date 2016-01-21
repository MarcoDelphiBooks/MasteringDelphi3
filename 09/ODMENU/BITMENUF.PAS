unit BitMenuF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    ShapeDemo: TShape;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Shape1: TMenuItem;
    Ellipse1: TMenuItem;
    RoundRec1: TMenuItem;
    Rectang1: TMenuItem;
    Color1: TMenuItem;
    Red1: TMenuItem;
    Green1: TMenuItem;
    Blue1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Red1Click(Sender: TObject);
    procedure Green1Click(Sender: TObject);
    procedure Blue1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ellipse1Click(Sender: TObject);
    procedure RoundRec1Click(Sender: TObject);
    procedure Rectang1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure WmMeasureItem (var Msg: TWmMeasureItem);
      message wm_MeasureItem;
    procedure WmDrawItem (var Msg: TWmDrawItem);
      message wm_DrawItem;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormResize(Sender: TObject);
begin
  ShapeDemo.SetBounds (ClientWidth div 6, ClientHeight div 6,
    2 * ClientWidth div 3, 2 * ClientHeight div 3);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Owner-draw menu example,'#13 +
    'from "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TForm1.Red1Click(Sender: TObject);
begin
  ShapeDemo.Brush.Color := clRed;
end;

procedure TForm1.Green1Click(Sender: TObject);
begin
  ShapeDemo.Brush.Color := clLime;
end;

procedure TForm1.Blue1Click(Sender: TObject);
begin
  ShapeDemo.Brush.Color := clBlue;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
  Bmp: TBitmap;
begin
  // load the bitmaps for the shapes
  for I := 0 to Shape1.Count - 1 do
  begin
    Bmp := TBitmap.Create;
    Bmp.LoadFromFile (Shape1.Items [I].Caption + '.bmp');
    ModifyMenu (Shape1.Handle,
      Shape1.Items [I].MenuIndex,
      mf_ByPosition or mf_Bitmap,
      Shape1.Items [I].Command,
      Pointer (Bmp.Handle));
    Shape1.Items [I].Tag := Integer (Bmp);
  end;
  // turn the menu items into owner-draw items
  for I := 0 to Color1.Count - 1 do
  begin
    ModifyMenu (Color1.Handle,
      Color1.Items [I].MenuIndex,
      mf_ByPosition or mf_OwnerDraw,
      Color1.Items [I].Command,
      Pointer (I));
  end;
end;

procedure TForm1.Ellipse1Click(Sender: TObject);
begin
  ShapeDemo.Shape := stEllipse;
end;

procedure TForm1.RoundRec1Click(Sender: TObject);
begin
  ShapeDemo.Shape := stRoundRect;
end;

procedure TForm1.Rectang1Click(Sender: TObject);
begin
  ShapeDemo.Shape := stRectangle;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Shape1.Count - 1 do
    TBitmap (Shape1.Items [I].Tag).Free;
end;

procedure TForm1.WmMeasureItem (var Msg: TWmMeasureItem);
begin
  inherited;
  with Msg.MeasureItemStruct^ do
    if CtlType = odt_Menu then
    begin
      ItemWidth := 80;
      ItemHeight := 30;
      Msg.Result := 1; // we have handled it
    end;
end;

procedure TForm1.WmDrawItem (var Msg: TWmDrawItem);
var
  Canvas1: TCanvas;
begin
  inherited;
  with Msg.DrawItemStruct^ do
    if CtlType = odt_Menu then
    begin
      // create a canvas for painting
      Canvas1 := TCanvas.Create;
      Canvas1.Handle := hDC;
      try
        // set the background color and draw it
        if (ods_Selected and ItemState <> 0) then
          Canvas1.Brush.Color := clHighlight
        else
          Canvas1.Brush.Color := clMenu;
        Canvas1.FillRect (rcItem);
        case ItemData of
          0: Canvas1.Brush.Color := clRed;
          1: Canvas1.Brush.Color := clLime;
          2: Canvas1.Brush.Color := clBlue;
        end;
        Canvas1.Rectangle (rcItem.Left + 5, rcItem.Top + 5,
          rcItem.Right - 10, rcItem.Bottom - 10);
      finally
        Canvas1.Free;
      end;
    end;
end;

end.
