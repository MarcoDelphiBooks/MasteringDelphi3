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
    procedure ListBoxDblClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    Dragging, FirstSplit: Boolean;
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

procedure TForm1.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    Dragging := True;
    SetCapture (Handle);
    if (X <= ListBox2.Left) then
      FirstSplit := True
    else
      FirstSplit := False;
  end;
end;

procedure TForm1.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Dragging then
    if FirstSplit then
    begin
      if (X > 40) and
          (X < ClientWidth - ListBox3.Width - 40) then
        begin
          ListBox1.Width := X - 2;
          ListBox2.Left := X + 2;
          ListBox2.Width := ListBox3.Left - ListBox2.Left - 4;
        end;
    end
    else {second split}
      if (X > ListBox1.Width + 40) and
          (X < ClientWidth - 40) then
        begin
          ListBox2.Width := X - ListBox2.Left - 2;
          ListBox3.Left := X + 2;
          ListBox3.Width := ClientWidth - ListBox3.Left + 1;
        end;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Dragging then
    begin
      ReleaseCapture;
      Dragging := False;
    end;
end;

end.

