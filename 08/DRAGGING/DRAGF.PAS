unit DragF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TDraggingForm = class(TForm)
    LabelRed: TLabel;
    LabelAqua: TLabel;
    LabelGreen: TLabel;
    LabelYellow: TLabel;
    StaticTarget: TStaticText;
    procedure StaticTargetDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure StaticTargetDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DraggingForm: TDraggingForm;

implementation

{$R *.DFM}

procedure TDraggingForm.StaticTargetDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  StaticTarget.Color := (Source as TLabel).Color;
end;

procedure TDraggingForm.StaticTargetDragOver (
  Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TLabel;
end;

end.

