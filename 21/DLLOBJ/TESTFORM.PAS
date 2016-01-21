unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Base;

type
  TForm1 = class(TForm)
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    SpinEdit2: TSpinEdit;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Num1, Num2 : TDllNumber;
  public
    { Public declarations }
  end;

function NewObject: TDllNumber; stdcall;
  external 'DllObj.dll';

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // create first object
  Num1 := NewObject;
  Num1.SetValue (SpinEdit1.Value);
  Label1.Caption := 'Num1: ' + IntToStr (Num1.GetValue);
  // create second object
  Num2 := NewObject;
  Num2.SetValue (SpinEdit2.Value);
  Label2.Caption := 'Num2: ' + IntToStr (Num2.GetValue);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // change
  Num1.SetValue (SpinEdit1.Value);
  Label1.Caption := 'Num1: ' + IntToStr (Num1.GetValue);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // increase
  Num1.Increase;
  Label1.Caption := 'Num1: ' + IntToStr (Num1.GetValue);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Num2.SetValue (SpinEdit2.Value);
  Label2.Caption := 'Num2: ' + IntToStr (Num2.GetValue);
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  Num2.Increase;
  Label2.Caption := 'Num2: ' + IntToStr (Num2.GetValue);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Num1.Free;
  Num2.Free;
end;

end.
