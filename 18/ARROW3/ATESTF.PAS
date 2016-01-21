unit ATestF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Arrow3, StdCtrls, Spin, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PenLabel: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SizeButton: TButton;
    SpinEdit3: TSpinEdit;
    TurnButton: TButton;
    FilledCheckBox: TCheckBox;
    BrushButton: TButton;
    PenButton: TButton;
    ColorDialog1: TColorDialog;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure SizeButtonClick(Sender: TObject);
    procedure TurnButtonClick(Sender: TObject);
    procedure FilledCheckBoxClick(Sender: TObject);
    procedure BrushButtonClick(Sender: TObject);
    procedure PenButtonClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    A: TMd3Arrow;
  public
    procedure ArrowDoubleClick (Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  A := TMd3Arrow.Create (self);
  A.Parent := self;
  A.Left := 200;
  A.Top := 200;
  A.Width := 20;
  A.Height := 30;
  A.ArrowHeight := 15;
  A.OnArrowDblClick := ArrowDoubleClick;
end;

procedure TForm1.SizeButtonClick(Sender: TObject);
begin
  A.Width := SpinEdit1.Value;
  A.Height := SpinEdit2.Value;
  A.ArrowHeight := SpinEdit3.Value;
end;

procedure TForm1.TurnButtonClick(Sender: TObject);
begin
  if A.Direction = High (TArrowDirection) then
    A.Direction := Low (TArrowDirection)
  else
    A.Direction := Succ (A.Direction);
end;

procedure TForm1.FilledCheckBoxClick(Sender: TObject);
begin
  A.Filled := not A.Filled;
end;

procedure TForm1.BrushButtonClick(Sender: TObject);
begin
  ColorDialog1.Color := A.Brush.Color;
  if ColorDialog1.Execute then
    A.Brush.Color := ColorDialog1.Color;
end;

procedure TForm1.PenButtonClick(Sender: TObject);
begin
  ColorDialog1.Color := A.Pen.Color;
  if ColorDialog1.Execute then
    A.Pen.Color := ColorDialog1.Color;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  PenLabel.Caption := 'Pen Width: ' +
    IntToStr (TrackBar1.Position);
  A.Pen.Width := TrackBar1.Position;
end;

procedure TForm1.ArrowDoubleClick (Sender: TObject);
begin
  ShowMessage ('You have double clicked ' +
    'on the point of the arrow');
end;

end.
