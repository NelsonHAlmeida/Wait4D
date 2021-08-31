unit Wait4D.View.Loading;

interface

uses
  Wait4D,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,

  Winapi.Messages,
  Winapi.Windows;

type
  TfrmLoading = class(TForm, iWait4DNotifier)
    Shape1: TShape;
    ActivityIndicator1: TActivityIndicator;
    lblTitle: TLabel;
    lblBody: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    procedure Notify(aValue : iWait4DNotification);
    function Ref: iWait4DNotifier;

  end;

implementation

uses
  System.Threading;

{$R *.dfm}

{ TfrmLoading }

procedure TfrmLoading.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfrmLoading.Notify(aValue : iWait4DNotification);
begin
  TThread.Queue(nil,
  procedure
    begin
      lblTitle.Caption    := aValue.Title;
      lblBody.Caption := aValue.Body;
    end
  );
end;

function TfrmLoading.Ref: iWait4DNotifier;
begin
  Result:= Self;
end;

end.
