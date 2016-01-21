unit ReportF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Report;

type
  TForm1 = class(TForm)
    Report1: TReport;
    ReportButton: TButton;
    OpenDialog1: TOpenDialog;
    PreviewCheckBox: TCheckBox;
    procedure ReportButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ReportButtonClick(Sender: TObject);
begin
  Report1.Preview := PreviewCheckBox.Checked;
  if OpenDialog1.Execute then
  begin
    Report1.Reportname := OpenDialog1.FileName;
    Report1.Run;
  end;
end;

end.
