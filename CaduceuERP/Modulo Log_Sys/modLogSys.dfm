object frmLogSys: TfrmLogSys
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 659
  ClientWidth = 1169
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
  object imgSair: TImage
    Left = 1095
    Top = 611
    Width = 48
    Height = 47
    Cursor = crHandPoint
    Hint = 'Sair'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      000003504944415478DAED594D4C1341147ED31F502F852218201B84A4128F5A
      12BDD51BA870152F5E4C80C49F048C241EA418F00068E4A2085EBC78F0A2174D
      40BCF973B2F5E0A94204ACD61A14A89828D09FF1CDDA42BBCC6EB795FDA9E94B
      A6F33AB3B33BDF9B6FDF37BB4B28A550C8468A008A008A00FE7300FEB6A67AAC
      AE60398EA5968D491F8F85FEA32F6D4B60096199C432E47EE29BCF1B80AFD5DD
      8CD5434248191E47B166C76F0E48FF9FAF9FA53F82EEE9A6A7FE6739036091C7
      BEB7E83A7817D30900F37FA07B586E2594008C63D505E6B07B08803B1725009F
      B0AF562E5A3AAE00F3430840C815409C9DDF24002802B0E60AC054F91501105E
      BB2200A568E9BC020C80453300F6F20A884556D04FA89D34D81C4E128D2C690B
      40CDD296560BE0BA3E06ABBED7109C1841194A280FC0C9081D97A1ECA80766AE
      9E83F52F41E328B4AB4620AEC1315A52552D1EF67DF2114D82E047D2622542C7
      255AD9DA2EB6AF2F86E96CDF79B216FAA8FF0AD89D7BA1F1C67D28FD3B79D1D8
      B9100404EF0EC3D6EE60CB84AE5EA83C794A9C50CA36BE7D8540EF59882E2DEA
      BB02C46A85FD3D03C4E969DE163104417025288DC7C576FCA18C36556DEDDB22
      BCF2EA3999BFD987C7C6F4BF892D363BA9EBEEA74E4F0B48FAB6E844218336E9
      E75C7E314D1746BD24118D1A771313AB0DEABAAF41C5B1968C76914E538F8145
      564A1B66CB2FA761E19617682CA6E632DAEA80129D783ED206903604C1994307
      94E824431B1679ED854CD5DAAAA053BEB449375DB61262B6E9C46CD3DACE8D24
      DE1324383EBC999D4CB395107D8948F126021CB1330D857822C5B354760A8E0D
      014FECE44C330A6511294CA309BED825E924BBEDD085420AB449651B2664B262
      3785741A1FC1741A37864272B491669B6C62A7864E3B4EA192CA7D7070F401B1
      39CA65452A63AC8CD8C5562324D07386E2CE547F0AED696824AE81DB14417045
      4A3A11A9D84523CB74B6FF22F9F521605C16DA5D7F005C8377E0E7BB37AA442A
      4527C7A12330E3BD00BFE7DEABB98CB642C69ECA3616C3DB6823E7333AE17304
      590B7F36919015F243BD5901C4B1E20E32C012F9BCD82AF8578B1358751A1DFA
      A4E5F572B701FBFC608ED7EB6E04309713006605FD81236D25529F984E60A901
      ED6FEC9DFBC45408560460B41501186D050FE00F1A0E0EFB81E63A6500000000
      49454E44AE426082}
    ShowHint = True
    OnClick = imgSairClick
  end
  object pgcLog: TPageControl
    Left = 0
    Top = 0
    Width = 1169
    Height = 609
    ActivePage = tbsLog
    Align = alTop
    TabOrder = 0
    object tbsLog: TTabSheet
      Caption = 'Log'
      OnShow = tbsLogShow
      ExplicitTop = 23
      object imgFiltrar: TImage
        Left = 795
        Top = 20
        Width = 48
        Height = 50
        Cursor = crHandPoint
        Hint = 'Selecionar'
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F987000000097048597300000EC400000EC401952B0E1B
          000001214944415478DAEDD7CD0A82401007704DC1A028B243BDA0478F3E8547
          8FBE601D2A8A8204CDC63E4496B5C6654D36FE73D9AD9D9D9D1FF88176599696
          C9610360322008822B0D9E64699EA6E949C89DD17094E466943B1E0AB0A16125
          595A52537B21D7A76127C9DD52EE1A800E4DB3365053B68E7D0070007468739D
          0DE0EC030080A101DC9B4F12076AC67FD5A81EA90B9522DF407D02B404001C80
          EC5A5668545A0300000000000000D800D5B7AEE73DBFEB8BA2B0F23CFF98EBBA
          AEE538CE639E65992AB6466901FC3A0078479224F53C0C43ED8DB6D5D706D071
          F3AAD407A0CB01CDE8A33E0000000000000000602C208EE37A1E45917600A77E
          2FDF03BA009CFA7F07B855FF09F9178503A62D80B342BF13E17749F547528089
          01C0D07107ED3255BF3BBBC0E50000000049454E44AE426082}
        ShowHint = True
        OnClick = imgFiltrarClick
      end
      object lblLog: TLabel
        Left = 208
        Top = 258
        Width = 33
        Height = 19
        Caption = 'LOG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLogErro: TLabel
        Left = 646
        Top = 258
        Width = 84
        Height = 19
        Caption = 'LOG ERRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFoto: TLabel
        Left = 1006
        Top = 258
        Width = 44
        Height = 19
        Caption = 'FOTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grdLogSys: TDBGrid
        Left = 3
        Top = 95
        Width = 1077
        Height = 162
        DataSource = dmMSource.dtsLogSys
        Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grdLogSysDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'OP_DATA'
            Title.Alignment = taCenter
            Title.Caption = 'Data da ocorr'#234'ncia'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OP_HORA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora da ocorr'#234'ncia'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OP_TABELA_MODULO'
            Title.Alignment = taCenter
            Title.Caption = 'Tabela/M'#243'dulo ocorr'#234'ncia'
            Width = 347
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OP_NOME_USUARIO'
            Title.Alignment = taCenter
            Title.Caption = 'Usu'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OP_COMPUTADOR'
            Title.Alignment = taCenter
            Title.Caption = 'PC / local da ocorr'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OP_NUMERO_IP'
            Title.Alignment = taCenter
            Title.Caption = 'Endere'#231'o IP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S_OPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'A'#231#227'o executada'
            Visible = True
          end>
      end
      object memLog: TDBMemo
        Left = 8
        Top = 280
        Width = 409
        Height = 288
        DataField = 'OP_LOG'
        DataSource = dmMSource.dtsLogSys
        ReadOnly = True
        TabOrder = 1
      end
      object memLogErroExtendido: TDBMemo
        Left = 420
        Top = 280
        Width = 557
        Height = 288
        DataField = 'OP_LOG_ERRO'
        DataSource = dmMSource.dtsLogSys
        ReadOnly = True
        TabOrder = 2
      end
      object grpFiltroPeriodo: TGroupBox
        Left = 8
        Top = 8
        Width = 169
        Height = 81
        Caption = 'Selecione o per'#237'odo'
        TabOrder = 3
        object lblDataInicial: TLabel
          Left = 7
          Top = 30
          Width = 51
          Height = 13
          Caption = 'Data inicial'
        end
        object lblDataFinal: TLabel
          Left = 7
          Top = 49
          Width = 46
          Height = 13
          Caption = 'Data final'
        end
        object dtpDataInicial: TDateTimePicker
          Left = 64
          Top = 22
          Width = 97
          Height = 21
          Date = 43080.607167824080000000
          Time = 43080.607167824080000000
          TabOrder = 0
        end
        object dtpDataFinal: TDateTimePicker
          Left = 64
          Top = 45
          Width = 97
          Height = 21
          Date = 43080.607167824080000000
          Time = 43080.607167824080000000
          TabOrder = 1
        end
      end
      object grpFiltroUsuario: TGroupBox
        Left = 179
        Top = 8
        Width = 334
        Height = 81
        Caption = 'Selecione o usu'#225'rio'
        TabOrder = 4
        object imfLimparCBOUsuario: TImage
          Left = 303
          Top = 29
          Width = 23
          Height = 22
          Cursor = crHandPoint
          Hint = 'Limpar'
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
            00180806000000E0773DF8000000097048597300000EC400000EC401952B0E1B
            0000020F4944415478DAAD963D485C4110C7DF5E215A442E8A17111312FC2844
            22D85A28D86823488E1025285868EC050316361210B15211B1113FC046FB4B08
            8140CA24240A21A7A020891A102DBC130CDCF337277B2CABEB79776F6198FFEC
            EECC7F66DEBE7D4FF9BEEFB946BC563D46455548B5FB29BF115D86168713640B
            FB03F646FDAE7FE88AA16E23207035CE1338BFC22C022B09AC75C6F9DABE002E
            83C7EBE2A9E3AC043BF5A16ED42252EEE5368E907E48DE3B09083E4C4633C090
            996D960ACC3D97C0015AB6768380B674B169934D2187F37D0804FF077750C9A7
            0C01993F92878654E4D816D738409E4372962620FB7926861C19E55A81C693B4
            EAAD8AD7A908C61EF32501139C029F09C1206021A0D6D8A34708D6617BA99945
            DBD9E65981E04521F8296FA949C0C3C92B5D0E8B9DDC1721F88B516911C8A260
            9DADC6E69C67EFE1B0A41B6010FC16823F802AEDC182C7D3CFAB022120B839F5
            4B08BE13B4C9ACA09061B5E8B310AC005E171AD831E684A00FB6255D4180EF81
            E06E210863EC6394064C20B76B8DBE8BA63046026ECF18A7F19DBE8BC24CFC80
            F9494015C4C1CD9CC6A4795DB7B21063A1A8408204B88DECBFA6E7AD0FCE0BD4
            2A529C675BCE9128C1639924EC4F2695B40809593CCDB102694B2F6DF966C673
            7DF4E5448DE2F006F36116827FC059F0349927ED58EAAEDF165AF600D589B423
            0D48C4BBBE7BE4EF611BF988C4089C70C5B8028B34F9FF528819C10000000049
            454E44AE426082}
          ShowHint = True
          Stretch = True
          OnClick = imfLimparCBOUsuarioClick
        end
        object cboUsuario: TDBLookupComboBox
          Left = 4
          Top = 30
          Width = 293
          Height = 21
          KeyField = 'LOGIN'
          ListField = 'LOGIN'
          ListSource = dmMSource.dtsUsuarios
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 519
        Top = 8
        Width = 270
        Height = 81
        Caption = 'Selecione a Tabela/M'#243'dulo'
        TabOrder = 5
        object imgLimparCBOTabelaModulo: TImage
          Left = 245
          Top = 29
          Width = 23
          Height = 22
          Cursor = crHandPoint
          Hint = 'Limpar'
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
            00180806000000E0773DF8000000097048597300000EC400000EC401952B0E1B
            0000020F4944415478DAAD963D485C4110C7DF5E215A442E8A17111312FC2844
            22D85A28D86823488E1025285868EC050316361210B15211B1113FC046FB4B08
            8140CA24240A21A7A020891A102DBC130CDCF337277B2CABEB79776F6198FFEC
            EECC7F66DEBE7D4FF9BEEFB946BC563D46455548B5FB29BF115D86168713640B
            FB03F646FDAE7FE88AA16E23207035CE1338BFC22C022B09AC75C6F9DABE002E
            83C7EBE2A9E3AC043BF5A16ED42252EEE5368E907E48DE3B09083E4C4633C090
            996D960ACC3D97C0015AB6768380B674B169934D2187F37D0804FF077750C9A7
            0C01993F92878654E4D816D738409E4372962620FB7926861C19E55A81C693B4
            EAAD8AD7A908C61EF32501139C029F09C1206021A0D6D8A34708D6617BA99945
            DBD9E65981E04521F8296FA949C0C3C92B5D0E8B9DDC1721F88B516911C8A260
            9DADC6E69C67EFE1B0A41B6010FC16823F802AEDC182C7D3CFAB022120B839F5
            4B08BE13B4C9ACA09061B5E8B310AC005E171AD831E684A00FB6255D4180EF81
            E06E210863EC6394064C20B76B8DBE8BA63046026ECF18A7F19DBE8BC24CFC80
            F9494015C4C1CD9CC6A4795DB7B21063A1A8408204B88DECBFA6E7AD0FCE0BD4
            2A529C675BCE9128C1639924EC4F2695B40809593CCDB102694B2F6DF966C673
            7DF4E5448DE2F006F36116827FC059F0349927ED58EAAEDF165AF600D589B423
            0D48C4BBBE7BE4EF611BF988C4089C70C5B8028B34F9FF528819C10000000049
            454E44AE426082}
          ShowHint = True
          Stretch = True
          OnClick = imgLimparCBOTabelaModuloClick
        end
        object cboSelecionaTabelaLOG: TDBLookupComboBox
          Left = 6
          Top = 30
          Width = 235
          Height = 21
          KeyField = 'TABELA_MODULO'
          ListField = 'TABELA_MODULO'
          ListSource = dmMSource.dtsSelecionaTabelaLOG
          TabOrder = 0
        end
      end
      object memFoto: TDBImage
        Left = 980
        Top = 280
        Width = 100
        Height = 102
        Hint = 'Duplo clique para aumentar'
        DataField = 'OP_FOTO'
        DataSource = dmMSource.dtsLogSys
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        Stretch = True
        TabOrder = 6
        OnDblClick = memFotoDblClick
      end
    end
    object tbsFotoZoom: TTabSheet
      Caption = 'Zoom'
      ImageIndex = 1
      object memFotoZoom: TDBImage
        Left = 0
        Top = 0
        Width = 1161
        Height = 581
        Align = alClient
        DataField = 'OP_FOTO'
        DataSource = dmMSource.dtsLogSys
        ReadOnly = True
        TabOrder = 0
        ExplicitLeft = 988
        ExplicitTop = 288
        ExplicitWidth = 100
        ExplicitHeight = 102
      end
    end
  end
  object grpMensagem: TGroupBox
    Left = 0
    Top = 609
    Width = 1089
    Height = 46
    Caption = 'Mensagem'
    TabOrder = 1
    object lblMsg: TLabel
      Left = 19
      Top = 19
      Width = 1054
      Height = 18
      ParentCustomHint = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
