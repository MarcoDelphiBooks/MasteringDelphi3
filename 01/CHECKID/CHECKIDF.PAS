unit CheckIdf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormCheckId = class(TForm)
    EditId: TEdit;
    Label1: TLabel;
    procedure EditIdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCheckId: TFormCheckId;

implementation

{$R *.DFM}

procedure TFormCheckId.EditIdChange(Sender: TObject);
begin
  if IsValidIdent (EditId.Text) then
    EditId.Font.Color := clGreen
  else
    EditId.Font.Color := clRed;
end;

end.
