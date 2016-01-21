unit AnimF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Anim;

type
  TFormAnimals = class(TForm)
    LabelVerse: TLabel;
    BtnVerse: TButton;
    RbtnAnimal: TRadioButton;
    RbtnDog: TRadioButton;
    RbtnCat: TRadioButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnVerseClick(Sender: TObject);
    procedure RbtnAnimalClick(Sender: TObject);
    procedure RbtnDogClick(Sender: TObject);
    procedure RbtnCatClick(Sender: TObject);
  private
    MyAnimal: TAnimal;
  public
    { Public declarations }
  end;

var
  FormAnimals: TFormAnimals;

implementation

{$R *.DFM}

procedure TFormAnimals.FormCreate(Sender: TObject);
begin
  MyAnimal := TDog.Create;
end;

procedure TFormAnimals.FormDestroy(Sender: TObject);
begin
  MyAnimal.Free;
end;

procedure TFormAnimals.BtnVerseClick(Sender: TObject);
begin
  LabelVerse.Caption := MyAnimal.Verse;
end;

procedure TFormAnimals.RbtnAnimalClick(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TAnimal.Create;
end;

procedure TFormAnimals.RbtnDogClick(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TDog.Create;
end;

procedure TFormAnimals.RbtnCatClick(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TCat.Create;
end;

end.

