unit Arrow1;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TArrowDirection = (adUp, adDown, adLeft, adRight);
  TMd3Arrow = class(TGraphicControl)
  private
    FDirection: TArrowDirection;
    procedure SetDirection (Value: TArrowDirection);
  protected
    procedure Paint; override;
  public
    constructor Create (AOwner: TComponent); override;
  published
    property Direction: TArrowDirection
      read FDirection write SetDirection default adRight;
  end;

procedure Register;

implementation

constructor TMd3Arrow.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FDirection := adRight;
end;

procedure TMd3Arrow.SetDirection (Value: TArrowDirection);
begin
  if FDirection <> Value then
  begin
    FDirection := Value;
    Invalidate;
  end;
end;

procedure TMd3Arrow.Paint;
var
  XCenter, YCenter: Integer;
begin
  {compute the center}
  YCenter := (Height - 1) div 2;
  XCenter := (Width - 1) div 2;

  {draw the line and the arrow}
  case FDirection of
    adUp:
      with Canvas do
      begin
        MoveTo (XCenter, Height-1);
        LineTo (XCenter, YCenter);
        LineTo (Width-1, YCenter);
        LineTo (XCenter, 0);
        LineTo (0, YCenter);
        LineTo (XCenter, YCenter);
      end;
    adDown:
      with Canvas do
      begin
        MoveTo (XCenter, 0);
        LineTo (XCenter, YCenter);
        LineTo (Width - 1, YCenter);
        LineTo (XCenter, Height - 1);
        LineTo (0, YCenter);
        LineTo (XCenter, YCenter);
    end;
    adLeft:
      with Canvas do
      begin
        MoveTo (Width - 1, YCenter);
        LineTo (XCenter, YCenter);
        LineTo (XCenter, Height - 1);
        LineTo (0, YCenter);
        LineTo (XCenter, 0);
        LineTo (XCenter, YCenter);
      end;
    adRight:
      with Canvas do
      begin
        MoveTo (0, YCenter);
        LineTo (XCenter, YCenter);
        LineTo (XCenter, Height - 1);
        LineTo (Width - 1, YCenter);
        LineTo (XCenter, 0);
        LineTo (XCenter, YCenter);
      end;
  end;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3Arrow]);
end;

end.
