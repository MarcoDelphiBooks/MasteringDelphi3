unit BeepsF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, MmSystem, ExtCtrls;

type
  TForm1 = class(TForm)
    BeepButton: TButton;
    BoxButton: TButton;
    RadioGroup1: TRadioGroup;
    BeepOneButton: TButton;
    MessDlgButton: TButton;
    TestButton: TButton;
    procedure BeepButtonClick(Sender: TObject);
    procedure BeepOneButtonClick(Sender: TObject);
    procedure BoxButtonClick(Sender: TObject);
    procedure MessDlgButtonClick(Sender: TObject);
    procedure TestButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SoundMessageDlg (const Msg: string; AType: TMsgDlgType;
  AButtons: TMsgDlgButtons; HelpCtx: Longint): Integer;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BeepButtonClick(Sender: TObject);
var
  Flag: Cardinal;
begin
  case RadioGroup1.ItemIndex of
    0: Flag := mb_IconAsterisk;
    1: Flag := mb_IconExclamation;
    2: Flag := mb_IconHand;
    3: Flag := mb_IconQuestion;
    4: Flag := mb_Ok;
  else
    Flag := 0;
  end;
  MessageBeep (Flag);
end;

procedure TForm1.BeepOneButtonClick(Sender: TObject);
begin
  MessageBeep (Cardinal (-1));
end;

procedure TForm1.BoxButtonClick(Sender: TObject);
var
  Flag: Cardinal;
begin
  case RadioGroup1.ItemIndex of
    0: Flag := mb_IconAsterisk;
    1: Flag := mb_IconExclamation;
    2: Flag := mb_IconHand;
    3: Flag := mb_IconQuestion;
  else {including 4:}
    Flag := mb_Ok;
  end;
  MessageBeep (Flag);
  Application.MessageBox (
    PChar (RadioGroup1.Items [RadioGroup1.ItemIndex]),
    'Sound', Flag);
end;

function SoundMessageDlg (const Msg: string;
  AType: TMsgDlgType; AButtons: TMsgDlgButtons;
  HelpCtx: Longint): Integer;
var
  Flag: Cardinal;
begin
  case AType of
    mtWarning: Flag := mb_IconExclamation;
    mtError: Flag := mb_IconHand;
    mtInformation: Flag := mb_IconAsterisk;
    mtConfirmation: Flag := mb_IconQuestion;
  else
    Flag := mb_Ok;
  end;
  MessageBeep(Flag);
  Result := MessageDlg (Msg, AType,
    AButtons, HelpCtx);
end;

procedure TForm1.MessDlgButtonClick(Sender: TObject);
var
  DlgType: TMsgDlgType;
begin
  case RadioGroup1.ItemIndex of
    0: DlgType := mtInformation;
    1: DlgType := mtWarning;
    2: DlgType := mtError;
    3: DlgType := mtConfirmation;
  else {including 4:}
    DlgType := mtCustom;
  end;
  SoundMessageDlg (
    RadioGroup1.Items [RadioGroup1.ItemIndex],
    DlgType, [mbOK], 0);
end;

procedure TForm1.TestButtonClick(Sender: TObject);
begin
  if WaveOutGetNumDevs > 0 then
    SoundMessageDlg ('Sound is supported',
      mtInformation, [mbOk], 0)
  else
    SoundMessageDlg ('Sound is NOT supported',
      mtError, [mbOk], 0);
end;

end.
