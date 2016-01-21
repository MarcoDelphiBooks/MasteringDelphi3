unit Topform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Style1: TMenuItem;
    Stayontop1: TMenuItem;
    Help1: TMenuItem;
    AboutMessageDlg1: TMenuItem;
    AboutMessageBox1: TMenuItem;
    Label1: TLabel;
    procedure Stayontop1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AboutMessageDlg1Click(Sender: TObject);
    procedure AboutMessageBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Stayontop1Click(Sender: TObject);
begin
  if StayOnTop1.Checked then
    SetWindowPos (Handle, hwnd_NoTopMost,
      0, 0, 0, 0, swp_NoMove or swp_NoSize)
  else
    SetWindowPos (Handle, hwnd_TopMost,
      0, 0, 0, 0, swp_NoMove or swp_NoSize);
  StayOnTop1.Checked := not StayOnTop1.Checked;
end;


procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.AboutMessageBox1Click(Sender: TObject);
begin
  MessageBox (Handle, 'This about box is not on top', 'Message Box', MB_OK);
end;

procedure TForm1.AboutMessageDlg1Click(Sender: TObject);
begin
  Application.NormalizeTopMosts;
  MessageDlg ('This is an about MessageDlg',
    mtInformation, [mbOK], 0);
  Application.RestoreTopMosts;
end;


end.
