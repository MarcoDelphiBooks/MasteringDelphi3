unit MainF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Childf;

type
  TMainForm = class(TForm)
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
    Counter: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormClick(Sender: TObject);
var
  NewForm: TChildForm;
begin
  {increase the child window counter}
  Inc (Counter);
  {create a new form and define it as child of the current form}
  NewForm:= TChildForm.Create (self);
  NewForm.Parent := self;
  {add the number to the caption, and move it slightly}
  NewForm.Caption := NewForm.Caption + ' ' + IntToStr (Counter);
  NewForm.Left := (Counter * 20) mod 500;
  NewForm.Top := (Counter * 20) mod 450;
  {show the form}
  NewForm.Show;
end;

end.
