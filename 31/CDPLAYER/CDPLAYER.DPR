program Cdplayer;

uses
  Forms,
  PlayerF in 'PlayerF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
