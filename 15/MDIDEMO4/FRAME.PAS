unit Frame;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Child, Child2, Menus, SysUtils, Dialogs;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Window1: TMenuItem;
    New1: TMenuItem;
    File1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    ArrangeIcons1: TMenuItem;
    New2: TMenuItem;
    Tile2: TMenuItem;
    CloseAll1: TMenuItem;
    Count1: TMenuItem;
    procedure New1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeIcons1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New2Click(Sender: TObject);
    procedure Tile2Click(Sender: TObject);
    procedure CloseAll1Click(Sender: TObject);
    procedure Count1Click(Sender: TObject);
  private
    { Private declarations }
    Count: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.New1Click(Sender: TObject);
var
  ChildForm: TCircleChildForm;
begin
  Inc (Count);
  ChildForm := TCircleChildForm.Create (self);
  ChildForm.Caption := ChildForm.Caption + ' ' +
    IntToStr (Count);
  ChildForm.Show;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TMainForm.ArrangeIcons1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.New2Click(Sender: TObject);
var
  ChildForm: TBounceChildForm;
begin
  Inc (Count);
  ChildForm := TBounceChildForm.Create (self);
  ChildForm.Caption := ChildForm.Caption + ' ' +
    IntToStr (Count);
  ChildForm.Show;
end;

procedure TMainForm.Tile2Click(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TMainForm.CloseAll1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to MDIChildCount - 1 do
    MDIChildren [I].Close;
end;

procedure TMainForm.Count1Click(Sender: TObject);
var
  NBounce, NCircle, I: Integer;
begin
  NBounce := 0;
  NCircle := 0;
  for I := 0 to MDIChildCount - 1 do
    if MDIChildren [I] is TBounceChildForm then
      Inc (NBounce)
    else
      Inc (NCircle);
  MessageDlg (
    Format ('There are %d child forms.'#13 +
      '%d are Circle child windows and ' +
      '%d are Bouncing child windows',
      [MDIChildCount, NCircle, NBounce]),
    mtINformation, [mbOk], 0);
end;

end.

