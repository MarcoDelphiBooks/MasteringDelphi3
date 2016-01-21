unit MyCurF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{$R HAND.RES}

const
  crHand = 1;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {load a custom cursor from the resources}
  Screen.Cursors [crhand] := LoadCursor (HInstance, 'HAND');

  {use the new cursor for the first panel}
  Panel1.Cursor := crHand;

  {select the crDefault line}
  ComboBox1.ItemIndex := 1;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  {select the cursor corresponding to the selected item}
  Panel2.Cursor := 1 - ComboBox1.ItemIndex;
end;

end.
