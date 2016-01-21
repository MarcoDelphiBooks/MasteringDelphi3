unit ViewF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DdeMan, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    DdeClientConv1: TDdeClientConv;
    DdeClientItem1: TDdeClientItem;
    procedure DdeClientItem1Change(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Values: array [0..4] of Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DdeClientItem1Change(Sender: TObject);
var
  I: Integer;
begin
  {extract the numbers}
  for I := 0 to 4 do
    if I < DdeClientItem1.Lines.Count then
      Values [I] := StrToIntDef (DdeClientItem1.Lines[I], 50);
  Invalidate;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  I, DX, DY: Integer;
  Scale: Real;
begin
  {DX is the width of each band}
  DX := ClientWidth div 11;
  {DY is the height corresponding to a value of 100}
  DY := ClientHeight div 3;
  Scale := DY / 100;

  {draw axis, at Y=0}
  Canvas.Pen.Width := 3;
  Canvas.MoveTo (0, DY * 2);
  Canvas.LineTo (ClientWidth, DY * 2);

  {draw 100 mark}
  Canvas.Pen.Width := 1;
  Canvas.MoveTo (0, DY);
  Canvas.LineTo (ClientWidth, DY);

  for I := 0 to 4 do
  begin
    {green for positive values,
    red for negative values}
    if Values [I] > 0 then
      Canvas.Brush.Color := clGreen
    else
      Canvas.Brush.Color := clRed;
    {draw the bar}
    Canvas.Rectangle (DX * (2 * I + 1),
      DY * 2 - Round (Values [I] * Scale),
      DX * (2 * I + 2),
      DY * 2);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if DdeClientConv1.SetLink ('dataserv', 'Data DDE Server') then
    DdeClientItem1.DdeItem := 'DdeServerItem1'
  else
    ShowMessage ('Start the server before the client');
end;

end.
