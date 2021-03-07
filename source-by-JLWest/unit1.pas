unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Buttons,  clipbrd,  Classes,   Controls,
  Dialogs,  ExtCtrls, FileUtil,  Forms,
  Graphics, SysUtils, StrUtils,  StdCtrls, Menus,
  Types,    Grids,    LCLType,   LazFileUtils;

type

  { TForm1 }

  TMMenu  = (PAGES, SUB, MEMO, Splash, MNIL);
  TMMODES = (Short, Normal, Audit, ANIL);

  TMenu     = Array of String;
  TLocks    = Array [0..32] of Boolean;

  TForm1 = class(TForm)
    btnSaveHelp: TBitBtn;
    btnExecute     : TBitBtn;
    btnNewSI       : TBitBtn;
    btnXItems      : TBitBtn;
    btnNewDS       : TBitBtn;
    btnNewSub      : TBitBtn;
    btnAddItems    : TBitBtn;
    btnXDS         : TBitBtn;
    btnToCVS       : TBitBtn;
    btnShowAllTags : TBitBtn;
    btnIndex       : TBitBtn;
    btnCancel      : TBitBtn;
    btnHelp        : TBitBtn;
    btnSet         : TBitBtn;
    btnDataSet     : TBitBtn;
    btnDelete      : TBitBtn;
    btnFile        : TBitBtn;
    btnRename      : TBitBtn;
    btnNewMainTag  : TBitBtn;
    btnAudit       : TBitBtn;
    btnCredits     : TBitBtn;
    btnDumpLBX     : TBitBtn;
    btnDumpListbox1: TBitBtn;
    btnDumpLBWork  : TBitBtn;
    btnDumpLBSUB   : TBitBtn;
    btnSidebar     : TBitBtn;
    btnOf          : TBitBtn;
    BtnSubNext     : TBitBtn;
    BtnSubPrev     : TBitBtn;
    btnNext        : TBitBtn;
    BtnPrev        : TBitBtn;
    btnCopyRight   : TBitBtn;
    btnSub         : TBitBtn;
    btnPages       : TBitBtn;
    btnClose       : TBitBtn;
    btnShowMM      : TButton;
    btnEdit        : TButton;

    Edit1          : TEdit;

    I0             : TStaticText;
    I1             : TStaticText;
    I2             : TStaticText;
    I3             : TStaticText;
    I4             : TStaticText;
    I5             : TStaticText;
    I6             : TStaticText;
    I7             : TStaticText;
    I8             : TStaticText;
    I9             : TStaticText;
    I10            : TStaticText;
    I11            : TStaticText;
    I12            : TStaticText;
    I13            : TStaticText;
    I14            : TStaticText;
    I15            : TStaticText;
    I16            : TStaticText;
    I17            : TStaticText;
    I18            : TStaticText;
    I19            : TStaticText;
    I20            : TStaticText;

    L0             : TLabel;
    L1             : TLabel;
    L2             : TLabel;
    L3             : TLabel;
    L4             : TLabel;
    L5             : TLabel;
    L6             : TLabel;
    L7             : TLabel;
    L8             : TLabel;
    L9             : TLabel;
    L10            : TLabel;
    L11            : TLabel;
    L12            : TLabel;
    L13            : TLabel;
    L14            : TLabel;
    L15            : TLabel;
    L16            : TLabel;
    L17           : TLabel;
    L18           : TLabel;
    L19           : TLabel;
    L20           : TLabel;
    Label1        : TLabel;
    lblDir: TLabel;
    lblATag: TLabel;
    LBLMemoName   : TLabel;
    LBXBox        : TLabel;
    LBSubBox      : TLabel;
    LBWK          : TLabel;
    LBListbox1    : TLabel;

    LBxx1         : TLabel;
    LBLTotalPages : TLabel;
    LBLPage       : TLabel;
    GridHeading: TStaticText;
    M2: TMemo;
    STAudit       : TLabel;
    LBlRoadSign   : TLabel;

    MX            : TMemo;
    M1            : TMemo;

    ListBox1      : TListBox;
    ListBox2      : TListBox;
    LBWork        : TListBox;
    LBSub         : TListBox;
    LBX           : TListBox;
    ListBox3      : TListBox;
    ListBox4      : TListBox;
    ListBox5      : TListBox;
    Image1        :TImage;
    Grid1: TStringGrid;

     procedure FormCreate(Sender: TObject);
     procedure btnCloseClick(Sender: TObject);
     procedure MManager( Const APAGE : Integer );
     procedure MemoManager( AFILENAME : String);
     procedure TheRouter( AItem : String; ADEST : String);

    {UTILITIES}
     procedure AddItems;
     procedure Audit;
     procedure New;
//     procedure BuildNew;
     procedure Credits;
     procedure Deletes;
     procedure Execute;
     procedure FileContent(ACONTENT : String);
     procedure GridIndex;
     procedure Indexes;
     procedure NewDS;
     procedure NewSub;
     procedure Rename;
     procedure RenameATag(ANEWTAG : String);
     procedure RenameMemo(ADir, AOLD, ANEW : String);
     procedure Set4Boxes(AMODE : Integer);
     procedure SplitFilebyChar(ABOX1,ABOX2, ABOX3 : TListbox);
     procedure ToTop( ABOX : TListbox );
     procedure TwoColCVS;
     procedure ThreeColCVS;
     procedure UpdateControlBoxes( AMEMO : String);
     procedure UpdateControlBoxes( Const APAGE : Integer );

     procedure VerifyInstallPath;
     procedure ValidationMessages(ACODE : Integer; S : String; AMODE : Integer);
     procedure VerifyMMTags;
     procedure XDS;

     function ExtractDirector(APATH : String) : String;
     function GetADoublexPath(AITEM : String; Out S : RawByteString) : String;
     function GetDir(APATH : String) : String;
     function GetAPath(THETAG,THEDIR : String;
  	  	               out X : RawByteString;
                               out Y : String) : String;
     function QDialogA(THEMSG : String) : Integer;
     function SetupNewMemo(ANAME : String): String;
     function SetUpNewMemo2(THETAG : String) : String;
     function UpdateMMFile(AMODE : Integer; AItem : String; BItem: String) : Boolean;

     function VerifyTAG : Integer;
     function VerifyDoubleXDirectory(APATH : RawByteString) : Boolean;
     function VerifyDoubleXFiles(ADIR : String; APATH : RawByteString) : Boolean;
     function ValidateMainDelete : Boolean;
     function ValidateFourDigetPin(DSPIN : String) : String;
     function Fill(AString : String) : String;

    {Clicks}
     procedure ListBox1Click(Sender: TObject);
     procedure LBSubClick(Sender: TObject);
     procedure btnXItemsClick(Sender: TObject);
     procedure ListBox2DblClick(Sender: TObject);

    {Searches}
     Procedure RecursiveSearch( ADIR : String; AMask : String; AFLAG : Boolean; ABOX : TListbox);
     Procedure LookUpUseClause;
     function SearchLBWork(ADATASET : String) : Integer;
     function SearchLBWorkForDuplicates(ATAG : String; out X : Integer) : Boolean;
     function SearchLBWorkForSubTag(THETAG : String) : Boolean;
     function CheckForDuplicateTag(ATAG : String) : Boolean;
     function SearchForUseClause : String;
     function SearchAllTAGS( ATAGDir : String; out S : String) : Boolean;

    {UI Displays}
     procedure DisplayItem( ACB : Integer; ALabel : String );
     procedure DisplayMainMenu( AFirst,ALast : Integer );
     procedure DisplaySUBMenu( AFIRST, ALAST : Integer );
     procedure FormPaint(Sender: TObject);
     Procedure GenericShowArray( THEARRAY : Array of String; ABox : TLISTBox);
     procedure HideCB( ALABEL : TLabel);
     procedure InstallButton( ABUTTON : TMMenu );
     procedure ManageTheRedX(AITEM : String; ALABEL : TStaticText);
     procedure NewSI;
     procedure PostPageLabels( APage : Integer; APages : Integer );
     procedure PostPageLabel( APage : Integer );
     procedure PrepSplash(AMODE : Integer);
     procedure ReDisplay;
     procedure SubManager( APAGE : Integer);
     procedure SubManagerOne( APAGE : Integer; APATH : String );
     procedure SubManageTwo( APAGE : Integer);
     procedure UpDateUI( ALABEL : TStaticText; All : Boolean);
     procedure UIMGR(AMODE : String);

     {Array Loads}
     procedure LoadSubMenuArray;
     procedure GenericArrayLoad(out theArray: TStringArray; aBox: TListBox; aSort: Boolean);

     {File Loads}
     procedure DirListToListbox( Const APATH  : String; ABOX : TListbox);
     procedure FileToListbox( const AFileName: String; ABOX : TListBox );
     procedure FToListbox(AFQP : String; ABOX : TListbox );
     procedure LoadFilesAndArrays;
     procedure LoadTheSubDir ( Const AFILENAME : String; ABOX : Tlistbox );
//     procedure LoadTheMemo( Const APATH : String; ABOX : TListBox );
     procedure LoadTMemo(AFile : String);
     procedure LoadItems;

    {File Save}
     procedure ListBoxToFile(AFile : String; ABOX : TListbox);
     procedure LBoxToFile(AFILENAME : String; ABOX : TListbox);
     procedure FileFormater(AFile : String);

    {Buttons}
     procedure btnAddItemsClick(Sender: TObject);
     procedure btnAuditClick(Sender: TObject);
     procedure btnCancelClick(Sender: TObject);
     procedure btnCopyRightClick(Sender: TObject);
     procedure btnCreditsClick(Sender: TObject);
     procedure btnDumpListbox1Click(Sender: TObject);
     procedure btnDumpLBWorkClick(Sender: TObject);
     procedure btnDubpLb2Click(Sender: TObject);
     procedure btnDumpLBXClick(Sender: TObject);
     procedure btnDumpLBSUBClick(Sender: TObject);
     procedure btnDataSetClick(Sender: TObject);
     procedure btnDeleteClick(Sender: TObject);
     procedure btnEditClick(Sender: TObject);
     procedure btnExecuteClick(Sender: TObject);
     procedure btnFileClick(Sender: TObject);
     procedure btnHelpClick(Sender: TObject);
     procedure btnIndexClick(Sender: TObject);
     procedure btnMemoClick(Sender: TObject);
     procedure btnNewDSClick(Sender: TObject);
     procedure btnNewSubClick(Sender: TObject);
     procedure btnNewClick(Sender: TObject);
     procedure btnNewSIClick(Sender: TObject);
     procedure btnNextClick(Sender: TObject);
     procedure btnPagesClick(Sender: TObject);
     procedure BtnPrevClick(Sender: TObject);
     procedure btnRenameClick(Sender: TObject);
     procedure btnSaveHelpClick(Sender: TObject);
     procedure btnSidebarClick(Sender: TObject);
     procedure btnSetClick(Sender: TObject);
     procedure btnShowMMClick(Sender: TObject);
     procedure btnShowAllTagsClick(Sender: TObject);
     procedure btnSubClick(Sender: TObject);
     procedure btnSubNextClick(Sender: TObject);
     procedure BtnSubPrevClick(Sender: TObject);
     procedure btnToCVSClick(Sender: TObject);
     procedure btnXDSClick(Sender: TObject);

    {EDITS}
     procedure L0Click(Sender: TObject);
     procedure L1Click(Sender: TObject);
     procedure L20Click(Sender: TObject);
     procedure L2Click(Sender: TObject);
     procedure L3Click(Sender: TObject);
     procedure L4Click(Sender: TObject);
     procedure L5Click(Sender: TObject);
     procedure L6Click(Sender: TObject);
     procedure L7Click(Sender: TObject);
     procedure L8Click(Sender: TObject);
     procedure L9Click(Sender: TObject);
     procedure L10Click(Sender: TObject);
     procedure L11Click(Sender: TObject);
     procedure L12Click(Sender: TObject);
     procedure L13Click(Sender: TObject);
     procedure L14Click(Sender: TObject);
     procedure L15Click(Sender: TObject);
     procedure L16Click(Sender: TObject);
     procedure L17Click(Sender: TObject);
     procedure L18Click(Sender: TObject);
     procedure L19Click(Sender: TObject);

  private

  public

  end;

Const
  CNil   = 'Nil';
  Lines  = 21;
  Spacer = '                                               ';
  Ext    = '.txt';

{ AAA  Var}
var
  Form1           : TForm1;
  LOC             : String;
  DX              : String;
 {Static Switches}
  DEBUG           : Boolean = True; {Debug Switch}
  DUMP            : Boolean = True; {Dump Switch}
  TestSW          : Boolean = False;

  GBUTTON         : TMMenu = MNIL; {Active Button         }
  CLEARSTATUS     : String;
  DS              : String;
  GPIN            : String;        {Pin of current Seet DataSet}

  {Selection Paramentres}
  OLDNAME         : String = 'Nil';
  TMPPin          : String = 'Nil';{Temp Pin for New DataSet   }

  {Dynamic arrays}
  MM              : TMenu;         {MM array MM.txt       }
  ALLTAGS         : TMenu;         {All the System Tags   }

 {LOCKS}
  LOCKMODE        : String;
  LOCKS           : TLocks;

 {PGM Switches}
  THESPLASH       : Boolean;        {Splash status                          }
  CONTENT         : Boolean = False;{Uses as a switch in the Sidebar display}

 {MEMOS}
  GMEMOPAGE       : String = '*Mn'; {Current Memo Displayed *M1..n          }
  GMEMOS          : Integer = -1;   {Total memo pages current displayed memo}
  GMEMO           : String = 'Nil'; {Path to Memo Displayed                 }

  {SubMenu}
  GSUBDIR         : String = CNIL;  {Dir Name of Sub-dir in Content         }
  GSPAGE          : Integer = -1;   {Global Sub Page                        }
  GSPAGES         : Integer = -1;   {Global nbr pages in sub                }
  GSITEMS         : Integer = -1;   {Actuaol nbr of *.Txt files in subdir   }
  GSPATH          : String = CNIL;  {Curremt Sub Path                       }
  SUBMENU         : TMenu;          {Sub Menu                               }

 {MM  }
  GMMPage         : Integer = -1;   {MM Current Page   }
  GMMPages        : Integer = -1;   {MM Total Pages    }
  GMMLPC          : Integer = -1;   {MM Last page count}
  GMMTotLines     : Integer = -1;   {Total lines in MM }

  {Fixed Paths}
  XPath           : String;
  INSTALLPATH     : String;
  DATASETPATH     : String;
  HELPPATH        : String;
  CONTENTPATH     : String;
  DOUBLEXPATH     : String;
  DUMPSPATH       : String;
  MMTXTPath       : String;
  FILESPATH       : String;
  CONFIG          : String;
  ALLTAGFILE      : String;

implementation

{$R *.lfm}

Uses Unit2;

{ TForm1 }

