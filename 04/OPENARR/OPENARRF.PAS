unit OpenArrF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

// typed open array
function Sum (const A: array of Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low (A) to High (A) do
    Result := Result + A[I];
end;

// untyped open array
function SumAll (const Args: array of const): Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := Low (Args) to High (Args) do
    case Args [I].VType of
      vtInteger: Result :=
        Result + Args [I].VInteger;
      vtBoolean:
        if Args [I].VBoolean then
          Result := Result + 1;
      vtChar:
        Result := Result + Ord (Args [I].VChar);
      vtExtended:
        Result := Result + Args [I].VExtended^;
      vtString, vtAnsiString:
        Result := Result + StrToIntDef ((Args [I].VString^), 0);
      vtWideChar:
        Result := Result + Ord (Args [I].VWideChar);
      vtCurrency:
        Result := Result + Args [I].VCurrency^;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y, I: Integer;
begin
  Y := 10;
  I := 3;
  X := Sum ([10, Y, 27*I]);
  ShowMessage ('Sum ([10, Y, 27*I]) => ' +
    IntToStr (X));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  List: array [1..10] of Integer;
  X, I: Integer;
begin
  // initialize array
  for I := Low (List) to High (List) do
    List [I] := I * 2;
  // call
  X := Sum (List);
  ShowMessage ('Sum (List)) => ' +
    IntToStr (X));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  List: array [1..10] of Integer;
  X, I: Integer;
begin
  // initialize array
  for I := Low (List) to High (List) do
    List [I] := I * 2;
  // call
  X := Sum (Slice (List, 5));
  ShowMessage ('Sum (Slice (List, 5)) => ' +
    IntToStr (X));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  X: Extended;
  Y: Integer;
begin
  Y := 10;
  X := SumAll ([Y * Y, 'k', True, 10.34, '99999']);
  ShowMessage (Format (
    'SumAll ([Y * Y, ''k'', True, 10.34, ''99999'']) => %n',
    [X]));
end;

end.
