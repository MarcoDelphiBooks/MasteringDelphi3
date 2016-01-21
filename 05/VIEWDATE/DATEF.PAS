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
    procedure BtnIncreaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnDecreaseClick(Sender: TObject);
    procedure BtnAdd10Click(Sender: TObject);
    procedure BtnSubtract10Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    TheDay: TDate;
  public
    { Public declarations }
  end;

var
  DateForm: TDateForm;

implementation

{$R *.DFM}

procedure TDateForm.FormCreate(Sender: TObject);
begin
  TheDay := TDate.Init(5, 1, 1997);
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnIncreaseClick(Sender: TObject);
begin
  TheDay.Increase;
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnDecreaseClick(Sender: TObject);
begin
  TheDay.Decrease;
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnAdd10Click(Sender: TObject);
begin
  TheDay.Add(10);
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.BtnSubtract10Click(Sender: TObject);
begin
  TheDay.Subtract(10);
  LabelDate.Caption := TheDay.GetText;
end;

procedure TDateForm.FormDestroy(Sender: TObject);
begin
  TheDay.Free;
end;

end.

