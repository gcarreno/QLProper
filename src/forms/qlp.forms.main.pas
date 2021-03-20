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
    actDataEdit: TAction;
    actDataSave: TAction;
    actDataCancel: TAction;
    actSubOptionsRemove: TAction;
    actSubOptionsAdd: TAction;
    actOptionsRemove: TAction;
    actOptionsAdd: TAction;
    btnDataEdit: TButton;
    btnDataSave: TButton;
    btnDataCancel: TButton;
    imMain: TImageList;
    IniPropStorage: TIniPropStorage;
    lbDataSets: TListBox;
    lbOptions: TListBox;
    lbSubOptions: TListBox;
    memData: TMemo;
    mnuOptionsAdd: TMenuItem;
    mnuOptionsRemove: TMenuItem;
    mnuSubOptionsAdd: TMenuItem;
    mnuSubOptionsRemove: TMenuItem;
    mnuDataCancel: TMenuItem;
    mnuData: TMenuItem;
    mnuDataEdit: TMenuItem;
    mnuDataSave: TMenuItem;
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
    panDataButtons: TPanel;
    panDataTitle: TPanel;
    panOptionsButtons: TPanel;
    panSubOptionsButtons: TPanel;
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
    sbtnSubOptionsAdd: TSpeedButton;
    sbtnOptionsRemove: TSpeedButton;
    sbtnFileAddDataset: TSpeedButton;
    sbtnFileRemoveDataset: TSpeedButton;
    sbtnOptionsAdd: TSpeedButton;
    sbtnSubOptionsRemove: TSpeedButton;
    procedure actDataCancelExecute(Sender: TObject);
    procedure actDataEditExecute(Sender: TObject);
    procedure actDataSaveExecute(Sender: TObject);
    procedure actFileAddDatasetExecute(Sender: TObject);
    procedure actFileRemoveDatasetExecute(Sender: TObject);
    procedure actOptionsAddExecute(Sender: TObject);
    procedure actOptionsRemoveExecute(Sender: TObject);
    procedure actSubOptionsAddExecute(Sender: TObject);
    procedure actSubOptionsRemoveExecute(Sender: TObject);
    procedure alMainUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lbDataSetsSelectionChange(Sender: TObject; User: boolean);
    procedure lbOptionsSelectionChange(Sender: TObject; User: boolean);
    procedure lbSubOptionsSelectionChange(Sender: TObject; User: boolean);
    procedure memDataChange(Sender: TObject);
  private
    FDataSets: array of TDataSet;
    FContentPresent: Boolean;
    FContentModified: Boolean;
    FHasDatasets: Boolean;
    FHasOptions: Boolean;
    FHasSubOptions: Boolean;
    FContentFilename: String;
    FEditing: Boolean;

    procedure SetPropStorage;
    procedure SetShortcuts;
    procedure CorrectPaiSplitterCursor;
    procedure LoadConfig;
    procedure SaveConfig;
    procedure PopulateDataSets;
    procedure PopulateOptions(const ADataSetPath: String);
    procedure LoadOptionsItem(const AMainMenuItem: String);
    procedure PopulateSubMenu(const ASubMenuItemsFile: String);
    procedure LoadSubOptionsItem(const AMainMenuItem, ASubMenuItem: String);
  public

  end;

var
  frmMain: TfrmMain;

implementation

uses
  LCLType
, IniFiles
, QLP.Utils.Helpers
, QLP.Forms.AddDataset
;

const
  cApplicationName = 'QLProper';
  cVersion = '0.4.0.10';
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
    FContentPresent:= False;
    FContentFilename:= '';
    FHasOptions:= False;
    FHasSubOptions:= False;
    lbOptions.Clear;
    lbSubOptions.Clear;
    memData.Clear;
    PopulateOptions(FDataSets[lbDataSets.ItemIndex].DataFolder);
  end;
end;

procedure TfrmMain.lbOptionsSelectionChange(Sender: TObject; User: boolean);
begin
  if lbOptions.ItemIndex <> -1 then
  begin
    FHasSubOptions:= False;
    LoadOptionsItem(lbOptions.Items[lbOptions.ItemIndex]);
  end;
end;

procedure TfrmMain.lbSubOptionsSelectionChange(Sender: TObject; User: boolean);
begin
  if lbSubOptions.ItemIndex <> -1 then
  begin
    LoadSubOptionsItem(lbOptions.Items[lbOptions.ItemIndex],
    lbSubOptions.Items[lbSubOptions.ItemIndex]);
  end;
end;

procedure TfrmMain.memDataChange(Sender: TObject);
begin
  if FEditing then
  begin
    FContentModified:= True;
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
  FHasDatasets:= lbDataSets.Count > 0;
end;

procedure TfrmMain.PopulateOptions(const ADataSetPath: String);
var
  mmFile: String;
begin
  mmFile:= GetDataSetFilesFilePath(ADataSetPath, cMain_Menu);
  if FileExists(mmFile) then
  begin
    lbOptions.Items.LoadFromFile(mmFile);
  end;
  FHasOptions:= lbOptions.Count > 0;
