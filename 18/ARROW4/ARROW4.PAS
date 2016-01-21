unit Arrow4;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs;

type
  TArrowDirection = (adUp, adDown, adLeft, adRight);
  TMd3Arrow = class(TGraphicControl)
  private
    FDirection: TArrowDirection;
    FArrowHeight: Integer;
    FFilled: Boolean;
    FPen: TPen;
    FBrush: TBrush;
    FArrowDblClick: TNotifyEvent;
    procedure SetDirection (Value: TArrowDirection);
    procedure SetArrowHeight (Value: Integer);
    procedure SetFilled (Value: Boolean);
    procedure SetPen (Value: TPen);
    procedure SetBrush (Value: TBrush);
    procedure RepaintRequest (Sender: TObject);
    procedure WMLButtonDlbClk (var Msg: TWMLButtonDblClk);
      message wm_LButtonDblClk;
  protected
    procedure Paint; override;
    procedure ArrowDblClick; dynamic;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Width default 50;
    property Height default 20;
    property Direction: TArrowDirection
      read FDirection write SetDirection default adRight;
    property ArrowHeight: Integer
      read FArrowHeight write SetArrowHeight default 10;
    property Filled: Boolean
      read FFilled write SetFilled default False;
    property Pen: TPen read FPen write SetPen;
    property Brush: TBrush read FBrush write SetBrush;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnArrowDblClick: TNotifyEvent
      read FArrowDblClick write FArrowDblClick;
  end;

procedure Register;

implementation

{R ARROW4.DCR}

constructor TMd3Arrow.Create (AOwner: TComponent);
begin
  {call the parent constructor}
  inherited Create (AOwner);
  {set the default values}
  FDirection := adRight;
  Width := 50;
  Height := 20;
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
  ArrowPoints: array [0..3] of TPoint;
begin
  YCenter := (Height - 1) div 2;
  XCenter := (Width - 1) div 2;

  {use the current pen and brush}
  Canvas.Pen := FPen;
  Canvas.Brush := FBrush;

  {draw a line and compute the triangle
  for the arrow point}
  case FDirection of
    adUp:
    begin
      Canvas.MoveTo (XCenter, Height-1);
      Canvas.LineTo (XCenter, FArrowHeight);
      ArrowPoints [0] :=
        Point (0, FArrowHeight);
      ArrowPoints [1] :=
        Point (XCenter, 0);
      ArrowPoints [2] :=
        Point (Width-1, FArrowHeight);
      ArrowPoints [3] :=
        Point (0, FArrowHeight);
    end;
    adDown:
    begin
      Canvas.MoveTo (XCenter, 0);
      Canvas.LineTo (XCenter, Height - 1 - FArrowHeight);
      ArrowPoints [0] := Point (
        XCenter, Height - 1);
      ArrowPoints [1] := Point (
        0, Height - 1 - FArrowHeight);
      ArrowPoints [2] := Point (
        Width - 1, Height - 1 - FArrowHeight);
      ArrowPoints [3] := Point (
        XCenter, Height - 1);
    end;
    adLeft:
    begin
      Canvas.MoveTo (Width - 1, YCenter);
      Canvas.LineTo (FArrowHeight, YCenter);
      ArrowPoints [0] :=
        Point (FArrowHeight, Height - 1);
      ArrowPoints [1] :=
        Point (0, YCenter);
      ArrowPoints [2] :=
        Point (FArrowHeight, 0);
      ArrowPoints [3] :=
        Point (FArrowHeight, Height - 1);
    end;
    adRight:
    begin
      Canvas.MoveTo (0, YCenter);
      Canvas.LineTo (Width - 1 - FArrowHeight, YCenter);
      ArrowPoints [0] := Point (
        Width - 1 - FArrowHeight, Height - 1);
      ArrowPoints [1] := Point (
        Width - 1 - FArrowHeight, 0);
      ArrowPoints [2] := Point (
        Width - 1, YCenter);
      ArrowPoints [3] := Point (
        Width - 1 - FArrowHeight, Height - 1);
    end;
  end;

  {draw the arrow point, eventually filling it}
  if FFilled then
    Canvas.Polygon (ArrowPoints)
  else
    Canvas.PolyLine (ArrowPoints);
end;

procedure TMd3Arrow.WMLButtonDlbClk (
  var Msg: TWMLButtonDblClk);
var
  ArrowPoints: array [0..2] of TPoint;
  XCenter, YCenter: Integer;
  HRegion: HRgn;
begin
  {perform default handling}
  inherited;

  {compute the points}
  YCenter := (Height - 1) div 2;
  XCenter := (Width - 1) div 2;
  case FDirection of
    adUp:
    begin
      ArrowPoints [0] :=
        Point (0, FArrowHeight);
      ArrowPoints [1] :=
        Point (XCenter, 0);
      ArrowPoints [2] :=
        Point (Width-1, FArrowHeight);
    end;
    adDown:
    begin
      ArrowPoints [0] := Point (
        XCenter, Height - 1);
      ArrowPoints [1] := Point (
        0, Height - 1 - FArrowHeight);
      ArrowPoints [2] := Point (
        Width - 1, Height - 1 - FArrowHeight);
    end;
    adLeft:
    begin
      ArrowPoints [0] :=
        Point (FArrowHeight, Height - 1);
      ArrowPoints [1] :=
        Point (0, YCenter);
      ArrowPoints [2] :=
        Point (FArrowHeight, 0);
    end;
    adRight:
    begin
      ArrowPoints [0] := Point (
        Width - 1 - FArrowHeight, Height - 1);
      ArrowPoints [1] := Point (
        Width - 1 - FArrowHeight, 0);
      ArrowPoints [2] := Point (
        Width - 1, YCenter);
    end;
  end;

  {check whether the click took place
  in the arrow-point region}
  HRegion := CreatePolygonRgn (
    ArrowPoints, 3, WINDING);
  if PtInRegion (HRegion, Msg.XPos, Msg.YPos) then
    ArrowDblClick;
  DeleteObject (HRegion);
end;

procedure TMd3Arrow.ArrowDblClick;
begin
  {call the handler, if available}
  if Assigned (FArrowDblClick) then
    FArrowDblClick (self);
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3Arrow]);
end;

end.
