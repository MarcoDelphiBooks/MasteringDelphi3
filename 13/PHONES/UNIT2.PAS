unit Unit2;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

end.

