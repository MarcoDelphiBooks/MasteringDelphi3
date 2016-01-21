unit AnimForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Anim;

type
  TForm1 = class(TForm)
    ButtonAllEat: TButton;
    ButtonAllFly: TButton;
    ButtonCat: TButton;
    ButtonBatFA: TButton;
    Memo1: TMemo;
    ButtonAir: TButton;
    ButtonAllFA: TButton;
    ButtonAirFA: TButton;
    ButtonAirInt: TButton;
    procedure ButtonAllEatClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAllFlyClick(Sender: TObject);
    procedure ButtonCatClick(Sender: TObject);
    procedure ButtonBatFAClick(Sender: TObject);
    procedure ButtonAirClick(Sender: TObject);
    procedure ButtonAllFAClick(Sender: TObject);
    procedure ButtonAirFAClick(Sender: TObject);
    procedure ButtonAirIntClick(Sender: TObject);
  private
    Animals: array [1..3] of IMammal;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Animals[1] := TCat.Create;
  Animals[2] := TBat.Create;
  Animals[3] := TCat.Create;
end;

procedure TForm1.ButtonAllEatClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 3 do
    // standard polymorphic method call
    Memo1.Lines.Add (Animals[I].Eat);
  Memo1.Lines.Add ('');
end;

function FlyAway (F: ICanFly): string;
begin
  Result := F.TakeOff + #13#10 + F.Fly + #13#10 +
    F.Fly + ' ...over and over... ' + #13#10 +
    F.Land;
end;

procedure TForm1.ButtonAllFlyClick(Sender: TObject);
var
  I: Integer;
  Fly1: ICanFly;
begin
  for I := 1 to 3 do
  begin
    Animals[i].QueryInterface (ICanFly, Fly1);
    if Assigned (Fly1) then
      Memo1.Lines.Add (Fly1.Fly);
  end;
  Memo1.Lines.Add ('');
end;

procedure TForm1.ButtonCatClick(Sender: TObject);
var
  Cat1: IMammal;
begin
  Cat1 := TCat.Create;
  Memo1.Lines.Add (Cat1.Eat);
  Memo1.Lines.Add ('');
end;

procedure TForm1.ButtonBatFAClick(Sender: TObject);
var
// FlAnim: ICanFly
  // or:
  FlAnim: IMammal;
begin
  FlAnim := TBat.Create;
//  Memo1.Lines.Add (FlyAway (FlAnim));
  // or:
  Memo1.Lines.Add (FlyAway (FlAnim as ICanFly));
  Memo1.Lines.Add ('');
end;

procedure TForm1.ButtonAirClick(Sender: TObject);
var
  Air1: TAirplane;
begin
  Air1 := TAirplane.Create;
  Memo1.Lines.Add (Air1.TakeOff);
  Memo1.Lines.Add (Air1.Fly);
  Memo1.Lines.Add (Air1.Land);
  Memo1.Lines.Add ('');
  Air1.Free;
end;

procedure TForm1.ButtonAirIntClick(Sender: TObject);
var
  Fly1: ICanFly; // interface
begin
  Fly1 := TAirplane.Create;
  Memo1.Lines.Add (Fly1.TakeOff);
  Memo1.Lines.Add (Fly1.Fly);
  Memo1.Lines.Add (Fly1.Land);
  Memo1.Lines.Add ('');
end;

procedure TForm1.ButtonAllFAClick(Sender: TObject);
var
  I: Integer;
  Fly1: ICanFly;
begin
  for I := 1 to 3 do
    if Animals[i].QueryInterface (
        ICanFly, Fly1) <> E_NoInterface then
      Memo1.Lines.Add (FlyAway(Fly1));
  Memo1.Lines.Add ('');
end;

procedure TForm1.ButtonAirFAClick(Sender: TObject);
var
  Fly1: ICanFly;
begin
  Fly1 := TAirplane.Create;
  Memo1.Lines.Add (FlyAway (Fly1));
  Memo1.Lines.Add ('');
end;

end.
