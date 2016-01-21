unit NotesF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TNotesForm = class(TForm)
    Memo1: TMemo;
    FontDialog1: TFontDialog;
    procedure Memo1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotesForm: TNotesForm;

implementation

{$R *.DFM}

procedure TNotesForm.Memo1DblClick(Sender: TObject);
begin
  FontDialog1.Font := Memo1.Font;
  if FontDialog1.Execute then
    Memo1.Font := FontDialog1.Font;
end;

end.

