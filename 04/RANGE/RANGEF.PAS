unit RangeF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TFormRange = class(TForm)
    LabelSize: TLabel;
    LabelMax: TLabel;
    LabelMin: TLabel;
    BtnInteger: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnShort: TButton;
    BtnCardinal: TButton;
    BtnWord: TButton;
    BtnByte: TButton;
    Label1: TLabel;
    LabelType: TLabel;
    BtnSmall: TButton;
    procedure BtnIntegerClick(Sender: TObject);
    procedure BtnShortClick(Sender: TObject);
    procedure BtnCardinalClick(Sender: TObject);
    procedure BtnWordClick(Sender: TObject);
    procedure BtnByteClick(Sender: TObject);
    procedure BtnSmallClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRange: TFormRange;

implementation

{$R *.DFM}

procedure TFormRange.BtnIntegerClick(Sender: TObject);
begin
  LabelType.Caption := 'Integer';
  LabelSize.Caption := IntToStr (SizeOf (Integer));
  LabelMax.Caption := IntToStr (High (Integer));
  LabelMin.Caption := IntToStr (Low (Integer));
end;
                         
procedure TFormRange.BtnShortClick(Sender: TObject);
begin
  LabelType.Caption := 'Short Int';
  LabelSize.Caption := IntToStr (SizeOf (ShortInt));
  LabelMax.Caption := IntToStr (High (ShortInt));
  LabelMin.Caption := IntToStr (Low (ShortInt));
end;

procedure TFormRange.BtnCardinalClick(Sender: TObject);
begin
  LabelType.Caption := 'Cardinal';
  LabelSize.Caption := IntToStr (SizeOf (Cardinal));
  LabelMax.Caption := Format ('%x ??', [High (Cardinal)]);
  LabelMin.Caption := IntToStr (Low (Cardinal));
end;

procedure TFormRange.BtnWordClick(Sender: TObject);
begin
  LabelType.Caption := 'Word';
  LabelSize.Caption := IntToStr (SizeOf (Word));
  LabelMax.Caption := IntToStr (High (Word));
  LabelMin.Caption := IntToStr (Low (Word));
end;

procedure TFormRange.BtnByteClick(Sender: TObject);
begin
  LabelType.Caption := 'Byte';
  LabelSize.Caption := IntToStr (SizeOf (Byte));
  LabelMax.Caption := IntToStr (High (Byte));
  LabelMin.Caption := IntToStr (Low (Byte));
end;

procedure TFormRange.BtnSmallClick(Sender: TObject);
begin
  LabelType.Caption := 'Small Int';
  LabelSize.Caption := IntToStr (SizeOf (SmallInt));
  LabelMax.Caption := IntToStr (High (SmallInt));
  LabelMin.Caption := IntToStr (Low (SmallInt));
end;

end.
