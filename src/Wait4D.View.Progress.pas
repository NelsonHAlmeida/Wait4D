unit Wait4D.View.Progress;

interface

uses
  Wait4D.Interfaces,

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
    { Private declarations }
    FNotificacao : iWait4DNotificacao;
  public
    { Public declarations }
    procedure Notificar;
    function Ref: iWait4DNotificador;
  end;

var
  frmProgress: TfrmProgress;

implementation

uses
  Wait4D.Notificacao;

{$R *.dfm}

{ TfrmProgress }

procedure TfrmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  frmProgress:= nil;
end;

procedure TfrmProgress.FormCreate(Sender: TObject);
begin
  if not Assigned(FNotificacao) then
    FNotificacao := TWait4DNotificacao.New;
  FNotificacao.PosicaoAtual(0);
  if FNotificacao.Titulo = EmptyStr then
    FNotificacao.Titulo('Sincronizando...').Descricao('');
end;

procedure TfrmProgress.Notificar;
begin
  TThread.Queue(nil, procedure()
    begin
      ProgressBar1.Position := FNotificacao.PosicaoAtual + 1;
      ProgressBar1.Max := FNotificacao.PosicaoMaxima;
      lblTitulo.Caption := FNotificacao.Titulo;
      lblDescricao.Caption := FNotificacao.Descricao;
    end
  );
end;

function TfrmProgress.Ref: iWait4DNotificador;
begin
  Result:= Self;
end;

end.
