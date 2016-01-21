unit BackpF;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Spin, ComCtrls;

type
  TForm1 = class(TForm)
    HourButton: TButton;
    IdleButton: TButton;
    TimerButton: TButton;
    ProcButton: TButton;
    Timer1: TTimer;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    HourLabel: TLabel;
    TimerLabel: TLabel;
    ProcLabel: TLabel;
    IdleLabel: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    procedure HourButtonClick(Sender: TObject);
    procedure TimerButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ProcButtonClick(Sender: TObject);
    procedure IdleButtonClick(Sender: TObject);
  private
    TimerNumber, TimerNPrimes, TimerMax: LongInt;
    IdleNumber, IdleNPrimes, IdleMax: LongInt;
  public
    procedure IdleProc (Sender: TObject; var Done: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{function local to the unit}
function IsPrime (N: LongInt): Boolean;
var
  Test: LongInt;
begin
  IsPrime := True;
  for Test := 2 to N - 1 do
  begin
    if (N mod Test) = 0 then
    begin
      IsPrime := False;
      break; {jump out of the for loop}
    end;
  end;
end;

procedure TForm1.HourButtonClick(Sender: TObject);
var
  Number, NPrimes, Max: LongInt;
begin
  Screen.Cursor := crHourglass;
  try
    NPrimes := 0;
    Max := SpinEdit1.Value;
    HourLabel.Caption := 'Computing...';
    for Number := 2 to Max do
    begin
      if IsPrime (Number) then
        Inc (NPrimes);
      ProgressBar1.Position := Number * 100 div Max;

      Application.ProcessMessages;

    end;
    HourLabel.Caption := IntToStr (NPrimes) +
      ' below ' + IntToStr (Max);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.TimerButtonClick(Sender: TObject);
begin
  TimerNPrimes := 0;
  TimerMax := SpinEdit1.Value;
  TimerNumber := 2;
  Timer1.Enabled := True;
  ProgressBar2.Position := 0;
  TimerLabel.Caption := 'Computing...';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if TimerNumber < TimerMax then
  begin
    if IsPrime (TimerNumber) then
      Inc (TimerNPrimes);
    Inc (TimerNumber);
  end
  else
  begin
    Timer1.Enabled := False;
    TimerLabel.Caption := IntToStr (TimerNPrimes) +
      ' below ' + IntToStr (TimerMax);
    Beep;
  end;
  ProgressBar2.Position := TimerNumber * 100 div TimerMax;
end;

procedure TForm1.ProcButtonClick(Sender: TObject);
var
  Number, NPrimes, Max: LongInt;
begin
  NPrimes := 0;
  Max := SpinEdit1.Value;
  ProcLabel.Caption := 'Computing...';
  ProgressBar3.Position := 0;
  for Number := 2 to Max do
  begin
    if IsPrime (Number) then
      Inc (NPrimes);
    ProgressBar3.Position := Number * 100 div Max;
    Application.ProcessMessages;
  end;
  ProcLabel.Caption := IntToStr (NPrimes) +
    ' below ' + IntToStr (Max);
  Beep;
end;

procedure TForm1.IdleButtonClick(Sender: TObject);
begin
  IdleNPrimes := 0;
  IdleMax := SpinEdit1.Value;
  IdleNumber := 2;
  Application.OnIdle := IdleProc;
  ProgressBar4.Position := 0;
  IdleLabel.Caption := 'Computing...';
end;

procedure TForm1.IdleProc (Sender: TObject; var Done: Boolean);
begin
  if IdleNumber < IdleMax then
  begin
    if IsPrime (IdleNumber) then
      Inc (IdleNPrimes);
    Inc (IdleNumber);
    Done := False;
  end
  else
  begin
    IdleLabel.Caption := IntToStr (IdleNPrimes) +
      ' below ' + IntToStr (IdleMax);
    Done := True;
    Beep;
    Application.OnIdle := nil;
  end;
  ProgressBar4.Position := IdleNumber * 100 div IdleMax;
end;

end.
