unit Frame;

interface

uses Windows, Classes, Graphics, Forms, Controls, Child,
  Menus, SysUtils;

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
    procedure New1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure ArrangeIcons1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
    Counter: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.New1Click(Sender: TObject);
var
  ChildForm: TChildForm;
begin
  Inc (Counter);
  ChildForm := TChildForm.Create (self);
  ChildForm.Caption := ChildForm.Caption + ' ' +
    IntToStr (Counter);
  ChildForm.Show;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
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

end.

