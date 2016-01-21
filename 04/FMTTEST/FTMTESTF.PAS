unit FtmTestF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFormFmtTest = class(TForm)
    EditFmtInt: TEdit;
    EditFmtFloat: TEdit;
    BtnFloat: TButton;
    ListBoxInt: TListBox;
    ListBoxFloat: TListBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    BtnInt: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditInt: TEdit;
    EditFloat: TEdit;
    Label6: TLabel;
    BtnPointer: TButton;
    procedure BtnIntClick(Sender: TObject);
    procedure BtnFloatClick(Sender: TObject);
    procedure BtnPointerClick(Sender: TObject);
    procedure ListBoxIntClick(Sender: TObject);
    procedure ListBoxFloatClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFmtTest: TFormFmtTest;

implementation

{$R *.DFM}

procedure TFormFmtTest.BtnIntClick(Sender: TObject);
begin
  ShowMessage (Format (EditFmtInt.Text,
    [StrToInt (EditInt.Text)]));
  // if the item is not there, add it
  if ListBoxInt.Items.IndexOf (EditFmtInt.Text) < 0 then
    ListBoxInt.Items.Add (EditFmtInt.Text);
end;

procedure TFormFmtTest.BtnFloatClick(Sender: TObject);
begin
  ShowMessage (Format (EditFmtFloat.Text,
    [StrToFloat (EditFloat.Text)]));
  // if the item is not there, add it
  if ListBoxFloat.Items.IndexOf (EditFmtFloat.Text) < 0 then
    ListBoxFloat.Items.Add (EditFmtFloat.Text);
end;

procedure TFormFmtTest.BtnPointerClick(Sender: TObject);
begin
  ShowMessage (Format ('Pointer: %p',
    [Pointer (StrToInt (EditInt.Text))]));
end;

procedure TFormFmtTest.ListBoxIntClick(Sender: TObject);
begin
  EditFmtInt.Text := ListBoxInt.Items [
    ListBoxInt.ItemIndex];
end;

procedure TFormFmtTest.ListBoxFloatClick(Sender: TObject);
begin
  EditFmtFloat.Text := ListBoxFloat.Items [
    ListBoxFloat.ItemIndex];
end;

procedure TFormFmtTest.FormCreate(Sender: TObject);
begin
  {the formatting of the initial value of the float
  edit box should depend on the international settings,
  for this reason we can use the result of a function
  which applies those settings}
  EditFloat.Text := FloatToStr(1234234.12);
end;

end.
