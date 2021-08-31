unit Wait4D.View.Progress;

interface

uses
  Wait4D,

  System.Classes,
  System.SysUtils,
  System.Threading,
  System.Variants,

  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.Windows;

type
  TfrmProgress = class(TForm, iWait4DNotifier)
    Shape1: TShape;
    ProgressBar1: TProgressBar;
    lblTitle: TLabel;
    lblBody: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    procedure Notify(aValue : iWait4DNotification);
    function Ref: iWait4DNotifier;
  end;

implementation

{$R *.dfm}

{ TfrmProgress }

procedure TfrmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
end;

procedure TfrmProgress.Notify(aValue : iWait4DNotification);
begin
  TThread.Queue(nil,
    procedure
    begin
      ProgressBar1.Position := aValue.PositionCurrent;  //aki Verificar
      ProgressBar1.Max := aValue.PositionFinal;
      lblTitle.Caption := aValue.Title;
      lblBody.Caption := aValue.Body;
    end
  );
end;

function TfrmProgress.Ref: iWait4DNotifier;
begin
  Result:= Self;
end;

end.
