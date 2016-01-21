unit ConvF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ComCtrls;

type
  TConvertForm = class(TForm)
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConvertForm: TConvertForm;

implementation

{$R *.DFM}

procedure TConvertForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
