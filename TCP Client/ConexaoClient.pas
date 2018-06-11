unit ConexaoClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdContext, IdCustomTCPServer, IdTCPServer,
  Vcl.StdCtrls, Vcl.ExtCtrls, Winsock ;

type
  TConexaoClientForm = class(TForm)
    IdTCPClient: TIdTCPClient;
    ConectarPanel: TPanel;
    IPServidorLabel: TLabel;
    PortaEdit: TEdit;
    IPServidorEdit: TEdit;
    IdTCPServer: TIdTCPServer;
    ApelidoEdit: TEdit;
    ConectarButton: TButton;
    MensagemPanel: TPanel;
    MensagemEdit: TEdit;
    MensagensRecebidasMemo: TMemo;
    EnviarButton: TButton;
    MensagemLabel: TLabel;
    ChatLabel: TLabel;
    ApelidoLabel: TLabel;
    PortaLabel: TLabel;
    procedure IdTCPServerExecute(AContext: TIdContext);
    procedure ConectarButtonClick(Sender: TObject);
    procedure EnviarButtonClick(Sender: TObject);
  private
    procedure op_EnviaMsg(const asMsg : String; const abConecta : Boolean);
    function GetIP: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConexaoClientForm: TConexaoClientForm;

implementation

{$R *.dfm}

procedure TConexaoClientForm.ConectarButtonClick(Sender: TObject);
begin
  if ApelidoEdit.Text <> '' then
  begin
    try
      IdTCPServer.DefaultPort := StrToInt(PortaEdit.Text);
      IdTCPServer.Active      := True;
      Self.op_EnviaMsg('', True);
      ConectarPanel.Enabled := False;
      MensagemPanel.Enabled := True;
    except
      ShowMessage('Não foi possível conectar no servidor');
    end;
  end;
end;

procedure TConexaoClientForm.EnviarButtonClick(Sender: TObject);
begin
  Self.op_EnviaMsg(MensagemEdit.Text, False);
  MensagemEdit.Text := '';
end;

procedure TConexaoClientForm.IdTCPServerExecute(AContext: TIdContext);
begin
  MensagensRecebidasMemo.Text := MensagensRecebidasMemo.Text + #13#10 + AContext.Connection.Socket.ReadLn;
  // AContext.Connection.Socket.WriteLn('Servidor, já recebi tua msg');
end;

procedure TConexaoClientForm.op_EnviaMsg(const asMsg : String; const abConecta : Boolean);
var
  lsEnvio : String;
begin
  IdTCPClient.Host := IPServidorEdit.Text;
  IdTCPClient.Port := StrToInt(PortaEdit.Text);
  with IdTCPClient do
  begin
    try
      Connect;
      with Socket do
      begin
        if abConecta then
          lsEnvio := ApelidoEdit.Text + ';' + Self.GetIP + ';' + '/*CONECTADO*/'
        else
          lsEnvio := ApelidoEdit.Text + ';' + Self.GetIP + ';' + MensagemEdit.Text;
        WriteLn(lsEnvio);
        // ReadLn;
      end;
      Disconnect;
    except
      ShowMessage('Erro ao se conectar ao servidor')
    end;
  end;
end;

function TConexaoClientForm.GetIP : string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name:string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d',
    [Byte(h_addr^[0]),Byte(h_addr^[1]),
    Byte(h_addr^[2]),Byte(h_addr^[3])]);
  end;
    WSACleanup;
end;

end.
