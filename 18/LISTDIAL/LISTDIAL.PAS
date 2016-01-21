unit Listdial;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons;

type
  TMd3ListBoxDialog = class (TComponent)
  private
    FLines: TStrings;
    FSelected: Integer;
    FTitle: string;
    function GetSelItem: string;
    procedure SetLines (Value: TStrings);
    function GetLines: TStrings;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    property SelItem: string
      read GetSelItem;
  published
    property Lines: TStrings
      read GetLines write SetLines;
    property Selected: Integer
      read FSelected write FSelected;
    property Title: string
      read FTitle write FTitle;
  end;

procedure Register;

implementation

type
  TListBoxForm = class(TForm)
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{$R *.DFM}

constructor TMd3ListBoxDialog.Create(AOwner: TComponent);
begin
  inherited Create (AOwner);
  FLines := TStringList.Create;
  FTitle := 'Choose a string';
end;

destructor TMd3ListBoxDialog.Destroy;
begin
  FLines.Free;
  inherited Destroy;
end;

function TMd3ListBoxDialog.GetSelItem: string;
begin
  if Selected >= 0 then
    Result := FLines [Selected]
  else
    Result := '';
end;

function TMd3ListBoxDialog.GetLines: TStrings;
begin
  Result := FLines;
end;

procedure TMd3ListBoxDialog.SetLines (Value: TStrings);
begin
  FLines.Assign (Value);
end;

function TMd3ListBoxDialog.Execute: Boolean;
var
  ListBoxForm: TListBoxForm;
begin
  if FLines.Count = 0 then
    raise EStringListError.Create ('No items in the list');
  ListBoxForm := TListBoxForm.Create (self);
  try
    ListBoxForm.ListBox1.Items := FLines;
    ListBoxForm.ListBox1.ItemIndex := FSelected;
    ListBoxForm.Caption := FTitle;
    if ListBoxForm.ShowModal = mrOk then
    begin
      Result := True;
      Selected := ListBoxForm.ListBox1.ItemIndex;
    end
    else
      Result := False;
  finally
    ListBoxForm.Destroy;
  end;
end;

procedure TListBoxForm.ListBox1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Register;
begin
  RegisterComponents('Md3', [TMd3ListBoxDialog]);
end;

end.

