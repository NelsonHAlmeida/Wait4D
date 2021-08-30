unit Wait4D.View.Page;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Forms,
  Wait4D;

type
  TPage = class(TForm)
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FAguarde : iWait4D;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TPage.Button1Click(Sender: TObject);
begin
  FAguarde := TWait4D.New;
  FAguarde
    .Form(Self)
    .Process(
       procedure
       begin
         try
           Sleep(2000);
         finally
           FAguarde := nil;
         end;
       end)
    .Loading
    .Executar;
end;

procedure TPage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= TCloseAction.caFree;
end;

end.
