unit UseMemF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function GetData: Integer; stdcall; external 'dllmem.dll';
procedure SetData (I: Integer); stdcall; external 'dllmem.dll';

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetData (UpDown1.Position);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.Text := IntToStr(GetData);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  HDLLInst: THandle;
begin
  HDLLInst := LoadLibrary ('dllmem.dll');
  Label1.Caption := Format ('Address: %p', [
    GetProcAddress (HDLLInst, 'SetData')]);
  FreeLibrary (HDLLInst);
end;

end.
