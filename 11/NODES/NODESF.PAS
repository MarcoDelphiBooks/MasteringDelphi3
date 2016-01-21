unit NodesF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Grids, Outline;

type
  TForm1 = class(TForm)
    Outline1: TOutline;
    Outline2: TOutline;
    Label1: TLabel;
    Label2: TLabel;
    ButtonInfo: TButton;
    procedure Outline2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Outline1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Outline2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ButtonInfoClick(Sender: TObject);
  private
    { Private declarations }
    fStartDrag: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Outline2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Sender is TOutline then
    Accept := True;
end;

procedure TForm1.Outline1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fStartDrag := True;
  if (Outline1.ItemCount > 0) and (Button = mbLeft) then
    Outline1.BeginDrag (True);
  fStartDrag := False;
end;

procedure TForm1.Outline2DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Current: Integer;
begin
  Current := Outline2.GetItem (X, Y);
  if Current > 0 then
  begin
    Outline2.AddChild (Current, Outline1.Lines[Outline1.SelectedItem - 1]);
    Outline2.Items [Current].Expanded := True;
    Outline1.Delete (Outline1.SelectedItem);
  end
  else
    MessageDlg ('You''ve not dragged over an item',
      mtError, [mbOk], 0);
end;

procedure TForm1.ButtonInfoClick(Sender: TObject);
var
  Node: TOutlineNode;
  Text: string;
begin
  Node := Outline2.Items [Outline2.SelectedItem];
  Text := Format ('Item: %s'#13'Level: %d',
    [Node.FullPath, Node.Level]);
  if Node.HasItems then
  begin
    Text := Text + #13'* Has sub-items';
    if Node.Expanded then
      Text := Text + ' and is expanded';
  end;
  MessageDlg (Text, mtInformation, [mbOk], 0);
end;

end.
