unit Unit1;

interface

uses Windows, Classes, Graphics, Forms, Controls,
  Unit2, Menus, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    OPen1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Email1: TMenuItem;
    ShowModal1: TMenuItem;
    Help1: TMenuItem;
    AboutPhones1: TMenuItem;
    ShowModeless1: TMenuItem;
    procedure ShowModal1Click(Sender: TObject);
    procedure ShowModeless1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShowModal1Click(Sender: TObject);
begin
  Form2 := TForm2.Create (Application);
  Form2.MainMenu1.AutoMerge := False;
  Form2.ShowModal;
  Form2.Free;
end;

procedure TForm1.ShowModeless1Click(Sender: TObject);
begin
  Form2 := TForm2.Create (Application);
  Form2.MainMenu1.AutoMerge := True;
  Form2.Show;
end;

end.

