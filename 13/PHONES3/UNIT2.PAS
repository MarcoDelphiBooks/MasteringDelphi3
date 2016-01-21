unit Unit2;

interface

uses Windows, Classes, Graphics, Forms, Controls,
  Menus, StdCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    EMail1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    procedure Close1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

uses Unit1;

procedure TForm2.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

