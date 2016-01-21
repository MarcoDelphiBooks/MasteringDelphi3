unit ToolForm;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  Buttons, StdCtrls, Dialogs, ExtCtrls, Spin, ComCtrls;

type
  TToolbarForm = class(TForm)
    Panel1: TPanel;
    SpeedButtonNote: TSpeedButton;
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
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    Hide1: TMenuItem;
    N1: TMenuItem;
    DisableStyles2: TMenuItem;
    DisableSound2: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Print1: TMenuItem;
    N2: TMenuItem;
    procedure SpeedButtonNoteClick(Sender: TObject);
    procedure SpeedButtonLeftClick(Sender: TObject);
    procedure SpeedButtonCenterClick(Sender: TObject);
    procedure SpeedButtonRightClick(Sender: TObject);
    procedure SpeedButtonBoldClick(Sender: TObject);
    procedure SpeedButtonItalicClick(Sender: TObject);
    procedure SpeedButtonUnderlineClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure DisableSound1Click(Sender: TObject);
    procedure DisableStyles1Click(Sender: TObject);
    procedure AboutToolbar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Print1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ToolbarForm: TToolbarForm;

implementation

uses PrintD;

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

procedure TToolbarForm.FormCreate(Sender: TObject);
begin
  ComboBox1.Items := Screen.Fonts; // bug!
  {select the current font}
  ComboBox1.ItemIndex :=
    ComboBox1.Items.IndexOf (Label1.Font.Name);
end;

procedure TToolbarForm.ComboBox1Change(Sender: TObject);
begin
  Label1.Font.Name :=
    ComboBox1.Items [ComboBox1.ItemIndex];
end;

procedure TToolbarForm.PopupMenu1Popup(Sender: TObject);
begin
  DisableSound2.Checked := DisableSound1.Checked;
  DisableStyles2.Checked := DisableStyles1.Checked;
end;

procedure TToolbarForm.Edit1Change(Sender: TObject);
begin
  Label1.Font.Size := UpDown1.Position;
end;

procedure TToolbarForm.Print1Click(Sender: TObject);
begin
  if PrintDlg.ShowModal = mrOk then
  begin
    case PrintDlg.RadioGroup1.ItemIndex of
      0: PrintScale := poNone;
      1: PrintScale := poProportional;
      2: PrintScale := poPrintToFit;
    end;
  Print;
  end;
end;

end.

