unit PhraseF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditNew: TEdit;
    ButtonAdd: TButton;
    RadioGroup1: TRadioGroup;
    Bevel1: TBevel;
    procedure ChangeText(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
  private
    String1, String2: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ChangeText(Sender: TObject);
var
  TmpStr: String;
begin
  // if a list box has changed
  if Sender is TListBox then
  begin
    // get the text of the first string
    TmpStr := ListBox1.Items [ListBox1.ItemIndex];
    // if the first one has changed
    if TmpStr <> String1 then
    begin
      // update the strings in ListBox2
      ListBox2.Items.Add (String1);
      ListBox2.Items.Delete (ListBox2.Items.IndexOf (TmpStr));
      ListBox2.ItemIndex := ListBox2.Items.IndexOf (String2);
      String1 := TmpStr;
    end;
    // get the text of the second string    
    TmpStr := ListBox2.Items [ListBox2.ItemIndex];
    // if the second one has changed
    if TmpStr <> String2 then
    begin
      // update the strings in ListBox1
      ListBox1.Items.Add (String2);
      ListBox1.Items.Delete (ListBox1.Items.IndexOf (TmpStr));
      ListBox1.ItemIndex := ListBox1.Items.IndexOf (String1);
      String2 := TmpStr;
    end;
  end;

  // build the phrase with the current strings
  Label1.Caption := 'The ' + String1 + ' is ' +
    RadioGroup1.Items [RadioGroup1.ItemIndex] +
    ' the ' + String2;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  N : Integer;
begin
  String1 := 'book';
  String2 := 'table';

  {delete the selected string from the other listbox
  to avoid a double selection}
  ListBox2.Items.Delete (ListBox2.Items.IndexOf (String1));
  ListBox1.Items.Delete (ListBox1.Items.IndexOf (String2));

  {selects the two strings in their respective listboxes}
  N := ListBox1.Items.IndexOf (String1);
  ListBox1.ItemIndex := N;
  N := ListBox2.Items.IndexOf (String2);
  ListBox2.ItemIndex := N;
end;

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  {if there is a string in the edit control and
  the string is not already present in one of the lists}
  if (EditNew.Text <> '') and
    (ListBox1.Items.IndexOf(EditNew.Text) < 0) and
    (ListBox2.Items.IndexOf(EditNew.Text) < 0) then
  begin
    {add the string to both listboxes}
    ListBox1.Items.Add (EditNew.Text);
    ListBox2.Items.Add (EditNew.Text);

    {re-selects the current items properly}
    ListBox1.ItemIndex := ListBox1.Items.IndexOf (String1);
    ListBox2.ItemIndex := ListBox2.Items.IndexOf (String2);
  end
  else
    MessageDlg ('The edit control is empty or contains'
      + ' a string which is already present',
      mtError, [mbOK], 0);
end;

end.

