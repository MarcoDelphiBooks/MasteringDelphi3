unit SplitF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Header1: THeader;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    FontDialog1: TFontDialog;
    procedure Header1Sized(Sender: TObject; ASection, AWidth: Integer);
    procedure ListBoxDblClick(Sender: TObject);
    procedure Header1Sizing(Sender: TObject; ASection, AWidth: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Header1Sized(Sender: TObject;
  ASection, AWidth: Integer);
begin
  if ASection = 0 then
    ListBox1.Width := AWidth;
  if ASection = 1 then
    Listbox2.Width := AWidth;
end;

procedure TForm1.Header1Sizing(Sender: TObject;
  ASection, AWidth: Integer);
var
  MaxWidth: Integer;
begin
  if AWidth < 40 then
  begin
    Header1.SectionWidth [ASection] := 40;
    ReleaseCapture;
    Header1Sized (Sender, ASection, 40);
  end;
  if ASection = 0 then
    MaxWidth := ClientWidth - 40 - Header1.SectionWidth [1]
  else
    MaxWidth := ClientWidth - 40 - Header1.SectionWidth [0];
  if AWidth > MaxWidth  then
  begin
    Header1.SectionWidth [ASection] := MaxWidth;
    ReleaseCapture;
    Header1Sized (Sender, ASection, MaxWidth);
  end;
end;

procedure TForm1.ListBoxDblClick(Sender: TObject);
begin
  with Sender as TListbox do
  begin
    FontDialog1.Font := Font;
    if FontDialog1.Execute then
      Font := FontDialog1.Font;
  end;
end;

end.
