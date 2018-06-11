object ConexaoClientForm: TConexaoClientForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 424
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ConectarPanel: TPanel
    Left = 0
    Top = 0
    Width = 283
    Height = 193
    Align = alTop
    Caption = '8'
    TabOrder = 0
    object PortaLabel: TLabel
      Left = 83
      Top = 62
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object IPServidorLabel: TLabel
      Left = 83
      Top = 18
      Width = 52
      Height = 13
      Caption = 'IP servidor'
    end
    object ApelidoLabel: TLabel
      Left = 83
      Top = 105
      Width = 35
      Height = 13
      Caption = 'Apelido'
    end
    object PortaEdit: TEdit
      Left = 83
      Top = 81
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '212'
    end
    object IPServidorEdit: TEdit
      Left = 83
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object ApelidoEdit: TEdit
      Left = 83
      Top = 124
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object ConectarButton: TButton
      Left = 102
      Top = 151
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 3
      OnClick = ConectarButtonClick
    end
  end
  object MensagemPanel: TPanel
    Left = 0
    Top = 193
    Width = 283
    Height = 231
    Align = alClient
    Enabled = False
    TabOrder = 1
    object MensagemLabel: TLabel
      Left = 16
      Top = 150
      Width = 51
      Height = 13
      Caption = 'Mensagem'
    end
    object ChatLabel: TLabel
      Left = 16
      Top = 6
      Width = 103
      Height = 13
      AutoSize = False
      Caption = 'Chat'
    end
    object MensagemEdit: TEdit
      Left = 16
      Top = 169
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object MensagensRecebidasMemo: TMemo
      Left = 16
      Top = 25
      Width = 250
      Height = 119
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object EnviarButton: TButton
      Left = 191
      Top = 169
      Width = 75
      Height = 22
      Caption = 'Enviar'
      TabOrder = 2
      OnClick = EnviarButtonClick
    end
  end
  object IdTCPClient: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 72
    Top = 248
  end
  object IdTCPServer: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnExecute = IdTCPServerExecute
    Left = 144
    Top = 240
  end
end
