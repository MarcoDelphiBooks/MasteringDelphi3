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
    ButtonReport: TButton;
    Query1: TQuery;
    Query1Name: TStringField;
    Query1Capital: TStringField;
    Query1Continent: TStringField;
    Query1Area: TFloatField;
    Query1Population: TFloatField;
    Query1Density: TFloatField;
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure ButtonReportClick(Sender: TObject);
    procedure Query1CalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CalcForm: TCalcForm;

implementation

uses Dialogs, ReportF;

{$R *.DFM}

procedure TCalcForm.DBGrid1EditButtonClick(Sender: TObject);
begin
  MessageDlg ('To change the population density,'#13 +
    'edit the Population or the Area',
    mtInformation, [mbOK], 0);
end;

procedure TCalcForm.ButtonReportClick(Sender: TObject);
begin
  QForm1.QuickRep1.Preview;
end;

procedure TCalcForm.Query1CalcFields(DataSet: TDataSet);
begin
  Query1Density.Value :=
    Query1Population.Value / Query1Area.Value;
end;

end.