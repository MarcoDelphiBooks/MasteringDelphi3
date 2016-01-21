unit PhraseF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioBook: TRadioButton;
    RadioPen: TRadioButton;
    RadioPencil: TRadioButton;
    RadioOn: TRadioButton;
    RadioUnder: TRadioButton;
    RadioNear: TRadioButton;
    RadioChair: TRadioButton;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    procedure ChangeText(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ChangeText(Sender: TObject);
var
  Phrase: string;
  I: integer;
begin
  {look at which radio button is selected
  and add its text to the phrase}
  for I := 0 to GroupBox1.ControlCount - 1 do
    if (GroupBox1.Controls[I] as TRadioButton).Checked then
      Phrase := (GroupBox1.Controls[I] as TRadioButton).Caption;

  {add the verb and blank spaces}
  Phrase := Phrase + ' is ';

  {repeat the operation on the second group box}
  for I := 0 to GroupBox2.ControlCount - 1 do
    with GroupBox2.Controls[I] as TRadioButton do
      if Checked then
        Phrase := Phrase + Caption;

  {retrieve the radiogroup selection, and display
  the result in the label}
  Label1.Caption := Phrase + ' ' +
    RadioGroup1.Items [RadioGroup1.ItemIndex];
end;

end.

