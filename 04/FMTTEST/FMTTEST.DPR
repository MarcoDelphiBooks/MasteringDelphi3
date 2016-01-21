program FmtTest;

uses
  Forms,
  FtmTestF in 'FtmTestF.pas' {FormFmtTest};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormFmtTest, FormFmtTest);
  Application.Run;
end.
