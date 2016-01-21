unit Modeless;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls;

type
  TModelessForm = class(TForm)
    Label1: TLabel;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{to be removed:
var
  ModelessForm: TModelessForm;}

implementation

{$R *.DFM}

procedure TModelessForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TModelessForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.

