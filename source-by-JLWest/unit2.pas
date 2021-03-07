unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms,    Controls, Graphics,
  StdCtrls, StrUtils, Unit1, lazfileutils;

  procedure InitilizeLocks  (AMODE : Boolean);
  procedure LocksSetMode    (AMODE : String );

  function AllCharacters    (Const ASTRING  : String): Boolean;
  function CalcPageCount    ( Const ALINES  : Integer ) : Integer;
  function CalcMMPageIndex  ( Const APAGE   : Integer;
                              Const APages  : Integer;
                              Out FLine     : Integer) : Integer;
  function CalcSUBPageIndex (Const APAGE   : Integer;
                              Const APages  : Integer;
                              Out FLine     : Integer) : Integer;

  function CheckChars       (Const ASTRING : String): Boolean;
  function Count            (What, InWhat: String): Integer;
  function Cut              (APATH : String; ADEL : Char; ACOUNT : Integer) : String;
  function CutOutName       (ANAME : String) : String;
  function ExtractJustTheDir( APATH : String ) : String;
  function FirstCharacter   (Const ASTRING : String): Boolean;
  function IDContent        ( Const AIDLine : String;  Const AMID : String ) : String;
  function SetItem          (AMODE : Integer; ASTRING : String) : String;
  function  SpecialChar     (Const ASTRING : String): Boolean;
  function ValidFileName    ( AName : String) : Boolean;
  function ValidateAbsolutePath( APATH : String;
                                 out S : String;
			         out X : String;
                                 out Y : Integer) : boolean;
  function ValidateItem(AMODE : Integer; AITEM : String; out X : Integer) : BooLean;

 implementation

 function  AllCharacters(Const ASTRING : String): Boolean;
  Var
   Index : Integer = 1;
   AllCHars : Boolean = True;
  begin
  if ASTRING[1] = #32 then begin Result := False; exit; end;
  while Index <= length(ASTRING) do
  if not (ASTRING[Index] in ['A'..'Z', 'a'..'z']) then  begin
     AllCHars := False;
     Result := AllCHars; exit;
  end else inc(Index);
   Result := AllCHars;
  end;

 function  SpecialChar(Const ASTRING : String): Boolean;
  Var
   Index : Integer = 1;
   AllCHars : Boolean = True;
  begin
   while Index <= length(ASTRING) do                   {#45 = '-', #32 = Space}
   if not (ASTRING[Index] in ['A'..'Z', 'a'..'z', '0'..'9', #45, #32]) then  begin
      AllCHars := False;
      Result := AllCHars; exit;
   end else inc(Index);
    Result := AllCHars;
  end;

 function  FirstCharacter(Const ASTRING : String): Boolean;
  Var
   Index : Integer = 1;
   FirstCHars : Boolean = True;
  begin
  if ASTRING[1] = #32 then begin Result := False; exit; end;
  if not (ASTRING[Index] in ['A'..'Z', 'a'..'z']) then  begin
      Result := False; exit;
  end;
    Result := FirstCHars;
 end;


function CalcMMPageIndex ( Const APAGE   : Integer;
                           Const APages  : Integer;
                           Out FLine     : Integer) : Integer;
 Var LLine : Integer = -1;
  begin
   FLine := (APage - 1) * 21;
   LLine := FLine + 21;
   if ( APage = GMMPAGES ) then begin
     LLine := GMMTotLines -1;
   end;
  Result:= LLine;
 end;


function CalcSUBPageIndex ( Const APAGE   : Integer;
                            Const APages  : Integer;
                            Out FLine     : Integer) : Integer;
 Var LLine : Integer = -1;
  Page : Integer;
  begin
   Page := APAGE;
   Dec( Page );
   FLine := Page * 21;
   LLine := FLine + 21;
   if ( APage = GSPAGES ) then begin
     LLine := GSITEMS -1;
   end;
  Result:= LLine;
 end;

function CalcPageCount( Const ALINES : Integer ) : Integer;
 Var S : Integer;
  OddItems : Integer;
  Pages : Integer;
 begin
  OddItems := ALINES Mod 21;
  S := OddItems;
  Pages := ALINES div 21;
  if ODDItems <> 0 then begin Inc(Pages); end;
  Result := Pages;
 end;

 function Count(What, InWhat: String): Integer;
   var    i, k: Integer;
    NoCigar: Boolean;         {H‰3Hd$(^[ÃUH‰ÍHd$àHMø###(gdb unparsed remainder:...)###}
  begin
    Result := 0;
    if Length(What) > Length(InWhat) then Exit;
    if Length(What) = 0 then Exit;
    for i := 1 to Length(InWhat) - Length(What) + 1 do begin
      NoCigar := False;
      for k := 1 to Length(What) do  begin
        if What[k] <> InWhat[k+i-1] then begin NoCigar := True;  Break;  end;
      end;
      if not NoCigar then Inc(Result);
    end;
 end;

 function Cut(APATH : String; ADEL : Char; ACOUNT : Integer) : String;
  Var i : Integer;
   Path, Trash : String;
  begin
   Path := APATH;
   for i := 0 to ACount -1 do begin
       Trash := Copy2SymbDel(Path, ADel);
   end;
    Result := Trash;
 end;

function ExtractJustTheDir( APATH : String ) : String;
 Var i : Integer;
  Item : String;
  PosA : Integer;
  PosB : Integer;
  Trash: String;
 begin
  Item := APATH;
  for i := 0 to Length( APATH ) do begin
      PosA := Pos('/',Item);
      PosB := Pos('\',Item);
      if PosA <> 0 then Trash := Copy2SymbDel(Item,'/')
      else if PosB <> 0 then Trash := Copy2SymbDel(Item,'\');
      if (PosA = 0 ) And ( PosB = 0 ) then begin
         Item := Trim( Trash ); Break;
         Item := Trash;
      end;
  end;
   Result := Item;
 end;
                        {'H'#139']'#160'H'#141'e'}
function IDContent( Const AIDLine : String; Const AMID : String ) : String;
  Var
   S : String;
   M    : String;
  begin
   S := Copy2Space(AIDLine);  M := AMID;
   if ( S = M )      then  S := '1'
   else if (S <> M)  then  S := '2';
   Result := S;
  end;
     {21 btnSubNext}

{0 Audit      } {9  PAGES     } {16 PAGES      } {23 btnRename     } {30 btnNewDS    }
{1 New        } {10 btnNewSi  } {17 Router     } {24 btnCredits    } {31 btnNewSUB   }
{2 Save       } {11 SUB       } {18 btnNext    } {25 btnDelete     } {32 X Items     }
{3 Cancel     } {12 COPY      } {19 btnPrev    } {                 }
{5 Set        } {13 INDEX     } {20 btnToCVS   } {27 btnEdit       }
{6            } {14 btnExecute} {21 btnGenShow } {28 btnShowAllTags}
{7 btnAddItems} {15 btnDataSet} {22 BtnSubPrev } {29 btnX DS       }
{8            }
procedure InitilizeLocks(AMODE : Boolean);
 Var i : Integer;
 begin
  for i := 0 to High(LOCKS) do begin
      LOCKS[i] := AMODE;
  end;
 end;

 procedure LocksSetMode(AMODE : String );
  begin

   Case AMODE of

   'RUN' : begin                        {Normal Run Mode}
            InitilizeLocks(False);
            LOCKS[2] := True;        {Save    }
            Form1.btnExecute.Font.Color := CLBlack;
            CLEARSTATUS             := '     RUN';
            Form1.LBxx1.Caption :=  CLEARSTATUS;
           end;

  'ANIL' : begin                       {ANIL Mode}
            InitilizeLocks(True);
            LOCKS[5]  := False;       {Set     }
            LOCKS[15] := False;       {Data Set}
            LOCKS[20] := False;       {To CVS  }
            CLEARSTATUS          := '      NIL';
            Form1.LBxx1.Caption  := CLEARSTATUS;
           end;

 'AUDIT' : begin                        {AUDIT Mode}
             InitilizeLocks(True);
             LOCKS[3]  := False;      {Cancel   }
             CLEARSTATUS           := '     AUDIT';
             Form1.LBxx1.Caption   := CLEARSTATUS;
           end;

'DELETES': begin                        {Delete Mode}
            InitilizeLocks(True);
            LOCKS[3]  := False;      {Cancel   }
            LOCKS[14] := False;      {Execute  }
            CLEARSTATUS           := '   DELETES';
            Form1.LBxx1.Caption   := CLEARSTATUS;
            end;

 'EDIT'   : begin                       {Edit Mode}
             InitilizeLocks(True);
             LOCKS[2]  := False;     {Save    }
             LOCKS[3]  := False;     {Cancel  }
             CLEARSTATUS          := '     EDIT';
             Form1.LBxx1.Caption  := CLEARSTATUS;
            end;

'FILE'   : begin                        {File Mode}
             InitilizeLocks(True);
             LOCKS[3] := False;      {Cancel  }
             CLEARSTATUS         := '   FILE';
             Form1.LBxx1.Caption := CLEARSTATUS;
           end;

 'NEW'   : begin                        {NEW Mode}
             InitilizeLocks(True);
             LOCKS[2] := False;      {Save    }
             LOCKS[3] := False;      {Cancel  }
             LOCKS[14] := False;     {Execite }
             CLEARSTATUS         := '   NEW';
             Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'NEW SUB': begin                    {NEWSUB Mode}
            InitilizeLocks(True);
            LOCKS[3]  := False;    {Cancel  }
            LOCKS[14] := False;    {Execite }
            CLEARSTATUS         := ' NEWSUB';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'NEW SI' : begin                        {NEW SI Mode}
             InitilizeLocks(True);
             LOCKS[14] := False;      {Execute }
             LOCKS[3]  := False;      {Cancel  }
             CLEARSTATUS           := 'NEW SI';
             Form1.LBxx1.Caption   := CLEARSTATUS;
            end;

'RENAME' : begin                        {Rename Mode}
            InitilizeLocks(True);
            LOCKS[3]  := False;      {Cancel   }
            LOCKS[2]  := False;      {Save     }
            LOCKS[14] := False;      {Execite  }
            CLEARSTATUS         := '  RENAME';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'INDEX' : begin                         {Index Mode}
            InitilizeLocks(True);
            LOCKS[3]  := False;      {Cancel  }
            CLEARSTATUS         := '  INDEX';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'ToCVS'  : begin                        {Index Mode}
            InitilizeLocks(True);
            CLEARSTATUS         := '  INDEX';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'NEW DS' : begin                        {NEW DS Mode}
            InitilizeLocks(True);
            LOCKS[2]  := False;      {Set     }
            LOCKS[3] := False;       {Cancel  }
            LOCKS[14] := False;      {Execite }
            LOCKS[30] := False;      {NewDS   }
            CLEARSTATUS         := '  NEW DS';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'X DS' : begin                          {X DS Mode}
            InitilizeLocks(True);
            LOCKS[3]  := False;      {Cancel  }
//            LOCKS[5]  := False;      {Set     }
            LOCKS[14] := False;      {Execute }
            CLEARSTATUS            := '   X DS';
            Form1.LBxx1.Caption    := CLEARSTATUS;
            end;

'ADDITEM': begin                        {AUDIT Mode}
             InitilizeLocks(True);
             LOCKS[3]  := False;      {Cancel  }
             CLEARSTATUS           := 'ADDITEM';
             Form1.LBxx1.Caption   := CLEARSTATUS;
           end;

 'ITEMS'  : begin                       {ITEMS Mode}
             InitilizeLocks(True);
             LOCKS[3] := False;      {Cancel }
             CLEARSTATUS          := ' ITEMS';
             Form1.LBxx1.Caption  := CLEARSTATUS;
             end;

 'XITEMS'  : begin                      {XITEMS Mode}
             InitilizeLocks(True);
             LOCKS[3] := False;      {Cancel }
             CLEARSTATUS          := '   XITEMS';
             Form1.LBxx1.Caption  := CLEARSTATUS;
            end;

'CREDITS': begin                        {CREDITS Mode}
            InitilizeLocks(True);
            LOCKS[3] := False;       {Cancel  }
            CLEARSTATUS         := '  CREDITS';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;

'ALLTAGS': begin                        {ALLTAGS Mode}
            InitilizeLocks(True);
            LOCKS[3]  := False;      {Cancel}
            LOCKS[2]  := False;      {Save  }
            CLEARSTATUS         := ' ALLTAGS';
            Form1.LBxx1.Caption := CLEARSTATUS;
           end;


    end;
  end;

 function CheckChars(Const ASTRING : String): Boolean;
  Var
   Index : Integer = 1;
   AllCHars : Boolean = True;
  begin
   while Index <= length(ASTRING) do
   if not (ASTRING[Index] in ['A'..'Z', 'a'..'z', '\', '/', ':']) then  begin
      AllCHars := False;
      Result := AllCHars; exit;
   end else inc(Index);
    Result := AllCHars;
   end;

 function CutOutName( ANAME : String) : String;
  Var Nbr : Integer;
   ADelm : Char = '\';
   P     : Integer;
   TheName, Trash : String;
  begin
   Nbr := Count( '/', ANAME );
   if Nbr > 0 then  begin ADelm := '/'
   end else  begin
       Nbr := Count( '\', ANAME );
       if Nbr > 0 then begin ADelm := '\'; end;
   end;
    if Nbr = 0 then begin Result := ANAME; exit; end;
    P := Count('.', ANAME);
    Trash := ReverseString( ANAME );
    { c:\house\tag.txt  C:\house }
    if p > 0 then begin Copy2SymbDel(Trash, ADelm ); end;
    TheName := Copy2SymbDel(Trash, ADelm );
    Result := TheName;
  end;
 
  function SetItem(AMODE : Integer; ASTRING : String) : String;
   Var S : String;
   begin
    S := LowerCase(AString);
    S := DelSpace(S);
    if AMODE = 1 then begin S := ExpandFileName(S); end;
    Result := Trim(S);
   end;

 function ValidFileName( ANAME : String) : Boolean;
  Var S : Boolean = True;
   Item : String;
  begin
   Item := ANAME;
   Item := SetItem(0,Item);
   Case Item of
    'con'  : S := False;
    'prn'  : S := False;
    'aux'  : S := False;
    'nul'  : S := False;
    'nil'  : S := False;
    'com1' : S := False;
    'com2' : S := False;
    'com3' : S := False;
    'com4' : S := False;
    'com5' : S := False;
    'com6' : S := False;
    'com7' : S := False;
    'com8' : S := False;
    'com9' : S := False;
    'lpt1' : S := False;
    'lpt2' : S := False;
    'lpt3' : S := False;
    'lpt4' : S := False;
    'lpt5' : S := False;
    'lpt6' : S := False;
    'lpt7' : S := False;
    'lpt8' : S := False;
    'lpt9' : S := False;
    'placeholder' : S := False;
   end;
    result := S;
  end;

  function ValidateAbsolutePath( APATH : String;
                                 out S : String;            {Name}
 		      	         Out X : String;            {Absolute Path}
                                 out Y : Integer) : boolean;
   Var
    Path      : String;
    Valid     : Boolean = False;
    ValidName : Boolean = False;
    FullPath  : String;
    DirName   : String;
    RBSs      : RawByteString;
  begin

   if ( APath.IsEmpty ) then begin
      Y := 1;
      Result := False;
      exit;
   end;

   Path      := APATH;
   Path      := SetItem(1,Path);
   FullPath  := ExpandFileName(Path);
   DirName   := ExtractFileNameOnly( FullPath );
   Valid     := AllCharacters( DirName );
   if Not Valid then begin
      Y := 4;
      Result := False; exit;
   end;

   if DirectoryExists(FullPath) then begin
      Y := 3;
      Result := False; exit;
   end else begin
      RBSs := FullPath;
      Valid := CreateDir( RBSs );
      if DirectoryExists( RBSs ) then begin
         RemoveDir( RBSs );
      end else begin
        Y := 5;
        Result := False; exit;
      end;
   end;
   Y := 0;
   X := Path;
   S := DirName;
   Form1.LBlRoadSign.Caption := DirName;
   Result := True;
  end;

 { AAA ValidateItem}
 {AMode = 0 FileName, AllCharacters, Duplicates}
 {AMode = 1 FileName               }
 {AMode = 2 AllCharacters          }
 {AMode = 3 Duplicates LBWork      }
 function ValidateItem(AMODE : Integer; AITEM : String; out X : Integer) : BooLean;
  Var
   Valid : Boolean = True;
   ATag,ADir : String;
  begin
   X := 0;
   ADir  := AITEM;
   ADir := SetItem(0,ADir);
   ATag  := Copy2SymbDel(ADir, ',');
   if ATag.IsEmpty then begin Result := False; X := 1; exit; end; ;
   if not (ATag[1] in ['A'..'Z', 'a'..'z']) then  begin Result := False; X := 2; exit; end;
   if ATAg = 'nil' then begin Result := False; X := 2; exit; end;
   if ATag.IsEmpty then begin Result := False; X := 1; exit; end;
   Case AMODE of
    0 : begin
         Valid := ValidFileName(ATag);
         if Not Valid then begin Result := False; X := 4; exit; end;
         Valid := SpecialChar(ATag);
         if Not Valid then begin Result := False; X := 2; exit; end;
         Valid := Form1.CheckForDuplicateTag(AITEM);
         if Not Valid then begin Result := False; X := 3; exit; end;
        end;

    1 : begin
         Valid := ValidFileName(ATag);
         if Not Valid then begin X := 4; end;
        end;

    2 : begin
 	 Valid := AllCharacters(ATag);
         if Not Valid then begin Result := False; X := 2; exit; end;
         end;

    3 : begin
 	 Valid := Form1.CheckForDuplicateTag(AITEM);
         if Valid then begin
            Result := False; X := 3; exit;
         end;
        end;
    end;
   Result := Valid;
  end;

 end.

