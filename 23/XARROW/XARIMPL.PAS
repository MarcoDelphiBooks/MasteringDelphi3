unit XArImpl;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, XArrowLib, WArrow;

type
  TMd3WArrowX = class(TActiveXControl, IMd3WArrowX)
  private
    { Private declarations }
    FDelphiControl: TMd3WArrow;
    FEvents: IMd3WArrowXEvents;
    procedure ArrowDblClickEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure InitializeControl; override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    function Get_ArrowHeight: Integer; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_Direction: TxArrowDirection; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Filled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    procedure AboutBox; safecall;
    procedure Set_ArrowHeight(Value: Integer); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_Direction(Value: TxArrowDirection); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Filled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_FillColor: TColor; safecall;
    procedure Set_FillColor(Value: TColor); safecall;
    function Get_PenColor: Integer; safecall;
    procedure Set_PenColor(Value: Integer); safecall;
  end;

implementation

{ TMd3WArrowX }

uses
  XArAbout, XAPPage;

procedure TMd3WArrowX.InitializeControl;
begin
  FDelphiControl := Control as TMd3WArrow;
  FDelphiControl.OnArrowDblClick := ArrowDblClickEvent;
  FDelphiControl.OnClick := ClickEvent;
end;

procedure TMd3WArrowX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMd3WArrowXEvents;
end;

procedure TMd3WArrowX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  DefinePropertyPage(Class_PropertyPage1);
end;

function TMd3WArrowX.Get_ArrowHeight: Integer;
begin
  Result := FDelphiControl.ArrowHeight;
end;

function TMd3WArrowX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TMd3WArrowX.Get_Direction: TxArrowDirection;
begin
  Result := Ord(FDelphiControl.Direction);
end;

function TMd3WArrowX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TMd3WArrowX.Get_Filled: WordBool;
begin
  Result := FDelphiControl.Filled;
end;

function TMd3WArrowX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

procedure TMd3WArrowX.AboutBox;
begin
  ShowMd3WArrowXAbout;
end;

procedure TMd3WArrowX.Set_ArrowHeight(Value: Integer);
begin
  FDelphiControl.ArrowHeight := Value;
end;

procedure TMd3WArrowX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TMd3WArrowX.Set_Direction(Value: TxArrowDirection);
begin
  FDelphiControl.Direction := TArrowDirection(Value);
end;

procedure TMd3WArrowX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TMd3WArrowX.Set_Filled(Value: WordBool);
begin
  FDelphiControl.Filled := Value;
end;

procedure TMd3WArrowX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TMd3WArrowX.ArrowDblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnArrowDblClick;
end;

procedure TMd3WArrowX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

function TMd3WArrowX.Get_FillColor: TColor;
begin
  Result := FDelphiControl.Brush.Color;
end;

procedure TMd3WArrowX.Set_FillColor(Value: TColor);
begin
  FDelphiControl.Brush.Color := Value;
end;

function TMd3WArrowX.Get_PenColor: Integer;
begin
  Result := ColorToRGB (FDelphiControl.Pen.Color);
end;

procedure TMd3WArrowX.Set_PenColor(Value: Integer);
begin
  FDelphiControl.Pen.Color := Value;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TMd3WArrowX,
    TMd3WArrow,
    Class_Md3WArrowX,
    1,
    '');
end.
