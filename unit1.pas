unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, Menus, ActnList, StdActns, IniPropStorage,
  ComCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Astat: TAction;
    Atest: TAction;
    Asolve: TAction;
    Aexit: TAction;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    GroupBox1: TGroupBox;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PageControl1: TPageControl;
    Splitter1: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure AexitExecute(Sender: TObject);
    procedure AsolveExecute(Sender: TObject);
    procedure AtestExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{ TForm1 }


procedure TForm1.AexitExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.AsolveExecute(Sender: TObject);
var
  AProcess: TProcess;
  s: string;
  i, j: integer;
begin
  //form1.Height:=70;
  AProcess := TProcess.Create(nil);
  AProcess.Executable := 'c.sh';
  AProcess.Parameters.Add(edit1.Text);
  AProcess.Parameters.Add(edit2.Text);
  AProcess.Parameters.Add(edit3.Text);
  AProcess.Parameters.Add(edit4.Text);
  //AProcess.Parameters.Add('a');
  // Установим опции программы. Первая из них не позволит нашей программе
  // выполнятся до тех пор, пока не закончит выполнение запущенная программа
  // Также добавим опцию, которая говорит, что мы хотим прочитать
  // вывод запущенной программы
  AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];
  AProcess.Execute;
  memo1.Lines.LoadFromStream(AProcess.Output);
  AProcess.Free;
  {repeat
    if memo1.Lines.Count < 2 then
      break;
    s := memo1.Lines.Strings[1];
    s := copy(s, 1, 5);
    memo1.Lines.Delete(0);
  until s = '(%o3)';}

end;

procedure TForm1.AtestExecute(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex=0) and (IniPropStorage1.ReadString('admin','')=Edit5.Text) then
  begin
    PageControl1.ActivePage:=TabSheet1;
  end;
  if (ComboBox1.ItemIndex=1) and (IniPropStorage1.ReadString('student','')=Edit5.Text) then
  begin
    Astat.Enabled:=false;
    PageControl1.ActivePage:=TabSheet1;
  end;
  MenuItem1.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ShowTabs:=false;
end;

initialization
  {$I unit1.lrs}

end.