{Retests:} {**Data Set,  **Sidebar, **Credits,  }
{**EDIT, **ALLTAGS, **SET, **NEW DS, **X DS }
{**Audit,  **SAVE  **INDEX,  **MM }
{**New }


{ **ToCVS    **New SUB **New SI,       }
{ **Delete Main, Delete SI, Delete Sub }
{**RENAME MAIN Tag, **Rename SUB-Item Tag,  **Rename Sub }


{Add Items, X Items,                              }
{ Copyright,  **Delete Sub Tag,  Delete Sub,   }

{**Cancel, **Execute}

{ AAA REQUESTINPUT }
 function RequestInput(Top, Left, Width: Integer; Caption, Prompt: string): string;
  var
   aForm:  TForm;
   aLabel: TLabel;
   Edit:   TEdit;
   Cancel: TBitBtn;
   Ok:     TBitBtn;
  begin
   aForm                      := TForm.Create(nil);
   aForm.Top                  := Top;
   aForm.Left                 := Left;
   aForm.Width                := Width;
   aForm.Height               := 110;
   aForm.Constraints.MinWidth := 200;
   aForm.Caption              := Caption;
   aLabel                     := TLabel.Create(aForm);
   aLabel.Parent              := aForm;
   aLabel.Top                 := 10;
   aLabel.Left                := 20;
   aLabel.Caption             := Prompt;
   aLabel.AutoSize            := True;
   Edit                       := TEdit.Create(aForm);
   Edit.Parent                := aForm;
   Edit.Top                   := 30;
   Edit.Left                  := 20;
   Edit.Width                 := Width - 40;
   Cancel                     := TBitBtn.Create(aForm);
   Cancel.Parent              := aForm;
   Cancel.Top                 := 65;
   Cancel.Left                := Width - 180;
   Cancel.Kind                := bkCancel;
   ok                         := TBitBtn.Create(aForm);
   ok.Parent                  := aForm;
   ok.Top                     := 65;
   ok.Left                    := Width - 95;
   Ok.Kind                    := bkOK;
   Result := '';
  if not(aForm.ShowModal = mrCancel) then begin
     Result := Trim(Edit.Text);
  end else
     Result := CNIL;
     aForm.Free;
 end;

