unit MultioF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    help1: TMenuItem;
    About1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject;
      X, Y: Integer);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    OleObj: Boolean;               {Ole or Shape}
    X1, Y1: Integer;               {mouse position}
    OleCount, EditCount: Integer;  {number of controls}
  end;

var
  Form1: TForm1;

implementation

uses
  OleCtnrs;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  {initial value}
  OleObj := False;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  {stores the position of the mouse down event,
  used later in the FormDblClick method}
  X1 := X;
  Y1 := Y;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  OleObj := True;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  OleObj := False;
end;

procedure TForm1.FormDblClick(Sender: TObject);
var
  OleCont: TOleContainer;
  Pan: TPanel;
  Edit: TEdit;
begin
  if OleObj then
  begin
    // create a panel to host the OLE container
    Pan := TPanel.Create (self);
    Pan.Parent := Self;
    Pan.SetBounds (X1, Y1, 100, 100);
    // create an OLE container, with unique name
    OleCont := TOleContainer.Create (self);
    OleCont.Parent := Pan;
    OleCont.Align := alClient;
    Inc (OleCount);
    OleCont.Name := 'OleContainer' + IntToStr (OleCount);
    // insert the actual object
    OleCont.InsertObjectDialog;
    // enable dragging
    OleCont.OnMouseDown := ControlMouseDown;
  end
  else
  begin
    // create a new shape
    Edit := TEdit.Create (self);
    Edit.Parent := self;
    // define a unique name and set the position
    Inc (EditCount);
    Edit.Name := 'Edit' + IntToStr (EditCount);
    Edit.Left := X1;
    Edit.Top := Y1;
    // enable dragging
    Edit.OnMouseDown := ControlMouseDown;
  end;
end;

procedure TForm1.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TForm1.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Control: TControl;
begin
  if Source is TOleContainer then
    // move the panel hosting the control
    Control :=  (Source as TControl).Parent
  else
    Control := Source as TControl;
  Control.Left := X;
  Control.Top := Y;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('Multiple Ole Container example' +
    Chr (13) + 'From the book "Mastering Delphi" by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.ControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TWinControl).BeginDrag (False);
end;

end.

