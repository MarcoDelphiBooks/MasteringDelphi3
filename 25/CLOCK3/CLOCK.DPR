program Clock;

uses
  Forms,
  ClockF in 'ClockF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
