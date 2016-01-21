unit XChartF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, OleCtrls, vcfi;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    UpdateButton: TButton;
    Label5: TLabel;
    ComboBox1: TComboBox;
    VtChart1: TVtChart;
    procedure FormCreate(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure StringGrid1GetEditMask(Sender: TObject; ACol, ARow: Longint;
      var Value: string);
  private
    { Private declarations }
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
    {fills the fixed column and row}
    for I := 1 to 5 do
      Cells [I, 0] := Format ('R%d:', [I]);
    for J := 1 to 4 do
      Cells [0, J] := Format ('C%d:', [J]);
    {fills the grid with random values}
    Randomize;
    for I := 1 to 5 do
      for J := 1 to 4 do
        Cells [I, J] := IntToStr (Random (100));
  end;

  {update the chart}
  UpdateButtonClick (self);

  {select the initial style in the combo box}
  ComboBox1.ItemIndex := VtChart1.ChartType;
end;

procedure TForm1.UpdateButtonClick(Sender: TObject);
var
  I, J: Integer;
begin
  for I := 1 to 5 do
  begin
    VtChart1.Row := I;
    for J := 1 to 4 do
    begin
      VtChart1.Column := J;
      VtChart1.Data := StringGrid1.Cells [I, J];
    end;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  {change the type of chart}
  VtChart1.ChartType := ComboBox1.ItemIndex;
end;

procedure TForm1.StringGrid1GetEditMask(Sender: TObject; ACol,
  ARow: Longint; var Value: string);
begin
  Value := '!09';
end;

end.
