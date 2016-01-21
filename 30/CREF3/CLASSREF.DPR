program Classref;

uses
  Forms,
  CRefForm in 'CRefForm.pas' {Form1},
  ListF in 'ListF.pas' {ListForm};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TListForm, ListForm);
  Application.Run;
end.
