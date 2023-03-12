program TimerDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormMain in 'FormMain.pas' {frmMain},
  FormTimerClose in 'FormTimerClose.pas' {frmOnTimerClose};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOnTimerClose, frmOnTimerClose);
  Application.Run;
end.
