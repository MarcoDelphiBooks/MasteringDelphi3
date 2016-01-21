unit ServerF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DdeMan, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    DdeServerItem1: TDdeServerItem;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Edit1Change(Sender: TObject);
begin
  DdeServerItem1.Text := Edit1.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DdeServerItem1.Text := Edit1.Text;
end;

end.
