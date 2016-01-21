unit TBoxForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons;

type
  TToolBox = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ToolBox: TToolBox;

implementation

uses
  ToolForm;

{$R *.DFM}

procedure TToolBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ToolbarForm.Panel1.Visible := True;
  ToolbarForm.BoxOn := False;
  ToolbarForm.MoveButtons (ToolbarForm.Panel1);
  if ToolbarForm.BarPos in [alLeft, alRight] then
    ToolbarForm.RotateSpeedbar;
end;

end.
