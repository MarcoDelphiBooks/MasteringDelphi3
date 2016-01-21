unit MainF;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  ColorGrd, Menus, StdCtrls, ExtCtrls, Tabs, Dialogs;

type
  TForm1 = class(TForm)
    Notebook1: TNotebook;
    TabSet1: TTabSet;
    Label1: TLabel;
    ListBox1: TListBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    ColorGrid1: TColorGrid;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    ChangeButton: TButton;
    ListBox2: TListBox;
    MainMenu1: TMainMenu;
    Page1: TMenuItem;
    One: TMenuItem;
    Two: TMenuItem;
    Three: TMenuItem;
    Four: TMenuItem;
    Five: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MenuPage(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    procedure CheckCurrentPage;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.TabSet1Change(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  Notebook1.PageIndex := NewTab;
  ListBox2.ItemIndex := NewTab;
  CheckCurrentPage;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {set the initial page}
  Notebook1.PageIndex := 0;
  {copy list of pages, and set starting values}
  ListBox1.Items := Notebook1.Pages;
  ListBox2.Items := TabSet1.Tabs;
  ListBox2.ItemIndex := TabSet1.TabIndex;
  Memo1.Lines := TabSet1.Tabs;
  CheckCurrentPage;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  TabSet1.DitherBackground := True;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  TabSet1.DitherBackground := False;
end;

procedure TForm1.ColorGrid1Change(Sender: TObject);
begin
  Form1.Color := ColorGrid1.BackgroundColor;
  TabSet1.BackGroundColor := ColorGrid1.BackgroundColor;
  TabSet1.SelectedColor := ColorGrid1.BackgroundColor;
  TabSet1.UnselectedColor := ColorGrid1.ForegroundColor;
end;

procedure TForm1.ChangeButtonClick(Sender: TObject);
begin
  if Memo1.Lines.Count <> 5 then
    MessageDlg ('Not 5 lines!', mtError, [mbOk], 0)
  else
    TabSet1.Tabs := Memo1.Lines;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
{works with both listboxes}
begin
  Notebook1.PageIndex := (Sender as TListbox).ItemIndex;
  TabSet1.TabIndex := (Sender as TListbox).ItemIndex;
  CheckCurrentPage;
end;

procedure TForm1.MenuPage(Sender: TObject);
begin
  Notebook1.ActivePage := (Sender as TMenuItem).Name;
  TabSet1.TabIndex := Notebook1.PageIndex;
  Listbox2.ItemIndex := Notebook1.PageIndex;
  CheckCurrentPage;
end;

procedure TForm1.CheckCurrentPage;
begin
  // useless code if you use radio menu items
  {One.Checked := False;
  Two.Checked := False;
  Three.Checked := False;
  Four.Checked := False;
  Five.Checked := False;}

  // standard version:
  {case Notebook1.PageIndex of
    0: One.Checked := True;
    1: Two.Checked := True;
    2: Three.Checked := True;
    3: Four.Checked := True;
    4: Five.Checked := True;
  end;}

  // short version:
  Page1.Items [NoteBook1.PageIndex].
    Checked := True;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

