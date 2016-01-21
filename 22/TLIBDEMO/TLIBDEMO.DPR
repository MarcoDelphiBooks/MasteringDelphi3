program TLibDemo;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  DemoObj in 'DemoObj.pas' {FirstServer: CoClass};

{$R *.RES}

{$R *.TLB}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
