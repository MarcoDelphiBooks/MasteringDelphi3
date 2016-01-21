unit LeapYF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Btn1997: TButton;
    Btn1996: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Btn1997Click(Sender: TObject);
    procedure Btn1996Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // new data type, TDate
  TDate = class
    Month, Day, Year: Integer;
    procedure SetValue(m, d, y: Integer);
    function LeapYear: Boolean;
  end;

var
  Form1: TForm1;
  // new "global" object of class TDate
  ADay: TDate;

implementation

{$R *.DFM}

procedure TDate.SetValue(m, d, y: Integer);
begin
  Month := m;
  Day := d;
  Year := y;
end;

function TDate.LeapYear: Boolean;
begin
  if (Year mod 4 <> 0) then
    LeapYear := False
  else if (Year mod 100 <> 0) then
    LeapYear := True
  else if (Year mod 400 <> 0) then
    LeapYear := False
  else
    LeapYear := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADay := TDate.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ADay.Free;
end;

procedure TForm1.Btn1997Click(Sender: TObject);
begin
  ADay.SetValue (1, 1, 1997);
  if ADay.LeapYear then
    ShowMessage ('Leap Year')
  else
    ShowMessage ('Non Leap Year');
end;

procedure TForm1.Btn1996Click(Sender: TObject);
begin
  ADay.SetValue (1, 1, 1996);
  if ADay.LeapYear then
    ShowMessage ('Leap Year')
  else
    ShowMessage ('Non Leap Year');
end;

end.
