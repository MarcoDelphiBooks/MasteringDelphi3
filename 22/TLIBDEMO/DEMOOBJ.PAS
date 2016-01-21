unit DemoObj;

interface

uses
  ComObj, Project1Lib;

type
  TFirstServer = class(TAutoObject, IFirstServer)
  protected
    function Get_Value: Integer; safecall;
    procedure ChangeColor; safecall;
    procedure Set_Value(Value: Integer); safecall;
  end;

implementation

uses ComServ, MainForm;

function TFirstServer.Get_Value: Integer;
begin
  Result := Form1.Value;
end;

procedure TFirstServer.ChangeColor;
begin
  Form1.ChangeColor;
end;

procedure TFirstServer.Set_Value(Value: Integer);
begin
  Form1.Value := Value;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TFirstServer, Class_FirstServer, ciMultiInstance);
end.
