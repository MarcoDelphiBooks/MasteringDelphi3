unit ShapesF;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Menus, Dialogs, SysUtils, Printers;

type
  ShapeData = class (TObject)
    Circle: Boolean;
    X, Y, Size, PenSize: Integer;
    PenColor, BrushColor: TColor;
  end;

  TShapesForm = class(TForm)
    MainMenu1: TMainMenu;
    ColorDialog1: TColorDialog;
    File1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Colors1: TMenuItem;
    PenColor1: TMenuItem;
    BrushColor1: TMenuItem;
    BackGroundColor1: TMenuItem;
    Size1: TMenuItem;
    IncreasePenSize1: TMenuItem;
    DecreasePenSize1: TMenuItem;
    N2: TMenuItem;
    IncreaseShapeSize1: TMenuItem;
    DecreaseShapeSize1: TMenuItem;
    Help1: TMenuItem;
    AboutShapes1: TMenuItem;
    Print1: TMenuItem;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PenColor1Click(Sender: TObject);
    procedure BrushColor1Click(Sender: TObject);
    procedure BackGroundColor1Click(Sender: TObject);
    procedure IncreasePenSize1Click(Sender: TObject);
    procedure DecreasePenSize1Click(Sender: TObject);
    procedure IncreaseShapeSize1Click(Sender: TObject);
    procedure DecreaseShapeSize1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure AboutShapes1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Print1Click(Sender: TObject);
  private
    Radius: Integer;
    ShapesList: TList;
  public
    procedure CommonPaint (Canvas1: TCanvas; Scale: Integer);
  end;

var
  ShapesForm: TShapesForm;

implementation

{$R *.DFM}

procedure TShapesForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Shape: ShapeData;
  InvRect: TRect;
begin
  if Button = mbLeft then
  begin
    Shape := ShapeData.Create;
    if (ssShift in Shift) then
      Shape.Circle := False
    else
      Shape.Circle := True;
    Shape.X := X;
    Shape.Y := Y;
    Shape.Size := Radius;
    Shape.PenSize := Canvas.Pen.Width;
    Shape.PenColor := Canvas.Pen.Color;
    Shape.BrushColor := Canvas.Brush.Color;
    ShapesList.Add (Shape);

    {two versions of the code required to repaint
    the form with the new shape}

    {standard code:}
//    Repaint;

    {optimized code:}
    InvRect := Rect (X-Radius-Shape.PenSize,
      Y-Radius-Shape.PenSize, X+Radius+Shape.PenSize,
      Y+Radius+Shape.PenSize);
    InvalidateRect (Handle, @InvRect, False); 
  end;
end;

procedure TShapesForm.PenColor1Click(Sender: TObject);
begin
  {select a new color for the pen}
  ColorDialog1.Color := Canvas.Pen.Color;
  ColorDialog1.Execute;
  Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TShapesForm.BrushColor1Click(Sender: TObject);
begin
  {select a new color for the brush}
  ColorDialog1.Color := Canvas.Brush.Color;
  ColorDialog1.Execute;
  Canvas.Brush.Color := ColorDialog1.Color;
end;

procedure TShapesForm.BackGroundColor1Click(Sender: TObject);
begin
  {select a new color for the background of the form}
  ColorDialog1.Color := Color;
  ColorDialog1.Execute;
  Color := ColorDialog1.Color;
end;

procedure TShapesForm.IncreasePenSize1Click(Sender: TObject);
begin
  {increase the size of the pen}
  Canvas.Pen.Width := Canvas.Pen.Width + 2;
  DecreasePenSize1.Enabled := True;
end;

procedure TShapesForm.DecreasePenSize1Click(Sender: TObject);
begin
  {decrease the size of the pen,
  avoiding to let it go below zero}
  Canvas.Pen.Width := Canvas.Pen.Width - 2;
  if Canvas.Pen.Width < 3 then
    DecreasePenSize1.Enabled := False;
end;

procedure TShapesForm.IncreaseShapeSize1Click(Sender: TObject);
begin
  {increase radius, a private field of the form}
  Radius := Radius + 5;
  DecreaseShapeSize1.Enabled := True;
end;

procedure TShapesForm.DecreaseShapeSize1Click(Sender: TObject);
begin
  {decrease the radius, but not below the limit}
  Radius := Radius - 5;
  if Radius < 10 then
    DecreaseShapeSize1.Enabled := False;
end;

procedure TShapesForm.FormCreate(Sender: TObject);
begin
  {initialization and creation of the list}
  Radius := 5;
  ShapesList := TList.Create;
end;

procedure TShapesForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  {copy the mouse coordinates in the title}
  Caption := 'Shapes: x=' + IntToStr (X) +
    ', y=' + IntToStr (Y);
end;

procedure TShapesForm.AboutShapes1Click(Sender: TObject);
begin
  {show a message box}
  MessageDlg ('Shape application (v. 4.0)' +
    Chr(13) + '"Mastering Delphi", Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TShapesForm.Exit1Click(Sender: TObject);
begin
  {close the form and the application}
  Close;
end;

procedure TShapesForm.New1Click(Sender: TObject);
begin
  {repaint the surface, after removing the elements
  from the listbox, if there is any element and the
  user confirms his request}
  if ShapesList.Count > 0 then
    if MessageDlg ('Are you sure you want to delete all the shapes?',
      mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      ShapesList.Clear;
      Refresh;
    end;
end;

procedure TShapesForm.FormPaint(Sender: TObject);
begin
  {repaint the form using the common procedure}
  CommonPaint (Canvas, 1);
end;

procedure TShapesForm.CommonPaint (
  Canvas1: TCanvas; Scale: Integer);
var
  I: Integer;
  CurShape: ShapeData;
begin
  {repaint each shape of the list, using the stored
  values, on the canvas passed as a parameter}
  for I := 0 to ShapesList.Count - 1 do
  begin
    CurShape := ShapesList.Items [I];
    with CurShape do
    begin
      Canvas1.Pen.Color := PenColor;
      Canvas1.Pen.Width := PenSize;
      Canvas1.Brush.Color := BrushColor;
      if Circle then
        Canvas1.Ellipse ((X-Size) * Scale, (Y-Size) * Scale,
          (X+Size) * Scale, (Y+Size) * Scale)
      else
        Canvas1.Rectangle ((X-Size) * Scale, (Y-Size) * Scale,
          (X+Size) * Scale, (Y+Size) * Scale);
    end;
  end;
end;

procedure TShapesForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  {ask the user to confirm closing}
  if MessageDlg ('Are you sure you want to exit?',
      mtConfirmation, [mbYes, mbNo], 0) = idNo then
    CanClose := False;
end;

procedure TShapesForm.Print1Click(Sender: TObject);
var
  Scale, Scale1: Integer;
begin
  Scale := Printer.PageWidth div ClientWidth;
  Scale1 := Printer.PageHeight div ClientHeight;
  if Scale1 < Scale then
    Scale := Scale1;
  Printer.BeginDoc;
  try
    CommonPaint (Printer.Canvas, Scale);
    Printer.EndDoc;
  except
    Printer.Abort;
    raise;
  end;
end;

end.

