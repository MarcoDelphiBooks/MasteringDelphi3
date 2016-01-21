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
    Query1: TQuery;
    Query1NAME: TStringField;
    Query1CAPITAL: TStringField;
    Query1AREA: TFloatField;
    Query1POPULATION: TFloatField;
    Query1DENSITY: TFloatField;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CalcForm: TCalcForm;

implementation

{$R *.DFM}

end.
