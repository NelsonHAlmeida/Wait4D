unit Wait4D.Notification;

interface

uses
  Wait4D;

type
  TWait4DNotification = class(TInterfacedObject, iWait4DNotification)
  private
    [weak]
    FParent : iWait4D;

    FTitle : string;
    FBody : string;
    FPositionCurrent : integer;
    FPositionFinal : integer;

  public
    constructor Create(aParent : iWait4D);
    destructor Destroy; override;
    class function New(aParent : iWait4D): iWait4DNotification;

    function Title : string; overload;
    function Title(aValue : string) : iWait4DNotification; overload;
    function Body : string; overload;
    function Body(aValue: string) : iWait4DNotification; overload;
    function PositionCurrent : integer; overload;
    function PositionCurrent(aValue : integer) : iWait4DNotification; overload;
    function PositionFinal : integer; overload;
    function PositionFinal(aValue : integer) : iWait4DNotification; overload;

    function &End : iWait4D;

  end;

implementation

{ TModelUtilsNotificacao }

function TWait4DNotification.&End: iWait4D;
begin
  Result := FParent;
end;

constructor TWait4DNotification.Create(aParent : iWait4D);
begin
  FParent := aParent;
end;

function TWait4DNotification.Body(aValue: string): iWait4DNotification;
begin
  Result := Self;
  FBody := aValue;
end;

function TWait4DNotification.Body: string;
begin
  Result := FBody;
end;

destructor TWait4DNotification.Destroy;
begin

  inherited;
end;

class function TWait4DNotification.New(aParent : iWait4D): iWait4DNotification;
begin
  Result := Self.Create(aParent);
end;

function TWait4DNotification.PositionCurrent: integer;
begin
  Result := FPositionCurrent;
end;

function TWait4DNotification.PositionCurrent(
  aValue: integer): iWait4DNotification;
begin
   Result := Self;
   FPositionCurrent := aValue;
end;

function TWait4DNotification.PositionFinal: integer;
begin
  Result := FPositionFinal;
end;

function TWait4DNotification.PositionFinal(
  aValue: integer): iWait4DNotification;
begin
  Result := Self;
  FPositionFinal := aValue;
end;

function TWait4DNotification.Title: string;
begin
  Result := FTitle;
end;

function TWait4DNotification.Title(aValue: string): iWait4DNotification;
begin
  Result := Self;
  FTitle := aValue;
end;

end.
