unit FocusF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls;

type
  TFocusForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditFirstName: TEdit;
    EditLastName: TEdit;
    ButtonCopy: TButton;
    EditPassword: TEdit;
    StatusBar1: TStatusBar;
    procedure ButtonCopyClick(Sender: TObject);
    procedure EditFirstNameEnter(Sender: TObject);
    procedure EditLastNameEnter(Sender: TObject);
    procedure EditPasswordEnter(Sender: TObject);
    procedure ButtonCopyEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FocusForm: TFocusForm;

implementation

{$R *.DFM}

procedure TFocusForm.ButtonCopyClick(Sender: TObject);
begin
  if EditLastName.Text <> '' then
    FocusForm.Caption := EditLastName.Text;
end;

procedure TFocusForm.EditFirstNameEnter(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Entering the first name...';
end;

procedure TFocusForm.EditLastNameEnter(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Entering the last name...';
end;

procedure TFocusForm.EditPasswordEnter(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Entering the password...';
end;

procedure TFocusForm.ButtonCopyEnter(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Pressing the copy button...';
end;

end.