{ AAA  FormCreate }
 procedure TForm1.FormCreate(Sender: TObject);
  Var
   ATag   : String;
  begin
   LOC           := Application.Location;
   ATAG          :=  Application.Location;
   INSTALLPATH   := ReplaceText( ATAG, '\', '/' );
   UIMGR( 'Z' );
   VerifyInstallPath;
  {Set the Position of Control Buttons}
   UIMGR('A');
   GMMPAGE       := 1;
   UIMGR('COFF');
   LocksSetMode( 'ANIL' );
   HideCB( L0 );
   Edit1.Top     := 950;
   Edit1.Left    := 24;
   HideCB( L0 );
   UpDateUI( I20, True);
   CLEARSTATUS := 'NIL';
   LBSub.OnClick := @LBSubClick;
  end;

{ AAA  R O U T E R}
 procedure TForm1.TheRouter( AItem : String; ADEST : String);
  Var// i    : Integer;
   M1Path    : String;
   X1,RBSs   : RawByteString;
   InfoPath  : String;
   Found     : Boolean = False;
   ATag,ADir : String;
  begin
 if Locks[17] then begin exit; end;
 Set4Boxes(6);
 if TestSw then begin Application.ProcessMessages; end;

    Case AITEM of
    'FC' : begin
            if ( Not TheSplash ) then begin PrepSplash(1); end;
            GMMPAGE   := 1;
            GSPAGE    := -1;
            GMEMO     := CNIL;
            GSUBDIR   := CNIL;
            lblATag.Caption := CNIL;
            lblDir.Caption := CNIL;
            UpDateUI( I0, True );
            MManager( 1 );
            PrepSplash(1);
            InstallButton(PAGES);
            exit;
           end;
   end;

   ATag := AITEM;
   ADir := Trim(lblDir.Caption);
   {1 Try Content}
   if (GBUTTON = PAGES) then begin
      InfoPath := GetAPath( ATag, 'content', X1, M1Path);
      if TestSw then begin Application.ProcessMessages; end;
      if FileEXists(M1Path) then begin
         GMMPage := 1;
         UpDateUI( I20, True );
         GMEMOPAGE := '*M1';
         GMEMOS := 1;
         GSUBDIR := 'content';
         lblDir.Caption := GSUBDIR;
         lblATag.Caption := ATag;
         MemoManager( M1Path );
         LBX.Items.Add(ATag + ',' + GSUBDIR);
         exit;
      end;
   end;

   if TestSw then begin Application.ProcessMessages; end;
   {2 Try for doublex}
 if GBUTTON = PAGES then begin
    InfoPath := GetADoubleXPath(ATag,RBSs);
    if FileEXists(InfoPath) then begin
       UpDateUI( I20, True );
       SubManagerOne( 1, InfoPath);
       exit;
     end;
 end;

 {3 Try SUB Infoitem}
 if GBUTTON = SUB then begin
    ADir := Trim(lblATag.Caption);
    InfoPath := GetAPath( ATag, ADir, X1, M1Path);
    if FileEXists(InfoPath) then begin
       lblATag.Caption := ExtractFileNameOnly( InfoPath );
       GMMPage := 1;
       UpDateUI( I20, True );
       GMEMOPAGE := '*M1';
       GMEMOS := 1;
       MemoManager( M1Path );
       LBX.Items.ADD(ATag + ',' + ADir);
       exit;
    end;
 end;

 {4 Try Sub-Item }

 if (GBUTTON = SUB) And (ADir <> CNIL) then begin
    ADir := Trim(lblDir.Caption);
    InfoPath := GetAPath(ATag,Adir,RBSs,M1Path);
    if FileEXists(InfoPath) then begin
       GMMPage := 1;
       UpDateUI( I20, True );
       GMEMOPAGE := '*M1';
       GMEMOS := 1;
       MemoManager( InfoPath );
       lblATag.Caption := ATag;
       exit;
    end;
 end;

 if (GBUTTON = SUB) then begin
    ADir := lblDir.Caption;
    if TestSw then begin Application.ProcessMessages; end;
    if (ATag <> CNIL)  and (ADir = 'doublex') then begin
        btnPagesClick(Nil);
        exit;
    end;
 end;

  {zzz file}
  if (Not Found) then begin
     InfoPath := INSTALLPATH  + 'files/zzz.txt';
     InfoPath := SetItem(1,InfoPath);
     GSUBDIR := CNIL;
     GMMPage := 1;
     UpDateUI( I20, True );
     GMEMOPAGE := '*M1';
     GMEMOS := 1;
     MemoManager( InfoPath );
  end;
 end;

 procedure TForm1.Audit;
  VAR
   Cnt  : LongInt = 0;
   Tot  : LongInt = 0;
   Bit1 : String;
   Path : String;
  begin
   UIMGR('AuditOn');
   Set4Boxes(7);
   FileToListbox(ALLTAGFile,LBWork);
   if TestSw then begin Application.ProcessMessages; end;
   CNT := VerifyTAG;
   Inc( Tot, Cnt );
   Path := CONTENTPATH;
   if TestSw then begin Application.ProcessMessages; end;
   Bit1 := IntToStr( Tot );
   STAudit.Caption :=  'DataSet Errros = ' + Bit1;
   btnCancelClick(Nil);
   btnIndexClick(Nil);
  end;

 function TForm1.VerifyTAG : Integer;
  Var i   : Integer;
   Err    : Integer = 0;
   RBSs   : RawByteString;
   Path,M1Path    : String;
   ATag,ADir : String;
   begin
    for i := 0 to LBWork.Items.Count -1 do begin
        ADir := LBWork.Items[i];
        ATag := Copy2SymbDel(ADir,',');

        if ADir = 'doublex' then begin
           Path := GetADoublexPath(ATag,RBSs);
           if Not FileExists(Path) then begin
              Inc(ERR);
              LBX.Items.Add( ATag + ',' + Adir);
           end;
          Continue;
        end;
       Path := GetAPath(ATag,ADir,RBSs,M1Path);
       if Not FileExists(M1Path) then begin
          Inc(ERR);
          LBX.Items.Add( ATag + ',' + Adir);
       end;
  end;
   Result := Err;
 end;

{ AAA  D E L E T E S}
 procedure TForm1.Deletes;
  Var i   : Integer;
   Path,M1Path   : String;
   ADir   : String;
   ATag   : String;
   RBSs   : RawByteString;
   DelType : String;
  begin
   ADir := Trim(lblDir.Caption);
   ATag := Trim(lblATag.Caption);
   Path := CONTENTPATH + ADir + Ext;
   if  DirPathExists( Path ) then begin DelType := 'SUB';
   end else if ADir = 'content' then begin DelType := 'content';
   end else begin
       Path := CONTENTPATH + ADir + '\' + ATag + ext;
       if FileExists(Path) then begin
         DelType := 'SUBSI';
       end;
   end;

   if DelType = 'content' then begin
      { MM, M1 entry }
      UpdateMMFile(2, '',ATag);

      {Delete M1 file}
      Path := GetAPath(ATag,ADir,RBSs,M1Path);
      RBSs := M1Path;
      DeleteFile( RBSs );
      Set4Boxes(5);

   end else if DelType = 'SUBSI' then begin
      {Delete entry in DoubleX file, Delete M1.Txt file }

      //***
      Path := GetADoubleXPath(ADir,RBSs);
      FileToListBox(Path, Listbox1);
      if TestSw then begin Application.ProcessMessages; end;
      SearchLBWorkForDuplicates(ATag,i);
      if i = -1 then begin exit; end;
      Listbox1.Items.Delete(i);
      if TestSw then begin Application.ProcessMessages; end;
      LBoxToFile( Path, Listbox1 );

      Path := GetAPath(ATag,Adir,RBSs,M1Path);
      if FileExists(RBSs) then begin
          DeleteFile(RBSs);
          if TestSw then begin Application.ProcessMessages; end;
      end;


   end else if DElType = 'SUB' then begin;
   {doublex entry, m1 entry}
      RBSs := Trim(LBLMemoName.Caption);
      if Not FileExists( RBSs ) then begin
         Path := RBSs;
         ValidationMessages(16, Path,1);
         exit;
      end;

   end;
   ReDisplay;
 end;

 { AAA NEW}
 procedure TForm1.New;
  Var Y  : Integer;
   Path, M1Path  : String;
   X1           : RawByteString;
   Valid : Boolean = False;
   ATag, ADir, Item : String;
  begin
   ATag := RequestInput(650, 750, 305, 'Required', 'New Main Tag');
   ATag := TRim(ATag);
   Item := Trim(ATag) + ',' + 'content';
   Valid := ValidateItem( 0, Item, Y);
   if Not Valid then begin ValidationMessages(Y,ATag,1); exit; end;
   if TestSw then begin Application.ProcessMessages; end;
    //***
   Valid := UpdateMMFile(0,' ', ATag);
   if TestSw then begin Application.ProcessMessages; end;
   {//**SetNewMemo}
   ADir := 'content';
   Item := SetUpNewMemo2(ATAG);
   Path := GetAPath(ATag, ADir,X1,M1Path);
   M1.Lines.SaveToFile( M1Path );
   if TestSw then begin Application.ProcessMessages; end;
   btnCancelClick(Nil);
   ReDisplay;
 end;
 {ToDo SetUpNewMemo2}
 function TForm1.SetUpNewMemo2(THETAG : String) : String;
  Var i : Integer;
   Item : String;
   Sub  : String;
   DS   : String;
   U    : String = '  uses ... ';
   S    : String;
  begin
   DS := Trim(LBlRoadSign.Caption);
   M1.Clear;
   M1.Lines.Add('*M1');
   M1.Lines.Add('');
   M1.Lines.Add('       ' + THETAG);
   Result := S;
  end;

 { AAA NEW SUB }
 procedure TForm1.NewSub;
  Var Y : Integer;
   Path : String;
   RBSs  : RawByteString;
   Valid : Boolean = False;
   ATag,Item,FName,M1Path : String;
   begin
   {*MM entry, *Doublex file, *Doublex endtry Sub Directory}
   ATag := RequestInput(650, 750, 305, 'Required', 'New Sub Memu Tag name');
   Item := Trim(ATag) + ',' + 'doublex';
   Valid := ValidateItem( 0, Item, Y );
   if ( Not Valid ) then begin ValidationMessages(Y,ATag,1); exit; end;
   {Create entry in MM}
   //**
   Valid := UpdateMMFile(0,' ', ATag);

   lblATag.Caption := ATag;
   if TestSw then begin Application.ProcessMessages; end;

   {Create A Directory}
   RBSs := CONTENTPATH + ATAG;
   RBSs := SetItem(1,RBSs);
   Path := RBSs;
   Valid := CreateDir(  RBSs );           {Dir Created}
   if TestSw then begin Application.ProcessMessages; end;
   {//**SetNewMemo}
   {*Create A M1.txt file }
   FName :=  'placeholder1' + Ext;
   M1.Clear;
   M1.Lines.Add('*M1');
   M1.Lines.Add(' ');
   M1.Lines.Add('    Placeholder1');
   Path := RBSs + '\' + FName;
   M1.Lines.SaveToFile( Path );           {Create M1.txt}
   if TestSw then begin Application.ProcessMessages; end;

   {Create A doublex file with Placerholder entry}
   {ToDo GetAPath}
   Path := GetAPath(ATag,'doublex',RBSs,M1Path);
   Set4Boxes(2);
   LBWork.Items.Add('Placeholder1');
   if TestSw then begin Application.ProcessMessages; end;
   LBoxToFile( Path, LBWork);
   if TestSw then begin Application.ProcessMessages; end;
   btnCancelClick(Nil);
   ReDisplay;
  end;

 { AAA NEWSI }
 procedure TForm1.NewSI;
  Var i,Y : Integer;
   Item : String;
   Hold : String;
   Valid: Boolean = False;
   ATag,ADir,ID,DXFile,Path : String;
  begin
  {Entry in doublex file, M1.txt file}
   i := LBX.Items.Count;
   if i = 0 then begin  ValidationMessages(18, '', 1); btnCancelClick(Nil); exit;
   end else if i > 1 then begin  ValidationMessages(21, '', 1); btnCancelClick(Nil); exit; end;
   Hold := Trim(LBX.Items[0]);
   ADir := Hold;
   //
   Id := Copy(Hold,1,1);
   DXFile := ID + Copy2SymbDel(Hold,',') + Ext;


   ATag := RequestInput(650, 750, 305, 'Required', 'New Sub-Menu Tag');
   Item := Trim(ATag) + ',' + Hold;
   if TestSw then begin Application.ProcessMessages; end;
   Valid := ValidateItem( 0, Item, Y);
   if Not Valid then begin
      ValidationMessages(Y,ATag,1);
      lblDir.Caption := '----';
      lblATag.Caption := '----';
      exit;     // 'D:\qlui\worldautos\doublex\uusa.txt'
   end;
   lblATag.Caption := ATag;
   lblDir.Caption := Hold;
   Set4Boxes(2); // D:\QLUI\worldautos\content\korea
   if TestSw then begin Application.ProcessMessages; end;
   Path :=  DOUBLEXPATH +  DXFile;
   Path := SetItem(1,Path);
   Valid := FileExists( Path );
   if TestSw then begin Application.ProcessMessages; end;
   if Not Valid then begin ValidationMessages(16,Path,1); exit; end;
   FileToListBox(Path,LBWork);
   LBWork.Items.Add( ATAG );
   ListBoxToFile(Path,LBWork);
   if TestSw then begin Application.ProcessMessages; end;
   // 'D:\qlui\worldautos\content\korea\Kia.txt'
   ADir := LBX.Items[0];
   ADir := Copy2SymbDel(ADir,',');

   Path := CONTENTPATH + Adir + '\' + ATag + ext;
   Path := SetItem(1,Path);
   M1.Clear;
   M1.Lines.Add('M1');
   M1.Lines.Add('');
   M1.Lines.Add('     ' + ATag);
   M1.Lines.SaveToFile( Path );
   if THESPLASh then begin PrepSplash(0); end;
   btnCancelClick(Nil);
   ReDisplay;
  end;

 { AAA  RENAME}
 procedure TForm1.Rename;
  Var i,Y  : Integer;
   Paths   : String;
   Path    : RawByteString;
   RBSs    : RawByteString = '';
   Valid   : Boolean = False;
   OldDir  : String;
   OLDName : String;
   NewName : String;
   M1Path  : String;
  begin
   OldName := Trim(lblATag.Caption);
   NewName := RequestInput(650, 750, 305, 'Required', 'New Tag name');
   NewName := TRim(NewName);
   Valid := ValidateItem( 0, NewName,  Y );
   if Not Valid then begin ValidationMessages(Y, NewName, 1); exit; end;
   lblATag.Caption := NewName;
   if TestSw then begin Application.ProcessMessages; end;
   OldDir :=  Trim(lblDir.Caption);
   if OldDir = 'content' then begin
      {MM update} { MM, M1.Txt }
      //**
      Valid := UpdateMMFile(1,OldName,NewName);
      {Save M1.txt under new tag name}
      Paths := GetAPath(NewName,OldDir,RBSs,M1Path);
      M1.Lines.SaveToFile( M1Path );
      if TestSw then begin Application.ProcessMessages; end;
     {Delete old M1.txt file}
     Paths := GetAPath(OldName,OldDir,RBSs,M1Path );
     Valid := DeleteFile( M1Path );
   end else if OldDir = 'doublex' then begin
     {MM.txt, doublex file, subdirectory}
     {MM Old Tag to New TAg}
     Set4Boxes(2);
     //**
     Valid := UpdateMMFile(1,OldName,NewName);

     {Rename Old Doublex file to New doublex file}
     Set4Boxes(1);
     Path := GetADoublexPath(OldName,RBSs);
     FileToListbox(Path,LBX);
     Valid := DeleteFile( RBSs );
     if TestSw then begin Application.ProcessMessages; end;
     Path := GetADoublexPath(NewName,RBSs);
     ListboxtoFile(Path, LBX);

     {Rename  Old Dir to New Dir '}
     Path := CONTENTPATH + OldName;
     Path := SetItem(1,Path);
     RBSs := CONTENTPATH + NewName;
     RBSs := SetItem(1,RBSs);
     Valid := ReNameFile(Path, RBSs);
    end else begin
     { doublex file entry and M1.txt or Placeholder1.txt}
       Paths := GetAPath(OldName,OldDir,RBSs,M1Path);
       if FileExists(Paths) then begin
          M1.Lines.LoadFromFile( Paths );
          Valid := DeleteFile( RBSs);
          Paths := GetAPath(NewName,OldDir,RBSs,M1Path);
          M1.Lines.SaveToFile( Paths );
       end;
       Set4Boxes(2);
       Path := GetADoubleXPath(OldDir,RBSs);
       FileToListbox(Path,LBWork);
       if TestSw then begin Application.ProcessMessages; end;
       Valid := SearchLBWorkForDuplicates(OldName,i);
       if TestSw then begin Application.ProcessMessages; end;
        LBWork.Items.Delete ( i );
        LBWork.Items.Add(NewName);
        ListboxToFile(Path,LBWork);
         if TestSw then begin Application.ProcessMessages; end;
   end;
   ReDisplay;
end;

 function TForm1.GetADoublexPath(AITEM : String; Out S : RawByteString) : String;
  Var Path, Id : String;
   begin
    Id := Copy(AITEM,1,1);
    Path := DOUBLEXPATH + Id + AITEM + EXT;
    Path := SetItem(1,Path);
    S := Path;
    Result := Path;
 end;

 function TForm1.UpdateMMFile(AMODE: Integer; AItem : String; BItem: String) : Boolean;
  Var i : Integer;
   Found : Boolean = False;
  begin
   Set4Boxes(5);
   FileToListbox( MMTXTPath, LBWork );
   if TestSw then begin Application.ProcessMessages; end;
   Case AMODE of
    0 : begin    {Adding an item}
         LBWork.Items.Add(BITEM);
         Found := True;
        end;
    1 : begin    {Deleting and Adding an Item}
         Found := SearchLBWorkForDuplicates(AItem,i);
         if Found then begin
            LBWork.Items.Delete ( i );
            LBWork.Items.Add(BItem);
            Found := True;
         end;
        end;

    2 : begin {Deleting an Item}
         Found := SearchLBWorkForDuplicates(BITEM,i);
         if Found then begin
            LBWork.Items.Delete ( i );
            Found := True;
         end;
        end;
   end;
   if Found then begin ListboxtoFile( MMTXTPath, LBWork ); end;
   Result := Found;
  end;

 function TForm1.GetAPath(THETAG,THEDIR : String;
			          out X : RawByteString;
                                  out Y : String) : String;
   Var ID : String;
    APath  : String;

  begin
   Id := Copy(THETAG,1,1);
   Case THEDir of
    'content' : begin
	             APath := MMTXTPath;
		     X := APath;
		     Y := CONTENTPATH + THETAG + EXT;
                     Y := ExpandFileName(Y);
                     lblATag.Caption := THETAG;
                     lblDir.Caption := THEDir;
               end;

   'doublex' : begin
      //**
                 APath := DOUBLEXPATH + ID + THETAG + EXT;
                 APath := ExpandFileName(APath);

                 if FileExists(APath) then begin
                    lblATag.Caption := CNIL;
                    lblDir.Caption :=THETAG;
                    DX := THETAG;
                 end;
                 X := APath;
                 Y := CNIL;
                end;
	 else
                APath := CONTENTPATH + THEDIR + '\' + TheTAg + EXt;
                APath := ExpandFileName(APath);
                X := APath;
		Y := CONTENTPATH + THEDIR + '\' + THETAG + EXt;
                Y := ExpandFileName(Y);
                lblATag.Caption := THETAG;
   	end;
         APath := LowerCase(APath);
         APath := DelSpace(APath);
         Y := LowerCase( Y );
         Y := DelSpace( Y );
         Y := SetItem(1,Y);
	 Result := APath;
  end;

 procedure TForm1.RenameATag(ANEWTAG : String);
  Var i,IDX : Integer;
   DF   : UnicodeString;
   OldTag : String;
   LBXItem,ADIR : String;
  begin
   LBXItem := LBX.Items[0];
   OldTag := Copy2SymbDel(LBXItem, ',');
   ADIR := Trim(LBXItem);

   i := LBWork.Items.Indexof(OldTag);
   if i <> -1 then begin LBWork.Items.Delete (i); end;
   LBWork.Items.Add(ANEWTAG);
   LBoxToFile( MMTXTPath, LBWork );

   OldTag := SetItem(0,OldTag);
   ANEWTAG := SetItem(0,ANEWTAG);
   if OldTag <> ANEWTAG then begin
      RenameMemo( ADIR, OldTag, ANEWTAG );   {M1.txt}
      Set4Boxes(2);
      DF := ALLTAGFILE;
      FileToListbox( DF, LBWork );      {Load AllTags}
      LBXItem := LBX.Items[0];
      IDX := LBWork.Items.Indexof(LBXItem);
      LBWork.Items.Delete (IDX);
      {Delete All TAgs file}
      DeleteFile( DF );
      LBXItem := ANEWTAG + ','  + ADIR;
      LBWork.Items.Add(LBXItem);
      LBoxToFile(DF,LBWork);
      DF := DUMPSPATH + ANEWTAG + ','  + ADIR;
      LBoxToFile(DF,LBWork);
   end;
   ReDisplay;
  end;

 procedure TForm1.RenameMemo(ADir, AOLD, ANEW : String);
  var
   Path  : String;
   Path2 : String;
   Found : Boolean = False;
  begin
   Path := CONTENTPATH + AOLD + Ext;
   Path2 := CONTENTPATH + ANEW + Ext;
   Found := FileExists( Path );
   if found then begin
      M1.Lines.LoadFromFile( Path );
      M1.Lines.SaveToFile( Path2 );
      Found := DeleteFile( Path );
   end else begin
      M1.Clear;
      M1.Lines.Add('*M1');
      M1.Lines.SaveToFile( Path2 );
   end;
  end;

 { AAA NEWDS}
 procedure TForm1.NewDS;
  Var Code   : Integer;
   Path   : String;
   TFQP   : String;
   Valid  : Boolean;
   CurrentDSName : String;
   S1,DSName,Hold,FName : String;
   begin
   CurrentDSName := Trim(LBlRoadSign.Caption);
   S1 := RequestInput(650, 750, 305, 'Required', 'DataSet Path and Name');
   S1 := Trim(S1);
   if S1 = 'CNIL' then begin btnCancelClick(Nil); end;
   Hold := ExtractFileNameOnly(S1);
   Valid := ValidateAbsolutePath( S1, DSName, TFQP, Code );
   LBlRoadSign.Caption := CurrentDSName;
   if TestSw then begin Application.ProcessMessages; end;
   if ( Not Valid ) then begin ValidationMessages(Code,S1,1); exit; end;
   Path := Hold     + Spacer +  '|' + TFQP + '\' + '|' + TMPPIN + '|';
   Edit1.Text := Path;
   LBWork.Items.Add( Path );
   LBoxToFile( Config, LBWork );            {*config.txt updated}
   Path := ExtractWord( 2, Path, ['|'] );
   Valid := CreateDir( Path );
   if ( Not DirPathExists( Path ) ) then begin ValidationMessages(9, TFQP,1); exit; end;
   if TestSw then begin Application.ProcessMessages; end;
  {*Create Directory Structure}
   Path := Path + 'content';
   Path := SetItem(1,Path);
   Valid := CreateDir( Path  );

   Path := TFQP + '\doublex';
   Path := SetItem(1,Path);
   Valid := CreateDir( Path  );

   Path := TFQP + '\dumps';
   Path := SetItem(1,Path);
   Valid := CreateDir( Path  );

   Path := TFQP + '\files';
   Path := SetItem(1,Path);
   Valid := CreateDir( Path  );

   Path := TFQP + '\oddsbin';
   Path := SetItem(1,Path);
   Valid := CreateDir( Path  );
   Set4Boxes(5);
   {Create PlaceHolder(n).txt}
   { SetupNewMemo should return a Placehildern }
   FName := SetupNewMemo(Hold);
    {*Set MM}
   LBWork.Items.Add( 'Placeholder1' );
   if TestSw then begin Application.ProcessMessages; end;
   Path := TFQP + '\files\mm.txt';
   Path := SetItem(1,Path);
   LBoxToFile( Path, LBWork );    {*MM.txt file created}
   Set4Boxes(15);
   Path := TFQP + '\' + 'content' + '\' + 'placeholder1' + EXT;
   Path := SetItem(1,Path);
   M1.Lines.SaveToFile( Path );   {*Create placeholder1 }
   if TestSw then begin Application.ProcessMessages; end;
   btnCancelClick(Nil);
   Set4Boxes(6);
 end;

 { AAA EXECUTE}
 procedure TForm1.Execute;
  begin
   CLEARSTATUS := Trim(CLEARSTATUS);
  Case CLEARSTATUS of
   'DELETES'    : DELETES;
   'NEW'        : New;
   'NEW DS'     : NewDS;
   'NEWSUB'     : NewSub;
   'NEW SI'     : NewSI;
   'RENAME'     : Rename;
   'X DS'       : XDS;
 end;
  lblDir.Caption :=   '----';
  lblATag.Caption :=  '----';
  btnExecute.Font.Color := CLBlack;
 end;

 { AAA   F I L E  C O N T E N T}
 procedure TForm1.FileContent(ACONTENT : String);
   Var Path        : String;
  begin
  CLEARSTATUS := Trim(CLEARSTATUS);

  Case CLEARSTATUS of
 
  'ALLTAGS'  : begin   {Saving ALLTAGS}
                LBWork.Sorted := True;
                LBWork.Items.SaveToFile(ALLTAGFILE);
                Set4Boxes(6);
                btnFile.Font.Color := CLBlack;
                LocksSetMode('RUN');
               end;

     'EDIT'  : begin   {Saving M1}
                Path := Trim(LBLMemoName.Caption);
                M1.Lines.SaveToFile( Path );
                btnFile.Font.Color := CLBlack;
                Locks[17] := False;
                btnCancelClick(Nil);
                end;

    'RENAME' : begin
                Rename;
                ReDisplay;
               end;

   'XITEMS'  : begin
                Path := FILESPATH + 'items.txt';
                LBoxToFile(Path,Listbox2);
                ReDisplay;
               end;
  end;
 end;

 { AAA X DS}
 procedure TForm1.XDS;
  Var
   i      : Integer;
   Path   : String;
   RBSs   : RawByteString;
   Found  : Boolean = False;
   Pin,S  : String;
   LBItem : String;
   DSName : String;
  begin
   {remove from config.txt, del directory structure}
   i := LBX.Items.Count;
   if i = 0 then begin  ValidationMessages(18, S, 1); btnCancelClick(Nil); exit;
   end else if i > 1 then begin  ValidationMessages(21, S, 1); btnCancelClick(Nil); exit; end;
   LBItem := LBX.Items[0];
   Pin := ExtractWord(3,LBItem,['|']);
   LBItem := Copy2Space(LBX.Items[0]);
   LBItem := SetItem(0,LBItem);
   S := SetItem(0,LBlRoadSign.Caption);
   S := S + ' = ' + LBItem;
   if S = LBItem then begin ValidationMessages(20, S,1); exit; end;
   S := RequestInput(650, 750, 305, 'Required', 'DataSet Pin number.');
   if S = '0000' then begin ValidationMessages(11, S,1); exit;
   end else if S <> Pin then begin ValidationMessages(11, S,1); exit; end;
   DSName := LBX.Items[0];
   Path := ExtractWord(2,DSName,['|']);
   RBSs := SetItem(1,Path);
   RBSs := SetItem(1,RBSs);
   Found := DirectoryExists( RBSs, True );
   if Not Found then begin ValidationMessages( 24, LBItem, 1 ); exit; end;
   i := QDialogA('Delete the DataSet ' + LBItem + '?');
   if i = 31 then begin btnCancelClick(Nil); exit; end;
   Found := DeleteDirectory( RBSs, False );
   Set4Boxes(7);
   Path := INSTALLPATH + 'files\config.txt';
   FileToListbox( Path, LBWork );
   FileFormater( Path );
   if TestSw then begin Application.ProcessMessages; end;
   i := SearchLBWork(DSName);
   if i = -1 then begin btnCancelClick(Nil); exit; end;
   LBWork.Items.Delete (i);
   LBoxToFile(Path, LBWork);
   if TestSw then begin Application.ProcessMessages; end;
   Set4Boxes(7);
   btnCancelClick(Nil);
 end;

 procedure TForm1.AddItems;
  Var i : Integer;
   Path : String;
   Item : String;
   Hold : String;
  begin
    i := ListBox2.Items.IndexOf( 'None' );
    if i <> -1 then begin  ListBox2.Items.Delete ( i ); end;
   Repeat
    Item := RequestInput(650, 750, 305, 'Rntry', 'Item');
    Item := Trim(Item);
    if Item.IsEmpty then begin Break; end;
    Item := Trim(Item); Hold := Item;
    Item := LowerCase(Item);
    if Item = 'none' then begin Continue; end;
    if Item = 'nil' then begin
       btnCancelClick(Nil); Break;
    end;
    Listbox2.Items.Add(Hold);
   until Item = CNIL;
     ListBox2.Items.Insert( 0 , 'None' );
     Path := FILESPATH + 'items.txt';
     Path := SetItem(1,Path);
     ListboxToFile(Path,Listbox2);
  end;

 function TForm1.SearchLBWork(ADATASET : String) : Integer;
  Var i : Integer;
   Item : String;
   AD   : String;
  begin
   AD := Copy2Symb(ADATASET, '|');
   AD := SetItem(0,AD);
   for i := 0 to LBWork.Items.Count -1 do begin
       Item := LBWork.Items[i];
       Item := Copy2Symb(Item,'|');
       Item := SEtItem(0,Item);
       if AD = Item then begin
          Result := i; exit;
       end;
   end;
   Result := -1;
  end;

 { AAA GRIDINDEX }
 procedure TForm1.GridIndex;
   Var
    GL1 : String = 'InfoItem                                             Location                       FPC Ref';
    GL2 : String = 'InfoItem      Location';
    Path : String;
    R    : Integer;
    Item : String;
   begin
    if ( Not THESPLASh ) then begin PrepSplash(1); end;
    Path := DUMPSPATH +  'alltags.cvs';
    if FileExists(Path) then begin
      Item := Trim( LBlRoadSign.Caption);
      if Item = 'Free Pascal' then  GridHeading.Caption := GL1
      else GridHeading.Caption := GL2;
      Grid1.Clear;
      UIMGR('Grid2');
      GridHeading.Visible := True;
      GridHeading.BringToFront;
      Grid1.LoadFromCSVFile( Path, ',', False);
      Grid1.AutoSizeColumns;
      R := Grid1.RowCount;
      Edit1.Text := 'Curent Infotext items on the system: ' + IntToStr(R);
      Set4Boxes(6);
    end;
   end;

 { AAA CREDITS}
 procedure TForm1.Credits;
   Var
    Path      : String;
   begin
    Path := DUMPSPATH +  'credits.cvs';
    if FileExists(Path) then begin
       if ( Not THESPLASh ) then begin PrepSplash(1); end;
       CLEARSTATUS  := 'CREDITS';
       LBxx1.Caption := ' CREDITS';
       Grid1.Clear;
       UIMGR('Grid1');
       Grid1.Width := 820;
       Grid1.LoadFromCSVFile( Path, ',', false);
       Grid1.AutoSizeColumns;
       Edit1.Text := 'Thank You!';
       Set4Boxes(6);
    end;
 end;

{ AAA  M M A N A G E R }
 procedure TForm1.MManager( Const APAGE : Integer );
  Var
   TFirst,TLast : Integer;
  begin
   HideCB( L0 );
   TLast := CalcMMPageIndex( APage, GMMPages, TFirst );
   InstallButton( PAGES );
   DisplayMainMenu( TFirst, TLast );
 end;

 procedure TForm1.DisplayMainMenu( AFirst,ALast : Integer );
  Var i   : Integer;
   PosA   : Integer = -1;
   Item   : String;
  begin
  for i := AFirst   to  ALast   do begin
      Inc(PosA);
      Item := MM[i];
      DisplayItem(PosA,Item);
      if TestSw then begin Application.ProcessMessages; end;
  end;
 end;

{ AAA  S U B  M A N A G E R}
 procedure TForm1.SubManager( APAGE : Integer);
  Var
   TFirst : Integer = 0;
  TLast  : Integer = 0;
  begin
   HideCB( L0 );
   GSItems := High( SUBMENU ) + 1;
   GSPAGES := CalcPageCount( GSITEMS );
   TLast := CalcSUBPageIndex( GSPage, GSPages, TFirst );
   PostPageLabels( GSPAGE , GSPAGES );
   InstallButton( SUB );
   UpDateUI( I0, True );
   if TestSw then begin Application.ProcessMessages; end;
   DisplaySubMenu( TFirst, TLast );
  end;

procedure TForm1.SubManagerOne( APAGE : Integer; APATH : String );
 Var
  TFirst : Integer = 0;
  TLast  : Integer = 0;
  ATag   : String;
 begin
  HideCB( L0 );
  if TestSw then begin Application.ProcessMessages; end;
  FileToListbox( APath, LBWork );
  GenericArrayLoad( SubMenu, LBWork, True );
  GSItems := High( SUBMENU ) + 1;
  GSPAGES := CalcPageCount( GSITEMS );
  if GSPAGES = 0 then begin ValidationMessages(15, '',1); exit; end;
  GSPage := APAGE;
  TLast := CalcSUBPageIndex( GSPage, GSPages, TFirst );
  PostPageLabels( GSPage , GSPAGES );
  InstallButton( SUB );
  lblDir.Caption := 'doublex';
  ATag := ExtractFileNameOnly(APATH);
  ATag := Copy(ATag,2,35); ATag := Trim(Atag);
  lblATag.Caption := Atag;
  if TestSw then begin Application.ProcessMessages; end;
  DisplaySubMenu( TFirst, TLast );
  Set4Boxes(6);
  LBX.Items.ADD(ATag + ',' + 'doublex');
 end;

 procedure TForm1.SubManageTwo( APAGE : Integer);
  Var GItems : Integer;
   TFirst,TLast : Integer;
  begin
  if ( Not THESPLASH ) then begin PrepSplash( 1 ); end;
  GSPAGE := APAGE;
  GItems := High(SUBMENU);
  GSPAGES := CalcPageCount( GItems );
  HideCB( L0 );
  TLast := CalcSUBPageIndex(GSPAGE, GSPAGES, TFirst );
  PostPageLabels( GSPAGE , GSPAGES );
  if TestSw then begin Application.ProcessMessages; end;
  DisplaySubMenu( TFirst, TLast );
 end;

procedure TForm1.DisplaySUBMenu( AFIRST, ALAST : Integer );
 Var i : Integer;
  Item : String;
  X    : Integer = 0;
 begin
  for i :=AFIRST  to  ALAST   do begin
      Item := SubMenu[i];
      DisplayItem(X,Item);
      Inc( X );
  end;
end;

{ AAA    M E M O  M A N A G E R}
 procedure TForm1.MemoManager( AFILENAME : String);
  Var ADir : String;
  begin
   if TheSplash then begin PrepSplash ( 0 ); end;
   if FileExists( AFILENAME ) then begin
      M1.Lines.LoadFromFile( AFILENAME );
      LBLMemoName.Caption := AFILENAME;
      M1.Visible:= True;
      M1.BringToFront;
      ADir := ExtractDirector( AFILENAME );
      lblDir.Caption := ADir;
      if TestSw then begin Application.ProcessMessages; end;
   end;
 end;

 function TForm1.ExtractDirector( APATH : String) : String;
  Var PosA : Integer;
   Path    : String;
   ADelm   : Char = '\';
   ATag    : String;
   ADir    : String = 'Nil';
  begin  // 'D:\qlui\worldautos\content\usa\ford150.txt'
   Path := APATH;
   ATag := ExtractFileNameOnly(Path);
   PosA := Pos( ATag,PATH );
   Dec(PosA,2);
   ATag := Copy(APATH,1,PosA);
   ATag := ReverseString(ATag);
   PosA := Count(ADelm,ATag);
   if PosA = 0 then begin ADelm := '/'; end;
   ADir := Copy2SymbDel( ATag, ADelm );
   ADir := ReverseString(ADir);
   Result := ADir;
  end;

 { AAA  U T I L I T I E S}
 Procedure TForm1.GenericShowArray( THEARRAY : Array of String; ABox : TLISTBox);
  Var i : Integer;
   Line : String;
  begin
   ABox.Clear; ABox.Sorted := True;
   for i := Low( THEARRAY ) to High( THEARRAY ) do begin
       Line := THEARRAY[i];
       ABOX.Items.Add( Line );
   end;
 end;

 procedure TForm1.InstallButton( ABUTTON : TMMenu );
  begin
   btnPages.Visible    := False;
   btnPages.Enabled    := False;
   btnNext.Visible     := False;
   btnNext.Enabled     := False;
   BtnPrev.Visible     := False;
   BtnPrev.Enabled     := False;
   btnSub.Visible      := False;
   btnSub.Enabled      := False;
   BtnSubNext.Visible  := False;
   BtnSubNext.Enabled  := False;
   BtnSubPrev.Visible  := False;
   BtnSubPrev.Enabled  := False;

   GBUTTON := ABUTTON;                  {GLOBAL - Current button }
  Case ABUTTON of
   Pages : begin
     btnPages.Visible  := True;
     btnPages.Enabled  := True;
     btnNext.Visible  := True;
     btnNext.Enabled  := True;
     BtnPrev.Visible  := True;
     BtnPrev.Enabled := True;
     PostPageLabels( GMMPage, GMMPages );
    end;

    Sub   : begin
     btnSub.Visible     := True;
     btnSub.Enabled     := True;
     BtnSubNext.Visible := True;
     BtnSubNext.Enabled := True;
     BtnSubPrev.Visible := True;
     BtnSubPrev.Enabled := True;
    end;
   end;
 end;

 procedure TForm1.ManageTheRedX(AITEM : String; ALABEL : TStaticText);
  begin
   if (Not THESPLASH) then begin PrepSplash( 1 ) end;
   if ALABEL.Caption = 'X' then begin
    ALABEL.Caption := '';
    exit;
  end;
  UpDateUI( ALABEL, False);
  TheRouter( AITEM, '' );
 end;

 function TForm1.GetDir(APATH : String) : String;
  Var ADir : String;
   Path : String;
  begin
   Path := ReplaceStr(APATH, '/', '\' );
   Path := ReverseString( PATH );
   ADir := Copy2SymbDel(PATH,'\');
   ADir := Copy2SymbDel(PATH,'\');
   Adir := ReverseString( ADir );
   Result := ADir;
  end;

 procedure TForm1.PostPageLabel( APage : Integer );
  begin
   LBLPage.Caption       := IntToStr(APage);
 end;

 procedure TForm1.PostPageLabels( APage : Integer; APages : Integer );
  begin
   LBLPage.Caption       := IntToStr(APage);
   LBLTotalPages.Caption := IntToStr(APages);
 end;

 procedure TForm1.PrepSplash(AMODE : Integer);
 begin
  Set4Boxes(6);
  Case AMode of

   0 : begin
        MX.Visible := True;
        M1.Visible := True;
        Image1.Visible := False;
        Image1.SendToBack;
        THESPLASH := False;
       end;

   1 : begin
        MX.Visible := False;
        M1.Visible := False;
        Image1.Visible := True;
        Image1.Top := 16;
        Image1.Left := 100;
        Image1.width := 1000;
        Image1.Height := 399;
        Image1.BringToFront;
        THESPLASH := True;
        LBSUB.Items.Add('SPLASH');
       end;
  end;
  if TestSw then begin Application.ProcessMessages; end;
 end;

 function TForm1.QDialogA(THEMSG : String) : Integer;
  const
   mrNoneNI=      20;             {Continue    }
   mrCloseNI=     mrNoneNI+11;    {Cancel      }
  Var Reply : Integer = -1;
  begin
   case QuestionDlg ('Caption', THEMSG, mtCustom,
                    [mrNoneNI,  'Continue',
                     mrCloseNI,'Cancel'],'') of
    mrNoneNI  : Reply := mrNoneNI;  {20 Continue  }
    mrCloseNI : Reply := mrCloseNI; {31 Cancel    }
   end;
    result := reply;
  end;

 procedure TForm1.ReDisplay;
  Var i : integer;
   TheRoadSign : String;
  begin
   {Common to Delete, Edit, Rename, New, New DS, New Sub,X DS}
   LOCKS[5]  := False;     {Set     }
   LOCKS[13] := False;     {Indexes }
   LOCKS[15] := False;     {Data Set}
   LOCKS[20]  := False;    {To CVS  }
   Set4Boxes(7);
   FileToListBox( CONFIG, LBWork);
   if TestSw then begin Application.ProcessMessages; end;
   TheRoadSign := Trim(LBlRoadSign.Caption);
   i := SearchLBWork( TheRoadSign );
   LBWork.ItemIndex := i;
   if i = -1 then begin exit; end;
   btnSetClick(Nil);
   Set4Boxes(6);
 end;

 procedure TForm1.SplitFilebyChar(ABOX1,ABOX2, ABOX3 : TListbox);
  Var i : Integer;
   ATag,ADir : String;
  begin
   ABox2.Clear; ABox3.Clear;
  for i := 0 to ABOX1.Items.Count -1 do begin
      ADir := ABOX1.Items[i];
      ATag := Copy2SymbDeL(ADir,',');
      ATag := Trim(ATag);
      if ADir = 'doublex' then ABox2.Items.Add(ATag);
  end;
 end;

 {1 = LBX, 2 = LBWork Not Sorted, 3 = LBSub  }
 {4 = Listbox1,                              }
 {5 = LBWork and Sorted                      }
 {6 = LBWork Not Sorted, LBX, LBSub, Listbox1}
 {7 = LBWork Sorted, LBX, LBSub, Listbox1    }
 {8 = LBWork Not Sorted, Listbox1            }
 {9 = LBWork Not Sorted, LBX                 }
 {10 = LBWork Not Sorted, LBX,Listbox1       }
 {11 = LBSUB, LBX, ListBox1                  }
 {12 = LBWork Not Sorted, LBX                }
 {14 = Listbox3, Listbox3, Listbox5          }
 {15 = LBWork/Unsorted                         }
 procedure TForm1.Set4Boxes(AMODE : Integer);
  begin
   Case AMode of
    1 : LBX.Clear;

    2 : begin
         LBWork.Clear;
         LBWork.Sorted := False;
        end;

    3 : LBSub.Clear;

    4 : Listbox1.Clear;

    5 : begin
         LBWork.Clear;
         LBWork.Sorted := True;
        end;

    6 : begin
         LBWork.Clear;
         LBWork.Sorted := False;
         LBX.Clear;
         LBSub.Clear;
         Listbox1.Clear;
        end;

    7 : begin
         LBWork.Clear;
         LBWork.Sorted := True;
         LBX.Clear;
         LBSub.Clear;
         Listbox1.Clear;
        end;

    8 : begin
         LBWork.Clear;
         LBWork.Sorted := False;
         Listbox1.Clear;
        end;

    9 : begin
         LBWork.Clear;
         LBWork.Sorted := False;
         LBX.Clear;
        end;

    10 : begin
         LBWork.Clear;
         LBWork.Sorted := False;
         LBX.Clear;
         Listbox1.Clear;
        end;

   11 : begin
         LBSUB.Clear;
         LBX.Clear;
         Listbox1.Clear;
        end;

   12 : begin
         LBWork.Clear;
         LBX.Clear;
        end;

   14 : begin
         ListBox3.Clear;
         ListBox4.Clear;
         ListBox5.Clear;
        end;

   15 : begin
         LBWork.Clear;
         LBWork.Sorted := False;
        end;
   end;
   if TestSw then begin Application.ProcessMessages; end;
 end;

 procedure TForm1.ToTop(ABOX : TListBox);
  begin
   ABOX.TopIndex := -1 + ABOX.Items.Count;
   ABOX.TopIndex := ABOX.ItemIndex;
   ABOX.SetFocus;
  end;

 procedure TForm1.UpDateUI( ALABEL : TStaticText; All : Boolean);
  const
   BASE = 'I';
  Var
   S, TheName:  String;
   I : Integer;
   AC : TComponent;
  begin
      { Get the name of the TStaticText I0..I20 that
      should be marked }
      TheName := StringReplace(ALabel.Name, 'L', 'I', [rfIgnoreCase]);
      { Now find all I0 images and set them }
      for i := 0 to 20 do begin
        S := BASE + IntToStr(I);
        AC := FindComponent(S);
        if AC is TStaticText then
          {if ALL is set to true then blank all In's}
          if All then begin TStaticText(AC).Caption := ''; Continue; end;
          {Is it the TSaticText associated to the label?}
          if SameText(S, TheName) then
	     {if so, put the X in it}
             TStaticText(AC).Caption := 'X'
          else
	    {otherwise, clear it}
            TStaticText(AC).Caption := '';
      end;
    end;

 procedure Tform1.UpdateControlBoxes( AMEMO : String);
  Var S : String;
  begin
   S := Copy(AMEMO,3,6); S := Trim(S);
   LBLPage.Caption := S;
  end;

 procedure TForm1.UpdateControlBoxes( Const APAGE : Integer );
  Var S : Integer;
  begin
   S := APAGE;
   LBLPage.Caption := IntToStr( S );
 end;

 function TForm1.ValidateMainDelete : Boolean;
  var i : Integer;
   Item,Trash : String;
   Ctr : Integer = 0;
  begin
   Result := True;
   for i := Low(AllTags) to High(AllTags) do begin
       Item := AllTags[i];
       Trash := Copy2SymbDEl(Item, ',');
       if Item = 'content' then begin Inc(Ctr); end;
       if Ctr >= 2 then break;
   end;
    if Ctr < 2 then Result := False;
 end;

 {AAA VALIDATIONMESSAGE}
 procedure TForm1.ValidationMessages(ACODE : Integer; S : String; AMode : Integer);
  begin
   Case ACODE of
    1 : ShowMessage('Entry is an empty string = ' + S);
    2 : ShowMessage('Invalid entry = ' + S);
    3 : ShowMessage('Duplicate entry not allowed at this level ' + S);
    4 : ShowMessage('Not a Valid file name = ' + S);
    5 : ShowMessage('Invalid Path = ' + S);
    6 : ShowMessage('Invalid Drive Specified' + S);
    7 : ShowMessage('Invalid Path Specified ' + S);
    8 : ShowMessage('Directory exists ' + S);
    9 : ShowMessage('Unable to create directory ' + S);
   10 : ShowMessage('Invalid characters in Path ' + S);
   11 : ShowMessage('Invalid Pin Number ' + S);
   12 : ShowMessage('Not allowed to delete the last MAIN menu item');
   13 : ShowMessage('Not allowed to delete the last MAIN menu item');
   14 : ShowMessage('Error: Tag not in MM file ');
   15 : ShowMessage('There are no Sub-menu items.');
   16 : ShowMessage('File not Found ' + S);
   17 : ShowMessage('Error loading ' + S);
   18 : ShowMessage('No entry selected from LBSub.');
   19 : ShowMessage(S + ' is not a Sub-menu tag.' + ' Sub-menu tags are noted by Tagname,doublex.');
   20 : ShowMessage('Not allowed to delete the active DataSet ' + S);
   21 : ShowMessage('There can be ONLY 1 item in LBX listbox.');
   22 : ShowMessage('This is the DataSet Pin ' + S);
   23 : ShowMessage('There is nothing to edit.');
   24 : ShowMessage('Unable to locate ' + S + ' to delete DataSet.');
  end;
   if AMode = 1 then begin btnCancelClick(Nil); end;
 end;

 Procedure TForm1.VerifyInstallPath;
  Var
   Found : Boolean = False;
   Path  : String;
  begin
   Path := INSTALLPATH + 'QuickList.exe';
   Found := FileExists( Path );
   if ( Not Found ) then begin Halt; end;
 end;

{ AAA  L O A D  F I L E S  And  A R R A Y S}
 procedure TForm1.LoadFilesAndArrays;
  Var
   Path : String;
  begin
   Path := DATASETPATH + 'dumps';
   if DirectoryExists(Path) then begin DeleteDirectory( Path, True ); end;
   Indexes;
   btnToCVSClick(Nil);
   LoadItems;
   end;

 procedure TForm1.LoadItems;
  Var Path : String;
  begin
   Listbox2.Clear;
   Path := FILESPATH + 'items.txt';
   if FileExists(Path) then begin
      Listbox2.Sorted := True;
      FileToListbox( Path, Listbox2 );
      Listbox2.Sorted := False;
      ListBox2.Items.Insert( 0 , 'None' );
   end else
      Listbox2.Items.Add('None');
   end;

 { AAA  I N D E X E S}
 procedure TForm1.Indexes;
  begin
  {Start                                   }
  {Load MM.txt to LBWork                   }
  {Generate MMidx array                    }
  { Calculate GMMTOTLINES, GMMPAGE         }
  { Post to display.                       }
  { Save mm.txt to dumps sub-directory.    }
   Set4Boxes(5);  Set4Boxes(3);
   FileToListbox(  MMTXTPath, LBWork );
   if TestSw then begin Application.ProcessMessages; end;
   GenericArrayLoad(MM, LBWork, True );
   GMMTotLines := High( MM ) + 1;
   GMMPAGES := CalcPageCount( GMMTotLines );
   GMMPage := 1;
   PostPageLabels( GMMPage, GMMPAGES );
   if TestSw then begin Application.ProcessMessages; end;
   VerifyMMTags;
   if TestSw then begin Application.ProcessMessages; end;

   GenericArrayLoad(AllTAGS, LBSUB, True );
   if TestSw then begin Application.ProcessMessages; end;
   Edit1.Text := '';
   Set4Boxes(5);
   LBoxToFile( ALLTAGFILE, LBSUB);

  end;

 procedure TForm1.VerifyMMTags;
  Var i : Integer;
   Found : Boolean = False;
   FMt,ATag,TheTAg : String;
   Path,Path2,Id : String;
   RBSs : RawByteString;
   begin
    for i := 0 to LBWork.Items.Count -1 do begin
       {TheTag = 'Autos And Trailers'}
       TheTag := LBWork.Items[i];
       ATag := TheTag + Ext;
       {'D:\qlui\house\content\hvac.txt'   }
       Path := CONTENTPATH + ATag;
       Path := SetItem(1,Path);
       Found := FileExists( Path );
       if Found then begin
          FMT := TheTag + ',' + 'content';
          LBSub.Items.Add( FMT );
          if TestSw then begin Application.ProcessMessages; end;
          Continue;
       end;
        //**
       {Test for a Doublex file}
       Id := Copy(TheTag,1,1);
       ATag := Id + TheTag;
       Path2 := DOUBLEXPATH + ATag + Ext;

       {'D:\qlui\house\doublex\AAutos' }
       Path2 := SetItem(1,Path2);
       Found := FileExists( Path2 );
       if Found then begin
          FMT := TheTag + ',' + 'doublex';
          LBSUB.Items.Add( FMT );
          if TestSw then begin Application.ProcessMessages; end;
          {Verify Doublx Directory}
          RBSs := CONTENTPATH + TheTag;
          RBSs := SetItem(0,RBSs);
          {rawbytestring($00000000015D10B8)  'D:\house\content\autosandtrailers'}
          Found := VerifyDoubleXDirectory(RBSs);
          if Found then begin
             Set4Boxes(4);
             FileToListBox( Path2, Listbox1);
             if TestSw then begin Application.ProcessMessages; end;
             Found := VerifyDoublexFiles( TheTag, RBSs );
          end;
       end;
   end;
 end;

 function TForm1.VerifyDoubleXFiles(ADIR : String; APATH : RawByteString) : Boolean;
  var i : Integer;
   AFile : String;
   TheTag: String;
   TheDir: String;
   Path  : String;
   Good  : Boolean = False;
  begin
   for i := 0 to ListBox1.Items.Count - 1 do begin
       AFile := Listbox1.Items[i];
       TheTag := AFile;
       AFile := AFile + Ext;
       Path := APath + '\' + AFile;
       if TestSw then begin Application.ProcessMessages; end;
       Path := SetItem(1,Path);
       TheDir := SetItem(0,ADir);
       if FileExists( Path ) then begin
          {PlaceHolders,autosandtrailers}
          LBSub.Items.add(TheTag + ',' + TheDir);
          Good := True;
       end else begin
         ValidationMessages(16, AFile,1);
       if TestSw then begin Application.ProcessMessages; end;
    end;
  end;
   Result := Good;
 end;

 Function TForm1.VerifyDoubleXDirectory(APATH : RawByteString) : Boolean;
  var
   Path : RAwByteString;
   Found : Boolean = False;
  begin
   Found := DirectoryExists( APATH );
   if Not Found then begin
      MkDir(APATH);
      Path := APATH + '\PlaceHolder.txt';
      M1.Clear;
      M1.Lines.Add('*M1');
      M1.Lines.SaveToFile( Path );
      Found := True;
   end;
   Result := found;
  end;

Procedure TForm1.RecursiveSearch( ADIR : String; AMask : String; AFLAG : Boolean; ABOX : TListbox);
 var TList : TStringList;
 begin
  TList := TStringList.Create;
  try
    FindAllFiles(TList, ADir, AMASK, AFlag);
    ABox.Items.Assign(  TList  );
  finally
    TList.Free;
  end;
 end;

{ AAA  U I M G R  }
procedure TForm1.UIMGR(AMODE : String);
 Var T  : Integer = 451;
     L  : Integer = 418;
     LL : Integer = 368;
     LLL : Integer = 500;
 begin

  Case AMODE of
        'A' : begin
               LBxx1.Caption       := 'RUN';
               btnNext.Left        := LL;
               btnSubNext.Left     := LL;
               BtnPrev.Left        := LLL;
               BtnSubPrev.Left     := LLL;
               LBLPage.Left        := 552;
               btnOf.Left          := 605;
               LBLTotalPages.Left  := 622;
               LBLPage.Top         := T;
               BtnPrev.Top         := T;
               btnNext.Top         := T;
               btnSubNext.Top      := T;
               BtnSubPrev.Top      := T;
               btnPages.Top        := T;
               btnSub.Top          := T;
               btnPages.Left       := L;
               btnSub.Left         := L;
               M1.Left             := 24;
               Grid1.Visible       := False;
               MX.Top              := 0;
               MX.Left             := 2;
               Listbox4.Top        := 8;
               Listbox4.Left       := 310;
               Listbox4.Height     := 420;
               Image1.Top          :=  8;
               Image1.Left         := 48;
               M1.Top              := 11;
               M1.Left             := 16;
               PrepSplash( 1 );
               btnExecute.Font.Color := CLBlack;
               THESPLASH           := True;
              end;

    'CON'   : begin
               Form1.Constraints.MaxWidth:=1800;
               Form1.Constraints.MinWidth:=1800;
               Form1.Width:=1800;
              end;

   'COFF' : begin
             Form1.Constraints.MaxWidth:=1200;
             Form1.Constraints.MinWidth:=1200;
             Form1.Width:=1200;
            end;

'AuditOn' : begin
                PrepSplash( 0 );
                CLEARSTATUS := 'AUDIT';
                LBxx1.Caption := CLEARSTATUS;
                LocksSetMode( 'AUDIT' );
                Set4Boxes( 6 );
                Set4Boxes(14);
                M1.Visible := False;
                ListBox4.Visible := TRue;
               end;

'AuditOff': begin
                Edit1.Text := '';
                ListBox4.Visible := False;
                Set4Boxes(14);
                M1.Visible := True;
                PrepSplash( 1 );
                end;

  'Grid1' : begin
                Grid1.Clear;
                Grid1.Top := 45;
                Grid1.Height :=  380;
                Grid1.Left := 200;
                Grid1.Width := 550;
                Grid1.Visible := True;
             end;

   'Grid2': begin
               Grid1.Clear;
               Grid1.Top := 45;
               Grid1.Height :=  380;
               Grid1.Left := 120;
               Grid1.Width := 950;
               Grid1.Visible := True;
              end;

'GridPark':  begin
                Grid1.Clear;
                Grid1.Top := 373;
                Grid1.Height :=  20;
                Grid1.Left := 1656;
                Grid1.Width := 32;
                Grid1.Visible := False;
              end;

   'Z'    : begin
             {Set TForm1 Default Width}
             Form1.Constraints.MaxWidth:=1800;
             Form1.Constraints.MinWidth:=1800;
             Form1.Width:=1800;
            end;
  end;
    Application.ProcessMessages;
 end;

function TForm1.SearchAllTAGS( ATAGDir : String; out S : String) : Boolean;
 Var i     : Integer;
  ArrayTag : String;
  Found : Boolean = False;
 begin
  for i := Low(ALLTAGS) to High(ALLTAGS) do begin
      ArrayTag := ALLTAGS[i];
      ArrayTag := SetItem(0,ArrayTag);
      if ATAGDir = ArrayTag then begin
         S := ArrayTag;
         Found := True;
         Break;
       end;
  end;
   Result := Found;
  end;

 function TForm1.SearchLBWorkForDuplicates(ATAG : String; out X : Integer) : Boolean;
  Var i : Integer;
   S    : Boolean = False;
   LBItem, TheTag : String;
  begin
   if LBWork.Items.Count = 0 then begin exit; end;
   TheTag := LowerCase(ATag);
   for i := 0 to LBWork.Items.Count - 1 do begin
       LBItem := LowerCAse(LBWork.Items[i]);
       if LBItem = TheTag then begin S := True; X := i; break; end;
   end;
    Result := S;
 end;

 function TForm1.SearchLBWorkForSubTag(THETAG : String) : Boolean;
  Var i : Integer;
   LBItem,ATag : String;
   S : Boolean = False;
  begin
   ATag := SetItem(0,THETAG);
   for i := 0 to LBWork.Items.Count -1 do begin
       LBItem := LBWork.Items[i];
       LBItem := SetItem(0,LBItem);
       if LBItem = ATag then begin S := True; Break; end;
   end;
    Result := S;
 end;

{ AAA  A R R A Y  L O A D S }
 procedure TForm1.GenericArrayLoad(out theArray: TStringArray; aBox: TListBox; aSort: Boolean);
  var i: Integer;
   Item : String;
 begin
  theArray := Nil;
  if aBox.Items.Count = 0 then
    Exit;
    aBox.Sorted := aSort;
    SetLength(theArray, aBox.Items.Count);
    for i := 0 to aBox.Items.Count-1 do begin
        Item := aBox.Items[i];
        if Item = 'SPLASH' then begin ShowMessage(Item); Continue; end;
        theArray[i] := Item;
    end;
 end;

procedure TForm1.LoadSubMenuArray;
 var i : Integer;
  Item : String;
 begin
  i := LBSub.Items.Count;
  SetLength(SubMenu,0);
  SetLength(SubMenu,i);
  if LBSub.Items.Count = 0 then begin exit; end;
  for i := 0 to LBSub.Items.Count -1 do begin
      Item := LBSub.Items[i];
      SubMenu[i] := Item;
  end;
 end;

{ AAA  F i l e  &  L o a d s}
procedure TForm1.DirListToListbox( Const APATH  : String; ABOX : TListbox );
 var  list: TStringList;
 begin
  list := FindAllFiles(APATH,'*', False {don't search in subdirectory});
  ABox.Items := list;
  list.Free;
 end;

 procedure TForm1.FToListbox(AFQP : String; ABOX : TListbox );
  Var
   TList : TStringList;
  begin
  TList := TStringList.Create;
   try
    TList.LoadFromFile(AFQP);
    ABOX.Items.Assign(  TList );
   finally TList.Free; end;
 end;

procedure TForm1.FileToListbox( const AFileName: String; ABOX : TListBox );
 Var Found : Boolean = False;
  const
    U8BOM: String[3] = #$EF#$BB#$BF;
  var
    AFileStream: TFileStream;
    BOMTest: String[3];
 begin
  Found := FileExists(AFileName);
  if Found then begin
    ABox.Clear;
    AFileStream := TFileStream.Create(AFilename, fmOpenRead);
   try
    BOMTest[0] := #3;
    AFileStream.Read(BOMTest[1], 3);
    if BOMTest <> U8BOM then
       {Rewind if no BOM}
       AFileStream.Seek(0, soFromBeginning);
       ABOX.Items.LoadFromStream(AFileStream);
    finally AFileStream.Free; end;
  end;
  if (Not Found) then begin
   ValidationMessages(17, AFileName,1);
  end;
 end;

procedure TForm1.LoadTheSubDir ( Const AFILENAME : String; ABOX : Tlistbox );
 begin
  ABox.Clear;
  DirListToListbox( AFILENAME, ABox );
 end;

{ AAA  F I L E  S A V E}
 procedure TForm1.ListBoxToFile(AFile : String; ABOX : TListbox);
   Var i : integer = -1;
    OutFile : Textfile;
    Line    : String = '';
   begin
    AssignFile(OutFile, AFile);
   Try
    Rewrite(OutFile);
    for i := 0 to ABOX.Items.Count -1 do begin
       Line := ABOX.Items[i];
       Line := Trim(Line);
       WriteLn (Outfile,Line);
   end;
   finally
    CloseFile(OutFile);
  end;
 end;

 procedure TForm1.FileFormater(AFile : String);
  Var i : integer = -1;
   OutFile : Textfile;
   Fld1 : String;
   Fld2 : String;
   Fld3,FMT : String;
  begin
   AssignFile(OutFile, AFile);
  Try
   Rewrite(OutFile);
   for i := 0 to LBWork.Items.Count -1 do begin
       Fld2 := LBWork.Items[i];
       Fld1 := Copy(Fld2,1,25);
       Fld1 := Trim(Fld1);
       Fld2 := '|' + Trim(Fld2);
       Fld3 := Fill(Fld1);
       FMT := Fld1 + Fld3 + Fld2;
       write(outfile,FMT);
    end;
    finally
     CloseFile(OutFile);
   end;
  end;

 function TForm1.Fill(AString : String) : String;
   Var L : Sizeint;
    Lgth : Integer;
     Base : Integer = 38;
     S    : String;
   begin
    Lgth := Length(AString);
    L := Base - Lgth;
    SetLength(S,L);
    Result := S;
   end;

 procedure TForm1.LBoxToFile(AFILENAME : String; ABOX : TListbox);
  begin
  ABOX.Items.SaveToFile(AFILENAME);
 end;

 procedure TForm1.L0Click(Sender: TObject);
  Var S : String;
  begin
   S := L0.Caption;
   S := SetItem(0,S);
   ManageTheRedX(S, I0 );
 end;

 procedure TForm1.L1Click(Sender: TObject);
  Var S : String;
  begin
   S := L1.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I1 );
 end;

 procedure TForm1.L2Click(Sender: TObject);
  Var S : String;
  begin
   S := L2.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I2 );
 end;

 procedure TForm1.L3Click(Sender: TObject);
  Var S : String;
  begin
   S := L3.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I3 );
 end;

 procedure TForm1.L4Click(Sender: TObject);
  Var S : String;
  begin
   S := L4.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I4 );
 end;

 procedure TForm1.L5Click(Sender: TObject);
  Var S : String;
  begin
   S := L5.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I5 );
 end;

 procedure TForm1.L6Click(Sender: TObject);
  Var S : String;
  begin
   S := L6.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I6 );
 end;

 procedure TForm1.L7Click(Sender: TObject);
  Var S : String;
  begin
   S := L7.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I7 );
 end;

 procedure TForm1.L8Click(Sender: TObject);
  Var S : String;
  begin
   S := L8.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I8 );
 end;

 procedure TForm1.L9Click(Sender: TObject);
  Var S : String;
  begin
   S := L9.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I9 );
 end;

 procedure TForm1.L10Click(Sender: TObject);
  Var S : String;
  begin
   S := L10.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I10 );
 end;

 procedure TForm1.L11Click(Sender: TObject);
  Var S : String;
  begin
   S := L11.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I11 );
 end;

 procedure TForm1.L12Click(Sender: TObject);
  Var S : String;
  begin
   S := L12.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I12 );
 end;

 procedure TForm1.L13Click(Sender: TObject);
  Var S : String;
  begin
   S := L13.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I13 );
 end;

 procedure TForm1.L14Click(Sender: TObject);
  Var S : String;
  begin
   S := L14.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I14 );
 end;

 procedure TForm1.L15Click(Sender: TObject);
  Var S : String;
  begin
   S := L15.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I15 );
 end;

 procedure TForm1.L16Click(Sender: TObject);
  Var S : String;
  begin
   S := L16.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I16 );
 end;

 procedure TForm1.L17Click(Sender: TObject);
  Var S : String;
  begin
   S := L17.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I17 );
 end;

 procedure TForm1.L18Click(Sender: TObject);
  Var S : String;
  begin
   S := L18.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I18 );
 end;

 procedure TForm1.L19Click(Sender: TObject);
  Var S : String;
  begin
   S := L19.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I19 );
 end;

 procedure TForm1.L20Click(Sender: TObject);
  Var S : String;
  begin
   S := L20.Caption;
   S := SetItem(0,S );
   ManageTheRedX(S, I20 );
 end;

 {AAA  C L I C K S}
