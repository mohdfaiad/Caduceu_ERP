object frmApuracaoICMS: TfrmApuracaoICMS
  Left = 0
  Top = 0
  ActiveControl = edtDataInicial
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 691
  ClientWidth = 792
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
  object pgcLivroFiscalSaida: TPageControl
    Left = 0
    Top = 60
    Width = 785
    Height = 603
    ActivePage = tbsCadastro
    TabOrder = 0
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object grpEmpresa: TGroupBox
        Left = 3
        Top = 16
        Width = 771
        Height = 58
        Caption = #39
        Enabled = False
        TabOrder = 0
        object lblRSocial: TLabel
          Left = 16
          Top = 15
          Width = 45
          Height = 13
          Caption = 'Empresa:'
        end
        object lblInscrEstadual: TLabel
          Left = 16
          Top = 37
          Width = 76
          Height = 13
          Caption = 'Inscr. Estadual:'
        end
        object lblCnpj: TLabel
          Left = 261
          Top = 38
          Width = 29
          Height = 13
          Caption = 'CNPJ:'
        end
        object lblMesAnoReferencia: TLabel
          Left = 464
          Top = 15
          Width = 56
          Height = 13
          Caption = 'Refer'#234'ncia:'
        end
        object edtRSocial: TEdit
          Left = 93
          Top = 12
          Width = 354
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object edtInscrEstadual: TEdit
          Left = 93
          Top = 34
          Width = 154
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edtCNPJ: TEdit
          Left = 293
          Top = 34
          Width = 154
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object edtMesAnoReferencia: TEdit
          Left = 541
          Top = 12
          Width = 154
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 74
        Width = 777
        Height = 18
        Caption = 'E N T R A D A S'
        Color = 16638926
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 18
        Align = alTop
        Caption = 'L I V R O   R E G I S T R O   A P U R A '#199' '#195' O   D O  I C M S '
        Color = 16638926
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object stgTotaisCfopEstadualE: TStringGrid
        Left = 52
        Top = 96
        Width = 703
        Height = 170
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
        TabOrder = 3
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
      object Panel3: TPanel
        Left = 52
        Top = 266
        Width = 703
        Height = 29
        Alignment = taLeftJustify
        Caption = ' Do Estado'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
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
      object Panel4: TPanel
        Left = 52
        Top = 295
        Width = 703
        Height = 29
        Alignment = taLeftJustify
        Caption = ' De Outros Estados'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
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
      object stgTotaisCfopEstadualS: TStringGrid
        Left = 52
        Top = 347
        Width = 703
        Height = 165
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
        TabOrder = 6
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
      object Panel5: TPanel
        Left = 52
        Top = 514
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
        TabOrder = 7
        object edtTVContalbilEST_S: TEdit
          Left = 222
          Top = 4
          Width = 94
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 0
          Text = '0,00'
        end
        object edtTBCalculoeST_S: TEdit
          Left = 317
          Top = 4
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 1
          Text = '0,00'
        end
        object edtDebitoEst: TEdit
          Left = 403
          Top = 4
          Width = 90
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 2
          Text = '0,00'
        end
        object edtIsentasNTEst_S: TEdit
          Left = 494
          Top = 4
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 3
          Text = '0,00'
        end
        object edtOutrasEst_S: TEdit
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
      object Panel6: TPanel
        Left = 52
        Top = 543
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
        TabOrder = 8
        object edtTVContalbilinter_S: TEdit
          Left = 222
          Top = 4
          Width = 94
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 0
          Text = '0,00'
        end
        object edtTBCalculoInter_S: TEdit
          Left = 317
          Top = 4
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 1
          Text = '0,00'
        end
        object edtDebitoInter: TEdit
          Left = 403
          Top = 4
          Width = 90
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 2
          Text = '0,00'
        end
        object edtIsentasNTInter_S: TEdit
          Left = 494
          Top = 4
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Color = 9164792
          TabOrder = 3
          Text = '0,00'
        end
        object edtOutrasInter_S: TEdit
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
      object Panel7: TPanel
        Left = 0
        Top = 325
        Width = 777
        Height = 18
        Caption = 'S A '#205' D A S '
        Color = 16638926
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
      end
    end
  end
  object stbAtalho: TStatusBar
    Left = 0
    Top = 665
    Width = 792
    Height = 26
    Panels = <
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end>
    OnDrawPanel = stbAtalhoDrawPanel
  end
  object grpPeriodo: TGroupBox
    Left = 2
    Top = 0
    Width = 160
    Height = 56
    Caption = 'Informe o per'#237'odo'
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 15
      Width = 55
      Height = 13
      Caption = 'Data inicial:'
    end
    object Label3: TLabel
      Left = 13
      Top = 36
      Width = 50
      Height = 13
      Caption = 'Data final:'
    end
    object edtDataInicial: TMaskEdit
      Left = 69
      Top = 11
      Width = 78
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtDataInicialEnter
      OnExit = edtDataInicialExit
      OnKeyDown = edtDataInicialKeyDown
      OnKeyPress = edtDataInicialKeyPress
    end
    object edtDataFinal: TMaskEdit
      Left = 69
      Top = 32
      Width = 78
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = edtDataFinalEnter
      OnExit = edtDataFinalExit
      OnKeyDown = edtDataInicialKeyDown
      OnKeyPress = edtDataInicialKeyPress
    end
  end
  object grpMesAno: TGroupBox
    Left = 163
    Top = 0
    Width = 142
    Height = 56
    Caption = 'Selecione o M'#234's/Ano'
    TabOrder = 3
    object cboPeriodoApuracao: TComboBox
      Left = 5
      Top = 20
      Width = 134
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnCloseUp = cboPeriodoApuracaoExit
      OnExit = cboPeriodoApuracaoExit
      OnKeyPress = edtDataInicialKeyPress
    end
  end
  object grpPesquisa: TGroupBox
    Left = 306
    Top = 0
    Width = 172
    Height = 56
    Caption = 'Informe o n'#250'mero do documento'
    TabOrder = 4
    object edtPesquisa: TEdit
      Left = 8
      Top = 20
      Width = 155
      Height = 21
      Hint = 'digite aqui, o conte'#250'do para pesquisa'
      CharCase = ecUpperCase
      TabOrder = 0
      OnEnter = edtPesquisaEnter
      OnExit = edtPesquisaExit
      OnKeyDown = edtDataInicialKeyDown
      OnKeyPress = edtDataInicialKeyPress
    end
  end
  object btnIprimirApuracao: TButton
    Left = 480
    Top = 8
    Width = 89
    Height = 25
    Action = actImprimirApuracao
    TabOrder = 5
  end
  object Button2: TButton
    Left = 573
    Top = 8
    Width = 112
    Height = 25
    Action = actImprimirResumoApuracao
    Caption = 'Resumo Apura'#231#227'o'
    TabOrder = 6
  end
  object Button3: TButton
    Left = 709
    Top = 8
    Width = 76
    Height = 25
    Action = actSair
    TabOrder = 7
  end
  object pnlMsgAguarde: TPanel
    Left = 314
    Top = 248
    Width = 185
    Height = 41
    Caption = 'Aguarde.....'
    TabOrder = 8
    Visible = False
  end
  object actApuracaoICMS: TActionList
    Images = dmDBEXMaster.imgHot
    Left = 120
    Top = 104
    object actSair: TAction
      Caption = 'Sair'
      ImageIndex = 7
      OnExecute = actSairExecute
    end
    object actImprimirApuracao: TAction
      Caption = 'Apura'#231#227'o'
      ImageIndex = 9
      OnExecute = actImprimirApuracaoExecute
    end
    object actImprimirResumoApuracao: TAction
      Caption = 'actImprimirResumoApuracao'
      ImageIndex = 9
      OnExecute = actImprimirResumoApuracaoExecute
    end
  end
  object sqqSelecionaPeriodo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MES_ANO, SUM(VALOR_CONTABIL) AS VC FROM LIVRO_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 224
    Top = 16
  end
  object sqqTotalizaVContabilE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_EN' +
        'TRADA.VALOR_CONTABIL),0) AS VC_E'
      'FROM LIVRO_ENTRADA LIVRO_ENTRADA'
      'JOIN CFOP CFOP'
      'ON(LIVRO_ENTRADA.CFOP = CFOP.CFOP)'
      'GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO')
    Left = 64
    Top = 152
  end
  object sqqTotalizaBCalculoE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 200
  end
  object sqqTotalizaCredito_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 256
  end
  object sqqTotalizaIsentasNT_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 298
  end
  object sqqTotalizaOutras_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 344
  end
  object sqqTotalVLContEstadual_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 209
    Top = 151
  end
  object sqqTotalBCalculoEstadual_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 192
    Top = 208
  end
  object sqqTotalICreditadoEstadual_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 194
    Top = 257
  end
  object sqqTotalIsentasNTEstadual_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 194
    Top = 302
  end
  object sqqTotalOutrasEstadual_E: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 194
    Top = 345
  end
  object sqqTotalizaVContabil_IE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_EN' +
        'TRADA.VALOR_CONTABIL),0) AS VC_E'
      'FROM LIVRO_ENTRADA LIVRO_ENTRADA'
      'JOIN CFOP CFOP'
      'ON(LIVRO_ENTRADA.CFOP = CFOP.CFOP)'
      'GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO')
    Left = 440
    Top = 152
  end
  object sqqTotalizaBCalculo_IE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 328
    Top = 200
  end
  object sqqTotalICreditadoEstadual_IE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 328
    Top = 245
  end
  object sqqTotalIsentasNTEstadual_IE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 328
    Top = 290
  end
  object sqqTotalOutrasEstadual_IE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 330
    Top = 337
  end
  object sqqTotalizaVContabilS: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_EN' +
        'TRADA.VALOR_CONTABIL),0) AS VC_E'
      'FROM LIVRO_ENTRADA LIVRO_ENTRADA'
      'JOIN CFOP CFOP'
      'ON(LIVRO_ENTRADA.CFOP = CFOP.CFOP)'
      'GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO')
    Left = 64
    Top = 436
  end
  object sqqTotalizaBCalculoS: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 484
  end
  object sqqTotalizaDebito_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 524
  end
  object sqqTotalizaIsentasNT_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 568
  end
  object sqqTotalizaOutras_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 64
    Top = 609
  end
  object sqqTotalVLContEstadual_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 193
    Top = 438
  end
  object sqqTotalBCalculoEstadual_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 192
    Top = 480
  end
  object sqqTotalIDebitadoEstadual_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 194
    Top = 521
  end
  object sqqTotalIsentasNTEstadual_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 194
    Top = 566
  end
  object sqqTotalOutrasEstadual_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 194
    Top = 609
  end
  object sqqTotalizaVContabil_IE_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_EN' +
        'TRADA.VALOR_CONTABIL),0) AS VC_E'
      'FROM LIVRO_ENTRADA LIVRO_ENTRADA'
      'JOIN CFOP CFOP'
      'ON(LIVRO_ENTRADA.CFOP = CFOP.CFOP)'
      'GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO')
    Left = 354
    Top = 432
  end
  object sqqTotalizaBCalculo_IE_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 354
    Top = 480
  end
  object sqqTotalIDebitadoEstadual_IE_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 355
    Top = 522
  end
  object sqqTotalIsentasNTEstadual_IE_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 354
    Top = 565
  end
  object sqqTotalOutrasEstadual_IE_S: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 354
    Top = 617
  end
  object rdpLivroApuracao: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = True
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'LIVRO REGISTRO DE ENTRADAS'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'NOTURNO DESENVOLVIMENTO DE SOFTWARES'
    RegistroUsuario.SerieProduto = 'SINGLE-0216/01927'
    RegistroUsuario.AutorizacaoKey = 'GEHT-DCSS-R6OG-CWDZ-NOFG'
    About = 'RDprint 6.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Configura'#231#245'es'
    TitulodoRelatorio = 'L I V R O   A P U R A C A O   D O    I C M S '
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 160
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S20cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    FonteGrafica = sCourierNew
    ReduzParaCaber = True
    OnNewPage = rdpLivroApuracaoNewPage
    Left = 552
    Top = 232
  end
  object fdqDataApuracao: TFDQuery
    Left = 700
    Top = 108
  end
  object FDQuery1: TFDQuery
    Left = 701
    Top = 154
  end
end
