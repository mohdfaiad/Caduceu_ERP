object dmMSProcedure: TdmMSProcedure
  OldCreateOrder = False
  Height = 1545
  Width = 1070
  object fdspEstados: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ESTADOS'
    Left = 69
    Top = 2
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SIGLA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'IP_NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 4
        Name = 'IP_CODIGO_IBGE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_MVA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ICMS_INTERNO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_ICMS_INTER_EST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 10
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 11
        Name = 'IP_FCP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_ESTADO_BRASILEIRO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_CODIGO_PAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CODIGO_SINIEF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_REGIAO_GEOGRAFICA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_MASCARA_INSCRICAO_ESTADUAL'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 17
        Name = 'IP_UTILIZA_ATIVIDADE_ESTADUAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_MASCARA_ATIVIDADE_ESTADUAL'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 19
        Name = 'IP_SIMPLES_NACIONAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_ALIQUOTA_SIMPLES_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_REGIAO_FISCAL'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 656
    Top = 229
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 656
    Top = 184
  end
  object fdspCidades: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CIDADES'
    Left = 69
    Top = 47
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 4
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 5
        Name = 'IP_CODIGO_MUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 8
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 9
        Name = 'OP_PROX_CIDADE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspFilial: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_FILIAL'
    Left = 69
    Top = 92
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_RAZAO_SOCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 4
        Name = 'IP_FANTASIA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 5
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 7
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 8
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 10
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 11
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 12
        Name = 'IP_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_DDD'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 14
        Name = 'IP_TELEFONE1'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 15
        Name = 'IP_TELEFONE2'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 16
        Name = 'IP_FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 17
        Name = 'IP_HTTP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 18
        Name = 'IP_EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 19
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 20
        Name = 'IP_CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 21
        Name = 'IP_ENDERECO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 22
        Name = 'IP_NUMERO_COBRANCA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_CEP_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 24
        Name = 'IP_BAIRRO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 25
        Name = 'IP_ESTADO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 26
        Name = 'IP_CIDADE_COBRANCA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_ENDERECO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 28
        Name = 'IP_NUMERO_ENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_CEP_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 30
        Name = 'IP_BAIRRO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 31
        Name = 'IP_ESTADO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 32
        Name = 'IP_CIDADE_ENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_CONTRIBUINTE_IPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_TIPO_EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_REGISTRO_JUC'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 36
        Name = 'IP_METRO_QUADRADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_REGIME_TRIBUTARIO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_INSCRICAO_MUNICIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 39
        Name = 'IP_INSCRICAO_SUFRAMA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 40
        Name = 'IP_CRT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_PAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_OBSERVACAO_NFSAIDA'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_NATUREZA_PJ'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_PERFIL_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_PERCENTUAL_ICMS_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 46
        Name = 'IP_IMPOSTO_SIMPLES_NACIONAL'
        DataType = ftBCD
        Precision = 5
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 49
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 50
        Name = 'IP_UTILIZA_NFCE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'OP_PROX_FILIAL'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspUsuarios: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_USUARIO'
    Left = 69
    Top = 138
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NOME_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 4
        Name = 'IP_LOGIN'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_USUARIO_EXECUTOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 8
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 9
        Name = 'IP_SUPER_USUARIO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_ATIVO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_AUTORIZA_FAT'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'OP_NOME_USUARIO'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 13
        Name = 'OP_LOGIN'
        DataType = ftString
        ParamType = ptOutput
        Size = 20
      end
      item
        Position = 14
        Name = 'OP_SENHA'
        DataType = ftString
        ParamType = ptOutput
        Size = 10
      end
      item
        Position = 15
        Name = 'OP_PROX_USUARIO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspAtlGAC: TFDStoredProc
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ATL_GAC_001'
    Left = 652
    Top = 33
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_BINARIO'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_VERSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 5
        Name = 'IP_MD5'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 6
        Name = 'IP_NOME_ARQ'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 7
        Name = 'IP_ID_ARQUIVO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspCtrlDown: TFDStoredProc
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CTRL_DOWN'
    Left = 651
    Top = 92
    ParamData = <
      item
        Position = 1
        Name = 'IP_IP_LOCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 2
        Name = 'IP_IP_INTERNET'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 3
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 4
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_MD5'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object fdspCFOP_CFPS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CFOP'
    Left = 69
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 3
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 4
        Name = 'IP_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CFOP_ENTRADA_EST'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 6
        Name = 'IP_CFOP_ENTRADA_IEST'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 7
        Name = 'IP_CFOP_ENTRADA_ESTR'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 8
        Name = 'IP_ATUALIZAR_CUSTOS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_NATUREZA_CFOP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_GERA_CONTRIBUICOES'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_TABELA_4_3_7'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 12
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 13
        Name = 'IP_GERA_DEBITO_CREDITO_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_SUBSTITUICAO_TRIB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_GERA_DEBITO_CREDITO_IPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 20
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 21
        Name = 'IP_CST_PIS_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_ALIQUOTA_PIS_ENTRADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_CST_COFINS_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_ALIQUOTA_COFINS_ENTRADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_CST_PIS_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_ALIQUOTA_PIS_SAIDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_CST_COFINS_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_ALIQUOTA_COFINS_SAIDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_NATUREZA_RECEITA_PIS_COFINS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_CODIGO_CREDITO_PIS_COFINS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_REMESSA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_COD_CTA'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end>
  end
  object fdspFuncionarios: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_FUNCIONARIO'
    Left = 69
    Top = 229
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 4
        Name = 'IP_CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_IDENTIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 7
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 9
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 10
        Name = 'IP_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 12
        Name = 'IP_DDD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_TELEFONE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CELULAR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_ATIVO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Position = 17
        Name = 'IP_CARGO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 18
        Name = 'IP_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 19
        Name = 'IP_PERCENTAL_COMISSAO_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object fdspConfiguracoes: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CONFIGURACOES'
    Left = 69
    Top = 274
    ParamData = <
      item
        Position = 1
        Name = 'IP_PATH_BANCO_DE_DADOS'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 2
        Name = 'IP_INTERVALO_ENTRE_BACKUP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PATH_BACKUP_1'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 4
        Name = 'IP_PATH_BACKUP_2'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 5
        Name = 'IP_MODELO_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 6
        Name = 'IP_SERIE_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 7
        Name = 'IP_ULTIMA_NF_IMPR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_UTILIZAR_PRECO_ATACADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CALCULO_PRECO_CLD'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_UNIFICAR_PRECO_VENDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_UTILIZAR_SIMILAR_PRECO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VISUALIZAR_SIMILIAR_ATL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_TOTALIZAR_CFOP_NF'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ATUALIZA_CUSTOS_SIMILARES'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_MODELO_PDV'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_PDV_TRUNCA_ARREDONDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_UTILIZA_DV_EXPORTACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_ENDERECO_WS_GENESIS'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 19
        Name = 'IP_PORTA_WS_GENESIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_PATH_EXPORTA_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 21
        Name = 'IP_PATH_IMPORTA_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 22
        Name = 'IP_PATH_EXPORTA_BALANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 23
        Name = 'IP_MULTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_TIPO_MULTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_MORA_DIARIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_TIPO_MORA_DIARIA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_UTILIZA_COBR_MAGNETICA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_UTILIZA_COBR_REGISTRADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_COBR_IMP_BANCO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_TIPO_BOLETO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_MODELO_TERMINAL_CONSULTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_QUANTIDADE_TERMINAL_CONSULTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_PATH_TERMINAL_CONSULTA'
        DataType = ftString
        ParamType = ptInput
        Size = 400
      end
      item
        Position = 34
        Name = 'IP_UF_DESTINO_NFE'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 35
        Name = 'IP_AMBIENTE_NFE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_VISUALIZAR_MSG_NFE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_FORMA_EMISSAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_REPOSITORIO_XML_ENTRADA'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 39
        Name = 'IP_COPIAR_XML_ENTRADA_REP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_IMPORTAR_PARCELAS_NFE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_CONFIGURACOES'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_MODELO_BALANCA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_ATIVAR_RENTABILIDADE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_USAR_CAMPO_COMPLE_PESQ_NFE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_NOME_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 46
        Name = 'IP_CPF_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 47
        Name = 'IP_CRC_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 48
        Name = 'IP_CNPJ_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 49
        Name = 'IP_ENDERECO_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 50
        Name = 'IP_NUMERO_END_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 51
        Name = 'IP_CEP_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 52
        Name = 'IP_BAIRRO_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 53
        Name = 'IP_CIDADE_CONTADOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_COMPLEMENTO_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 55
        Name = 'IP_DDD_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 56
        Name = 'IP_TELEFONE_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 57
        Name = 'IP_FAX_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 58
        Name = 'IP_EMAIL_CONTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 59
        Name = 'IP_ENVIAR_XML_CONTABILIDADE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 60
        Name = 'IP_PATH_ATUALIZACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 400
      end
      item
        Position = 61
        Name = 'IP_OC_ATUALIZA_ALMOXARIFADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 62
        Name = 'IP_TIPO_ESTOQUE_NFENTRADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 63
        Name = 'IP_TIPO_ESTOQUE_NFSAIDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 64
        Name = 'IP_INTEGRAR_IMPORTA_VENDA_CRE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 65
        Name = 'IP_INTEGRAR_BALCAO_ZEUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 66
        Name = 'IP_PERCENTUAL_LIMITE_CREDITO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 67
        Name = 'IP_USAR_NOMEPASTA_IMP_CUPOM_NFS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 68
        Name = 'IP_NUM_COPIAS_ORCAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 69
        Name = 'IP_MODELO_CS'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 70
        Name = 'IP_ATUALIZA_FOR_PRO_NFE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 71
        Name = 'IP_PERMITE_VENDA_ABAIXO_CUSTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 72
        Name = 'IP_DESCONTO_MAX_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 73
        Name = 'IP_ARQ_PRODUTO_GERAL_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 74
        Name = 'IP_ARQ_PRODUTO_ALT_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 75
        Name = 'IP_ARQ_IMEDIATO_PROD_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 76
        Name = 'IP_ARQ_DE_CAIXA_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 77
        Name = 'IP_ARQ_CLIENTE_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 78
        Name = 'IP_ARQ_PAGTO_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 79
        Name = 'IP_ARQ_SECOES_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 80
        Name = 'IP_ARQ_VENDA_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 81
        Name = 'IP_ARQ_DE_RECEBIMENTOS_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 82
        Name = 'IP_ARQ_VENDA_CLIENTE_PDV'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 83
        Name = 'IP_ARQ_CUPOM_DIA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 84
        Name = 'IP_MENSAGEM_FINANCEIRA'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 85
        Name = 'IP_VALIDADE_ORCAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 86
        Name = 'IP_MENSAGEM_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 87
        Name = 'IP_SENHA_USUARIO_SMTP'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 88
        Name = 'IP_USUARIO_SMTP'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 89
        Name = 'IP_PORTA_SMTP'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 90
        Name = 'IP_SERVIDOR_SMTP'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 91
        Name = 'IP_AUTENTICA_SMTP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 92
        Name = 'IP_USAR_SSL_SMTP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 93
        Name = 'IP_PASTA_ARQ_PDF'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 94
        Name = 'IP_DESCRICAO_CF_CONV_25_2016'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 95
        Name = 'IP_HABILITA_CONTAB_DOWNLOAD_XML'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 96
        Name = 'IP_ATUALIZAR_NCM_PELA_ENTRADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 97
        Name = 'IP_PATH_LIVE_UPDATE'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 98
        Name = 'IP_BUSCA_CEP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 99
        Name = 'IP_CONSULTAR_CNPJ_CPF_RFB_SEFAZ'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspConfigECF: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CONFIG_ECF'
    Left = 69
    Top = 321
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_MODELO_DOC'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'IP_NUMERO_ECF'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_MODELO_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_NUMERO_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 21
      end
      item
        Position = 6
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 8
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 9
        Name = 'OP_PROX_CONFIG_CX'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspAdministradoras: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ADMINISTRADORAS'
    Left = 69
    Top = 368
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ADMINISTRADORA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_AGENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'IP_BANCO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 7
        Name = 'IP_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 9
        Name = 'IP_PRAZO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 11
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 12
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_COD_REDE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 14
        Name = 'IP_COD_BANDEIRA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 15
        Name = 'OP_PROX_ADMINSIRADORA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspCtrlCartoes: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CTRL_CARTOES'
    Left = 69
    Top = 412
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CONTROLE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ADMINISTRADORA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DATA_DEPOSITO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DATA_RECEBIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DATA_BAIXA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_TIPO_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_A_RECEBER'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_VALOR_OPERACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 14
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 15
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'OP_PROX_CONTROLE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspAtualizaSaldoCC: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'ATUALIZAR_SALDO_CCORRENTE'
    Left = 69
    Top = 458
    ParamData = <
      item
        Position = 1
        Name = 'CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 2
        Name = 'VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'TIPO_ATUALIZACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspBaixaCartaoTicekt: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'BAIXAR_CARTAO_TICKET'
    Left = 69
    Top = 503
    ParamData = <
      item
        Position = 1
        Name = 'IP_ADMINISTRADORA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_RECEBIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_BAIXA'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object fdspTab_Tab_5_3_SPEDF: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_TABELA_5_3_SPED_F'
    Left = 69
    Top = 549
    ParamData = <
      item
        Position = 1
        Name = 'IP_CODIGO_AJUSTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 2
        Name = 'IP_DESCRICAO_AJUSTE'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DATA_FIN'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object fdspMaster: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'EXECUTAR_PROMOCAO'
    Left = 656
    Top = 321
    ParamData = <
      item
        Position = 1
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PRECO_PROMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object fdspCFOP_Entrada: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CFOP_ENTRADA'
    Left = 192
    Top = 47
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CFOP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NF_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 5
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 7
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 8
        Name = 'OP_CFOP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspNFEntrada: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_NF_ENTRADA'
    Left = 192
    Top = 2
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 4
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_ORDEM_DE_COMPRA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_DATA_SAIDA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_TRANSPORTADORA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_TIPO_FRETE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_AGREGAR_FRETE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_DO_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_VALOR_DO_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_OUTRAS_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_VALOR_DO_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_VALOR_DOS_PRODUTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_VALOR_DA_NOTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_DESCONTO_GERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_PESO_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_PESO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_QTD_VOLUME'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_ESPECIE_VOLUME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 27
        Name = 'IP_MARCA_VOLUME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 28
        Name = 'IP_NUMERO_VOLUME'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_PLACA_VEICULO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 30
        Name = 'IP_UF_VEICULO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 31
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_OBSERVACAO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_SERIE_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 34
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 35
        Name = 'IP_CANCELADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_RATEAR_DESCONTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_TIPO_CONTABIL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_CODIGO_VALOR_FISCAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 39
        Name = 'IP_SOMAR_DESPESAS_BASE_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_SOMAR_IPI_BASE_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_SOMAR_ST_TOTAL_NOTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_REDUCAO_PIS_COFINS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_ALIQ_CREDITO_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_COMPRADOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_PROTOCOLO_DANFE'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 46
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_VALOR_CONFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_VALOR_PIS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 49
        Name = 'IP_VALOR_COFINS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_SITUACAO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 51
        Name = 'IP_OBSERVACAO_FISCAL'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 53
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 54
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 55
        Name = 'OP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspParcelasNFE: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    Left = 192
    Top = 92
  end
  object fdspItemNFEntrada: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_NFENTRADA'
    Left = 192
    Top = 138
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ITEM_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_EAN'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 5
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 7
        Name = 'IP_CST'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_UNIDADEEMBALAGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_DESCONTO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_IPI'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_ICMS_ENTRADA'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ICMS_SAIDA'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_BASE_SUBSTITUICAAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_ALIQUOTA_ST'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_VALOR_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_SUB_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_ISENTAS_NT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_ENCARGOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 25
        Name = 'IP_REDUCAO_BC_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_BASE_ICMS_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_VALOR_ICMS_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_IND_APURACAO_IPI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_COD_ENQUADRAMENTO_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 30
        Name = 'IP_BASE_CALC_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_ALIQUOTA_IPI'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_CST_PIS'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 33
        Name = 'IP_VALOR_BC_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_ALIQUOTA_PIS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_QUANT_BC_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_V_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_CST_COFINS'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 39
        Name = 'IP_VALOR_BC_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_ALIQUOTA_COFINS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_QUANT_BC_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_V_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_CST_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 45
        Name = 'IP_NUMERO_ITEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 46
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 48
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 49
        Name = 'IP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'OP_ITEM_NFENTRADA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspConhecimento_Frete: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CONHECIMENTO_FRETE'
    Left = 192
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CONHECIMENTO_FRETE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 6
        Name = 'IP_INSCRICAO_ESTADUAL'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 7
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 10
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 11
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 12
        Name = 'IP_SUBSERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 13
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 15
        Name = 'IP_VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_BASE_CALCULO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_ISENTA_NAO_TRIBUTADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_OUTRAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_CIF_FOB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_CANCELADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 22
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_TIPO_CTE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_CHAVE_CTE'
        DataType = ftString
        ParamType = ptInput
        Size = 44
      end
      item
        Position = 26
        Name = 'IP_CHAVE_CTE_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 44
      end
      item
        Position = 27
        Name = 'IP_CST_ICMS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_SITUACAO_DOC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'OP_CONHECIMENTO_FRETE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspCpa: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CPA'
    Left = 69
    Top = 594
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CPA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CEDENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 9
        Name = 'IP_PL_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_ITEM_PL_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_JUROS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_LANCAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_MORA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_MULTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_OBSERVACOES'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_SERIADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_SERIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 18
        Name = 'IP_TIPO_PAGAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_DATA_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 22
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 23
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'OP_CPA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspProdutoFilial: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PRODUTOFILIAL'
    Left = 69
    Top = 639
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CUSTO_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CUSTO_BRUTO_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_CUSTO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CUSTO_LIQUIDO_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_MENOR_PRECO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_PRECO_CALCULADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_PRECO_PROVISORIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_PRECO_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_PRECO_VENDA_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_CADASTRO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ALTERACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_REMARCACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_LUCRO_ICMSR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_IMPOSTOS_FEDERAIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_CUSTO_OPERACIONAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_COMISSAO_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_LUCRO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_DEPOSITO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_LOJA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_SALDO_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_SALDO_MAXIMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_SALDO_MINIMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_SETOR_BALANCA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_PROMOCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_TECLA_ASSOCIADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_VALIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_TECLADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_REDUCAO_BC'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_DESCONTO_PROGRAMADO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_DESCRICAO_CUPOM'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 34
        Name = 'IP_DESCRICAO_GONDOLA1'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 35
        Name = 'IP_DESCRICAO_GONDOLA2'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 36
        Name = 'IP_DESCRICAO_BALANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 37
        Name = 'IP_DESCRICAO_TIRA_TEIMA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 38
        Name = 'IP_ENVIAR_PARA_BALANCA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 39
        Name = 'IP_DESCONTO_NA_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_CREDITO_DE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_OUTROS_CUSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_ICMS_A_PAGAR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_DESCONTO_NA_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 46
        Name = 'IP_VALOR_DESCONTO_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_VALOR_CREDITO_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 49
        Name = 'IP_VALOR_OUTROS_CUSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'IP_VALOR_ICMSR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_PRECO_PROMOCAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_ULTIMA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_SALDO_RESERVADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 55
        Name = 'IP_PRECO_ATACADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 56
        Name = 'IP_DESCRICAO_ATACADO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 57
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 58
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 59
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 60
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 61
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 62
        Name = 'IP_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 63
        Name = 'IP_PERCENTUAL_ISS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 64
        Name = 'IP_PERCENTUAL_IOF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 65
        Name = 'IP_PERCENTUAL_CIDE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 66
        Name = 'OP_CUSTO_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 67
        Name = 'OP_CUSTO_BRUTO_ANT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 68
        Name = 'OP_CUSTO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 69
        Name = 'OP_CUSTO_LIQUIDO_ANT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 70
        Name = 'OP_MENOR_PRECO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 71
        Name = 'OP_PRECO_CALCULADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 72
        Name = 'OP_PRECO_PROVISORIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 73
        Name = 'OP_PRECO_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 74
        Name = 'OP_PRECO_VENDA_ANT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 75
        Name = 'OP_REMARCACAO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 76
        Name = 'OP_ALTERCAO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 77
        Name = 'OP_LUCRO_ICMSR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 78
        Name = 'OP_IMPOSTOS_FEDERAIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 79
        Name = 'OP_CUSTO_OPERACIONAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 80
        Name = 'OP_COMISSAO_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 81
        Name = 'OP_LUCRO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 82
        Name = 'OP_SALDO_MINIMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 83
        Name = 'OP_SALDO_MAXIMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 84
        Name = 'OP_SETOR_BALANCA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 85
        Name = 'OP_PRODUTO_ATIVO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 86
        Name = 'OP_PROMOCAO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 87
        Name = 'OP_TECLA_ASSOCIASA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 88
        Name = 'OP_VALIDADE'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 89
        Name = 'OP_TECLADO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 90
        Name = 'OP_RED_BASE_CALC'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 91
        Name = 'OP_DESCRICAO_CUPOM_FISCAL'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 92
        Name = 'OP_DESCRICAO_GONDOLA1'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 93
        Name = 'OP_DESCRICAO_GONDOLA2'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 94
        Name = 'OP_DESCRICAO_BALANCA'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 95
        Name = 'OP_DESCRICAO_TIRATEIMA'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 96
        Name = 'OP_ENVIAR_BALANCA'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 97
        Name = 'OP_DESCONTO_NA_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 98
        Name = 'OP_CREDITO_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 99
        Name = 'OP_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 100
        Name = 'OP_OUTROS_CUSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 101
        Name = 'OP_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 102
        Name = 'OP_ICMS_PAGAR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 103
        Name = 'OP_DESCONTO_NA_VENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 104
        Name = 'OP_VALOR_DESC_COMPRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 105
        Name = 'OP_VALOR_CRED_ICMSR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 106
        Name = 'OP_VALOR_DO_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 107
        Name = 'OP_VALOR_OUTROS_CUSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 108
        Name = 'OP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 109
        Name = 'OP_VALOR_ICMSR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 110
        Name = 'OP_PRECO_PROMOCAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 111
        Name = 'OP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 112
        Name = 'OP_SUBSTITUICAO_TRIB'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 113
        Name = 'OP_PRECO_ATACADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 114
        Name = 'OP_DESCRICAO_ATACADO'
        DataType = ftString
        ParamType = ptOutput
        Size = 44
      end>
  end
  object fdspLancarRentabilidade: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'LANCARRENTABILIDADE'
    Left = 69
    Top = 684
    ParamData = <
      item
        Position = 1
        Name = 'ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'RENDIMENTO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'RENTABILIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspMovimento: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_MOVIMENTO'
    Left = 192
    Top = 229
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CONTROLE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_TIPO_MOVIMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 8
        Name = 'IP_TIPO_DOCUMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_ECF'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_TERMINAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_FORMA_PAGAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_PEDIDODEVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 17
        Name = 'IP_SUBTOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_DESCONTO_ITEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_ACRESCIMO_ITEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 22
        Name = 'OP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 23
        Name = 'OP_UNIDADE_EMB'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 24
        Name = 'OP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 25
        Name = 'OP_VDESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 26
        Name = 'OP_SUB_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 27
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 5
      end
      item
        Position = 28
        Name = 'OP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 29
        Name = 'OP_GRUPO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 30
        Name = 'OP_SUBGRUPO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 31
        Name = 'OP_SECAO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 32
        Name = 'OP_SALDO_ANT_LOJA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 33
        Name = 'OP_SALDO_ANT_DEPOSITO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 34
        Name = 'OP_LOCAL_MOVIMENTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 35
        Name = 'OP_MOVIMENTA_ESTOQUE'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 36
        Name = 'OP_TRIBUTACAO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 37
        Name = 'OP_CST'
        DataType = ftString
        ParamType = ptOutput
        Size = 3
      end>
  end
  object fdspAtualizar_ForPro_NFE: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'ATUALIZAR_FORNECEDOR_PRODUTO'
    Left = 192
    Top = 274
    ParamData = <
      item
        Position = 1
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_LivroEntrada: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_LIVRO_ENTRADA'
    Left = 69
    Top = 730
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_MES_ANO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'IP_DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 6
        Name = 'IP_TIPO_ESPECIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 7
        Name = 'IP_SERIE_SUBSERIE_DOC'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 8
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CNPJ_EMITENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 10
        Name = 'IP_UF_ORIGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 11
        Name = 'IP_VALOR_CONTABIL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CODIGO_CONTABIL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 14
        Name = 'IP_IDENT_ICMS_IPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_CODIGO_VALORES_FISCAIS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_BASE_CALCULO_VALOR_OPERACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_ALIQUOTA'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_IMPOSTO_CREDITADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 20
        Name = 'IP_LIVRO_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspSituacoes_OS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_SITUACOES_OS'
    Left = 192
    Top = 321
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_SITUACAO_OS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 4
        Name = 'IP_ABERTURA_OS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_OFICINA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_FECHAMENTO_OS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CONDICAO_FECHAMENTO_OS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_PRONTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 13
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 14
        Name = 'OP_CODIGO_SITUACAO_OS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspVerificarRelCodSituacaoOS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'VERIFICAR_RELACAO_SITUACAO_OS'
    Left = 192
    Top = 368
    ParamData = <
      item
        Position = 1
        Name = 'IP_CODIGO_SITUACAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'OP_TOTAL_OS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspEquipamentos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_EQUIPAMENTO'
    Left = 192
    Top = 412
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CODIGO_EQUIPAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 5
        Name = 'IP_MARCA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 6
        Name = 'IP_OPERADORA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 7
        Name = 'IP_NUMERO_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 8
        Name = 'IP_ETIQ_PATRIMONIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 9
        Name = 'IP_OBSERVACOES'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_DATA_COMPRA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_REVENDA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 12
        Name = 'IP_NUMERO_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 13
        Name = 'IP_NUMERO_CERTIFICADO_GARANTIA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 14
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 18
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 19
        Name = 'IP_CODIGO_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'OP_CODIGO_EQUIPAMENTO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspAgenda: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_AGENDA'
    Left = 192
    Top = 458
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_AGENDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_COMPROMISSO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DATA_COMPROMISSO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_HORA_COMPROMISSO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ALERTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_REALIZADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'OP_AGENDA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspServicos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_SERVICOS'
    Left = 192
    Top = 503
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CST'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 5
        Name = 'IP_DESCRICAO_COMPLEMENTAR'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 6
        Name = 'IP_CST_PIS'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 7
        Name = 'IP_CST_COFINS'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 8
        Name = 'IP_CST_PIS_ENTRADA'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 9
        Name = 'IP_CST_COFINS_ENTRADA'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 10
        Name = 'IP_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CODIGO_ITEM'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 13
        Name = 'IP_DESCRICAO_1'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 14
        Name = 'IP_DESCRICAO_2'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 15
        Name = 'OP_SERVICO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspOrdemServico: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ORDEM_SERVICO'
    Left = 192
    Top = 549
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CODIGO_SITUACAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_HORA_ENTRADA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DATA_TERMINO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_HORA_TERMINO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DATA_SAIDA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_HORA_SAIDA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_DATA_GARANTIA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_HORA_GARANTIA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_VALOR_MAO_DE_OBRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_VALOR_PECAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_DESLOCAMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_TERCEIRO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_VALOR_OUTROS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_CODIGO_EQUIPAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_APARELHO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 20
        Name = 'IP_MARCA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 21
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 22
        Name = 'IP_NUMERO_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 23
        Name = 'IP_ETIQ_PATRIMONIO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 24
        Name = 'IP_ACESSORIO'
        DataType = ftString
        ParamType = ptInput
        Size = 254
      end
      item
        Position = 25
        Name = 'IP_DEFEITO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_OBS_SERVICO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_LAUDO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_OBSERVACAO_APARELHO'
        DataType = ftString
        ParamType = ptInput
        Size = 254
      end
      item
        Position = 29
        Name = 'IP_KILOMETRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_NUMERO_NF_PEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 31
        Name = 'IP_EM_USO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_NUMERO_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 33
        Name = 'IP_OS_REABERTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_OS_OUTROS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_OS_OUTROS_EMIT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_VALOR_SINAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_PRIORIDADE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_NF_REMESSA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 39
        Name = 'IP_VALOR_NF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_NF_EMITENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 41
        Name = 'IP_GARANTIDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_NUMERO_SERIE_GARANTIDOR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 43
        Name = 'IP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_VALOR_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_USUARIO_MICRO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 46
        Name = 'IP_ORCA_FORMAS_PAGTO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_ALERTA_ABANDONO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_HORA_ABANDONO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 49
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_OS_FABRICANTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 51
        Name = 'IP_NFC_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_DATA_PREVISAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_HORA_PREVISTO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_VALOR_TOTAL_OS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 55
        Name = 'IP_TOTAL_HORAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 56
        Name = 'IP_CODIGO_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 57
        Name = 'IP_NOME_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 58
        Name = 'IP_CNPJ_CPF_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 59
        Name = 'IP_IE_RG_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 60
        Name = 'IP_ENDERECO_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 61
        Name = 'IP_NUMERO_END_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 62
        Name = 'IP_CEP_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 63
        Name = 'IP_BAIRRO_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 64
        Name = 'IP_CIDADE_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 65
        Name = 'IP_DDD_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 66
        Name = 'IP_TELEFONE_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 12
      end
      item
        Position = 67
        Name = 'IP_EMAIL_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 68
        Name = 'IP_UF_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 69
        Name = 'IP_CONTATO_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 70
        Name = 'OP_ORDEM_DE_SERVICO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItensOSServicos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITENS_OS_SERVICOS'
    Left = 192
    Top = 594
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ITENS_OS_SERVICOS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 5
        Name = 'IP_VALOR_CUSTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_HORA_INICIO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_HORA_FIM'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CODIGO_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CUSTO_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_X_PED'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 16
        Name = 'IP_N_ITEM_PED'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 17
        Name = 'IP_TIPO_COBRANCA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'OP_ITENS_OS_SERVICOS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspHistorico_OS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_HISTORICO_ORDEM_SERVICO'
    Left = 192
    Top = 639
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_HISTORICO_ORDEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 5
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 6
        Name = 'IP_DATA_CADASTRO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_HORA_CADASTRO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 10
        Name = 'OP_HISTORICO_ORDEM'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItensOSPecas: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITENS_OS_PECAS'
    Left = 192
    Top = 684
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ITENS_OS_PECAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CODIGO_PECA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 6
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DIA'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_X_PED'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 11
        Name = 'IP_N_ITEM_PED'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 12
        Name = 'IP_NUMERO_SERIE'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_CODIGO_BAIXA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'OP_ITENS_OS_PECAS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspPerda: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PERDAS'
    Left = 69
    Top = 778
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PERDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DATA_LANCAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_QUANTIDADE_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'OP_PERDA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItensPerdas: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITENS_PERDAS'
    Left = 192
    Top = 730
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PERDAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ITENS_PERDAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'OP_ITENS_PERDAS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspNCM_NBS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_NCM'
    Left = 69
    Top = 825
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 3
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 55
      end
      item
        Position = 4
        Name = 'IP_CARGA_NAC_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CARGA_IMP_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_EX_TIPI'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_CARGA_ESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_CARGA_MUNICIPAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CHAVE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 10
        Name = 'IP_FONTE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 11
        Name = 'IP_NCM_NBS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_TABELA_CEST'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 13
        Name = 'IP_DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_DATA_TERMINO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'OP_NCM_INCLUIDO'
        DataType = ftString
        ParamType = ptOutput
        Size = 10
      end>
  end
  object fdspParcelas_OrdemServico: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PARCELAS_ORDEM_SERVICO'
    Left = 192
    Top = 778
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PARCELAS_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'OP_PARCELA_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspProducao: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PRODUCAO'
    Left = 69
    Top = 869
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_RENDIMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_INGREDIENTE_1'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 7
        Name = 'IP_INGREDIENTE_2'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 8
        Name = 'IP_INGREDIENTE_3'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 9
        Name = 'IP_INGREDIENTE_4'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 10
        Name = 'IP_INGREDIENTE_5'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 11
        Name = 'IP_INGREDIENTE_6'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 12
        Name = 'IP_INGREDIENTE_7'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 13
        Name = 'OP_PRODUCAO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItemProducao: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_PRODUCAO'
    Left = 69
    Top = 914
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ITEM_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_PERDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'OP_ITEM_PRODUCAO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspFornededor: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_FORNECEDOR'
    Left = 192
    Top = 825
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_RAZAO_SOCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 4
        Name = 'IP_FANTASIA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 5
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 7
        Name = 'IP_CADASTRO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 9
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 11
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 12
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 13
        Name = 'IP_DDD'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 14
        Name = 'IP_TELEFONE1'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 15
        Name = 'IP_TELEFONE2'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 16
        Name = 'IP_FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 17
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 18
        Name = 'IP_CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 19
        Name = 'IP_HTTP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 20
        Name = 'IP_EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 21
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 23
        Name = 'IP_ULTIMO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_DATA_ULTIMO_PEDIDO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_VALOR_ULTIMO_PEDIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_ULTIMA_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 27
        Name = 'IP_DATA_ULTIMA_NF'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_VALOR_ULTIMA_NF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_RAMO_DE_ATIVIDADE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_ATACADISTA_REG_ESPECIAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_REPRESENTANTE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 33
        Name = 'IP_OPTANTE_SIMPLES'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_PAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_INSCRICAO_SUFRAMA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 36
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 39
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 40
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 41
        Name = 'IP_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'OP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspMenuAtalhos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_MENU_ATALHOS'
    Left = 69
    Top = 959
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_TITULO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 3
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 4
        Name = 'IP_IMAGEM_ATALHO'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_TIPO_ATALHO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspAlmoxarifado: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ALMOXARIFADO'
    Left = 192
    Top = 869
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ALMOXARIFADO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_REQUERENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_OBSERVACAO'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 10
        Name = 'OP_ALMOXARIFADO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItemAlmoxarifado: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_ALMOXARIFADO'
    Left = 192
    Top = 914
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ITEM_ALMOXARIFADO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_ALMOXARIFADO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'OP_ITEM_ALMOXARIFADO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspCfgConexaoZeusRetail: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CONEXAO_ZEUSRETAIL'
    Left = 192
    Top = 959
    ParamData = <
      item
        Position = 1
        Name = 'IP_SERVIDOR'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 2
        Name = 'IP_NOME_BANCO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 3
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'IP_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_TIPO_AUTENTICACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_PATH_ORIGEM_ARQ_PAF'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Position = 7
        Name = 'IP_PATH_DESTINO_ARQ_PAF'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Position = 8
        Name = 'IP_MODELO_PDV'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_TIPO_SERVIDOR'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object fdspPedidoZeus: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PEDIDO_ZEUS'
    Left = 344
    Top = 2
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_LOJA_SAI_MERCADORIA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ENTREGA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_NUMERO_ITENS_PEDIDO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VENDEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_OBSERVACOES'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_HORARIO_PEDIDO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 14
        Name = 'IP_VALOR_PEDIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALIDADE_PEDIDO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_ACRESCIMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_DATA_ENTREGA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_PEDIDO_ORCAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_TOTAL_MERCADORIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'OP_PEDIDO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItemPedZeus: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_PEDIDO_ZEUS'
    Left = 344
    Top = 47
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_ITEM_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_OBSERVACOES'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_GRUPO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_COD_TRIBUTACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 9
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 14
        Name = 'IP_VALOR_ACRESCIMO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_GTIN'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 16
        Name = 'IP_ENTREGA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_RESERVADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_AUTORIZOU_DESCONTO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 19
        Name = 'OP_ITEM_PEDIDO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspEndEntregaPedZeus: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_END_ENTREGA_PEDIDO_ZEUS'
    Left = 344
    Top = 92
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_TELEFONE_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 6
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 8
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 9
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 10
        Name = 'IP_CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 11
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 12
        Name = 'IP_HORA_TRANSACAO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_NOME_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end>
  end
  object fdspFinalizadoraPedZeus: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_FINALIZADORA_PED_ZEUS'
    Left = 344
    Top = 138
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_FORMA_PAGAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_COD_FINALIZADORA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_VALOR_FINALIZADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_QUANTIDADE_PARCELAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 656
    Top = 274
  end
  object fdspUndMedida: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_UNIDADE_MEDIDA'
    Left = 344
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_UNIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 3
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 4
        Name = 'IP_PERMITE_VENDA_FRACIONADA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspParcelasPedidoZeus: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PARCELAS_PED_ZEUS'
    Left = 344
    Top = 229
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PARCELAS_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CODIGO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_FORMA_PAGAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'OP_PARCELAS_PEDIDO_ZEUS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspCre: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CRE'
    Left = 344
    Top = 274
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CRE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_SACADO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_DATA_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_MOEDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_MORA_DIARIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_DATA_DESCONTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 80
      end
      item
        Position = 17
        Name = 'IP_POSICAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_DESCONTO_CONCEDIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_ABATIMENTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_OUTRAS_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_PLANO_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_SUB_CONTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_LANCAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_TIPO_COBRANCA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_CONTA_CORRENTE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 26
        Name = 'IP_CARTEIRA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 27
        Name = 'IP_TIPO_PARCELA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_PEDIDO_DE_VENDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_PERCENTUAL'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_REDUCAO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_VALOR_COMISSAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_NF_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_OBSERVACOES'
        DataType = ftString
        ParamType = ptInput
        Size = 20000
      end
      item
        Position = 35
        Name = 'IP_VALOR_CHQ_DEVOLVIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_SEQUENCIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_OUTROS_DEBITOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'OP_CRE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspAtlzSaldoCliente: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'ATUALIZASALDOCLIENTE'
    Left = 344
    Top = 321
    ParamData = <
      item
        Position = 1
        Name = 'OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 3
        Name = 'VALOR'
        DataType = ftSingle
        ParamType = ptInput
      end>
  end
  object fdspAtualizarSaldoProduto: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'ATUALIZAR_SALDO_PRODUTO'
    Left = 344
    Top = 368
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_LOCAL_MOVIMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_NOTA_FISCAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 6
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 10
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_ATUALIZAR_ALMOXARIFADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 13
        Name = 'OP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 14
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 5
      end
      item
        Position = 15
        Name = 'OP_MOVIMENTA_ESTOQUE'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 16
        Name = 'OP_LOCAL_MOVIMENTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 17
        Name = 'OP_UNIDADE_EMBALAGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 18
        Name = 'OP_CUSTO_MEDIO_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 19
        Name = 'OP_SALDO_ATUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 20
        Name = 'OP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 21
        Name = 'OP_ATUALIZA_CUSTOS'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 22
        Name = 'OP_DATA_CUSTO_MED_ANT'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 23
        Name = 'OP_PRODUTO_ORIGEM'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 24
        Name = 'OP_NATUREZA_CFOP'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 25
        Name = 'OP_FLAG_SALDO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 26
        Name = 'OP_TIPO_PECA'
        DataType = ftSmallint
        ParamType = ptOutput
      end>
  end
  object fdspAbre_Caixa: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'ABRE_CAIXA'
    Left = 344
    Top = 412
    ParamData = <
      item
        Position = 1
        Name = 'IP_DATA_ABERTURA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_HORA_ABEERTURA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_VALOR_ABERTURA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'OP_CAIXA_LOJA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItem_caixa_loja: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_CAIXA_LOJA'
    Left = 344
    Top = 458
    ParamData = <
      item
        Position = 1
        Name = 'IP_CAIXA_LOJA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FAVOREVIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 3
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_TIPO_LANCAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CREDITO_DEBITO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 8
        Name = 'IP_SALDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 10
        Name = 'IP_CONTA_MOVIMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 11
        Name = 'IP_PLANO_CONTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_ITEM_PLANO_CONTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_FUNCIONARIO_RETIRANTE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 14
        Name = 'IP_FUNCIONARIO_AUTORIZADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 15
        Name = 'OP_ITEM_CAIXA_LOJA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 16
        Name = 'OP_VLR_ABERTURA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspFechaCaixa: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'FECHA_CAIXA'
    Left = 344
    Top = 503
    ParamData = <
      item
        Position = 1
        Name = 'IP_CAIXA_LOJA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_ABERTURA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_FECHAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_HORA_FECHAMENTO'
        DataType = ftTime
        ParamType = ptInput
      end>
  end
  object fdspConfigBuscaCEP: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_COFING_BUSCA_CEP'
    Left = 344
    Top = 594
    ParamData = <
      item
        Position = 1
        Name = 'IP_WEB_SERVICE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PROXY_HOST'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 3
        Name = 'IP_PROXY_PORT'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 4
        Name = 'IP_PROXY_USER'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 5
        Name = 'IP_PROXY_PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 6
        Name = 'IP_CHAVE_ACESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end>
  end
  object fdspOrdemdeProducao: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ORDEM_DE_PRODUCAO'
    Left = 344
    Top = 639
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ORDEM_DE_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DATA_PREVISTA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DATA_TERMINO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_PRODUTO_FINAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_TIPO_PRODUCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_FUNCIONARIO_RESPONSAVEL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_OBSERVACAO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ESTOQUE_ATUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_RENDIMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'OP_ORDEM_DE_PRODUCAO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspItemOrdemProducao: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_ORDEM_DE_PRODUCAO'
    Left = 344
    Top = 684
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ORDEM_DE_PRODUCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PRODUTO_INSUMO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_QUANTIDADE_PREVISTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_QUANTIDADE_UTILIZADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_PERDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_ESTOQUE_ATUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end>
  end
  object fdspRceita_Produtos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_RECEITA_PRODUTOS'
    Left = 344
    Top = 730
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_RECEITA_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_INGREDIENTES1'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 6
        Name = 'IP_INGREDIENTES2'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 7
        Name = 'IP_INGREDIENTES3'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 8
        Name = 'IP_INGREDIENTES4'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 9
        Name = 'IP_INGREDIENTES5'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 10
        Name = 'IP_INGREDIENTES6'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 11
        Name = 'IP_INGREDIENTES7'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 12
        Name = 'OP_RECEITA_PRODUTOS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspClienteEntrega: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CLIENTE_ENTREGA'
    Left = 344
    Top = 778
    ParamData = <
      item
        Position = 1
        Name = 'IP_NOME_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 2
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 3
        Name = 'IP_NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 5
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 6
        Name = 'IP_CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 7
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 8
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 9
        Name = 'IP_TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
  end
  object fdspGravarRegistro50_Sintegra: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO50'
    Left = 344
    Top = 825
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_UF'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_MODELO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 8
        Name = 'IP_SERIE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 9
        Name = 'IP_NOTAFISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 10
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 11
        Name = 'IP_EMITENTE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 12
        Name = 'IP_VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_ISENTA_NAO_TRIBUTADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_OUTRAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_ALIQUOTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_SITUACAO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 19
        Name = 'IP_TIPO_NOTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_SOMAR_ICMSR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_CST'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_DESC_PROPORCIONAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 5
      end
      item
        Position = 26
        Name = 'OP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 27
        Name = 'OP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 28
        Name = 'OP_SUBTOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 29
        Name = 'OP_ALIQUOTA_ICMS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 30
        Name = 'OP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 31
        Name = 'OP_BASE_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 32
        Name = 'OP_ISENTAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 33
        Name = 'OP_DESCONTO_RATEADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 34
        Name = 'OP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 35
        Name = 'OP_DESPESA_RATEADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 36
        Name = 'OP_FRETE_AGREGADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 37
        Name = 'OP_VALOR_ICMSR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 38
        Name = 'OP_CST'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 39
        Name = 'OP_VALOR_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspGravarRegistro54_Sintegra: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO54'
    Left = 344
    Top = 869
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 6
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 7
        Name = 'IP_NOTAFISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 8
        Name = 'IP_TIPO_NOTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 10
        Name = 'IP_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_FRETE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_SEGURO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_OUTRAS_DESPESAS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_VALOR_OUTRAS_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 19
        Name = 'IP_SOMAR_IPI_BCICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_SOMAR_ICMSR_TOTAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_DESCONTO_PROPORCIONAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_FLAG'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 5
      end
      item
        Position = 24
        Name = 'OP_CST'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 25
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 26
        Name = 'OP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 27
        Name = 'OP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 28
        Name = 'OP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 29
        Name = 'OP_PERC_DESCONTO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 30
        Name = 'OP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 31
        Name = 'OP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 32
        Name = 'OP_BASE_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 33
        Name = 'OP_VALOR_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 34
        Name = 'OP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 35
        Name = 'OP_SUBTOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 36
        Name = 'OP_ISENTAS_NAO_TRIBUTADAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 37
        Name = 'OP_ALIQUOTA_ICMS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 38
        Name = 'OP_DESCONTO_RATEADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspGravarRegistroC100SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO_C100'
    Left = 344
    Top = 914
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ENTRADA_SAIDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PARTICIPANTE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 4
        Name = 'IP_DOCUMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 6
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_CNPJ_FILIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 8
        Name = 'IP_IND_PAGAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_TIPO_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_SITUACAO_DOCUMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_CHAVE_NFE'
        DataType = ftString
        ParamType = ptInput
        Size = 44
      end
      item
        Position = 14
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_ENTRADA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_IND_FRETE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_SOMAR_ICMSR_TOTAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_ALIQUOTA_CRED_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_IND_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'OP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 21
        Name = 'OP_CHAVE_NFE'
        DataType = ftString
        ParamType = ptOutput
        Size = 100
      end
      item
        Position = 22
        Name = 'OP_EMISSAO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 23
        Name = 'OP_ENTRADA_SAIDA'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 24
        Name = 'OP_VALOR_DOCUMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 25
        Name = 'OP_IND_PAGAMENTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 26
        Name = 'OP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 27
        Name = 'OP_VALOR_MERCADORIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 28
        Name = 'OP_IND_FRETE'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 29
        Name = 'OP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 30
        Name = 'OP_VALOR_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 31
        Name = 'OP_VALOR_OUTRAS_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 32
        Name = 'OP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 33
        Name = 'OP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 34
        Name = 'OP_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 35
        Name = 'OP_VALOR_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 36
        Name = 'OP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 37
        Name = 'OP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 38
        Name = 'OP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 39
        Name = 'OP_VALOR_PIS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 40
        Name = 'OP_VALOR_COFINS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 41
        Name = 'OP_SITUACAO_DOCUMENTO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 42
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 5
      end
      item
        Position = 43
        Name = 'OP_VALOR_DESCONTO_RATEANO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 44
        Name = 'OP_ISENTAS_NT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 45
        Name = 'OP_ALIQUOTA_ICMS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 46
        Name = 'OP_CST_ICMS'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 47
        Name = 'OP_FINALIDADE'
        DataType = ftSmallint
        ParamType = ptOutput
      end>
  end
  object fdspGravarRegistroC140SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO_C140'
    Left = 344
    Top = 959
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_QUANTIDADE_PARCELAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 7
        Name = 'OP_VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'OP_CNPJ_FILIAL'
        DataType = ftString
        ParamType = ptOutput
        Size = 14
      end>
  end
  object fdspGravarRegistroC141SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO_C141'
    Left = 344
    Top = 1004
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 5
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 6
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 7
        Name = 'OP_VENCIMENTO'
        DataType = ftDate
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'OP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspGravarRegistroC170SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO_C170'
    Left = 344
    Top = 1051
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ENTRADA_SAIDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_EMISSAO_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_NF_ENTRADA_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 6
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 8
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 9
        Name = 'IP_TIPO_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_DESC_PROPORCIONAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_ALIQUOTA_CRED_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_IND_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'OP_CODIGO_ITEM'
        DataType = ftString
        ParamType = ptOutput
        Size = 60
      end
      item
        Position = 14
        Name = 'OP_DESCRICAO_COMPLEMENTAR'
        DataType = ftString
        ParamType = ptOutput
        Size = 100
      end
      item
        Position = 15
        Name = 'OP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 5
        ParamType = ptOutput
      end
      item
        Position = 16
        Name = 'OP_UNIDADE'
        DataType = ftString
        ParamType = ptOutput
        Size = 6
      end
      item
        Position = 17
        Name = 'OP_VALOR_ITEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 18
        Name = 'OP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 19
        Name = 'OP_IND_MOVIMENTACAO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 20
        Name = 'OP_CST_ICMS'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 21
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 4
      end
      item
        Position = 22
        Name = 'OP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 23
        Name = 'OP_ALIQUOTA_ICMS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 24
        Name = 'OP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 25
        Name = 'OP_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 26
        Name = 'OP_ALIQUOTA_ST'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 27
        Name = 'OP_VALOR_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 28
        Name = 'OP_IND_APURACAO_IPI'
        DataType = ftString
        ParamType = ptOutput
        Size = 1
      end
      item
        Position = 29
        Name = 'OP_CST_IPI'
        DataType = ftString
        ParamType = ptOutput
        Size = 2
      end
      item
        Position = 30
        Name = 'OP_COD_ENQUADRAMENTO'
        DataType = ftString
        ParamType = ptOutput
        Size = 3
      end
      item
        Position = 31
        Name = 'OP_BASE_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 32
        Name = 'OP_ALIQUOTA_IPI'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 33
        Name = 'OP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 34
        Name = 'OP_CST_PIS'
        DataType = ftString
        ParamType = ptOutput
        Size = 2
      end
      item
        Position = 35
        Name = 'OP_BASE_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 36
        Name = 'OP_P_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 37
        Name = 'OP_QUANT_BC_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 38
        Name = 'OP_V_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 39
        Name = 'OP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 40
        Name = 'OP_CST_COFINS'
        DataType = ftString
        ParamType = ptOutput
        Size = 2
      end
      item
        Position = 41
        Name = 'OP_BASE_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 42
        Name = 'OP_P_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 43
        Name = 'OP_QUANT_BC_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 44
        Name = 'OP_V_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 45
        Name = 'OP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 46
        Name = 'OP_DESCONTO_RATEADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 47
        Name = 'OP_CST_PIS_ENTRADA'
        DataType = ftString
        ParamType = ptOutput
        Size = 2
      end
      item
        Position = 48
        Name = 'OP_CST_COFINS_ENTRADA'
        DataType = ftString
        ParamType = ptOutput
        Size = 2
      end
      item
        Position = 49
        Name = 'OP_ALIQUOTA_PIS_ENTRADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 50
        Name = 'OP_ALIQUOTA_COFINS_ENTRADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 51
        Name = 'OP_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 52
        Name = 'OP_CST_PIS_E_CFOP'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 53
        Name = 'OP_CST_COFINS_E_CFOP'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 54
        Name = 'OP_CST_PIS_S_CFOP'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 55
        Name = 'OP_CST_COFINS_S_CFOP'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 56
        Name = 'OP_ALIQ_PIS_E_CFOP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 57
        Name = 'OP_ALIQ_PIS_S_CFOP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 58
        Name = 'OP_ALIQ_COFINS_E_CFOP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 59
        Name = 'OP_ALIQ_COFINS_S_CFOP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 60
        Name = 'OP_CEST'
        DataType = ftString
        ParamType = ptOutput
        Size = 15
      end>
  end
  object fdspRC170SPEDF: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C170'
    Left = 344
    Top = 1094
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_EMISSAO_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 4
        Name = 'IP_MODELO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 5
        Name = 'IP_SERIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 6
        Name = 'IP_NUMERO_ITEM'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CODIGO_ITEM'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 8
        Name = 'IP_DESCRICAO_COMPLEMENTAR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 9
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 5
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_UNIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 11
        Name = 'IP_VALOR_ITEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_IND_MOVIMENTACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CST_ICMS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 16
        Name = 'IP_COD_NATUREZA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 17
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_ALIQUOTA_ST'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_VALOR_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_IND_APURACAO_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 24
        Name = 'IP_CST_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 25
        Name = 'IP_COD_ENQUADRAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 26
        Name = 'IP_BASE_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_ALIQUOTA_IPI'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_CST_PIS'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 30
        Name = 'IP_BASE_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_P_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_QUANT_BC_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_V_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_CST_COFINS'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 36
        Name = 'IP_BASE_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_P_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_QUANT_BC_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 39
        Name = 'IP_V_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_COD_CONTA_ANALITICA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 42
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 43
        Name = 'IP_TIPO_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspGravarRegistroC190SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO_C190_SPED'
    Left = 344
    Top = 1139
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ENTRADA_SAIDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NFENTRADA_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 5
        Name = 'IP_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 6
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 8
        Name = 'IP_EMISSAO_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_ALIQUOTA_CRED_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'OP_CST_ICMS'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 11
        Name = 'OP_CFOP'
        DataType = ftString
        ParamType = ptOutput
        Size = 5
      end
      item
        Position = 12
        Name = 'OP_ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 13
        Name = 'OP_VALOR_OPERACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 14
        Name = 'OP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 15
        Name = 'OP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 16
        Name = 'OP_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 17
        Name = 'OP_VALOR_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 18
        Name = 'OP_VALOR_REDUCAO_BASE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 19
        Name = 'OP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 20
        Name = 'OP_CODIGO_OBSERVACAO'
        DataType = ftString
        ParamType = ptOutput
        Size = 6
      end
      item
        Position = 21
        Name = 'OP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 22
        Name = 'OP_DESCONTO_RATEADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 23
        Name = 'OP_DESPESA_RATEADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 24
        Name = 'OP_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspRC190SPEDF: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_RC190_SPED'
    Left = 344
    Top = 1184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CST_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 4
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR_OPERACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_VALOR_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_REDUCAO_BASE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CODIGO_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 13
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 14
        Name = 'IP_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 15
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 16
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 17
        Name = 'IP_EMISSAO_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object fdspLivroSaida: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_LIVRO_SAIDA'
    Left = 69
    Top = 1004
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_LIVRO_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_MES_ANO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 5
        Name = 'IP_TIPO_ESPECIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 6
        Name = 'IP_SERIE_SUBSERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 7
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 8
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_UF_DESTINATARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 10
        Name = 'IP_VALOR_CONTABIL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_CODIGO_CONTABIL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 13
        Name = 'IP_BASE_CALCULO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ALIQUOTA'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_IMPOSTO_DEBITADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_ISENTAS_NAO_TRIBUTADAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_OUTRAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_TOTALIZADOR_GERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_CRZ'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_IDENTIFICACAO_ICMS_IPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object fdspLivroEntrada: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_LIVRO_ENTRADA'
    Left = 192
    Top = 1004
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_MES_ANO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'IP_DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 6
        Name = 'IP_TIPO_ESPECIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 7
        Name = 'IP_SERIE_SUBSERIE_DOC'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 8
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CNPJ_EMITENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 10
        Name = 'IP_UF_ORIGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 11
        Name = 'IP_VALOR_CONTABIL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CODIGO_CONTABIL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 14
        Name = 'IP_IDENT_ICMS_IPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_CODIGO_VALORES_FISCAIS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_BASE_CALCULO_VALOR_OPERACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_ALIQUOTA'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_IMPOSTO_CREDITADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 20
        Name = 'IP_LIVRO_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspConsiste_Parc_NFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'CONSISTE_PARCELAS_NF'
    Left = 69
    Top = 1051
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NUMERO_NOTA'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 3
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 4
        Name = 'OP_VALOR_PARCELAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspItemNFSaida: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ITEM_NFSAIDA'
    Left = 69
    Top = 1139
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_EAN'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 4
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CST'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_PDESCONTO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_PICMS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 11
        Name = 'IP_PIPI'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_CF_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 13
        Name = 'IP_BASE_CIMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_BASE_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_VALOR_SUBSTIUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_SUB_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_PREDUCAO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_ISENTA_NAO_TRIBUTADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_IMPORTACAO_CUPOM'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_DESCONTO_RATEADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 25
        Name = 'IP_CST_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 26
        Name = 'IP_COD_ENQUADRAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 27
        Name = 'IP_BASE_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_ALIQUOTA_IPI'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_CST_PIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_BASE_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_P_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_QUANT_BC_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_V_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_CST_COFINS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_BASE_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_P_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_QUANT_BC_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 39
        Name = 'IP_V_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_PERCENTUAL_ISS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_VALOR_ISS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_PERCENTUAL_IOF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_VALOR_IOF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_PERCENTUAL_CIDE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 46
        Name = 'IP_VALOR_CIDE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_CARGA_TRIBUTARIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_TOTAL_IMPOSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 49
        Name = 'IP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_CARGA_NAC_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'IP_CARGA_IMP_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_CARGA_ESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_CARGA_MUNICIPAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_VLR_CARGA_NAC_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 55
        Name = 'IP_VLR_CARGA_IMP_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 56
        Name = 'IP_VLR_CARGA_ESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 57
        Name = 'IP_VLR_CARGA_MUNICIPAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 58
        Name = 'IP_ASSINATURA_IBPT'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 59
        Name = 'IP_ORIGEM_MERCADORIA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 60
        Name = 'IP_FONTE_CARGA_TRIBUTARIA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 61
        Name = 'IP_MERCADORIA_CONSUMO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 62
        Name = 'IP_OUTROS_VALORES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 63
        Name = 'IP_CEST'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 64
        Name = 'IP_ORIGEM_CST_ICMS_PART'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 65
        Name = 'IP_CST_ICMS_PART'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 66
        Name = 'IP_MOD_BC_ICMS_PART'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 67
        Name = 'IP_BC_CALC_ICMS_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 68
        Name = 'IP_PERC_ICMS_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 69
        Name = 'IP_VALOR_ICMS_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 70
        Name = 'IP_MOD_BC_ICMS_ST_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 71
        Name = 'IP_BC_CALC_ICMS_ST_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 72
        Name = 'IP_PERC_ICMS_ST_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 73
        Name = 'IP_VALOR_ICMS_ST_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 74
        Name = 'IP_BC_CALC_OPERACAO_PART'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 75
        Name = 'IP_UF_ST_PART'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 76
        Name = 'IP_EX_TIPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 77
        Name = 'IP_UND_COMERCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 78
        Name = 'IP_UND_TRIBUTAVEL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 79
        Name = 'IP_QTD_TRIBUTAVEL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 80
        Name = 'IP_VALOR_UNIT_TRIBUTAVEL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 81
        Name = 'IP_VALOR_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 82
        Name = 'IP_PEDIDO_COMPRA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 83
        Name = 'IP_NUMERO_ITEM_PED_COMPRA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 84
        Name = 'IP_NUMERO_FCI'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 85
        Name = 'IP_ALIQ_CRED_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 86
        Name = 'IP_VALOR_CRED_CIMS_SIMPLES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 87
        Name = 'IP_CLASSE_ENQ_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 88
        Name = 'IP_ITEM_NF_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 89
        Name = 'IP_EAN_TRIBUTAVEL'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 90
        Name = 'IP_PERC_BC_OPER_PROPRIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 91
        Name = 'IP_BC_ICMS_OPER_DIFERIMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 92
        Name = 'IP_PERC_ICMS_DIFERIMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 93
        Name = 'IP_VALOR_ICMS_DIFERIMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 94
        Name = 'IP_PERC_RED_BC_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 95
        Name = 'IP_MVA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 96
        Name = 'IP_ALIQUOTA_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 97
        Name = 'IP_ALIQUOTA_ICMS_INTERESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 98
        Name = 'IP_PERC_DIFERENCIAL_ALIQ'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 99
        Name = 'IP_ALIQUOTA_ICMS_INTERNA_DESTIN'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 100
        Name = 'IP_PERC_ICMS_PARTILHA_ORIGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 101
        Name = 'IP_PERC_ICMS_PARTILHA_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 102
        Name = 'IP_PERC_FCP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 103
        Name = 'IP_VALOR_ICMS_PART_ORIGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 104
        Name = 'IP_VALOR_ICMS_PART_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 105
        Name = 'IP_VALOR_FCP_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 106
        Name = 'IP_ISENTAS_NTRIB_ICMS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 107
        Name = 'IP_PERC_IPI_DEVOLVIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 108
        Name = 'IP_VALOR_IPI_DEVOLVIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 109
        Name = 'OP_ITEM_NFSAIDA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspCfop_NFSaida: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CFOP_NFSAIDA'
    Left = 192
    Top = 1051
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 4
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 5
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspParcelasNFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PARCELAS_NFSAIDA'
    Left = 69
    Top = 1184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 4
        Name = 'IP_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspConsisteCFOP_ITNFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'CONSISTE_CFOP_ITEMNFSAIDA'
    Left = 480
    Top = 44
    ParamData = <
      item
        Position = 1
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'OP_QTD_CFOP_IT'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspConsisteCFOP_NFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'CONSISTE_CFOP_NFSAIDA'
    Left = 480
    Top = 4
    ParamData = <
      item
        Position = 1
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'OP_QTD_CFOP'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspNFSaida: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_NFSAIDA'
    Left = 69
    Top = 1094
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CUPOM_FISCAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_ECF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_DESTINATARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_SAIDA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_HORA_SAIDA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_BASE_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_VALOR_PRODUTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_VALOR_DO_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_DO_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_VALOR_DA_NOTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_TRANSPORTADORA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_TIPO_FRETE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_QTD_VOLUME'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_ESPECIE_VOLUME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 23
        Name = 'IP_MARCA_VOLUME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 24
        Name = 'IP_NUMERO_VOLUME'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_PESO_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_PESO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20000
      end
      item
        Position = 28
        Name = 'IP_PLACA_VEICULO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 29
        Name = 'IP_UF_VEICULO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 30
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_IMPRESSO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_MODELO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 33
        Name = 'IP_FORMA_PAGTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_TIPO_COBRANCA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_VALOR_CUPOM_FISCAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_DATA_CUPOM_FISCAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_DESCONTO_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 39
        Name = 'IP_CANCELADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_ENTRADA_SAIDA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_BASE_ISSQN'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_VALOR_ISSQN'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_BASE_ISSQN_R'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_VALOR_ISSQN_R'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_C_M_C'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 46
        Name = 'IP_TOTAL_DOS_SERVICOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_PERCENTUAL_PIS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 49
        Name = 'IP_PERCENTUAL_COFINS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'IP_PERCENTUAL_CSLL'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_VALOR_CSLL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_PERCENTUAL_IRRF'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_VALOR_IRRF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 55
        Name = 'IP_PERCENTUAL_INSS'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 56
        Name = 'IP_VALOR_INSS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 57
        Name = 'IP_RETER_CSLL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 58
        Name = 'IP_RETER_INSS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 59
        Name = 'IP_RETER_PIS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 60
        Name = 'IP_RETER_IRRF'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 61
        Name = 'IP_RETER_COFINS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 62
        Name = 'IP_CNPJ_DESTINATARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 63
        Name = 'IP_RETER_ISSQN'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 64
        Name = 'IP_DANFE_CANCELADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 65
        Name = 'IP_DANFE_INUTILIZADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 66
        Name = 'IP_DANFE_CONTINGENCIA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 67
        Name = 'IP_LOCAL_EMBARQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 68
        Name = 'IP_VALOR_IOF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 69
        Name = 'IP_VALOR_CIDE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 70
        Name = 'IP_VALOR_ISS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 71
        Name = 'IP_CARGA_TRIBUTARIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 72
        Name = 'IP_VALOR_IMPOSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 73
        Name = 'IP_FINALIDADE_NF'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 74
        Name = 'IP_PROT_NF_REFERENCIADA'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 75
        Name = 'IP_INFO_FISCO'
        DataType = ftString
        ParamType = ptInput
        Size = 20000
      end
      item
        Position = 76
        Name = 'IP_CANCELAMENTO_ESTEMPORANEO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 77
        Name = 'IP_CARGA_NAC_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 78
        Name = 'IP_CARGA_IMP_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 79
        Name = 'IP_CARGA_ESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 80
        Name = 'IP_CARGA_MUNICIPAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 81
        Name = 'IP_VLR_CARGA_NAC_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 82
        Name = 'IP_VLR_CARGA_IMP_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 83
        Name = 'IP_VLR_CARGA_ESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 84
        Name = 'IP_VLR_CARGA_MUNICIPAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 85
        Name = 'IP_UF_REFERENCIA_DEVOL'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 86
        Name = 'IP_ANO_MES_REFERENCIA_DEVOLUCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 87
        Name = 'IP_CNPJ_REFERENCIA_DEVOL'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 88
        Name = 'IP_MODELO_REFERENCIA_DEVOL'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 89
        Name = 'IP_SERIE_REFERENCIA_DEVOL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 90
        Name = 'IP_NUMERO_NF_REFERENCIA_DEVOL'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 91
        Name = 'IP_CONSUMIDOR_FINAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 92
        Name = 'IP_DESTINO_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 93
        Name = 'IP_LOCAL_RETIRADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 94
        Name = 'IP_LOCAL_ENTREGA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 95
        Name = 'IP_TOTAL_ICMS_DESONERADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 96
        Name = 'IP_TRANSPORTADOR_ISENTO_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 97
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 98
        Name = 'IP_TIPO_ATENDIMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 99
        Name = 'IP_UF_EMBARQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 100
        Name = 'IP_LOCAL_DESPACHO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 101
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 102
        Name = 'IP_VALOR_FCP_UF_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 103
        Name = 'IP_VALOR_ICMS_UF_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 104
        Name = 'IP_VALOR_ICMS_UF_REMETENTE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 105
        Name = 'IP_VALOR_ENTRADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 106
        Name = 'IP_INDICADOR_IE_DESTINATARIO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspParametros_NFE: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PARAMETROS_NFE'
    Left = 480
    Top = 92
    ParamData = <
      item
        Position = 1
        Name = 'IP_PARAMETOR_NFE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_ORIENTACAO_IMPRESSAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_REPOSITORIO_XML'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 4
        Name = 'IP_REPOSITORIO_PDF'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 5
        Name = 'IP_LOGO_MARCA'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 6
        Name = 'IP_ATUALIZAR_XML'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_EXIBIR_ERRO_SCHEMA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_RETIRAR_ACENTOS_XML_ENV'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_SALVAR_ARQS_ENVIO_RESP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_FORMAT_ALERTA'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 11
        Name = 'IP_PASTA_LOGS'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 12
        Name = 'IP_PASTA_SCHEMAS'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 13
        Name = 'IP_SALVAR_ARQS_PASTA_SEPARADA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CRIAR_PASTA_MENSAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_ADIC_LITERAL_NOME_PASTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_SALVAR_NFE_PELA_EMISSAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_SALVAR_ARQS_EVENTOS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_SEPARAR_ARQ_POR_CNPJ_CERT'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_SEPARAR_ARQ_MOD_DOC'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_PASTA_ARQS_NFE'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 21
        Name = 'IP_PASTA_ARQS_CANCELAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 22
        Name = 'IP_PASTA_ARQS_CCE'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 23
        Name = 'IP_PASTA_ARQS_INUTILIZACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 24
        Name = 'IP_PASTA_ARQS_DEPEC'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 25
        Name = 'IP_PASTA_ARQ_EVENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 26
        Name = 'IP_SALVAR_ENVELOP_SOAP'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_AJUSTAR_MSG_AGUARDE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_TEMPO_AGUARDAR_ENVIO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_TENTATIVAS_ENVIO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_INTERVALO_TENTATIVAS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_SSL_LIB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_CRYPT_LIB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_HTTP_LIB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_XMLSIGN_LIB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_MODELO_CERTIFICADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_CAMINHO_CERTIFICADO'
        DataType = ftString
        ParamType = ptInput
        Size = 300
      end
      item
        Position = 37
        Name = 'IP_SSL_TYPE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_SENHA_CERTIFICADO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 39
        Name = 'IP_VERSAO_NFE'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspDocumento_Ref_NFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_DOC_REF_NFSAIDA'
    Left = 480
    Top = 138
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NF_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_MODELO_NF_SAIDA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'IP_SERIE_NF_SAIDA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 5
        Name = 'IP_CNPJ_NF_SAIDA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_DOCUMENTO_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 7
        Name = 'IP_MODELO_DOC_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 8
        Name = 'IP_CNPJ_FORNECEDOR_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 9
        Name = 'IP_CHAVE_DOCUMENTO_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 10
        Name = 'IP_SERIE_DOC_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 11
        Name = 'IP_ANO_MES_EMISSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 12
        Name = 'IP_UF_DOCUMENTO_REF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 13
        Name = 'IP_EMISSAO_DOCUMENTO_REF'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_IND_EMITENTE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_IND_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_TIPO_DOCUMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_INSCRICAO_EMITENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 19
        Name = 'IP_SIGLA_UF_EMITENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end>
  end
  object fdspCCe: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CCE'
    Left = 192
    Top = 1094
    ParamData = <
      item
        Position = 1
        Name = 'IP_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 2
        Name = 'IP_EMISSAO_NOTA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_CCE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CHAVE_NFE'
        DataType = ftString
        ParamType = ptInput
        Size = 44
      end
      item
        Position = 5
        Name = 'IP_LOTE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_ORGAO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 7
        Name = 'IP_TIPO_EVENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 8
        Name = 'IP_VERSAO_EVENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 9
        Name = 'IP_PROTOCOLO'
        DataType = ftString
        ParamType = ptInput
        Size = 44
      end
      item
        Position = 10
        Name = 'IP_CORRECAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 11
        Name = 'OP_CCE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspSomaItensNFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'SOMA_VALORES_ITENS_NFS'
    Left = 480
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'OP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'OP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 5
        Name = 'OP_BASE_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'OP_VALOR_SUBSTITUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 7
        Name = 'OP_VALOR_DOS_PRODUTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'OP_VALOR_DO_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 9
        Name = 'OP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 10
        Name = 'OP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 11
        Name = 'OP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 12
        Name = 'OP_VALOR_ISS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 13
        Name = 'OP_VALOR_IOF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 14
        Name = 'OP_VALOR_CIDE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 15
        Name = 'OP_TOTAL_IMPOSTOS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 16
        Name = 'OP_VALOR_ICMS_12741'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 17
        Name = 'OP_VLR_CARGA_NAC_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 18
        Name = 'OP_VLR_CARGA_IMP_FEDERAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 19
        Name = 'OP_VLR_CARGA_ESTADUAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 20
        Name = 'OP_VLR_CARGA_MUNICIPAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 21
        Name = 'OP_OUTROS_VALORES'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 22
        Name = 'OP_VLR_IPI_DEVOLVIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 23
        Name = 'OP_VALOR_FCP_UF_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 24
        Name = 'OP_VALOR_ICMS_UF_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 25
        Name = 'OP_VALOR_ICMS_UF_REMETENTE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspTransportadorNFS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_TRANSPORTADOR_NFSAIDA'
    Left = 192
    Top = 1139
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NFSAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 4
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 5
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_ISENTO_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 8
        Name = 'IP_PLACA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 9
        Name = 'IP_RNTC'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 10
        Name = 'IP_BC_ICMS_RETENCAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_ALIQ_ICMS_RETENCAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_DO_SERVICO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_UF_RETENCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 14
        Name = 'IP_MUNICIPIO_RETENCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_CFOP_RETENCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 16
        Name = 'IP_VALOR_ICMS_RETENCAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_TRANSPORTADOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspFCP_Estados: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_FCP_ESTADOS'
    Left = 192
    Top = 1184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SIGLA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'IP_NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Position = 4
        Name = 'IP_FCP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_EXCECAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ALIQ_INTERNA_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object fdspGravarFCP_Estados: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_FCP_ESTADOS'
    Left = 480
    Top = 229
    ParamData = <
      item
        Position = 1
        Name = 'IP_NF_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'IP_UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 4
        Name = 'OP_NCM'
        DataType = ftString
        ParamType = ptOutput
        Size = 8
      end
      item
        Position = 5
        Name = 'OP_FCP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'OP_ALIQ_INTERNA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspGravarRegistroC101SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO_C101'
    Left = 480
    Top = 274
    ParamData = <
      item
        Position = 1
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_NUMERO_NF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 4
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 5
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'OP_VALOR_FCP_UF_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 7
        Name = 'OP_VALOR_ICMS_UF_DESTINO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'OP_VALOR_ICMS_UF_REMETENTE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
  object fdspMan_Tab_RC101: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_SPED_RC101'
    Left = 480
    Top = 321
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NUMERO_NF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 5
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_VALOR_FCP_UF_DEST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VALOR_ICMS_UF_DEST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_VALOR_ICMS_UF_REMETENTE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_RC100_SPED: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C100_SPED'
    Left = 480
    Top = 368
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_IND_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_INDICADOR_EMITENTE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_COD_PARTICIPANTE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 5
        Name = 'IP_COD_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_COD_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 8
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 9
        Name = 'IP_CHAVE_NFE'
        DataType = ftString
        ParamType = ptInput
        Size = 44
      end
      item
        Position = 10
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_ENTRADA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_DOCUMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_IND_PAGAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_VALOR_DESCONTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_ABATIMENTO_NT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_VALOR_MERCADORIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_IND_FRETE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_VALOR_FRETE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_VALOR_SEGURO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_VALOR_OUTRAS_DESPESAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_BASE_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_VALOR_BASE_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_VALOR_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_VALOR_IPI'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_VALOR_PIS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_VALOR_COFINS_ST'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_TIPO_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_R50_Sint: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_R50_SINT'
    Left = 480
    Top = 412
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 3
        Name = 'IP_INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 4
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_UF'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 6
        Name = 'IP_MODELO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 8
        Name = 'IP_NOTAFISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 9
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 10
        Name = 'IP_EMITENTE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 11
        Name = 'IP_VALOR_TOTAL'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_BASE_CALCULO_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_VALOR_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ISENTA_NAO_TRIBUTADA'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_OUTRAS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_ALIQUOTA'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_SITUACAO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 18
        Name = 'IP_TIPO_NOTA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_R70_Sint: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'GRAVAR_REGISTRO70'
    Left = 480
    Top = 455
    ParamData = <
      item
        Position = 1
        Name = 'IP_NFENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CONHECIMENTO_FRETE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 4
        Name = 'IP_INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 5
        Name = 'IP_EMISSAO_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ESTADO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 7
        Name = 'IP_MODELO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_SERIE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 9
        Name = 'IP_SUBSERIE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 10
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 12
        Name = 'IP_VALOR_TOTAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_BASE_CALC_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_ISENTAS_NAO_TRIBUTADA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_OUTRAS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_CIF_FOB'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_SITUACAO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end>
  end
  object fdspProdutos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PRODUTOS'
    Left = 480
    Top = 594
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 4
        Name = 'IP_GRUPO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_SUBGRUPO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_SECAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_UNIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 8
        Name = 'IP_UNIDADE_EMBALAGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_PESO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_PESO_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_TRIBUTACAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_ATIVO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_REDUCAO_BC'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CST'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 15
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Position = 18
        Name = 'IP_INF_NUTRICIONAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 20
        Name = 'IP_ISENTO_PIS_COFINS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_SIMILAR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_FABRICANTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_COMPOEM_CESTA_BASICA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_PERMITE_VENDA_FRACIONADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_UNIDADE_ATACADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_VISIBILIDADE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_CST_IPI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_CST_PIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 31
        Name = 'IP_CST_COFINS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_TIPO_ITEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 33
        Name = 'IP_LEI_PIS_COFINS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 34
        Name = 'IP_PRODUTO_ORIGEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_CST_PIS_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 36
        Name = 'IP_CST_COFINS_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_NATUREZA_RECEITA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 38
        Name = 'IP_UND_ATACADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 39
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 41
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 43
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 44
        Name = 'IP_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_ALIQ_PIS_ENTRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 5
        ParamType = ptInput
      end
      item
        Position = 46
        Name = 'IP_ALIQ_COFINS_ENTRA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 5
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_CODIGO_CREDITO_PIS_COFINS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_CODIGO_ANP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 49
        Name = 'IP_CARGA_TRIBUTARIA_NAC'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_CARGA_TRIBUTARIA_IMP'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'IP_EX_TIPI'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_DESCONTO_PER'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_ORIGEM_MERCADORIA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_CEST'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 55
        Name = 'OP_DESCRICAO'
        DataType = ftString
        ParamType = ptOutput
        Size = 40
      end
      item
        Position = 56
        Name = 'OP_GRUPO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 57
        Name = 'OP_SUB_GRUPO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 58
        Name = 'OP_SECAO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 59
        Name = 'OP_UNIDADE'
        DataType = ftString
        ParamType = ptOutput
        Size = 6
      end
      item
        Position = 60
        Name = 'OP_UNIDADE_EMBALAGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 61
        Name = 'OP_PESO_LIQUIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 62
        Name = 'OP_PESO_BRUTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 63
        Name = 'OP_TRIBUTACAO'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 64
        Name = 'OP_ATIVO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 65
        Name = 'OP_RED_BASE_CALCULO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 5
        ParamType = ptOutput
      end
      item
        Position = 66
        Name = 'OP_CST'
        DataType = ftString
        ParamType = ptOutput
        Size = 3
      end
      item
        Position = 67
        Name = 'OP_STATUS'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 68
        Name = 'OP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 69
        Name = 'OP_NCM'
        DataType = ftString
        ParamType = ptOutput
        Size = 15
      end
      item
        Position = 70
        Name = 'OP_INF_NUTRICIONAL'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 71
        Name = 'OP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptOutput
        Size = 20
      end
      item
        Position = 72
        Name = 'OP_ISENTO_PIS_COFINS'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 73
        Name = 'OP_SIMILAR'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 74
        Name = 'OP_FABRICANTE'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 75
        Name = 'OP_COMPOEM_CESTA_BASICA'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 76
        Name = 'OP_PERMITE_VENDA_FRACIONADA'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 77
        Name = 'OP_UNIDADE_ATACADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptOutput
      end
      item
        Position = 78
        Name = 'OP_ALIQUOTA_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 79
        Name = 'OP_ALIQUOTA_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 4
        ParamType = ptOutput
      end
      item
        Position = 80
        Name = 'OP_VISIBILIDADE'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 81
        Name = 'OP_CST_IPI'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 82
        Name = 'OP_CST_PIS'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 83
        Name = 'OP_CST_COFINS'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 84
        Name = 'OP_TIPO_ITEM'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 85
        Name = 'OP_MVA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 86
        Name = 'OP_PAUTA_FISCAL'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 87
        Name = 'OP_LEI_PIS_COFINS'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 88
        Name = 'OP_PRODUTO_ORIGEM'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 89
        Name = 'OP_CST_PIS_ENTRADA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 90
        Name = 'OP_CST_COFINS_ENTRADA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 91
        Name = 'OP_NATUREZA_RECEITA'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 92
        Name = 'OP_UND_ATACADO'
        DataType = ftString
        ParamType = ptOutput
        Size = 2
      end
      item
        Position = 93
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspBarras: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_BARRAS'
    Left = 480
    Top = 639
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 3
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PESADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_GERADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_QUANTIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 11
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 12
        Name = 'IP_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'OP_GERADO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 14
        Name = 'OP_PESADO'
        DataType = ftSmallint
        ParamType = ptOutput
      end
      item
        Position = 15
        Name = 'OP_QUANTIDADE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspPrecoQuantidade: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PRECO_QUANTIDADE'
    Left = 480
    Top = 684
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PRECO_DESCONTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_PRECO_UNITARIO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 7
        Name = 'IP_FILIAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 17
      end
      item
        Position = 9
        Name = 'IP_PERCENTUAL_DESCONTO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object fdspMVA: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_MVA'
    Left = 480
    Top = 730
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 4
        Name = 'IP_MVA'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_ICMS_INTERESTADUAL'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ICMS_INTERNO'
        DataType = ftBCD
        Precision = 7
        NumericScale = 2
        ParamType = ptInput
      end>
  end
  object fdspReceitaProdutos: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_RECEITA_PRODUTOS'
    Left = 480
    Top = 778
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_RECEITA_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_INGREDIENTES1'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 6
        Name = 'IP_INGREDIENTES2'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 7
        Name = 'IP_INGREDIENTES3'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 8
        Name = 'IP_INGREDIENTES4'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 9
        Name = 'IP_INGREDIENTES5'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 10
        Name = 'IP_INGREDIENTES6'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 11
        Name = 'IP_INGREDIENTES7'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 12
        Name = 'OP_RECEITA_PRODUTOS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspTeclado_Balanca: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_TECLADO'
    Left = 480
    Top = 825
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SETOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_TECLA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_TECLADO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 7
        Name = 'IP_TEXTO_BOTAO_01'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 8
        Name = 'IP_TEXTO_BOTAO_02'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 9
        Name = 'IP_TEXTO_BOTAO_03'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 10
        Name = 'IP_TEXTO_CONJUGADO_01'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 11
        Name = 'IP_TEXTO_CONJUGADO_02'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 12
        Name = 'IP_TEXTO_CONJUGADO_03'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 13
        Name = 'IP_SITUACAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_CAMINHO_IMAGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 15
        Name = 'IP_OPCAO_LOCAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspLog: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_LOG'
    Left = 480
    Top = 869
    ParamData = <
      item
        Position = 1
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_USUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_HISTORICO'
        DataType = ftString
        ParamType = ptInput
        Size = 250
      end
      item
        Position = 4
        Name = 'IP_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 7
        Name = 'IP_ENDERECO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 8
        Name = 'IP_NOME_TABELA'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object fdspDataHoraServidor: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'DATAEHORA'
    Left = 480
    Top = 914
    ParamData = <
      item
        Position = 1
        Name = 'DATA_HORA_ATUAL'
        DataType = ftTimeStamp
        ParamType = ptOutput
      end>
  end
  object fdspCtrl_Update: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CTRL_UPDATE'
    Left = 480
    Top = 959
    ParamData = <
      item
        Position = 1
        Name = 'IP_NOME_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 2
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 3
        Name = 'IP_DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_HORA'
        DataType = ftTime
        ParamType = ptInput
      end>
  end
  object fdspFretePedidoVenda: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_FRETE_PEDIDO_VENDA'
    Left = 480
    Top = 1004
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FRETE_PEDIDO_VENDA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_TIPO_LANCAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_PLANO_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_ITEM_PLANO_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_TIPO_PAGAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'OP_FRETE_PEDIDO_VENDA'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspDeslocamentoOS: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_DESLOCAMENTO_OS'
    Left = 480
    Top = 1051
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DESLOCAMENTO_OS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_ORDEM_SERVICO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DATA_CADASTRO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_HORA_SAIDA_ORIGEM'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_KM_SAIDA_ORIGEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_HORA_CHEGADA_DESTINO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_KM_CHEGADA_DESTINO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_HORA_SAIDA_DESTINO'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_KM_SAIDA_DESTINO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_HORA_REGRESSO_ORIGEM'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_KM_REGRESSO_ORIGEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_VALOR_ALIMENTACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_VALOR_HOSPEDAGEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_KM_TOTAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_HORAS_TOTAL'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'OP_DESLOCAMENTO_OS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspConfig_financeiro: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CONFIG_FINANCEIRO'
    Left = 480
    Top = 1094
    ParamData = <
      item
        Position = 1
        Name = 'IP_CONFIG_FINANCEIRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_EMITIR_RECIBO_RECEBIMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_IMPORTAR_CHEQUE_PDV'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'OP_EMITIR_RECIBO_RECEBIMENTO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspMan_Tab_Arq_Imp_Prod: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_ARQ_IMP_PRO'
    Left = 69
    Top = 1231
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_IMPORTACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_MOVIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_ARQUIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object fdspMan_Tab_Reg60M: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REG60_MESTRE'
    Left = 69
    Top = 1277
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 3
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_NUMERO_CAIXA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_COO_INICIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_COO_FINAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CRZ'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VENDA_BRUTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_GT_FINAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_CRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 12
        Name = 'IP_REG60MESTRE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_Reg60A: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REG60_ANALITICO'
    Left = 69
    Top = 1324
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 3
        Name = 'IP_ALIQUOTA'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 4
        Name = 'IP_VALOR_ACUMULADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_REG60_MESTRE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_Reg60D: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO60D'
    Left = 69
    Top = 1372
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NUMERO_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_QUANTIDADE'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_BASE_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 8
        Name = 'IP_VALOR_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 10
        Name = 'IP_ECF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 12
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspMan_Tab_Reg60I: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO60I'
    Left = 69
    Top = 1420
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NUMERO_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_QUANTIDADE'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_BASE_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 8
        Name = 'IP_VALOR_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 10
        Name = 'IP_ECF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 12
        Name = 'IP_NUMERO_ITEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspMan_Tab_Reg60R: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO60R'
    Left = 69
    Top = 1468
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NUMERO_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_QUANTIDADE'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR_UNITARIO'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_BASE_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 8
        Name = 'IP_VALOR_ICMS'
        DataType = ftSingle
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 10
        Name = 'IP_ECF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 12
        Name = 'OP_PRODUTO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspChequesREC: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CHQ_RECEBER'
    Left = 192
    Top = 1231
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_BANCO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_AGENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 7
        Name = 'IP_CHEQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 8
        Name = 'IP_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_BAIXA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_VALOR_RECEBIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_TERCEIRO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_NOME_TERCEIRO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 14
        Name = 'IP_CPF_TERCEIRO'
        DataType = ftString
        ParamType = ptInput
        Size = 19
      end
      item
        Position = 15
        Name = 'IP_TELEFONE_TERCEIRO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 16
        Name = 'IP_DEPOSITO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_ALINEA'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 18
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_CONTA_CORRENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 20
        Name = 'IP_DEVOLUCAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_REAPRESENTACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_PLANO_DE_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_ITEM_PLANO_DE_CONTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 24
        Name = 'IP_CUPOM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_LANCAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_OBS_REPASSADO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 27
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 2000
      end
      item
        Position = 28
        Name = 'IP_JUROS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_SELECIONADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 30
        Name = 'IP_GERADO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspMan_Tab_RC405: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C405'
    Left = 192
    Top = 1277
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CRZ'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_NUM_COO_FINAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_GT_FINAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_VALOR_VENDA_BRUTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object fdspMan_Tab_RC410: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C410'
    Left = 192
    Top = 1324
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object fdspMan_Tab_RC420: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C420'
    Left = 192
    Top = 1372
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_CODIGO_TOTA_PARCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Position = 5
        Name = 'IP_VALOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_NUMERO_TOTALIZADOR'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_DESCRICAO_TOTALIZADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 8
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object fdspMan_Tab_RC460: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C460'
    Left = 192
    Top = 1420
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_COD_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'IP_COD_SITUACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_NUM_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 5
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_VALOR_DOCUMENTO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Position = 10
        Name = 'IP_NOME_ADQUIRENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 11
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 12
        Name = 'IP_CODIGO_TOT_PARCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end>
  end
  object fdspMan_Tab_RC470: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C470'
    Left = 192
    Top = 1468
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_ITEM'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 3
        Name = 'IP_QUANTIDADE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_QUANTIDADE_CANC'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_UNIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 6
        Name = 'IP_VALOR_ITEM'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CST_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 9
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_PIS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_VALOR_COFINS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_NUMERO_CUPOM'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 14
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 15
        Name = 'IP_CODIGO_TOT_PARCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end
      item
        Position = 16
        Name = 'IP_COD_CTA'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end>
  end
  object fdspMan_Tab_RC490: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REGISTRO_C490'
    Left = 344
    Top = 1231
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_CST_ICMS'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 4
        Name = 'IP_CFOP'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 5
        Name = 'IP_ALIQUOTA_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_VALOR_OPERACAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_VALOR_BC_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CODIGO_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 10
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
      end
      item
        Position = 11
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 12
        Name = 'IP_CODIGO_TOT_PARCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 7
      end>
  end
  object fdspClientes: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CLIENTE'
    Left = 344
    Top = 1277
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_RAZAO_SOCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 4
        Name = 'IP_FANTASIA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 5
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_INSCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 7
        Name = 'IP_CADASTRO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 9
        Name = 'IP_NUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 11
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 12
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 13
        Name = 'IP_TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 15
        Name = 'IP_CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 16
        Name = 'IP_HTTP'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 17
        Name = 'IP_EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 18
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 19
        Name = 'IP_DDD'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 20
        Name = 'IP_TELEFONE_1'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 21
        Name = 'IP_TELEFONE_2'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 22
        Name = 'IP_CELULAR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 23
        Name = 'IP_FAX'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 24
        Name = 'IP_NASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 25
        Name = 'IP_RENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 26
        Name = 'IP_LIMITE_CREDITO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_SALDO_DEVEDOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 28
        Name = 'IP_STATUS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 29
        Name = 'IP_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 13
      end
      item
        Position = 30
        Name = 'IP_ENDERECO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 31
        Name = 'IP_NUMERO_ENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 32
        Name = 'IP_CEP_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 33
        Name = 'IP_BAIRRO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 34
        Name = 'IP_ESTADO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 35
        Name = 'IP_ENDERECO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 36
        Name = 'IP_NUMERO_COBRANCA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 37
        Name = 'IP_CEP_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 38
        Name = 'IP_BAIRRO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 39
        Name = 'IP_ESTADO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 40
        Name = 'IP_PONTO_REFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 41
        Name = 'IP_VALIDADE_DO_CREDITO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 42
        Name = 'IP_TIPO_CREDITO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 43
        Name = 'IP_DATA_CONSULTA_SPC'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 44
        Name = 'IP_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 45
        Name = 'IP_ULTIMA_NF'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 46
        Name = 'IP_DATA_ULTIMA_NF'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_VALOR_ULTIMA_NF'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 48
        Name = 'IP_ULTIMO_CHQ_DEVOLVIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 49
        Name = 'IP_DATA_ULTIMO_CHQ_DEVOLVIDO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_VALOR_ULTIMO_CHQ_DEVOLVIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'IP_MOTIVO_DEVOLUCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 52
        Name = 'IP_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_CIDADE_ENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_CIDADE_COBRANCA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 55
        Name = 'IP_ATIVO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 56
        Name = 'IP_PAI'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 57
        Name = 'IP_MAE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 58
        Name = 'IP_EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 59
        Name = 'IP_TELEFONE_EMPRESA_1'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 60
        Name = 'IP_TELEFONE_EMPRESA_2'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 61
        Name = 'IP_RAMAL'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Position = 62
        Name = 'IP_CONTATO_EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 63
        Name = 'IP_REFERENCIA_PESSOAL_1'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 64
        Name = 'IP_REFERENCIA_PESSOAL_2'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 65
        Name = 'IP_REFERENCIA_PESSOAL_3'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 66
        Name = 'IP_TELEFONE_REFERENCIA_1'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 67
        Name = 'IP_TELEFONE_REFERENCIA_2'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 68
        Name = 'IP_TELEFONE_REFERENCIA_3'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 69
        Name = 'IP_SEXO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 70
        Name = 'IP_ESTADO_CIVIL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 71
        Name = 'IP_CONJUGE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 72
        Name = 'IP_POSSUI_DEPENDENTES'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 73
        Name = 'IP_QUANTIDADE_DEPENDENTES'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 74
        Name = 'IP_DEPENDENTES'
        DataType = ftString
        ParamType = ptInput
        Size = 2048
      end
      item
        Position = 75
        Name = 'IP_TEMPO_EMPRESA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 76
        Name = 'IP_TIPO_TEMPO_EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 77
        Name = 'IP_REFERENCIA_COMERCIAL_1'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 78
        Name = 'IP_REFERENCIA_COMERCIAL_2'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 79
        Name = 'IP_REFERENCIA_COMERCIAL_3'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 80
        Name = 'IP_TELEFONE_REF_COMERCIAL_1'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 81
        Name = 'IP_TELEFONE_REF_COMERCIAL_2'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 82
        Name = 'IP_TELEFONE_REF_COMERCIAL_3'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 83
        Name = 'IP_CONTATO_REF_COMERCIAL_1'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 84
        Name = 'IP_CONTATO_REF_COMERCIAL_2'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 85
        Name = 'IP_CONTATO_REF_COMERCIAL_3'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 86
        Name = 'IP_LIBERA_VENDA_ACIMA_LIMITE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 87
        Name = 'IP_VENDEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 88
        Name = 'IP_SOCIO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 89
        Name = 'IP_CONTRIBUICAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 90
        Name = 'IP_NUMERO_CARTAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 91
        Name = 'IP_EMISSAO_CARTAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 92
        Name = 'IP_DATA_VALIDADE_CARTAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 93
        Name = 'IP_DESCONTO_PERSONALIZADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 94
        Name = 'IP_PAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 95
        Name = 'IP_INSCRICAO_SUFRAMA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 96
        Name = 'IP_GARANTIDOR_OS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 97
        Name = 'IP_CONTRIBUINTE_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 98
        Name = 'IP_CLIENTE_SH'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 99
        Name = 'OP_CLIENTE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspCtrlNotas: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_CTRL_NOTAS'
    Left = 344
    Top = 1324
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CTRL_NOTAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_DATA_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 7
        Name = 'IP_VALOR_NOTA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_VALOR_ICMS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_VALOR_DEVOLUCAO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_VALOR_BRINDE'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 11
        Name = 'IP_VALOR_REMESSA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 12
        Name = 'IP_VALOR_IMOBILIZADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 13
        Name = 'IP_TIPO_UTILIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_SETOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 16
        Name = 'IP_DESCRICAO_TIPO_UTIL'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 17
        Name = 'IP_DESCRICAO_SETOR'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 18
        Name = 'IP_TIPO_LANCAMENTO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'OP_CTRL_NOTAS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspTipoUtilCtrlNotas: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_TIPO_UTIL_CTRL_NOTAS'
    Left = 344
    Top = 1372
    ParamData = <
      item
        Position = 1
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 2
        Name = 'OP_TIPO_UTIL_CTRL_NOTAS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspSetorCtrlNotas: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_SETOR_CTRL_NOTAS'
    Left = 344
    Top = 1420
    ParamData = <
      item
        Position = 1
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end
      item
        Position = 2
        Name = 'OP_SETOR_CTRL_NOTAS'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspRef_Fornecedor: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_REFERENCIA_FORNECEDOR'
    Left = 346
    Top = 1468
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_REFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 5
        Name = 'IP_REFERENCIAFORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'OP_REFERENCIAFORNECEDOR'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspParamIntegraPDV: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PARAM_INTEGRA_PDV'
    Left = 480
    Top = 1139
    ParamData = <
      item
        Position = 1
        Name = 'IP_MODELO_PDV'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_TIPO_INTEGRA_EXPORTACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_TIPO_INTEGRA_IMPORTACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_ARREDONDA_TRUNCA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 5
        Name = 'IP_PASTA_EXPORTACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 6
        Name = 'IP_PASTA_IMPORTACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 7
        Name = 'IP_ARQ_PRODUTOS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 8
        Name = 'IP_ARQ_COD_BARRAS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 9
        Name = 'IP_ARQ_MONTAGEM_KIT'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 10
        Name = 'IP_ARQ_CLIENTES'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 11
        Name = 'IP_ARQ_AUTORIZADOS_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 12
        Name = 'IP_ARQ_LISTA_NEGRA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 13
        Name = 'IP_ARQ_VENDEDOR'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 14
        Name = 'IP_ARQ_COFINS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 15
        Name = 'IP_ARQ_COFINS_ST'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 16
        Name = 'IP_ARQ_ICMS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 17
        Name = 'IP_ARQ_IMPOSTO_IMPORTACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 18
        Name = 'IP_ARQ_IPI'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 19
        Name = 'IP_ARQ_ISSQN'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 20
        Name = 'IP_ARQ_PIS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 21
        Name = 'IP_ARQ_PIS_ST'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 22
        Name = 'IP_ARQ_TRANSPORTADORAS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 23
        Name = 'IP_ARQ_TRANSP_VEICULOS'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 24
        Name = 'IP_ARQ_FORMA_PAGAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 25
        Name = 'IP_ARQ_PLANO_PAGAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 26
        Name = 'IP_ARQ_ADM_CARTOES'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 27
        Name = 'IP_ARQ_PERGUNTAS_LISTA_VEZ'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 28
        Name = 'IP_ARQ_MOTIVO_CANCELAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 29
        Name = 'IP_ARQ_MOTIVO_DESCONTO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 30
        Name = 'IP_ARQ_MOTIVO_DEVOLUCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 31
        Name = 'IP_ARQ_OPERADORES'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 32
        Name = 'IP_ARQ_NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 33
        Name = 'IP_ARQ_PRE_VENDA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 34
        Name = 'IP_ARQ_RESPOSTA_PRE_VENDA'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 35
        Name = 'IP_ARQ_KARDEX'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 36
        Name = 'IP_ARQ_ATUALIZA_PRECO'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 37
        Name = 'IP_ARQ_CEST'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 38
        Name = 'IP_ARQ_ANP'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end
      item
        Position = 39
        Name = 'IP_TIPO_CODIGO_INTEGRACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdspSped_R0500: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_SPED_R0500'
    Left = 480
    Top = 503
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_COD_CTA'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Position = 3
        Name = 'IP_NOME_CTA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 4
        Name = 'IP_COD_NAT_CC'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 5
        Name = 'IP_IND_CTA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 6
        Name = 'IP_NIVEL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_COD_CTA_REFER'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Position = 8
        Name = 'IP_CNPJ_EST'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object fdspParticipantes: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_PARTICIPANTES'
    Left = 480
    Top = 1184
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_PARTICIPANTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_ATIVO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_TIPO_EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'IP_SITUACAO_EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 7
        Name = 'IP_DATA_NASCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_DATA_ABERTURA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_DATA_ENCERRAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_NOME_RAZAO_SOCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 11
        Name = 'IP_NOME_FANTASIA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 12
        Name = 'IP_CNPJ_CPF_CEI'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 13
        Name = 'IP_RG_IE'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 14
        Name = 'IP_PESSOA_FISICA_JUTIDICA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_INSCRICAO_MUNICIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 16
        Name = 'IP_INSCRICAO_SUFRAMA'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 17
        Name = 'IP_CRT'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_CNAE_PRINCIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 1024
      end
      item
        Position = 19
        Name = 'IP_CNAE_SECUNDARIOS'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_CODIGO_PAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_TIPO_LOGRADOURO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 23
        Name = 'IP_NUMERO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 24
        Name = 'IP_COMPLEMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 25
        Name = 'IP_BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 26
        Name = 'IP_CODIGO_MUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 27
        Name = 'IP_CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 28
        Name = 'IP_ESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 29
        Name = 'IP_CONTATO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 30
        Name = 'IP_DDD'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 31
        Name = 'IP_TELEFONE1'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 32
        Name = 'IP_TELEFONE2'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 33
        Name = 'IP_CELULAR'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 34
        Name = 'IP_USAR_ENDERECOS_IGUAIS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 35
        Name = 'IP_ENDERECO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 36
        Name = 'IP_NUMERO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 37
        Name = 'IP_COMPLEMENTO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 38
        Name = 'IP_BAIRRO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 39
        Name = 'IP_CODIGO_MUNICIPIO_ENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 40
        Name = 'IP_CEP_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 41
        Name = 'IP_ESTADO_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 42
        Name = 'IP_ENDERECO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 43
        Name = 'IP_NUMERO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 44
        Name = 'IP_COMPLEMENTO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 45
        Name = 'IP_BAIRRO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 46
        Name = 'IP_CODIGO_MUNICIPIO_COBRANCA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 47
        Name = 'IP_CEP_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 48
        Name = 'IP_ESTADO_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 49
        Name = 'IP_GARANTIDOR_OS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 50
        Name = 'IP_PRODUTOR_RURAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 51
        Name = 'IP_TIPO_INSCRICAO_FEDERAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 52
        Name = 'IP_INSCRICAO_PRODUTOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 53
        Name = 'IP_CONTRIBUINTE_ICMS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 54
        Name = 'IP_IE_SUBSTITUTO_TRIB'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 55
        Name = 'IP_PIS_PASEP'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 56
        Name = 'IP_WEB_SITE'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 57
        Name = 'IP_EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 500
      end
      item
        Position = 58
        Name = 'IP_OBSERVACAO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 59
        Name = 'IP_RENDA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 60
        Name = 'IP_LIMITE_CREDITO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 61
        Name = 'IP_SALDO_DEVEDOR'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 62
        Name = 'IP_CODIGO_ATIVIDADE_FEDERAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 63
        Name = 'IP_CODIGO_ATIVIDADE_ESTADUAL'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 64
        Name = 'IP_CODIGO_ATIVIDADE_MUNICIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 65
        Name = 'IP_CODIGO_UNIFICAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 66
        Name = 'IP_PONTO_REFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 67
        Name = 'IP_PONTO_REFERENCIA_ENTREGA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 68
        Name = 'IP_PONTO_REFERENCIA_COBRANCA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 69
        Name = 'IP_VENDEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 70
        Name = 'IP_CLIENTE_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 71
        Name = 'IP_PERMITE_VENDA_STS_BLOQUEADO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 72
        Name = 'IP_DESCONTO_PERNONALIZADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 73
        Name = 'OP_PARTICIPANTES'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspTipoLogradouro: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    Transaction = dmDBEXMaster.fdtMaster
    UpdateTransaction = dmDBEXMaster.fdtMaster
    StoredProcName = 'MAN_TAB_TIPO_LOGRADOURO'
    Left = 481
    Top = 1231
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_TIPO_LOGRADOURO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_SIGLA'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Position = 4
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 5
        Name = 'OP_TIPO_LOGRADOURO'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object fdspLogSys: TFDStoredProc
    Connection = dmDBEXMaster.fdcLogSys
    Transaction = dmDBEXMaster.fdtLogSys
    UpdateTransaction = dmDBEXMaster.fdtLogSys
    StoredProcName = 'MAN_TAB_LOG_SYS'
    Left = 480
    Top = 1277
    ParamData = <
      item
        Position = 1
        Name = 'IP_TABELA_MODULO'
        DataType = ftString
        ParamType = ptInput
        Size = 400
      end
      item
        Position = 2
        Name = 'IP_OPERACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NOME_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'IP_COMPUTADOR'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 5
        Name = 'IP_NUMERO_IP'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Position = 6
        Name = 'IP_LOG'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_FOTO'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_LOG_ERRO'
        DataType = ftMemo
        ParamType = ptInput
      end>
  end
end
