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
  TfrmProgress = class(TForm, iWait4DNotificador)
    Shape1: TShape;
    ProgressBar1: TProgressBar;
    lblTitulo: TLabel;
    lblDescricao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    procedure Notificar(aValue : iWait4DNotificacao);
    function Ref: iWait4DNotificador;
  end;

implementation

uses
  Wait4D.Notificacao;

{$R *.dfm}

{ TfrmProgress }

procedure TfrmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
end;

procedure TfrmProgress.FormCreate(Sender: TObject);
begin
//  if not Assigned(FNotificacao) then
//    FNotificacao := TWait4DNotificacao.New(nil);
//  FNotificacao.PosicaoAtual(0);
//  if FNotificacao.Titulo = EmptyStr then
//    FNotificacao.Titulo('Sincronizando...').Descricao('');
end;

procedure TfrmProgress.Notificar(aValue : iWait4DNotificacao);
begin
  TThread.Queue(nil, procedure()
    begin
      ProgressBar1.Position := aValue.PosicaoAtual;  //aki Verificar
      ProgressBar1.Max := aValue.PosicaoMaxima;
      lblTitulo.Caption := aValue.Titulo;
      lblDescricao.Caption := aValue.Descricao;
    end
  );
end;

function TfrmProgress.Ref: iWait4DNotificador;
begin
  Result:= Self;
end;

end.
