unit MenuOneF;

interface

uses Windows, Classes, Graphics, Forms, Controls, 
  StdCtrls, Menus, Dialogs, ExtCtrls;

type
  TFormColorText = class(TForm)
    Label1: TLabel;
    ColorDialog1: TColorDialog;
    MainMenu1: TMainMenu;
    FontDialog1: TFontDialog;
    Options1: TMenuItem;
    Font1: TMenuItem;
    BackColor1: TMenuItem;
    N1: TMenuItem;
    Left1: TMenuItem;
    Center1: TMenuItem;
    Right1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    Toolbar1: TMenuItem;
    Panel1: TPanel;
    BtnLeft: TButton;
    BtnFontColor: TButton;
    BtnCenter: TButton;
    BtnBackColor: TButton;
    BtnRight: TButton;
    HideLabel1: TMenuItem;
    N2: TMenuItem;
    FixedFont1: TMenuItem;
    N3: TMenuItem;
    FixedView1: TMenuItem;
    DisableHelp1: TMenuItem;
    procedure About1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure BackColor1Click(Sender: TObject);
    procedure Left1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
    procedure Right1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Toolbar1Click(Sender: TObject);
    procedure HideLabel1Click(Sender: TObject);
    procedure FixedFont1Click(Sender: TObject);
    procedure FixedView1Click(Sender: TObject);
    procedure DisableHelp1Click(Sender: TObject);
  end;

var
  FormColorText: TFormColorText;

implementation

{$R *.DFM}

procedure ToggleCheck (Item: TMenuItem);
begin
  Item.Checked := not Item.Checked;
end;

procedure TFormColorText.About1Click(Sender: TObject);
begin
  MessageDlg ('MenuOne is the first example' + #13 +
    'with a menu of the book ' + #13 +
    '"Mastering Delphi 3" written by Marco Cant�',
    mtInformation, [mbOk], 0);
end;

procedure TFormColorText.Font1Click(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font := Label1.Font;
    if Execute then
      Label1.Font := Font;
  end;
end;

procedure TFormColorText.BackColor1Click(Sender: TObject);
begin
  with ColorDialog1 do
  begin
    Color := Label1.Color;
    if Execute then
      Label1.Color := Color;
  end;
end;

procedure TFormColorText.Left1Click(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
  Left1.Checked := True;
  Center1.Checked := False;
  Right1.Checked := False;
end;

procedure TFormColorText.Center1Click(Sender: TObject);
begin
  Label1.Alignment := taCenter;
  Left1.Checked := False;
  Center1.Checked := True;
  Right1.Checked := False;
end;

procedure TFormColorText.Right1Click(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
  Left1.Checked := False;
  Center1.Checked := False;
  Right1.Checked := True;
end;

procedure TFormColorText.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormColorText.Toolbar1Click(Sender: TObject);
begin
  Panel1.Visible := not Panel1.Visible;
  Toolbar1.Checked := Panel1.Visible;
end;

procedure TFormColorText.HideLabel1Click(Sender: TObject);
begin
  Label1.Visible := not Label1.Visible;
  if Label1.Visible then
    HideLabel1.Caption := 'Hide &Label'
  else
    HideLabel1.Caption := 'Show &Label'
end;

procedure TFormColorText.FixedFont1Click(Sender: TObject);
begin
  ToggleCheck (FixedFont1);
  Font1.Enabled := not Font1.Enabled;
end;

procedure TFormColorText.FixedView1Click(Sender: TObject);
begin
  ToggleCheck (FixedView1);
  View1.Visible := not View1.Visible;
end;

procedure TFormColorText.DisableHelp1Click(Sender: TObject);
begin
  ToggleCheck (DisableHelp1);
  Help1.Enabled := not Help1.Enabled;
end;

end.

