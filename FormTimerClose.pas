unit FormTimerClose;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TfrmOnTimerClose = class(TForm)
    lblMessage: TLabel;
    btnYes: TButton;
    btnNo: TButton;
    tmrTimeOut: TTimer;
    procedure FormShow(Sender: TObject);
    procedure tmrTimeOutTimer(Sender: TObject);
    // procedimientos del usuario
    procedure Salir(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    seconds: integer; // Para el Timer.

  end;

var
  frmOnTimerClose: TfrmOnTimerClose;

implementation

{$R *.fmx}

uses FormMain;

procedure TfrmOnTimerClose.FormShow(Sender: TObject);
begin
  btnNo.Text := 'No';
  seconds := 5;
  tmrTimeOut.Enabled := true;
end;

procedure TfrmOnTimerClose.tmrTimeOutTimer(Sender: TObject);
begin
  btnNo.Text := Format('No (%d)', [seconds]);
  dec(seconds); // seconds -= 1; (c++)
  if seconds < 0 then
  begin
    tmrTimeOut.Enabled := false;
    Salir(btnNo);
  end;
end;

procedure TfrmOnTimerClose.Salir(Sender: TObject);
begin
  ModalResult := (Sender as TButton).ModalResult;
  if ModalResult = mrClose then
    frmMain.Close
  else
    Close;
end;

end.
