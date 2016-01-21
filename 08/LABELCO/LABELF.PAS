unit LabelF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TColorTextForm = class(TForm)
    Label1: TLabel;
    ColorDialog1: TColorDialog;
    Panel1: TPanel;
    BtnLeft: TButton;
    BtnFontColor: TButton;
    BtnCenter: TButton;
    BtnBackColor: TButton;
    BtnRight: TButton;
    procedure BtnFontColorClick(Sender: TObject);
    procedure BtnBackColorClick(Sender: TObject);
    procedure BtnLeftClick(Sender: TObject);
    procedure BtnCenterClick(Sender: TObject);
    procedure BtnRightClick(Sender: TObject);
  private

  public

  end;

var
  ColorTextForm: TColorTextForm;

implementation

{$R *.DFM}

procedure TColorTextForm.BtnFontColorClick(Sender: TObject);
begin
  ColorDialog1.Color := Label1.Font.Color;
  if ColorDialog1.Execute then
    Label1.Font.Color := ColorDialog1.Color;
end;

procedure TColorTextForm.BtnBackColorClick(Sender: TObject);
begin
  ColorDialog1.Color := Label1.Color;
  if ColorDialog1.Execute then
    Label1.Color := ColorDialog1.Color;
end;

procedure TColorTextForm.BtnLeftClick(Sender: TObject);
begin
  Label1.Alignment := taLeftJustify;
end;

procedure TColorTextForm.BtnCenterClick(Sender: TObject);
begin
  Label1.Alignment := taCenter;
end;

procedure TColorTextForm.BtnRightClick(Sender: TObject);
begin
  Label1.Alignment := taRightJustify;
end;


end.

