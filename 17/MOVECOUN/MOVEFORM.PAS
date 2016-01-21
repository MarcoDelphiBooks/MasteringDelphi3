unit Moveform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DB, DBTables;

type
  TForm1 = class(TForm)
    BatchMove1: TBatchMove;
    Table1: TTable;
    Table2: TTable;
    ButtonMove: TButton;
    procedure ButtonMoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ButtonMoveClick(Sender: TObject);
begin
  // update the UI
  ButtonMove.Enabled := False;
  // copy the data
  Table2.FieldDefs := Table1.FieldDefs;
  Table2.IndexDefs.Assign (Table1.IndexDefs);
  Table2.CreateTable;
  Table2.Open;
  BatchMove1.Execute;
end;

end.
