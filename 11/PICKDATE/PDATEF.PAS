unit PDateF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    RadioDate: TRadioButton;
    RadioTime: TRadioButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioTimeClick(Sender: TObject);
    procedure RadioDateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    DateTimePicker1.DateFormat := dfLong
  else
    DateTimePicker1.DateFormat := dfShort;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    DateTimePicker1.DateMode := dmComboBox
  else
    DateTimePicker1.DateMode := dmUpDown;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MessageDlg ('The time is ' +
    TimeToStr (DateTimePicker1.Time),
    mtInformation, [mbOK], 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MessageDlg ('The date is ' +
    DateToStr (DateTimePicker1.Date),
    mtInformation, [mbOK], 0);
end;

procedure TForm1.RadioTimeClick(Sender: TObject);
begin
  DateTimePicker1.Kind := dtkTime;
end;

procedure TForm1.RadioDateClick(Sender: TObject);
begin
  DateTimePicker1.Kind := dtkDate;
end;




end.
