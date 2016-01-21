unit PrintD;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TPrintDlg = class(TForm)
    BitBtnPrint: TBitBtn;
    BitBtnCancel: TBitBtn;
    RadioGroup1: TRadioGroup;
    BitBtnOK: TBitBtn;
    procedure BitBtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    PrintRequest: Boolean;
  end;

var
  PrintDlg: TPrintDlg;

implementation

{$R *.DFM}

procedure TPrintDlg.BitBtnPrintClick(Sender: TObject);
begin
  PrintRequest := True;
end;

procedure TPrintDlg.FormShow(Sender: TObject);
begin
  PrintRequest := False;
end;

end.
