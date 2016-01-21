unit FontBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMd3FontCombo = class(TComboBox)
  public
    constructor Create (AOwner: TComponent); override;
    procedure CreateWnd; override;
  published
    property Style default csDropDownList;
  end;

procedure Register;

implementation

constructor TMd3FontCombo.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  Style := csDropDownList;
end;

procedure TMd3FontCombo.CreateWnd;
begin
  inherited CreateWnd;
  Items := Screen.Fonts;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3FontCombo]);
end;

end.
