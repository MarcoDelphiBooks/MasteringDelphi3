unit ClockF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    Hour, Minute, Second: Word; {current time}
    XCenter, YCenter, Radius: Integer; {current size of the form}

  public
    procedure DrawHand (XCenter, YCenter, Radius,
      BackRadius: Integer; Angle: Real);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
var
  HSec: Word;  {temporary value, not used}
begin
  {get the system time}
  DecodeTime (Time, Hour, Minute, Second, HSec);
  Refresh;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  Angle: Real;
  I, X, Y, Size: Integer;

begin
  {compute the center of the form}
  XCenter := ClientWidth div 2;
  YCenter := ClientHeight div 2;
  if XCenter > YCenter then
    Radius := YCenter - 10
  else
    Radius := XCenter - 10;

  {0. Draw the hour marks:
  Yellow pen and yellow brush, using default raster mode}
  Canvas.Pen.Color := clYellow;
  Canvas.Brush.Color := clYellow;
  Size := Radius div 50 + 1;
  for I := 0 to 11 do
  begin
    Angle := 2 * Pi * I / 12;
    X := XCenter - Round (Radius * Cos (Angle));
    Y := YCenter - Round (Radius * Sin (Angle));
    Canvas.Ellipse (X - Size, Y - Size, X + Size, Y + Size);
  end;

  {1. Draw the minutes hand}
  {Blue thick pen}
  Canvas.Pen.Width := 2;
  Canvas.Pen.Color := clBlue;
  Angle := 2 * Pi * Minute / 60;
  DrawHand (XCenter, YCenter, Radius * 90 div 100, 0, Angle);

  {2. Draw the hours hand: Percentage of minutes
  added to hour to move the hand smoothly}
  {Same pen as the minutes hand}
  Angle := 2 * Pi * (Hour + Minute / 60) / 12;
  DrawHand (XCenter, YCenter,
    Radius * 70 div 100, 0, Angle);

  {3. Draw the seconds hand: Red thin pen}
  Canvas.Pen.Width := 1;
  Canvas.Pen.Color := clRed;
  Angle := 2 * Pi * Second / 60;
  DrawHand (XCenter, YCenter, Radius,
    Radius * 30 div 100, Angle);
end;

{draw a line using the current pen. BackRadius holds the
length of the hand in the opposite direction, usually 0}
procedure TForm1.DrawHand (XCenter, YCenter,
  Radius, BackRadius: Integer; Angle: Real);
begin
  Angle := (Angle + 3*Pi/2);
  Canvas.MoveTo (
    XCenter - Round (BackRadius * Cos (Angle)),
    YCenter - Round (BackRadius * Sin (Angle)));
  Canvas.LineTo (
    XCenter + Round (Radius * Cos (Angle)),
    YCenter + Round (Radius * Sin (Angle)));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {read the time before the form is displayed}
  {Notice that this code 'simulates' a message...}
  Timer1Timer (self);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Refresh;
end;

end.
