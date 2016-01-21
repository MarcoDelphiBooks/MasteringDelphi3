unit Unit2;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls;

type
  TForm2 = class(TForm)
    Table1NAME: TStringField;
    Table1SIZE: TSmallintField;
    Table1WEIGHT: TSmallintField;
    Table1AREA: TStringField;
    Table1BMP: TBlobField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditNAME: TDBEdit;
    Label2: TLabel;
    EditSIZE: TDBEdit;
    Label3: TLabel;
    EditWEIGHT: TDBEdit;
    Label4: TLabel;
    EditAREA: TDBEdit;
    Label5: TLabel;
    ImageBMP: TDBImage;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

end.