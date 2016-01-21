unit XArrowLib;

{ XArrowLib Library }
{ Version 1.0 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_XArrowLib: TGUID = '{401A3601-9099-11D0-98D0-444553540000}';

const

{ TxArrowDirection }

  adUp = 0;
  adDown = 1;
  adLeft = 2;
  adRight = 3;

{ TxMouseButton }

  mbLeft = 0;
  mbRight = 1;
  mbMiddle = 2;

const

{ Component class GUIDs }
  Class_Md3WArrowX: TGUID = '{401A3604-9099-11D0-98D0-444553540000}';

type

{ Forward declarations }
  IMd3WArrowX = interface;
  DMd3WArrowX = dispinterface;
  IMd3WArrowXEvents = dispinterface;

  TxArrowDirection = TOleEnum;
  TxMouseButton = TOleEnum;

{ Dispatch interface for Md3WArrowX Control }

  IMd3WArrowX = interface(IDispatch)
    ['{401A3602-9099-11D0-98D0-444553540000}']
    function Get_Direction: TxArrowDirection; safecall;
    procedure Set_Direction(Value: TxArrowDirection); safecall;
    function Get_ArrowHeight: Integer; safecall;
    procedure Set_ArrowHeight(Value: Integer); safecall;
    function Get_Filled: WordBool; safecall;
    procedure Set_Filled(Value: WordBool); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure AboutBox; safecall;
    function Get_FillColor: TColor; safecall;
    procedure Set_FillColor(Value: TColor); safecall;
    function Get_PenColor: Integer; safecall;
    procedure Set_PenColor(Value: Integer); safecall;
    property Direction: TxArrowDirection read Get_Direction write Set_Direction;
    property ArrowHeight: Integer read Get_ArrowHeight write Set_ArrowHeight;
    property Filled: WordBool read Get_Filled write Set_Filled;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
    property FillColor: TColor read Get_FillColor write Set_FillColor;
    property PenColor: Integer read Get_PenColor write Set_PenColor;
  end;

{ DispInterface declaration for Dual Interface IMd3WArrowX }

  DMd3WArrowX = dispinterface
    ['{401A3602-9099-11D0-98D0-444553540000}']
    property Direction: TxArrowDirection dispid 1;
    property ArrowHeight: Integer dispid 2;
    property Filled: WordBool dispid 3;
    property Visible: WordBool dispid 4;
    property Enabled: WordBool dispid 5;
    property Cursor: Smallint dispid 6;
    procedure AboutBox; dispid -552;
    property FillColor: TColor dispid 8;
    property PenColor: Integer dispid 9;
  end;

{ Events interface for Md3WArrowX Control }

  IMd3WArrowXEvents = dispinterface
    ['{401A3603-9099-11D0-98D0-444553540000}']
    procedure OnClick; dispid 1;
    procedure OnArrowDblClick; dispid 2;
  end;

{ Md3WArrowXControl }

  TMd3WArrowX = class(TOleControl)
  private
    FOnClick: TNotifyEvent;
    FOnArrowDblClick: TNotifyEvent;
    FIntf: IMd3WArrowX;
  protected
    procedure InitControlData; override;
    procedure InitControlInterface(const Obj: IUnknown); override;
  public
    procedure AboutBox;
    property ControlInterface: IMd3WArrowX read FIntf;
  published
    property TabStop;
    property DragCursor;
    property DragMode;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
    property Direction: TxArrowDirection index 1 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ArrowHeight: Integer index 2 read GetIntegerProp write SetIntegerProp stored False;
    property Filled: WordBool index 3 read GetWordBoolProp write SetWordBoolProp stored False;
    property Visible: WordBool index 4 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index 5 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property FillColor: TColor index 8 read GetTColorProp write SetTColorProp stored False;
    property PenColor: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnArrowDblClick: TNotifyEvent read FOnArrowDblClick write FOnArrowDblClick;
  end;

procedure Register;

implementation

uses ComObj;

procedure TMd3WArrowX.InitControlData;
const
  CEventDispIDs: array[0..1] of Integer = (
    $00000001, $00000002);
  CControlData: TControlData = (
    ClassID: '{401A3604-9099-11D0-98D0-444553540000}';
    EventIID: '{401A3603-9099-11D0-98D0-444553540000}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000000;
    Version: 300;
    FontCount: 0;
    FontIDs: nil);
begin
  ControlData := @CControlData;
end;

procedure TMd3WArrowX.InitControlInterface(const Obj: IUnknown);
begin
  FIntf := Obj as IMd3WArrowX;
end;

procedure TMd3WArrowX.AboutBox;
begin
  ControlInterface.AboutBox;
end;


procedure Register;
begin
  RegisterComponents('ActiveX', [TMd3WArrowX]);
  RegisterNonActiveX([TMd3WArrowX]);
end;

end.
