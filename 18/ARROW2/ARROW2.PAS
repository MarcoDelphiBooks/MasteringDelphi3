unit Arrow2;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs;

type
  TArrowDirection = (adUp, adDown, adLeft, adRight);
  TMd3Arrow = class(TGraphicControl)
  private
    FDirection: TArrowDirection;
    FArrowHeight: Integer;
    FFilled: Boolean;
    FPen: TPen;
    FBrush: TBrush;
    procedure SetDirection (Value: TArrowDirection);
    procedure SetArrowHeight (Value: Integer);
    procedure SetFilled (Value: Boolean);
    procedure SetPen (Value: TPen);
    procedure SetBrush (Value: TBrush);
    procedure RepaintRequest (Sender: TObject);
  protected
    procedure Paint; override;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Direction: TArrowDirection
      read FDirection write SetDirection default adRight;
    property ArrowHeight: Integer
      read FArrowHeight write SetArrowHeight default 10;
    property Filled: Boolean
      read FFilled write SetFilled default False;
    property Pen: TPen read FPen write SetPen;
    property Brush: TBrush read FBrush write SetBrush;
  end;

procedure Register;

implementation

constructor TMd3Arrow.Create (AOwner: TComponent);
begin
  {call the parent constructor}
  inherited Create (AOwner);
  {set the default values}
  FDirection := adRight;
  FArrowHeight := 10;
  FFilled := False;
  {create the pen and the brush}
  FPen := TPen.Create;
  FBrush := TBrush.Create;
  {set a handler for the OnChange event}
  FPen.OnChange := RepaintRequest;
  FBrush.OnChange := RepaintRequest;
end;

destructor TMd3Arrow.Destroy;
begin
  {delete the two objects}
  FPen.Free;
  FBrush.Free;
  {call the parent destructor}
  inherited Destroy;
end;

procedure TMd3Arrow.SetDirection (Value: TArrowDirection);
begin
  if FDirection <> Value then
  begin
    FDirection := Value;
    Invalidate;
  end;
end;

procedure TMd3Arrow.SetArrowHeight (Value: Integer);
begin
  if FArrowHeight <> Value then
  begin
    FArrowHeight := Value;
    Invalidate;
  end;
end;

procedure TMd3Arrow.SetFilled (Value: Boolean);
begin
  if FFilled <> Value then
  begin
    FFilled := Value;
    Invalidate;
  end;
end;

procedure TMd3Arrow.SetPen (Value: TPen);
begin
  FPen.Assign(Value);
  Invalidate;
end;

procedure TMd3Arrow.SetBrush (Value: TBrush);
begin
  FBrush.Assign(Value);
  Invalidate;
end;

procedure TMd3Arrow.RepaintRequest (Sender: TObject);
begin
  Invalidate;
end;

procedure TMd3Arrow.Paint;
var
  XCenter, YCenter: Integer;
begin
  YCenter := (Height - 1) div 2;
  XCenter := (Width - 1) div 2;

  {use the current pen and brush}
  Canvas.Pen := FPen;
  Canvas.Brush := FBrush;

  {draw the line and the arrow, eventaully
  filling the point with the brush color}
  case FDirection of
    adUp:
      with Canvas do
      begin
        MoveTo (XCenter, Height-1);
        LineTo (XCenter, FArrowHeight);
        LineTo (Width-1, FArrowHeight);
        LineTo (XCenter, 0);
        LineTo (0, FArrowHeight);
        LineTo (XCenter, FArrowHeight);
        if FFilled then
          FloodFill (XCenter, FArrowHeight div 2,
            Pen.Color, fsBorder);
      end;
    adDown:
      with Canvas do
      begin
        MoveTo (XCenter, 0);
        LineTo (XCenter, Height - 1 - FArrowHeight);
        LineTo (Width - 1, Height - 1 - FArrowHeight);
        LineTo (XCenter, Height - 1);
        LineTo (0, Height - 1 - FArrowHeight);
        LineTo (XCenter, Height - 1 - FArrowHeight);
        if FFilled then
          FloodFill (XCenter, Height - FArrowHeight div 2,
            Pen.Color, fsBorder);
    end;
    adLeft:
      with Canvas do
      begin
        MoveTo (Width - 1, YCenter);
        LineTo (FArrowHeight, YCenter);
        LineTo (FArrowHeight, Height - 1);
        LineTo (0, YCenter);
        LineTo (FArrowHeight, 0);
        LineTo (FArrowHeight, YCenter);
        if FFilled then
          FloodFill (FArrowHeight div 2, YCenter,
            Pen.Color, fsBorder);
      end;
    adRight:
      with Canvas do
      begin
        MoveTo (0, YCenter);
        LineTo (Width - 1 - FArrowHeight, YCenter);
        LineTo (Width - 1 - FArrowHeight, Height - 1);
        LineTo (Width - 1, YCenter);
        LineTo (Width - 1 - FArrowHeight, 0);
        LineTo (Width - 1 - FArrowHeight, YCenter);
        if FFilled then
          FloodFill (Width - FArrowHeight div 2, YCenter,
            Pen.Color, fsBorder);
      end;
  end;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3Arrow]);
end;

end.
