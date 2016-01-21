unit ShAboutF;

interface

uses Windows, Classes, Graphics, Forms,
  Controls, StdCtrls, SysUtils, ShellApi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellAbout (Handle,
    'About ShellAbout Test#makes funny programs like',
    'Portions Copyright 1996 Marco Cantù',
    Application.Icon.Handle);
end;

end.
