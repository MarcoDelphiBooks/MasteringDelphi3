unit XArAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TMd3WArrowXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowMd3WArrowXAbout;

implementation

{$R *.DFM}

procedure ShowMd3WArrowXAbout;
begin
  with TMd3WArrowXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
