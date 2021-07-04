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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FNotificacao : iWait4DNotificacao;
  public
    { Public declarations }
//    constructor Create;
//    function Notificacao : iWait4DNotificacao;
    procedure Notificar;
    function Ref: iWait4DNotificador;

  end;

var
  frmLoading: TfrmLoading;

implementation

uses
  System.Threading, Wait4D.Notificacao;

{$R *.dfm}

{ TfrmLoading }

//constructor TfrmLoading.Create;
//begin
//  if not Assigned(FNotificacao) then
//    FNotificacao := TWait4DNotificacao.New;
//end;

procedure TfrmLoading.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmLoading := nil;
end;

procedure TfrmLoading.FormCreate(Sender: TObject);
begin
  if not Assigned(FNotificacao) then
    FNotificacao := TWait4DNotificacao.New;
  if FNotificacao.Titulo = EmptyStr then
    FNotificacao.Titulo('Aguarde...').Descricao('Processando...');
end;

procedure TfrmLoading.FormDestroy(Sender: TObject);
begin
//
end;

procedure TfrmLoading.Notificar;
begin
  TThread.Queue(nil, procedure()
    begin
      lblTitulo.Caption    := FNotificacao.Titulo;
      lblDescricao.Caption := FNotificacao.Descricao;
    end
  );
end;

function TfrmLoading.Ref: iWait4DNotificador;
begin
  Result:= Self;
end;

end.
