unit TimeNowF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormTimeNow = class(TForm)
    ButtonElapsed: TButton;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonElapsedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTimeNow: TFormTimeNow;
  StartTime: TDateTime;

implementation

{$R *.DFM}

procedure TFormTimeNow.FormCreate(Sender: TObject);
begin
  // get the initial time
  StartTime := Now;
  // add three lines to the listbox
  ListBox1.Items.Add (TimeToStr (StartTime));
  ListBox1.Items.Add (DateToStr (StartTime));
  ListBox1.Items.Add ('Press button for elapsed time');
end;

procedure TFormTimeNow.ButtonElapsedClick(Sender: TObject);
var
  StopTime: TDateTime;
begin
  // get the current time
  StopTime := Now;
  // replace third line (the index is zero-based)
  ListBox1.Items [2] :=  FormatDateTime('hh:nn:ss',
    StopTime - StartTime);
end;

end.
