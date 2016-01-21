unit MMVideoF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, MPlayer, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    OpenDialog1: TOpenDialog;
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    Playing: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
  Playing := False;
  Caption := 'MMV (Stopped)';
  Hint := 'Click to play video';
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  MediaPlayer1.DisplayRect := ClientRect;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  if MediaPlayer1.FileName = '' then
    if OpenDialog1.Execute then
    begin
      MediaPlayer1.FileName :=
        OpenDialog1.FileName;
      MediaPlayer1.Open;
      Playing := False;
    end
    else
      exit; // stop if no file is selected

  if Playing then
  begin
    MediaPlayer1.Stop;
    Playing := False;
    Caption := 'MM Video (Stopped)';
    Hint := 'Click to play video';
  end
  else
  begin
    MediaPlayer1.Display := self;
    MediaPlayer1.DisplayRect := ClientRect;
    MediaPlayer1.Play;
    Playing := True;
    Caption := 'MMV (Playing)';
    Hint := 'Click to stop video';
  end;
end;

end.
