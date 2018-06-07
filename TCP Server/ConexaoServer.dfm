object ConexaoServerForm: TConexaoServerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servidor'
  ClientHeight = 454
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label1: TLabel
    Left = 19
    Top = 248
    Width = 239
    Height = 13
    Caption = 'Retorno para o client se a mensagem for recebida'
  end
  object TLabel
    Left = 19
    Top = 111
    Width = 152
    Height = 13
    Caption = 'Mensagens recebidas do cliente'
  end
  object Edit2: TEdit
    Left = 8
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '212'
  end
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 11
    Top = 130
    Width = 329
    Height = 111
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 19
    Top = 267
    Width = 321
    Height = 21
    TabOrder = 3
    Text = 'Recebido mensagem com sucesso'
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnExecute = IdTCPServer1Execute
    Left = 240
    Top = 24
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 248
    Top = 72
  end
end
