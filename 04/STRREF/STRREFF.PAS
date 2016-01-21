unit StrRefF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormStrRef = class(TForm)
    BtnAssign: TButton;
    Label1: TLabel;
    Label2: TLabel;
    BtnChange: TButton;
    procedure BtnAssignClick(Sender: TObject);
    procedure BtnChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStrRef: TFormStrRef;
  Str1, Str2: string;

implementation

{$R *.DFM}

procedure TFormStrRef.BtnAssignClick(Sender: TObject);
begin
  Str1 := 'Hello';
  Str2 := Str1;
  Label1.Caption := 'Str1: ' + Str1 +
    ' - ' + IntToStr (Integer (Str1));
  Label2.Caption := 'Str2: ' + Str2 +
    ' - ' + IntToStr (Integer (Str2));
  BtnChange.Enabled := True;
end;

procedure TFormStrRef.BtnChangeClick(Sender: TObject);
begin
  Str1 [2] := 'a';
  Label1.Caption := 'Str1: ' + Str1 +
    ' - ' + IntToStr (Integer (Str1));
  Label2.Caption := 'Str2: ' + Str2 +
    ' - ' + IntToStr (Integer (Str2));
end;

end.
