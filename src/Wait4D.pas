unit Wait4D;

interface

uses
  System.SysUtils,
  Vcl.Forms;

type
// Interfaces
  iWait4D = interface;

  iWait4DNotification = interface
    ['{2139A24A-9E6E-4AE4-AB92-E7FF1F6F91CF}']
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

  iWait4DNotifier = interface
    ['{53B56CFE-CA2C-4AE4-BA09-6D848D53F164}']
    procedure Show;
    procedure Close;
    function Ref: iWait4DNotifier;
    procedure Notify(aValue : iWait4DNotification);
  end;

  iWait4D = interface
    ['{D6B198AC-CD72-4A41-8A6A-E42E413EFC1C}']
    function Notification : iWait4DNotification;
    function Form (aForm : TObject) : iWait4D;
    function Process (aProcess : TProc) : iWait4D;
    function Loading : iWait4D;
    function Progress : iWait4D;
    function Notify : iWait4D;
    procedure Execute;
  end;

  iWait4DTeste = interface
    ['{FEF2C2FA-32FD-4E05-BB02-9D000489D2A5}']
    function Preencher : iWait4DTeste;
  end;

// Implementation

  TWait4D = class(TInterfacedObject, iWait4D)
  private
    FNotifier : iWait4DNotifier;
    FNotification : iWait4DNotification;
    FForm : TForm;
    FProcess : TProc;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iWait4D;
    function Notification : iWait4DNotification;
    function Form (aForm : TObject) : iWait4D;
    function Process (aProcess : TProc) : iWait4D;
    function Loading : iWait4D;
    function Progress : iWait4D;
    function Notify : iWait4D;
    procedure Execute;
  end;

implementation

uses
  Wait4D.Notification,
  Wait4D.Services.Tasks;

{ TWait4DFactory }

constructor TWait4D.Create;
begin
  if not Assigned(FNotification) then
    FNotification := TWait4DNotification.New(Self);
  FNotification.Title('Wait..').Body('Processing...'); //Default
end;

destructor TWait4D.Destroy;
begin
  inherited;
end;

procedure TWait4D.Execute;
begin
  if not Assigned(FProcess) then
    raise Exception.Create('Process not informed');

  if not Assigned(FNotifier) then
    raise Exception.Create('Notifier (Loading/Progress) not informed');

  TServiceTask.Executar(FProcess, FNotifier, FNotification, FForm);
end;

function TWait4D.Form(aForm: TObject): iWait4D;
begin
  Result := Self;
  FForm := TForm(aForm);
end;

function TWait4D.Loading: iWait4D;
begin
  Result := Self;
  FNotifier := TServiceTask.ExecutaLoading;
end;

class function TWait4D.New: iWait4D;
begin
  Result:= Self.Create;
end;

function TWait4D.Notification: iWait4DNotification;
begin
  Result := FNotification;
end;

function TWait4D.Notify: iWait4D;
begin
  FNotifier.Notify(FNotification);
end;

function TWait4D.Process(aProcess: TProc): iWait4D;
begin
  Result := Self;
  FProcess := aProcess;
end;

function TWait4D.Progress: iWait4D;
begin
  Result := Self;
  FNotifier := TServiceTask.ExecutaProgress;
end;

end.
