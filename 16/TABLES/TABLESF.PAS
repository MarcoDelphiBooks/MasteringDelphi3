unit TablesF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, DBTables, DBGridf, ExtCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ListBox1: TListBox;
    Panel2: TPanel;
    Label2: TLabel;
    ListBox2: TListBox;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
var
  DBNames: TStringList;
begin
  DBNames := TStringList.Create;
  Session.GetDatabaseNames (DBNames);
  ListBox1.Items := DBNames;
  DBNames.Free;
end;

procedure TMainForm.ListBox1DblClick(Sender: TObject);
var
  CurrentDB: string;
begin
  CurrentDB := ListBox1.Items [ListBox1.ItemIndex];
  Session.GetTableNames (CurrentDB, '', True, False, ListBox2.Items);
end;

procedure TMainForm.ListBox2DblClick(Sender: TObject);
var
  CurrentDB, CurrentTable: string;
  GridForm: TGridForm;
begin
  CurrentDB := Listbox1.Items [Listbox1.ItemIndex];
  CurrentTable := Listbox2.Items [Listbox2.ItemIndex];
  GridForm := TGridForm.Create (self);

  {connect the table component to the selected
  table and activate it}
  GridForm.Table1.DatabaseName := CurrentDB;
  GridForm.Table1.Tablename := CurrentTable;
  try
    GridForm.Table1.Open;

    {set the title and call a custom
    initialization method, then show the form}
    GridForm.Caption := Format ('Table: %s - %s',
      [CurrentDB, CurrentTable]);
    GridForm.FillFieldsCombo;
    GridForm.Show;
  except on Exception do
    GridForm.Close;
  end;
end;



end.
