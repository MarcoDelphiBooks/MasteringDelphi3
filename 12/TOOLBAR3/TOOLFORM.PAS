unit ToolForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls,
  Menus, Buttons, StdCtrls, Dialogs, ExtCtrls;

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
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Toolbar1: TMenuItem;
    Visible1: TMenuItem;
    DisableSound1: TMenuItem;
    DisableStyles1: TMenuItem;
    Help1: TMenuItem;
    AboutToolbar1: TMenuItem;
    DisableSize1: TMenuItem;
    N1: TMenuItem;
    HintColor1: TMenuItem;
    ColorDialog1: TColorDialog;
    FlatStyle1: TMenuItem;
    procedure SpeedButtonNoteClick(Sender: TObject);
    procedure SpeedButtonLeftClick(Sender: TObject);
    procedure SpeedButtonCenterClick(Sender: TObject);
    procedure SpeedButtonRightClick(Sender: TObject);
    procedure SpeedButtonBoldClick(Sender: TObject);
    procedure SpeedButtonItalicClick(Sender: TObject);
    procedure SpeedButtonUnderlineClick(Sender: TObject);
    procedure SpeedButtonBigClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure DisableSound1Click(Sender: TObject);
    procedure DisableStyles1Click(Sender: TObject);
    procedure AboutToolbar1Click(Sender: TObject);
    procedure DisableSize1Click(Sender: TObject);
    procedure HintColor1Click(Sender: TObject);
    procedure FlatStyle1Click(Sender: TObject);
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
  begin
    Label1.Font.Size := 24;
    SpeedButtonBig.Hint := 'Shrink';
  end
  else
  begin
    Label1.Font.Size := 12;
    SpeedButtonBig.Hint := 'Expand';
  end;
end;

procedure TToolbarForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TToolbarForm.Visible1Click(Sender: TObject);
begin
  {hide or display the toolbar, setting the maneitem checkmark}
  Panel1.Visible := not Panel1.Visible;
  Visible1.Checked := not Visible1.Checked;
end;

procedure TToolbarForm.DisableSound1Click(Sender: TObject);
begin
  {disable or enable button and set menu check mark}
  SpeedButtonNote.Enabled := not SpeedButtonNote.Enabled;
  DisableSound1.Checked := not DisableSound1.Checked;
end;

procedure TToolbarForm.DisableStyles1Click(Sender: TObject);
begin
  {disable or enable buttons and set menu text properly}
  if SpeedButtonBold.Enabled then
  begin
    SpeedButtonBold.Enabled := False;
    SpeedButtonItalic.Enabled := False;
    SpeedButtonUnderline.Enabled := False;
    DisableStyles1.Checked := True;
  end
  else
  begin
    SpeedButtonBold.Enabled := True;
    SpeedButtonItalic.Enabled := True;
    SpeedButtonUnderline.Enabled := True;
    DisableStyles1.Checked := False;
  end;
end;

procedure TToolbarForm.AboutToolbar1Click(Sender: TObject);
begin
  MessageDlg ('Toolbar example for "Mastering Delphi"' +
    Chr (13) +  'Written by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TToolbarForm.DisableSize1Click(Sender: TObject);
begin
  SpeedButtonBig.Enabled := not SpeedButtonBig.Enabled;
  DisableSize1.Checked := not DisableSize1.Checked;
end;

procedure TToolbarForm.HintColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := Application.HintColor;
  if ColorDialog1.Execute then
    Application.HintColor := ColorDialog1.Color;
end;

procedure TToolbarForm.FlatStyle1Click(Sender: TObject);
var
  I: Integer;
begin
  FlatStyle1.Checked := not FlatStyle1.Checked;
  for I := 0 to Panel1.ControlCount - 1 do
    (Panel1.Controls [I] as TSpeedButton).Flat :=
       FlatStyle1.Checked;
end;

end.

