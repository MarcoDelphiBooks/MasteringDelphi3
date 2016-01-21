unit Tablist;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TMd3TabList = class(TListBox)
  public
    procedure CreateParams (
      var Params: TCreateParams); override;
  end;

procedure Register;

implementation

procedure TMd3TabList.CreateParams (var Params: TCreateParams);
begin
  inherited CreateParams (Params);
  Params.Style := Params.Style or lbs_UseTabStops;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3TabList]);
end;

end.
