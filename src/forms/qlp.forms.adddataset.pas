unit QLP.Forms.AddDataset;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons;

type

  { TfrmAddDataset }

  TfrmAddDataset = class(TForm)
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    ledtName: TLabeledEdit;
    ledtPath: TLabeledEdit;
    sbtnSelectFolder: TSpeedButton;
    SelectDirectoryDialog: TSelectDirectoryDialog;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbtnSelectFolderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDatasetName: String;
    FDatasetPath: String;
  public
    property DatasetName: String
      read FDatasetName
      write FDatasetName;
    property DatasetPath: String
      read FDatasetPath
      write FDatasetPath;
  end;

var
  frmAddDataset: TfrmAddDataset;

implementation

{$R *.lfm}

{ TfrmAddDataset }

procedure TfrmAddDataset.sbtnSelectFolderClick(Sender: TObject);
begin
  if SelectDirectoryDialog.Execute then
  begin
    ledtPath.Text:= SelectDirectoryDialog.FileName;
  end;
end;

procedure TfrmAddDataset.btnOkClick(Sender: TObject);
begin
  FDatasetName:= ledtName.Text;
  FDatasetPath:= ledtPath.Text;
end;

procedure TfrmAddDataset.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:= caHide;
end;

procedure TfrmAddDataset.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= True;
end;

procedure TfrmAddDataset.FormCreate(Sender: TObject);
begin
  SelectDirectoryDialog.InitialDir:= Application.Location;
end;

end.

