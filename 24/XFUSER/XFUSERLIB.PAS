unit XFUserLib;

{ XFUserLib Library }
{ Version 1.0 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_XFUserLib: TGUID = '{513F5061-9476-11D0-98D0-444553540000}';

const

{ TxActiveFormBorderStyle }

  afbNone = 0;
  afbSingle = 1;
  afbSunken = 2;
  afbRaised = 3;

{ TxPrintScale }

  poNone = 0;
  poProportional = 1;
  poPrintToFit = 2;

{ TxMouseButton }

  mbLeft = 0;
  mbRight = 1;
  mbMiddle = 2;

{ TxWindowState }

  wsNormal = 0;
  wsMinimized = 1;
  wsMaximized = 2;

const

{ Component class GUIDs }
  Class_XUser: TGUID = '{513F5064-9476-11D0-98D0-444553540000}';

type

{ Forward declarations }
  IXUser = interface;
  DXUser = dispinterface;
  IXUserEvents = dispinterface;

  TxActiveFormBorderStyle = TOleEnum;
  TxPrintScale = TOleEnum;
  TxMouseButton = TOleEnum;
  TxWindowState = TOleEnum;

{ Dispatch interface for XUser Control }

  IXUser = interface(IDispatch)
    ['{513F5062-9476-11D0-98D0-444553540000}']
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: TColor; safecall;
    procedure Set_Color(Value: TColor); safecall;
    function Get_Font: Font; safecall;
    procedure Set_Font(const Value: Font); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Close; safecall;
    function CloseQuery: WordBool; safecall;
    procedure Print; safecall;
    function ShowModal: Integer; safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ModalResult: Integer; safecall;
    procedure Set_ModalResult(Value: Integer); safecall;
    function Get_WindowState: TxWindowState; safecall;
    procedure Set_WindowState(Value: TxWindowState); safecall;
    procedure DisableAutoRange; safecall;
    procedure EnableAutoRange; safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: TColor read Get_Color write Set_Color;
    property Font: Font read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ModalResult: Integer read Get_ModalResult write Set_ModalResult;
    property WindowState: TxWindowState read Get_WindowState write Set_WindowState;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

{ DispInterface declaration for Dual Interface IXUser }

  DXUser = dispinterface
    ['{513F5062-9476-11D0-98D0-444553540000}']
    property AutoScroll: WordBool dispid 1;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 2;
    property Caption: WideString dispid 3;
    property Color: TColor dispid 4;
    property Font: Font dispid 5;
    property KeyPreview: WordBool dispid 6;
    property PixelsPerInch: Integer dispid 7;
    property PrintScale: TxPrintScale dispid 8;
    property Scaled: WordBool dispid 9;
    procedure Close; dispid 10;
    function CloseQuery: WordBool; dispid 11;
    procedure Print; dispid 12;
    function ShowModal: Integer; dispid 13;
    property Active: WordBool readonly dispid 14;
    property DropTarget: WordBool dispid 15;
    property HelpFile: WideString dispid 16;
    property ModalResult: Integer dispid 17;
    property WindowState: TxWindowState dispid 18;
    procedure DisableAutoRange; dispid 19;
    procedure EnableAutoRange; dispid 20;
    property Visible: WordBool dispid 21;
    property Enabled: WordBool dispid 22;
    property Cursor: Smallint dispid 23;
  end;

{ Events interface for XUser Control }

  IXUserEvents = dispinterface
    ['{513F5063-9476-11D0-98D0-444553540000}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 4;
    procedure OnDestroy; dispid 5;
    procedure OnDeactivate; dispid 6;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
    procedure OnPaint; dispid 8;
  end;

{ XUserControl }

  TXUserOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TXUser = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TXUserOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IXUser;
  protected
    procedure InitControlData; override;
    procedure InitControlInterface(const Obj: IUnknown); override;
  public
    procedure Close;
    function CloseQuery: WordBool;
    procedure Print;
    function ShowModal: Integer;
    procedure DisableAutoRange;
    procedure EnableAutoRange;
    property ControlInterface: IXUser read FIntf;
    property Active: WordBool index 14 read GetWordBoolProp;
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
    property AutoScroll: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TxActiveFormBorderStyle index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index 4 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index 5 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 7 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TxPrintScale index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property DropTarget: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property HelpFile: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property ModalResult: Integer index 17 read GetIntegerProp write SetIntegerProp stored False;
    property WindowState: TxWindowState index 18 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 21 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index 22 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 23 read GetSmallintProp write SetSmallintProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TXUserOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

procedure Register;

implementation

uses ComObj;

procedure TXUser.InitControlData;
const
  CEventDispIDs: array[0..7] of Integer = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008);
  CFontIDs: array [0..0] of Integer = (
    $00000005);
  CControlData: TControlData = (
    ClassID: '{513F5064-9476-11D0-98D0-444553540000}';
    EventIID: '{513F5063-9476-11D0-98D0-444553540000}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000000;
    Version: 300;
    FontCount: 1;
    FontIDs: @CFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TXUser.InitControlInterface(const Obj: IUnknown);
begin
  FIntf := Obj as IXUser;
end;

procedure TXUser.Close;
begin
  ControlInterface.Close;
end;

function TXUser.CloseQuery: WordBool;
begin
  Result := ControlInterface.CloseQuery;
end;

procedure TXUser.Print;
begin
  ControlInterface.Print;
end;

function TXUser.ShowModal: Integer;
begin
  Result := ControlInterface.ShowModal;
end;

procedure TXUser.DisableAutoRange;
begin
  ControlInterface.DisableAutoRange;
end;

procedure TXUser.EnableAutoRange;
begin
  ControlInterface.EnableAutoRange;
end;


procedure Register;
begin
  RegisterComponents('ActiveX', [TXUser]);
  RegisterNonActiveX([TXUser]);
end;

end.
