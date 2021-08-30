unit Wait4D.View.Sample;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Wait4D;

type
  TPageSample = class(TForm)
    btnLoading: TButton;
    btnProgress: TButton;
    Button1: TButton;
    procedure btnProgressClick(Sender: TObject);

    procedure ProcessLoading;
    procedure ProcessProgress;
    procedure btnLoadingClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FWait4D: iWait4D;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageSample: TPageSample;

implementation

uses
  Wait4DTeste,
  Wait4D.View.Page;

{$R *.dfm}

{ TPageSample }

procedure TPageSample.btnLoadingClick(Sender: TObject);
begin
  FWait4D := TWait4D.New;
// change title and description displayed loading
  FWait4D
    .Notificacao
      .Titulo('Wait...')
      .Descricao('Processing...')
    .&End
    .Form(Self)
    .Process(ProcessLoading)
    .Loading
    .Executar;

end;

procedure TPageSample.btnProgressClick(Sender: TObject);
begin
  FWait4D := TWait4D.New;
  FWait4D
    .Notificacao
      .Titulo('Wait...')
      .Descricao('Processing...')
    .&End
    .Form(Self)
    .Process(ProcessProgress)
    .Progress
    .Executar;
end;

procedure TPageSample.Button1Click(Sender: TObject);
var
  LForm : TForm;
begin
  LForm := TPage.Create(nil);
  LForm.Show;
end;

procedure TPageSample.ProcessLoading;
begin
  try
  // process executed in task during loading execution
    Sleep(1000);
  // change title and description displayed loading
    FWait4D
      .Notificacao
        .Titulo('Title...')
        .Descricao('Description...')
      .&End
    .Notificar;

    Sleep(1000);
  finally
    FWait4D := nil;
  end;

end;

procedure TPageSample.ProcessProgress;
begin
  TModelWait4DTeste.New(FWait4D).Preencher;
  FWait4D := nil;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
