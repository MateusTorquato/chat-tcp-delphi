program Server;

uses
  Vcl.Forms,
  ConexaoServer in 'ConexaoServer.pas' {ConexaoServerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConexaoServerForm, ConexaoServerForm);
  Application.Run;
end.
