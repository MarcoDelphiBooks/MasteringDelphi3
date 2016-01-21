unit ChoiceF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    CheckBold: TCheckBox;
    CheckItalic: TCheckBox;
    CheckUnderlined: TCheckBox;
    RadioTimes: TRadioButton;
    RadioArial: TRadioButton;
    RadioCourier: TRadioButton;
    Memo1: TMemo;
    procedure CheckBoldClick(Sender: TObject);
    procedure CheckItalicClick(Sender: TObject);
    procedure CheckUnderlinedClick(Sender: TObject);
    procedure RadioTimesClick(Sender: TObject);
    procedure RadioArialClick(Sender: TObject);
    procedure RadioCourierClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CheckBoldClick(Sender: TObject);
begin
  if CheckBold.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsBold]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsBold];
end;

procedure TForm1.CheckItalicClick(Sender: TObject);
begin
  if CheckItalic.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsItalic]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsItalic];
end;

procedure TForm1.CheckUnderlinedClick(Sender: TObject);
begin
  if CheckUnderlined.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsUnderline]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsUnderline];
end;

procedure TForm1.RadioTimesClick(Sender: TObject);
begin
  Memo1.Font.Name := 'Times New Roman';
end;

procedure TForm1.RadioArialClick(Sender: TObject);
begin
  Memo1.Font.Name := 'Arial';
end;

procedure TForm1.RadioCourierClick(Sender: TObject);
begin
  Memo1.Font.Name := 'Courier';
end;

end.

