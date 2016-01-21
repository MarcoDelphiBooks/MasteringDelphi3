unit Main;

interface

uses Windows, Classes, Graphics, Forms, Controls,
     StyleD, ListD, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StyleButton: TButton;
    Bevel1: TBevel;
    procedure LabelDoubleClick(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure StyleButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.LabelDoubleClick(Sender: TObject);
begin
  with ListDial.Listbox1 do
  begin
    {select current the name in the listbox}
    ItemIndex := Items.IndexOf ((Sender as TLabel).Caption);
    {show the modal dialog box, checking the return value}
    if (ListDial.ShowModal = mrOk) and (ItemIndex >= 0) then
      {if Ok, then copy the selected item of the list to the label}
      (Sender As TLabel).Caption := Items [ItemIndex];
  end;
end;

procedure TForm1.LabelClick(Sender: TObject);
begin
  {set the color of all the labels to black}
  Label1.Font.Color := clBlack;
  Label2.Font.Color := clBlack;
  Label3.Font.Color := clBlack;
  Label4.Font.Color := clBlack;
  Label5.Font.Color := clBlack;
  {set the color of the clicked label to red}
  (Sender as TLabel).Font.Color := clRed;
end;

procedure TForm1.StyleButtonClick(Sender: TObject);
begin
  {run modeless dialog}
  StyleDial.Show;
end;

end.

