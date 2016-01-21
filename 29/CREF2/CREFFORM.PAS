unit CRefForm;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Menus;

type
  CRefType = class of TControl;
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    SaveAs1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Panel1: TPanel;
    RadioRadioButton: TRadioButton;
    ButtonRadioButton: TRadioButton;
    EditRadioButton: TRadioButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SaveAs2: TMenuItem;
    N2: TMenuItem;
    SaveDialog2: TSaveDialog;
    procedure RadioButtonRadioClick(Sender: TObject);
    procedure RadioButtonButtonClick(Sender: TObject);
    procedure RadioButtonEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SaveAs2Click(Sender: TObject);
  private
    ClassRef: CRefType;
    Counter: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.RadioButtonRadioClick(Sender: TObject);
begin
  ClassRef := TRadioButton;
end;

procedure TForm1.RadioButtonButtonClick(Sender: TObject);
begin
  ClassRef := TButton;
end;

procedure TForm1.RadioButtonEditClick(Sender: TObject);
begin
  ClassRef := TEdit;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClassRef := TRadioButton;
  Counter := 0;
end;

procedure TForm1.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  MyObj: TControl;
  MyName: String;
begin
  {create an object using the current class reference}
  MyObj := ClassRef.Create (self);
  MyObj.Visible := False;
  MyObj.Parent := self;
  MyObj.Left := X;
  MyObj.Top := Y;
  Inc (Counter);
  {define the name using the class name, without the
  initial T, and the number of the Counter}
  MyName := ClassRef.ClassName + IntToStr (Counter);
  Delete (MyName, 1, 1);
  MyObj.Name := MyName;
  MyObj.Visible := True;
end;

procedure TForm1.New1Click(Sender: TObject);
var
  I: Integer;
begin
  {delete all existing components, except the panel}
  for I := ControlCount - 1 downto 0 do
    if Controls[I].ClassName <> 'TPanel' then
      Controls[I].Free;
  Counter := 0;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  S: TFileStream;
  New: TComponent;
begin
  if OpenDialog1.Execute then
  begin
    {remove existing controls}
    New1Click (self);

    {open the stream}
    S := TFileStream.Create (OpenDialog1.FileName,
      fmOpenRead);
    try
      while S.Position < S.Size do
      begin
        {read a component and add it to the form}
        New := S.ReadComponent (nil);
        InsertControl (New as TControl);
        Inc (Counter);
      end;
    finally
      S.Free;
    end;
  end;
end;

procedure TForm1.SaveAs1Click(Sender: TObject);
var
  S: TFileStream;
  I: Integer;
begin
  if SaveDialog1.Execute then
  begin
    {open or create the stream file}
    S := TFileStream.Create (SaveDialog1.FileName,
      fmOpenWrite or fmCreate);
    try
      {save each component except the panel}
      for I := 0 to ControlCount - 1 do
        if Controls[I].ClassName <> 'TPanel' then
          S.WriteComponent (Controls[I]);
    finally
      S.Free;
    end;
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('CREF2 Example: Save components to file' +
    Chr(13) + 'From "Mastering Delphi", by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

{save form file}
procedure TForm1.SaveAs2Click(Sender: TObject);
begin
  if SaveDialog2.Execute then
    WriteComponentResFile
      (SaveDialog2.Filename, self);
end;

initialization
  {register the classes of the components; this code is
  required by the stream loader}
  RegisterClasses ([TRadioButton, TEdit, TButton]);
end.

