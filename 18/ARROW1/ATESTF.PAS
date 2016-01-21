unit ATestF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Arrow1, StdCtrls, Spin, ExtCtrls;

type
  TForm1 = class(TForm)
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SizeButton: TButton;
    TurnButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure SizeButtonClick(Sender: TObject);
    procedure TurnButtonClick(Sender: TObject);
  private
    A: TMd3Arrow;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  A := TMd3Arrow.Create (self);
  A.Parent := self;
  A.Left := 150;
  A.Top := 150;
  A.Width := 20;
  A.Height := 30;
end;

procedure TForm1.SizeButtonClick(Sender: TObject);
begin
  A.Width := SpinEdit1.Value;
  A.Height := SpinEdit2.Value;
end;

procedure TForm1.TurnButtonClick(Sender: TObject);
begin
  if A.Direction = High (TArrowDirection) then
    A.Direction := Low (TArrowDirection)
  else
    A.Direction := Succ (A.Direction);
end;

end.
