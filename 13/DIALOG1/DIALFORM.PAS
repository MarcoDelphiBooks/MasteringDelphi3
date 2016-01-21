unit DialForm;

interface

uses Windows, Classes, Graphics, Forms, Controls,
     ConfDial, StdCtrls;

type
  TForm1 = class(TForm)
    ConfigureButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure ConfigureButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{first "standard" version of the code}
procedure TForm1.ConfigureButtonClick(Sender: TObject);
begin
  {copy current values to the dialog box}
  ConfigureDialog.CheckBox1.Checked := Label1.Visible;
  ConfigureDialog.CheckBox2.Checked := Label2.Visible;
  if ConfigureDialog.ShowModal = mrOk then
  begin
    {copy new dialog box values in the main form -- only if Ok}
    Label1.Visible := ConfigureDialog.CheckBox1.Checked;
    Label2.Visible := ConfigureDialog.CheckBox2.Checked;
  end;
end;

{second version of the code: you can uncomment this,
and comment the first version instead.}

{Notice that parenthesis star comments are used to nest them}

(*procedure TForm1.ConfigureButtonClick(Sender: TObject);
var
  Old1, Old2: Boolean;
begin
  {store the old values of the dialog box}
  Old1 := ConfigureDialog.CheckBox1.Checked;
  Old2 := ConfigureDialog.CheckBox2.Checked;
  if (ConfigureDialog.ShowModal = mrOk) then
  begin
    {set the new values in the form}
    Label1.Visible := ConfigureDialog.CheckBox1.Checked;
    Label2.Visible := ConfigureDialog.CheckBox2.Checked;
  end
  else
  begin
    {restore the old values of the dialog box}
    ConfigureDialog.CheckBox1.Checked := Old1;
    ConfigureDialog.CheckBox2.Checked := Old2;
  end;
end;*)

end.

