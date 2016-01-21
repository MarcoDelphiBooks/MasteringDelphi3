unit ListForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    ButtonAddNum: TButton;
    ButtonListNum: TButton;
    ListBox1: TListBox;
    ButtonAddDate: TButton;
    ButtonListDate: TButton;
    ButtonWrong: TButton;
    procedure ButtonAddNumClick(Sender: TObject);
    procedure ButtonListNumClick(Sender: TObject);
    procedure ButtonAddDateClick(Sender: TObject);
    procedure ButtonListDateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonWrongClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ListNum, ListDate: TList;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  Dates;

procedure TForm1.ButtonAddNumClick(Sender: TObject);
begin
  ListNum.Add (Pointer (Random (10000)));
end;

procedure TForm1.ButtonListNumClick(Sender: TObject);
var
  I: Integer;
begin
  ListBox1.Clear;
  for I := 0 to ListNum.Count - 1 do
    Listbox1.Items.Add (IntToStr (Integer (ListNum [I])));
end;

procedure TForm1.ButtonAddDateClick(Sender: TObject);
begin
  ListDate.Add (TDate.Init (
    1 + Random (12),
    1 + Random (31),
    1900 + Random (200)));
end;

procedure TForm1.ButtonListDateClick(Sender: TObject);
var
  I: Integer;
begin
  ListBox1.Clear;
  for I := 0 to ListDate.Count - 1 do
    Listbox1.Items.Add ((
      TObject(ListDate [I]) as TDate).GetText);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  ListNum := TList.Create;
  ListDate := TList.Create;
end;

procedure TForm1.ButtonWrongClick(Sender: TObject);
begin
  // add a button to both lists
  ListNum.Add (Sender);
  ListDate.Add (Sender);
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ListDate.Count - 1 do
    (TObject(ListDate [I]) as TDate).Free;
end;

end.
