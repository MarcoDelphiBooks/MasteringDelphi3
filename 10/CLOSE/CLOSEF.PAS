unit CloseF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;                                        

type
  TForm1 = class(TForm)
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg ('Are you sure you want to exit?',
      mtConfirmation, [mbYes, mbNo], 0) = idNo then
    CanClose := False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg ('Are you REALLY SURE you want to exit?' +
      Chr(13) + '(This is your last chance to remain with us!)',
      mtConfirmation, [mbYes, mbNo], 0) = idNo then
    Action := caNone
  else
    Action := caFree;
end;

end.
