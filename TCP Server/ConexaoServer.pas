unit ConexaoServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdTCPServer, IdContext, IdTCPConnection,
  IdTCPClient;

type
  TConexaoServerForm = class(TForm)
    IdTCPServer1: TIdTCPServer;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    IdTCPClient1: TIdTCPClient;
    procedure Button1Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure FormClick(Sender: TObject);
  private
    function StringItem(const S: string; Posicao: Integer; const Separador: char): string;
    procedure op_EncaminhaMsg(const asMsg, asPorta, asIP: String);
  end;

var
  ConexaoServerForm: TConexaoServerForm;

implementation

{$R *.dfm}

procedure TConexaoServerForm.Button1Click(Sender: TObject);
begin
  IdTCPServer1.DefaultPort := StrToInt(Edit2.Text);
  IdTCPServer1.Active := True;
  Button1.Enabled := False;
  ShowMessage('Conectado');
end;

procedure TConexaoServerForm.FormClick(Sender: TObject);
begin
Self.op_EncaminhaMsg('testeeeeeee',
                       '212',
                       '127.0.0.1');
end;

procedure TConexaoServerForm.IdTCPServer1Execute(AContext: TIdContext);
var
  liOcorre : Integer;
  lsMsg    : String;
begin
  lsMsg := AContext.Connection.Socket.ReadLn;
  Memo1.Text := Memo1.Text + #13#10 + lsMsg;
  AContext.Connection.Socket.WriteLn(Edit1.Text);

  Self.op_EncaminhaMsg(StringItem(lsMsg, 3, ';'),
                       StringItem(lsMsg, 2, ';'),
                       StringItem(lsMsg, 1, ';'));
end;

procedure TConexaoServerForm.op_EncaminhaMsg(const asMsg, asPorta, asIP : String);
begin
  if asMsg <> '' then
  begin
    IdTCPClient1.Host := asIP;
    IdTCPClient1.Port := StrToInt(asPorta);
    with IdTCPClient1 do
    begin
      try
        Connect;
        with Socket do
          WriteLn(asMsg);
        Disconnect;
      except
        on E : Exception do
          ShowMessage('Erro ao encaminhar mensagem' + #13#10 + e.message);
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
