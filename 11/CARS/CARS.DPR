program Cars;

uses
  Forms,
  CarsF in 'CarsF.pas' {CarsForm};

{$R *.RES}

begin
  Application.CreateForm(TCarsForm, CarsForm);
  Application.Run;
end.

