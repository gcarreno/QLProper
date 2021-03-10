unit QLP.Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  StdActns, PairSplitter, StdCtrls, IniPropStorage, ExtCtrls;

type
{ TDataSet }
  TDataSet = record
    Name: String;
    Data: String;
  end;

{ TfrmMain }
  TfrmMain = class(TForm)
    IniPropStorage: TIniPropStorage;
    lbDataSets: TListBox;
    lbMainMenu: TListBox;
    lbSubMenu: TListBox;
    memData: TMemo;
    mmMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    alMain: TActionList;
    actFileExit: TFileExit;
    panSubMenuTitle: TPanel;
    psSubMenu: TPairSplitter;
    pssSubMenuOptions: TPairSplitterSide;
    pssSubMenuData: TPairSplitterSide;
    panDataSetsTitle: TPanel;
    panMainMenuTitle: TPanel;
    psMainMenu: TPairSplitter;
    pssMainMenuOptions: TPairSplitterSide;
    pssMainMenuData: TPairSplitterSide;
    psDataSets: TPairSplitter;
    pssDataSetsOptions: TPairSplitterSide;
    pssDataSetsData: TPairSplitterSide;
    procedure FormCreate(Sender: TObject);
    procedure lbDataSetsSelectionChange(Sender: TObject; User: boolean);
    procedure lbMainMenuSelectionChange(Sender: TObject; User: boolean);
    procedure lbSubMenuSelectionChange(Sender: TObject; User: boolean);
  private
    FDataSets: Array of TDataSet;

    procedure SetPropStorage;
    procedure SetShortcuts;
    procedure CorrectPaiSplitterCursor;
    procedure LoadConfig;
    procedure PopulateDataSets;
    procedure PopulateMainMenu(const ADataSetPath: String);
    procedure LoadMainMenuItem(const AMainMenuItem: String);
    procedure PopulateSubMenu(const ASubMenuItemsFile: String);
    procedure LoadSubMenuItem(const AMainMenuItem, ASubMenuItem: String);
  public

  end;

var
  frmMain: TfrmMain;

implementation

uses
  LCLType,
  //StrUtils,
  IniFiles,
  QLP.Utils.Helpers;

const
  cIniFilename = 'qlproper.ini';
  cIniSection = 'Application';
  cDataSetsData = 'Data';
  cMain_Menu = 'mm';

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.lbDataSetsSelectionChange(Sender: TObject; User: boolean);
begin
  if lbDataSets.ItemIndex <> -1 then
  begin
    lbMainMenu.Clear;
    lbSubMenu.Clear;
    memData.Clear;
    PopulateMainMenu(FDataSets[lbDataSets.ItemIndex].Data);
  end;
end;

procedure TfrmMain.lbMainMenuSelectionChange(Sender: TObject; User: boolean);
begin
  if lbMainMenu.ItemIndex <> -1 then
  begin
    LoadMainMenuItem(lbMainMenu.Items[lbMainMenu.ItemIndex]);
  end;
end;

procedure TfrmMain.lbSubMenuSelectionChange(Sender: TObject; User: boolean);
begin
  if lbSubMenu.ItemIndex <> -1 then
  begin
    LoadSubMenuItem(lbMainMenu.Items[lbMainMenu.ItemIndex],
    lbSubMenu.Items[lbSubMenu.ItemIndex]);
  end;
end;

procedure TfrmMain.SetPropStorage;
begin
  IniPropStorage.IniFileName:= GetAppConfigFile(False);
  IniPropStorage.IniSection:= cIniSection;
  IniPropStorage.Active:= True;
end;

procedure TfrmMain.SetShortcuts;
begin
{$IFDEF LINUX}
  actFileExit.ShortCut := KeyToShortCut(VK_Q, [ssCtrl]);
{$ENDIF}
{$IFDEF WINDOWS}
  actFileExit.ShortCut := KeyToShortCut(VK_X, [ssAlt]);
{$ENDIF}
end;

procedure TfrmMain.CorrectPaiSplitterCursor;
begin
  // Sometimes the Pair Splitter's Cursor gets fumbled in the IDE
  psDataSets.Cursor:= crHSplit;
  psMainMenu.Cursor:= crHSplit;
  psSubMenu.Cursor:=  crHSplit;
end;

procedure TfrmMain.LoadConfig;
var
  config: String;
  data: TIniFile;
  sections: TStringList;
  index: Integer;
begin
  config:= Application.Location + DirectorySeparator + cIniFilename;
  if FileExists(config) then
  begin
    data:= TIniFile.Create(config);
    sections:= TStringList.Create;
    try
      data.ReadSections(sections);
      SetLength(FDataSets, sections.Count);
      for index:= 0 to Pred(sections.Count) do
      begin
        FDataSets[index].Name:= sections[index];
        FDataSets[index].Data:= data.ReadString(sections[index], cDataSetsData, '');
      end;
    finally
      sections.Free;
      data.Free;
    end;
  end;
end;

procedure TfrmMain.PopulateDataSets;
var
  index: Integer;
begin
  for index:=0 to Pred(Length(FDataSets)) do
  begin
    lbDataSets.Items.Add(FDataSets[index].Name);
  end;
end;

procedure TfrmMain.PopulateMainMenu(const ADataSetPath: String);
var
  mmFile: String;
begin
  mmFile:= GetDataSetFilePath(ADataSetPath, cMain_Menu);
  if FileExists(mmFile) then
  begin
    lbMainMenu.Items.LoadFromFile(mmFile);
  end;
end;

procedure TfrmMain.LoadMainMenuItem(const AMainMenuItem: String);
var
  mmItem: String;
begin
  memData.Clear;
  lbSubMenu.Clear;
  mmItem:= GetDataSetContentFilePath(FDataSets[lbDataSets.ItemIndex].Data,
    AMainMenuItem);
  if FileExists(mmItem) then
  begin
    memData.Lines.LoadFromFile(mmItem);
  end
  else
  begin
    mmItem:= GetDataSetDoubleXFilePath(FDataSets[lbDataSets.ItemIndex].Data,
      AMainMenuItem);
    if FileExists(mmItem) then
    begin
      PopulateSubMenu(mmItem);
    end
    else
    begin
      memData.Clear;
      memData.Append('Cannot find any content on this item');
    end;
  end;
end;

procedure TfrmMain.PopulateSubMenu(const ASubMenuItemsFile: String);
begin
  lbSubMenu.Items.LoadFromFile(ASubMenuItemsFile);
end;

procedure TfrmMain.LoadSubMenuItem(const AMainMenuItem, ASubMenuItem: String);
var
  smItem: String;
begin
  memData.Clear;
  smItem:= GetDataSetContentSubFilePath(FDataSets[lbDataSets.ItemIndex].Data,
    AMainMenuItem,
    ASubMenuItem);
  if FileExists(smItem) then
  begin
    memData.Lines.LoadFromFile(smItem);
  end
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SetPropStorage;
  SetShortcuts;
  CorrectPaiSplitterCursor;
  LoadConfig;
  PopulateDataSets;
end;

end.

