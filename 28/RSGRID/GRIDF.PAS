unit GridF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, Menus, Report;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Print1: TMenuItem;
    PrintReport1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    PrintDialog1: TPrintDialog;
    Report1: TReport;
    N2: TMenuItem;
    PreviewReport1: TMenuItem;
    Report2: TReport;
    Table2: TMenuItem;
    PreviewReport2: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintReport1Click(Sender: TObject);
    procedure PreviewReport1Click(Sender: TObject);
    procedure PreviewReport2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    Print;
end;

procedure TForm1.PrintReport1Click(Sender: TObject);
var
  CurrentPath: String;
begin
  // set the report path to the application path
  CurrentPath := ExtractFilePath (ParamStr (0));
  Report1.ReportDir := CurrentPath;
  Report1.Preview := False;
  Report1.Run;
end;

procedure TForm1.PreviewReport1Click(Sender: TObject);
var
  CurrentPath: String;
begin
  // set the report path to the application path
  CurrentPath := ExtractFilePath (ParamStr (0));
  Report1.ReportDir := CurrentPath;
  Report1.Preview := True;
  Report1.Run;
end;

procedure TForm1.PreviewReport2Click(Sender: TObject);
var
  CurrentPath: String;
begin
  // set the report path to the application path
  CurrentPath := ExtractFilePath (CmdLine);
  Delete (CurrentPath, 1, 1);
  Report2.ReportDir := CurrentPath;
  Report2.Preview := True;
  Report2.Run;
end;

end.
