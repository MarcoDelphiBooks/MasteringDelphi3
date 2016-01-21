unit TreeForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Root1: TMenuItem;
    Buttons1: TMenuItem;
    Lines1: TMenuItem;
    N1: TMenuItem;
    Font1: TMenuItem;
    FontDialog1: TFontDialog;
    procedure FormCreate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Root1Click(Sender: TObject);
    procedure Buttons1Click(Sender: TObject);
    procedure Lines1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  Node, Node1, Node2: TTreeNode;
  Memo: TMemo;
  I: Integer;
begin
  // initialize node variables (just in case)
  Node := nil;
  Node1 := nil;
  Node2 := nil;
  // create a temporary memo control
  Memo := TMemo.Create (self);
  try // finally: memo should be destroyed
    Memo.Parent := self;
    Memo.Width := 1000;
    try // except file not found
      Memo.Lines.LoadFromFile ('toc.txt');
    except
      on E: EFOpenError do
      begin
        MessageDlg ('File "TOC.TXT" not found'#13 +
          'The ChaptTree will be terminated',
          mtError, [mbOK], 0);
        // terminate the program
        Halt;
      end; // on E: EFOpenError do
    end; // except
    for I := 0 to Memo.Lines.Count - 1 do
    begin
      if Memo.Lines[I][1] <> #9 then
        Node := TreeView1.Items.Add (nil, Trim(Memo.Lines[I]))
      else if Memo.Lines[I][2] <> #9 then
        Node1 := TreeView1.Items.AddChild (Node, Trim (Memo.Lines[I]))
      else if Memo.Lines[I][3] <> #9 then
        Node2 := TreeView1.Items.AddChild (Node1, Trim (Memo.Lines[I]))
      else if Memo.Lines[I][4] <> #9 then
        TreeView1.Items.AddChild (Node2, Trim (Memo.Lines[I]));
    end; // for
  finally
    Memo.Free;
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg ('TreeView Example'#13'by Marco Cantù',
    mtInformation, [mbOk], 0);
end;

procedure TForm1.Root1Click(Sender: TObject);
begin
  TreeView1.ShowRoot := not TreeView1.ShowRoot;
  Root1.Checked := TreeView1.ShowRoot;
end;

procedure TForm1.Buttons1Click(Sender: TObject);
begin
  TreeView1.ShowButtons := not TreeView1.ShowButtons;
  Buttons1.Checked := TreeView1.ShowButtons;
end;

procedure TForm1.Lines1Click(Sender: TObject);
begin
  TreeView1.ShowLines := not TreeView1.ShowLines;
  Lines1.Checked := TreeView1.ShowLines;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    TreeView1.Font := FontDialog1.Font;
end;

end.
