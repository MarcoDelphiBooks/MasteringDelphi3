unit Confdial;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Buttons, StdCtrls;

type
  TConfigureDialog = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    ItalicCheckBox: TCheckBox;
    BoldCheckBox: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    OldHeight, NewHeight: Integer;
  end;

var
  ConfigureDialog: TConfigureDialog;

implementation

{$R *.DFM}

procedure TConfigureDialog.BitBtn3Click(Sender: TObject);
var
  I: Integer;
begin
  BitBtn3.Enabled := False;
  BoldCheckBox.Enabled := True;
  ItalicCheckBox.Enabled := True;
  for I := ClientHeight to NewHeight do
  begin
    ClientHeight := I;
    Update;
  end;
end;

procedure TConfigureDialog.FormCreate(Sender: TObject);
begin
  OldHeight := ClientHeight;
  // bottom of the checkbox + margin above the button
  NewHeight := ItalicCheckBox.Top +
    ItalicCheckBox.Height + BitBtn1.Top;
end;

procedure TConfigureDialog.FormActivate(Sender: TObject);
begin
  ClientHeight := OldHeight;
  BitBtn3.Enabled := True;
  BoldCheckBox.Enabled := False;
  ItalicCheckBox.Enabled := False;
end;

end.

