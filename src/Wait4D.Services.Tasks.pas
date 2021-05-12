unit
  Wait4D.Services.Tasks;

interface

uses
  Forms,

  Wait4D.Interfaces,

  System.Classes,
  System.SysUtils,
  System.Threading;

type TExecInTask = reference to procedure (aNotificador: iWait4DNotificador);

type TServiceTask = class
  private
//    class var FController: IController;
    class procedure Executar(aProc: TExecInTask; aNotificador: iWait4DNotificador; aForm: TForm);
  public
    class procedure ExecutaLoading(aProc : TExecInTask; aForm: TForm);
    class procedure ExecutaProgress(aProc : TExecInTask; aForm: TForm);
end;

implementation

uses
  Dialogs,

  Wait4D.View.Fundo,
  Wait4D.View.Loading,
  Wait4D.View.Progress;

{ TServiceTask }

class procedure TServiceTask.ExecutaLoading(aProc: TExecInTask; aForm: TForm);
begin
  frmLoading := TfrmLoading.Create(aForm);
  Executar(aProc, frmLoading, aForm);
end;

class procedure TServiceTask.ExecutaProgress(aProc: TExecInTask; aForm: TForm);
begin
  frmProgress := TfrmProgress.Create(aForm);
  Executar(aProc, frmProgress, aForm);
end;

class procedure TServiceTask.Executar(aProc: TExecInTask;
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

//  JanelasCongeladas:= DisableTaskWindows(aForm.Handle);
  JanelasCongeladas:= DisableTaskWindows(TForm(aNotificador.Ref).Handle);
  TForm(aNotificador.Ref).Left:= frmFundo.Left + Trunc((aform.Width-16-TForm(aNotificador.Ref).Width)/2);
  TForm(aNotificador.Ref).Top:= frmFundo.Top + 30 + Trunc((aform.Height-40-TForm(aNotificador.Ref).Height)/2);

  aNotificador.Show;

  LTask := TTask.Create(procedure()
    begin
      try
        try
          aProc(aNotificador);
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
