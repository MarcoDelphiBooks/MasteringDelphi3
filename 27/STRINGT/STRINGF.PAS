unit StringF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TForm1 = class(TForm)
    ShowButton: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    HelloButton: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure HelloButtonClick(Sender: TObject);
    procedure ShowButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$IFNDEF ITALIAN}
  {$R *.DFM}
  {$R STABLE.RES}
{$ELSE}
  {$R STRFIT.DFM}
  {$R STABLEIT.RES}
{$ENDIF}

procedure TForm1.HelloButtonClick(Sender: TObject);
var
  StrMsg: string;
begin
  StrMsg := LoadStr (1);
  if StrMsg <> '' then
    ShowMessage (StrMsg);
end;

procedure TForm1.ShowButtonClick(Sender: TObject);
var
  StrMsg: string;
begin
  StrMsg := LoadStr (10 + SpinEdit1.Value);
  if StrMsg <> '' then
    ShowMessage (StrMsg);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  StrTitle: string;
begin
  StrTitle := LoadStr (2);
  if StrTitle <> '' then
  begin
    Caption := StrTitle;
    Application.Title := StrTitle;
  end;
end;

end.
