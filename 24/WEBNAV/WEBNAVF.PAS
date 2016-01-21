unit WebNavF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, OleCtrls, isp3, StdCtrls, ToolWin, ExtCtrls;

type
  TFormWebNav = class(TForm)
    CoolBar1: TCoolBar;
    Animate1: TAnimate;
    ComboURLs: TComboBox;
    HTML1: THTML;
    ToolBar1: TToolBar;
    ExplorerImages: TImageList;
    ExplorerHotImages: TImageList;
    ToolBtnPrevious: TToolButton;
    ToolBtnNext: TToolButton;
    ToolBtnStop: TToolButton;
    ToolBtnRefresh: TToolButton;
    StatusBar1: TStatusBar;
    procedure HTML1BeginRetrieval(Sender: TObject);
    procedure HTML1EndRetrieval(Sender: TObject);
    procedure ToolBtnStopClick(Sender: TObject);
    procedure ComboURLsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HTML1DoRequestDoc(Sender: TObject; const URL: WideString;
      const Element: HTMLElement; const DocInput: DocInput;
      var EnableDefault: WordBool);
    procedure ComboURLsClick(Sender: TObject);
    procedure ToolBtnPreviousClick(Sender: TObject);
    procedure ToolBtnNextClick(Sender: TObject);
    procedure ToolBtnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GotoPage (ReqURL: string);
    procedure ShowCurrent (ReqURL: string);
  end;

var
  FormWebNav: TFormWebNav;

implementation

{$R *.DFM}

procedure TFormWebNav.GotoPage (ReqURL: string);
begin
  // show the request on status bar and combo box
  ShowCurrent (ReqURL);
  // open the page
  HTML1.RequestDoc(ReqURL);
end;

procedure TFormWebNav.ShowCurrent (ReqURL: string);
var
  Curr: Integer;
begin
  // add the item to the combo, if not present
  Curr := ComboURLs.Items.IndexOf(ReqURL);
  if Curr = -1 then
    Curr := ComboURLs.Items.Add(ReqURL);
  // select the items
  ComboURLs.Text := ReqURL;
  StatusBar1.Panels[0].Text := ReqURL;
  // enable toolbar buttons
  ToolBtnPrevious.Enabled := Curr > 0;
  ToolBtnNext.Enabled := Curr < ComboURLs.Items.Count - 1;
end;

procedure TFormWebNav.HTML1BeginRetrieval(Sender: TObject);
begin
  ToolBtnStop.Enabled := True;
  Animate1.Active := True;
end;

procedure TFormWebNav.HTML1EndRetrieval(Sender: TObject);
begin
  ToolBtnStop.Enabled := False;
  Animate1.Active := False;
end;

procedure TFormWebNav.ToolBtnStopClick(Sender: TObject);
begin
  HTML1.Cancel(Null);
  ToolBtnStop.Enabled := False;
end;

procedure TFormWebNav.ComboURLsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    GotoPage (ComboURLs.Text);
end;

procedure TFormWebNav.HTML1DoRequestDoc(Sender: TObject;
  const URL: WideString; const Element: HTMLElement;
  const DocInput: DocInput; var EnableDefault: WordBool);
begin
  // show the current page
  ShowCurrent (URL);
end;

procedure TFormWebNav.ComboURLsClick(Sender: TObject);
begin
  GotoPage (ComboURLs.Text);
end;

procedure TFormWebNav.ToolBtnPreviousClick(Sender: TObject);
var
  Curr: Integer;
begin
  Curr := ComboURLs.Items.IndexOf(ComboURLs.Text);
  if Curr > 0 then
    GotoPage (ComboURLs.Items [Curr - 1]);
end;

procedure TFormWebNav.ToolBtnNextClick(Sender: TObject);
var
  Curr: Integer;
begin
  Curr := ComboURLs.Items.IndexOf(ComboURLs.Text);
  if Curr < ComboURLs.Items.Count - 1 then
    GotoPage (ComboURLs.Items [Curr + 1]);
end;

procedure TFormWebNav.ToolBtnRefreshClick(Sender: TObject);
begin
  GotoPage (ComboURLs.Text);
end;

procedure TFormWebNav.FormCreate(Sender: TObject);
var
  Drive: string;
begin
  Drive := ExtractFileDrive (ParamStr (0));
  GotoPage ('file:' + Drive + 'default.htm');
end;

end.

