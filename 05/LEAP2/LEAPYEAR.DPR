program Leapyear;

uses
  Forms,
  LeapYF in 'LeapYF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
