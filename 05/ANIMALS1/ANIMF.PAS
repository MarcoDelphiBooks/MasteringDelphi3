unit AnimF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Anim;

type
  TFormAnimals = class(TForm)
    LabelKind: TLabel;
    BtnKind: TButton;
    RbtnAnimal: TRadioButton;
    RbtnDog: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnKindClick(Sender: TObject);
    procedure RbtnAnimalClick(Sender: TObject);
    procedure RbtnDogClick(Sender: TObject);
  private
    MyAnimal, AnAnimal: TAnimal;
    ADog: TDog;
  public
    { Public declarations }
  end;

var
  FormAnimals: TFormAnimals;

implementation

{$R *.DFM}

procedure TFormAnimals.FormCreate(Sender: TObject);
begin
  AnAnimal := TAnimal.Create;
  ADog := TDog.Create;
  MyAnimal := AnAnimal;
end;

procedure TFormAnimals.FormDestroy(Sender: TObject);
begin
  AnAnimal.Free;
  ADog.Free;
end;

procedure TFormAnimals.BtnKindClick(Sender: TObject);
begin
  LabelKind.Caption := MyAnimal.GetKind;
end;

procedure TFormAnimals.RbtnAnimalClick(Sender: TObject);
begin
  MyAnimal := AnAnimal;
end;

procedure TFormAnimals.RbtnDogClick(Sender: TObject);
begin
  MyAnimal := ADog;
end;

end.

