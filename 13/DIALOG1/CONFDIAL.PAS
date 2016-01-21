unit Confdial;

interface

uses Windows, Classes, Graphics, Forms,
  Controls, Buttons, StdCtrls;

type
  TConfigureDialog = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigureDialog: TConfigureDialog;

implementation

{$R *.DFM}

end.

