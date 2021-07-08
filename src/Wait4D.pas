unit Wait4D;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Wait4D.Interfaces;

type
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

  TServiceTask.Executar(FProcess, FNotificador, FForm);
end;

function TWait4D.Form(aForm: TObject): iWait4D;
begin
  Result := Self;
  FForm := TForm(aForm);
end;

function TWait4D.Loading: iWait4D;
begin
  Result := Self;
  FNotificador := TServiceTask.ExecutaLoading(FForm);
end;

class function TWait4D.New: iWait4D;
begin
  Result:= Self.Create;
end;

function TWait4D.Notificacao: iWait4DNotificacao;
begin
  if not Assigned(FNotificacao) then
    FNotificacao := TWait4DNotificacao.New(Self);
  Result := FNotificacao;
end;

function TWait4D.Notificar: iWait4D;
begin
  FNotificador.Notificar;
end;

function TWait4D.Process(aProcess: TProc): iWait4D;
begin
  Result := Self;
  FProcess := aProcess;
end;

function TWait4D.Progress: iWait4D;
begin
  Result := Self;
  FNotificador := TServiceTask.ExecutaProgress(FForm);
end;

end.
