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
    procedure GlobalEnter(Sender: TObject);
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

procedure TFocusForm.GlobalEnter(Sender: TObject);
begin
  StatusBar1.SimpleText := (Sender as TControl).Hint;
end;

end.

