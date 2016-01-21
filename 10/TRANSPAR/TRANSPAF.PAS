unit TranspaF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    procedure CreateParams (var Params: TCreateParams); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams (Params);
  Params.ExStyle := Params.ExStyle or ws_ex_Transparent;
end;

end.
