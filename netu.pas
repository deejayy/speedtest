unit netu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, ExtCtrls;

type
  Tf1 = class(TForm)
    ss1: TServerSocket;
    cb1: TCheckBox;
    procedure cb1Click(Sender: TObject);
    procedure ss1Accept(Sender: TObject; Socket: TCustomWinSocket);
    procedure ss1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ss1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f1: Tf1;

implementation

{$R *.dfm}

var

  byt   : cardinal;
  tick  : cardinal;
  tota  : cardinal;
  stick : cardinal;

procedure Tf1.cb1Click(Sender: TObject);
begin
  ss1.Active := cb1.Checked;

  f1.caption := '0';  
end;

procedure Tf1.ss1Accept(Sender: TObject; Socket: TCustomWinSocket);
begin
  socket.Accept( socket.SocketHandle );
  stick := gettickcount;
end;

procedure Tf1.ss1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var

  buf: array of byte;
  a: cardinal;
  
begin
  tick := gettickcount;

  a := socket.ReceiveLength;
  setlength( buf, a );
  socket.ReceiveBuf( buf[0], a );

  if tick <> gettickcount then tick := tick - gettickcount;

  tota := tota + a;

  f1.Caption := format( 'recved: %d bytes (%d bytes/sec)', [tota, byt] );
end;

procedure Tf1.ss1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  f1.Caption := format( 'recved: %d bytes (%d Mbytes/sec), time: %d sec', [tota, round( ( tota/((gettickcount - stick)/ 1000) ) / (1024*1024) ), round((gettickcount - stick)/1000)] );
end;

end.
