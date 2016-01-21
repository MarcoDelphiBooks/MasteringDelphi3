unit CalcF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls;

type
  TCalcForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Table1: TTable;
    Table1PopulationDensity: TFloatField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataset);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CalcForm: TCalcForm;

implementation

{$R *.DFM}

procedure TCalcForm.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TCalcForm.Table1CalcFields(DataSet: TDataset);
begin
  try
    Table1PopulationDensity.Value :=
      Table1Population.Value / Table1Area.Value;
  except
    on Exception do
      Table1PopulationDensity.Value := 0;
  end;
end;

end.