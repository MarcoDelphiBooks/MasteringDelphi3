unit RefForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    LargeIcons1: TMenuItem;
    SmallIcons1: TMenuItem;
    List1: TMenuItem;
    Details1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure LargeIcons1Click(Sender: TObject);
    procedure SmallIcons1Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure Details1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
{$R BITMAPS.RES}

procedure TForm1.FormCreate(Sender: TObject);
var
  ImageList2: TImageList;
begin
  ImageList2 := TImageList.Create (self);
  ImageList2.ResourceLoad(rtBitmap,
    'SmallImages', clOlive);
  ListView1.SmallImages := ImageList2;

  ListView1.Arrange (arDefault);
end;

procedure TForm1.LargeIcons1Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsIcon;
  LargeIcons1.Checked := True;
end;

procedure TForm1.SmallIcons1Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsSmallIcon;
  SmallIcons1.Checked := True;
end;

procedure TForm1.List1Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsList;
  List1.Checked := True;
end;

procedure TForm1.Details1Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsReport;
  Details1.Checked := True;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Reference List (ListView example)' +
    #13'from "Mastering Delphi"'#13'author: Marco Cantù',
    mtInformation, [mbOk], 0);
end;

end.
