program Icons;

uses
  Forms,
  IconsF in 'IconsF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
