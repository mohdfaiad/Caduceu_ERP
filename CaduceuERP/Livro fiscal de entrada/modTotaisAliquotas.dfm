object frmTotaisAliquotas: TfrmTotaisAliquotas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Totaliza'#231#227'o por Al'#237'quotas'
  ClientHeight = 304
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stgTotaisAliquotas: TStringGrid
    Left = 8
    Top = 8
    Width = 241
    Height = 257
    ColCount = 2
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ColWidths = (
      80
      127)
    RowHeights = (
      24
      24)
  end
  object btnSair: TButton
    Left = 175
    Top = 271
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object fdqTotalizaAliquotas: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from zan_pedido')
    Left = 102
    Top = 164
  end
end
