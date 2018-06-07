program Client;

uses
  Vcl.Forms,
  ConexaoClient in 'ConexaoClient.pas' {ConexaoClientForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConexaoClientForm, ConexaoClientForm);
  Application.Run;
end.
