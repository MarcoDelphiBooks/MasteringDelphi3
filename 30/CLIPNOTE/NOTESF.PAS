unit NotesF;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Menus, StdCtrls, Dialogs, Printers, Clipbrd;

type
  TNotesForm = class(TForm)
    Memo1: TMemo;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    Printsetup1: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    Text1: TMenuItem;
    AlignLeft1: TMenuItem;
    AlignRight1: TMenuItem;
    Center1: TMenuItem;
    N4: TMenuItem;
    WordWrap1: TMenuItem;
    ReadOnly1: TMenuItem;
    Options1: TMenuItem;
    Font1: TMenuItem;
    BackColor1: TMenuItem;
    N5: TMenuItem;
    Countchars1: TMenuItem;
    Help1: TMenuItem;
    AboutNotes1: TMenuItem;
    ColorDialog1: TColorDialog;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    procedure BackColor1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AlignLeft1Click(Sender: TObject);
    procedure AlignRight1Click(Sender: TObject);
    procedure Center1Click(Sender: TObject);
    procedure WordWrap1Click(Sender: TObject);
    procedure ReadOnly1Click(Sender: TObject);
    procedure Countchars1Click(Sender: TObject);
    procedure AboutNotes1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Memo1Change(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
    filename: string;
    modified: bool;
  public
    { Public declarations }
    function SaveChanges: Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
  end;

var
  NotesForm: TNotesForm;

implementation

{$R *.DFM}

procedure TNotesForm.BackColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := Memo1.Color;
  if ColorDialog1.Execute then
    Memo1.Color := ColorDialog1.Color;
end;

procedure TNotesForm.Font1Click(Sender: TObject);
begin
  FontDialog1.Font := Memo1.Font;
  if FontDialog1.Execute then
    Memo1.Font := FontDialog1.Font;
end;

procedure TNotesForm.AlignLeft1Click(Sender: TObject);
begin
  Memo1.Alignment := taLeftJustify;
  AlignLeft1.Checked := True;
  AlignRight1.Checked := False;
  Center1.Checked := False;
end;

procedure TNotesForm.AlignRight1Click(Sender: TObject);
begin
  Memo1.Alignment := taRightJustify;
  AlignLeft1.Checked := False;
  AlignRight1.Checked := True;
  Center1.Checked := False;
end;

procedure TNotesForm.Center1Click(Sender: TObject);
begin
  Memo1.Alignment := taCenter;
  AlignLeft1.Checked := False;
  AlignRight1.Checked := False;
  Center1.Checked := True;
end;

procedure TNotesForm.WordWrap1Click(Sender: TObject);
begin
  if Memo1.WordWrap then
  begin
    Memo1.WordWrap := False;
    WordWrap1.Checked := False;
    Memo1.ScrollBars := ssBoth;
  end
  else
  begin
    Memo1.WordWrap := True;
    WordWrap1.Checked := True;
    Memo1.ScrollBars := ssVertical;
  end;
end;

procedure TNotesForm.ReadOnly1Click(Sender: TObject);
begin
  Memo1.ReadOnly := NOT Memo1.ReadOnly;
  ReadOnly1.Checked := NOT ReadOnly1.Checked;
end;

procedure TNotesForm.Countchars1Click(Sender: TObject);
var
  text: string;

begin
  Str(Memo1.GetTextLen, text);
  MessageDlg ('The text has ' + text + ' characters',
    mtInformation, [mbOK], 0);
end;

procedure TNotesForm.AboutNotes1Click(Sender: TObject);
begin
  MessageDlg ('The notes program has been written with ' +
    'Delphi for the book Mastering Delphi by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

procedure TNotesForm.FormCreate(Sender: TObject);
begin
  filename := '';
  modified := False;
end;

procedure TNotesForm.Memo1Change(Sender: TObject);
begin
  modified := True;
end;

procedure TNotesForm.New1Click(Sender: TObject);
begin
  if not modified or SaveChanges then
  begin
    Memo1.Text := '';
    modified := False;
    filename := '';
    NotesForm.Caption := 'Notes - [Untitled]';
  end;
end;

function TNotesForm.SaveChanges: Boolean;
{return value False means you need to skip current operation}
var
  code: Integer;
begin
  SaveChanges := True;
  code := MessageDlg ('The document ' + filename +
    ' has changed. Do you want to save the changes?',
    mtConfirmation, mbYesNoCancel, 0);
  if (code = IDYES) then
    SaveChanges := Save;
  if (code = IDCANCEL) then
    SaveChanges := False;
end;

function TNotesForm.Save: Boolean;
{return False if the SaveAs operation has been aborted}
begin
  if filename = '' then
    Save := SaveAs
  else
  begin
    modified := False;
    Memo1.Lines.SaveToFile(filename);
    Save := True;
  end;
end;

function TNotesForm.SaveAs: Boolean;
{return False if the dialog box has been 'cancelled'}
begin
  SaveDialog1.FileName := filename;
  if SaveDialog1.Execute then
  begin
    filename := SaveDialog1.FileName;
    Memo1.Lines.SaveToFile(filename);
    modified := False;
    NotesForm.Caption := 'Notes - ' + filename;
    SaveAs := True;
  end
  else
    SaveAs := False;
end;

procedure TNotesForm.Save1Click(Sender: TObject);
begin
  if modified then
    Save;
end;

procedure TNotesForm.Saveas1Click(Sender: TObject);
begin
  SaveAs;
end;

procedure TNotesForm.Open1Click(Sender: TObject);
begin
  if not modified or SaveChanges then
    if OpenDialog1.Execute then
    begin
      filename := OpenDialog1.FileName;
      Memo1.Lines.LoadFromFile(filename);
      modified := False;
      NotesForm.Caption := 'Notes - ' + filename;
    end;
end;

procedure TNotesForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if modified then
    if SaveChanges then
      CanClose := True
    else
      CanClose := False
  else
    CanClose := True;
end;

procedure TNotesForm.Exit1Click(Sender: TObject);
begin
  NotesForm.Close;
end;

procedure TNotesForm.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TNotesForm.Print1Click(Sender: TObject);
var
  PrintFile: TextFile;
  I: Integer;
begin
  if PrintDialog1.Execute then
  begin
    {assing the printer to a file}
    AssignPrn (PrintFile);
    Rewrite (PrintFile);
    {set the font}
    Printer.Canvas.Font := Memo1.Font;
    {copy all the text of the memo to the printer-file}
    for I := 0 to Memo1.Lines.Count - 1 do
      Writeln (PrintFile, Memo1.Lines [I]);
    System.CloseFile (PrintFile);
  end;
end;

procedure TNotesForm.Copy1Click(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TNotesForm.Cut1Click(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TNotesForm.Paste1Click(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TNotesForm.Edit1Click(Sender: TObject);
begin
  {if some text is selected in the memo,
  enable the cut and copy commands}
  if Memo1.SelLength > 0 then
  begin
    Copy1.Enabled := True;
    Cut1.Enabled := True;
  end
  else
  begin
    Copy1.Enabled := False;
    Cut1.Enabled := False;
  end;
  {if the clipboard contains some text,
  enable the Paste command}
  if Clipboard.HasFormat (CF_TEXT) then
    Paste1.Enabled := True
  else
    Paste1.Enabled := False;
end;

end.

