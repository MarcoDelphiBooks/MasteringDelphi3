unit ProcForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  {procedure type definition}
  IntProc = procedure (var Num: Integer);

  TForm1 = class(TForm)
    ApplyButton: TButton;
    DoubleRadioButton: TRadioButton;
    TripleRadioButton: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure DoubleRadioButtonClick(Sender: TObject);
    procedure TripleRadioButtonClick(Sender: TObject);
  private
    { Private declarations }
    IP: IntProc;
    X: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{procedures of the IntProc type}
procedure DoubleTheValue (var Value: Integer);
begin
  Value := Value * 2;
  ShowMessage ('Value doubled: ' + IntToStr (Value));
end;

procedure TripleTheValue (var Value: Integer);
begin
  Value := Value * 3;
  ShowMessage ('Value tripled: ' + IntToStr (Value));
end;

{initialization code}
procedure TForm1.FormCreate(Sender: TObject);
begin
  IP := DoubleTheValue;
  X := 2;
end;

{push button OnClick event}
procedure TForm1.ApplyButtonClick(Sender: TObject);
begin
  IP (X);
end;

{Radio buttons OnClick events}
procedure TForm1.DoubleRadioButtonClick(Sender: TObject);
begin
  IP := DoubleTheValue;
end;

procedure TForm1.TripleRadioButtonClick(Sender: TObject);
begin
  IP := TripleTheValue;
end;

end.
