program Sdiapp;

uses
  Forms,
  Sdimain in 'SDIMAIN.PAS' {SDIAppForm},
  About in 'ABOUT.PAS' {AboutBox};

{$R *.RES}

begin
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
 