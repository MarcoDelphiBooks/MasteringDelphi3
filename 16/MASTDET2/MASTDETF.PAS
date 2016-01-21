unit MastdetF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls;

type
  TForm2 = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditCompany: TDBEdit;
    Label2: TLabel;
    EditAddr: TDBEdit;
    Label3: TLabel;
    EditAddr2: TDBEdit;
    Label4: TLabel;
    EditCity: TDBEdit;
    Label5: TLabel;
    EditState: TDBEdit;
    Label6: TLabel;
    EditZip: TDBEdit;
    Label7: TLabel;
    EditCountry: TDBEdit;
    Label8: TLabel;
    EditPhone: TDBEdit;
    Label9: TLabel;
    EditFAX: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Table1: TTable;
    Table2: TTable;
    DataSource2: TDataSource;
    Table2OrderNo: TFloatField;
    Table2CustNo: TFloatField;
    Table2SaleDate: TDateTimeField;
    Table2ShipDate: TDateTimeField;
    Table2EmpNo: TIntegerField;
    Table2ShipToContact: TStringField;
    Table2ShipToAddr1: TStringField;
    Table2ShipToAddr2: TStringField;
    Table2ShipToCity: TStringField;
    Table2ShipToState: TStringField;
    Table2ShipToZip: TStringField;
    Table2ShipToCountry: TStringField;
    Table2ShipToPhone: TStringField;
    Table2ShipVIA: TStringField;
    Table2PO: TStringField;
    Table2Terms: TStringField;
    Table2PaymentMethod: TStringField;
    Table2ItemsTotal: TCurrencyField;
    Table2TaxRate: TFloatField;
    Table2Freight: TCurrencyField;
    Table2AmountPaid: TCurrencyField;
    Table2Employee: TStringField;
    Table3: TTable;
    DataSource3: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Table1.Open;
  Table2.Open;
end;

end.