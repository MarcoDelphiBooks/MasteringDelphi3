unit MaskF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask;

type
  TForm1 = class(TForm)
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := MaskEdit1.EditMask;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  MaskEdit1.EditMask := Edit1.Text; 
end;

end.
