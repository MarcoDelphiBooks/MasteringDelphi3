unit BackPF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Gauges, ExtCtrls, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    HourButton: TButton;
    IdleButton: TButton;
    TimerButton: TButton;
    ProcButton: TButton;
    Timer1: TTimer;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    HourLabel: TLabel;
    TimerLabel: TLabel;
    ProcLabel: TLabel;
    IdleLabel: TLabel;
    Label2: TLabel;
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

{$IFDEF DEBUG}
uses DebugF;
{$ENDIF}

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
  {$IFDEF DEBUG}
  WriteLine ('HourButtonClick');
  {$ENDIF}
  Screen.Cursor := crHourglass;
  NPrimes := 0;
  Max := SpinEdit1.Value;
  HourLabel.Caption := 'Computing...';
  for Number := 2 to Max do
  begin
    if IsPrime (Number) then
      Inc (NPrimes);
    Gauge1.Progress := Number * 100 div Max;
  end;
  HourLabel.Caption := IntToStr (NPrimes) +
    ' below ' + IntToStr (Max);
  Screen.Cursor := crDefault;
end;

procedure TForm1.TimerButtonClick(Sender: TObject);
begin
  {$IFDEF DEBUG}
  WriteLine ('TimerButtonClick');
  {$ENDIF}
  TimerNPrimes := 0;
  TimerMax := SpinEdit1.Value;
  TimerNumber := 2;
  Timer1.Enabled := True;
  Gauge2.Progress := 0;
  TimerLabel.Caption := 'Computing...';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  {$IFDEF DEBUG}
  WriteLine ('Timer1Timer' + IntToStr (TimerNumber));
  {$ENDIF}
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
    MessageBeep ($FFFF)
  end;
  Gauge2.Progress := TimerNumber * 100 div TimerMax;
end;

procedure TForm1.ProcButtonClick(Sender: TObject);
var
  Number, NPrimes, Max: LongInt;
begin
  {$IFDEF DEBUG}
  WriteLine ('ProcButtonClick');
  {$ENDIF}
  NPrimes := 0;
  Max := SpinEdit1.Value;
  ProcLabel.Caption := 'Computing...';
  Gauge3.Progress := 0;
  for Number := 2 to Max do
  begin
    if IsPrime (Number) then
      Inc (NPrimes);
    Gauge3.Progress := Number * 100 div Max;
    Application.ProcessMessages;
  end;
  ProcLabel.Caption := IntToStr (NPrimes) +
    ' below ' + IntToStr (Max);
  Gauge3.Invalidate;
  MessageBeep ($FFFF)
end;

procedure TForm1.IdleButtonClick(Sender: TObject);
begin
  {$IFDEF DEBUG}
  WriteLine ('IdleButtonClick');
  {$ENDIF}
  IdleNPrimes := 0;
  IdleMax := SpinEdit1.Value;
  IdleNumber := 2;
  Application.OnIdle := IdleProc;
  Gauge4.Progress := 0;
  IdleLabel.Caption := 'Computing...';
end;

procedure TForm1.IdleProc (Sender: TObject; var Done: Boolean);
begin
  {$IFDEF DEBUG}
  WriteLine ('IdleProc' + IntToStr (IdleNumber));
  {$ENDIF}
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
    Gauge4.Refresh;
    MessageBeep ($FFFF);
    Application.OnIdle := nil;
  end;
  Gauge4.Progress := IdleNumber * 100 div IdleMax;
end;

end.
