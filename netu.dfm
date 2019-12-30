object f1: Tf1
  Left = 318
  Top = -4
  Width = 435
  Height = 63
  Caption = '0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cb1: TCheckBox
    Left = 40
    Top = 10
    Width = 116
    Height = 17
    Caption = 'active?'
    TabOrder = 0
    OnClick = cb1Click
  end
  object ss1: TServerSocket
    Active = False
    Port = 666
    ServerType = stNonBlocking
    OnAccept = ss1Accept
    OnClientDisconnect = ss1ClientDisconnect
    OnClientRead = ss1ClientRead
    Left = 5
    Top = 5
  end
end
