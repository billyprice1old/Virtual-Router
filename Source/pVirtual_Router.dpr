program pVirtual_Router;

uses
  Forms,
  Unit1 in 'Unit1.pas' {SSID};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Virtual Router';
  Application.CreateForm(TSSID, SSID);
  Application.Run;
end.
