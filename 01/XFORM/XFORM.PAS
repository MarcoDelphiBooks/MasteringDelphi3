unit XForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XFormLibLib, StdCtrls;

type
  TXForm = class(TActiveForm, IXForm)
    BtnHello: TButton;
    procedure BtnHelloClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IXFormEvents;
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

{ TXForm }

procedure TXForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IXFormEvents;
end;

procedure TXForm.Initialize;
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

function TXForm.CloseQuery: WordBool;
begin

end;

function TXForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TXForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TXForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TXForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TXForm.Get_Color: TColor;
begin
  Result := Color;
end;

function TXForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TXForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TXForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TXForm.Get_Font: Font;
begin
  GetOleFont(Font, Result);
end;

function TXForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TXForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TXForm.Get_ModalResult: Integer;
begin
  Result := Integer(ModalResult);
end;

function TXForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TXForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TXForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TXForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TXForm.Get_WindowState: TxWindowState;
begin
  Result := Ord(WindowState);
end;

function TXForm.ShowModal: Integer;
begin

end;

procedure TXForm.Close;
begin

end;

procedure TXForm.DisableAutoRange;
begin

end;

procedure TXForm.EnableAutoRange;
begin

end;

procedure TXForm.Print;
begin

end;

procedure TXForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TXForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TXForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TXForm.Set_Color(Value: TColor);
begin
  Color := Value;
end;

procedure TXForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TXForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TXForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TXForm.Set_Font(const Value: Font);
begin
  SetOleFont(Font, Value);
end;

procedure TXForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TXForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TXForm.Set_ModalResult(Value: Integer);
begin
  ModalResult := TModalResult(Value);
end;

procedure TXForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TXForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TXForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TXForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TXForm.Set_WindowState(Value: TxWindowState);
begin
  WindowState := TWindowState(Value);
end;

procedure TXForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TXForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TXForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TXForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TXForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TXForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TXForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TXForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TXForm.BtnHelloClick(Sender: TObject);
begin
  MessageDlg ('Hello, guys', mtInformation, [mbOK], 0);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TXForm,
    Class_XForm,
    1,
    '');
end.
