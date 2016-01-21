unit RichForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus;

type
  TFormRichNote = class(TForm)
    RichEdit1: TRichEdit;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Font1: TMenuItem;
    TimesRoman1: TMenuItem;
    Courier1: TMenuItem;
    Arial1: TMenuItem;
    N2: TMenuItem;
    Bold1: TMenuItem;
    Italic1: TMenuItem;
    Paragraph1: TMenuItem;
    LeftAligned1: TMenuItem;
    Centered1: TMenuItem;
    RightAligned1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    N3: TMenuItem;
    Small1: TMenuItem;
    Medium1: TMenuItem;
    Large1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N7: TMenuItem;
    More1: TMenuItem;
    ColorDialog1: TColorDialog;
    ReadOnly1: TMenuItem;
    procedure TimesRoman1Click(Sender: TObject);
    procedure Bold1Click(Sender: TObject);
    procedure Italic1Click(Sender: TObject);
    procedure Large1Click(Sender: TObject);
    procedure RightAligned1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure RichEdit1SelectionChange(Sender: TObject);
    procedure BackColor1Click(Sender: TObject);
    procedure More1Click(Sender: TObject);
    procedure Countchars1Click(Sender: TObject);
    procedure ReadOnly1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Print1Click(Sender: TObject);
  private
    FileName: string;
    Modified: Boolean;
  public
    function SaveChanges: Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
  end;

var
  FormRichNote: TFormRichNote;

implementation

{$R *.DFM}

///////////////
// Font Menu //
///////////////

// any specific font (times + arial + curioer)
procedure TFormRichNote.TimesRoman1Click(Sender: TObject);
var
  FontName: string;
begin
  // get the font name and remove the &
  FontName := (Sender as TMenuItem).Caption;
  Delete (FontName, 1, 1);
  // change selected text font
  if RichEdit1.SelLength > 0 then
    RichEdit1.SelAttributes.Name := FontName;
  (Sender as TMenuItem).Checked := True;
end;

procedure TFormRichNote.Bold1Click(Sender: TObject);
begin
  // toggle bold style
  Bold1.Checked := not Bold1.Checked;
  if RichEdit1.SelLength > 0 then
    with RichEdit1.SelAttributes do
      if Bold1.Checked then
        Style := Style + [fsBold]
      else
        Style := Style - [fsBold];
end;

procedure TFormRichNote.Italic1Click(Sender: TObject);
begin
  // toggle italic style
  Italic1.Checked := not Italic1.Checked;
  if RichEdit1.SelLength > 0 then
    with RichEdit1.SelAttributes do
      if Italic1.Checked then
        Style := Style + [fsItalic]
      else
        Style := Style - [fsItalic];
end;

// small + medium + large
procedure TFormRichNote.Large1Click(Sender: TObject);
begin
  // change selected text font size
  if RichEdit1.SelLength > 0 then
    RichEdit1.SelAttributes.Size :=
      (Sender as TMenuItem).Tag;
  (Sender as TMenuItem).Checked := True;
end;

procedure TFormRichNote.More1Click(Sender: TObject);
begin
  FontDialog1.Font := RichEdit1.Font;
  if FontDialog1.Execute then
    RichEdit1.SelAttributes.Assign (
      FontDialog1.Font);
  // update the check marks
  RichEdit1SelectionChange (self);
end;

////////////////////
// Paragraph Menu //
////////////////////

// right + center + left
procedure TFormRichNote.RightAligned1Click(Sender: TObject);
begin
  // change paragraph alignment
  RichEdit1.Paragraph.Alignment :=
    TAlignment ((Sender as TMenuItem).MenuIndex);
  (Sender as TMenuItem).Checked := True;
end;

///////////////
// Help Menu //
///////////////

procedure TFormRichNote.About1Click(Sender: TObject);
begin
  MessageDlg ('RichNote version 0.2' + #13#13
    + 'written for the book Mastering Delphi by Marco Cantù',
    mtInformation, [mbOK], 0);
end;

///////////////
// File Menu //
///////////////

procedure TFormRichNote.New1Click(Sender: TObject);
begin
  if not Modified or SaveChanges then
  begin
    RichEdit1.Text := '';
    Modified := False;
    FileName := '';
    Caption := 'RichNote - [Untitled]';
  end;
