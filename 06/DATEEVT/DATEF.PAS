unit DateF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Dates, StdCtrls;

type
  TDateForm = class(TForm)
    LabelDate: TLabel;
    BtnIncrease: TButton;
    BtnDecrease: TButton;
    BtnAdd10: TButton;
    BtnSubtract10: TButton;
    EditMonth: TEdit;
    EditDay: TEdit;
    EditYear: TEdit;
    ButtonRead: TButton;
    ButtonWrite: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtnIncreaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnDecreaseClick(Sender: TObject);
    procedure BtnAdd10Click(Sender: TObject);
    procedure BtnSubtract10Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure DateChange(Sender: TObject);
  private
    TheDay: TDate;
  end;

var
  DateForm: TDateForm;

implementation

{$R *.DFM}

procedure TDateForm.FormCreate(Sender: TObject);
begin
  TheDay := TDate.Init (7, 4, 1997);
  LabelDate.Caption := TheDay.Text;
  // assign the event handler for future changes
  TheDay.OnChange := DateChange;
end;

procedure TDateForm.DateChange;
begin
  LabelDate.Caption := TheDay.Text;
end;

procedure TDateForm.BtnIncreaseClick(Sender: TObject);
begin
  TheDay.Increase;
end;

procedure TDateForm.BtnDecreaseClick(Sender: TObject);
begin
  TheDay.Decrease;
end;

procedure TDateForm.BtnAdd10Click(Sender: TObject);
begin
  TheDay.Add(10);
end;

procedure TDateForm.BtnSubtract10Click(Sender: TObject);
begin
  TheDay.Subtract(10);
end;

procedure TDateForm.FormDestroy(Sender: TObject);
begin
  TheDay.Free;
end;

procedure TDateForm.ButtonReadClick(Sender: TObject);
begin
  EditYear.Text := IntToStr (TheDay.Year);
  EditMonth.Text := IntToStr (TheDay.Month);
  EditDay.Text := IntToStr (TheDay.Day);
end;

procedure TDateForm.ButtonWriteClick(Sender: TObject);
begin
  // unsafe version
  {TheDay.Year := StrToInt (EditYear.Text);
  TheDay.Month := StrToInt (EditMonth.Text);
  TheDay.Day := StrToInt (EditDay.Text);}
  // safe version
  TheDay.SetValue (StrToInt (EditMonth.Text),
    StrToInt (EditDay.Text),
    StrToInt (EditYear.Text));
end;

end.

