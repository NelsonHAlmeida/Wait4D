unit Wait4D.Interfaces;

interface

type

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
  end;

  iWait4DNotificador = interface
    ['{53B56CFE-CA2C-4AE4-BA09-6D848D53F164}']
    procedure Show;
    procedure Close;
    function Ref: iWait4DNotificador;
    procedure Notificar(aNotificacao: iWait4DNotificacao);
  end;

implementation

end.