procedure TForm1.ListBox1Click(Sender: TObject);
 Var i : Integer;
  Item : String;
 begin
  i := ListBox1.ItemIndex;
  if i = -1 then begin exit; end;
  Item := Listbox1.Items[i];
  LBWork.Items.Add(Item);
 end;

{ AAA  D I S P L A Y S}
procedure TForm1.DisplayItem(ACB : Integer; ALabel : String);
 begin
  Case ACB of
    0 : begin
         L0.Caption := ALabel;
         L0.Visible := True;
        end;

    1 : begin
         L1.Caption := ALabel;
         L1.Visible := True;
        end;

    2 : begin
         L2.Caption := ALabel;
         L2.Visible := True;
        end;

    3 : begin
         L3.Caption := ALabel;
         L3.Visible := True;
        end;

    4 : begin
         L4.Caption := ALabel;
         L4.Visible := True;
        end;

    5 : begin
         L5.Caption := ALabel;
         L5.Visible := True;
        end;

    6 : begin
         L6.Caption := ALabel;
         L6.Visible := True;
        end;

    7 : begin
         L7.Caption := ALabel;
         L7.Visible := True;
        end;

    8 : begin
         L8.Caption := ALabel;
         L8.Visible := True;
        end;

   9  : begin
          L9.Caption := ALabel;
         L9.Visible := True;
        end;

   10 : begin
         L10.Caption := ALabel;
         L10.Visible := True;
        end;

   11 : begin
          L11.Caption := ALabel;
         L11.Visible := True;
        end;

   12 : begin
         L12.Caption := ALabel;
         L12.Visible := True;
        end;

   13 : begin
         L13.Caption := ALabel;
         L13.Visible := True;
        end;

   14 : begin
         L14.Caption := ALabel;
         L14.Visible := True;
        end;

   15 : begin
         L15.Caption := ALabel;
         L15.Visible := True;
        end;

   16 : begin
         L16.Caption := ALabel;
         L16.Visible := True;
        end;

   17 : begin
         L17.Caption := ALabel;
         L17.Visible := True;
        end;

   18 : begin
         L18.Caption := ALabel;
         L18.Visible := True;
        end;

   19 : begin
         L19.Caption := ALabel;
         L19.Visible := True;
        end;

   20 : begin
         L20.Caption := ALabel;
         L20.Visible := True;
        end;
  end;
  if TestSw then begin Application.ProcessMessages; end;
  end;

 procedure TForm1.HideCB( ALABEL : TLabel);
  const
   BASE = 'L';
  Var
   S, TheName:  String;
   I : Integer;
   AC : TComponent;
  begin
      { Get the name of the TLabel L0..L20 }
      TheName := StringReplace(ALabel.Name, 'L', 'I', [rfIgnoreCase]);
      { Now find all L0 and set to  Visible := False}
      for i := 0 to 20 do begin
        S := BASE + IntToStr(I);
        AC := FindComponent(S);
        if AC is TLabel then
	  {Is it the TLabel?}
          if SameText(S, TheName) then
	     {if so, put the X in it}
             TLabel(AC).Visible := False
          else
	    {otherwise, Likewise }
            TStaticText(AC).Visible := False;
      end;
    end;

