unit OutliF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, Grids, Outline, ExtCtrls;

type
  TForm1 = class(TForm)
    Outline1: TOutline;
    MainMenu1: TMainMenu;
    Style1: TMenuItem;
    PictureText1: TMenuItem;
    PlusMinusPictureText1: TMenuItem;
    PlusMinusText1: TMenuItem;
    Text1: TMenuItem;
    TreePictureText1: TMenuItem;
    TreeText1: TMenuItem;
    Options1: TMenuItem;
    DrawTreeRoot1: TMenuItem;
    DrawFocusRect1: TMenuItem;
    StretchBitmaps1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    Font1: TMenuItem;
    FontDialog1: TFontDialog;
    procedure Exit1Click(Sender: TObject);
    procedure PictureText1Click(Sender: TObject);
    procedure PlusMinusPictureText1Click(Sender: TObject);
    procedure PlusMinusText1Click(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure TreePictureText1Click(Sender: TObject);
    procedure TreeText1Click(Sender: TObject);
    procedure DrawTreeRoot1Click(Sender: TObject);
    procedure DrawFocusRect1Click(Sender: TObject);
    procedure StretchBitmaps1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.PictureText1Click(Sender: TObject);
begin
  Outline1.OutlineStyle := osPictureText;
  PictureText1.Checked := True;
end;

procedure TForm1.PlusMinusPictureText1Click(Sender: TObject);
begin
  Outline1.OutlineStyle := osPlusMinusPictureText;
  PlusMinusPictureText1.Checked := True;
end;

procedure TForm1.PlusMinusText1Click(Sender: TObject);
begin
  Outline1.OutlineStyle := osPlusMinusText;
  PlusMinusText1.Checked := True;
end;

procedure TForm1.Text1Click(Sender: TObject);
begin
  Outline1.OutlineStyle := osText;
  Text1.Checked := True;
end;

procedure TForm1.TreePictureText1Click(Sender: TObject);
begin
  Outline1.OutlineStyle := osTreePictureText;
  TreePictureText1.Checked := True;
end;

procedure TForm1.TreeText1Click(Sender: TObject);
begin
  Outline1.OutlineStyle := osTreeText;
  TreeText1.Checked := True;
end;

procedure TForm1.DrawTreeRoot1Click(Sender: TObject);
begin
  if ooDrawTreeRoot in Outline1.Options then
    Outline1.Options := Outline1.Options - [ooDrawTreeRoot]
  else
    Outline1.Options := Outline1.Options + [ooDrawTreeRoot];
  DrawTreeRoot1.Checked := not DrawTreeRoot1.Checked;
end;

procedure TForm1.DrawFocusRect1Click(Sender: TObject);
begin
  if ooDrawFocusRect in Outline1.Options then
    Outline1.Options := Outline1.Options - [ooDrawFocusRect]
  else
    Outline1.Options := Outline1.Options + [ooDrawFocusRect];
  DrawFocusRect1.Checked := not DrawFocusRect1.Checked;
end;

procedure TForm1.StretchBitmaps1Click(Sender: TObject);
begin
  if ooStretchBitmaps in Outline1.Options then
    Outline1.Options := Outline1.Options - [ooStretchBitmaps]
  else
    Outline1.Options := Outline1.Options + [ooStretchBitmaps];
  StretchBitmaps1.Checked := not StretchBitmaps1.Checked;
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  FontDialog1.Font := Outline1.Font;
  if FontDialog1.Execute then
    Outline1.Font := FontDialog1.Font;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Outline of the book: "Mastering Delphi"' +
    Chr(13) + 'Author: Marco Cantù',
    mtInformation, [mbOk], 0);
end;

end.

