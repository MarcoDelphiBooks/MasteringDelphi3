unit PositF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BtnMinimize: TButton;
    BtnMaximize: TButton;
    BtnRestore: TButton;
    BtnMinimize2: TButton;
    procedure BtnMinimizeClick(Sender: TObject);
    procedure BtnMaximizeClick(Sender: TObject);
    procedure BtnRestoreClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BtnMinimize2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BtnMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.BtnMaximizeClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TForm1.BtnRestoreClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if WindowState = wsMaximized then
  begin
    BtnMaximize.Enabled := False;
    BtnRestore.Enabled := True;
  end
  else
  begin
    BtnMaximize.Enabled := True;
    BtnRestore.Enabled := False;
  end;
end;

procedure TForm1.BtnMinimize2Click(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

end.
