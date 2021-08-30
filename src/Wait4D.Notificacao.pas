unit Wait4D.Notificacao;

interface

uses
  Wait4D;

type
  TWait4DNotificacao = class(TInterfacedObject, iWait4DNotificacao)
  private
    [weak]
    FParent : iWait4D;

    FTitulo : string;
    FDescricao : string;
    FPosicaoAtual : integer;
    FPosicaoMaxima : integer;

  public
    constructor Create(aParent : iWait4D);
    destructor Destroy; override;
    class function New(aParent : iWait4D): iWait4DNotificacao;

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

implementation

{ TModelUtilsNotificacao }

function TWait4DNotificacao.&End: iWait4D;
begin
  Result := FParent;
end;

constructor TWait4DNotificacao.Create(aParent : iWait4D);
begin
  FParent := aParent;
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

class function TWait4DNotificacao.New(aParent : iWait4D): iWait4DNotificacao;
begin
  Result := Self.Create(aParent);
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
