unit HShortF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    A1: TMenuItem;
    B1: TMenuItem;
    Label1: TLabel;
    procedure A1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.A1Click(Sender: TObject);
begin
  ShowMessage ('Control + A pressed');
end;

procedure TForm1.B1Click(Sender: TObject);
begin
  ShowMessage ('Control + B pressed');
end;

end.
