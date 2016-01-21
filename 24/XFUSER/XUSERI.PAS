unit XUserI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XFUserLib, StdCtrls;

type
  TXUser = class(TActiveForm, IXUser)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IXUserEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure Initialize; override;
    function CloseQuery: WordBool; safecall;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: TColor; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: Font; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_ModalResult: Integer; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_WindowState: TxWindowState; safecall;
    function ShowModal: Integer; safecall;
    procedure Close; safecall;
    procedure DisableAutoRange; safecall;
    procedure EnableAutoRange; safecall;
    procedure Print; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: TColor); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: Font); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ModalResult(Value: Integer); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure Set_WindowState(Value: TxWindowState); safecall;
  public
    { Public declarations }
  end;

implementation

uses ComServ;

{$R *.DFM}

{ TXUser }

procedure TXUser.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IXUserEvents;
end;

procedure TXUser.Initialize;
begin
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TXUser.CloseQuery: WordBool;
begin

end;

function TXUser.Get_Active: WordBool;
begin
  Result := Active;
end;

function TXUser.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TXUser.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TXUser.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TXUser.Get_Color: TColor;
begin
  Result := Color;
end;

function TXUser.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TXUser.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TXUser.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TXUser.Get_Font: Font;
begin
  GetOleFont(Font, Result);
end;

function TXUser.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TXUser.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TXUser.Get_ModalResult: Integer;
begin
  Result := Integer(ModalResult);
end;

function TXUser.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TXUser.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TXUser.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TXUser.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TXUser.Get_WindowState: TxWindowState;
begin
  Result := Ord(WindowState);
end;

function TXUser.ShowModal: Integer;
begin

end;

procedure TXUser.Close;
begin

end;

procedure TXUser.DisableAutoRange;
begin

end;

procedure TXUser.EnableAutoRange;
begin

end;

procedure TXUser.Print;
begin

end;

procedure TXUser.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TXUser.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TXUser.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TXUser.Set_Color(Value: TColor);
begin
  Color := Value;
end;

procedure TXUser.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TXUser.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TXUser.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TXUser.Set_Font(const Value: Font);
begin
  SetOleFont(Font, Value);
end;

procedure TXUser.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TXUser.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TXUser.Set_ModalResult(Value: Integer);
begin
  ModalResult := TModalResult(Value);
end;

procedure TXUser.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TXUser.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TXUser.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TXUser.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TXUser.Set_WindowState(Value: TxWindowState);
begin
  WindowState := TWindowState(Value);
end;

procedure TXUser.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TXUser.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TXUser.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TXUser.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TXUser.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TXUser.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TXUser.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TXUser.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TXUser.Button1Click(Sender: TObject);
var
  UserName: string;
  Size : Integer;
begin
  Size := 128;
  SetLength (UserName, Size);
  GetUserName (PChar(UserName), Size);
  Label1.Caption := UserName;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TXUser,
    Class_XUser,
    1,
    '');
end.
