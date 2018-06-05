object dmMSPContabil: TdmMSPContabil
  OldCreateOrder = False
  Height = 445
  Width = 966
  object fdspAtividadeEstadual: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    StoredProcName = 'MAN_TAB_ATIVIDADE_ESTADUAL'
    Left = 56
    Top = 8
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_ATIVIDADE_ESTADUAL'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 3
        Name = 'IP_SIGLA_UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 4
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object fdspAtividadeFederal: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    StoredProcName = 'MAN_TAB_ATIVIDADE_FEDERAL'
    Left = 56
    Top = 52
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_ATIV_FEDERAL'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Position = 3
        Name = 'IP_PERC_PART_ESAT'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 200
      end>
  end
  object fdspEstados: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    StoredProcName = 'MAN_TAB_ESTADOS'
    Left = 56
    Top = 97
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
  object fdspPais: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    StoredProcName = 'MAN_TAB_PAIS'
    Left = 56
    Top = 141
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_CODIGO_PAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'IP_NOME_PAIS'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 4
        Name = 'IP_CODIGO_PAIS_TAB_RS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'IP_CODIGO_PAIS_NIS'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdspMunicipios: TFDStoredProc
    Connection = dmDBEXMaster.fdcMaster
    StoredProcName = 'MAN_TAB_MUNICIPIO'
    Left = 56
    Top = 186
    ParamData = <
      item
        Position = 1
        Name = 'IP_OPCAO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'IP_SIGLA_UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Position = 3
        Name = 'IP_CODIGO_MUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'IP_NOME_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 5
        Name = 'IP_ABREVIACAO_NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 6
        Name = 'IP_CODIGO_FISCAL_ESTADUAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'IP_CODIGO_FISCAL_FEDERAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'IP_CODIGO_RAIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'IP_CODIGO_SECUNDARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'IP_MASCARA_INSC_MUNICIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 11
        Name = 'IP_MASCARA_ATIVI_MUNICIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 12
        Name = 'IP_CEP_MUNICIPIO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 13
        Name = 'IP_SIMPLES_NACIONAL'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 14
        Name = 'IP_ALIQUOTA_SIMPLES_NACIONAL'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 15
        Name = 'IP_VALOR_MINIMO_ISS_RETIDO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 16
        Name = 'IP_TAXA_RECOLHIMENTO_GUIA'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 17
        Name = 'IP_SISTEMA_ISS'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 18
        Name = 'IP_VERSAO_SISTEMA_ISS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = 'IP_VALOR_MINIMO_REC_ISS'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 20
        Name = 'IP_SISTEMA_NFSE'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Position = 21
        Name = 'IP_CODIGO_CONFIG_NFSE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 22
        Name = 'IP_CODIGO_CIDADE_GENESIS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 23
        Name = 'IP_CODIGO_QUESTOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
