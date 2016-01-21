unit ShCutF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
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

uses
  ComObj, ActiveX, ShlObj;

procedure TForm1.Button1Click(Sender: TObject);
var
  AnObj: IUnknown;
  ShLink: IShellLink;
  PFile: IPersistFile;
  FileName: string;
  WFileName: WideString;
begin
  // access to the two interfaces of the object
  AnObj := CreateComObject (CLSID_ShellLink);
  ShLink := AnObj as IShellLink;
  PFile := AnObj as IPersistFile;
  // get the name of the application file
  FileName := ParamStr (0);
  // set the link properties
  ShLink.SetPath (PChar (FileName));
  ShLink.SetWorkingDirectory (PChar (
    ExtractFilePath (FileName)));
  // save the file, using a WideString!
  WFileName := ExtractFilePath (FileName) +
    Edit1.Text + '.lnk';
  PFile.Save (PWChar (WFileName), False);
end;

end.
