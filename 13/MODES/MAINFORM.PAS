unit Mainform;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, StdCtrls;

type
  TMainAppForm = class(TForm)
    Label1: TLabel;
    ModalButton: TButton;
    ModelessButton: TButton;
    procedure ModalButtonClick(Sender: TObject);
    procedure ModelessButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainAppForm: TMainAppForm;

implementation

uses Modal, Modeless;

{$R *.DFM}

procedure TMainAppForm.ModalButtonClick(Sender: TObject);
var
  Modal: TModalForm;
begin
  Modal := TModalForm.Create (Application);
  try
    Modal.ShowModal;
  finally
    Modal.Free;
  end;
end;

procedure TMainAppForm.ModelessButtonClick(Sender: TObject);
var
  NonModal: TModelessForm;
begin
  NonModal := TModelessForm.Create (Application);
  NonModal.Show;
end;

end.

