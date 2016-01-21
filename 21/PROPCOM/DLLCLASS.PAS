unit DllClass;

interface

uses
  ActiveX, ComObj;

const
  CLSID_TDllNumberProp: TGUID =
    '{A05FA280-8E59-11D0-98D0-444553540000}';

type
  INumberProp = interface
    ['{B36C5800-8E59-11D0-98D0-444553540000}']
    function GetValue: Integer; stdcall;
    procedure SetValue (New: Integer); stdcall;
    property Value: Integer
      read GetValue write SetValue;
    procedure Increase; stdcall;
  end;

type
  TDllNumber = class (TComObject, INumberProp)
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
    ComServer, TDllNumber, CLSID_TDllNumberProp,
    'Md3.PropCom', 'Md3 Prop COM Server',
    ciMultiInstance);
end.
