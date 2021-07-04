unit
  Wait4D.Services.Tasks;

interface

uses
  Forms,

  Wait4D.Interfaces,

  System.Classes,
  System.SysUtils,
  System.Threading;

type TServiceTask = class
  private

  public
    class function ExecutaLoading(aForm: TForm) : iWait4DNotificador;
    class function ExecutaProgress(aForm: TForm) : iWait4DNotificador;
    class procedure Executar(aProc: TProc;
                             aNotificador: iWait4DNotificador;
                             aForm: TForm);
end;

implementation

uses
  Dialogs,

  Wait4D.View.Fundo,
  Wait4D.View.Loading,
  Wait4D.View.Progress;

{ TServiceTask }

class function TServiceTask.ExecutaLoading(aForm: TForm) : iWait4DNotificador;
begin
  frmLoading := TfrmLoading.Create(aForm);
  Result := frmLoading;
end;

class function TServiceTask.ExecutaProgress(aForm: TForm) : iWait4DNotificador;
begin
  frmProgress := TfrmProgress.Create(aForm);
  Result := frmProgress;
end;

class procedure TServiceTask.Executar(aProc: TProc;
  aNotificador: iWait4DNotificador; aForm: TForm);
var
  LTask: iTask;
  JanelasCongeladas: Pointer;
begin
// Esmaecer Tela
  if frmFundo = nil then
    frmFundo:= TfrmFundo.Create(Application);
  frmFundo.Left:= aForm.Left+8;
  frmFundo.Top:= aForm.Top;
  frmFundo.Width:= aForm.Width-16;
  frmFundo.Height:= aForm.Height-8;
  frmFundo.Show;

  JanelasCongeladas:= DisableTaskWindows(TForm(aNotificador.Ref).Handle);
  TForm(aNotificador.Ref).Left:= frmFundo.Left + Trunc((aform.Width-16-TForm(aNotificador.Ref).Width)/2);
  TForm(aNotificador.Ref).Top:= frmFundo.Top + 30 + Trunc((aform.Height-40-TForm(aNotificador.Ref).Height)/2);

  aNotificador.Show;
  aNotificador.Notificar;

  LTask := TTask.Create(procedure()
    begin
      try
        try
          aProc;
        except
          on E:Exception do
          begin
            TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              ShowMessage(E.Message);
            end);

          end;
        end;

      finally
        aNotificador.Close;
        frmFundo.Close;
        EnableTaskWindows(JanelasCongeladas);
      end;
    end
  );
  LTask.Start;
end;

end.
