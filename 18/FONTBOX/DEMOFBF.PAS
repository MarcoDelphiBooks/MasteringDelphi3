unit DemoFbF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FontBox;

type
  TForm1 = class(TForm)
    Md3FontCombo1: TMd3FontCombo;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Md3FontCombo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Md3FontCombo1Change(Sender: TObject);
begin
  Memo1.Font.Name :=
    Md3FontCombo1.Items [Md3FontCombo1.ItemIndex];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Md3FontCombo1.ItemIndex :=
    Md3FontCombo1.Items.IndexOf (Memo1.Font.Name);
end;

end.

