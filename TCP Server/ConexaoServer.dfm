object ConexaoServerForm: TConexaoServerForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servidor'
  ClientHeight = 431
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ConexaoPanel: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 105
    Align = alTop
    TabOrder = 0
    object PortaLabel: TLabel
      Left = 128
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object ConectarButton: TButton
      Left = 152
      Top = 62
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 0
      OnClick = ConectarButtonClick
    end
    object PortaEdit: TEdit
      Left = 128
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '212'
    end
  end
  object MensagemPanel: TPanel
    Left = 0
    Top = 105
    Width = 350
    Height = 326
    Align = alClient
    TabOrder = 1
    object MensagensRecebidasLabel: TLabel
      Left = 8
      Top = 15
      Width = 157
      Height = 13
      Caption = 'Mensagens recebidas de clientes'
    end
    object UsuariosConectadosLabel: TLabel
      Left = 8
      Top = 151
      Width = 99
      Height = 13
      Caption = 'Usu'#225'rios conectados'
    end
    object MensagensRecebidasMemo: TMemo
      Left = 8
      Top = 34
      Width = 329
      Height = 111
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object UsuariosConectadosMemo: TMemo
      Left = 8
      Top = 170
      Width = 329
      Height = 111
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object IdTCPServer: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnExecute = IdTCPServerExecute
    Left = 80
    Top = 176
  end
  object IdTCPClient: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 160
    Top = 184
  end
end
