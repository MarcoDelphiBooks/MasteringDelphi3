unit Digclock;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, StdCtrls, ExtCtrls;

type
  TMd3DigClock = class (TCustomLabel)
  private
    FTimer: TTimer;
    function GetActive: Boolean;
    procedure SetActive (Value: Boolean);
  protected
    procedure UpdateClock (Sender: TObject);
  public
    constructor Create (AOwner: TComponent); override;
  published
    property Align;
    property Alignment;
    property Color;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Transparent;
    property Visible;
    property Active: Boolean
      read GetActive write SetActive;
  end;

procedure Register;

implementation

constructor TMd3DigClock.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FTimer := TTimer.Create (self);
  FTimer.OnTimer := UpdateClock;
  FTimer.Enabled := True;
end;

procedure TMd3DigClock.UpdateClock (Sender: TObject);
begin
  Caption := TimeToStr (Time);
end;

function TMd3DigClock.GetActive: Boolean;
begin
  Result := FTimer.Enabled;
end;

procedure TMd3DigClock.SetActive (Value: Boolean);
begin
  FTimer.Enabled := Value;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3DigClock]);
end;

end.
