unit gpfform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormGPF = class(TForm)
    BtnGpf: TButton;
    BtnSafe: TButton;
    BtnDynamic: TButton;
    procedure BtnGpfClick(Sender: TObject);
    procedure BtnSafeClick(Sender: TObject);
    procedure BtnDynamicClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGPF: TFormGPF;

implementation

{$R *.DFM}

procedure TFormGPF.BtnGpfClick(Sender: TObject);
var
  P: ^Integer;
begin
  P := nil;
  ShowMessage (IntToStr (P^)); // error!
end;

procedure TFormGPF.BtnSafeClick(Sender: TObject);
var
  P: ^Integer;
  X: Integer;
begin
  // assign the pointer to an existing variable
  P := @X;
  X := 100; // operates also on P^

  // safe access
  if P <> nil then
    ShowMessage (IntToStr (P^));
end;

procedure TFormGPF.BtnDynamicClick(Sender: TObject);
var
  P: ^Integer;
begin
  // initialization
  New (P);

  // operations
  P^ := 20;
  ShowMessage (IntToStr (P^));

  // termination
  Dispose (P);
end;

end.
