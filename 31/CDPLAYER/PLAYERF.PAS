unit PlayerF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, MPlayer, ExtCtrls, StdCtrls, MmSystem, Spin;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    DiskLabel: TLabel;
    CurPosLabel: TLabel;
    Label1: TLabel;
    Timer1: TTimer;
    Bevel1: TBevel;
    Bevel2: TBevel;
    TrackNumberLabel: TLabel;
    NewButton: TButton;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    GoButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MediaPlayer1PostClick(Sender: TObject; Button: TMPBtnType);
    procedure NewButtonClick(Sender: TObject);
    procedure GoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CheckDisk;
    procedure CheckPosition;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  MediaPlayer1.TimeFormat := tfTMSF;
  MediaPlayer1.Open;
  CheckDisk;
  CheckPosition;
end;

procedure TForm1.CheckDisk;
var
  NTracks, NLen: Integer;
begin
  NTracks := MediaPlayer1.Tracks;
  NLen := MediaPlayer1.Length;
  DiskLabel.Caption := Format (
    'Tracks: %.2d, Length:%.2d:%.2d',
    [NTracks, Mci_TMSF_Minute (NLen),
    Mci_TMSF_Second (NLen)]);
  SpinEdit1.MaxValue := NTracks;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  CheckPosition;
end;

procedure TForm1.CheckPosition;
var
  CurrentTrack, CurrentPos, TrackLen: Integer;
begin
  CurrentPos := MediaPlayer1.Position;
  CurPosLabel.Caption := Format (
    'Position: %.2d:%.2d',
    [Mci_TMSF_Minute (CurrentPos),
    Mci_TMSF_Second (CurrentPos)]);
  CurrentTrack := Mci_TMSF_Track (CurrentPos);
  TrackLen := MediaPlayer1.TrackLength [CurrentTrack];
  TrackNumberLabel.Caption := Format (
    'Current track: %.2d, Length:%.2d:%.2d',
    [CurrentTrack, Mci_MSF_Minute (TrackLen),
    Mci_MSF_Second (TrackLen)]);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MediaPlayer1.Stop;
end;

procedure TForm1.MediaPlayer1PostClick(Sender: TObject;
  Button: TMPBtnType);
begin
  if MediaPlayer1.Mode = mpPlaying then
    Timer1.Enabled := True
  else
    Timer1.Enabled := False;
  CheckPosition;
end;

procedure TForm1.NewButtonClick(Sender: TObject);
begin
  CheckDisk;
  CheckPosition;
end;

procedure TForm1.GoButtonClick(Sender: TObject);
var
  Playing: Boolean;
begin
  Playing := (MediaPlayer1.Mode = mpPlaying);
  if Playing then
    MediaPlayer1.Stop;
  MediaPlayer1.Position :=
    MediaPlayer1.TrackPosition[SpinEdit1.Value];
  CheckPosition;
  if Playing then
    MediaPlayer1.Play;
end;

end.
