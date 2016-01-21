unit DllClass;

interface

uses
  ActiveX, ComObj;

const
  CLSID_TDllNumber: TGUID =
     '{95D47840-7C4D-11D0-98D0-444553540000}';

type
  INumber = interface
    ['{B4131140-7C2F-11D0-98D0-444553540000}']
    function GetValue: Integer; stdcall;
    procedure SetValue (New: Integer); stdcall;
    procedure Increase; stdcall;
  end;

type
  TDllNumber = class (TComObject, INumber)
  private
    Value: Integer;
  public
    function GetValue: Integer; virtual; stdcall;
    procedure SetValue (New: Integer); virtual; stdcall;
    procedure Increase; virtual; stdcall;
    procedure Initialize; override;
    destructor Destroy; override;
  end;

implementation

uses
  Windows, ComServ;

procedure TDllNumber.Initialize;
begin
  inherited;
  Value := 10;
end;

destructor TDllNumber.Destroy;
begin
  inherited;
  MessageBox (0, 'Object Destroyed',
    'TDLLNumber', mb_OK);  // API call
end;

function TDllNumber.GetValue: Integer;
begin
  Result := Value;
end;

procedure TDllNumber.SetValue (New: Integer);
begin
  Value := New;
end;

procedure TDllNumber.Increase;
begin
  Inc (Value);
end;

initialization
  TComObjectFactory.Create(
    ComServer, TDllNumber, CLSID_TDllNumber,
    'Md3.FirstCom', 'Md3 First COM Server',
    ciMultiInstance);
end.
