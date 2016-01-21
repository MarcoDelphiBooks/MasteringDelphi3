unit OneF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WMUser (var msg: TMessage); message wm_User;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.WMUser (var msg: TMessage);
begin
  Application.Restore;
end;

end.
