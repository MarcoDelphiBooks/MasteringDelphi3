program gpf;

uses
  Forms,
  gpfform in 'gpfform.pas' {FormGPF};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormGPF, FormGPF);
  Application.Run;
end.
