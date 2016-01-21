unit ServerF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DdeMan, StdCtrls, Clipbrd;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    DdeServerItem1: TDdeServerItem;
    CopyButton1: TButton;
    DdeServerConv1: TDdeServerConv;
    DdeServerItem2: TDdeServerItem;
    Edit2: TEdit;
    CopyButton2: TButton;
    DdeServerItem3: TDdeServerItem;
    Edit3: TEdit;
    CopyButton3: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure CopyButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure CopyButton2Click(Sender: TObject);
    procedure CopyButton3Click(Sender: TObject);
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

procedure TForm1.CopyButton1Click(Sender: TObject);
begin
  Clipboard.Open;
  try
    Clipboard.AsText := DdeServerItem1.Text;
    DdeServerItem1.CopyToClipboard;
  finally
    Clipboard.Close;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DdeServerItem1.Text := Edit1.Text;
  DdeServerItem2.Text := Edit2.Text;
  DdeServerItem3.Text := Edit3.Text;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  DdeServerItem2.Text := Edit2.Text;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  DdeServerItem3.Text := Edit3.Text;
end;

procedure TForm1.CopyButton2Click(Sender: TObject);
begin
  Clipboard.Open;
  try
    Clipboard.AsText := DdeServerItem2.Text;
    DdeServerItem2.CopyToClipboard;
  finally
    Clipboard.Close;
  end;
end;

procedure TForm1.CopyButton3Click(Sender: TObject);
begin
  Clipboard.Open;
  try
    Clipboard.AsText := DdeServerItem3.Text;
    DdeServerItem3.CopyToClipboard;
  finally
    Clipboard.Close;
  end;
end;

end.
