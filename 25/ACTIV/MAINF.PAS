unit MainF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    procedure AppActiv(Sender: TObject);
    procedure AppDeActiv(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  Label2.Caption := 'Form2 Active';
  Label2.Color := clRed;
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  Label2.Caption := 'Form2 Not Active';
  Label2.Color := clBtnFace;
end;

procedure TForm1.AppActiv(Sender: TObject);
begin
  Label1.Caption := 'Application Active';
  Label1.Color := clRed;
  Beep;
end;

procedure TForm1.AppDeActiv(Sender: TObject);
begin
  Label1.Caption := 'Application Not Active';
  Label1.Color := clBtnFace;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnActivate := AppActiv;
  Application.OnDeActivate := AppDeActiv;
end;

end.
