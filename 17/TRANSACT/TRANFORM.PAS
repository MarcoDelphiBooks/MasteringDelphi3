unit Tranform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    Database1: TDatabase;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnStart: TButton;
    BtnCommit: TButton;
    BtnRollback: TButton;
    Query1: TQuery;
    procedure BtnStartClick(Sender: TObject);
    procedure BtnCommitClick(Sender: TObject);
    procedure BtnRollbackClick(Sender: TObject);
    procedure Database1Login(Database: TDatabase; LoginParams: TStrings);
    procedure Query1BeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnStartClick(Sender: TObject);
begin
  Database1.StartTransaction;
  BtnStart.Enabled := False;
  BtnCommit.Enabled := True;
  BtnRollback.Enabled := True;
end;

procedure TForm1.BtnCommitClick(Sender: TObject);
begin
  Database1.Commit;
  BtnStart.Enabled := True;
  BtnCommit.Enabled := False;
  BtnRollback.Enabled := False;
end;

procedure TForm1.BtnRollbackClick(Sender: TObject);
begin
  Database1.Rollback;
  Query1.Close;
  Query1.Open;
  BtnStart.Enabled := True;
  BtnCommit.Enabled := False;
  BtnRollback.Enabled := False;
end;

procedure TForm1.Database1Login(Database: TDatabase;
  LoginParams: TStrings);
begin
  LoginParams.Clear;
  LoginParams.Add ('USER NAME=SYSDBA');
  LoginParams.Add ('PASSWORD=masterkey');
{  LoginParams.Values ['USER NAME'] := 'SYSDBA';
  LoginParams.Values ['PASSWORD'] := 'masterkey';}
end;

procedure TForm1.Query1BeforeEdit(DataSet: TDataSet);
begin
  // start a transaction, if not already started
  if not Database1.InTransaction then
    BtnStartClick (self);
end;

end.
