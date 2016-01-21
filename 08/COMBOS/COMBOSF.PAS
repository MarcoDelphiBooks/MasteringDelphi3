unit CombosF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ButtonAdd: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  with ComboBox1 do
    if (Text <> '') and (Items.IndexOf (Text) < 0) then
      Items.Add (Text);
end;

procedure TForm1.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  {if the user presses the enter key}
  if key = chr (13) then
    with ComboBox3 do
      if (Text <> '') and (Items.IndexOf (Text) < 0) then
        Items.Add (Text);
end;

end.
