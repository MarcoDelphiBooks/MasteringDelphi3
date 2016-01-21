unit ListsF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Tablist;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    AddButton: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Md3TabList1: TMd3TabList;
    procedure AddButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.AddButtonClick(Sender: TObject);
var
  NewItem: String;
begin
  if Edit1.Text <> '' then
  begin
    NewItem := Edit1.Text + #9 + Edit2.Text +
      #9 + Edit3.Text;
    Md3TabList1.Items.Add (NewItem);
    ListBox1.Items.Add (NewItem);
  end;
end;

end.
