unit XItalyI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, XFMultiLib, ExtCtrls, StdCtrls;

type
  TXItaly = class(TActiveForm, IXItaly)
    Notebook1: TNotebook;
    Label1: TLabel;
    ButtonStart: TButton;
    Memo1: TMemo;
    ButtonGo: TButton;
    Label2: TLabel;
    ButtonFamous: TButton;
    ButtonOther: TButton;
    Memo2: TMemo;
    ButtonFine: TButton;
    Memo3: TMemo;
    ButtonFine2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonInfo: TButton;
    ButtonBye: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    ButtonFirst: TButton;
    ButtonPrevious: TButton;
    ButtonNext: TButton;
    ButtonLast: TButton;
    procedure ButtonFirstClick(Sender: TObject);
    procedure ButtonLastClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure ButtonPreviousClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure ButtonFamousClick(Sender: TObject);
    procedure ButtonOtherClick(Sender: TObject);
    procedure ButtonFineClick(Sender: TObject);
    procedure ButtonInfoClick(Sender: TObject);
    procedure ButtonByeClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IXItalyEvents;
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

{ TXItaly }

procedure TXItaly.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IXItalyEvents;
end;

procedure TXItaly.Initialize;
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

function TXItaly.CloseQuery: WordBool;
begin

end;

function TXItaly.Get_Active: WordBool;
begin
  Result := Active;
end;

function TXItaly.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TXItaly.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TXItaly.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TXItaly.Get_Color: TColor;
begin
  Result := Color;
end;

function TXItaly.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TXItaly.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TXItaly.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TXItaly.Get_Font: Font;
begin
  GetOleFont(Font, Result);
end;

function TXItaly.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TXItaly.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TXItaly.Get_ModalResult: Integer;
begin
  Result := Integer(ModalResult);
end;

function TXItaly.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TXItaly.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TXItaly.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TXItaly.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TXItaly.Get_WindowState: TxWindowState;
begin
  Result := Ord(WindowState);
end;

function TXItaly.ShowModal: Integer;
begin

end;

procedure TXItaly.Close;
begin

end;

procedure TXItaly.DisableAutoRange;
begin

end;

procedure TXItaly.EnableAutoRange;
begin

end;

procedure TXItaly.Print;
begin

end;

procedure TXItaly.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TXItaly.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TXItaly.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TXItaly.Set_Color(Value: TColor);
begin
  Color := Value;
end;

procedure TXItaly.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TXItaly.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TXItaly.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TXItaly.Set_Font(const Value: Font);
begin
  SetOleFont(Font, Value);
end;

procedure TXItaly.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TXItaly.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TXItaly.Set_ModalResult(Value: Integer);
begin
  ModalResult := TModalResult(Value);
end;

procedure TXItaly.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TXItaly.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TXItaly.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TXItaly.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TXItaly.Set_WindowState(Value: TxWindowState);
begin
  WindowState := TWindowState(Value);
end;

procedure TXItaly.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TXItaly.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TXItaly.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TXItaly.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TXItaly.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TXItaly.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TXItaly.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TXItaly.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TXItaly.ButtonFirstClick(Sender: TObject);
begin
  Notebook1.PageIndex := 0;
  ButtonFirst.Enabled := False;
  ButtonPrevious.Enabled := False;
  ButtonNext.Enabled := True;
  ButtonLast.Enabled := True;
end;

procedure TXItaly.ButtonLastClick(Sender: TObject);
begin
  Notebook1.PageIndex := 6;
  ButtonFirst.Enabled := True;
  ButtonPrevious.Enabled := True;
  ButtonNext.Enabled := False;
  ButtonLast.Enabled := False;
end;

procedure TXItaly.ButtonNextClick(Sender: TObject);
begin
  if Notebook1.PageIndex < 6 then
    Notebook1.PageIndex := Notebook1.PageIndex + 1;
  if Notebook1.PageIndex = 6 then
    begin
      ButtonNext.Enabled := False;
      ButtonLast.Enabled := False;
    end
  else
    begin
      ButtonNext.Enabled := True;
      ButtonLast.Enabled := True;
    end;
  ButtonFirst.Enabled := True;
  ButtonPrevious.Enabled := True;
end;

procedure TXItaly.ButtonPreviousClick(Sender: TObject);
begin
  if Notebook1.PageIndex > 0 then
    Notebook1.PageIndex := Notebook1.PageIndex - 1;
  if Notebook1.PageIndex = 0 then
    begin
      ButtonFirst.Enabled := False;
      ButtonPrevious.Enabled := False;
    end
  else
    begin
      ButtonFirst.Enabled := True;
      ButtonPrevious.Enabled := True;
    end;
  ButtonNext.Enabled := True;
  ButtonLast.Enabled := True;
end;

procedure TXItaly.ButtonStartClick(Sender: TObject);
begin
  Notebook1.PageIndex := 1;
  ButtonFirst.Enabled := True;
  ButtonPrevious.Enabled := True;
end;

procedure TXItaly.ButtonGoClick(Sender: TObject);
begin
  Notebook1.PageIndex := 2;
end;

procedure TXItaly.ButtonFamousClick(Sender: TObject);
begin
  Notebook1.PageIndex := 3;
end;



procedure TXItaly.ButtonOtherClick(Sender: TObject);
begin
  Notebook1.PageIndex := 4;
end;

procedure TXItaly.ButtonFineClick(Sender: TObject);
begin
  Notebook1.PageIndex := 5;
end;

procedure TXItaly.ButtonInfoClick(Sender: TObject);
begin
  Notebook1.PageIndex := 2;
end;

procedure TXItaly.ButtonByeClick(Sender: TObject);
begin
  Notebook1.PageIndex := 6;
  ButtonLast.Enabled := False;
  ButtonNext.Enabled := False;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TXItaly,
    Class_XItaly,
    1,
    '');
end.
