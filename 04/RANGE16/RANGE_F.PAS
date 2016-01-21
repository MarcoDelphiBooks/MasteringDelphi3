unit Range_f;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    SizeLabel: TLabel;
    MaxLabel: TLabel;
    MinLabel: TLabel;
    IntButton: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ShortButton: TButton;
    LongButton: TButton;
    WordButton: TButton;
    CharButton: TButton;
    ByteButton: TButton;
    procedure IntButtonClick(Sender: TObject);
    procedure ShortButtonClick(Sender: TObject);
    procedure LongButtonClick(Sender: TObject);
    procedure WordButtonClick(Sender: TObject);
    procedure CharButtonClick(Sender: TObject);
    procedure ByteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.IntButtonClick(Sender: TObject);
var
   Number: Integer;

begin
  Number := 34;
  SizeLabel.Caption := IntToStr (SizeOf (Number));
  MaxLabel.Caption := IntToStr (High (Number));
  MinLabel.Caption := IntToStr (Low (Number));
end;

procedure TForm1.ShortButtonClick(Sender: TObject);
var
   Number: ShortInt;

begin
  Number := 34;
  SizeLabel.Caption := IntToStr (SizeOf (Number));
  MaxLabel.Caption := IntToStr (High (Number));
  MinLabel.Caption := IntToStr (Low (Number));
end;

procedure TForm1.LongButtonClick(Sender: TObject);
var
   Number: LongInt;

begin
  Number := 34;
  SizeLabel.Caption := IntToStr (SizeOf (Number));
  MaxLabel.Caption := IntToStr (High (Number));
  MinLabel.Caption := IntToStr (Low (Number));
end;

procedure TForm1.WordButtonClick(Sender: TObject);
var
   Number: Word;

begin
  Number := 34;
  SizeLabel.Caption := IntToStr (SizeOf (Number));
  MaxLabel.Caption := IntToStr (High (Number));
  MinLabel.Caption := IntToStr (Low (Number));
end;

procedure TForm1.CharButtonClick(Sender: TObject);
var
   Number: Char;

begin
  Number := 'x';
  SizeLabel.Caption := IntToStr (SizeOf (Number));
  MaxLabel.Caption := IntToStr (Ord (High (Number)));
  MinLabel.Caption := IntToStr (Ord (Low (Number)));
end;

procedure TForm1.ByteButtonClick(Sender: TObject);
var
   Number: Byte;

begin
  Number := 34;
  SizeLabel.Caption := IntToStr (SizeOf (Number));
  MaxLabel.Caption := IntToStr (High (Number));
  MinLabel.Caption := IntToStr (Low (Number));
end;

end.
