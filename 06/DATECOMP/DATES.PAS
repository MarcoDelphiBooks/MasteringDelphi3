unit Dates;

interface

uses
  SysUtils, Classes;

type
  TDate = class (TComponent)
  private
    FMonth, FDay, FYear: Integer;
    FOnChange: TNotifyEvent;
  protected
    function DaysInMonth: Integer;
    procedure SetMonth (Value: Integer);
    procedure SetYear (Value: Integer);
    procedure SetDay (Value: Integer);
    procedure DoChange; virtual;
  public
    constructor Create (AOwner: TComponent); override;
    constructor Init (m, d, y: Integer);
    procedure SetValue (m, d, y: Integer);
    function LeapYear: Boolean;
    procedure Increase;
    procedure Decrease;
    procedure Add (NumberOfDays: Integer);
    procedure Subtract (NumberOfDays: Integer);
    function GetText: string;
    // properties:
    property Text: string read GetText;
  published
    property Day: Integer read FDay write SetDay;
    property Month: Integer read FMonth write SetMonth;
    property Year: Integer read FYear write SetYear;
    // event:
    property OnChange: TNotifyEvent
      read FonChange write FOnChange;
  end;

// dates exception
type
  EDateOutOfRange = class (Exception);

procedure Register;

implementation

constructor TDate.Create (AOwner: TComponent);
var
  Y, D, M: Word;
begin
  inherited Create (AOwner);
  // today...
  DecodeDate (Now, Y, M, D);
  FYear := Y;
  FMonth := M;
  FDay := D;
end;

constructor TDate.Init (m, d, y: Integer);
begin
  SetValue (m, d, y);
end;

procedure TDate.DoChange;
begin
  if Assigned (FOnChange) then
    FOnChange (self);
end;

procedure TDate.SetValue (m, d, y: Integer);
var
  OldY, OldM: Integer;
begin
  // store the old value
  OldY := FYear;
  OldM := FMonth;
  // assing the new value
  try
    FYear := y;
    // check the ranges
    SetMonth (m);
    SetDay (d);
    DoChange;
  except
    on EDateOutOfRange do
    begin
      // reset the values
      FYear := OldY;
      FMonth := OldM;
      // let the error show up
      raise;
    end;
  end;
end;

procedure TDate.SetMonth (Value: Integer);
begin
  if (Value >= 1) and (Value <= 12) then
  begin
    FMonth := Value;
    DoChange;
  end
  else
    raise EDateOutOfRange.Create ('Month out of range');
end;

procedure TDate.SetYear (Value: Integer);
begin
  FYear := Value;
  DoChange;
end;

procedure TDate.SetDay (Value: Integer);
begin
  if (Value >= 1) and (Value <= DaysInMonth) then
  begin
    FDay := Value;
    DoChange;
  end
  else
    raise EDateOutOfRange.Create ('Day out of range');
end;

function TDate.LeapYear: Boolean;
begin
  // compute leap years, considering "exceptions"
  if (FYear mod 4 <> 0) then
    LeapYear := False
  else if (FYear mod 100 <> 0) then
    LeapYear := True
  else if (FYear mod 400 <> 0) then
    LeapYear := False
  else
    LeapYear := True;
end;

function TDate.DaysInMonth: Integer;
begin
  case FMonth of
    1, 3, 5, 7, 8, 10, 12:
      DaysInMonth := 31;
    4, 6, 9, 11:
      DaysInMonth := 30;
    2:
      if (LeapYear) then
        DaysInMonth := 29
      else
        DaysInMonth := 28;
    else
      // if the month is not correct
      DaysInMonth := 0;
  end;
end;

procedure TDate.Increase;
begin
  // if this day is not the last of the month
  if FDay < DaysInMonth then
    Inc (FDay) // increase the value by 1
  else
  // if it is not in December
    if FMonth < 12 then
    begin
      // Day 1 of next month
      Inc (FMonth);
      FDay := 1;
    end
    else
    begin
      // else it is next year New Year^s Day
      Inc (FYear);
      FMonth := 1;
      FDay := 1;
    end;
  DoChange;
end;

// exactly the reverse of the Increase method
procedure TDate.Decrease;
begin
  if FDay > 1 then
    Dec (FDay) // decrease the value by 1
  else
    // it is the first of a month
    if FMonth > 1 then
    begin
      // assign last day of previous month
      Dec (FMonth);
      FDay := DaysInMOnth;
    end
    else
    // it is the first of January
    begin
      // assign last day of previous year
      Dec (FYear);
      FMonth := 12;
      FDay := DaysInMOnth;
    end;
  DoChange;
end;

function TDate.GetText: string;
begin
  GetText :=  Format ('%s %d, %d',
    [LongMonthNames[Month], Day, Year]);
end;

procedure TDate.Add (NumberOfDays: Integer);
var
  N: Integer;
begin
  // increase the day n times
  for N := 1 to NumberOfDays do
    Increase;
end;

procedure TDate.Subtract (NumberOfDays: Integer);
var
  N: Integer;
begin
  // decrease the day n times
  for N := 1 to NumberOfDays do
    Decrease;
end;

procedure Register;
begin
  RegisterComponents ('Md3', [TDate]);
end;

end.

