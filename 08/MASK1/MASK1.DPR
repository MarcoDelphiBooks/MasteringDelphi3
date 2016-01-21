program Mask1;

uses
  Forms,
  MaskF in 'MaskF.pas' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
