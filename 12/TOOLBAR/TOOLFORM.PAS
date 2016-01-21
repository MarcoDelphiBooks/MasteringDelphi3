unit ToolForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms,
  Controls, Menus, Buttons, StdCtrls, ExtCtrls;

type
  TToolbarForm = class(TForm)
    Panel1: TPanel;
    SpeedButtonNote: TSpeedButton;
    SpeedButtonBig: TSpeedButton;
    SpeedButtonBold: TSpeedButton;
    SpeedButtonItalic: TSpeedButton;
    SpeedButtonUnderline: TSpeedButton;
    SpeedButtonLeft: TSpeedButton;
    SpeedButtonCenter: TSpeedButton;
    SpeedButtonRight: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButtonNoteClick(Sender: TObject);
    procedure SpeedButtonLeftClick(Sender: TObject);
    procedure SpeedButtonCenterClick(Sender: TObject);
    procedure SpeedButtonRightClick(Sender: TObject);
    procedure SpeedButtonBoldClick(Sender: TObject);
    procedure SpeedButtonItalicClick(Sender: TObject);
    procedure SpeedButtonUnderlineClick(Sender: TObject);
    procedure SpeedButtonBigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ToolbarForm: TToolbarForm;

implementation

{$R *.DFM}

procedure TToolbarForm.SpeedButtonNoteClick(Sender: TObject);
begin
  Beep;
end;

procedure TToolbarForm.SpeedButtonLeftClick(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
end;

procedure TToolbarForm.SpeedButtonCenterClick(Sender: TObject);
begin
  Label1.Alignment := taCenter;
end;

procedure TToolbarForm.SpeedButtonRightClick(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
end;

procedure TToolbarForm.SpeedButtonBoldClick(Sender: TObject);
begin
  if SpeedButtonBold.Down then
    Label1.Font.Style := [fsBold]
  else
    Label1.Font.Style := [];
end;

procedure TToolbarForm.SpeedButtonItalicClick(Sender: TObject);
begin
  if SpeedButtonItalic.Down then
    Label1.Font.Style := [fsItalic]
  else
    Label1.Font.Style := [];
end;

procedure TToolbarForm.SpeedButtonUnderlineClick(Sender: TObject);
begin
  if SpeedButtonUnderline.Down then
    Label1.Font.Style := [fsUnderline]
  else
    Label1.Font.Style := [];
end;

procedure TToolbarForm.SpeedButtonBigClick(Sender: TObject);
begin
  if SpeedButtonBig.Down then
    Label1.Font.Size := 24
  else
    Label1.Font.Size := 12;
end;

end.

