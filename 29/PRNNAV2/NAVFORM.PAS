unit NavForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls,
  Mask, DB, DBTables, Printers;

type
  TNavigator = class(TForm)
    PrintButton: TButton;
    PrintAllButton: TButton;
    PrintFormButton: TButton;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Population: TFloatField;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    procedure PrintButtonClick(Sender: TObject);
    procedure PrintFormButtonClick(Sender: TObject);
    procedure PrintAllButtonClick(Sender: TObject);
  private
    procedure TableToFile (var TFile: TextFile);
  end;

var
  Navigator: TNavigator;

implementation

{$R *.DFM}

procedure TNavigator.PrintButtonClick(Sender: TObject);
var
  OutputFile: TextFile;
begin
  {show the Print dialog box}
  if PrintDialog1.Execute then
  begin
    {if the Print to File check box is selected}
    if PrintDialog1.PrintToFile then
    begin
      {choose a file name}
      if SaveDialog1.Execute then
        {output the text to a file}
        AssignFile (OutputFile, SaveDialog1.FileName)
      else
        Exit; // nothing to do
    end
    else
    begin
      {output the text to the printer}
      AssignPrn (OutputFile);
      {set the printer font to the form font}
      Printer.Canvas.Font := Font;
    end;
    Rewrite (OutputFile);
    try
      {save to file or print}
      Writeln (OutputFile, Label1.Caption,
        ' ', DBEdit1.Text);
      Writeln (OutputFile, Label2.Caption,
        ' ', DBEdit2.Text);
      Writeln (OutputFile, Label3.Caption,
        ' ', DBEdit3.Text);
    finally
      CloseFile (OutputFile);
    end;
  end;
end;

procedure TNavigator.PrintFormButtonClick(Sender: TObject);
begin
  Print;
end;

procedure TNavigator.TableToFile (var TFile: TextFile);
var
  Bookmark: TBookmark;
begin
  {store the current position, creating a new bookmark}
  Bookmark := Table1.GetBookmark;
  try
    Table1.DisableControls;
    try
      Rewrite (TFile);
      try
        Table1.First;
        while not Table1.EOF do
        begin
          {output the two fields, and a blank line}
          Writeln (TFile, 'Country: ',
            Table1.FieldByName ('Name').AsString);
          Writeln (TFile, 'Capital: ',
            Table1.FieldByName ('Capital').AsString);
          Writeln (TFile, 'Continent: ',
            Table1.FieldByName ('Continent').AsString);
          Writeln (TFile);
          Table1.Next;
        end;
      finally
        CloseFile (TFile);
      end;
    finally
      Table1.EnableControls;
    end;
  finally
    Table1.GotoBookmark (Bookmark);
    Table1.FreeBookmark (Bookmark);
  end;
end;

procedure TNavigator.PrintAllButtonClick(Sender: TObject);
var
  File1: TextFile;
begin
  if PrintDialog1.Execute then
    if PrintDialog1.PrintToFile then
    begin
      if SaveDialog1.Execute then
      begin
        {assign the output to a real file}
        AssignFile (File1, SaveDialog1.FileName);
        TableToFile (File1);
      end
      else
        Exit;
    end
    else
    begin
      {assign the printer to a file}
      AssignPrn (File1);
      {set the font of the form, and output the file}
      Printer.Canvas.Font := Font;
      TableToFile (File1);
    end;
end;

end.
