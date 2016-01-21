program Navig;

uses
  Forms,
  NavForm in 'NavForm.pas' {Navigator};

{$R *.RES}

begin
  Application.CreateForm(TNavigator, Navigator);
  Application.Run;
end.
