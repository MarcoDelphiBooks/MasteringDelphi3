unit MinMaxF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetMinMax (var MinMaxMessage: TWMGetMinMaxInfo);
      message wm_GetMinMaxInfo;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.GetMinMax (
  var MinMaxMessage: TWMGetMinMaxInfo);
begin
  with MinMaxMessage.MinMaxInfo^ do
  begin
    ptMinTrackSize.x := 150;
    ptMinTrackSize.y := 150;
    ptMaxTrackSize.x := 300;
    ptMaxTrackSize.y := 300;
  end;
end;

end.
