unit QLP.Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  StdActns, PairSplitter, StdCtrls, IniPropStorage, ExtCtrls, Buttons;

type
{ TDataSet }
  TDataSet = record
    Name: String;
    DataFolder: String;
  end;

{ TfrmMain }
  TfrmMain = class(TForm)
    actFileAddDataset: TAction;
    actFileRemoveDataset: TAction;
    imMain: TImageList;
    IniPropStorage: TIniPropStorage;
    lbDataSets: TListBox;
    lbMainMenu: TListBox;
    lbSubMenu: TListBox;
    memData: TMemo;
    mnuFileRemoveDataset: TMenuItem;
    mnuOptions: TMenuItem;
    mnuSubOptions: TMenuItem;
    mnuFileAddDataset: TMenuItem;
    mnuFileSep1: TMenuItem;
    mmMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    alMain: TActionList;
    actFileExit: TFileExit;
    panDatasetButtons: TPanel;
    panSubOptionsTitle: TPanel;
    psSubMenu: TPairSplitter;
    pssSubMenuOptions: TPairSplitterSide;
    pssSubMenuData: TPairSplitterSide;
    panDataSetsTitle: TPanel;
    panOptionsTitle: TPanel;
    psMainMenu: TPairSplitter;
    pssMainMenuOptions: TPairSplitterSide;
    pssMainMenuData: TPairSplitterSide;
    psDataSets: TPairSplitter;
    pssDataSetsOptions: TPairSplitterSide;
    pssDataSetsData: TPairSplitterSide;
    sbtnFileAddDataset: TSpeedButton;
    sbFileRemoveDataset: TSpeedButton;
    procedure actFileAddDatasetExecute(Sender: TObject);
    procedure actFileRemoveDatasetExecute(Sender: TObject);
    procedure alMainUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lbDataSetsSelectionChange(Sender: TObject; User: boolean);
    procedure lbMainMenuSelectionChange(Sender: TObject; User: boolean);
    procedure lbSubMenuSelectionChange(Sender: TObject; User: boolean);
  private
    FDataSets: array of TDataSet;

    procedure SetPropStorage;
    procedure SetShortcuts;
    procedure CorrectPaiSplitterCursor;
    procedure LoadConfig;
    procedure SaveConfig;
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
  LCLType
//, StrUtils
, IniFiles
, QLP.Utils.Helpers
, QLP.Forms.AddDataset
;

const
  cIniFilename = 'qlproper.ini';
  cIniSection = 'Application';
  cDataSetsDataFolder = 'DataFolder';
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
    PopulateMainMenu(FDataSets[lbDataSets.ItemIndex].DataFolder);
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
        FDataSets[index].DataFolder:= data.ReadString(sections[index], cDataSetsDataFolder, '');
      end;
    finally
      sections.Free;
      data.Free;
    end;
  end;
end;

procedure TfrmMain.SaveConfig;
var
  config: String;
  data: TIniFile;
  index: Integer;
begin
  config:= Application.Location + DirectorySeparator + cIniFilename;
  if FileExists(config) then
  begin
    RenameFile(config, ChangeFileExt(config, '.bak'));
  end;
  data:= TIniFile.Create(config);
  try
    for index:= 0 to Pred(Length(FDataSets)) do
    begin
      data.WriteString(FDataSets[index].Name, cDataSetsDataFolder,FDataSets[index].DataFolder);
    end;
  finally
    data.Free;
  end;
end;

procedure TfrmMain.PopulateDataSets;
var
  index: Integer;
begin
  if lbDataSets.Count > 0 then
  begin
    lbDataSets.Clear;
  end;
  for index:=0 to Pred(Length(FDataSets)) do
  begin
    lbDataSets.Items.Add(FDataSets[index].Name);
  end;
end;

procedure TfrmMain.PopulateMainMenu(const ADataSetPath: String);
var
  mmFile: String;
begin
  mmFile:= GetDataSetFilesFilePath(ADataSetPath, cMain_Menu);
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
  mmItem:= GetDataSetContentFilePath(FDataSets[lbDataSets.ItemIndex].DataFolder,
    AMainMenuItem);
  if FileExists(mmItem) then
  begin
    memData.Lines.LoadFromFile(mmItem);
  end
  else
  begin
    mmItem:= GetDataSetDoubleXFilePath(FDataSets[lbDataSets.ItemIndex].DataFolder,
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
  smItem:= GetDataSetContentSubFilePath(FDataSets[lbDataSets.ItemIndex].DataFolder,
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

procedure TfrmMain.actFileAddDatasetExecute(Sender: TObject);
var
  mResult: Integer;
  len: Integer;
  fHandle: Integer;
  filename: String;
begin
  frmAddDataset:= TfrmAddDataset.Create(Self);
  try
    mResult:= frmAddDataset.ShowModal;
    if (mResult = mrOK) and
       (frmAddDataset.DatasetName <> '') and
       (frmAddDataset.DatasetPath <> '') then
    begin
      len:= Length(FDataSets);
      SetLength(FDataSets, len + 1);
      FDataSets[len].Name:= frmAddDataset.DatasetName;
      FDataSets[len].DataFolder:= frmAddDataset.DatasetPath;

      filename:= GetDataSetFilesPath(FDataSets[len].DataFolder);
      if not DirectoryExists(filename) then
      begin
        ForceDirectories(filename);
      end;

      filename:= GetDataSetFilesFilePath(FDataSets[len].DataFolder, cMain_Menu);
      if not FileExists(filename) then
      begin
        fHandle:= FileCreate(filename);
        FileClose(fHandle);
      end;

      filename:= GetDataSetDoubleXPath(FDataSets[len].DataFolder);
      if not DirectoryExists(filename) then
      begin
        ForceDirectories(filename);
      end;

      filename:= GetDataSetContentPath(FDataSets[len].DataFolder);
      if not DirectoryExists(filename) then
      begin
        ForceDirectories(filename);
      end;

      PopulateDataSets;
    end;
  finally
    frmAddDataset.Free;
  end;
end;

procedure TfrmMain.actFileRemoveDatasetExecute(Sender: TObject);
var
  mResult: Integer;
  index: Integer;
begin
  if lbDataSets.ItemIndex > -1 then
  begin
    mResult := MessageDlg('Are you sure?',
      'Do you really want to delete '+FDataSets[lbDataSets.ItemIndex].Name,
      mtConfirmation,
      mbYesNo, 0);
    if mResult = mrYes then
    begin
       for index:= 0 to Pred(Length(FDataSets)) do
       begin
         if index > lbDataSets.ItemIndex then
         begin
           FDataSets[lbDataSets.ItemIndex].Name:= FDataSets[index].Name;
           FDataSets[lbDataSets.ItemIndex].DataFolder:= FDataSets[index].DataFolder;
         end;
       end;
       SetLength(FDataSets, Pred(Length(FDataSets)));
      PopulateDataSets;
    end;
  end;
end;

procedure TfrmMain.alMainUpdate(AAction: TBasicAction; var Handled: Boolean);
begin
  actFileRemoveDataset.Enabled:= lbDataSets.ItemIndex <> -1;
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SaveConfig;
  CloseAction:= caFree;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= True;
end;

end.