{ AAA  B U T T O N S}
 procedure TForm1.btnAuditClick(Sender: TObject);
  begin
  if LOCKS[0] then begin exit; end;
  LocksSetMode('AUDIT');
  Audit;
 end;

 procedure TForm1.btnDeleteClick(Sender: TObject);
  Var// i : Integer;
   RBSs : RawByteString;
   Path,ATag, ADir, M1Path,ID : String;
   Item : String;
  begin
  {m1.txt, dooublex file item}
  if Locks[25] then begin exit; end;
  LocksSetMode('DELETES');
  Set4Boxes(5);
  ATag := lblATag.Caption;
  ADir := lblDir.Caption;
  Item := Atag + ',' + ADir;
  {Delete a Sub Dir}
  if (ATag <> CNIL) And (ADir = 'doublex') then begin
     Path := GetADoublexPath( Path, RBSs );
     FileToListbox( RBSs, LBWork );
     btnExecute.Font.Color := CLRed;
  end else if (ATag <> CNIL) And  (ADir = 'content') then begin;
       Item := Atag + ',' + ADir;
       FileToListbox( MMTXTPath, LBWork);
       btnExecute.Font.Color := CLRed;
  end else if (ATAg <> CNIL) And (ADir <> CNIL) then begin
       Item := Atag + ',' + ADir;
       Path := GetADoublexPath( Path, RBSs );
       FileToListbox( RBSs, LBWork );
       btnExecute.Font.Color := CLRed;
  end;
  if TestSw then begin Application.ProcessMessages; end;
 end;

 procedure TForm1.btnExecuteClick(Sender: TObject);
 begin
  if Locks[14] then begin exit; end;
  Execute;
 end;

 procedure TForm1.btnXItemsClick(Sender: TObject);
  begin
   if Locks[32] then begin exit; end;
   LocksSetMode('XITEMS');
   Listbox2.OnDblClick := @ListBox2DblClick;
  end;

 procedure TForm1.btnEditClick(Sender: TObject);
  Var
   ADir : String;
   Item,Item2 : String;
   Found : Boolean = False;
  begin
   if Locks[27] then begin exit; end;
   {SPLASH, Count = 0, Tag,doublex }
   Set4Boxes(6);
   Item := Trim(lblATag.Caption) + ',' + Trim(lblDir.caption);
   ADir := Trim(lblDir.caption);
   Found := SearchAllTAGS( Item, Item2 );
   if (Not Found) or (ADir = 'doublex') then begin ValidationMessages(23, '', 1); exit; end;
   LocksSetMode('EDIT');
   LBX.Items.Add(Item);
   Locks[17] := True;
   btnFile.Font.Color := CLRED;
 end;

 procedure TForm1.btnFileClick(Sender: TObject);
  begin
   if LOCKS[2]  then begin exit; end;
   FileContent('');
  end;

 procedure TForm1.btnNewClick(Sender: TObject);
  begin
  if Locks[1] then begin exit end;
  LocksSetMode('NEW');
  Set4Boxes(6);
  if TestSw then begin Application.ProcessMessages; end;
  lblDir.Caption := 'content';
  FileToListBox( MMTXTPath, LBWork );
  btnExecute.Font.Color := CLRed;
 end;

 procedure TForm1.btnNewSIClick(Sender: TObject);
  Var ATag, ADir : String;
   Path : String;
   RBSs : RawByteString;
  begin
   if Locks[10] then begin exit; end;
   ADir := lblDir.Caption;
   ATag := lblATag.Caption;
   if ( ATag <> CNIL ) And ( ADir = 'doublex' ) then begin
      Set4Boxes(2);
      LocksSetMode('NEW SI');
      Path := GetADoubleXPath(ATag,RBSS);
      FileToListbox( Path, LBWork);
      btnExecute.Font.Color := CLRed;
   end;
 end;

 procedure TForm1.btnNewDSClick(Sender: TObject);
  Var Found   : Boolean = False;
   Pin : String[4];
  begin
   if Locks[30] then begin exit; end;
   LocksSetMode('NEW DS');
   if TestSw then begin Application.ProcessMessages; end;
   Set4Boxes(6);
   if Form1.Width = 1200 then begin btnSidebarClick(Nil); end;
   Found := FileExists( CONFIG );
   if ( Not Found )then begin btnCancelClick(Nil); exit; end;
   FileToListbox( CONFIG, LBWork );
   Pin := RequestInput(650, 750, 305, 'Required', '4 digit Pin');
   Pin := Trim(Pin);
   TMPPIN := ValidateFourDigetPin(Pin);
   if TMPPIN = 'Nil'  then begin ValidationMessages(11, PIN,1); exit; end;
   btnExecute.Font.Color := CLRed;
  end;

 procedure TForm1.btnNewSubClick(Sender: TObject);
  begin
   if Locks[31] then begin exit; end;
   LocksSetMode( 'NEW SUB' );
   SEt4Boxes(6);
   FileToListBox(ALLTAGFile,LBWork);
   SplitFilebyChar(LBWork,LBSUB,Listbox1);
   lblATag.Caption := '----';
   lblDir.Caption :=  '----';
   btnExecute.Font.Color := CLRed;
 end;

 procedure TForm1.btnRenameClick(Sender: TObject);
  Var
   ADir,ATag : String;
   Path      : String;
   RBSs      : RawByteString;
   Found     : Boolean = False;
  begin
   if Locks[23] then begin exit; end;
   LocksSetMode('RENAME');
   Set4Boxes(7);
   ATag := Trim(lblATag.Caption);
   ADir := Trim(lbldir.Caption);
   if (ATag = CNIL) and (ADir = CNIL) Then begin btnCancelClick( Nil); exit; end;
   {Content}
   if ADir = 'content' then begin
      {Tag in MM file and M1.txt}
      FiletoListbox( MMTXTPath, LBWork);
      Found := True;
   end;

   if Not Found then begin
      if (ATag = CNil) and ( ADir <> CNIL) then begin
      {  }
      Path := GetADoublexPath(ADir,RBSs);
      if FileExists(Path) then begin
         FiletoListbox( Path, LBWork);
         Found := True;
      end;
   end;
  end;

   {SUB}
   if Not Found then begin
      if (GButton = Sub) and (ATag = CNIL) and (ADir <> CNIL) then begin
         RBSs := CONTENTPATH + ADir;
         RBSs := SetItem(1,RBSs);
         if DirectoryExists(RBSs,True) then begin
            FileToListbox(AllTagFile, LBWork);
            SplitFilebyChar(LBWork,LBSub,Listbox1);
            LBX.Items.Add(ADir);
            Found := True;
         end;
      end;
   end;

   if Not Found then begin
      if (ADir = 'doublex') and (ATag <> CNIL) then begin
         Found := True;
         LBX.Items.Add(ATag + ',' + ADir);
      end;
   end;

   if TestSw then begin Application.ProcessMessages; end;
   if Not Found then begin
      Path := GetADoublexPath(ADir,RBSs);
      if FileExists( Path ) then begin
         FiletoListbox( Path, LBWork );
         Found := True;
      end
   end;


   if TestSw then begin Application.ProcessMessages; end;
   if Not Found then begin
      btnCancelClick(Nil);
      exit;
   end;
  btnExecute.Font.Color := CLRed;
 end;

 function Tform1.CheckForDuplicateTag(ATAG : String) : Boolean;
  Var i : Integer;
   S : Boolean = True;
   Item,TheTag : String;
   begin
    TheTag := ATAG;
    TheTag := SetItem(0,TheTag);
    for i := Low(AllTags) to High(AllTags) do begin
        Item := AllTags[i];
        Item := SetItem(0,Item);
        if Item = TheTag then begin
           S := False;
           Break;
        end;
   end;
    Result := S;
  end;

 procedure TForm1.btnSaveHelpClick(Sender: TObject);
  Var Path : String;
   FName   : String;
   Item    : String;
  begin
   if btnHelp.Caption = 'Help' then begin exit; end;
   FName := M2.Lines[0];
   Item := Copy2SpaceDEl(FName);
   FName := Trim(FName);
   Path := LOC + 'help\' + FName;
   Path := SetItem(1,Path);
   M2.Lines.SaveToFile( Path );
 end;

