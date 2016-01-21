unit AXF1Impl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XF1Lib, StdCtrls, ExtCtrls;

type
  TAXForm1 = class(TActiveForm, IAXForm1)
    PaintBox1: TPaintBox;
    Bevel1: TBevel;
    procedure FormPaint(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FEvents: IAXForm1Events;
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

{ TAXForm1 }

procedure TAXForm1.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAXForm1Events;
end;

procedure TAXForm1.Initialize;
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

function TAXForm1.CloseQuery: WordBool;
begin

end;

function TAXForm1.Get_Active: WordBool;
begin
  Result := Active;
end;

function TAXForm1.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TAXForm1.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TAXForm1.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TAXForm1.Get_Color: TColor;
begin
  Result := Color;
end;

function TAXForm1.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TAXForm1.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TAXForm1.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TAXForm1.Get_Font: Font;
begin
  GetOleFont(Font, Result);
end;

function TAXForm1.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TAXForm1.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TAXForm1.Get_ModalResult: Integer;
begin
  Result := Integer(ModalResult);
end;

function TAXForm1.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TAXForm1.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TAXForm1.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TAXForm1.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TAXForm1.Get_WindowState: TxWindowState;
begin
  Result := Ord(WindowState);
end;

function TAXForm1.ShowModal: Integer;
begin

end;

procedure TAXForm1.Close;
begin

end;

procedure TAXForm1.DisableAutoRange;
begin

end;

procedure TAXForm1.EnableAutoRange;
begin

end;

procedure TAXForm1.Print;
begin

end;

procedure TAXForm1.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TAXForm1.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TAXForm1.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TAXForm1.Set_Color(Value: TColor);
begin
  Color := Value;
end;

procedure TAXForm1.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TAXForm1.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TAXForm1.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TAXForm1.Set_Font(const Value: Font);
begin
  SetOleFont(Font, Value);
end;

procedure TAXForm1.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TAXForm1.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TAXForm1.Set_ModalResult(Value: Integer);
begin
  ModalResult := TModalResult(Value);
end;

procedure TAXForm1.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TAXForm1.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TAXForm1.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TAXForm1.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TAXForm1.Set_WindowState(Value: TxWindowState);
begin
  WindowState := TWindowState(Value);
end;

procedure TAXForm1.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TAXForm1.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TAXForm1.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TAXForm1.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TAXForm1.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TAXForm1.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TAXForm1.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TAXForm1.PaintEvent(Sender: TObject);
begin
  Canvas.Brush.Color := clBlue;
  Canvas.Rectangle (20, 20,
    ClientWidth - 20, ClientHeight - 20);
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TAXForm1.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Color := clYellow;
  Canvas.Ellipse(0, 0, Width, Height);
end;

procedure TAXForm1.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PaintBox1.Canvas.Ellipse (X-10, Y-10, X+10, Y+10);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TAXForm1,
    Class_AXForm1,
    1,
    '');
end.
