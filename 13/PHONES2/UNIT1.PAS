unit Unit1;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Unit2, Menus, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Email1: TMenuItem;
    ShowModal1: TMenuItem;
    Help1: TMenuItem;
    AboutPhones1: TMenuItem;
    ShowModeless1: TMenuItem;
    CloseModeless1: TMenuItem;
    procedure ShowModal1Click(Sender: TObject);
    procedure ShowModeless1Click(Sender: TObject);
    procedure CloseModeless1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
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
  Form2.ShowModal;
end;

procedure TForm1.ShowModeless1Click(Sender: TObject);
begin
  ShowModal1.Enabled := False;
  ShowModeless1.Enabled := False;
  Form1.CloseModeless1.Enabled := True;
  Form2.Show;
end;

procedure TForm1.CloseModeless1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

