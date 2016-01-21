unit Viewer;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, FileCtrl, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    FileListBox1: TFileListBox;
    Panel1: TPanel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    TabControl1: TTabControl;
    Image1: TImage;
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
  with FileListBox1 do
    if Items.Count = 0 then
    begin
      TabControl1.Tabs.Clear;
      Image1.Visible := False;
      TabControl1.Tabs.Add ('None');
    end
    else
    begin
      Image1.Visible := True;
      TabControl1.Tabs := FileListBox1.Items;
    end;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  with TabControl1 do
    if Tabs [TabIndex] <> 'None' then
      Image1.Picture.LoadFromFile (Tabs [TabIndex]);
end;

end.

