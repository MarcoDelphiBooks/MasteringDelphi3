unit Anim;

interface

type
  TAnimal = class
  public
    constructor Create;
    function GetKind: string;
    function Verse: string; virtual;
  private
    Kind: string;
  end;

  TDog = class (TAnimal)
  public
    constructor Create;
    function Verse: string; override;
  end;

implementation

uses
  MMSystem;

constructor TAnimal.Create;
begin
  Kind := 'An animal';
end;

function TAnimal.GetKind: string;
begin
  GetKind := Kind;
end;

function TAnimal.Verse: string;
begin
  Verse := 'Verse of the animal';
  PlaySound ('Anim.wav', snd_Async, 0);
end;

constructor TDog.Create;
begin
  Kind := 'A dog';
end;

function TDog.Verse: string;
begin
  Verse := 'Arf Arf';
  PlaySound ('dog.wav', snd_Async, 0);
end;

end.

