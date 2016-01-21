unit GridView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, DBCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButtonView: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure SpeedButtonViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DataM, FormView;

{$R *.DFM}

procedure TForm1.SpeedButtonViewClick(Sender: TObject);
begin
  Form3.Show;
end;

end.
