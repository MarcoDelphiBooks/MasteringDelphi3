unit CallForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    BtnDouble: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    BtnTriple: TButton;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    procedure BtnDoubleClick(Sender: TObject);
    procedure BtnTripleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{functions of the Delphi DLL}
function Double (N: Integer): Integer;
  stdcall; external 'FIRSTDLL.DLL';
function Triple (N: Integer): Integer;
  stdcall; external 'FIRSTDLL.DLL';

procedure TForm1.BtnDoubleClick(Sender: TObject);
begin
  SpinEdit1.Value := Double (SpinEdit1.Value);
end;

procedure TForm1.BtnTripleClick(Sender: TObject);
begin
  SpinEdit2.Value:= Triple (SpinEdit2.Value);
end;

end.
