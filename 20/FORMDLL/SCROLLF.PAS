unit ScrollF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFormScroll = class(TForm)
    ScrollBarRed: TScrollBar;
    ScrollBarGreen: TScrollBar;
    ScrollBarBlue: TScrollBar;
    LabelRed: TLabel;
    LabelGreen: TLabel;
    LabelBlue: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    Label2: TLabel;
    LabelScroll: TLabel;
    TrackBar1: TTrackBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ScrollBarRedScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure ScrollBarGreenScroll(Sender: TObject;
      ScrollCode: TScrollCode; var ScrollPos: Integer);
    procedure ScrollBarBlueScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScroll: TFormScroll;

// extern DLL function declaration
function GetColor (Col: LongInt): LongInt; stdcall;

implementation

{$R *.DFM}

procedure TFormScroll.ScrollBarRedScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  LabelRed.Caption := 'Red: ' + IntToStr(ScrollPos);
  Shape1.Brush.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
  Shape2.Pen.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
end;

procedure TFormScroll.ScrollBarGreenScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  LabelGreen.Caption := 'Green: ' + IntToStr(ScrollPos);
  Shape1.Brush.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
  Shape2.Pen.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
end;

procedure TFormScroll.ScrollBarBlueScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  LabelBlue.Caption := 'Blue: ' + IntToStr(ScrollPos);
  Shape1.Brush.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
  Shape2.Pen.Color := RGB (ScrollBarRed.Position,
    ScrollBarGreen.Position, ScrollBarBlue.Position);
end;

procedure TFormScroll.TrackBar1Change(Sender: TObject);
begin
  LabelScroll.Caption := 'Scroll by ' + IntToStr(TrackBar1.Position);
  ScrollBarGreen.LargeChange := TrackBar1.Position;
  ScrollBarRed.LargeChange := TrackBar1.Position;
  ScrollBarBlue.LargeChange := TrackBar1.Position;
end;

// extern DLL function
function GetColor (Col: LongInt): LongInt;
begin
  // default value
  Result := Col;
  try
    FormScroll := TFormScroll.Create (Application);
    try
      with FormScroll do
      begin
        {initialize the data}
        Shape1.Brush.Color := Col;
        Shape2.Pen.Color := Col;
        ScrollBarRed.Position := GetRValue (Col);
        ScrollBarGreen.Position := GetGValue (Col);
        ScrollBarBlue.Position := GetBValue (Col);
        {show the form}
        if ShowModal = mrOK then
          Result := RGB (ScrollBarRed.Position,
            ScrollBarGreen.Position,
            ScrollBarBlue.Position);
      end; // with
    finally
      FormScroll.Free;
    end;
  except
    on E: Exception do
      MessageDlg ('Error in FormDLL: ' +
        E.Message, mtError, [mbOK], 0);
  end;
end;

end.
