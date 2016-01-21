unit ExtBeepF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, MmSystem, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    PlayButton: TButton;
    StopButton: TButton;
    LoopButton: TButton;
    procedure PlayButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure LoopButtonClick(Sender: TObject);
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

procedure TForm1.PlayButtonClick(Sender: TObject);
begin
  PlaySound (PChar (Listbox1.Items [
    ListBox1.ItemIndex]),
    0, snd_Async);
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  PlaySound (nil, 0, 0);
end;

procedure TForm1.LoopButtonClick(Sender: TObject);
begin
  PlaySound (PChar (Listbox1.Items [
    ListBox1.ItemIndex]),
    0, snd_Async or snd_Loop);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.ItemIndex := 0;
end;

end.
