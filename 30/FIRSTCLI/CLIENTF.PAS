unit ClientF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DdeMan;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    DdeClientItem1: TDdeClientItem;
    DdeClientConv1: TDdeClientConv;
    procedure DdeClientItem1Change(Sender: TObject);
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

procedure TForm1.DdeClientItem1Change(Sender: TObject);
begin
  Edit1.Text := DdeClientItem1.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if DdeClientConv1.SetLink ('firstser', 'First Server') then
  begin
    DdeClientItem1.DdeItem := 'DdeServerItem1';
    ShowMessage ('Connected');
  end
  else
    ShowMessage ('Error');
end;

end.
