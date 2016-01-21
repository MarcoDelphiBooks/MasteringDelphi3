unit Italy;

interface

uses
  Windows, Classes, Graphics, Forms,
  Controls, Menus, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Notebook1: TNotebook;
    Panel1: TPanel;
    ButtonFirst: TButton;
    ButtonPrevious: TButton;
    ButtonNext: TButton;
    ButtonLast: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    ButtonGo: TButton;
    Label2: TLabel;
    ButtonFamous: TButton;
    ButtonOther: TButton;
    Memo2: TMemo;
    ButtonFine: TButton;
    Memo3: TMemo;
    ButtonFine2: TButton;
    Label3: TLabel;
    ButtonInfo: TButton;
    Label4: TLabel;
    ButtonBye: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ButtonStart: TButton;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure ButtonFamousClick(Sender: TObject);
    procedure ButtonOtherClick(Sender: TObject);
    procedure ButtonFineClick(Sender: TObject);
    procedure ButtonInfoClick(Sender: TObject);
    procedure ButtonByeClick(Sender: TObject);
    procedure ButtonFirstClick(Sender: TObject);
    procedure ButtonPreviousClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure ButtonLastClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
  Notebook1.PageIndex := 1;
  ButtonFirst.Enabled := True;
  ButtonPrevious.Enabled := True;
end;

procedure TForm1.ButtonGoClick(Sender: TObject);
begin
  Notebook1.PageIndex := 2;
end;

procedure TForm1.ButtonFamousClick(Sender: TObject);
begin
  Notebook1.PageIndex := 3;
end;

procedure TForm1.ButtonOtherClick(Sender: TObject);
begin
  Notebook1.PageIndex := 4;
end;

procedure TForm1.ButtonFineClick(Sender: TObject);
begin
  Notebook1.PageIndex := 5;
end;

procedure TForm1.ButtonInfoClick(Sender: TObject);
begin
  Notebook1.PageIndex := 2;
end;

procedure TForm1.ButtonByeClick(Sender: TObject);
begin
  Notebook1.PageIndex := 6;
  ButtonLast.Enabled := False;
  ButtonNext.Enabled := False;
end;

procedure TForm1.ButtonFirstClick(Sender: TObject);
begin
  Notebook1.PageIndex := 0;
  ButtonFirst.Enabled := False;
  ButtonPrevious.Enabled := False;
  ButtonNext.Enabled := True;
  ButtonLast.Enabled := True;
end;

procedure TForm1.ButtonPreviousClick(Sender: TObject);
begin
  if Notebook1.PageIndex > 0 then
    Notebook1.PageIndex := Notebook1.PageIndex - 1;
  if Notebook1.PageIndex = 0 then
    begin
      ButtonFirst.Enabled := False;
      ButtonPrevious.Enabled := False;
    end
  else
    begin
      ButtonFirst.Enabled := True;
      ButtonPrevious.Enabled := True;
    end;
  ButtonNext.Enabled := True;
  ButtonLast.Enabled := True;
end;

procedure TForm1.ButtonNextClick(Sender: TObject);
begin
  if Notebook1.PageIndex < 6 then
    Notebook1.PageIndex := Notebook1.PageIndex + 1;
  if Notebook1.PageIndex = 6 then
    begin
      ButtonNext.Enabled := False;
      ButtonLast.Enabled := False;
    end
  else
    begin
      ButtonNext.Enabled := True;
      ButtonLast.Enabled := True;
    end;
  ButtonFirst.Enabled := True;
  ButtonPrevious.Enabled := True;
end;

procedure TForm1.ButtonLastClick(Sender: TObject);
begin
  Notebook1.PageIndex := 6;
  ButtonFirst.Enabled := True;
  ButtonPrevious.Enabled := True;
  ButtonNext.Enabled := False;
  ButtonLast.Enabled := False;
end;

end.

