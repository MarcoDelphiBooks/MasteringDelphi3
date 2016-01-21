unit Objuse_f;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Dates, StdCtrls;

type
  TForm1 = class(TForm)
    ShowButton: TButton;
    ListBox1: TListBox;
    procedure ShowButtonClick(Sender: TObject);
  private
    procedure ShowInfo (Obj: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ShowInfo (Obj: TObject);
begin
  // add class name
  ListBox1.Items.Add ('Class Name: ' + Obj.ClassName);
  // add parent class name, if any
  if Obj.ClassParent <> nil then
  begin
    ListBox1.Items.Add ('Parent Class Name: ' +
      Obj.ClassParent.ClassName);
    // add grandparent class name, if any
    if Obj.ClassParent.ClassParent <> nil then
      ListBox1.Items.Add ('Grandparent Class Name: ' +
        Obj.ClassParent.ClassParent.ClassName);
  end;
  // add the size of object and reference
  ListBox1.Items.Add ('Object Size: ' +
    IntToStr (Obj.InstanceSize));
  ListBox1.Items.Add ('Reference Size: ' +
    IntToStr (SizeOf (Obj)));
  // indicate if this is a component or not
  if Obj.InheritsFrom (TComponent) then
    ListBox1.Items.Add ('This is a component')
  else
    ListBox1.Items.Add ('This is NOT a component');
end;

procedure TForm1.ShowButtonClick(Sender: TObject);
var
  Day: TDate;
begin
  {create an instance and show some information}
  Day := TDate.Init (6, 1, 1995);
  ShowInfo (Day);
  ListBox1.Items.Add ('');

  {show the same information about
  the form and the sender, the button}
  ShowInfo (self);
  ListBox1.Items.Add ('');
  ShowInfo (Sender);

  {free memory}
  Day.Free;

  {disable the button, to avoid a second click}
  ShowButton.Enabled := False;
end;

end.
