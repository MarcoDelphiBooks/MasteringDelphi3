unit DllClass;

interface

uses
  Base;

type
  TDllNumberImpl = class (TDllNumber)
  private
    Value: Integer;
  public
    constructor Create;
    function GetValue: Integer; override;
    procedure SetValue (New: Integer); override;
    procedure Increase; override;
  end;

  function NewObject: TDllNumber; stdcall;

implementation

function NewObject: TDllNumber;
begin
  Result := TDllNumberImpl.Create;
end;

constructor TDllNumberImpl.Create;
begin
  Value := 0;
  inherited Create;
end;

function TDllNumberImpl.GetValue: Integer;
begin
  Result := Value;
end;

procedure TDllNumberImpl.SetValue (New: Integer);
begin
  Value := New;
end;

procedure TDllNumberImpl.Increase;
begin
  Inc (Value);
end;

end.
