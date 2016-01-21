unit PrintD;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TPrintDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    RadioGroup1: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintDlg: TPrintDlg;

implementation

{$R *.DFM}

end.
