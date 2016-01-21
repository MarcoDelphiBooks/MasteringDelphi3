program Viewdata;

uses
  Forms,
  ViewF in 'ViewF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
