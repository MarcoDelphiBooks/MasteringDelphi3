unit DataM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB;

type
  TDataModule2 = class(TDataModule)
    Table1: TTable;
    DataSource1: TDataSource;
    Table1CustNo: TFloatField;
    Table1Company: TStringField;
    Table1Addr1: TStringField;
    Table1Addr2: TStringField;
    Table1City: TStringField;
    Table1State: TStringField;
    Table1Zip: TStringField;
    Table1Country: TStringField;
    Table1Phone: TStringField;
    Table1FAX: TStringField;
    Table1TaxRate: TFloatField;
    Table1Contact: TStringField;
    Table1LastInvoiceDate: TDateTimeField;
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
  public
    Max: Integer;
    procedure ComputeMax;
    procedure ChooseRange;
  end;

var
  DataModule2: TDataModule2;

implementation

uses RangeDb;

{$R *.DFM}

procedure TDataModule2.ComputeMax;
var
  Bookmark: TBookmark;
begin
  // save a bookmark
  Bookmark := Table1.GetBookmark;
  try
    Table1.DisableControls;
    Max := 0;
    try
      Table1.First;
      while not Table1.EOF do
      begin
        if Table1CustNo.AsInteger > Max then
          Max := Table1CustNo.AsInteger;
        Table1.Next;
      end;
    finally
      Table1.EnableControls;
    end;
  finally
    // return to the bookmark
    Table1.GotoBookmark (Bookmark);
    Table1.FreeBookmark (Bookmark);
  end;
end;

procedure TDataModule2.Table1NewRecord(DataSet: TDataSet);
begin
  Table1CustNo.Value := Max + 1;
end;

procedure TDataModule2.Table1BeforeInsert(DataSet: TDataSet);
begin
  ComputeMax;
end;

procedure TDataModule2.ChooseRange;
begin
  with FormRange do
    if ShowModal = mrOK then
      if CheckBoxRange.Checked then
        Table1.SetRange ([Edit1.Text], [Edit2.Text])
      else
        Table1.CancelRange;
end;

end.
