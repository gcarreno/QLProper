unit QLP.Utils.Helpers;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, StrUtils
;

function GetMainMenuPath(const ADataSetPath, AMAinMenu: String): String;

function GetDataSetFilePath(const ADataSetPath, AFilename: String): String;

function GetDataSetContentFilePath(const ADataSetPath, AName: String): String;
function GetDataSetContentDirPath(const ADataSetPath, AName: String): String;

implementation

function GetMainMenuPath(const ADataSetPath, AMAinMenu: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    LowerCase(AMAinMenu));
end;

function GetDataSetFilePath(const ADataSetPath, AFilename: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    'files' +
    DirectorySeparator +
    AFilename + '.txt');
end;

function GetDataSetContentFilePath(const ADataSetPath, AName: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    'content' +
    DirectorySeparator +
    DelSpace(LowerCase(AName)) + '.txt');
end;

function GetDataSetContentDirPath(const ADataSetPath, AName: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    'content' +
    DirectorySeparator +
    DelSpace(LowerCase(AName)));
end;

end.

