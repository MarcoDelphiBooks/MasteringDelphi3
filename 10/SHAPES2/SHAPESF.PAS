unit ShapesF;

interface

uses
  Windows, Classes, Graphics,
  Forms, Controls, Menus, Dialogs, SysUtils;

type
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
    Size1: TMenuItem;
    IncreasePenSize1: TMenuItem;
    DecreasePenSize1: TMenuItem;
    N2: TMenuItem;
    IncreaseShapeSize1: TMenuItem;
    DecreaseShapeSize1: TMenuItem;
    Help1: TMenuItem;
    AboutShapes1: TMenuItem;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PenColor1Click(Sender: TObject);
    procedure BrushColor1Click(Sender: TObject);
    procedure IncreasePenSize1Click(Sender: TObject);
    procedure DecreasePenSize1Click(Sender: TObject);
    procedure IncreaseShapeSize1Click(Sender: TObject);
    procedure DecreaseShapeSize1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure AboutShapes1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
  private
    { Private declarations }
    Radius: Integer;
  public
    { Public declarations }
  end;

var
  ShapesForm: TShapesForm;

implementation

{$R *.DFM}

procedure TShapesForm.FormMouseDown(Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  {draw a form in x:y, using the current radius}
  if Button = mbLeft then
    if ssShift in Shift then
      Canvas.Rectangle (X-Radius, Y-Radius, X+Radius, Y+Radius)
    else
      Canvas.Ellipse (X-Radius, Y-Radius, X+Radius, Y+Radius);
end;

procedure TShapesForm.PenColor1Click(Sender: TObject);
begin
  {select a new color for the pen}
  ColorDialog1.Color := Canvas.Pen.Color;
  if ColorDialog1.Execute then
    Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TShapesForm.BrushColor1Click(Sender: TObject);
begin
  {select a new color for the brush}
  ColorDialog1.Color := Canvas.Brush.Color;
  if ColorDialog1.Execute then
    Canvas.Brush.Color := ColorDialog1.Color;
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
  {initial value}
  Radius := 5;
end;

procedure TShapesForm.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  {display the position of the mouse in the caption}
  Caption := Format ('Shapes: x=%d, y=%d', [X, Y]);
end;

procedure TShapesForm.AboutShapes1Click(Sender: TObject);
begin
  {show a message box}
  MessageDlg ('Shape application (v. 2.0)' +
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
  {repaint the surface, clearing it}
  Repaint;
end;

end.

