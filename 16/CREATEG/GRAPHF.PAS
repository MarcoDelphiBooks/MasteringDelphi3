unit GraphF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, StdCtrls, Forms, DBCtrls, DB, DBTables, ExtCtrls,
  Mask, Buttons, Dialogs, TablesF, Menus;

type
  EMyDatabaseError = class (EDatabaseError) end;
  TGraphForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditDescription: TDBEdit;
    Label3: TLabel;
    EditDate: TDBEdit;
    Label4: TLabel;
    DBImage: TDBImage;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Table1: TTable;
    SpeedAdd: TSpeedButton;
    SpeedDelete: TSpeedButton;
    Table2: TTable;
    CheckBox1: TCheckBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    DBNavigator: TDBNavigator;
    SpeedOpen: TSpeedButton;
    SpeedNew: TSpeedButton;
    Record1: TMenuItem;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  GraphForm: TGraphForm;

implementation

{$R *.DFM}

procedure TGraphForm.FormCreate(Sender: TObject);
var
  Code: Word;
  Done: Boolean;
begin
  Done := False;
  while not Done do
  try
    Code := MessageDlg (
      'Do you want to create a new table?' +
      #13'(choose No to load an existing table,' +
      #13'Cancel to quit)',
      mtConfirmation, mbYesNoCancel, 0);
    if Code = idYes then
      New1Click (self)
    else if Code = idNo then
      Open1Click (self)
    else
      Application.Terminate;
    Done := True;
  except
    on E: EMyDatabaseError do
      ShowMessage (E.Message);
  end; // end of try-except and while blocks
end;

procedure TGraphForm.CheckBox1Click(Sender: TObject);
begin
  DBImage.Stretch := CheckBox1.Checked;
end;

procedure TGraphForm.New1Click(Sender: TObject);
var
  TableName: string;
  TbNames: TStringList;
begin
  {request the name of the new table to the user,
  raising an expcetion in case Cancel is pressed}
  TableName := '';
  if InputQuery ('New Table',
    'Enter a new table name:', TableName) then
  begin
    if TableName = '' then
      raise EMyDatabaseError.Create (
        'Invalid table name');

    {if the table already exists in the DBDEMOS
    database, do not overwrite it}
    TbNames := TStringList.Create;
    Session.GetTableNames ('DBDEMOS', '',
      False, False, TbNames);
    if TbNames.IndexOf (TableName) >= 0 then
      raise EMyDatabaseError.Create (
        'Table already exists');

    {close the current table}
    Table1.Close;

    {set the name and type of the new table}
    Table1.TableName := TableName;
    Table1.TableType := ttParadox;

    {define the three fields and the index}
    with Table1.FieldDefs do
    begin
      Clear;
      Add ('Description', ftString, 50, True);
      Add ('Time', ftDateTime, 0, False);
      Add ('Graphics', ftGraphic, 0, False);
    end;
    Table1.IndexDefs.Clear;
    Table1.IndexDefs.Add('DescrIndex', 'Description',
      [ixPrimary, ixUnique]);

    {create the table using the above definitions}
    Table1.CreateTable;
    Table1.Open;
    Caption := 'Create Graphics - ' + TableName;
  end
  else // if InputQuery
    // if OnCreate called this methods
    if Sender = self then
      raise EMyDatabaseError.Create (
      'Table creation aborted by the user');
end;

procedure TGraphForm.Open1Click(Sender: TObject);
var
  TbNames: TStringList;
  I: Integer;
  TableFound: Boolean;
begin
  {create the form of the dialog box,
  before filling its list box with the table names}
  TablesForm := TTablesForm.Create (Application);

  {retrieve the list of tables from the database}
  TableFound := False;
  TbNames := TStringList.Create;
  Session.GetTableNames ('DBDEMOS', '',
    True, False, TbNames);

  {checks if the table has the proper fields,
  that is, if it was created by this program.
  The code uses a secondary table object}
  for I := 0 to TbNames.Count - 1 do
  begin
    Table2.TableName := TbNames [I];
    Table2.FieldDefs.Update;
    if (Table2.FieldDefs.Count = 3) and
      (Table2.FieldDefs[0].DataType = ftString) and
      (Table2.FieldDefs[1].DataType = ftDateTime) and
      (Table2.FieldDefs[2].DataType = ftGraphic) then
    begin
      {table fields match: add the table to the list}
      TablesForm.Listbox1.Items.Add (Table2.TableName);
      TableFound := True;
    end;
  end;

  {if no table was found, raise an exception}
  if not TableFound then
    raise EMyDatabaseError.Create (
      'No table with the proper structure');

  {otherwise, show the dialog box}
  TablesForm.ListBox1.ItemIndex := 0;
  if TablesForm.ShowModal = idOK then
  begin
    {if OK was pressed, open the table}
    Table1.Close;
    Table1.TableName := TablesForm.ListBox1.Items [
      TablesForm.ListBox1.ItemIndex];
    Table1.Open;
    Caption := 'Create Graphics - ' +
      Table1.TableName;
  end
  else
    // if OnCreate called this methods
    if Sender = self then
      raise EMyDatabaseError.Create (
        'Table selection aborted by the user');
end;

procedure TGraphForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TGraphForm.About1Click(Sender: TObject);
begin
  MessageDlg ('CreateG example, from the book' +
    #13'"Mastering Delphi", by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TGraphForm.Add1Click(Sender: TObject);
var
  Descr: string;
begin
  if InputQuery ('New record',
    'Enter the description:', Descr) then
  begin
    Table1.Insert;
    EditDescription.Text := Descr;
    EditDate.Text := DateTimeToStr (Now);
    DBIMage.PasteFromClipboard;
    Table1.Post;
  end;
end;

procedure TGraphForm.Delete1Click(Sender: TObject);
begin
  if MessageDlg (
    'Are you sure you want to delete the current record?',
      mtConfirmation, [mbYes, mbNo], 0) = idYes then
    Table1.Delete;
end;

end.
