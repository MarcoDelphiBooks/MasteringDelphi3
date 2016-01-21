unit ClockF;

interface

uses Windows, Classes, Graphics, Forms,
  Controls, StdCtrls, ExtCtrls, SysUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Panel1.Caption := TimeToStr (Time);
end;

end.