{ AAA  S E T*}
 procedure TForm1.btnSetClick(Sender: TObject);
  Var i : Integer;
   Path : String;
   LBItem : String;
  begin
   if Locks[5] = True then begin exit; end;
   LocksSetMode('ANIL');
   i := LBWork.ItemIndex;
   if i = -1 then begin exit; end;
   LBItem := LBWork.Items[i];
   DS := Copy2Symb( LBItem, '|' );
   DS := Trim(DS);
   LBlRoadSign.Caption := DS;
   GPIN := ExtractWord( 3, LBItem,['|']);
   Path := ExtractWord( 2, LBItem,['|']);
   Path := SetItem(1,Path);
   DATASETPATH := Path;
   INSTALLPATH   := LOC;
   HELPPATH      := DATASETPATH + 'help\';
   MMTXTPath     := DATASETPATH + 'files\mm.txt';
   MMTXTPath     := SetItem(1,MMTXTPath);
   FILESPATH     := DATASETPATH + 'files\';
   FILESPATH     := SetItem(1,FILESPATH);
   CONTENTPATH   := DATASETPATH + 'content\';
   CONTENTPATH   := SetItem(1,CONTENTPATH);
   DOUBLEXPATH   := DATASETPATH + 'doublex\';
   DOUBLEXPATH   := SetItem(1,DOUBLEXPATH);
   DUMPSPATH     := DATASETPATH + 'dumps\';
   DUMPSPATH     := SetItem(1,DUMPSPATH);
   ALLTAGFILE    := DATASETPATH + 'files\alltags.txt';
   ALLTAGFILE    := SetItem(1,ALLTAGFILE);
   CONFIG        := INSTALLPATH + 'files\config.txt';
   CONFIG        := SetItem(1,CONFIG);
   LBxx1.Caption := CLEARSTATUS;

   if ( Not FileExists( MMTXTPath ) ) then begin exit; end;
   {Load Files}
   LoadFilesAndArrays;
   CLEARSTATUS   := 'RUN';
   LocksSetMode( 'RUN' );
   if (Not THESPLASH) then begin PrepSplash(1); end;
   Set4Boxes(6);
   StAudit.Caption := '-----------';
   TheRouter( 'FC', '' );
  end;

 procedure TForm1.btnIndexClick(Sender: TObject);
  begin
   if Locks[13] then begin exit; end;
   LocksSetMode('INDEX');
   GridIndex;
  end;

 procedure TForm1.btnShowMMClick(Sender: TObject);
   Var i : Integer;
  begin
   if Locks[21] then begin exit; end;
   GenericShowArray( MM, LBWork );
   i := LBWork.Items.Count;
   Edit1.Caption := 'MM Items Count = ' + IntToStr(i);
  end;

 procedure TForm1.btnShowAllTagsClick(Sender: TObject);
   Var i : Integer;
  begin
   if Locks[28] then begin exit; end;
   LocksSetMode('ALLTAGS');
   GenericShowArray( ALLTAGS, LBWork );
   btnFile.Font.Color := CLBlack;
   i := LBWork.Items.Count;
   Edit1.Caption := 'ALLTAGS Items Count = ' + IntToStr(i);
  end;

 { AAA  TO CVS}
 procedure TForm1.btnToCVSClick(Sender: TObject);
  Var
   Path  : String;
   Found : Boolean = False;
   Item  : String;
  begin
   if Locks[20] then begin exit; end;
   {AllTags to CVS file 2 col}
   Set4Boxes(7);
   Found := FileExists( ALLTAGFILE );
   if (Not Found) then begin exit; end;
   FileToListbox(ALLTAGFILE,LBWork);
   if TestSw then begin Application.ProcessMessages; end;
   Item := Trim(LBlRoadSign.Caption);
   Path := DUMPSPATH + 'alltags.cvs';
   if Item = 'Free Pascal' then begin
       LookUpUseClause;
       LBSub.Sorted := True;
       LBSub.Items.SaveToFile( PATH );
   end else begin
       LBWork.Sorted := True;
       LBWork.Items.SaveToFile( PATH );
   end;
   if TestSw then begin Application.ProcessMessages; end;

   {Ref 2 Colums}
   Set4Boxes(7);
   Path := FILESPATH + 'items.txt';
   Path := SetItem(1,Path);
   Found := FileExists( Path );
   if found then begin
      FToListbox ( Path, LBWork );
      TwoColCVS;
      Path := DUMPSPATH + 'ref.cvs';
      LBSUB.Items.SaveToFile( Path );
   end;
   {Credits 3 Cols}
   Set4Boxes(7);
   Path := INSTALLPATH + 'credits\credits.txt';
   Path := SetItem(1,Path);
   Found := FileExists( Path );
   if (Not Found) then begin exit; end;
   FToListbox ( Path, LBWork );
   ThreeColCVS;
   Path := DUMPSPATH + 'credits.cvs';
   LBSUB.Items.SaveToFile( Path );
  end;

 Procedure TForm1.LookUpUseClause;
  Var i  : Integer;
   LBItem, Base, UClause, Path, SubDir, ATag : String;
   begin
   for i := 0 to LBWork.Items.Count -1 do begin
       LBItem := LBWork.Items[i];
       if TestSw then begin
        LBWork.ItemIndex:= i;
        ToTop(lBWork);
       end;
       Base   := LBItem;
       ATag := Copy2SymbDel(LBItem, ',');
       SubDir := Trim(LBItem);
       if SubDir = 'doublex' then begin
          LBItem := Base + ',' + 'No reference';
          LBSub.Items.Add(LBItem);
          Continue;
       end else if SubDir = 'content' then begin
          Path := CONTENTPATH + ATag + Ext;
          Path := SetItem(1,Path);
          if FileExists(Path) then begin
            LoadTMemo(Path);
            if TestSw then begin Application.ProcessMessages; end;
            UClause := SearchForUseClause;
            if UClause = CNIL then begin
               LBItem := Base + ',' + 'No reference';
            end else begin
               LBItem := Base + ',' + UClause;
            end;
            LBSub.Items.Add(LBItem);
          end;
       end else begin
          Path := CONTENTPATH + SubDir + '\' + ATag + Ext;
          Path := SetItem(1,Path);
          if FileExists(Path) then begin
           LoadTMemo(Path);
           UClause := SearchForUseClause;
           if UClause = CNIL then begin
            LBItem := Base + ',' + 'No reference';
            LBSub.Items.Add(LBItem);
            if TestSw then begin Application.ProcessMessages; end;
            Continue;
           end;
           LBItem := Base + ',' + UClause;
           LBSub.Items.Add(LBItem);
           if TestSw then begin Application.ProcessMessages; end;
          end;
        end;
       if TestSw then begin Application.ProcessMessages; end;
   end;
 end;

 function TForm1.SearchForUseClause : String;
  Var i,PosA : Integer;
   Line, Trash : String;
   Clause : String = 'Nil';
  begin
   for i := 0 to LBX.Items.Count -1 do begin
       Line := LBX.Items[i];
       Line := Trim(Line);
       PosA := Pos('...',Line);
       if PosA > 0 then begin
          Trash := Copy2SpaceDel( Line );
          Trash := Copy2SpaceDel(Line);
          Clause := Copy2Symb( Line, ';' );
          Break;
       end;
   end;
    Result := Clause;
  end;

 procedure TForm1.LoadTMemo(AFile : String);
  Var TList : TStringList;
  begin
   Set4Boxes(1);
   TList := TStringList.Create;
    Try
     TList .LoadFromFile( AFILE );
     LBx.Items.Assign(  TList );
   finally
     TList .Free;
    end;
    if TestSw then begin Application.ProcessMessages; end;
  end;

 procedure TForm1.btnXDSClick(Sender: TObject);
 begin
  if Locks[29] then begin exit; end;
  LocksSetMode('X DS');
  Set4Boxes(6);
  FileToListbox(Config,LBSub);
  btnExecute.Font.Color := CLRed;
 end;

 function TForm1.SetupNewMemo(ANAME : String): String;
  Var i : Integer;
   Item : string;
   S    : String = '  uses ... ';
   SP   : String = '  ';
   DB   : String;
   FMT  : Integer;
   Base : String = 'PlaceHolder';
  begin
   M1.Clear;
   M1.lines.Add('*M1');
   DB := Trim(LBlRoadSign.Caption);
   DB := LowerCase(DB);
   if DB = 'passwords' then Fmt := 1
   else if DB = 'free pascal' then Fmt := 2
   else Fmt := 3;

   Item := 'None';
   if Listbox2.Items.Count > 0 then begin
      i := ListBox2.ItemIndex;
      if (i <> -1) then begin Item := Listbox2.Items[i]; end;
      if Item = 'None' then begin Item := ''; end;
   end;

   Case Fmt of
    1 : begin
         M1.lines.Add('');
         M1.lines.Add('  Login:    ');
         M1.lines.Add('  Password: ');
        end;

    2 : begin
         if Item <> 'None'then begin Item := S + Item + ';';  M1.Lines.Add(Item);  end;
            M1.Lines.Add(' ');
            M1.Lines.ADD('   ' + ANAME);
         end;

    3 : begin
         Item := SP + Item + Sp;
         M1.Lines.Add('    ');
         M1.Lines.ADD('   ' + ANAME);
         end;
   end;
    M1.BringToFront;
    Result := Base;
  end;

 { AAA CANCEL}
 procedure TForm1.btnCancelClick(Sender: TObject);
  begin
   if Locks[3] then begin exit; end;
   Set4Boxes(7);
   lblATag.Caption := '----';
   LBLMemoName.Caption :=  '---';
   M1.Clear;
   if Listbox2.Items.Count <> 0 then begin
      Listbox2.ItemIndex := 0;
      Listbox2.Selected[0] := False;
   end;
  CLEARSTATUS := Trim(CLEARSTATUS);
  Case  CLEARSTATUS of
   'AUDIT'    : begin
                 UIMGR('AuditOff' );
                 UIMGR('GridPark');
                end;


    'EDIT'    : Locks[17] := False;

   'CREDITS'  : UIMGR('GridPark');

   'INDEX'    : begin
                 GridHeading.Visible := False;
                 UIMGR('GridPark');
                end;

   'NEWSUB'   : LocksSetMode( 'RUN' );

  end;
  LocksSetMode( 'RUN' );
  Edit1.Text := '';
  UpDateUI( I0, True );
  btnExecute.Font.Color := CLBlack;
  btnFile.Font.Color := CLBlack;
  if Not THESPLASH then begin PrepSplash(1); end;
 end;

 procedure TForm1.btnAddItemsClick(Sender: TObject);
  begin
   if Locks[7] then begin exit; end;
   LocksSetMode('ADDITEM');
   AddItems;
   btnCancelClick(Nil);
 end;

 procedure TForm1.btnCopyRightClick(Sender: TObject);
  Var
   Path    : String;
   TList   : TStringList;
  begin
   if lOCKS[12] then begin exit; end;
   Path := DATASETPATH + 'ref/gnu.txt';
   if FileExists(Path) then begin
     TList := TStringList.Create;
     TList.LoadFromFile( Path );
     M1.Clear;
     M1.Lines.AddStrings(TList, True);
     TList.Free;
   end;
 end;

 procedure TForm1.btnCreditsClick(Sender: TObject);
  begin
   if Locks[24] then begin exit; end;
   LocksSetMode('CREDITS');
   Credits;
  end;

 procedure TForm1.LBSubClick(Sender: TObject);
  Var i : Integer;
   Item : String;
 begin
  i := LBSUB.ItemIndex;
  if i = -1 then begin exit; end;
  Item := LBSUB.Items[i];
  LBX.Items.Add(Item);
 end;

 procedure TForm1.ListBox2DblClick(Sender: TObject);
  Var i : Integer;
   Item : String;
  begin
   if Listbox2.Count = 0 then begin exit; end;
   i := Listbox2.ItemIndex;
   if i = -1 then begin exit; end;
   Item := Listbox2.Items[i];
   if (Item = 'None') And (Listbox2.Items.Count = 1) then begin exit; end;
   Listbox2.Items.Delete(i);
 end;

 procedure TForm1.btnDataSetClick(Sender: TObject);
  Var Path : String;
  begin
   if Locks[15] = True then begin exit; end;
   Set4Boxes( 5 );
   Path := LOC + '\files\config.txt';
   Path := SetItem(1,Path);
   FileToListBox( Path, LBWork );
 end;

 procedure TForm1.btnSidebarClick(Sender: TObject);
  begin
   if ( Content)  then begin
     UIMGR( 'COFF' );
     CONTENT := False;
   end else if (Not CONTENT ) then begin
    UIMGR( 'CON' );
    CONTENT := True;
   end;
  end;

 procedure TForm1.btnHelpClick(Sender: TObject);
  Var
   Path : String;
  begin
   CLEARSTATUS := Trim(CLEARSTATUS);
   if btnHelp.Caption = 'Help' then begin
      btnHelp.Caption := '*Help';
   end else if btnHelp.Caption = '*Help'  then begin
      M2.Clear;
      btnHelp.Caption := 'Help';
      M2.Visible := False;
      exit;
   end;

   Case CLEARSTATUS of
    'AUDIT'     : Path := INSTALLPATH + 'help\audit.txt';
    'RUN'       : Path := INSTALLPATH + 'help/run.txt';
    'CREDITS'   : Path := INSTALLPATH + 'help/credits.txt';
    'DELETES'   : Path := INSTALLPATH + 'help/deletes.txt';
    'EDIT'      : Path := INSTALLPATH + 'help/edit.txt';
    'FILE'      : Path := INSTALLPATH + 'help/file.txt';
    'NEW'       : Path := INSTALLPATH + 'help/new.txt';
    'NEW DS'    : Path := INSTALLPATH + 'help/newds.txt';
    'NEWSUB'    : Path := INSTALLPATH + 'help/newsub.txt';
    'NEW SI'    : Path := INSTALLPATH + 'help/newsi.txt';
    'RENAME'    : Path := INSTALLPATH + 'help/rename.txt';
    'X DS'      : Path := INSTALLPATH + 'help/xds.txt';
    'NIL'       : Path := INSTALLPATH + 'help/nil.txt';
    'ADDITEM'   : Path := INSTALLPATH + 'help/additems.txt';

   end;
    Path := SetItem(1,Path);
    if (Not FileExists( Path )) then begin
     Path := SetItem(1,Path);
     Path := INSTALLPATH + 'nohelp.txt';
    end;
    M2.Lines.LoadFromFile( Path );
    M2.Visible := True;
   end;

 procedure TForm1.btnMemoClick(Sender: TObject);
  begin
   if LOCKs[10] then begin exit; end;
   If ( Not THESPLASH ) then begin  PrepSplash( 1 ); end;
   GMEMO := CNIL;
   TheRouter( 'FC', '' )
  end;

 procedure TForm1.btnNextClick(Sender: TObject);
  Var
   S1 : String;
   TPage : Integer;
  begin
   If Locks[18] then begin exit; end;
   S1 := LBLPage.Caption; S1 := Trim( S1 ); TPage := StrToInt( S1 );
   Inc(TPage);
   if TPage > GMMPAGES then begin exit; end;
   GMMPAGE := TPage;
   PostPageLabel( GMMPAGE );
   UpDateUI( I0, True );
   MManager( GMMPAGE );
 end;

 procedure TForm1.btnPagesClick(Sender: TObject);
  begin
   if Locks[9] = True then begin exit; end;
   if Not THESPLASH then begin PrepSplash ( 1 ); end;
   InstallButton( Pages );
   TheRouter( 'FC', '' );
 end;

 procedure TForm1.BtnPrevClick(Sender: TObject);
  Var
   S1 : String;
   TPage : Integer;
  begin
   if Locks[19] then begin exit; end;
   S1 := LBLPage.Caption; S1 := Trim( S1 ); TPage := StrToInt( S1 );
   Dec( TPage );
   if (TPage = 0)  then begin exit; end;
   GMMPAGE := TPage;
   PostPageLabel( GMMPAGE );
   UpDateUI( I0, True );
   MManager( GMMPAGE );
  end;

 procedure TForm1.TwoColCVS;
  Var i  : Integer;
   HItems : Integer;
   Item  : String;
   Item2 : String;
   LBCNT : Integer = -1;
  begin
   Hitems := LBWork.Items.Count div 2;
   Dec(HItems);
   for i := 0 to Hitems do begin
       Item := LBWork.Items[i];
       Listbox1.Items.Add( 'Reference: ' + Item + ',');
     end;
   Inc(Hitems);
   for i := Hitems to LBWork.Items.Count -1 do begin
       Item := LBWork.Items[i];
       LBX.Items.Add( 'Reference: ' + Item);
   end;
   LBCNT := LBX.Items.Count;
   for i := 0 to Listbox1.Items.Count -1 do begin
       Item := Listbox1.Items[i];
       if i > LBCNT - 1 then begin
          LBSub.Items.Add(Item);
       end else begin
           Item2 := LBX.Items[i];
           LBSub.Items.Add(Item +  Item2);
       end;
   end;
  end;

 procedure TForm1.ThreeColCVS;
   Var
