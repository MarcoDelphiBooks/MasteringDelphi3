unit DatasF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DdeMan, ExtCtrls, StdCtrls, Clipbrd;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    DdeServerItem1: TDdeServerItem;
    Label1: TLabel;
    CopyButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  I, Value: Integer;
begin
  for I := 0 to 4 do
  begin
    Value := StrToIntDef (Memo1.Lines [I], 50);
    Value := Value + Random (21) - 10;
    Memo1.Lines [I] := IntToStr (Value);
  end;
  DdeServerItem1.Lines := Memo1.Lines;
end;

procedure TForm1.CopyButtonClick(Sender: TObject);
begin
  Clipboard.Open;
  try
    Clipboard.AsText := Memo1.Text;
    DdeServerItem1.CopyToClipboard;
  finally
    Clipboard.Close;
  end;
end;

end.
