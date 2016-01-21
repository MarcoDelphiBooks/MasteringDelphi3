program Multibar;

uses
  Forms,
  MultibF in 'MultibF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
