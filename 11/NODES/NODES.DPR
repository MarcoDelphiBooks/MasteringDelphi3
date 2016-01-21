program Nodes;

uses
  Forms,
  NodesF in 'NodesF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
