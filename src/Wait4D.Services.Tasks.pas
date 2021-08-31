unit
  Wait4D.Services.Tasks;

interface

uses
  Forms,

  Wait4D,

  System.Classes,
  System.SysUtils,
  System.Threading;

type TServiceTask = class
  private

  public
    class function ExecutaLoading : iWait4DNotifier;
    class function ExecutaProgress : iWait4DNotifier;
    class procedure Executar(aProc : TProc;
                             aNotificador : iWait4DNotifier;
                             aNotificacao : iWait4DNotification;
                             aForm : TForm);
end;

implementation

uses
  Dialogs,

  Wait4D.View.Background,
  Wait4D.View.Loading,
  Wait4D.View.Progress;

{ TServiceTask }

class function TServiceTask.ExecutaLoading : iWait4DNotifier;
begin
  Result := TfrmLoading.Create(nil);
end;

class function TServiceTask.ExecutaProgress: iWait4DNotifier;
begin
  Result := TfrmProgress.Create(nil);
end;

class procedure TServiceTask.Executar(aProc : TProc;
                                      aNotificador : iWait4DNotifier;
                                      aNotificacao : iWait4DNotification;
                                      aForm: TForm);
var
  LTask: iTask;
  JanelasCongeladas: Pointer;
  LFundo : TForm;
begin
// Esmaecer Tela
//  if frmFundo = nil then
  LFundo:= TfrmBackground.Create(nil);
  LFundo.Left:= aForm.Left+8;
  LFundo.Top:= aForm.Top;
  LFundo.Width:= aForm.Width-16;
  LFundo.Height:= aForm.Height-8;
  LFundo.Show;

  JanelasCongeladas:= DisableTaskWindows(TForm(aNotificador.Ref).Handle);
  TForm(aNotificador.Ref).Left:= LFundo.Left + Trunc((aform.Width-16-TForm(aNotificador.Ref).Width)/2);
  TForm(aNotificador.Ref).Top:= LFundo.Top + 30 + Trunc((aform.Height-40-TForm(aNotificador.Ref).Height)/2);

  aNotificador.Show;
  aNotificador.Notify(aNotificacao);

  LTask := TTask.Create(
  procedure
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
//              raise Exception.Create(E.Message);
            end);

          end;
        end;

      finally
        EnableTaskWindows(JanelasCongeladas);
        LFundo.Close;
        aNotificador.Close;
        LFundo := nil;
      end;
    end);
  LTask.Start;
end;

end.
