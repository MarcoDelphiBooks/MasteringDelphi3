unit GridForm;

interface

uses Windows, Classes, Graphics, Forms, Controls, ColorGrd,
  StdCtrls;

type
  TForm1 = class(TForm)
    ColorGrid1: TColorGrid;
    Label1: TLabel;
    procedure ColorGrid1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ColorGrid1Change(Sender: TObject);
begin
  Label1.Color := ColorGrid1.BackgroundColor;
  Label1.Font.Color := ColorGrid1.ForegroundColor;
end;

end.
