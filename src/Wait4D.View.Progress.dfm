object frmProgress: TfrmProgress
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmProgress'
  ClientHeight = 120
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 300
    Height = 120
    Align = alClient
    Brush.Style = bsClear
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitTop = 32
    ExplicitWidth = 370
    ExplicitHeight = 138
  end
  object lblTitulo: TLabel
    Left = 0
    Top = 20
    Width = 300
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblTitulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lblDescricao: TLabel
    Left = 0
    Top = 40
    Width = 300
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblDescricao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object ProgressBar1: TProgressBar
    Left = 30
    Top = 70
    Width = 240
    Height = 17
    TabOrder = 0
  end
end
