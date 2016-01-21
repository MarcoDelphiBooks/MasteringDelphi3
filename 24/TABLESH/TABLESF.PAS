unit TablesF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, ExtCtrls, Buttons, Grids,
  DBGrids, DBTables;

type
  TMainForm = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    SpeedButton2: TSpeedButton;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  FieldsF, HtmlStr, ShellAPI;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Session.GetDatabaseNames (
    ComboBox1.Items);
  // force an initial list in the listbox
  ComboBox1.ItemIndex := 0;
  ComboBox1Change (self);
  // force an initial selection in the DBGrid
  ListBox1.ItemIndex := 0;
  ListBox1Click (self);
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  Session.GetTableNames (
    ComboBox1.Text, '',
    True, False, ListBox1.Items);
end;

procedure TMainForm.ListBox1Click(Sender: TObject);
begin
  Table1.Close;
  Table1.DatabaseName := ComboBox1.Text;
  Table1.Tablename :=
    Listbox1.Items [Listbox1.ItemIndex];
  Table1.Open;
  Caption := Format ('Table: %s - %s',
    [Table1.DatabaseName,
    Table1.Tablename]);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  FieldsForm.FieldsList.Clear;
  for I := 0 to Table1.FieldCount - 1 do
  begin
    FieldsForm.FieldsList.Items.Add (
      Table1.Fields[I].FieldName);
    FieldsForm.FieldsList.Selected [I] :=
      Table1.Fields[I].Visible;
  end;
  if FieldsForm.ShowModal = mrOk then
    for I := 0 to Table1.FieldCount - 1 do
      Table1.Fields[I].Visible :=
        FieldsForm.FieldsList.Selected [I];
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
var
  Str: THtmlStrings;
begin
  SaveDialog1.FileName := ChangeFileExt (
    Table1.TableName, '.htm');
  if SaveDialog1.Execute then
  begin
    Str := THtmlStrings.Create;
    try
      Str.AddHeader (Caption);
      Str.OutputTable (Table1);
      Str.AddFooter;
      Str.SaveToFile (SaveDialog1.Filename);
      if CheckBox1.Checked then
        ShellExecute (Handle, 'open',
          PChar (SaveDialog1.FileName),
          '', '', sw_ShowNormal);
    finally
      Str.Free;
    end;
  end;
end;

end.
