unit PhraseF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    EditNew: TEdit;
    ButtonAdd: TButton;
    RadioGroup1: TRadioGroup;
    procedure ChangeText(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
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
  Phrase, TmpStr1, TmpStr2: String;
  SelectCount, ListItem: Integer;
begin
  SelectCount := 0;
  {look at each item of the multiple selection listbox}
  for ListItem := 0 to ListBox1.Items.Count - 1 do
    if ListBox1.Selected [ListItem] then
    begin
      {if the item is selected increase the count}
      Inc (SelectCount);
      if SelectCount = 1 then
      begin
        {store the string of the first selection}
        TmpStr1 := ListBox1.Items.Strings [ListItem];
        TmpStr2 := TmpStr1;
      end
      else if SelectCount = 2 then
      begin
        {add the string of the second selection}
        TmpStr1 := TmpStr1 + ' and the ' + ListBox1.Items.Strings [ListItem];
        TmpStr2 := TmpStr2 + ', the ' + ListBox1.Items.Strings [ListItem];
      end
      else // SelectCount > 2
      begin
        {add the string of the further selection}
        TmpStr1 := TmpStr2 + ', and the ' + ListBox1.Items.Strings [ListItem];
        TmpStr2 := TmpStr2 + ', the ' + ListBox1.Items.Strings [ListItem];
      end;
    end;

  {build the first part of the phrase}
  if SelectCount > 0 then
    Phrase := 'The ' + TmpStr1
  else
    Phrase := 'Nothing';

  if SelectCount <= 1 then
    Phrase := Phrase + ' is '
  else
    Phrase := Phrase + ' are ';

  {add the text of the radio button}
  Phrase := Phrase +
    RadioGroup1.Items [RadioGroup1.ItemIndex];

  {add the text of the second listbox}
  Phrase := Phrase + ' the ' +
    ListBox2.Items [ListBox2.ItemIndex];

  Label1.Caption := Phrase;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {select two strings in their respective listboxes}
  ListBox1.ItemIndex := ListBox1.Items.IndexOf ('book');
  ListBox2.ItemIndex := ListBox2.Items.IndexOf ('table');
end;

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  {if there is a string in the edit control and
    the string is not already present in one of the lists}
  if (EditNew.Text <> '') and
      (ListBox1.Items.IndexOf (EditNew.Text) < 0) then
    begin
      {add the string to both listboxes}
      ListBox1.Items.Add (EditNew.Text);
      ListBox2.Items.Add (EditNew.Text);

      {re-select the items of the second list properly
        (the multiple selection list works automatically)}
      ListBox2.ItemIndex := ListBox2.Items.IndexOf
        (ListBox2.Items [ListBox2.ItemIndex]);
    end
  else
    MessageDlg ('The edit control is empty or ' +
      'contains a string which is already present',
      mtError, [mbOK], 0);
end;

end.

