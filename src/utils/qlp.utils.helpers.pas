unit QLP.Utils.Helpers;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, StrUtils
;

function GetMainMenuPath(const ADataSetPath, AMAinMenu: String): String;

function GetDataSetFilesPath(const ADataSetPath: String): String;
function GetDataSetFilesFilePath(const ADataSetPath, AFilename: String): String;

function GetDataSetContentPath(const ADataSetPath: String): String;
function GetDataSetContentFilePath(const ADataSetPath, AName: String): String;
function GetDataSetContentDirPath(const ADataSetPath, AName: String): String;

function GetDataSetDoubleXPath(const ADataSetPath: String): String;
function GetDataSetDoubleXFilePath(const ADataSetPath, AName: String): String;
function GetDataSetContentSubFilePath(const ADataSetPath, AMainName,
  ASubName: String): String;

implementation

const
  DatasetFolderFiles = 'files';
  DatasetFolderDoubleX = 'doublex';
  DatasetFolderContent = 'content';
  DatasetFileExtension = '.txt';

function GetMainMenuPath(const ADataSetPath, AMAinMenu: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    LowerCase(AMAinMenu)
  );
end;

function GetDataSetFilesPath(const ADataSetPath: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderFiles
  );
end;

function GetDataSetFilesFilePath(const ADataSetPath, AFilename: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderFiles +
    DirectorySeparator +
    AFilename + DatasetFileExtension
  );
end;

function GetDataSetContentPath(const ADataSetPath: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderContent
  );
end;

function GetDataSetContentFilePath(const ADataSetPath, AName: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderContent +
    DirectorySeparator +
    DelSpace(LowerCase(AName)) +
    DatasetFileExtension
  );
end;

function GetDataSetContentDirPath(const ADataSetPath, AName: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderContent +
    DirectorySeparator +
    DelSpace(LowerCase(AName))
  );
end;

function GetDataSetDoubleXPath(const ADataSetPath: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderDoubleX
  );
end;

function GetDataSetDoubleXFilePath(const ADataSetPath, AName: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderDoubleX +
    DirectorySeparator +
    DelSpace(LowerCase(AName[1])+LowerCase(AName)) + DatasetFileExtension
  );
end;

function GetDataSetContentSubFilePath(const ADataSetPath, AMainName,
  ASubName: String): String;
begin
  Result:= ExpandFileName(
    ADataSetPath +
    DirectorySeparator +
    DatasetFolderContent +
    DirectorySeparator +
    DelSPace(LowerCase(AMainName)) +
    DirectorySeparator +
    DelSpace(LowerCase(ASubName)) +
    DatasetFileExtension
  );
end;

end.

