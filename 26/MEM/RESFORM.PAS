unit Resform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, Gauges,
  StdCtrls;

type
  TMemForm = class(TForm)
    RamGauge: TGauge;
    VirtualGauge: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemForm: TMemForm;

implementation

{$R *.DFM}

procedure TMemForm.Timer1Timer(Sender: TObject);
var
  MemInfo : TMemoryStatus;
begin
  MemInfo.dwLength := Sizeof (MemInfo);
  GlobalMemoryStatus (MemInfo);
  RamGauge.Progress := MemInfo.dwAvailPhys div
    (MemInfo.dwTotalPhys div 100);
  VirtualGauge.Progress := MemInfo.dwAvailPageFile div
    (MemInfo.dwTotalPageFile div 100);

  Caption := Format ('Mem: = %d - %d',
    [RamGauge.Progress, VirtualGauge.Progress]);

  {copy the form caption to the
  application title on the taskbar}
  Application.Title := Caption;

  {if value is low, turn color to red}
  if (RamGauge.Progress < 5) then
    RamGauge.ForeColor := clRed
  else
    RamGauge.ForeColor := clLime;
  if (VirtualGauge.Progress < 20) then
    VirtualGauge.ForeColor := clRed
  else
    VirtualGauge.ForeColor := clLime;
end;

procedure TMemForm.FormCreate(Sender: TObject);
begin
  {update the output ASAP}
  Timer1Timer (self);
end;

end.

