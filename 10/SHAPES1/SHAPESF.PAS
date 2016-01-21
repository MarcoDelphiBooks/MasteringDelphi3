unit ShapesF;

interface

uses Windows, Classes, Graphics,
  Controls, Forms, SysUtils;

type
  TShapesForm = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
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
    if ssShift in Shift then
      Canvas.Rectangle (X-10, Y-10, X+10, Y+10)
    else
      Canvas.Ellipse (X-10, Y-10, X+10, Y+10);
end;

procedure TShapesForm.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  {display the position of the mouse in the caption}
  Caption := Format ('Shapes: x=%d, y=%d', [X, Y]);
end;

end.

