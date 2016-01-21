program Newcheck;

uses
  Forms,
  Check in 'CHECK.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
