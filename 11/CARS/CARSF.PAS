unit CarsF;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Buttons, StdCtrls, ExtCtrls, Dialogs;

type
  TCarsForm = class(TForm)
    CarButton: TBitBtn;
    GreenButton: TBitBtn;
    RightButton: TBitBtn;
    RedButton: TBitBtn;
    LeftButton: TBitBtn;
    YellowButton: TBitBtn;
    CarImage: TImage;
    CarLabel: TLabel;
    Bevel1: TBevel;
    procedure CarButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RedButtonClick(Sender: TObject);
    procedure YellowButtonClick(Sender: TObject);
    procedure GreenButtonClick(Sender: TObject);
    procedure LeftButtonClick(Sender: TObject);
    procedure RightButtonClick(Sender: TObject);

  private
    CarStopped: Boolean;
    Car1Bmp, Car2Bmp: TBitmap;
  public
    { Public declarations }
  end;

var
  CarsForm: TCarsForm;

implementation

{$R *.DFM}

procedure TCarsForm.CarButtonClick(Sender: TObject);
begin
  {a car should not start if the light is red}
  if CarStopped then
    if RedButton.Enabled then
      MessageDlg ('No turn on red, please!',
        mtWarning, [mbOK], 0)
    else
    {if was stopped and it is not red}
      begin
        {change the bitmaps and captions}
        CarButton.Glyph := Car1Bmp;
        CarButton.Caption := 'St&op';
        CarImage.Picture.Graphic := Car2Bmp;
        CarLabel.Caption := 'The car is on the road';
        CarStopped := False;
      end
  else
  {if it was moving, regardless of the lights}
    begin
      {change the bitmaps and captions}
      CarButton.Glyph := Car2Bmp;
      CarButton.Caption := 'G&o!';
      CarImage.Picture.Graphic := Car1Bmp;
      CarLabel.Caption := 'The car is parked';
      CarStopped := True;
    end;
end;

procedure TCarsForm.FormCreate(Sender: TObject);
begin
  {set the flag and load the two bitmaps of the car}
  CarStopped := True;
  Car1Bmp := TBitmap.Create;
  Car2Bmp := TBitmap.Create;
  Car1Bmp.LoadFromFile ('cars.bmp');
  Car2Bmp.LoadFromFile ('cars2.bmp');
end;

procedure TCarsForm.FormDestroy(Sender: TObject);
begin
  {delete the two TBitmap objects}
  Car1Bmp.Free;
  Car2Bmp.Free;
end;

procedure TCarsForm.RedButtonClick(Sender: TObject);
begin
  {after the red, green}
  GreenButton.Enabled := True;
  GreenButton.SetFocus;
  RedButton.Enabled := False;
end;

procedure TCarsForm.YellowButtonClick(Sender: TObject);
begin
  {after the yellow, red}
  RedButton.Enabled := True;
  RedButton.SetFocus;
  YellowButton.Enabled := False;
end;

procedure TCarsForm.GreenButtonClick(Sender: TObject);
begin
  {after the green, yellow}
  YellowButton.Enabled := True;
  YellowButton.SetFocus;
  GreenButton.Enabled := False;
end;

procedure TCarsForm.LeftButtonClick(Sender: TObject);
begin
  {move the car, but not outside of the area of the form}
  RightButton.Enabled := True;
  CarImage.Left := CarImage.Left - 10;
  {when the left border of the image is less than ten
  pixels from the left border of the form, which is at 0}
  if CarImage.Left < 10 then
  begin
    RightButton.SetFocus;
    LeftButton.Enabled := False;
  end;
end;

procedure TCarsForm.RightButtonClick(Sender: TObject);
begin
  {move the car, but not outside of the area of the form}
  LeftButton.Enabled := True;
  CarImage.Left := CarImage.Left + 10;
  {when the right border of the image is less than
  ten pixels from the left border of the form}
  if CarImage.Left + CarImage.Width > ClientWidth - 10 then
  begin
    LeftButton.SetFocus;
    RightButton.Enabled := False;
  end;
end;

end.

