unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    BtnColor: TButton;
    BtnShow: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure BtnColorClick(Sender: TObject);
    procedure BtnShowClick(Sender: TObject);
  private
    CurrentValue: Integer;
  protected
    procedure SetValue (NewValue: Integer);
  public
    property Value: Integer
      read CurrentValue write SetValue;
    procedure ChangeColor;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Edit1Change(Sender: TObject);
begin
  CurrentValue := UpDown1.Position;
end;

procedure TForm1.SetValue (NewValue: Integer);
begin
  if NewValue <> CurrentValue then
  begin
    CurrentValue := Value;
    UpDown1.Position := CurrentValue;
  end;
end;

procedure TForm1.ChangeColor;
begin
  Color := RGB (
    Random (255), Random (255), Random (255));
end;

procedure TForm1.BtnColorClick(Sender: TObject);
begin
  ChangeColor;
end;

procedure TForm1.BtnShowClick(Sender: TObject);
begin
  ShowMessage (IntToStr (CurrentValue));
end;

end.
