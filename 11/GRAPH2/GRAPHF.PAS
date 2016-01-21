unit GraphF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Panel1: TPanel;
    ChBoxMarks: TCheckBox;
    UpdateButton: TButton;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure StringGrid1GetEditMask(Sender: TObject; ACol, ARow: Longint;
      var Value: string);
    procedure ChBoxMarksClick(Sender: TObject);
    procedure ComboChange(Sender: TObject);
  private
    Combos: array [0..3] of TComboBox;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J: Integer;
begin
  with StringGrid1 do
  begin
    {fills the fixed column and row,
    and the chart series names}
    for I := 1 to 5 do
      Cells [I, 0] := Format ('Group %d', [I]);
    for J := 1 to 4 do
    begin
      Cells [0, J] := Format ('Series %d', [J]);
      Chart1.Series [J-1].Title := Format ('Series %d', [J]);
    end;

    {fills the grid with random values}
    Randomize;
    for I := 1 to 5 do
      for J := 1 to 4 do
        Cells [I, J] := IntToStr (Random (100));
  end; // with

  // fill the Combos array
  Combos [0] := ComboBox1;
  Combos [1] := ComboBox2;
  Combos [2] := ComboBox3;
  Combos [3] := ComboBox4;

  // show the initial chart type
  for I := 0 to 3 do
    Combos [I].ItemIndex := 1;

  // update the chart
  UpdateButtonClick (self);
end;

procedure TForm1.UpdateButtonClick(Sender: TObject);
var
  I, J: Integer;
begin
  for I := 1 to 4 do
  begin
    Chart1.Series [I-1].Clear;
    for J := 1 to 5 do
      Chart1.Series [I-1].Add (
        StrToInt (StringGrid1.Cells [J, I]),
        '', Chart1.Series [I-1].SeriesColor);
  end;
end;

procedure TForm1.StringGrid1GetEditMask(Sender: TObject; ACol,
  ARow: Longint; var Value: string);
begin
  // edit mask for the grid cells
  Value := '09;0';
end;

procedure TForm1.ChBoxMarksClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 4 do
    Chart1.Series [I-1].Marks.Visible :=
      ChBoxMarks.Checked;
end;

procedure TForm1.ComboChange(Sender: TObject);
var
  I: Integer;
  SeriesClass: TChartSeriesClass;
  NewSeries: TChartSeries;
begin
  // destroy the existing series (in reverse order)
  for I := 3 downto 0 do
    Chart1.Series [I].Free;
  // create the new series
  for I := 0 to 3 do
  begin
    case Combos [I].ItemIndex of
      0: SeriesClass := TLineSeries;
      1: SeriesClass := TBarSeries;
      2: SeriesClass := TAreaSeries;
    else // 3: and default
      SeriesClass := TPointSeries;
    end;
    NewSeries := SeriesClass.Create (self);
    NewSeries.ParentChart := Chart1;
    NewSeries.Title :=
      Format ('Series %d', [I + 1]);
  end;
  // update the marks and update the data
  ChBoxMarksClick (self);
  UpdateButtonClick (self);
end;

end.
