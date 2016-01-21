program Disabled;

uses
  Forms,
  Disab_f in 'DISAB_F.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
