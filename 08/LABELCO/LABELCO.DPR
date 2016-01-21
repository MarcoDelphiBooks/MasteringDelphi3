program LabelCo;

uses
  Forms,
  LabelF in 'LabelF.pas' {ColorTextForm};

{$R *.RES}

begin
  Application.CreateForm(TColorTextForm, ColorTextForm);
  Application.Run;
end.

