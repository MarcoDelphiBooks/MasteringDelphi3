unit MMSoundF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    FileLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionLabel: TLabel;
    NewButton: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    NotifLabel: TLabel;
    procedure NewButtonClick(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.NewButtonClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    FileLabel.Caption := OpenDialog1.Filename;
    MediaPlayer1.Filename := OpenDialog1.Filename;
    MediaPlayer1.Open;
    MediaPlayer1.Notify := True;
  end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
  case MediaPlayer1.NotifyValue of
    nvSuccessful : NotifLabel.Caption := 'Success';
    nvSuperseded : NotifLabel.Caption := 'Superseded';
    nvAborted    : NotifLabel.Caption := 'Aborted';
    nvFailure    : NotifLabel.Caption := 'Failure';
  end;
  MediaPlayer1.Notify := True;
end;

procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
  case Button of
    btPlay: ActionLabel.Caption := 'Playing';
    btPause: ActionLabel.Caption := 'Paused';
    btStop: ActionLabel.Caption := 'Stopped';
    btNext: ActionLabel.Caption := 'Next';
    btPrev: ActionLabel.Caption := 'Previous';
  end;
end;

end.
