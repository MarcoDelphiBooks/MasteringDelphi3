program Range;

uses
  Forms,
  Range_f in 'RANGE_F.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
