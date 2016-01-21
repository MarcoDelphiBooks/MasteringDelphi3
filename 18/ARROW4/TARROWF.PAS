unit TArrowF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Arrow4, ExtCtrls;

type
  TForm1 = class(TForm)
    Md3Arrow1: TMd3Arrow;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape1: TShape;
    Md3Arrow4: TMd3Arrow;
    Md3Arrow2: TMd3Arrow;
    Md3Arrow3: TMd3Arrow;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ArrowDoubleClick(Sender: TObject);
  private
    Active: Integer;
    Graph: array [1..8] of TGraphicControl;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Active := 1;
  Shape1.Brush.Color := clYellow;
  for I := 1 to 4 do
  begin
    Graph [I * 2 - 1] :=
      (FindComponent ('Shape' + IntToStr (I)) as TGraphicControl);
    Graph [I * 2] :=
      (FindComponent ('Md3Arrow' + IntToStr (I)) as TGraphicControl);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Graph [Active] is TMd3Arrow then
    TMd3Arrow (Graph [Active]).Brush.Color := clWhite
  else
    TShape (Graph [Active]).Brush.Color := clWhite;
  Active := Active mod 8 + 1;
  if Graph [Active] is TMd3Arrow then
    TMd3Arrow (Graph [Active]).Brush.Color := clRed
  else
    TShape (Graph [Active]).Brush.Color := clYellow;
end;

procedure TForm1.ArrowDoubleClick(Sender: TObject);
begin
  if (Sender as TMd3Arrow).Brush.Color = clRed then
    ShowMessage ('Double-click on active arrow');
end;

end.
