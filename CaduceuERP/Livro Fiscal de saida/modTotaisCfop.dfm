object frmTotaisCFOP: TfrmTotaisCFOP
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Totais por CFOP'
  ClientHeight = 484
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stgTotaisCfopEstadual: TStringGrid
    Left = 4
    Top = 11
    Width = 703
    Height = 183
    ColCount = 7
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
      44
      170
      99
      86
      86
      102
      89)
    RowHeights = (
      24
      24)
  end
  object Panel1: TPanel
    Left = 4
    Top = 196
    Width = 703
    Height = 29
    Alignment = taLeftJustify
    Caption = ' Totais no Estado'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object edtTVContalbilEST: TEdit
      Left = 222
      Top = 4
      Width = 94
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 0
      Text = '0,00'
    end
    object edtTBCalculoEst: TEdit
      Left = 317
      Top = 4
      Width = 85
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 1
      Text = '0,00'
    end
    object edtCreditoEst: TEdit
      Left = 403
      Top = 4
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 2
      Text = '0,00'
    end
    object edtIsentasNTEst: TEdit
      Left = 494
      Top = 4
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 3
      Text = '0,00'
    end
    object edtOutrasEst: TEdit
      Left = 595
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 4
      Text = '0,00'
    end
  end
  object stgTotaisCfopInter: TStringGrid
    Left = 1
    Top = 231
    Width = 703
    Height = 183
    ColCount = 7
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ColWidths = (
      44
      170
      99
      86
      86
      102
      89)
    RowHeights = (
      24
      24)
  end
  object Panel2: TPanel
    Left = 4
    Top = 416
    Width = 703
    Height = 29
    Alignment = taLeftJustify
    Caption = ' Totais outros Estados'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object edtTVContalbilinter: TEdit
      Left = 222
      Top = 4
      Width = 94
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 0
      Text = '0,00'
    end
    object edtTBCalculoInter: TEdit
      Left = 317
      Top = 4
      Width = 85
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 1
      Text = '0,00'
    end
    object edtCreditoInter: TEdit
      Left = 403
      Top = 4
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 2
      Text = '0,00'
    end
    object edtIsentasNTInter: TEdit
      Left = 494
      Top = 4
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 3
      Text = '0,00'
    end
    object edtOutrasInter: TEdit
      Left = 595
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 4
      Text = '0,00'
    end
  end
  object btnSair: TButton
    Left = 632
    Top = 453
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 4
    OnClick = btnSairClick
  end
  object fdqTotalizaImpCreditado: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 64
    Top = 64
  end
  object fdqTotalizaValorContabil: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 64
    Top = 112
  end
  object fdqTotalizaOutras: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 216
    Top = 64
  end
  object fdqTotalizaBase: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 216
    Top = 112
  end
  object fdqTotalizaIsentasNT: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 344
    Top = 64
  end
end
