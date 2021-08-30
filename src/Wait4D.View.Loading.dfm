object frmLoading: TfrmLoading
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmLoading'
  ClientHeight = 120
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
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
    ExplicitWidth = 428
    ExplicitHeight = 205
  end
  object lblTitulo: TLabel
    Left = 0
    Top = 69
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
    Top = 90
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
  object ActivityIndicator1: TActivityIndicator
    Left = 126
    Top = 10
    Animate = True
    IndicatorSize = aisLarge
    IndicatorType = aitSectorRing
  end
end
