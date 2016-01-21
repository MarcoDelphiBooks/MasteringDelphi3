unit Base;

interface

type
  TDllNumber = class
  public
    function GetValue: Integer; virtual; abstract;
    procedure SetValue (New: Integer); virtual; abstract;
    procedure Increase; virtual; abstract;
  end;

implementation

end.
