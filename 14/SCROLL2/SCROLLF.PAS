unit ScrollF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm2 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormPaint(Sender: TObject);
var
  X1, Y1: Integer;
begin
  X1 := HorzScrollBar.Position;
  Y1 := VertScrollBar.Position;
  {draw a yellow line}
  Canvas.Pen.Width := 30;
  Canvas.Pen.Color := clYellow;
  Canvas.MoveTo (30-X1, 30-Y1);
  Canvas.LineTo (1970-X1, 1970-Y1);

  {draw a blue line}
  Canvas.Pen.Color := clNavy;
  Canvas.MoveTo (30-X1, 1970-Y1);
  Canvas.LineTo (1970-X1, 30-Y1);

  {draw a fuchsia square}
  Canvas.Pen.Color := clFuchsia;
  Canvas.Brush.Style := bsClear;
  Canvas.Rectangle (500-X1, 500-Y1, 
    1500-X1, 1500-Y1);
end;

end.
