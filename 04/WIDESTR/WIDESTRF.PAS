unit WideStrF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{return the size of each character of a wide string}
procedure TForm1.Button1Click(Sender: TObject);
var
  WStr: WideString;
begin
  WStr := 'Hello';
  ShowMessage (
    'Bytes for characters of wide strings: ' +
    IntToStr (SizeOf (WStr [1])));
end;

{copy a WideString to the title, using SetWindowTextW}
{This does not work under Windows 95!!! Works under NT}
procedure TForm1.Button2Click(Sender: TObject);
var
  WStr: WideString;
begin
  WStr := 'Hello';
  WStr [2] := WideChar (1000); // random Unicode character
  // does not work in Windows 95, but works in Windows NT!!!
  SetWindowTextW (Handle, PWideChar (WStr));
end;

{copy a wide string to the Caption, converting strings}
procedure TForm1.Button3Click(Sender: TObject);
var
  WStr: WideString;
begin
  WStr := 'Hello';
  WStr [2] := WideChar (1000); // random Unicode character
  Caption := WStr;
end;

{reset the caption to the default}
procedure TForm1.Button4Click(Sender: TObject);
begin
  Caption := 'Wide String Test';
end;

end.
