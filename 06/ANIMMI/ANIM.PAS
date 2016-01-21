unit anim;

interface

type
  ICanFly = interface
    ['{10000000-0000-0000-0000-000000000000}']
    function TakeOff: string;
    function Fly: string;
    function Land: string;
  end;

  IMammal = interface
    ['{20000000-0000-0000-0000-000000000000}']
    function Eat: string;
  end;

  TAirplane = class (TInterfacedObject, ICanFly)
    function TakeOff: string; virtual;
    function Fly: string; virtual;
    function Land: string; virtual;
    destructor Destroy; override;
  end;

  TMammal = class (TInterfacedObject, IMammal)
    function Eat: string; virtual; abstract;
    destructor Destroy; override;
  end;

  TCat = class (TMammal)
    function Eat: string; override;
  end;

  TBat = class (TMammal, ICanFly)
    function Eat: string; override;
    function TakeOff: string; virtual;
    function Fly: string; virtual;
    function Land: string; virtual;
  end;

implementation

uses
  Windows;

// airplane methods

function TAirplane.TakeOff: string;
begin
  Result := 'Fasten your seat belts. '#13#10+
    '  The plane is taking off.';
end;

function TAirplane.Fly: string;
begin
  Result := 'Flying plane in the sky.';
end;

function TAirplane.Land: string;
begin
  Result := 'Flaps out. Clear for landing.';
end;

destructor TAirplane.Destroy;
begin
  MessageBox (0, 'Airplane destroyed',
    'TAirplane.Destroy', mb_OK);
end;

// mammal methods

destructor TMammal.Destroy;
var
  S: String;
begin
  S := ClassName + ' object gone';
  MessageBox (0, PChar (S), 'TMammal.Destroy', mb_OK);
end;

// cat methods

function TCat.Eat: string;
begin
  Result := 'The cat is eating a (Microsoft) mouse.';
end;

// bat methods

function TBat.Eat: string;
begin
  Result := 'The bat eats ... (censored)';
end;

function TBat.TakeOff: string;
begin
  Result := 'Beware the bat!';
end;

function TBat.Fly: string;
begin
  Result := 'A "flap-flap" sound in the night.';
end;

function TBat.Land: string;
begin
  Result := 'The bat is hanging from a tree.';
end;

end.
