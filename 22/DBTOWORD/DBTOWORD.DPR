program DbToWord;

uses
  Forms,
  DBWForm in 'DBWForm.pas' {Navigator};

{$R *.RES}

begin
  Application.CreateForm(TNavigator, Navigator);
  Application.Run;
end.
