program Mycur;

uses
  Forms,
  MyCurF in 'MyCurF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
