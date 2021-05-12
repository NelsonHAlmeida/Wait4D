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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Notificar(aNotificacao: iWait4DNotificacao);
    function Ref: iWait4DNotificador;
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

{ TfrmProgress }

procedure TfrmProgress.Notificar(aNotificacao: iWait4DNotificacao);
begin
  TThread.Queue(nil, procedure()
    begin
      lblTitulo.Caption := aNotificacao.Titulo;
      lblDescricao.Caption := aNotificacao.Descricao;
      ProgressBar1.Position := aNotificacao.PosicaoAtual;
      ProgressBar1.Max := aNotificacao.PosicaoMaxima;
    end
  );
end;

function TfrmProgress.Ref: iWait4DNotificador;
begin
  Result:= Self;
end;

end.
