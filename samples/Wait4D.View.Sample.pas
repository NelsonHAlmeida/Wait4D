unit Wait4D.View.Sample;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Wait4D.Interfaces,
  Wait4D;

type
  TPageSample = class(TForm)
    btnLoading: TButton;
    btnProcess: TButton;
    procedure btnLoadingClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
  private
    { Private declarations }
    procedure Notificar(aNotificacao: iWait4DNotificacao;
                        aNotificador: iWait4DNotificador);

    procedure Loading(aNotificador: iWait4DNotificador = nil);

    procedure Process(aNotificador: iWait4DNotificador = nil);
  public
    { Public declarations }
  end;

var
  PageSample: TPageSample;

implementation

{$R *.dfm}

uses Wait4D.Services.Tasks;

{ TPageSample }

procedure TPageSample.btnLoadingClick(Sender: TObject);
begin
  TServiceTask.ExecutaLoading(Loading, Self);
end;

procedure TPageSample.Notificar(aNotificacao: iWait4DNotificacao;
  aNotificador: iWait4DNotificador);
begin
  if aNotificador <> nil then
     aNotificador.Notificar(aNotificacao);
end;

procedure TPageSample.Process(aNotificador: iWait4DNotificador);
var
  LNotificacao: iWait4DNotificacao;
  i, LCount: Integer;
begin
  LNotificacao :=
    TWait4D
     .New
      .Titulo('Sincronizando...');

  LCount:= 100;
  LNotificacao.PosicaoMaxima(LCount);
  for i := 1 to 100 do
  begin
    LNotificacao.Descricao('Registro ' + i.ToString + ' de ' + LCount.ToString);
    LNotificacao.PosicaoAtual(i);
    Notificar(LNotificacao, aNotificador);
    Sleep(200);
  end;

end;

procedure TPageSample.btnProcessClick(Sender: TObject);
begin
  TServiceTask.ExecutaProgress(Process, Self);
end;

procedure TPageSample.Loading(aNotificador: iWait4DNotificador);
var
  LNotificacao: iWait4DNotificacao;
begin
  LNotificacao :=
    TWait4D
     .New
      .Titulo('Aguarde...')
      .Descricao('Carregando...');

  Notificar(LNotificacao, aNotificador);

  Sleep(3000);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
