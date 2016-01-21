unit TBarForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Menus, StdCtrls, ExtCtrls;

type
  TRealBarForm = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    TbNote: TToolButton;
    TbSeparator1: TToolButton;
    TbLeft: TToolButton;
    TbCenter: TToolButton;
    TbRight: TToolButton;
    TbSeparator2: TToolButton;
    TbBold: TToolButton;
    TbItalic: TToolButton;
    TbUnderlined: TToolButton;
    TbSize: TToolButton;
    TbSeparator3: TToolButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    exit1: TMenuItem;
    Toolbar2: TMenuItem;
    Captions1: TMenuItem;
    Label1: TLabel;
    CaptionBelow1: TMenuItem;
    Flat1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure TbNoteClick(Sender: TObject);
    procedure TbLeftClick(Sender: TObject);
    procedure TbCenterClick(Sender: TObject);
    procedure TbRightClick(Sender: TObject);
    procedure TbBoldClick(Sender: TObject);
    procedure TbItalicClick(Sender: TObject);
    procedure TbUnderlinedClick(Sender: TObject);
    procedure TbSizeClick(Sender: TObject);
    procedure Captions1Click(Sender: TObject);
    procedure CaptionBelow1Click(Sender: TObject);
    procedure Flat1Click(Sender: TObject);
    procedure exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RealBarForm: TRealBarForm;

implementation

{$R *.DFM}


procedure TRealBarForm.TbNoteClick(Sender: TObject);
begin
  Beep;
end;


procedure TRealBarForm.TbLeftClick(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
end;

procedure TRealBarForm.TbCenterClick(Sender: TObject);
begin
  Label1.Alignment := taCenter;
end;

procedure TRealBarForm.TbRightClick(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
end;

procedure TRealBarForm.TbBoldClick(Sender: TObject);
begin
  Label1.Font.Style := [fsBold];
end;

procedure TRealBarForm.TbItalicClick(Sender: TObject);
begin
  Label1.Font.Style := [fsItalic];
end;

procedure TRealBarForm.TbUnderlinedClick(Sender: TObject);
begin
  Label1.Font.Style := [fsUnderline];
end;

procedure TRealBarForm.TbSizeClick(Sender: TObject);
begin
  if TbSize.Down then
    Label1.Font.Size := 24
  else
    Label1.Font.Size := 12;
end;

procedure TRealBarForm.Captions1Click(Sender: TObject);
begin
  Toolbar1.ShowCaptions := not Toolbar1.ShowCaptions;
  Captions1.Checked := Toolbar1.ShowCaptions;
  CaptionBelow1.Enabled := Toolbar1.ShowCaptions;
end;

procedure TRealBarForm.CaptionBelow1Click(Sender: TObject);
begin
   // this is cearly a bug!
  CaptionBelow1.Checked := not Toolbar1.Flat;
end;

procedure TRealBarForm.Flat1Click(Sender: TObject);
begin
  Toolbar1.Flat := not Toolbar1.Flat;
  Flat1.Checked := Toolbar1.Flat;
end;

procedure TRealBarForm.exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TRealBarForm.About1Click(Sender: TObject);
begin
  MessageDlg ('A real toolbar from Mastering Delphi', mtINformation,
    [mbOK], 0);
end;

procedure TRealBarForm.FormResize(Sender: TObject);
begin
  // bug fix:
  Label1.Top := Toolbar1.Height;
end;

end.
