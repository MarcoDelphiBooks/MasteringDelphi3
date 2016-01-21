unit SplitF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    FontDialog1: TFontDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    procedure ListBoxDblClick(Sender: TObject);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PanelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    OldX: Integer;
    OldList: TListBox;
  public
    procedure DrawDragLine (List: TListBox; X: Integer;
      State: TDragState);
    procedure DeleteDragLine (List: TListBox);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{select a new font for one of the list boxes}
procedure TForm1.ListBoxDblClick(Sender: TObject);
begin
  with Sender as TListbox do
  begin
    FontDialog1.Font := Font;
    if FontDialog1.Execute then
      Font := FontDialog1.Font;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {initialize variables}
  OldList := nil;
  OldX := -10;

  {initialize line drawing}
  ListBox1.Canvas.Pen.Width := 5;
  ListBox1.Canvas.Pen.Mode := pmNot;
  ListBox2.Canvas.Pen.Width := 5;
  ListBox2.Canvas.Pen.Mode := pmNot;
  ListBox3.Canvas.Pen.Width := 5;
  ListBox3.Canvas.Pen.Mode := pmNot;
end;

procedure TForm1.DrawDragLine (List: TListBox; X: Integer; State: TDragState);
begin
  {if there is currently a line...}
  if OldList <> nil then
  begin
    {delete the previous line, re-drawing onto it}
    OldList.Canvas.MoveTo (OldX, 0);
    OldList.Canvas.LineTo (OldX, ClientHeight);
  end;
  {if the user is not leaving the list box, draw the new line
  and store the older values}
  if not (State = dsDragLeave) then
  begin
    List.Canvas.MoveTo (X, 0);
    List.Canvas.LineTo (X, ClientHeight);
    OldX := X;
    OldList := List;
  end
  else
  {if the user is leaving the list box, then do *not* draw
  and set old values to nil/invalid}
  begin
    OldX := -10;
    OldList := nil
  end;
end;

procedure TForm1.DeleteDragLine (List: TListBox);
begin
  {delete the old line and reset the invalid position}
  if OldList <> nil then
  begin
    OldList.Canvas.MoveTo (OldX, 0);
    OldList.Canvas.LineTo (OldX, ClientHeight);
    OldX := -10;
    OldList := nil;
  end;
end;

procedure TForm1.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  {default case}
  Accept := False;
  {if dragging started from the first panel}
  if Source = Panel1 then
    {if the new size is not too little}
    if X > 40 then
    begin
      Accept := True;
      DrawDragLine (ListBox1, X, State);
    end
    else
      DeleteDragLine (ListBox1);
end;

procedure TForm1.ListBox1DragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  DeleteDragLine (ListBox1);
  ListBox1.Width := X;
end;

{same code for both panels, used only to set the proper cursor}
procedure TForm1.PanelDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Source = Sender then
    Accept := True
  else
    Accept := False;
end;

procedure TForm1.ListBox2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  {if dragging is valid, from either panels}
  if ( (Source = Panel1) and (ListBox3.Width - X > 40) ) or
    ( (Source = Panel2) and (X > 40) ) then
  begin
    Accept := True;
    DrawDragLine (ListBox2, X, State);
  end
  else
  begin
    Accept := False;
    DeleteDragLine (ListBox2);
  end;
end;

procedure TForm1.ListBox2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  DeleteDragLine (ListBox2);
  if Source = Panel1 then
    ListBox1.Width := ListBox1.Width + X
  else
    ListBox2.Width := X;
end;

procedure TForm1.ListBox3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  {default case}
  Accept := False;
  {if dragging started from the first panel}
  if Source = Panel2 then
    {if the last list box is not too little}
    if ListBox3.Width - X > 40 then
    begin
      Accept := True;
      DrawDragLine (ListBox3, X, State);
    end
    else
      DeleteDragLine (ListBox3);
end;

procedure TForm1.ListBox3DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  DeleteDragLine (ListBox3);
  ListBox2.Width := ListBox2.Width + X;
end;

end.
