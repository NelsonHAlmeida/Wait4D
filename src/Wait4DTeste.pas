unit Wait4DTeste;

interface

uses
  System.SysUtils,
  Wait4D;

type
  TModelWait4DTeste = class(TInterfacedObject, iWait4DTeste)
  private
    [weak]
    FParent : iWait4D;
  public
    constructor Create(aParent : iWait4D);
    destructor Destroy; override;
    class function New(aParent : iWait4D): iWait4DTeste;
    function Preencher : iWait4DTeste;
  end;

implementation

{ TModelWait4DTeste }

constructor TModelWait4DTeste.Create(aParent : iWait4D);
begin
  FParent := aParent;
end;

destructor TModelWait4DTeste.Destroy;
begin

  inherited;
end;

class function TModelWait4DTeste.New(aParent : iWait4D): iWait4DTeste;
begin
  Result:= Self.Create(aParent);
end;


function TModelWait4DTeste.Preencher: iWait4DTeste;
var
  i, LTotal: Integer;
begin
  LTotal := 50;
  FParent.Notificacao.Titulo('Sincronizando...').PosicaoMaxima(LTotal);
  for i := 1 to LTotal do
  begin
    Sleep(100);
    FParent.
      Notificacao
      .PosicaoAtual(i)
      .Descricao('Registro ' + i.ToString + ' de ' + LTotal.ToString)
    .&End
    .Notificar;
  end;

end;

end.
