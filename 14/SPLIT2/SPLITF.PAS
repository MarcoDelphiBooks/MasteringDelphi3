unit SplitF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    FontDialog1: TFontDialog;
    HeaderControl1: THeaderControl;
    procedure ListBoxDblClick(Sender: TObject);
    procedure HeaderControl1SectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure FormResize(Sender: TObject);
    procedure HeaderControl1SectionClick(HeaderControl: THeaderControl;
      Section: THeaderSection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ListBoxDblClick(Sender: TObject);
begin
  with Sender as TListbox do
  begin
    FontDialog1.Font := Font;
    if FontDialog1.Execute then
      Font := FontDialog1.Font;
  end;
end;

procedure TForm1.HeaderControl1SectionResize(HeaderControl: THeaderControl;
  Section: THeaderSection);
begin
  ListBox1.Width := HeaderControl1.Sections[0].Width;
  ListBox2.Left := ListBox1.Width;
  ListBox2.Width := HeaderControl1.Sections[1].Width;
  ListBox3.Left := ListBox2.Width + ListBox2.Left;
  ListBox3.Width := Form1.Width -
    HeaderControl1.Sections[0].Width -
    HeaderControl1.Sections[1].Width;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  ListBox2.Height := ListBox1.Height;
  ListBox3.Height := ListBox1.Height;
  HeaderControl1SectionResize(HeaderControl1,
    HeaderControl1.Sections [0]);
end;

procedure TForm1.HeaderControl1SectionClick(HeaderControl: THeaderControl;
  Section: THeaderSection);
begin
  if Section = HeaderControl1.Sections[0] then
    ListBox1.Sorted := True;
  if Section = HeaderControl1.Sections[1] then
    ListBox2.Sorted := True;
  if Section = HeaderControl1.Sections[2] then
    ListBox3.Sorted := True;
end;

end.
