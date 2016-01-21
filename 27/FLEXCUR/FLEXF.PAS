unit FlexF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    procedure Image1MouseDown(Sender: TObject;
      Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  public
    procedure WmSetCursor (var Msg: TWMSetCursor);
      message wm_SetCursor;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Image1MouseDown(Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Image1.Canvas.Pixels [X, Y] = clWhite then
  begin
    {paint a black circle}
    Image1.Canvas.Pen.Color := clBlack;
    Image1.Canvas.Brush.Color := clBlack;
    Image1.Canvas.Ellipse (X-15, Y-15, X+15, Y+15);
  end
  else
  begin
    {erases the contiguous black pixels}
    Image1.Canvas.Brush.Color := clWhite;
    Image1.Canvas.FloodFill (X, Y, clWhite, fsBorder);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cursor := crNone;
end;

procedure TForm1.WmSetCursor (var Msg: TWMSetCursor);
var
  CurPos: TPoint;
begin
  {get the position of the cursor, and converts it to client coordinates}
  GetCursorPos (CurPos);
  CurPos := Image1.ScreenToClient (CurPos);
  if Msg.HitTest = htClient then
    if Image1.Canvas.Pixels [CurPos.X, CurPos.Y] = clWhite then
      {if the pixel is white}
      SetCursor (Screen.Cursors [crCross])
    else
      {if the pixel is black}
      SetCursor (Screen.Cursors [crUpArrow])
  else
    {if the mouse is outside the client area}
    inherited;
  Msg.Result := 1;
end;

end.