//    HItems : Integer;
    Item  : String;
    Item2 : String;
    Item3 : String;
    LBCNT : Integer = -1;
    LBXx   : Integer;
    Done  : Boolean = False;
    x1,x2,x3  : Integer;
   begin
    LBCNT := LBWork.Items.Count -1;
    x1 := -3; x2 := -2; x3 := -1;
    Repeat
     Inc(x1,3); Inc(x2,3); Inc(x3,3);
     if ( x1 = LBCNT ) Or ( x1 > LBCNT ) then begin
        break;
     end;
     Item := LBWork.Items[x1];
     if x2 < LBCNT then begin Item2 := LBWORK.Items[x2]; end;
     if x3 < LBCNT then begin Item3 := LBWORK.Items[x3]; end;
     LBSUB.Items.Add( Item + ',' + Item2 + ',' + Item3);
     LBXx := LBSUB.Items.Count -1;
     LBSUB.ItemIndex := LBXx;
     if TestSw then begin Application.ProcessMessages; end;
    until Done;
 end;

 procedure TForm1.btnSubClick(Sender: TObject);
  begin
  if LOCKS[11] then begin exit; end;
  if ( Not THESPLASH ) then begin PrepSplash( 1 ); end;
   GSPAGE := GSPAGES;
   GMEMO := CNIL;
   PostPageLabels( GSPAGE, GMMPages );
   InstallButton( PAGES );
   Set4Boxes(7);
   TheRouter( 'FC', 'PAGES' );
  end;

 procedure TForm1.btnSubNextClick(Sender: TObject);
  Var
   S1 : String;
   TPage,TPages : Integer;
  begin
   if Locks[21] then begin exit; end;
   S1 := LBLPage.Caption; S1 := Trim( S1 ); TPage := StrToInt( S1 );
   S1 := LBLTotalPages.Caption; S1 := Trim( S1 ); TPages := StrToInt( S1 );
   Inc( TPage );
   if (TPage > TPages ) then begin exit; end;
   GSPAGE := TPAGE;
   PostPageLabel( GSPAGE );
   SubManager( GSPAGE );
  end;


 procedure TForm1.btnSubPrevClick(Sender: TObject);
 Var
  S1 : String;
  TPage : Integer;
 begin
 if Locks[22] then begin exit; end;
  S1 := LBLPage.Caption; S1 := Trim( S1 ); TPage := StrToInt( S1 );
  Dec(  TPage );
  if ( TPage = 0 ) then begin exit; end;
  SubManageTwo( TPage );
  end;

 function TForm1.ValidateFourDigetPin(DSPIN : String) : String;
  Var  i : LongInt;
   Good : Boolean = False;
   X : String;
  begin
   Result := CNIL;
   if Length(DSPIN) <> 4 then begin exit; end;
   Good := TryStrToInt(DSPIN, i);
   if Good then begin X := IntToStr(i); end;
   if Length(x) <> 4 then begin exit; end;
   if ( Not Good ) then begin exit end;
   Result := InttoStr(i);
  end;

 procedure TForm1.btnDumpLBXClick(Sender: TObject);
  Var Path : String;
  begin
   Path := DUMPSPATH + 'lbx.txt';
   LBoxToFile( Path , LBX);
 end;

