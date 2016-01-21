unit Modal;

interface

uses Windows, Classes, Graphics, Forms,
  Controls, StdCtrls;

type
  TModalForm = class(TForm)
    Label1: TLabel;
    Modal2Button: TButton;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure Modal2ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TModalForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TModalForm.Modal2ButtonClick(Sender: TObject);
var
  AnotherModal: TModalForm;
begin
  AnotherModal := TModalForm.Create (Application);
  AnotherModal.ShowModal;
  AnotherModal.Free;
end;

end.

