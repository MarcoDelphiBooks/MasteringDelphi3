program Filter;

uses
  Forms,
  FilterF in 'FilterF.pas' {Form1},
  ConvF in 'ConvF.pas' {ConvertForm};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConvertForm, ConvertForm);
  Application.Run;
end.
