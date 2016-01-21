unit AppSndF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  public
    procedure AppMini (Sender: TObject);
    procedure AppRestore (Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses
  MmSystem;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnMinimize := AppMini;
  Application.OnRestore := AppRestore;
end;

procedure TForm1.AppMini (Sender: TObject);
begin
  PlaySound ('Minimize', 0, snd_Async);
end;

procedure TForm1.AppRestore (Sender: TObject);
begin
  PlaySound ('RestoreUp', 0, snd_Async);
end;

end.
