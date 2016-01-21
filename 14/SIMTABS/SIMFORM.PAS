unit Simform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Spin, ExtCtrls, ComCtrls,
  Tabnotbk;

type
  TForm1 = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    ListBoxPages: TListBox;
    Label1: TLabel;
    Label3: TLabel;
    LabelFont: TLabel;
    ButtonChangeFont: TButton;
    FontDialog1: TFontDialog;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    ButtonChangeNTabs: TButton;
    Label2: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonChangeFontClick(Sender: TObject);
    procedure ButtonChangeNTabsClick(Sender: TObject);
    procedure ListBoxPagesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // set the first page
  TabbedNotebook1.PageIndex := 0;
  // initialize components
  ListBoxPages.Items := TabbedNoteBook1.Pages;
  LabelFont.Caption := TabbedNoteBook1.TabFont.Name;
  LabelFont.Font := TabbedNoteBook1.TabFont;
  FontDialog1.Font := TabbedNoteBook1.TabFont;
end;

procedure TForm1.ButtonChangeFontClick(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    TabbedNoteBook1.TabFont := FontDialog1.Font;
    LabelFont.Caption := TabbedNoteBook1.TabFont.Name;
    LabelFont.Font := TabbedNoteBook1.TabFont;
  end;
end;

procedure TForm1.ButtonChangeNTabsClick(Sender: TObject);
begin
  TabbedNoteBook1.TabsPerRow := SpinEdit1.Value;
  TabbedNoteBook1.PageIndex := 2;
  MessageDlg ('As you can see, the TabsPerRow property' +
    #13'doesn''t work as it should!',
    mtError, [mbOK], 0);
end;

procedure TForm1.ListBoxPagesClick(Sender: TObject);
begin
  TabbedNotebook1.PageIndex := ListBoxPages.ItemIndex;
end;

end.
