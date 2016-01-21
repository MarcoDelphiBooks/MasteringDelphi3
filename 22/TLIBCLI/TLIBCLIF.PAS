unit TLibCliF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Project1Lib;

type
  TForm1 = class(TForm)
    BtnColor1: TButton;
    BtnColor2: TButton;
    BtnIntf: TButton;
    BtnVariant: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnColor1Click(Sender: TObject);
    procedure BtnColor2Click(Sender: TObject);
    procedure BtnIntfClick(Sender: TObject);
    procedure BtnVariantClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MyServer: Variant;
    IMyServer: IFirstServer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  IMyServer := CoFirstServer.Create;
  MyServer := IMyServer;
end;

procedure TForm1.BtnColor1Click(Sender: TObject);
begin
  IMyServer.ChangeColor;
end;

procedure TForm1.BtnColor2Click(Sender: TObject);
begin
  MyServer.ChangeColor;
end;

procedure TForm1.BtnIntfClick(Sender: TObject);
var
  I, K: Integer;
  Init: TDateTime;
begin
  Screen.Cursor := crHourglass;
  try
    Init := Now;
    K := 0;
    for I := 1 to 1000 do
      K := K + IMyServer.Value div IMyServer.Value;
    Label1.Caption := IntToStr (K) + ' - ' +
      FormatDateTime ('nn:ss', Now - Init);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.BtnVariantClick(Sender: TObject);
var
  I, K: Integer;
  Init: TDateTime;
begin
  Screen.Cursor := crHourglass;
  try
    Init := Now;
    K := 0;
    for I := 1 to 1000 do
      K := K + MyServer.Value div MyServer.Value;
    Label2.Caption := IntToStr (K) + ' - ' +
      FormatDateTime ('nn:ss', Now - Init);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
