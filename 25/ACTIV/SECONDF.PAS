unit SecondF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormActivate(Sender: TObject);
begin
  Label2.Caption := 'Form2 Active';
  Label2.Color := clRed;
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
  Label2.Caption := 'Form2 Not Active';
  Label2.Color := clBtnFace;
end;

end.
