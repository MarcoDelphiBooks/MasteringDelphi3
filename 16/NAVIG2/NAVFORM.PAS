unit navform;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables;

type
  TNavigForm = class(TForm)
    DataSource1: TDataSource;
    Query1: TQuery;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NavigForm: TNavigForm;

implementation

{$R *.DFM}

procedure TNavigForm.RadioButton1Click(Sender: TObject);
begin
  Query1.Close;
  Query1.Sql.Clear;
  Query1.Sql.Add ('select * from Country');
  Query1.Open;
end;

procedure TNavigForm.RadioButton2Click(Sender: TObject);
begin
  Query1.Close;
  Query1.Sql.Clear;
  Query1.Sql.Add ('select * from Country');
  Query1.Sql.Add ('where Continent = "' +
    (Sender as TRadioButton).Caption + '"');
  Query1.Open;
end;

procedure TNavigForm.RadioButton4Click(Sender: TObject);
begin
  Query1.Close;
  if (Edit1.Text <> '') then
  begin
    Query1.Sql.Clear;
    Query1.Sql.Add ('select * from Country');
    Query1.Sql.Add ('where ' + Edit1.Text);
  end;
  Query1.Open;
end;

procedure TNavigForm.Edit1Change(Sender: TObject);
begin
  RadioButton4.Enabled := Edit1.Text <> '';
end;


end.
