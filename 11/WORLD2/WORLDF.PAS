unit WorldF;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Buttons, StdCtrls, ExtCtrls, SysUtils;

type
  TWorldForm = class(TForm)
    WorldButton: TBitBtn;
    Timer1: TTimer;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    procedure WorldButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WorldButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WorldButtonMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    Count: Integer;
    BitmapsList: TList;
  public
    { Public declarations }
  end;

var
  WorldForm: TWorldForm;

implementation

{$R *.DFM}
{$R WORLDBMP.RES}

procedure TWorldForm.WorldButtonClick(Sender: TObject);
begin
  if Timer1.Enabled then
    begin
      Timer1.Enabled := False;
      WorldButton.Caption := '&Start';
    end
  else
    begin
      Timer1.Enabled := True;
      WorldButton.Caption := '&Stop';
    end;
end;

procedure TWorldForm.Timer1Timer(Sender: TObject);
begin
  Count := (Count mod 16) + 1;
  Label1.Caption := Format ('Displaying image %d', [Count]);

  {draw the current bitmap in the canvas placed over
  the bitmap button}
  PaintBox1.Canvas.Draw (1, 1,
    BitmapsList.Items[Count-1]);
end;

procedure TWorldForm.FormCreate(Sender: TObject);
var
  I: Integer;
  Bmp: TBitmap;
  BmpName: string;
begin
  Count := 1;

  {load the bitmaps from the resources of the
  application to the list of TBitmap objects}
  BitmapsList := TList.Create;
  for I := 1 to 16 do
  begin
    Bmp := TBitmap.Create;
    BmpName := 'W' + IntToStr (I);
    {load the bitmap from the resources:
    LoadBitmap is a Windows API function}
    Bmp.Handle := LoadBitmap (HInstance, PChar (BmpName));
    BitmapsList.Add (Bmp);
  end;

  {change the parent of the paintbox, placing it inside
  the button instead of inside the form}
  PaintBox1.Parent := WorldButton;
  PaintBox1.SetBounds (
    WorldButton.Margin,
    (WorldButton.Height - Bmp.Height) div 2,
    Bmp.Width + 2,
    Bmp.Height + 2);
end;

procedure TWorldForm.FormDestroy(Sender: TObject);
begin
  {free each element and the list itself}
  BitmapsList.Clear;
  BitmapsList.Free;
end;

procedure TWorldForm.WorldButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    {paint the current image over the button}
    PaintBox1.Left := PaintBox1.Left + 2;
    PaintBox1.Top := PaintBox1.Top + 2;
    WorldButton.Glyph.Assign (
      BitmapsList.Items[Count-1]);
  end;
end;

procedure TWorldForm.WorldButtonMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    PaintBox1.Left := PaintBox1.Left - 2;
    PaintBox1.Top := PaintBox1.Top - 2;
    WorldButton.Glyph.Assign (
      BitmapsList.Items[Count-1]);
  end;
end;

end.

