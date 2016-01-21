unit NumberF;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TNumbersForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    CheckButton: TButton;
    procedure CheckButtonClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NumbersForm: TNumbersForm;

implementation

{$R *.DFM}

procedure TNumbersForm.CheckButtonClick(Sender: TObject);
var
  Number, Code: Integer;
begin
  if Edit1.Text <> '' then
  begin
    Val (Edit1.Text, Number, Code);
    if Code <> 0 then
    begin
      Edit1.SetFocus;
      MessageDlg ('Not a number in the first edit', mtError, [mbOK], 0);
    end
    else
      MessageDlg ('OK, the number in the first edit box is ' +
        IntToStr (Number), mtInformation, [mbOK], 0);
  end;
end;

{$HINTS OFF}
procedure TNumbersForm.Edit2Exit(Sender: TObject);
var
  Number, Code: Integer;
  CurrEdit: TEdit;
begin
  CurrEdit := Sender as TEdit;
  if CurrEdit.Text <> '' then
  begin
    Val (CurrEdit.Text, Number, Code);
    if Code <> 0 then
    begin
      CurrEdit.SetFocus;
      MessageDlg ('The edit field number ' +
        IntToStr (CurrEdit.Tag) +
        ' does not have a valid number',
        mtError, [mbOK], 0);
    end;
  end;
end;

procedure TNumbersForm.Edit3Change(Sender: TObject);
var
  Number, Code: Integer;
  CurrEdit: TEdit;
begin
  CurrEdit := Sender as TEdit;
  if CurrEdit.Text <> '' then
  begin
    Val (CurrEdit.Text, Number, Code);
    if Code <> 0 then
      MessageDlg ('The edit field number ' +
        IntToStr (CurrEdit.Tag) +
        ' does not have a valid number',
        mtError, [mbOK], 0);
  end;
end;
{$HINTS ON}

procedure TNumbersForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  {check if the key is a number or backspace}
  if not (key in ['0'..'9', #8]) then
  begin
    Key := #0;
    Beep;
  end;
end;

end.

