program Extbeep;

uses
  Forms,
  ExtBeepF in 'ExtBeepF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