procedure TForm1.btnDumpLBWorkClick(Sender: TObject);
 Var Path : String;
 begin
 if LBWork.Items.Count = 0 then begin exit; end;
  Path :=  DUMPSPATH + 'lbwork.txt';
  LBoxToFile( Path , LBWork);
 end;

procedure TForm1.btnDumpListbox1Click(Sender: TObject);
 Var Path : String;
  begin
   if Listbox1.Items.Count = 0 then begin exit; end;
   Path :=  DUMPSPATH + 'listbox1.txt';
   LBoxToFile( Path , Listbox1);
 end;

procedure TForm1.btnDubpLb2Click(Sender: TObject);
 Var Path : String;
 begin
  if Listbox2.Items.Count = 0 then begin exit; end;
  Path :=  FILESPATH + 'items.txt';
  LBoxToFile( Path , Listbox2);
 end;

procedure TForm1.btnDumpLBSUBClick(Sender: TObject);
 Var Path : String;
 begin
  if LBSub.Items.Count = 0 then begin exit; end;
  Path :=  DUMPSPATH  + 'lbsub.txt';
  LBoxToFile( Path , LBSUB);
 end;

{ AAA  P A I N T}
 procedure TForm1.FormPaint(Sender: TObject);
  Var   R : Trect;
 begin
  Canvas.Pen.Width := 3;
  Canvas.Pen.Color := clBlack;

 // Canvas.Brush.Color := clLime ;
  Canvas.Brush.Color := $FFFFDD; //pale Blue }

  {All Boxes} { Right Stacked buttons box }

  R.Left := 1050;  R.Right := 1197;
  R.Top  := 8;    R.Bottom := 820;
  Canvas.Rectangle(R);

  {Lower Right Box}
  R.Left := 1205;  R.Right := 1784;
  R.Top := 432;    R.Bottom := 1000; //
  Canvas.Rectangle(R);

 {Upper Right Box}
  R.Left := 1205;  R.Right := 1784;
  R.Top := 8;      R.Bottom := 435;
  Canvas.Rectangle(R);

  {Run Mode}
  R.Left := 1250;        R.Right := 1450;
  R.Top := 25;           R.Bottom := 60;
  Canvas.Rectangle(R);

  Canvas.Brush.Color := clDefault;

{All Buttons}
  R := btnAudit.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnDelete.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnEdit.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnNewDS.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnNewSI.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnFile.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnShowMM.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnShowAllTags.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnToCVS  .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnNewMainTag.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnNewSub.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnRename.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnIndex.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnSidebar.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnXDS.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnClose.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnSet .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnClose.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  {Lower Buttons}
  R := btnCopyRight.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnCredits.BoundsRect ;
  InflateRect(R,4,4);
  Canvas.Rectangle(R);

  R := btnDataSet .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  {Upper Right}

  R := btnAddItems.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnXItems.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnCancel.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnExecute.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := LBlRoadSign .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnHelp.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnDumpLBX .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnDumpLBWork .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnDumpListbox1 .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := btnDumpLBSUB .BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  { Set the fill color  Set the border color   }
  Canvas.Brush.Color := cldefault;
  Canvas.Brush.Style := bsSolid;
  Canvas.Pen.Color := clBlack;
  Canvas.Pen.Width := 5;
  Canvas.Pen.Style := psSolid;

   {Draw Outer Box}

   Canvas.Brush.Color := $FFFFDD; //pale Blue }

 // Canvas.Brush.Color := clLime ;
  R.Left := 342;  R.Right := 690;
  R.Top := 440;    R.Bottom :=496; {Center Control Box}
  Canvas.Rectangle(R);

  Canvas.Brush.Color := cldefault;
 {Draw Next Position}
  R.Left := 366;  R.Right := 412;
  R.Top := 451;    R.Bottom := 487;  {487 }
  Canvas.Rectangle(R);

  {Draw Middle Button Position}
  R.Left := 416;  R.Right := 495;
  R.Top := 451;    R.Bottom := 487;
  Canvas.Rectangle(R);

  {Draw Previous Button Position}
  R.Left := 498;  R.Right := 543;
  R.Top := 451;    R.Bottom := 487;
  Canvas.Rectangle(R);

  {Draw Previous Nbr Position}
  R.Left := 546;  R.Right := 601;
  R.Top := 451;    R.Bottom := 487;
  Canvas.Rectangle(R);

  {Draw Of Button Position}
  R.Left := 603;  R.Right := 627;
  R.Top := 451;    R.Bottom := 487;
  Canvas.Rectangle(R);

  {Draw Left Nbr  Position}
  R.Left := 629;  R.Right := 673;
  R.Top := 451;    R.Bottom := 487;
  Canvas.Rectangle(R);

  {Listboxes}
  R := Listbox2.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := Listbox1.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := LBWork.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := LBX.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := LBSUB.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);

  R := Edit1.BoundsRect ;
  InflateRect(R,2,2);
  Canvas.Rectangle(R);
 end;

 procedure TForm1.btnCloseClick(Sender: TObject);
  begin
   Set4Boxes(6);
   Listbox3.Clear;
   ListBox4.Clear;
   ListBox5.Clear;
   Close;
  end;

end.

