unit Dates;

interface

type
  TDate = class
  private
    Month, Day, Year: Integer;
  public
    constructor Init (m, d, y: Integer);
    procedure SetValue (m, d, y: Integer);
    function LeapYear: Boolean;
    procedure Increase;
    procedure Decrease;
    procedure Add (NumberOfDays: Integer);
    procedure Subtract (NumberOfDays: Integer);
    function GetText: string;
  protected
    function DaysInMonth: Integer;
  end;

  {descendant class}
  TNewDate = class (TDate)
  public
    function GetText: string;
  end;

implementation

uses
  SysUtils;

{// definition of the months names (see also LongMonthNames)
const
  MonthNames: array [1..12] of string =
    ('January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December');}

// method of the descendant class
function TNewDate.GetText: string;
begin
{  // older version, based on the array above
  GetText :=  Format ('%s %d, %d', [MonthNames[Month], Day, Year]);}
  // use Windows locale information
  GetText :=  Format ('%s %d, %d', [LongMonthNames[Month], Day, Year]);
end;

constructor TDate.Init (m, d, y: Integer);
begin
  Month := m;
  Day := d;
  Year := y;
end;

procedure TDate.SetValue (m, d, y: Integer);
begin
  Month := m;
  Day := d;
  Year := y;
end;

function TDate.LeapYear: Boolean;
begin
  // compute leap years, considering "exceptions"
  if (Year mod 4 <> 0) then
    LeapYear := False
  else if (Year mod 100 <> 0) then
    LeapYear := True
  else if (Year mod 400 <> 0) then
    LeapYear := False
  else
    LeapYear := True;
end;

function TDate.DaysInMonth: Integer;
begin
  case Month of
    1, 3, 5, 7, 8, 10, 12:
      DaysInMOnth := 31;
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
  if Day < DaysInMonth then
    Inc (Day) // increase the value by 1
  else
  // if it is not in December
    if Month < 12 then
    begin
      // Day 1 of next month
      Inc (Month);
      Day := 1;
    end
    else
    begin
      // else it is next year New Year^s Day
      Inc (Year);
      Month := 1;
      Day := 1;
    end;
end;

// exactly the reverse of the Increase method
procedure TDate.Decrease;
begin
  if Day > 1 then
    Dec (Day) // decrease the value by 1
  else
    // it is the first of a month
    if Month > 1 then
    begin
      // assign last day of previous month
      Dec (Month);
      Day := DaysInMOnth;
    end
    else
    // it is the first of January
    begin
      // assign last day of previous year
      Dec (Year);
      Month := 12;
      Day := DaysInMOnth;
    end;
end;

function TDate.GetText: string;
begin
  {format the text, converting the integers to
  strings with a fixed number of characters}
  GetText := Format ('%.2d.%.2d.%4d',
    [Month, Day, Year]);
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

end.

