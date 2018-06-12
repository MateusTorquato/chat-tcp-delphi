#  <img src="https://www.embarcadero.com/images/logos/DX_Logo_76x76px.png" width="35"> Chat TCP - Delphi XE7

Chat TCP utilizando Delphi XE7. Tanto _client_ quanto servidor utilizam os componentes TIdTCPServer e TIdTCPClient. 

Como funciona: Ao ativar o servidor, ele irá ficar "no ar", e os clientes poderão conectar no mesmo. Ao conectar no servidor o mesmo armazena os endereços dos clientes internamente. Quando o cliente envia uma mensagem, ele direciona para o servidor, e o servidor redireciona para todos os IPs cadastrados (todos os clientes conectados). 

Dessa forma seu funcionamento é como um bate-papo, onde temos um servidor que redireciona todas as mensagens que ele recebe à todos os clientes conectados.