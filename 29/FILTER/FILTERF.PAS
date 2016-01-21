unit FilterF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, ConvF;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    ConvertBitBtn: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ConvertBitBtnClick(Sender: TObject);
  private
    FileIn, FileOut: TextFile;
    FileLength: LongInt;
    procedure ConvUpper;
    procedure ConvCapitalize;
    procedure ConvSymbols;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function LowCase (C: Char): Char;
begin
  if C in ['A'..'Z'] then
    LowCase := Chr (Ord (C) - Ord ('A') + Ord ('a'))
  else
    LowCase := C;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.Filename;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Edit2.Text := SaveDialog1.Filename;
end;

procedure TForm1.ConvertBitBtnClick(Sender: TObject);
var
  F: file of Byte;
begin
  if (Edit1.Text <> '') and (Edit2.text <> '') then
  begin
    {compute the length of the first file}
    AssignFile (F, Edit1.Text);
    Reset (F);
    try
      FileLength := FileSize (F);
    finally
      CloseFile (F);
    end;
    {open the text files}
    AssignFile (FileIn, Edit1.Text);
    Reset (FileIn);
    try
      AssignFile (FileOut, Edit2.Text);
      {prepare the user interface}
      Rewrite (FileOut);
      try
        ConvertForm.Show;
        ConvertForm.BitBtn1.Enabled := False;
        ConvertBitBtn.Enabled := False;
        try
          {conversion...}
          case RadioGroup1.ItemIndex of
            0: ConvUpper;
            1: ConvCapitalize;
            2: ConvSymbols;
          end;
        finally
          ConvertBitBtn.Enabled := True;
          ConvertForm.BitBtn1.Enabled := True;
        end;
      finally
        {close the files and reset the UI}
        CloseFile (FileOut);
      end;
    finally
      CloseFile (FileIn);
    end;
  end
  else
    ShowMessage ('Enter file names');
end;

procedure TForm1.ConvUpper;
var
  Ch: Char;
  Position: LongInt;
begin
  Position := 0;
  while not Eof (FileIn) do
  begin
    Read (FileIn, Ch);
    Ch := UpCase (Ch);
    Write (FileOut, Ch);
    Inc (Position);
    ConvertForm.ProgressBar1.Position :=
      Position * 100 div FileLength;
  end;
end;

procedure TForm1.ConvCapitalize;
var
  Ch: Char;
  Period: Boolean;
  Position: LongInt;
begin
  Period := True;
  Position := 0;
  while not Eof (FileIn) do
  begin
    Read (FileIn, Ch);
    case Ch of
      'A'..'Z':
        if Period then
        begin
          Write (FileOut, Ch);
          Period := False;
        end
        else
        begin
          Ch := LowCase (Ch);
          Write (FileOut, Ch);
          Period := False;
        end;
      'a'..'z':
        if Period then
        begin
          Ch := UpCase (ch);
          Write (FileOut, Ch);
          Period := False;
        end
        else
        begin
          Write (FileOut, Ch);
          Period := False;
        end;
      '.', '?', '!':
      begin
        Period := True;
        Write (FileOut, Ch);
      end;
      else
        Write (FileOut, Ch);
    end; {end of case}
    Inc (Position);
    ConvertForm.ProgressBar1.Position :=
      Position * 100 div FileLength;
  end; {end of while}
end;

procedure TForm1.ConvSymbols;
var
  Ch: Char;
  Position: LongInt;
begin
  Position := 0;
  while not Eof (FileIn) do
  begin
    Read (FileIn, Ch);
    if Ch < Chr (127) then
      Write (FileOut, Ch);
    Inc (Position);
    ConvertForm.ProgressBar1.Position :=
      Position * 100 div FileLength;
  end;
end;

end.
