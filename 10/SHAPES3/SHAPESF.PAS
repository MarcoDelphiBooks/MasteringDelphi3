unit ShapesF;

interface

uses
  Windows, Classes, Graphics,
  Forms, Controls, SysUtils;

type
  TShapesForm = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Center: TPoint;
    Circle: Boolean;
  public
    { Public declarations }
  end;

var
  ShapesForm: TShapesForm;

implementation

{$R *.DFM}

procedure TShapesForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    // store the center and the kind of shape
    Center.X := X;
    Center.Y := Y;
    Circle := not (ssShift in Shift);
    // ask to repaint the form
    Invalidate;
  end;
end;

procedure TShapesForm.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  {copy the mouse coordinates to the title}
  Caption := Format ('Shapes: x=%d, y=%d', [X, Y]);
end;

procedure TShapesForm.FormPaint(Sender: TObject);
begin
  {paint one of the two shapes, using the stored values}
  if Circle then
    Canvas.Ellipse(Center.X-10, Center.Y-10,
      Center.X+10, Center.Y+10)
  else
    Canvas.Rectangle(Center.X-10, Center.Y-10,
      Center.X+10, Center.Y+10);
end;

procedure TShapesForm.FormCreate(Sender: TObject);
begin
  {initialization, out of the form surface}
  Circle := True;
  Center.X := -100;
  Center.Y := -100;
end;

end.

