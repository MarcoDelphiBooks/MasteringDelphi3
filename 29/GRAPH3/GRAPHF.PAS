unit GraphF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, OleCtrls, Menus,
  ExtCtrls, TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Panel1: TPanel;
    ChBoxMarks: TCheckBox;
    UpdateButton: TButton;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure StringGrid1GetEditMask(Sender: TObject; ACol, ARow: Longint;
      var Value: string);
    procedure Exit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ChBoxMarksClick(Sender: TObject);
  private
    Modified: Boolean;
    CurrentFile: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J: Integer;
begin
  with StringGrid1 do
  begin
    {fills the fixed column and row,
    and the chart series names}
    for I := 1 to 5 do
      Cells [I, 0] := Format ('Group%d', [I]);
    for J := 1 to 4 do
    begin
      Cells [0, J] := Format ('Series%d', [J]);
      Chart1.Series [J-1].Title := Format ('Series%d', [J]);
    end;

    {fills the grid with random values}
    Randomize;
    for I := 1 to 5 do
      for J := 1 to 4 do
        Cells [I, J] := IntToStr (Random (100));
  end; // with

  // update the chart
  UpdateButtonClick (self);
end;

procedure TForm1.UpdateButtonClick(Sender: TObject);
var
  I, J: Integer;
begin
  for I := 1 to 4 do
  begin
    Chart1.Series [I-1].Clear;
    for J := 1 to 5 do
      Chart1.Series [I-1].Add (
        StrToInt (StringGrid1.Cells [J, I]),
        '', Chart1.Series [I-1].SeriesColor);
  end;
  Modified := True;
end;

procedure TForm1.StringGrid1GetEditMask(Sender: TObject; ACol,
  ARow: Longint; var Value: string);
begin
  // edit mask for the grid cells
  Value := '09;0';
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Code: Word;
begin
  if Modified then
  begin
    Code := MessageDlg (
      'Data has changed, do you want to save it?',
      mtConfirmation, mbYesNoCancel, 0);
    if Code = idYes then
      Save1Click (self);
    if Code = idCancel then
      CanClose := False
    else
      CanClose := True;
  end
  else
    CanClose := True;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  LoadFile: file of Integer;
  I, J, Value: Integer;
begin
  if OpenDialog1.Execute then
  begin
    CurrentFile := OpenDialog1.Filename;
    Caption := 'Graph 3 [' + CurrentFile + ']';
    {load from the current file}
    AssignFile (LoadFile, CurrentFile);
    Reset (LoadFile);
    try
      {read the value of each grid element}
      for I := 1 to 5 do
        for J := 1 to 4 do
        begin
          Read (LoadFile, Value);
          StringGrid1.Cells [I, J] := IntToStr(Value);
        end;
      Read (LoadFile, Value);
      ChBoxMarks.Checked := Boolean(Value);
    finally
      CloseFile (LoadFile);
    end;
    ChBoxMarksClick (self);
    UpdateButtonClick (self);
    Modified := False;
  end;
end;

procedure TForm1.Save1Click(Sender: TObject);
var
  SaveFile: file of Integer;
  I, J, Value: Integer;
begin
  if Modified then
    if CurrentFile = '' then
      {call save as}
      SaveAs1Click (self)
    else
    begin
      {save to the current file}
      AssignFile (SaveFile, CurrentFile);
      Rewrite (SaveFile);
      try
        {write the value of each grid element}
        for I := 1 to 5 do
          for J := 1 to 4 do
          begin
            Value := StrToIntDef (Trim (
              StringGrid1.Cells [I, J]), 0);
            Write (SaveFile, Value);
          end;
        Value := Integer (ChBoxMarks.Checked);
        Write (SaveFile, Value);
        Modified := False;
      finally
        CloseFile (SaveFile);
      end;
    end;
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    CurrentFile := SaveDialog1.Filename;
    Caption := 'Graph 3 [' + CurrentFile + ']';
    {call save}
    Modified := True;
    Save1Click (self);
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Graph example with file support' +
    #13'from "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOk], 0);
end;


procedure TForm1.ChBoxMarksClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 4 do
    Chart1.Series [I-1].Marks.Visible :=
      ChBoxMarks.Checked;
end;

end.
