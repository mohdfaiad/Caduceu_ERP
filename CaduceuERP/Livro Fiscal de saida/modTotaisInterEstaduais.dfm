object frmTotaisInterEstaduais: TfrmTotaisInterEstaduais
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Demonstrativo das Sa'#237'das / Presta'#231#245'es Interestaduais'
  ClientHeight = 371
  ClientWidth = 887
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
    Left = 8
    Top = 10
    Width = 873
    Height = 285
    ColCount = 9
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
      125
      114
      86
      86
      102
      72
      72
      94)
    RowHeights = (
      24
      24)
  end
  object Panel1: TPanel
    Left = 4
    Top = 301
    Width = 877
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
      Left = 102
      Top = 4
      Width = 123
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 0
      Text = '0,00'
    end
    object edtTBCalculo: TEdit
      Left = 226
      Top = 4
      Width = 111
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 1
      Text = '0,00'
    end
    object edtIsentas: TEdit
      Left = 338
      Top = 4
      Width = 84
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 2
      Text = '0,00'
    end
    object edtOutras: TEdit
      Left = 423
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 3
      Text = '0,00'
    end
    object edtICMSRetido: TEdit
      Left = 516
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 4
      Text = '0,00'
    end
    object edtBaseICMSR: TEdit
      Left = 609
      Top = 4
      Width = 78
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 5
      Text = '0,00'
    end
    object Edit1: TEdit
      Left = 688
      Top = 4
      Width = 76
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 6
      Text = '0,00'
    end
    object Edit2: TEdit
      Left = 765
      Top = 4
      Width = 92
      Height = 21
      Alignment = taRightJustify
      Color = 9164792
      TabOrder = 7
      Text = '0,00'
    end
  end
  object btnSair: TButton
    Left = 804
    Top = 338
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object fdqTotalizaValorContabil: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 112
    Top = 64
  end
  object fdqTotalizaOutras: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 112
    Top = 120
  end
  object fdqTotalizaIsentas: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 112
    Top = 184
  end
end
