unit Wait4D.Interfaces;

interface

uses
  system.SysUtils;

type
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
  end;

  iWait4DNotificador = interface
    ['{53B56CFE-CA2C-4AE4-BA09-6D848D53F164}']
    procedure Show;
    procedure Close;
    function Ref: iWait4DNotificador;
    procedure Notificar;
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

implementation

end.
