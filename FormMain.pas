unit FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation;

type
  TfrmMain = class(TForm)
    tlbHeader: TToolBar;
    memLog: TMemo;
    lblInfo: TLabel;
    btnExit: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses FormTimerClose; // Instanciar con la "FormTimerClose" 

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close; // Activara el evento "FormCloseQuery"
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {$IFDEF WINDOWS}
  frmOnTimerClose.ShowModal; // Muestra el "FromTimerClose" (Para WINDOWS).
  CanClose := (frmOnTimerClose.ModalResult = mrClose); // Recibe la respuesta del "FromTimerClose".
  {$ELSE IF(ANDROID)}
  frmOnTimerClose.Show; // Muestra el "FromTimerClose" (Para ANDROID).
  CanClose := (frmOnTimerClose.ModalResult = mrClose); // Recibe la respuesta del "FromTimerClose".
{$ENDIF}
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
    close; // Activara el evento "FormCloseQuery"
end;

end.
