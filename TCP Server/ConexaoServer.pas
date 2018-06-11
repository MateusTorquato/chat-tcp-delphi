unit ConexaoServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdTCPServer, IdContext, IdTCPConnection,
  IdTCPClient, Vcl.ExtCtrls;

type
  TConexaoServerForm = class(TForm)
    IdTCPServer: TIdTCPServer;
    IdTCPClient: TIdTCPClient;
    ConexaoPanel: TPanel;
    ConectarButton: TButton;
    PortaEdit: TEdit;
    PortaLabel: TLabel;
    MensagensRecebidasMemo: TMemo;
    MensagemPanel: TPanel;
    UsuariosConectadosMemo: TMemo;
    MensagensRecebidasLabel: TLabel;
    UsuariosConectadosLabel: TLabel;
    procedure ConectarButtonClick(Sender: TObject);
    procedure IdTCPServerExecute(AContext: TIdContext);
  private
    function StringItem(const S: string; Posicao: Integer; const Separador: char): string;
    procedure op_EncaminhaMsg(const asMsg, asPorta, asIP: String);
    procedure op_AtualizaConectados(const asIP: String; const abAdiciona: Boolean);
    procedure op_RepassaMsgParaTodos(const asMsg: String);
  end;

var
  ConexaoServerForm: TConexaoServerForm;

implementation

{$R *.dfm}

procedure TConexaoServerForm.ConectarButtonClick(Sender: TObject);
begin
  IdTCPServer.DefaultPort := StrToInt(PortaEdit.Text);
  IdTCPServer.Active := True;
  ConexaoPanel.Enabled := False;
  ShowMessage('Servidor ativo');
end;

procedure TConexaoServerForm.IdTCPServerExecute(AContext: TIdContext);
var
  liOcorre      : Integer;
  lsApelido,
  lsIP,
  lsMsgCompleta,
  lsMsgEnviada : String;
begin
  lsMsgCompleta := AContext.Connection.Socket.ReadLn;
  lsApelido     := StringItem(lsMsgCompleta, 1, ';');
  lsIP          := StringItem(lsMsgCompleta, 2, ';');
  lsMsgEnviada  := StringItem(lsMsgCompleta, 3, ';');
  if Pos('/*CONECTADO*/', lsMsgEnviada) > 0 then
  begin
    lsMsgEnviada := lsApelido + ' entrou no chat';
    Self.op_AtualizaConectados(lsIP, True);
  end else
    lsMsgEnviada := lsApelido + ': ' + lsMsgEnviada;

  Self.op_RepassaMsgParaTodos(lsMsgEnviada);
end;

procedure TConexaoServerForm.op_RepassaMsgParaTodos(const asMsg : String);
var
  I      : Integer;
  loList : TStringList;
begin
  try
    loList      := TStringList.Create;
    loList.Text := UsuariosConectadosMemo.Text;
    for I := 0 to Pred(loList.Count) do
    begin
      Self.op_EncaminhaMsg(asMsg,
                           PortaEdit.Text,
                           Trim(loList[I]));
    end;
  finally
    loList.Free;
  end;
end;

procedure TConexaoServerForm.op_AtualizaConectados(const asIP : String; const abAdiciona : Boolean);
var
  loList : TStringList;
  I      : Integer;
begin
  if (Pos(asIP, UsuariosConectadosMemo.Text) > 0) then
  begin
    if not abAdiciona then
    begin
      try
        loList := TStringList.Create;
        loList.Text := UsuariosConectadosMemo.Text;
        UsuariosConectadosMemo.Text := '';
        for I := 0 to Pred(loList.Count) do
        begin
          if (Pos(asIP, loList[I]) > 0) then
            UsuariosConectadosMemo.Text := UsuariosConectadosMemo.Text + loList[I] + #13#10;
        end;
        UsuariosConectadosMemo.Text := Trim(UsuariosConectadosMemo.Text);
      finally
        loList.Free;
      end;
    end;
  end else
    UsuariosConectadosMemo.Text := UsuariosConectadosMemo.Text + #13#10 + asIP;
end;

procedure TConexaoServerForm.op_EncaminhaMsg(const asMsg, asPorta, asIP : String);
begin
  if (asMsg <> '') and (asPorta <> '') and (asIP <> '') then
  begin
    IdTCPClient.Host := asIP;
    IdTCPClient.Port := StrToInt(asPorta);
    with IdTCPClient do
    begin
      try
        Connect;
        with Socket do
          WriteLn(asMsg);
        Disconnect;
      except
        on E : Exception do
          ShowMessage('Erro ao encaminhar mensagem' + #13#10 + e.Message );
      end;
    end;
  end;
end;

function TConexaoServerForm.StringItem(const S: string; Posicao: Integer; const Separador: char): string;
var
  I, Contador: Integer;
  St: string;
begin
  St := '';
  if (Posicao < 1) then
    Posicao := 1;
  Contador := 1;
  for I := 1 to Length(S) do
  begin
    if S[I] = Separador then
    begin
      if Contador = Posicao then
      begin
        Result := St;
        Break;
      end;
      Inc(Contador);
      St := '';
    end
    else
      St := St + S[I];
  end;
  if Posicao > Contador then
    St := '';
  Result := St;
end;



end.
