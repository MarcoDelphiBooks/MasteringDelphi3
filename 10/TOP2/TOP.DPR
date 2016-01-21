program Top;

uses
  Forms,
  Topform in 'TOPFORM.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
