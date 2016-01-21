unit Frame;

interface

uses Windows, Classes, Graphics, Forms, Controls, Child,
  Menus, SysUtils, ExtCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Window1: TMenuItem;
    New1: TMenuItem;
    procedure New1Click(Sender: TObject);
  private
    { Private declarations }
    Counter: Integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.New1Click(Sender: TObject);
var
  ChildForm: TChildForm;
begin
  WindowMenu := Window1;
  Inc (Counter);
  ChildForm := TChildForm.Create (self);
  ChildForm.Caption := ChildForm.Caption + ' ' + IntToStr (Counter);
  ChildForm.Show;
end;

end.

