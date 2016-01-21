program Dragging;

uses
  Forms,
  DragF in 'DragF.pas' {DraggingForm};

{$R *.RES}

begin
  Application.CreateForm(TDraggingForm, DraggingForm);
  Application.Run;
end.

