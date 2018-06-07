object ConexaoClientForm: TConexaoClientForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 496
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 24
    Top = 118
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label1: TLabel
    Left = 24
    Top = 26
    Width = 52
    Height = 13
    Caption = 'IP servidor'
  end
  object Label3: TLabel
    Left = 24
    Top = 70
    Width = 84
    Height = 13
    Caption = 'IP destino (client)'
  end
  object TLabel
    Left = 24
    Top = 175
    Width = 119
    Height = 13
    Caption = 'Mensagem a ser enviada'
  end
  object TLabel
    Left = 24
    Top = 287
    Width = 96
    Height = 13
    Caption = 'Retorno do servidor'
  end
  object TLabel
    Left = 24
    Top = 375
    Width = 103
    Height = 13
    Caption = 'Mensagens recebidas'
  end
  object PortaEdit: TEdit
    Left = 24
    Top = 137
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = '212'
  end
  object MensagemMemo: TMemo
    Left = 24
    Top = 194
    Width = 250
    Height = 63
    TabOrder = 3
  end
  object IPServidorEdit: TEdit
    Left = 24
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object Button2: TButton
    Left = 199
    Top = 263
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object IpDestinoEdit: TEdit
    Left = 24
    Top = 90
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object RetornoServidorMemo: TMemo
    Left = 24
    Top = 306
    Width = 250
    Height = 63
    ReadOnly = True
    TabOrder = 5
  end
  object MensagensRecebidasMemo: TMemo
    Left = 24
    Top = 394
    Width = 250
    Height = 63
    ReadOnly = True
    TabOrder = 6
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 184
    Top = 32
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnExecute = IdTCPServer1Execute
    Left = 184
    Top = 104
  end
end
