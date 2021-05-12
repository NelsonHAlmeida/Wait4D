unit Wait4D;

interface

uses
  Wait4D.Interfaces;

type
  IWait4D = Wait4D.Interfaces.iWait4DNotificacao;

  TWait4D = class
  public
    class function New: IWait4D;
  end;

implementation

uses
  Wait4D.Notificacao;

{ TWait4D }

class function TWait4D.New: IWait4D;
begin
  Result := TWait4DNotificacao.New;
end;

end.
