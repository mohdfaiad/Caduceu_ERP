object frmTotaisInterEstaduais: TfrmTotaisInterEstaduais
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Demonstrativo das Entradas / Presta'#231#245'es Interestaduais'
  ClientHeight = 377
  ClientWidth = 692
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
  object stgTotaisInterEstadual: TStringGrid
    Left = 3
    Top = 8
    Width = 681
    Height = 285
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
      91
      106
      93
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
    Top = 301
    Width = 681
    Height = 29
    Alignment = taLeftJustify
    Caption = ' Totais'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object edtTVContalbil: TEdit
      Left = 109
      Top = 4
      Width = 94
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 0
      Text = '0,00'
    end
    object edtTBCalculo: TEdit
      Left = 204
      Top = 4
      Width = 85
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 1
      Text = '0,00'
    end
    object edtIsentas: TEdit
      Left = 290
      Top = 4
      Width = 90
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 2
      Text = '0,00'
    end
    object edtOutras: TEdit
      Left = 381
      Top = 4
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 3
      Text = '0,00'
    end
    object edtICMSRetido: TEdit
      Left = 482
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 4
      Text = '0,00'
    end
    object edtBaseICMSR: TEdit
      Left = 575
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 5
      Text = '0,00'
    end
  end
  object btnSair: TButton
    Left = 611
    Top = 339
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object fdqTotalizaValorContabil: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 80
    Top = 72
  end
  object fdqTotalizaIsentas: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 232
    Top = 72
  end
  object fdqTotalizaOutras: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 72
  end
end
