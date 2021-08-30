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
  TfrmLoading = class(TForm, iWait4DNotificador)
    Shape1: TShape;
    ActivityIndicator1: TActivityIndicator;
    lblTitulo: TLabel;
    lblDescricao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    procedure Notificar(aValue : iWait4DNotificacao);
    function Ref: iWait4DNotificador;

  end;

implementation

uses
  System.Threading, Wait4D.Notificacao;

{$R *.dfm}

{ TfrmLoading }

procedure TfrmLoading.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfrmLoading.Notificar(aValue : iWait4DNotificacao);
begin
  TThread.Queue(nil,
  procedure
    begin
      lblTitulo.Caption    := aValue.Titulo;
      lblDescricao.Caption := aValue.Descricao;
    end
  );
end;

function TfrmLoading.Ref: iWait4DNotificador;
begin
  Result:= Self;
end;

end.
