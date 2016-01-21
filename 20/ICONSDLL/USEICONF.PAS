unit UseIconF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    LoadButton: TButton;
    Edit1: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure LoadButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    HInst: THandle;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.LoadButtonClick(Sender: TObject);
var
  HIcon: THandle;
begin
  HIcon := LoadIcon (HInst, PChar(Edit1.Text));
  if HIcon = 0 then
    ShowMessage ('Icon not found')
  else
    Image1.Picture.Icon.Handle := HIcon;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  HInst := LoadLibrary ('Iconsdll.dll');
  if HInst = 0 then
  begin
    LoadButton.Enabled := False;
    ShowMessage ('Icons DLL not found');
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeLibrary (HInst);
end;

end.
