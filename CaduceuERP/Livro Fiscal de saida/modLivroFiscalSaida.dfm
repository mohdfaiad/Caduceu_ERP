object frmModLivrosFiscais: TfrmModLivrosFiscais
  Left = 0
  Top = 0
  ActiveControl = edtDataInicial
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 552
  ClientWidth = 788
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
  object tbrFerramentas: TToolBar
    Left = 0
    Top = 2
    Width = 301
    Height = 54
    Cursor = crHandPoint
    Align = alNone
    ButtonHeight = 54
    ButtonWidth = 43
    HotImages = dmDBEXMaster.imgHot
    Images = dmDBEXMaster.imgHot
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnIncluir: TToolButton
      Left = 0
      Top = 0
      Action = actIncluir
    end
    object btnDesfazer: TToolButton
      Left = 43
      Top = 0
      Action = actCancelar
    end
    object btnSalvar: TToolButton
      Left = 86
      Top = 0
      Action = actSalvar
    end
    object btnExcluir: TToolButton
      Left = 129
      Top = 0
      Action = actExcluir
    end
    object btnEditar: TToolButton
      Left = 172
      Top = 0
      Action = actEditar
    end
    object btnConfirmarNF: TToolButton
      Left = 215
      Top = 0
      Action = actImprimir
    end
    object btnSair: TToolButton
      Left = 258
      Top = 0
      Action = actSair
    end
  end
  object pgcLivroFiscalSaida: TPageControl
    Left = 0
    Top = 57
    Width = 785
    Height = 384
    ActivePage = tbsTabela
    TabOrder = 1
    object tbsTabela: TTabSheet
      Caption = 'Tabela'
      object grdConsulta: TDBGrid
        Left = 0
        Top = 0
        Width = 777
        Height = 356
        Cursor = crHandPoint
        Align = alClient
        DataSource = dmMSource.dtsLivroFiscalSaida
        Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgConfirmDelete]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grdConsultaDrawColumnCell
        OnDblClick = grdConsultaDblClick
        OnKeyPress = grdConsultaKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'DATA_DOCUMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ESPECIE_DOCUMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Title.Alignment = taCenter
            Title.Caption = 'Cfop'
            Width = 46
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMERO_DOCUMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#250'mero Doc'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_CONTABIL'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Cont'#225'bil'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_CALCULO'
            Title.Alignment = taCenter
            Title.Caption = 'Base C'#225'lculo'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPOSTO_DEBITADO'
            Title.Alignment = taCenter
            Title.Caption = 'D'#233'bito'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'Al'#237'quota'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ISENTAS_NAO_TRIBUTADAS'
            Title.Alignment = taCenter
            Title.Caption = 'Isentas NT'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OUTRAS'
            Title.Alignment = taCenter
            Title.Caption = 'Outras'
            Width = 69
            Visible = True
          end>
      end
      object pnlMsgAguarde: TPanel
        Left = 276
        Top = 160
        Width = 185
        Height = 41
        Caption = 'Aguarde.....'
        TabOrder = 1
        Visible = False
      end
    end
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grpEmpresa: TGroupBox
        Left = 3
        Top = 32
        Width = 452
        Height = 81
        Caption = #39
        Enabled = False
        TabOrder = 0
        object lblRSocial: TLabel
          Left = 16
          Top = 16
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
          Left = 16
          Top = 59
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
          Left = 93
          Top = 56
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
      object grpDocumentosFiscais: TGroupBox
        Left = 6
        Top = 115
        Width = 452
        Height = 234
        Caption = 'Documentos Fiscais'
        Enabled = False
        TabOrder = 1
        object lblDataEntrada: TLabel
          Left = 16
          Top = 28
          Width = 38
          Height = 13
          Caption = 'Emiss'#227'o'
        end
        object lblEspecieDocumento: TLabel
          Left = 16
          Top = 72
          Width = 40
          Height = 13
          Caption = 'Esp'#233'cie:'
        end
        object lblSerieSubSerie: TLabel
          Left = 16
          Top = 94
          Width = 74
          Height = 13
          Caption = 'S'#233'rie/SubSerie:'
        end
        object lblNumeroDocumento: TLabel
          Left = 16
          Top = 116
          Width = 65
          Height = 13
          Caption = 'N'#250'mero doc.:'
        end
        object lblUFOrigem: TLabel
          Left = 16
          Top = 138
          Width = 55
          Height = 13
          Caption = 'UF destino:'
        end
        object lblValorContabil: TLabel
          Left = 16
          Top = 160
          Width = 70
          Height = 13
          Caption = 'Valor Cont'#225'bil:'
        end
        object lblCfop: TLabel
          Left = 16
          Top = 182
          Width = 27
          Height = 13
          Caption = 'Cfop:'
        end
        object lblMesAnoRef: TLabel
          Left = 16
          Top = 50
          Width = 75
          Height = 13
          Caption = 'M'#234's refer'#234'ncia:'
        end
        object edtDataDocumento: TDBEdit
          Left = 93
          Top = 25
          Width = 97
          Height = 21
          DataField = 'DATA_DOCUMENTO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 0
          OnEnter = edtpesquisaEnter
          OnExit = edtDataDocumentoExit
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtpesquisaKeyPress
        end
        object edtEspecieDocumento: TDBEdit
          Left = 93
          Top = 69
          Width = 49
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO_ESPECIE_DOCUMENTO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 2
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtpesquisaKeyPress
        end
        object edtSerieSubSerie: TDBEdit
          Left = 93
          Top = 91
          Width = 97
          Height = 21
          DataField = 'SERIE_SUBSERIE'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 3
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtpesquisaKeyPress
        end
        object edtNumeroDocumento: TDBEdit
          Left = 93
          Top = 113
          Width = 97
          Height = 21
          DataField = 'NUMERO_DOCUMENTO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 4
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtpesquisaKeyPress
        end
        object edtUFDestino: TDBEdit
          Left = 93
          Top = 135
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF_DESTINATARIO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 5
          OnEnter = edtpesquisaEnter
          OnExit = edtUFDestinoExit
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtpesquisaKeyPress
        end
        object edtValorContabil: TDBEdit
          Left = 93
          Top = 157
          Width = 97
          Height = 21
          DataField = 'VALOR_CONTABIL'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 6
          OnEnter = edtpesquisaEnter
          OnExit = edtValorContabilExit
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtCfop: TDBEdit
          Left = 93
          Top = 179
          Width = 47
          Height = 21
          DataField = 'CFOP'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 7
          OnEnter = edtpesquisaEnter
          OnExit = edtCfopExit
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtMesAnoKeyPress
        end
        object edtMesAno: TDBEdit
          Left = 93
          Top = 47
          Width = 97
          Height = 21
          DataField = 'MES_ANO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 1
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtMesAnoKeyPress
        end
      end
      object grpValoresFiscais: TGroupBox
        Left = 459
        Top = 115
        Width = 315
        Height = 234
        Caption = 'Valores fiscais'
        Enabled = False
        TabOrder = 2
        object lblBaseCalculo: TLabel
          Left = 5
          Top = 62
          Width = 62
          Height = 13
          Caption = 'Base c'#225'lculo:'
        end
        object lblAliquota: TLabel
          Left = 5
          Top = 84
          Width = 43
          Height = 13
          Caption = 'Al'#237'quota:'
        end
        object lblImpostoCreditado: TLabel
          Left = 5
          Top = 106
          Width = 88
          Height = 13
          Caption = 'Imposto debitado:'
        end
        object lblObservacao: TLabel
          Left = 5
          Top = 175
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object lblIsentasNT: TLabel
          Left = 5
          Top = 128
          Width = 75
          Height = 13
          Caption = 'Isentas N/ Trib:'
        end
        object lblOutras: TLabel
          Left = 5
          Top = 150
          Width = 37
          Height = 13
          Caption = 'Outras:'
        end
        object grpIdentICMS_IPI: TDBRadioGroup
          Left = 5
          Top = 19
          Width = 307
          Height = 30
          Caption = 'Identifica'#231#227'o'
          Columns = 2
          DataField = 'IDENTIFICACAO_ICMS_IPI'
          DataSource = dmMSource.dtsLivroFiscalSaida
          Items.Strings = (
            'Icms'
            'Ipi')
          TabOrder = 6
          Values.Strings = (
            '0'
            '1')
        end
        object edtBaseCalculo: TDBEdit
          Left = 103
          Top = 59
          Width = 98
          Height = 21
          DataField = 'BASE_CALCULO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 0
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtAliquota: TDBEdit
          Left = 103
          Top = 81
          Width = 63
          Height = 21
          DataField = 'ALIQUOTA'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 1
          OnEnter = edtpesquisaEnter
          OnExit = edtAliquotaExit
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtImpostoDebitado: TDBEdit
          Left = 103
          Top = 103
          Width = 98
          Height = 21
          DataField = 'IMPOSTO_DEBITADO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 2
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtObservacao: TDBEdit
          Left = 5
          Top = 195
          Width = 304
          Height = 21
          DataField = 'OBSERVACAO'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 5
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtpesquisaKeyPress
        end
        object edtIsentasNT: TDBEdit
          Left = 103
          Top = 125
          Width = 98
          Height = 21
          DataField = 'ISENTAS_NAO_TRIBUTADAS'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 3
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtOutras: TDBEdit
          Left = 103
          Top = 147
          Width = 98
          Height = 21
          DataField = 'OUTRAS'
          DataSource = dmMSource.dtsLivroFiscalSaida
          TabOrder = 4
          OnEnter = edtpesquisaEnter
          OnExit = edtpesquisaEnter
          OnKeyDown = edtpesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 29
        Align = alTop
        Caption = 'L I V R O   R E G I S T R O   D E   S A '#205' D A S'
        Color = 16638926
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object pnlTotais: TPanel
    Left = 0
    Top = 439
    Width = 788
    Height = 46
    Align = alBottom
    Enabled = False
    TabOrder = 2
    object grpValorContabil: TGroupBox
      Left = 5
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Valor Cont'#225'bil'
      TabOrder = 0
      object edtTotalValorContabil: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object grpBaseCalculo: TGroupBox
      Left = 161
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Base c'#225'lculo'
      TabOrder = 1
      object edtTotalBaseCalculo: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object grpImpostoCreditado: TGroupBox
      Left = 317
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Imposto Debitado'
      TabOrder = 2
      object edtTotalImpostoDebitado: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object grpIsentasNTributada: TGroupBox
      Left = 473
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Isentas / N. Tibutadas'
      TabOrder = 3
      object edtTotalIsentasNtributadas: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object GroupBox1: TGroupBox
      Left = 629
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Outras'
      TabOrder = 4
      object edtTotalOutras: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
  end
  object pnlBotoesTotais: TPanel
    Left = 0
    Top = 485
    Width = 788
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btnTotalporCFOP: TButton
      Left = 7
      Top = 9
      Width = 168
      Height = 25
      Cursor = crHandPoint
      Caption = 'Totais por CFOP'
      TabOrder = 0
      OnClick = btnTotalporCFOPClick
    end
    object btnTotaisporAliquota: TButton
      Left = 216
      Top = 9
      Width = 207
      Height = 25
      Cursor = crHandPoint
      Caption = 'Totais por Al'#237'quotas'
      TabOrder = 1
      OnClick = btnTotaisporAliquotaClick
    end
    object btnDemonstrativoEntradas: TButton
      Left = 453
      Top = 9
      Width = 328
      Height = 25
      Cursor = crHandPoint
      Caption = 'Demonstrativo das Entradas / Presta'#231#245'es Interestaduais'
      TabOrder = 2
      OnClick = btnDemonstrativoEntradasClick
    end
  end
  object stbAtalho: TStatusBar
    Left = 0
    Top = 526
    Width = 788
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
  end
  object grpPeriodo: TGroupBox
    Left = 303
    Top = 0
    Width = 160
    Height = 56
    Caption = 'Informe o per'#237'odo'
    TabOrder = 5
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
      OnKeyDown = edtpesquisaKeyDown
      OnKeyPress = edtpesquisaKeyPress
    end
    object edtDataFinal: TMaskEdit
      Left = 69
      Top = 33
      Width = 78
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = edtDataFinalEnter
      OnExit = edtDataFinalExit
      OnKeyDown = edtpesquisaKeyDown
      OnKeyPress = edtpesquisaKeyPress
    end
  end
  object grpMesAno: TGroupBox
    Left = 464
    Top = 0
    Width = 142
    Height = 56
    Caption = 'Selecione o M'#234's/Ano'
    TabOrder = 6
    object cboPeriodoApuracao: TComboBox
      Left = 5
      Top = 20
      Width = 134
      Height = 21
      Style = csDropDownList
      PopupMenu = mnuLimparPeriodo
      TabOrder = 0
      OnCloseUp = cboPeriodoApuracaoExit
      OnExit = cboPeriodoApuracaoExit
      OnKeyPress = edtpesquisaKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 608
    Top = 0
    Width = 172
    Height = 56
    Caption = 'Informe o n'#250'mero do documento'
    TabOrder = 7
    object edtpesquisa: TEdit
      Left = 14
      Top = 20
      Width = 155
      Height = 21
      Hint = 'digite aqui, o conte'#250'do para pesquisa'
      CharCase = ecUpperCase
      TabOrder = 0
      OnEnter = edtpesquisaEnter
      OnExit = edtpesquisaExit
      OnKeyDown = edtpesquisaKeyDown
      OnKeyPress = edtpesquisaKeyPress
    end
  end
  object actLivroSaida: TActionList
    Images = dmDBEXMaster.imgHot
    Left = 712
    Top = 184
    object actIncluir: TAction
      Caption = 'Incluir'
      Hint = 'Incluir'
      ImageIndex = 0
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      ImageIndex = 1
      ShortCut = 114
      OnExecute = actCancelarExecute
    end
    object actSalvar: TAction
      Caption = 'Salvar'
      ImageIndex = 2
      ShortCut = 115
      OnExecute = actSalvarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = actExcluirExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      ImageIndex = 4
      ShortCut = 117
      OnExecute = actEditarExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      ImageIndex = 7
      OnExecute = actSairExecute
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      ImageIndex = 9
      OnExecute = actImprimirExecute
    end
  end
  object mnuLimparPeriodo: TPopupMenu
    Left = 712
    Top = 128
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
  end
  object fdqTotalizaAliquotas: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 121
  end
  object fdqSomar_IsentasNT_LFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 169
  end
  object fdqTotalizaBase: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 217
  end
  object fdqTotalizaValorContabil: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 267
  end
  object fdqTotalizaIsentasNT: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 317
  end
  object fdqTotalizaOutras: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 352
    Top = 366
  end
  object fdqSomar_VContabLFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 212
    Top = 121
  end
  object fdqSelecionaPeriodo: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_SAIDA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO')
    Left = 212
    Top = 169
  end
  object fdqSomar_BCalculoLFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 212
    Top = 217
  end
  object fdqSomar_OutrasLFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 212
    Top = 267
  end
  object fdqSomar_ImpostoDebLFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 212
    Top = 317
  end
  object fdqTotalizaImpDebitado: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    Left = 212
    Top = 366
  end
end
