program Wait4DSample;

uses
  Vcl.Forms,
  Wait4D.View.Sample in 'Wait4D.View.Sample.pas' {PageSample},
  Wait4D.View.Background in '..\src\Wait4D.View.Background.pas' {frmBackground},
  Wait4D.View.Loading in '..\src\Wait4D.View.Loading.pas' {frmLoading},
  Wait4D.View.Progress in '..\src\Wait4D.View.Progress.pas' {frmProgress},
  Wait4D.Services.Tasks in '..\src\Wait4D.Services.Tasks.pas',
  Wait4D.Notification in '..\src\Wait4D.Notification.pas',
  Wait4D in '..\src\Wait4D.pas',
  Wait4DTeste in '..\src\Wait4DTeste.pas',
  Wait4D.View.Page in 'Wait4D.View.Page.pas' {Page};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPageSample, PageSample);
  Application.Run;
end.
