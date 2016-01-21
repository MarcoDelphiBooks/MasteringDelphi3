unit PropEdit;

interface

uses
  DsgnIntf;

type
  TMd3IntListProperty = class (TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  SysUtils, IlpeForm, TabList2, Forms, Controls;

function TMd3IntListProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

procedure TMd3IntListProperty.Edit;
var
  PEForm: TIntListPEForm;
  Tabs: TMd3TabbedList;
  I: Integer;
begin
  PEForm := TIntListPEForm.Create (Application);
  try
    Tabs := GetComponent (0) as TMd3TabbedList;
    for I := Low (TTabsArray) to High (TTabsArray) do
      PEForm.Memo1.Lines.Add (IntToStr (Tabs.TabStops [I]));
    if PEForm.ShowModal = mrOK then
    begin
      for I := Low (TTabsArray) to High (TTabsArray) do
        Tabs.TabStops [I] := StrToIntDef (PEForm.Memo1.Lines [I], 0);
      Designer.Modified;  
    end;
  finally
    PEForm.Free;
  end;
end;

procedure Register;
begin
  RegisterPropertyEditor (TypeInfo (string),
    TMd3TabbedList, 'TabsString', TMd3IntListProperty);
end;

end.

