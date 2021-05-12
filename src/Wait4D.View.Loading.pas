unit Wait4D.View.Loading;

interface

uses
  Wait4D.Interfaces,

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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Notificar(aNotificacao: iWait4DNotificacao);
    function Ref: iWait4DNotificador;

  end;

var
  frmLoading: TfrmLoading;

implementation

uses
  System.Threading;

{$R *.dfm}

{ TfrmLoading }

procedure TfrmLoading.Notificar(aNotificacao: iWait4DNotificacao);
begin
  TThread.Queue(nil, procedure()
    begin
      lblTitulo.Caption    := aNotificacao.Titulo;
      lblDescricao.Caption := aNotificacao.Descricao;
    end
  );
end;

function TfrmLoading.Ref: iWait4DNotificador;
begin
  Result:= Self;
end;

end.
