unit DoubleHF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    BtnHello: TButton;
    procedure BtnHelloClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Counter: Integer;

implementation

{$R *.DFM}

procedure DoubleHello; forward;

procedure Hello;
begin
  Inc (Counter);
  if MessageDlg ('Do you want a double message?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DoubleHello
  else
    ShowMessage ('Hello ' + IntToStr (Counter));
end;

procedure DoubleHello;
begin
  Hello;
  Hello;
end;

procedure TForm1.BtnHelloClick(Sender: TObject);
begin
  Hello;
end;

initialization
  Counter := 0;
end.
