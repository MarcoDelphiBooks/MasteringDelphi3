unit MainF;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, SysUtils,
  Tabs, ColorGrd, StdCtrls, ExtCtrls, Dialogs;

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
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure ColorGrid1Change(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
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
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.Items := Notebook1.Pages;
  Memo1.Lines := TabSet1.Tabs;
  {reset the page}
  Notebook1.PageIndex := 0;
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
  if Memo1.Lines.Count <> TabSet1.Tabs.Count then
    MessageDlg (
      Format ('Not %d lines!', [TabSet1.Tabs.Count]),
      mtError, [mbOk], 0)
  else
    TabSet1.Tabs := Memo1.Lines;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  Notebook1.PageIndex := Listbox1.ItemIndex;
  TabSet1.TabIndex := Listbox1.ItemIndex;
end;

end.

