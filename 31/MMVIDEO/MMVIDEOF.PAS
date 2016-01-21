unit MMVideoF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, MPlayer, ExtCtrls;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    procedure Panel1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Panel1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MediaPlayer1.FileName := OpenDialog1.Filename;
    MediaPlayer1.Open;
    MediaPlayer1.Perform (wm_LButtonDown, 0, $00090009);
    MediaPlayer1.Perform (wm_LButtonUp, 0, $00090009);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MediaPlayer1.Close;
end;

end.
