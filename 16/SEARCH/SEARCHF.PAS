unit SearchF;

{WARNING : This program will not run with the default
database samples shipped with Delphi. You need to add a
secondary index to the employee.db table using the
Database Desktop application, as explained in the text}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs;

type
  TSearchForm = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditEmpNo: TDBEdit;
    Label2: TLabel;
    EditLastName: TDBEdit;
    Label3: TLabel;
    EditFirstName: TDBEdit;
    Label4: TLabel;
    EditPhoneExt: TDBEdit;
    Label5: TLabel;
    EditHireDate: TDBEdit;
    Label6: TLabel;
    EditSalary: TDBEdit;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Table1: TTable;
    SpeedButtonFirst: TSpeedButton;
    SpeedButtonPrior: TSpeedButton;
    SpeedButtonNext: TSpeedButton;
    SpeedButtonLast: TSpeedButton;
    SpeedButtonMoveOn: TSpeedButton;
    SpeedButtonMoveBack: TSpeedButton;
    EditName: TEdit;
    SpeedButtonGoto: TSpeedButton;
    SpeedButtonGoNear: TSpeedButton;
    Table1Salary: TFloatField;
    Table1EmpNo: TIntegerField;
    Table1LastName: TStringField;
    Table1FirstName: TStringField;
    Table1PhoneExt: TStringField;
    Table1HireDate: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonFirstClick(Sender: TObject);
    procedure SpeedButtonPriorClick(Sender: TObject);
    procedure SpeedButtonNextClick(Sender: TObject);
    procedure SpeedButtonLastClick(Sender: TObject);
    procedure SpeedButtonMoveOnClick(Sender: TObject);
    procedure SpeedButtonMoveBackClick(Sender: TObject);
    procedure SpeedButtonGotoClick(Sender: TObject);
    procedure SpeedButtonGoNearClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure EnableNextButtons;
    procedure DisableNextButtons;
    procedure EnablePriorButtons;
    procedure DisablePriorButtons;
    procedure EnableAllButtons;
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.DFM}

procedure TSearchForm.FormCreate(Sender: TObject);
begin
  Table1.First;
end;

procedure TSearchForm.EnablePriorButtons;
begin
  SpeedButtonFirst.Enabled := True;
  SpeedButtonPrior.Enabled := True;
  SpeedButtonMoveBack.Enabled := True;
end;

procedure TSearchForm.DisablePriorButtons;
begin
  SpeedButtonFirst.Enabled := False;
  SpeedButtonPrior.Enabled := False;
  SpeedButtonMoveBack.Enabled := False;
end;

procedure TSearchForm.EnableNextButtons;
begin
  SpeedButtonLast.Enabled := True;
  SpeedButtonNext.Enabled := True;
  SpeedButtonMoveOn.Enabled := True;
end;

procedure TSearchForm.DisableNextButtons;
begin
  SpeedButtonLast.Enabled := False;
  SpeedButtonNext.Enabled := False;
  SpeedButtonMoveOn.Enabled := False;
end;

procedure TSearchForm.EnableAllButtons;
begin
  EnableNextButtons;
  EnablePriorButtons;
end;

procedure TSearchForm.SpeedButtonFirstClick(Sender: TObject);
begin
  Table1.First;
  EnableNextButtons;
  DisablePriorButtons;
end;

procedure TSearchForm.SpeedButtonPriorClick(Sender: TObject);
begin
  Table1.Prior;
  EnableNextButtons;
  if Table1.BOF then
    DisablePriorButtons;
end;

procedure TSearchForm.SpeedButtonNextClick(Sender: TObject);
begin
  Table1.Next;
  EnablePriorButtons;
  if Table1.EOF then
    DisableNextButtons;
end;

procedure TSearchForm.SpeedButtonLastClick(Sender: TObject);
begin
  Table1.Last;
  EnablePriorButtons;
  DisableNextButtons;
end;

procedure TSearchForm.SpeedButtonMoveOnClick(Sender: TObject);
begin
  Table1.MoveBy (5);
  EnablePriorButtons;
  if Table1.EOF then
    DisableNextButtons;
end;

procedure TSearchForm.SpeedButtonMoveBackClick(Sender: TObject);
begin
  Table1.MoveBy (-5);
  EnableNextButtons;
  if Table1.BOF then
    DisablePriorButtons;
end;

procedure TSearchForm.SpeedButtonGotoClick(Sender: TObject);
begin
  // locate
  if not Table1.Locate ('LastName', EditName.Text, []) then
    MessageDlg ('Name not found', mtError, [mbOk], 0)
  else
    EnableAllButtons;

  // short-hand
{  if not Table1.FindKey ([EditName.Text]) then
    MessageDlg ('Name not found', mtError, [mbOk], 0)
  else
    EnableAllButtons;}
  // alternative code:
  {Table1.SetKey;
  Table1.FieldByName('LastName').AsString := EditName.Text;
  Table1.KeyFieldCount := 1;
  if not Table1.GotoKey then
    MessageDlg ('Name not found', mtError, [mbOk], 0)
  else
    EnableAllButtons;}
end;

procedure TSearchForm.SpeedButtonGoNearClick(Sender: TObject);
begin
  // short-hand
  Table1.FindNearest ([EditName.Text]);

  // alternative code:
  {Table1.SetKey;
  Table1.FieldByName('LastName').AsString := EditName.Text;
  Table1.GotoNearest;}
  EnableAllButtons;
end;

end.