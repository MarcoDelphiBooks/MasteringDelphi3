unit Anim;

interface

type
  TAnimal = class
  public
    constructor Create;
    function GetKind: string;
    function Verse: string; virtual; abstract;
  private
    Kind: string;
  end;

  TDog = class (TAnimal)
  public
    constructor Create;
    function Verse: string; override;
    function Eat: string; virtual;
  end;

  TCat = class (TAnimal)
  public
    constructor Create;
    function Verse: string; override;
    function Eat: string; virtual;
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

constructor TDog.Create;
begin
  Kind := 'A dog';
end;

function TDog.Verse: string;
begin
  Verse := 'Arf Arf';
  PlaySound ('dog.wav', snd_Async, 0);
end;

function TDog.Eat: string;
begin
  Eat := 'A bone, please!';
end;

constructor TCat.Create;
begin
  Kind := 'A cat';
end;

function TCat.Verse: string;
begin
  Verse := 'Mieow';
  PlaySound ('cat.wav', snd_Async, 0);
end;

function TCat.Eat: string;
begin
  Eat := 'A mouse, please!';
end;

end.

