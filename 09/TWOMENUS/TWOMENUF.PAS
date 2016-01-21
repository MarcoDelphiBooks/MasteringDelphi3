unit TwoMenuF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MainMenu2: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Basic1: TMenuItem;
    Basiccommand1: TMenuItem;
    Basiccommand2: TMenuItem;
    Basiccommand3: TMenuItem;
    Basiccommand4: TMenuItem;
    Basiccommand5: TMenuItem;
    Basiccommand6: TMenuItem;
    Basiccommand7: TMenuItem;
    Advanced1: TMenuItem;
    Advancedcommand1: TMenuItem;
    Advancedcommand2: TMenuItem;
    Advancedcommand3: TMenuItem;
    Advancedcommand4: TMenuItem;
    Advancedcommand5: TMenuItem;
    Advancedcommand6: TMenuItem;
    Advancedcommand7: TMenuItem;
    Advancedcommand8: TMenuItem;
    Options1: TMenuItem;
    BasicOptions1: TMenuItem;
    AdvancedOptions1: TMenuItem;
    MoreOptions1: TMenuItem;
    N2: TMenuItem;
    ShortMenus1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    File2: TMenuItem;
    Exit2: TMenuItem;
    N3: TMenuItem;
    Saveas2: TMenuItem;
    Save2: TMenuItem;
    Open2: TMenuItem;
    New2: TMenuItem;
    Basic2: TMenuItem;
    Basiccommand8: TMenuItem;
    Basiccommand9: TMenuItem;
    Basiccommand10: TMenuItem;
    Basiccommand11: TMenuItem;
    Basiccommand12: TMenuItem;
    Basiccommand13: TMenuItem;
    Basiccommand14: TMenuItem;
    Options2: TMenuItem;
    LongMenus1: TMenuItem;
    N4: TMenuItem;
    BasicOptions2: TMenuItem;
    Help2: TMenuItem;
    About2: TMenuItem;
    procedure ShortMenus1Click(Sender: TObject);
    procedure LongMenus1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShortMenus1Click(Sender: TObject);
begin
  {activate short menu}
  Form1.Menu := MainMenu2;
end;

procedure TForm1.LongMenus1Click(Sender: TObject);
begin
  {activate long menu}
  Form1.Menu := MainMenu1;
end;

end.
