program Ldtest;

uses
  Forms,
  LdTestF in 'LdTestF.pas' {Form1},
  Listdial in 'Listdial.pas' {ListBoxForm};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TListBoxForm, ListBoxForm);
  Application.Run;
end.
