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
    procedure ListBoxDblClick(Sender: TObject);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PanelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ListBoxDblClick(Sender: TObject);
begin
  with Sender as TListbox do
  begin
    FontDialog1.Font := Font;
    if FontDialog1.Execute then
      Font := FontDialog1.Font;
  end;
end;

procedure TForm1.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  {if dragging started from the first panel,
  and new size is not too little...}
  if (Source = Panel1) and (X > 40) then
  begin
    Accept := True;
    ListBox1.Width := X;
  end
  else
    Accept := False;
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
  {if dragging started from the first panel,
  and the size of the third list box is not too little...}
  if (Source = Panel1) and (Listbox3.Width > 40) then
  begin
    Accept := True;
    ListBox1.Width := ListBox1.Width + X;
  end
  {if dragging started from the second panel,
  and new size is not too little...}
  else if (Source = Panel2) and (X > 40) then
  begin
    Accept := True;
    ListBox2.Width := X;
  end
  else
    Accept := False;
end;

procedure TForm1.ListBox3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  {if dragging started from the second panel,
  and the size of the third list box is not too little...}
  if (Source = Panel2) and (Listbox3.Width > 40) then
  begin
    Accept := True;
    ListBox2.Width := ListBox2.Width + X;
  end
  else
    Accept := False;
end;

end.