end;

procedure TfrmMain.LoadOptionsItem(const AMainMenuItem: String);
var
  mmItem: String;
begin
  FContentPresent:= False;
  memData.Clear;
  lbSubOptions.Clear;
  mmItem:= GetDataSetContentFilePath(FDataSets[lbDataSets.ItemIndex].DataFolder,
    AMainMenuItem);
  if FileExists(mmItem) then
  begin
    memData.Lines.LoadFromFile(mmItem);
    FContentPresent:= True;
    FContentFilename:= mmItem;
  end
  else
  begin
    mmItem:= GetDataSetDoubleXFilePath(FDataSets[lbDataSets.ItemIndex].DataFolder,
      AMainMenuItem);
    if FileExists(mmItem) then
    begin
      FHasSubOptions:= True;
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
  lbSubOptions.Items.LoadFromFile(ASubMenuItemsFile);
end;

procedure TfrmMain.LoadSubOptionsItem(const AMainMenuItem, ASubMenuItem: String);
var
  smItem: String;
begin
  FContentPresent:= False;
  memData.Clear;
  smItem:= GetDataSetContentSubFilePath(FDataSets[lbDataSets.ItemIndex].DataFolder,
    AMainMenuItem,
    ASubMenuItem);
  if FileExists(smItem) then
  begin
    memData.Lines.LoadFromFile(smItem);
    FContentPresent:= True;
    FContentFilename:= smItem;
  end
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption:= Format('%s v%s', [cApplicationName, cVersion]);
  FEditing:= False;
  FContentPresent:= False;
  FContentModified:= False;
  FHasDatasets:= False;
  FHasOptions:= False;
  FHasSubOptions:= False;
  FContentFilename:= '';
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

procedure TfrmMain.actDataEditExecute(Sender: TObject);
begin
  FEditing:= True;
  pssDataSetsOptions.Enabled:= False;
  pssMainMenuOptions.Enabled:= False;
  pssSubMenuOptions.Enabled:= False;
  memData.ReadOnly:= False;
  memData.SetFocus;
end;

procedure TfrmMain.actDataCancelExecute(Sender: TObject);
begin
  memData.Lines.LoadFromFile(FContentFilename);
  FEditing:= False;
  FContentModified:= False;
  pssDataSetsOptions.Enabled:= True;
  pssMainMenuOptions.Enabled:= True;
  pssSubMenuOptions.Enabled:= True;
  memData.ReadOnly:= True;
end;

procedure TfrmMain.actDataSaveExecute(Sender: TObject);
begin
  try
    memData.Lines.SaveToFile(FContentFilename);
  finally
    FEditing:= False;
    FContentModified:= False;
    pssDataSetsOptions.Enabled:= True;
    pssMainMenuOptions.Enabled:= True;
    pssSubMenuOptions.Enabled:= True;
    memData.ReadOnly:= True;
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

procedure TfrmMain.actOptionsAddExecute(Sender: TObject);
begin
  ShowMessage('Not Implemented yet');
end;

procedure TfrmMain.actOptionsRemoveExecute(Sender: TObject);
begin
  ShowMessage('Not Implemented yet');
end;

procedure TfrmMain.actSubOptionsAddExecute(Sender: TObject);
begin
  ShowMessage('Not Implemented yet');
end;

procedure TfrmMain.actSubOptionsRemoveExecute(Sender: TObject);
begin
  ShowMessage('Not Implemented yet');
end;

procedure TfrmMain.alMainUpdate(AAction: TBasicAction; var Handled: Boolean);
begin
  if AAction = actFileRemoveDataset then
  begin
    actFileRemoveDataset.Enabled:= lbDataSets.ItemIndex <> -1;
    Handled:= True;
    exit;
  end;
  if AAction = actDataEdit then
  begin
    actDataEdit.Enabled:= (not FEditing) and (FContentPresent);
    Handled:= True;
    exit;
  end;
  if AAction = actDataSave then
  begin
    actDataSave.Enabled:= FEditing and FContentModified;
    Handled:= True;
    exit;
  end;
  if AAction = actDataCancel then
  begin
    actDataCancel.Enabled:= FEditing;
    Handled:= True;
    exit;
  end;
  if AAction = actOptionsAdd then
  begin
    actOptionsAdd.Enabled:= lbDataSets.ItemIndex <> -1;
    Handled:= True;
    exit;
  end;
  if AAction = actOptionsRemove then
  begin
    actOptionsRemove.Enabled:= lbOptions.ItemIndex <> -1;
    Handled:= True;
    exit;
  end;
  if AAction = actSubOptionsAdd then
  begin
    actSubOptionsAdd.Enabled:= FHasSubOptions;
    Handled:= True;
    exit;
  end;
  if AAction = actSubOptionsRemove then
  begin
    actSubOptionsRemove.Enabled:= lbSubOptions.ItemIndex <> -1;
    Handled:= True;
    exit;
  end;
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

