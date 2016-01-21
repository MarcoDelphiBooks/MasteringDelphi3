unit DBWForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, DBCtrls, StdCtrls, DBTables,
  ExtCtrls, Mask, Db, Dialogs;

type
  TNavigator = class(TForm)
    BtnPrint: TButton;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    Table1: TTable;
    DataSource1: TDataSource;
    BtnOpen: TButton;
    BtnMasterWord: TButton;
    BtnSave: TButton;
    SaveDialog1: TSaveDialog;
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnMasterWordClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    VarWord: Variant;
  end;

var
  Navigator: TNavigator;

implementation

{$R *.DFM}

uses
  ComObj;

procedure TNavigator.BtnPrintClick(Sender: TObject);
var
  Bookmark: TBookmark;
begin
  // disable the UI
  Table1.DisableControls;
  try
    // store the current position
    Bookmark := Table1.GetBookmark;
    try
      // insert the title (in bold font)
      VarWord.Bold;
      VarWord.Insert ('American Capitals from ' +
        Table1.TableName + #13);
      // scan the database table
      Table1.First;
      while not Table1.EOF do
      begin
        // send the two fields
        VarWord.Insert ('The capital of ' +
          Table1.FieldByName ('Name').AsString + ' is '+
          Table1.FieldByName ('Capital').AsString + #13);
        Table1.Next;
      end;
    finally
      // go back to the bookmark and destroy it
      Table1.GotoBookmark (Bookmark);
      Table1.FreeBookmark (Bookmark);
    end;
  finally
    // re-enable the controls
    Table1.EnableControls;
  end;
end;

procedure TNavigator.BtnOpenClick(Sender: TObject);
begin
  // create the automation object
  try
    VarWord := CreateOleObject ('Word.Basic');
    VarWord.AppShow;
    VarWord.FileNew;
    BtnPrint.Enabled := True;
    BtnSave.Enabled := True;
    // keep the program in front of Word
    Application.BringToFront;
  except
    ShowMessage('Microsoft Word not found');
  end;
end;

procedure TNavigator.BtnMasterWordClick(Sender: TObject);
var
  VarW: Variant;
begin
  VarW := CreateOleObject ('Word.Basic');
  VarW.FileNew;
  VarW.AppShow;
  VarW.Insert ('Mastering Delphi');
  VarW.FileSave;
end;

procedure TNavigator.BtnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    VarWord.FileSaveAs (SaveDialog1.FileName);
end;

end.
