unit Child;

interface

uses Windows, Classes, Graphics, Forms, Controls;

type
  TChildForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildForm: TChildForm;

implementation

{$R *.DFM}

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

