unit Wait4D;

interface

uses
  System.SysUtils,
  Vcl.Forms;

type
// Interfaces
  iWait4D = interface;

  iWait4DNotificacao = interface
    ['{2139A24A-9E6E-4AE4-AB92-E7FF1F6F91CF}']
    function Titulo : string; overload;
    function Descricao : string; overload;
    function PosicaoAtual : integer; overload;
    function PosicaoMaxima : integer; overload;

    function Titulo(aTitulo : string) : iWait4DNotificacao; overload;
    function Descricao(aDescricao : string) : iWait4DNotificacao; overload;
    function PosicaoAtual(aPosicaoAtual : integer) : iWait4DNotificacao; overload;
    function PosicaoMaxima(aPosicaoMaxima : integer) : iWait4DNotificacao; overload;

    function &End : iWait4D;
  end;

  iWait4DNotificador = interface
    ['{53B56CFE-CA2C-4AE4-BA09-6D848D53F164}']
    procedure Show;
    procedure Close;
    function Ref: iWait4DNotificador;
    procedure Notificar(aValue : iWait4DNotificacao);
  end;

  iWait4D = interface
    ['{D6B198AC-CD72-4A41-8A6A-E42E413EFC1C}']
    function Notificacao : iWait4DNotificacao;
    function Form (aForm : TObject) : iWait4D;
    function Process (aProcess : TProc) : iWait4D;
    function Loading : iWait4D;
    function Progress : iWait4D;
    function Notificar : iWait4D;
    procedure Executar;
  end;

  iWait4DTeste = interface
    ['{FEF2C2FA-32FD-4E05-BB02-9D000489D2A5}']
    function Preencher : iWait4DTeste;
  end;

// Implementation

  TWait4D = class(TInterfacedObject, iWait4D)
  private
    FNotificador : iWait4DNotificador;
    FNotificacao : iWait4DNotificacao;
    FForm : TForm;
    FProcess : TProc;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iWait4D;
    function Notificacao : iWait4DNotificacao;
    function Form (aForm : TObject) : iWait4D;
    function Process (aProcess : TProc) : iWait4D;
    function Loading : iWait4D;
    function Progress : iWait4D;
    function Notificar : iWait4D;
    procedure Executar;
  end;

implementation

uses
  Wait4D.Notificacao,
  Wait4D.Services.Tasks;

{ TWait4DFactory }

constructor TWait4D.Create;
begin
  if not Assigned(FNotificacao) then
    FNotificacao := TWait4DNotificacao.New(Self);
  FNotificacao.Titulo('Aguarde...').Descricao('Processando...'); //Default
end;

destructor TWait4D.Destroy;
begin
  inherited;
end;

procedure TWait4D.Executar;
begin
  if not Assigned(FProcess) then
    raise Exception.Create('Informar Processo a ser realizado');

  if not Assigned(FNotificador) then
    raise Exception.Create('Informar Notificador(Loading/Progress)');

  TServiceTask.Executar(FProcess, FNotificador, FNotificacao, FForm);
end;

function TWait4D.Form(aForm: TObject): iWait4D;
begin
  Result := Self;
  FForm := TForm(aForm);
end;

function TWait4D.Loading: iWait4D;
begin
  Result := Self;
  FNotificador := TServiceTask.ExecutaLoading;
end;

class function TWait4D.New: iWait4D;
begin
  Result:= Self.Create;
end;

function TWait4D.Notificacao: iWait4DNotificacao;
begin
  Result := FNotificacao;
end;

function TWait4D.Notificar: iWait4D;
begin
  FNotificador.Notificar(FNotificacao);
end;

function TWait4D.Process(aProcess: TProc): iWait4D;
begin
  Result := Self;
  FProcess := aProcess;
end;

function TWait4D.Progress: iWait4D;
begin
  Result := Self;
  FNotificador := TServiceTask.ExecutaProgress;
end;

end.
