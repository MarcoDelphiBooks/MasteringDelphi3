unit VInfoF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Memo1.Lines.Clear;
  Size := GetFileVersionInfoSize (
    PChar (ParamStr (0)), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
       GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
       // show the fixed information
       VerQueryValue (Pt, '\', Pt2, Size2);
       with TVSFixedFileInfo (Pt2^) do
       begin
         Memo1.Lines.Add (
           'Signature (should be invariably 0xFEEFO4BD): ' +
           IntToHex (dwSignature, 16));
         Memo1.Lines.Add ('Major version number: ' +
           IntToStr (HiWord (dwFileVersionMS)));
         Memo1.Lines.Add ('Minor version number: ' +
           IntToStr (LoWord (dwFileVersionMS)));
         Memo1.Lines.Add ('Release version number: ' +
           IntToStr (HiWord (dwFileVersionLS)));
         Memo1.Lines.Add ('Build version number: ' +
           IntToStr (LoWord (dwFileVersionLS)));
         if (dwFileFlagsMask and dwFileFlags
             and VS_FF_DEBUG) <> 0 then
           Memo1.Lines.Add ('Debug info included');
         if (dwFileFlagsMask and dwFileFlags and
             VS_FF_PRERELEASE) <> 0 then
           Memo1.Lines.Add ('Pre-release (beta) version');
         if (dwFileFlagsMask and dwFileFlags and
             VS_FF_PRIVATEBUILD) <> 0 then
           Memo1.Lines.Add ('Private Build');
         if (dwFileFlagsMask and dwFileFlags and
             VS_FF_SPECIALBUILD) <> 0 then
           Memo1.Lines.Add ('Special Build');
       end;

       // show some of the strings
       VerQueryValue(Pt,
         '\StringFileInfo\040904E4\FileDescription',
         Pt2, Size2);
       Memo1.Lines.Add ('File Description: ' +
         PChar (Pt2));
       VerQueryValue(Pt,
         '\StringFileInfo\040904E4\FileVersion',
         Pt2, Size2);
       Memo1.Lines.Add ('File Version: ' + PChar (pt2));
       VerQueryValue(Pt,
         '\StringFileInfo\040904E4\InternalName',
         Pt2, Size2);
       Memo1.Lines.Add ('Internal Name: ' + PChar (pt2));
       VerQueryValue(Pt,
         '\StringFileInfo\040904E4\LegalCopyright',
         Pt2, Size2);
       Memo1.Lines.Add ('Legal Copyright: ' + PChar (pt2));
       VerQueryValue(Pt,
         '\StringFileInfo\040904E4\ProductDescription',
         Pt2, Size2);
       Memo1.Lines.Add ('Product Name: ' + PChar (pt2));
       VerQueryValue(Pt,
         '\StringFileInfo\040904E4\ProductVersion',
         Pt2, Size2);
       Memo1.Lines.Add ('Product Version: ' + PChar (pt2));
    finally
      FreeMem (Pt);
    end;
  end;
end;

end.
