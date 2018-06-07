unit ConexaoClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdContext, IdCustomTCPServer, IdTCPServer,
  Vcl.StdCtrls;

type
  TConexaoClientForm = class(TForm)
    IdTCPClient1: TIdTCPClient;
    PortaEdit: TEdit;
    MensagemMemo: TMemo;
    Label1: TLabel;
    IPServidorEdit: TEdit;
    Button2: TButton;
    IpDestinoEdit: TEdit;
    Label3: TLabel;
    RetornoServidorMemo: TMemo;
    MensagensRecebidasMemo: TMemo;
    IdTCPServer1: TIdTCPServer;
    procedure Button1Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConexaoClientForm: TConexaoClientForm;

implementation

{$R *.dfm}

procedure TConexaoClientForm.Button1Click(Sender: TObject);
var
  lsEnvio: String;
  i      : Integer;
begin
  if MensagemMemo.Text <> '' then
  begin
    IdTCPClient1.Host := IPServidorEdit.Text;
    IdTCPClient1.Port := StrToInt(PortaEdit.Text);
    with IdTCPClient1 do
    begin
      try
        Connect;
        with Socket do
        begin
          lsEnvio := IpDestinoEdit.Text + ';' + PortaEdit.Text + ';' + StringReplace(MensagemMemo.Text, #13#10, ';', [rfReplaceAll]);
          WriteLn(lsEnvio);
          RetornoServidorMemo.Text := RetornoServidorMemo.Text + #13#10 +  ReadLn;
        end;
        MensagemMemo.Text := '';
        Disconnect;
      except
        ShowMessage('Erro ao se conectar ao servidor')
      end;
    end;
  end;
end;

procedure TConexaoClientForm.FormCreate(Sender: TObject);
begin
  IdTCPServer1.DefaultPort := StrToInt(PortaEdit.Text);
  IdTCPServer1.Active      := True;
end;

procedure TConexaoClientForm.IdTCPServer1Execute(AContext: TIdContext);
begin
  MensagensRecebidasMemo.Text := MensagensRecebidasMemo.Text + #13#10 + AContext.Connection.Socket.ReadLn;
  // AContext.Connection.Socket.WriteLn('Servidor, já recebi tua msg');
end;

end.
