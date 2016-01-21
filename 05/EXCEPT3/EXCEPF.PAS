unit ExcepF;

interface

uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function ComputeBits (A, B: Integer): Integer;
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  MessageDlg ('Bitmap created', mtWarning, [mbOK], 0);
  try try
    {compute bits ...}
    Result := A div B;
    MessageDlg ('Code not reached (if the exception is raised)',
      mtWarning, [mbOK], 0);
  finally
    Bmp.Free;
    MessageDlg ('Bitmap destroyed', mtWarning, [mbOK], 0);
    end;
  except
    on E: EDivByZero do
      // re-raise the exception, changing its message
      raise EDivByZero.Create ('Error in ComputeBits');
  end;
  {this code is not reached because the exception
  has been raised again (re-raised)}
  MessageDlg ('Code not reached (if the exception is raised)',
    mtWarning, [mbOK], 0);
end;

function ComputeBits2 (A, B: Integer): Integer;
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  MessageDlg ('Bitmap created', mtWarning, [mbOK], 0);
  try
    {compute bits ...}
    Result := A div B;
    MessageDlg ('No exception raised', mtWarning, [mbOK], 0);
  finally
    Bmp.Free;
    MessageDlg ('Bitmap destroyed', mtWarning, [mbOK], 0);
  end;
  {this code is not reached because the exception
  has not been handled and is passed to the caller}
  MessageDlg ('Code not reached (if the exception is raised)',
    mtWarning, [mbOK], 0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ComputeBits (10, 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ComputeBits2 (10, 0);
end;

end.

