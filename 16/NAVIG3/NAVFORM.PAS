unit navform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables, DBLookup;

type
  TNavigForm = class(TForm)
    DataSource1: TDataSource;
    Query1: TQuery;
    GroupBox1: TGroupBox;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Bevel1: TBevel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    procedure RadioButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NavigForm: TNavigForm;

implementation

{$R *.DFM}

procedure TNavigForm.RadioButton2Click(Sender: TObject);
begin
  Query1.Close;
  Query1.Params[0].AsString :=
    (Sender as TRadioButton).Caption;
  Query1.Open;
end;

procedure TNavigForm.FormCreate(Sender: TObject);
begin
  Query1.Prepare;
  Query1.Open;
end;


end.
