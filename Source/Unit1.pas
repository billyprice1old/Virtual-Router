unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, IdBaseComponent, IdUserPassProvider;

type
  TSSID = class(TForm)
    lblSSID: TLabel;
    edtSSID: TEdit;
    lblPASS: TLabel;
    edtPASS: TEdit;
    btnConfig: TButton;
    btnStart: TButton;
    btnRestart: TButton;
    btnStop: TButton;
    btnClear: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lblconfig: TLabel;
    lblgithub: TLabel;
    chkpass: TCheckBox;
    lblissue: TLabel;
    procedure btnConfigClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure lblgithubClick(Sender: TObject);
    procedure btnissueClick(Sender: TObject);
    procedure chkpassClick(Sender: TObject);
    procedure lblissueClick(Sender: TObject);
  private
    { Private declarations }
  public
    ssid: String;
    pass: String;
    github: String;
    issue: String;
  end;

var
  SSID: TSSID;

implementation

{$R *.dfm}

procedure TSSID.btnClearClick(Sender: TObject);
begin
  edtSSID.Clear;
  edtPass.Clear;
end;

procedure TSSID.btnConfigClick(Sender: TObject);
begin

  ShellExecute(0, nil, 'cmd.exe', '/c netsh wlan stop hostednetwork', nil, HIDE_WINDOW);
  ssid := edtSSID.Text;
  pass := edtPASS.Text;
  ShellExecute(0, nil, 'cmd.exe', PChar('/c netsh wlan set hostednetwork ssid=' + ssid + ' key=' + pass), nil, HIDE_WINDOW);
  lblconfig.Caption := 'Configuration set!'

end;

procedure TSSID.btnissueClick(Sender: TObject);
begin
  issue := 'https://github.com/Inforcer25/Virtual-Router/issues/new';
  ShellExecute(Application.Handle, PChar('open'), PChar(issue), nil, nil, SW_SHOW);
end;

procedure TSSID.btnRestartClick(Sender: TObject);
begin

  ShellExecute(0, nil, 'cmd.exe', '/c netsh wlan stop hostednetwork', nil, HIDE_WINDOW);
  ShellExecute(0, nil, 'cmd.exe', '/c netsh wlan start hostednetwork', nil, HIDE_WINDOW);

end;

procedure TSSID.btnStartClick(Sender: TObject);
begin

  ShellExecute(0, nil, 'cmd.exe', '/c netsh wlan start hostednetwork', nil, HIDE_WINDOW);

end;

procedure TSSID.btnStopClick(Sender: TObject);
begin

  ShellExecute(0, nil, 'cmd.exe', '/c netsh wlan stop hostednetwork', nil, HIDE_WINDOW);

end;

procedure TSSID.chkpassClick(Sender: TObject);
begin
  if (chkpass.Checked = True) then edtPass.PasswordChar := #0;
  if (chkpass.Checked = False) then edtPass.PasswordChar := '*';

end;

procedure TSSID.lblgithubClick(Sender: TObject);
begin
  github := 'https://github.com/TCDG/Virtual-Router';
  ShellExecute(Application.Handle, PChar('open'), PChar(github), nil, nil, SW_SHOW);
end;

procedure TSSID.lblissueClick(Sender: TObject);
begin
  issue := 'https://github.com/TCDG/Virtual-Router/issues/new';
  ShellExecute(Application.Handle, PChar('open'), PChar(issue), nil, nil, SW_SHOW);
end;

end.
