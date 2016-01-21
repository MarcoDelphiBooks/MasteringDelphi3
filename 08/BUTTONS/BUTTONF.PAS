unit ButtonF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, StdCtrls;

type
  TButtonsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ButtonsForm: TButtonsForm;

implementation

{$R *.DFM}

procedure TButtonsForm.Button2Click(Sender: TObject);
begin
  Button1.Font := Button2.Font;
  Button2.Enabled := False;
end;

procedure TButtonsForm.Button4Click(Sender: TObject);
begin
  Button1.ParentFont := True;
  Button2.Enabled := True;
end;

procedure TButtonsForm.Button3Click(Sender: TObject);
begin
  Button6.Height := Button6.Height + 3;
  Button6.Width := Button6.Width + 3;
end;

procedure TButtonsForm.Button1Click(Sender: TObject);
begin
  if not Button4.Enabled then
  begin
    Button4.Enabled := True;
    Button1.Caption := '&1: Disable 4';
  end
  else
  begin
    Button4.Enabled := False;
    Button1.Caption := '&1: Enable 4';
  end;
end;

procedure TButtonsForm.Button5Click(Sender: TObject);
begin
  Button2.Visible := not Button2.Visible;
  if Button2.Visible then
    Button5.Caption := '&5: Hide 2'
  else
    Button5.Caption := '&5: Show 2';
end;

procedure TButtonsForm.Button6Click(Sender: TObject);
begin
  Button6.Height := Button6.Height - 3;
  Button6.Width := Button6.Width - 3;
end;

end.

