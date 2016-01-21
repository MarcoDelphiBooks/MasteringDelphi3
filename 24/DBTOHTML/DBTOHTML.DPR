program DbToHtml;

uses
  Forms,
  DBHForm in 'DBHForm.pas' {Navigator};

{$R *.RES}

begin
  Application.CreateForm(TNavigator, Navigator);
  Application.Run;
end.