end;

procedure TFormRichNote.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRichNote.Open1Click(Sender: TObject);
begin
  if not Modified or SaveChanges then
    if OpenDialog1.Execute then
    begin
      Filename := OpenDialog1.FileName;
      RichEdit1.Lines.LoadFromFile (FileName);
      Modified := False;
      Caption := 'RichNote - ' + FileName;
    end;
end;

{a return value "False" means you need to
skip current operation}
function TFormRichNote.SaveChanges: Boolean;
begin
  case MessageDlg (
    'The document ' + filename + ' has changed.' +
    #13#13 + 'Do you want to save the changes?',
    mtConfirmation, mbYesNoCancel, 0) of
  idYes:
    // call Save and return its result
    Result := Save;
  idNo:
    // do not save and continue
    Result := True;
  else // idCancel:
    // do not save and abort operation
    Result := False;
  end;
end;

{a return value "False" means the SaveAs
operation has been aborted}
function TFormRichNote.Save: Boolean;
begin
  if Filename = '' then
    Result := SaveAs // ask for a file name
  else
  begin
    RichEdit1.Lines.SaveToFile (FileName);
    Modified := False;
    Result := True;
  end;
end;

{return a value "False" if the SaveAs
dialog box has been 'cancelled'}
function TFormRichNote.SaveAs: Boolean;
begin
  SaveDialog1.FileName := Filename;
  if SaveDialog1.Execute then
  begin
    Filename := SaveDialog1.FileName;
    Save;
    Caption := 'RichNote - ' + Filename;
    Result := True;
  end
  else
    Result := False;
end;
//
procedure TFormRichNote.Save1Click(Sender: TObject);
begin
  if Modified then
    Save;
end;

procedure TFormRichNote.Saveas1Click(Sender: TObject);
begin
  SaveAs;
end;

procedure TFormRichNote.Print1Click(Sender: TObject);
begin
  RichEdit1.Print (FileName);
end;

//////////////
// RichEdit //
//////////////

procedure TFormRichNote.RichEdit1Change(Sender: TObject);
begin
  Modified := True;
end;

procedure TFormRichNote.RichEdit1SelectionChange(Sender: TObject);
var
  FontName: string;
  I: Integer;
begin
  {Notice: this method does not work properly
  when you set a custom font: to fix it we should
  remove any radio check mark when the value is not
  one of the possible selections}

  // check the font name radio menu item
  FontName := '&' + RichEdit1.SelAttributes.Name;
  for I := 0 to 2 do
    with Font1.Items [I] do
      if FontName = Caption then
        Checked := True;
  // check the bold and italic items
  Italic1.Checked := fsItalic in
    RichEdit1.SelAttributes.Style;
  Bold1.Checked := fsBold in
    RichEdit1.SelAttributes.Style;
  // check the font size
  for I := Small1.MenuIndex to
      Large1.MenuIndex do
    with Font1.Items [I] do
      if Tag = RichEdit1.SelAttributes.Size then
        Checked := True;
  // check the paragraph style
  Paragraph1.Items [Integer (
    RichEdit1.Paragraph.Alignment)].
    Checked := True;
end;

//////////////////
// Options Menu //
//////////////////

procedure TFormRichNote.BackColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := RichEdit1.Color;
  if ColorDialog1.Execute then
    RichEdit1.Color := ColorDialog1.Color;
end;

procedure TFormRichNote.Countchars1Click(Sender: TObject);
begin
  MessageDlg (Format (
    'The text has %d characters', [RichEdit1.GetTextLen]),
    mtInformation, [mbOK], 0);
end;

procedure TFormRichNote.ReadOnly1Click(Sender: TObject);
begin
  RichEdit1.ReadOnly := not RichEdit1.ReadOnly;
  ReadOnly1.Checked := not ReadOnly1.Checked;
end;

//////////
// Form //
//////////
//
procedure TFormRichNote.FormCreate(Sender: TObject);
begin
  FileName := '';
  Modified := False;
end;

procedure TFormRichNote.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // short-circuit evaluation
  CanClose := not Modified or SaveChanges;
end;

end.
