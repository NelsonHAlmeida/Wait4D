unit Wait4D.Notificacao;

interface

uses
  Wait4D.Interfaces;

type
  TWait4DNotificacao = class(TInterfacedObject, iWait4DNotificacao)
  private
    FTitulo : string;
    FDescricao : string;
    FPosicaoAtual : integer;
    FPosicaoMaxima : integer;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iWait4DNotificacao;

    function Titulo : string; overload;
    function Descricao : string; overload;
    function PosicaoAtual : integer; overload;
    function PosicaoMaxima : integer; overload;

    function Titulo(aTitulo : string) : iWait4DNotificacao; overload;
    function Descricao(aDescricao : string) : iWait4DNotificacao; overload;
    function PosicaoAtual(aPosicaoAtual : integer) : iWait4DNotificacao; overload;
    function PosicaoMaxima(aPosicaoMaxima : integer) : iWait4DNotificacao; overload;

  end;

implementation

{ TModelUtilsNotificacao }

constructor TWait4DNotificacao.Create;
begin

end;

function TWait4DNotificacao.Descricao(
  aDescricao: string): iWait4DNotificacao;
begin
  Result := Self;
  FDescricao := aDescricao;
end;

function TWait4DNotificacao.Descricao: string;
begin
  Result := FDescricao;
end;

destructor TWait4DNotificacao.Destroy;
begin

  inherited;
end;

class function TWait4DNotificacao.New: iWait4DNotificacao;
begin
  Result := Self.Create;
end;

function TWait4DNotificacao.PosicaoAtual: integer;
begin
  Result := FPosicaoAtual;
end;

function TWait4DNotificacao.PosicaoAtual(
  aPosicaoAtual: integer): iWait4DNotificacao;
begin
   Result := Self;
   FPosicaoAtual := aPosicaoAtual;
end;

function TWait4DNotificacao.PosicaoMaxima: integer;
begin
  Result := FPosicaoMaxima;
end;

function TWait4DNotificacao.PosicaoMaxima(
  aPosicaoMaxima: integer): iWait4DNotificacao;
begin
  Result := Self;
  FPosicaoMaxima := aPosicaoMaxima;
end;

function TWait4DNotificacao.Titulo: string;
begin
  Result := FTitulo;
end;

function TWait4DNotificacao.Titulo(aTitulo: string): iWait4DNotificacao;
begin
  Result := Self;
  FTitulo := aTitulo;
end;

end.
