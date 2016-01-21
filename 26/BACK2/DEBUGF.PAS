unit DebugF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TDebugForm = class(TForm)
    ListBox1: TListBox;
  end;

procedure WriteLine (Text: String);

var
  DebugForm: TDebugForm;

implementation

{$R *.DFM}

procedure WriteLine (Text: String);
begin
  if not DebugForm.Visible then
    DebugForm.Show;
  with DebugForm.Listbox1 do
    ItemIndex := Items.Add (Text);
end;

end.
