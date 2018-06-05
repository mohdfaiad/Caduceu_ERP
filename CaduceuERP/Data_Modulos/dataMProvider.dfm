object dmMProvider: TdmMProvider
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 2472
  Width = 1150
  object dspEstados: TDataSetProvider
    DataSet = dmDBEXMaster.fdqEstados
    UpdateMode = upWhereKeyOnly
    Left = 41
    Top = 3
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstados'
    AfterOpen = cdsEstadosAfterOpen
    OnNewRecord = cdsEstadosNewRecord
    Left = 147
    Top = 3
    object cdsEstadosSIGLA: TStringField
      Alignment = taRightJustify
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsEstadosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsEstadosCODIGO_ESTADO_IBGE: TIntegerField
      FieldName = 'CODIGO_ESTADO_IBGE'
      Origin = 'CODIGO_ESTADO_IBGE'
      Required = True
    end
    object cdsEstadosMVA: TCurrencyField
      FieldName = 'MVA'
      Origin = 'MVA'
      Required = True
      DisplayFormat = '#0.00'
      currency = False
    end
    object cdsEstadosICMS_INTERESTADUAL: TBCDField
      FieldName = 'ICMS_INTERESTADUAL'
      Origin = 'ICMS_INTERESTADUAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsEstadosICMS_INTERNO: TBCDField
      FieldName = 'ICMS_INTERNO'
      Origin = 'ICMS_INTERNO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsEstadosFCP: TBCDField
      FieldName = 'FCP'
      Origin = 'FCP'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspCidades: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCidades
    Left = 41
    Top = 49
  end
  object cdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidades'
    AfterOpen = cdsCidadesAfterOpen
    OnNewRecord = cdsCidadesNewRecord
    Left = 147
    Top = 49
    object cdsCidadesCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCidadesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsCidadesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCidadesCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      Required = True
    end
    object cdsCidadesNOME_ESTADO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_ESTADO'
      LookupDataSet = cdsEstados
      LookupKeyFields = 'SIGLA'
      LookupResultField = 'NOME'
      KeyFields = 'ESTADO'
      Size = 40
      Lookup = True
    end
  end
  object dspFilial: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFilial
    Left = 41
    Top = 94
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FILIAL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RAZAOSOCIAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FANTASIA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CNPJ'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'INSCRICAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUMERO'
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DDD'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TELEFONE1'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TELEFONE2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'HTTP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COMPLEMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONTATO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECOCOBRANCA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUMEROCOBRANCA'
        DataType = ftInteger
      end
      item
        Name = 'CEPCOBRANCA'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'BAIRROCOBRANCA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADOCOBRANCA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ENDERECOENTREGA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUMEROENTREGA'
        DataType = ftInteger
      end
      item
        Name = 'CEPENTREGA'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'BAIRROENTREGA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADOENTREGA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CIDADE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CIDADEENTREGA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CIDADECOBRANCA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SUBSTITUTOTRIBUTARIO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'CONTRIBUINTEDOIPI'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_EMPRESA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'REGISTROJUNTACOMERCIAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'METRO_QUADRADO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 3
      end
      item
        Name = 'REGIME_TRIBUTARIO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'INSCRICAO_MUNICIPAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'INSCRICAO_SUFRAMA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CRT'
        DataType = ftInteger
      end
      item
        Name = 'CSOSN'
        DataType = ftInteger
      end
      item
        Name = 'PAIS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'OBSERVACAO_NFSAIDA'
        DataType = ftMemo
      end
      item
        Name = 'NATUREZA_PESSOA_JURIDICA'
        DataType = ftInteger
      end
      item
        Name = 'PERFIL_SPED'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PERCENTUAL_ICMS_SIMPLES_NAC'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'IMPOSTO_SIMPLES_NACIONAL'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'ARQ_FAT'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATUS_FAT'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'UTILIZA_NFCE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NOMECIDADE'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOMEESTADO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CODIGO_MUNICIPIO'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_ESTADO_IBGE'
        Attributes = [faReadonly]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspFilial'
    StoreDefs = True
    OnNewRecord = cdsFilialNewRecord
    Left = 147
    Top = 94
    object cdsFilialFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFilialRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object cdsFilialFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 30
    end
    object cdsFilialCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsFilialINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
    end
    object cdsFilialENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object cdsFilialNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsFilialCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object cdsFilialBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object cdsFilialESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsFilialDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      FixedChar = True
      Size = 5
    end
    object cdsFilialTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Origin = 'TELEFONE1'
      Size = 15
    end
    object cdsFilialTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Origin = 'TELEFONE2'
      Size = 15
    end
    object cdsFilialFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object cdsFilialHTTP: TStringField
      FieldName = 'HTTP'
      Origin = 'HTTP'
      Size = 50
    end
    object cdsFilialEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object cdsFilialCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      FixedChar = True
    end
    object cdsFilialCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      FixedChar = True
    end
    object cdsFilialENDERECOCOBRANCA: TStringField
      FieldName = 'ENDERECOCOBRANCA'
      Origin = 'ENDERECOCOBRANCA'
      Required = True
      Size = 40
    end
    object cdsFilialNUMEROCOBRANCA: TIntegerField
      FieldName = 'NUMEROCOBRANCA'
      Origin = 'NUMEROCOBRANCA'
    end
    object cdsFilialCEPCOBRANCA: TStringField
      FieldName = 'CEPCOBRANCA'
      Origin = 'CEPCOBRANCA'
      Size = 9
    end
    object cdsFilialBAIRROCOBRANCA: TStringField
      FieldName = 'BAIRROCOBRANCA'
      Origin = 'BAIRROCOBRANCA'
      Size = 30
    end
    object cdsFilialESTADOCOBRANCA: TStringField
      FieldName = 'ESTADOCOBRANCA'
      Origin = 'ESTADOCOBRANCA'
      FixedChar = True
      Size = 2
    end
    object cdsFilialENDERECOENTREGA: TStringField
      FieldName = 'ENDERECOENTREGA'
      Origin = 'ENDERECOENTREGA'
      Required = True
      Size = 40
    end
    object cdsFilialNUMEROENTREGA: TIntegerField
      FieldName = 'NUMEROENTREGA'
      Origin = 'NUMEROENTREGA'
    end
    object cdsFilialCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      Origin = 'CEPENTREGA'
      Size = 9
    end
    object cdsFilialBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Origin = 'BAIRROENTREGA'
      Size = 30
    end
    object cdsFilialESTADOENTREGA: TStringField
      FieldName = 'ESTADOENTREGA'
      Origin = 'ESTADOENTREGA'
      FixedChar = True
      Size = 2
    end
    object cdsFilialCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
    end
    object cdsFilialCIDADEENTREGA: TIntegerField
      FieldName = 'CIDADEENTREGA'
      Origin = 'CIDADEENTREGA'
      Required = True
    end
    object cdsFilialCIDADECOBRANCA: TIntegerField
      FieldName = 'CIDADECOBRANCA'
      Origin = 'CIDADECOBRANCA'
      Required = True
    end
    object cdsFilialSUBSTITUTOTRIBUTARIO: TSmallintField
      FieldName = 'SUBSTITUTOTRIBUTARIO'
      Origin = 'SUBSTITUTOTRIBUTARIO'
      Required = True
    end
    object cdsFilialCONTRIBUINTEDOIPI: TSmallintField
      FieldName = 'CONTRIBUINTEDOIPI'
      Origin = 'CONTRIBUINTEDOIPI'
      Required = True
    end
    object cdsFilialTIPO_EMPRESA: TSmallintField
      FieldName = 'TIPO_EMPRESA'
      Origin = 'TIPO_EMPRESA'
      Required = True
    end
    object cdsFilialREGISTROJUNTACOMERCIAL: TStringField
      FieldName = 'REGISTROJUNTACOMERCIAL'
      Origin = 'REGISTROJUNTACOMERCIAL'
    end
    object cdsFilialMETRO_QUADRADO: TBCDField
      FieldName = 'METRO_QUADRADO'
      Origin = 'METRO_QUADRADO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsFilialREGIME_TRIBUTARIO: TSmallintField
      FieldName = 'REGIME_TRIBUTARIO'
      Origin = 'REGIME_TRIBUTARIO'
      Required = True
    end
    object cdsFilialINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'INSCRICAO_MUNICIPAL'
    end
    object cdsFilialINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Origin = 'INSCRICAO_SUFRAMA'
    end
    object cdsFilialCRT: TIntegerField
      FieldName = 'CRT'
      Origin = 'CRT'
    end
    object cdsFilialCSOSN: TIntegerField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
    end
    object cdsFilialPAIS: TIntegerField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
    end
    object cdsFilialOBSERVACAO_NFSAIDA: TMemoField
      FieldName = 'OBSERVACAO_NFSAIDA'
      Origin = 'OBSERVACAO_NFSAIDA'
      BlobType = ftMemo
    end
    object cdsFilialNATUREZA_PESSOA_JURIDICA: TIntegerField
      FieldName = 'NATUREZA_PESSOA_JURIDICA'
      Origin = 'NATUREZA_PESSOA_JURIDICA'
    end
    object cdsFilialPERFIL_SPED: TSmallintField
      FieldName = 'PERFIL_SPED'
      Origin = 'PERFIL_SPED'
      Required = True
    end
    object cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC: TBCDField
      FieldName = 'PERCENTUAL_ICMS_SIMPLES_NAC'
      Origin = 'PERCENTUAL_ICMS_SIMPLES_NAC'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsFilialIMPOSTO_SIMPLES_NACIONAL: TBCDField
      FieldName = 'IMPOSTO_SIMPLES_NACIONAL'
      Origin = 'IMPOSTO_SIMPLES_NACIONAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsFilialNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsFilialNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsFilialCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsFilialCODIGO_ESTADO_IBGE: TIntegerField
      FieldName = 'CODIGO_ESTADO_IBGE'
      Origin = 'CODIGO_ESTADO_IBGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsFilialARQ_FAT: TStringField
      FieldName = 'ARQ_FAT'
      Origin = 'ARQ_FAT'
      Size = 100
    end
    object cdsFilialSTATUS_FAT: TSmallintField
      FieldName = 'STATUS_FAT'
      Origin = 'STATUS_FAT'
      Required = True
    end
    object cdsFilialUTILIZA_NFCE: TSmallintField
      FieldName = 'UTILIZA_NFCE'
      Required = True
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = dmDBEXMaster.fdqUsuarios
    Left = 41
    Top = 140
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    OnNewRecord = cdsUsuariosNewRecord
    Left = 147
    Top = 140
    object cdsUsuariosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsuariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Required = True
    end
    object cdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 10
    end
    object cdsUsuariosDATA: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object cdsUsuariosSUPER_USUARIO: TSmallintField
      FieldName = 'SUPER_USUARIO'
      Origin = 'SUPER_USUARIO'
      Required = True
    end
    object cdsUsuariosATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsUsuariosAUTORIZA_FAT: TSmallintField
      FieldName = 'AUTORIZA_FAT'
      Origin = 'AUTORIZA_FAT'
      Required = True
    end
  end
  object dspConfiguracoes: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConfiguracoes
    Left = 41
    Top = 186
  end
  object cdsConfiguracoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfiguracoes'
    Left = 147
    Top = 186
    object cdsConfiguracoesCONFIGURACAO: TIntegerField
      FieldName = 'CONFIGURACAO'
      Origin = 'CONFIGURACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConfiguracoesPERCENTUALLIMITEDECREDITO: TBCDField
      FieldName = 'PERCENTUALLIMITEDECREDITO'
      Origin = 'PERCENTUALLIMITEDECREDITO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesMULTA: TBCDField
      FieldName = 'MULTA'
      Origin = 'MULTA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsConfiguracoesMORADIARIA: TBCDField
      FieldName = 'MORADIARIA'
      Origin = 'MORADIARIA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsConfiguracoesDPR: TDateField
      FieldName = 'DPR'
      Origin = 'DPR'
    end
    object cdsConfiguracoesFLAGDPR: TSmallintField
      FieldName = 'FLAGDPR'
      Origin = 'FLAGDPR'
      Required = True
    end
    object cdsConfiguracoesTIPOMULTA: TSmallintField
      FieldName = 'TIPOMULTA'
      Origin = 'TIPOMULTA'
      Required = True
    end
    object cdsConfiguracoesTIPOMORADIARIA: TSmallintField
      FieldName = 'TIPOMORADIARIA'
      Origin = 'TIPOMORADIARIA'
      Required = True
    end
    object cdsConfiguracoesMODELOBALANCA: TSmallintField
      FieldName = 'MODELOBALANCA'
      Origin = 'MODELOBALANCA'
      Required = True
    end
    object cdsConfiguracoesIMPOSTOSFEDERAIS: TBCDField
      FieldName = 'IMPOSTOSFEDERAIS'
      Origin = 'IMPOSTOSFEDERAIS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesCUSTOOPERACIONAL: TBCDField
      FieldName = 'CUSTOOPERACIONAL'
      Origin = 'CUSTOOPERACIONAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesTIPOCLD: TSmallintField
      FieldName = 'TIPOCLD'
      Origin = 'TIPOCLD'
      Required = True
    end
    object cdsConfiguracoesMODELOPDV: TSmallintField
      FieldName = 'MODELOPDV'
      Origin = 'MODELOPDV'
      Required = True
    end
    object cdsConfiguracoesARQUIVODENOTAFISCAL: TStringField
      FieldName = 'ARQUIVODENOTAFISCAL'
      Origin = 'ARQUIVODENOTAFISCAL'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEVENDA: TStringField
      FieldName = 'ARQUIVODEVENDA'
      Origin = 'ARQUIVODEVENDA'
      Required = True
    end
    object cdsConfiguracoesARQUIVODECAIXA: TStringField
      FieldName = 'ARQUIVODECAIXA'
      Origin = 'ARQUIVODECAIXA'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEFORMAPAGAMENTO: TStringField
      FieldName = 'ARQUIVODEFORMAPAGAMENTO'
      Origin = 'ARQUIVODEFORMAPAGAMENTO'
      Required = True
    end
    object cdsConfiguracoesARQUIVODESECOES: TStringField
      FieldName = 'ARQUIVODESECOES'
      Origin = 'ARQUIVODESECOES'
      Required = True
    end
    object cdsConfiguracoesARQUIVODERECEBIMENTOS: TStringField
      FieldName = 'ARQUIVODERECEBIMENTOS'
      Origin = 'ARQUIVODERECEBIMENTOS'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEVENDADECLIENTE: TStringField
      FieldName = 'ARQUIVODEVENDADECLIENTE'
      Origin = 'ARQUIVODEVENDADECLIENTE'
      Required = True
    end
    object cdsConfiguracoesARQUIVODECHEQUES: TStringField
      FieldName = 'ARQUIVODECHEQUES'
      Origin = 'ARQUIVODECHEQUES'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEPRODUTOSGERAL: TStringField
      FieldName = 'ARQUIVODEPRODUTOSGERAL'
      Origin = 'ARQUIVODEPRODUTOSGERAL'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEPRODUTOSALTERADOS: TStringField
      FieldName = 'ARQUIVODEPRODUTOSALTERADOS'
      Origin = 'ARQUIVODEPRODUTOSALTERADOS'
      Required = True
    end
    object cdsConfiguracoesARQUIVODECLIENTES: TStringField
      FieldName = 'ARQUIVODECLIENTES'
      Origin = 'ARQUIVODECLIENTES'
      Required = True
    end
    object cdsConfiguracoesQUANTIDADEDEPDV: TSmallintField
      FieldName = 'QUANTIDADEDEPDV'
      Origin = 'QUANTIDADEDEPDV'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEFORNECEDOR: TStringField
      FieldName = 'ARQUIVODEFORNECEDOR'
      Origin = 'ARQUIVODEFORNECEDOR'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEMAPARESUMO: TStringField
      FieldName = 'ARQUIVODEMAPARESUMO'
      Origin = 'ARQUIVODEMAPARESUMO'
      Required = True
    end
    object cdsConfiguracoesARQUIVODECUPOMDIA: TStringField
      FieldName = 'ARQUIVODECUPOMDIA'
      Origin = 'ARQUIVODECUPOMDIA'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEALIQUOTAS: TStringField
      FieldName = 'ARQUIVODEALIQUOTAS'
      Origin = 'ARQUIVODEALIQUOTAS'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEBANCOS: TStringField
      FieldName = 'ARQUIVODEBANCOS'
      Origin = 'ARQUIVODEBANCOS'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEMENSAGENS: TStringField
      FieldName = 'ARQUIVODEMENSAGENS'
      Origin = 'ARQUIVODEMENSAGENS'
      Required = True
    end
    object cdsConfiguracoesQUANTIDADEDETECLAS: TSmallintField
      FieldName = 'QUANTIDADEDETECLAS'
      Origin = 'QUANTIDADEDETECLAS'
      Required = True
    end
    object cdsConfiguracoesARQUIVODEPRODUTOSPARABALANCA: TStringField
      FieldName = 'ARQUIVODEPRODUTOSPARABALANCA'
      Origin = 'ARQUIVODEPRODUTOSPARABALANCA'
    end
    object cdsConfiguracoesARQUIVODESETORPARABALANCA: TStringField
      FieldName = 'ARQUIVODESETORPARABALANCA'
      Origin = 'ARQUIVODESETORPARABALANCA'
    end
    object cdsConfiguracoesARQUIVODERECEITASPARABALANCA: TStringField
      FieldName = 'ARQUIVODERECEITASPARABALANCA'
      Origin = 'ARQUIVODERECEITASPARABALANCA'
    end
    object cdsConfiguracoesARQUIVODETECLADOPARABALANCA: TStringField
      FieldName = 'ARQUIVODETECLADOPARABALANCA'
      Origin = 'ARQUIVODETECLADOPARABALANCA'
    end
    object cdsConfiguracoesARQUIVODEMENSAGENSPARABALANCA: TStringField
      FieldName = 'ARQUIVODEMENSAGENSPARABALANCA'
      Origin = 'ARQUIVODEMENSAGENSPARABALANCA'
    end
    object cdsConfiguracoesARQUIVODETEXTOGENPARABALANCA: TStringField
      FieldName = 'ARQUIVODETEXTOGENPARABALANCA'
      Origin = 'ARQUIVODETEXTOGENPARABALANCA'
    end
    object cdsConfiguracoesARQUIVODEINFORMACAONUTRICIONAL: TStringField
      FieldName = 'ARQUIVODEINFORMACAONUTRICIONAL'
      Origin = 'ARQUIVODEINFORMACAONUTRICIONAL'
    end
    object cdsConfiguracoesFATURAMENTO: TBCDField
      FieldName = 'FATURAMENTO'
      Origin = 'FATURAMENTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesPROLABORE: TBCDField
      FieldName = 'PROLABORE'
      Origin = 'PROLABORE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesENCARGOSPROLABORE: TBCDField
      FieldName = 'ENCARGOSPROLABORE'
      Origin = 'ENCARGOSPROLABORE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesSALARIOS: TBCDField
      FieldName = 'SALARIOS'
      Origin = 'SALARIOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesENCARGOSSALARIOS: TBCDField
      FieldName = 'ENCARGOSSALARIOS'
      Origin = 'ENCARGOSSALARIOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesSEGUROS: TBCDField
      FieldName = 'SEGUROS'
      Origin = 'SEGUROS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesDESPESASBANCARIAS: TBCDField
      FieldName = 'DESPESASBANCARIAS'
      Origin = 'DESPESASBANCARIAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesJUROS: TBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesHONORARIOSCONTABEIS: TBCDField
      FieldName = 'HONORARIOSCONTABEIS'
      Origin = 'HONORARIOSCONTABEIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesMATERIALDEEXPEDIENTE: TBCDField
      FieldName = 'MATERIALDEEXPEDIENTE'
      Origin = 'MATERIALDEEXPEDIENTE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesALUGUEL: TBCDField
      FieldName = 'ALUGUEL'
      Origin = 'ALUGUEL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesDESPESASDEVIAGEM: TBCDField
      FieldName = 'DESPESASDEVIAGEM'
      Origin = 'DESPESASDEVIAGEM'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesAGUA: TBCDField
      FieldName = 'AGUA'
      Origin = 'AGUA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesENERGIA: TBCDField
      FieldName = 'ENERGIA'
      Origin = 'ENERGIA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesTELEFONE: TBCDField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesPROPAGANDA: TBCDField
      FieldName = 'PROPAGANDA'
      Origin = 'PROPAGANDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesDEPRECIACAO: TBCDField
      FieldName = 'DEPRECIACAO'
      Origin = 'DEPRECIACAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesMATERIALDELIMPEZA: TBCDField
      FieldName = 'MATERIALDELIMPEZA'
      Origin = 'MATERIALDELIMPEZA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesMANUTENCAO: TBCDField
      FieldName = 'MANUTENCAO'
      Origin = 'MANUTENCAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesOUTROS: TBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesVENDAAPRAZO: TBCDField
      FieldName = 'VENDAAPRAZO'
      Origin = 'VENDAAPRAZO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesTIPOBLOQUETO: TSmallintField
      FieldName = 'TIPOBLOQUETO'
      Origin = 'TIPOBLOQUETO'
      Required = True
    end
    object cdsConfiguracoesTIPODOCUMENTOCARTEIRA: TSmallintField
      FieldName = 'TIPODOCUMENTOCARTEIRA'
      Origin = 'TIPODOCUMENTOCARTEIRA'
      Required = True
    end
    object cdsConfiguracoesMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsConfiguracoesSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object cdsConfiguracoesULTIMANOTAFISCALIMPRESSA: TIntegerField
      FieldName = 'ULTIMANOTAFISCALIMPRESSA'
      Origin = 'ULTIMANOTAFISCALIMPRESSA'
    end
    object cdsConfiguracoesEMAILSUPORTE: TStringField
      FieldName = 'EMAILSUPORTE'
      Origin = 'EMAILSUPORTE'
      Size = 100
    end
    object cdsConfiguracoesDDDSUPORTE: TStringField
      FieldName = 'DDDSUPORTE'
      Origin = 'DDDSUPORTE'
      Size = 5
    end
    object cdsConfiguracoesTELEFONESUPORTE1: TStringField
      FieldName = 'TELEFONESUPORTE1'
      Origin = 'TELEFONESUPORTE1'
      Size = 15
    end
    object cdsConfiguracoesTELEFONESUPORTE2: TStringField
      FieldName = 'TELEFONESUPORTE2'
      Origin = 'TELEFONESUPORTE2'
      Size = 15
    end
    object cdsConfiguracoesTELEFONESUPORTE3: TStringField
      FieldName = 'TELEFONESUPORTE3'
      Origin = 'TELEFONESUPORTE3'
      Size = 15
    end
    object cdsConfiguracoesSUPORTECONTATO: TStringField
      FieldName = 'SUPORTECONTATO'
      Origin = 'SUPORTECONTATO'
      Size = 30
    end
    object cdsConfiguracoesINTERVALOENTREBACKUP: TSmallintField
      FieldName = 'INTERVALOENTREBACKUP'
      Origin = 'INTERVALOENTREBACKUP'
      Required = True
    end
    object cdsConfiguracoesMOSTRARTOTALCRETELA: TSmallintField
      FieldName = 'MOSTRARTOTALCRETELA'
      Origin = 'MOSTRARTOTALCRETELA'
      Required = True
    end
    object cdsConfiguracoesMOSTRARTOTALCPATELA: TSmallintField
      FieldName = 'MOSTRARTOTALCPATELA'
      Origin = 'MOSTRARTOTALCPATELA'
      Required = True
    end
    object cdsConfiguracoesUNIFICARPRECODEVENDA: TIntegerField
      FieldName = 'UNIFICARPRECODEVENDA'
      Origin = 'UNIFICARPRECODEVENDA'
      Required = True
    end
    object cdsConfiguracoesDDP: TStringField
      FieldName = 'DDP'
      Origin = 'DDP'
      Size = 10
    end
    object cdsConfiguracoesRELACIONAR_PRODUTO_CLIENTE: TSmallintField
      FieldName = 'RELACIONAR_PRODUTO_CLIENTE'
      Origin = 'RELACIONAR_PRODUTO_CLIENTE'
      Required = True
    end
    object cdsConfiguracoesCONTA_PADRAO_FLUXO_CX: TStringField
      FieldName = 'CONTA_PADRAO_FLUXO_CX'
      Origin = 'CONTA_PADRAO_FLUXO_CX'
      Size = 15
    end
    object cdsConfiguracoesATUALIZAR_CUSTOS_SIMILAR: TSmallintField
      FieldName = 'ATUALIZAR_CUSTOS_SIMILAR'
      Origin = 'ATUALIZAR_CUSTOS_SIMILAR'
      Required = True
    end
    object cdsConfiguracoesVER_SIMILAR_PARA_ALTERAR: TSmallintField
      FieldName = 'VER_SIMILAR_PARA_ALTERAR'
      Origin = 'VER_SIMILAR_PARA_ALTERAR'
      Required = True
    end
    object cdsConfiguracoesTOTALIZAR_CFOP: TSmallintField
      FieldName = 'TOTALIZAR_CFOP'
      Origin = 'TOTALIZAR_CFOP'
      Required = True
    end
    object cdsConfiguracoesARQUIVOIMEDITOPRODUTOS: TStringField
      FieldName = 'ARQUIVOIMEDITOPRODUTOS'
      Origin = 'ARQUIVOIMEDITOPRODUTOS'
    end
    object cdsConfiguracoesARQUIVOPRODUTOCESTABASICA: TStringField
      FieldName = 'ARQUIVOPRODUTOCESTABASICA'
      Origin = 'ARQUIVOPRODUTOCESTABASICA'
    end
    object cdsConfiguracoesARQUIVOLISTANEGRA: TStringField
      FieldName = 'ARQUIVOLISTANEGRA'
      Origin = 'ARQUIVOLISTANEGRA'
    end
    object cdsConfiguracoesARQUIVOCUPOM: TStringField
      FieldName = 'ARQUIVOCUPOM'
      Origin = 'ARQUIVOCUPOM'
    end
    object cdsConfiguracoesARQUIVOITEMCUPOM: TStringField
      FieldName = 'ARQUIVOITEMCUPOM'
      Origin = 'ARQUIVOITEMCUPOM'
    end
    object cdsConfiguracoesARQUIVODEINVENTARIO: TStringField
      FieldName = 'ARQUIVODEINVENTARIO'
      Origin = 'ARQUIVODEINVENTARIO'
    end
    object cdsConfiguracoesARQUIVODETEF: TStringField
      FieldName = 'ARQUIVODETEF'
      Origin = 'ARQUIVODETEF'
    end
    object cdsConfiguracoesARQUIVODEPEDIDO: TStringField
      FieldName = 'ARQUIVODEPEDIDO'
      Origin = 'ARQUIVODEPEDIDO'
    end
    object cdsConfiguracoesPERCENTUAL_PIS: TCurrencyField
      FieldName = 'PERCENTUAL_PIS'
      Origin = 'PERCENTUAL_PIS'
      Required = True
    end
    object cdsConfiguracoesPERCENTUAL_COFINS: TCurrencyField
      FieldName = 'PERCENTUAL_COFINS'
      Origin = 'PERCENTUAL_COFINS'
      Required = True
    end
    object cdsConfiguracoesPERCENTUAL_CSLL: TCurrencyField
      FieldName = 'PERCENTUAL_CSLL'
      Origin = 'PERCENTUAL_CSLL'
      Required = True
    end
    object cdsConfiguracoesPERCENTUAL_IRRF: TCurrencyField
      FieldName = 'PERCENTUAL_IRRF'
      Origin = 'PERCENTUAL_IRRF'
      Required = True
    end
    object cdsConfiguracoesPERCENTUAL_INSS: TCurrencyField
      FieldName = 'PERCENTUAL_INSS'
      Origin = 'PERCENTUAL_INSS'
      Required = True
    end
    object cdsConfiguracoesPERCENTUAL_ISSQN: TCurrencyField
      FieldName = 'PERCENTUAL_ISSQN'
      Origin = 'PERCENTUAL_ISSQN'
      Required = True
    end
    object cdsConfiguracoesTIPO_ESTOQUE_NF_ENTREDA: TSmallintField
      FieldName = 'TIPO_ESTOQUE_NF_ENTREDA'
      Origin = 'TIPO_ESTOQUE_NF_ENTREDA'
      Required = True
    end
    object cdsConfiguracoesTIPO_ESTOQUE_NF_SAIDA: TSmallintField
      FieldName = 'TIPO_ESTOQUE_NF_SAIDA'
      Origin = 'TIPO_ESTOQUE_NF_SAIDA'
      Required = True
    end
    object cdsConfiguracoesPDV_TRUNCA_ARREDONDA: TStringField
      FieldName = 'PDV_TRUNCA_ARREDONDA'
      Origin = 'PDV_TRUNCA_ARREDONDA'
      Required = True
      Size = 1
    end
    object cdsConfiguracoesALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesMODELO_TERMINAL_CONSULTA: TSmallintField
      FieldName = 'MODELO_TERMINAL_CONSULTA'
      Origin = 'MODELO_TERMINAL_CONSULTA'
      Required = True
    end
    object cdsConfiguracoesDESCONTO_PERSONALIZADO: TBCDField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesPATH_ATUALIZACAO: TStringField
      FieldName = 'PATH_ATUALIZACAO'
      Origin = 'PATH_ATUALIZACAO'
      Size = 300
    end
    object cdsConfiguracoesATIVAR_RENTABILIDADE: TSmallintField
      FieldName = 'ATIVAR_RENTABILIDADE'
      Origin = 'ATIVAR_RENTABILIDADE'
    end
    object cdsConfiguracoesSERVIDOR_SMTP: TStringField
      FieldName = 'SERVIDOR_SMTP'
      Origin = 'SERVIDOR_SMTP'
      Size = 300
    end
    object cdsConfiguracoesPORTA_SMTP: TStringField
      FieldName = 'PORTA_SMTP'
      Origin = 'PORTA_SMTP'
      Size = 10
    end
    object cdsConfiguracoesUSUARIO_SMTP: TStringField
      FieldName = 'USUARIO_SMTP'
      Origin = 'USUARIO_SMTP'
      Size = 300
    end
    object cdsConfiguracoesPASSWORD_SMTP: TStringField
      FieldName = 'PASSWORD_SMTP'
      Origin = 'PASSWORD_SMTP'
      Size = 30
    end
    object cdsConfiguracoesUSAR_SSL_SMTP: TSmallintField
      FieldName = 'USAR_SSL_SMTP'
      Origin = 'USAR_SSL_SMTP'
    end
    object cdsConfiguracoesAUTENTICA_SMTP: TSmallintField
      FieldName = 'AUTENTICA_SMTP'
      Origin = 'AUTENTICA_SMTP'
    end
    object cdsConfiguracoesWS_NFE: TStringField
      FieldName = 'WS_NFE'
      Origin = 'WS_NFE'
      Size = 10
    end
    object cdsConfiguracoesAMBIENTE_NFE: TSmallintField
      FieldName = 'AMBIENTE_NFE'
      Origin = 'AMBIENTE_NFE'
    end
    object cdsConfiguracoesVISUALIZAR_MSG_NFE: TSmallintField
      FieldName = 'VISUALIZAR_MSG_NFE'
      Origin = 'VISUALIZAR_MSG_NFE'
    end
    object cdsConfiguracoesORIENTACAO_IMP_DANFE: TSmallintField
      FieldName = 'ORIENTACAO_IMP_DANFE'
      Origin = 'ORIENTACAO_IMP_DANFE'
    end
    object cdsConfiguracoesFORMA_EMSSAO_DANFE: TSmallintField
      FieldName = 'FORMA_EMSSAO_DANFE'
      Origin = 'FORMA_EMSSAO_DANFE'
    end
    object cdsConfiguracoesLOGOMARCA_DANFE: TStringField
      FieldName = 'LOGOMARCA_DANFE'
      Origin = 'LOGOMARCA_DANFE'
      Size = 400
    end
    object cdsConfiguracoesCODIGO_PAIS_DANFE: TIntegerField
      FieldName = 'CODIGO_PAIS_DANFE'
      Origin = 'CODIGO_PAIS_DANFE'
    end
    object cdsConfiguracoesSALVAR_DANFE: TSmallintField
      FieldName = 'SALVAR_DANFE'
      Origin = 'SALVAR_DANFE'
    end
    object cdsConfiguracoesPATH_SALVAR_DANFE: TStringField
      FieldName = 'PATH_SALVAR_DANFE'
      Origin = 'PATH_SALVAR_DANFE'
      Size = 400
    end
    object cdsConfiguracoesPATH_SCHEMAS_NFE: TStringField
      FieldName = 'PATH_SCHEMAS_NFE'
      Origin = 'PATH_SCHEMAS_NFE'
      Size = 400
    end
    object cdsConfiguracoesPATH_SALVAR_XML: TStringField
      FieldName = 'PATH_SALVAR_XML'
      Origin = 'PATH_SALVAR_XML'
      Size = 400
    end
    object cdsConfiguracoesPATH_SALVAR_PDF: TStringField
      FieldName = 'PATH_SALVAR_PDF'
      Origin = 'PATH_SALVAR_PDF'
      Size = 400
    end
    object cdsConfiguracoesCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = 'CPF_CONTADOR'
    end
    object cdsConfiguracoesCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = 'CRC_CONTADOR'
    end
    object cdsConfiguracoesCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = 'CNPJ_CONTADOR'
    end
    object cdsConfiguracoesCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = 'CEP_CONTADOR'
      Size = 10
    end
    object cdsConfiguracoesNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = 'NUMERO_CONTADOR'
      Size = 10
    end
    object cdsConfiguracoesDDD_CONTADOR: TStringField
      FieldName = 'DDD_CONTADOR'
      Origin = 'DDD_CONTADOR'
      Size = 4
    end
    object cdsConfiguracoesTELEFONE_CONTADOR: TStringField
      FieldName = 'TELEFONE_CONTADOR'
      Origin = 'TELEFONE_CONTADOR'
      Size = 15
    end
    object cdsConfiguracoesFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = 'FAX_CONTADOR'
      Size = 15
    end
    object cdsConfiguracoesUSAR_PRECO_PROMOCAO_PV2: TSmallintField
      FieldName = 'USAR_PRECO_PROMOCAO_PV2'
      Origin = 'USAR_PRECO_PROMOCAO_PV2'
      Required = True
    end
    object cdsConfiguracoesUTILIZAR_SIMILAR_PRECO: TSmallintField
      FieldName = 'UTILIZAR_SIMILAR_PRECO'
      Origin = 'UTILIZAR_SIMILAR_PRECO'
    end
    object cdsConfiguracoesINTERVALO_ENTRE_BACKUP: TIntegerField
      FieldName = 'INTERVALO_ENTRE_BACKUP'
      Origin = 'INTERVALO_ENTRE_BACKUP'
    end
    object cdsConfiguracoesPATH_BACKUP_1: TStringField
      FieldName = 'PATH_BACKUP_1'
      Origin = 'PATH_BACKUP_1'
      Size = 400
    end
    object cdsConfiguracoesPATH_BACKUP_2: TStringField
      FieldName = 'PATH_BACKUP_2'
      Origin = 'PATH_BACKUP_2'
      Size = 400
    end
    object cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV: TSmallintField
      FieldName = 'UTILIZAR_DV_EXPORTACAO_PDV'
      Origin = 'UTILIZAR_DV_EXPORTACAO_PDV'
    end
    object cdsConfiguracoesPATH_EXPORTACAO_PDV: TStringField
      FieldName = 'PATH_EXPORTACAO_PDV'
      Origin = 'PATH_EXPORTACAO_PDV'
      Size = 400
    end
    object cdsConfiguracoesPATH_IMPORTACAO_PDV: TStringField
      FieldName = 'PATH_IMPORTACAO_PDV'
      Origin = 'PATH_IMPORTACAO_PDV'
      Size = 400
    end
    object cdsConfiguracoesPATH_EXPORTACAO_BALANCA: TStringField
      FieldName = 'PATH_EXPORTACAO_BALANCA'
      Origin = 'PATH_EXPORTACAO_BALANCA'
      Size = 400
    end
    object cdsConfiguracoesPATH_TERMINAL_CONSULTA: TStringField
      FieldName = 'PATH_TERMINAL_CONSULTA'
      Origin = 'PATH_TERMINAL_CONSULTA'
      Size = 400
    end
    object cdsConfiguracoesUTILIZAR_PRECO_ATACADO: TSmallintField
      FieldName = 'UTILIZAR_PRECO_ATACADO'
      Origin = 'UTILIZAR_PRECO_ATACADO'
    end
    object cdsConfiguracoesUTILIZACOBRANCAMAGNETICA: TSmallintField
      FieldName = 'UTILIZACOBRANCAMAGNETICA'
      Origin = 'UTILIZACOBRANCAMAGNETICA'
      Required = True
    end
    object cdsConfiguracoesUSAR_COBRANCA_REGISTRADA: TSmallintField
      FieldName = 'USAR_COBRANCA_REGISTRADA'
      Origin = 'USAR_COBRANCA_REGISTRADA'
    end
    object cdsConfiguracoesCOBRANCA_IMP_BANCO: TSmallintField
      FieldName = 'COBRANCA_IMP_BANCO'
      Origin = 'COBRANCA_IMP_BANCO'
    end
    object cdsConfiguracoesURL_IBPT: TStringField
      FieldName = 'URL_IBPT'
      Origin = 'URL_IBPT'
      Size = 500
    end
    object cdsConfiguracoesNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = 'NOME_CONTADOR'
      Size = 40
    end
    object cdsConfiguracoesENDERECO_CONTADOR: TStringField
      FieldName = 'ENDERECO_CONTADOR'
      Origin = 'ENDERECO_CONTADOR'
      Size = 40
    end
    object cdsConfiguracoesCOMPLEMENTO_CONTADOR: TStringField
      FieldName = 'COMPLEMENTO_CONTADOR'
      Origin = 'COMPLEMENTO_CONTADOR'
    end
    object cdsConfiguracoesBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = 'BAIRRO_CONTADOR'
      Size = 30
    end
    object cdsConfiguracoesCIDADE_CONTADOR: TIntegerField
      FieldName = 'CIDADE_CONTADOR'
      Origin = 'CIDADE_CONTADOR'
    end
    object cdsConfiguracoesPATH_BANCO_DE_DADOS: TStringField
      FieldName = 'PATH_BANCO_DE_DADOS'
      Origin = 'PATH_BANCO_DE_DADOS'
      Size = 400
    end
    object cdsConfiguracoesREPOSITORIO_XML_ENTRADA: TStringField
      FieldName = 'REPOSITORIO_XML_ENTRADA'
      Origin = 'REPOSITORIO_XML_ENTRADA'
      Size = 400
    end
    object cdsConfiguracoesQUANTIDADE_TERMINAL_CONSULTA: TSmallintField
      FieldName = 'QUANTIDADE_TERMINAL_CONSULTA'
      Origin = 'QUANTIDADE_TERMINAL_CONSULTA'
    end
    object cdsConfiguracoesENDERECO_WS_GENESIS: TStringField
      FieldName = 'ENDERECO_WS_GENESIS'
      Origin = 'ENDERECO_WS_GENESIS'
      Size = 400
    end
    object cdsConfiguracoesPORTA_WS_GENESIS: TStringField
      FieldName = 'PORTA_WS_GENESIS'
      Origin = 'PORTA_WS_GENESIS'
      Size = 10
    end
    object cdsConfiguracoesCOPIAR_XML_ENTRADA_REPOSITORIO: TSmallintField
      FieldName = 'COPIAR_XML_ENTRADA_REPOSITORIO'
      Origin = 'COPIAR_XML_ENTRADA_REPOSITORIO'
    end
    object cdsConfiguracoesIMPORTAR_PARCELAS_NFE: TSmallintField
      FieldName = 'IMPORTAR_PARCELAS_NFE'
      Origin = 'IMPORTAR_PARCELAS_NFE'
    end
    object cdsConfiguracoesUSAR_CAMPO_COMPLE_PESQUISA_NFE: TSmallintField
      FieldName = 'USAR_CAMPO_COMPLE_PESQUISA_NFE'
      Origin = 'USAR_CAMPO_COMPLE_PESQUISA_NFE'
    end
    object cdsConfiguracoesENVIAR_XML_CONTABILIDADE: TSmallintField
      FieldName = 'ENVIAR_XML_CONTABILIDADE'
      Origin = 'ENVIAR_XML_CONTABILIDADE'
    end
    object cdsConfiguracoesEMAIL_CONTADOR: TStringField
      FieldName = 'EMAIL_CONTADOR'
      Origin = 'EMAIL_CONTADOR'
      Size = 200
    end
    object cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO: TSmallintField
      FieldName = 'OC_ATUALIZA_ALMOXARIFADO'
      Origin = 'OC_ATUALIZA_ALMOXARIFADO'
      Required = True
    end
    object cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE: TSmallintField
      FieldName = 'INTEGRAR_IMPORTACAO_VENDA_CRE'
      Origin = 'INTEGRAR_IMPORTACAO_VENDA_CRE'
      Required = True
    end
    object cdsConfiguracoesINTEGRAR_BALCAO_ZEUS: TSmallintField
      FieldName = 'INTEGRAR_BALCAO_ZEUS'
      Origin = 'INTEGRAR_BALCAO_ZEUS'
      Required = True
    end
    object cdsConfiguracoesUSAR_NOME_PASTA_IMP_CUPOM_NFS: TSmallintField
      FieldName = 'USAR_NOME_PASTA_IMP_CUPOM_NFS'
      Origin = 'USAR_NOME_PASTA_IMP_CUPOM_NFS'
      Required = True
    end
    object cdsConfiguracoesQUANTIDADEDECOPIASDEPEDIDO: TSmallintField
      FieldName = 'QUANTIDADEDECOPIASDEPEDIDO'
      Origin = 'QUANTIDADEDECOPIASDEPEDIDO'
      Required = True
      MaxValue = 5
      MinValue = 1
    end
    object cdsConfiguracoesMODELO_COMUNICACAO_SERVICO: TStringField
      FieldName = 'MODELO_COMUNICACAO_SERVICO'
      Origin = 'MODELO_COMUNICACAO_SERVICO'
      Size = 100
    end
    object cdsConfiguracoesATUALIZAR_FOR_PRO_PELA_NFE: TSmallintField
      FieldName = 'ATUALIZAR_FOR_PRO_PELA_NFE'
      Origin = 'ATUALIZAR_FOR_PRO_PELA_NFE'
      Required = True
    end
    object cdsConfiguracoesPERMITE_VENDA_ABAIXO_CUSTOLIQ: TSmallintField
      FieldName = 'PERMITE_VENDA_ABAIXO_CUSTOLIQ'
      Origin = 'PERMITE_VENDA_ABAIXO_CUSTOLIQ'
      Required = True
    end
    object cdsConfiguracoesDESCONTO_MAXIMO_VENDA: TBCDField
      FieldName = 'DESCONTO_MAXIMO_VENDA'
      Origin = 'DESCONTO_MAXIMO_VENDA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsConfiguracoesMENSAGEM_FINANCEIRA: TMemoField
      FieldName = 'MENSAGEM_FINANCEIRA'
      Origin = 'MENSAGEM_FINANCEIRA'
      BlobType = ftMemo
    end
    object cdsConfiguracoesVALIDADE_ORCAMENTO: TSmallintField
      FieldName = 'VALIDADE_ORCAMENTO'
      Origin = 'VALIDADE_ORCAMENTO'
      Required = True
    end
    object cdsConfiguracoesMENSAGEM_ENTREGA: TStringField
      FieldName = 'MENSAGEM_ENTREGA'
      Origin = 'MENSAGEM_ENTREGA'
      Size = 300
    end
    object cdsConfiguracoesVERSAO_XML_NFE: TStringField
      FieldName = 'VERSAO_XML_NFE'
      Origin = 'VERSAO_XML_NFE'
      Size = 10
    end
    object cdsConfiguracoesSENHA_USUARIO_SMTP: TStringField
      FieldName = 'SENHA_USUARIO_SMTP'
      Origin = 'SENHA_USUARIO_SMTP'
      Size = 100
    end
    object cdsConfiguracoesDESCRICAO_CF_CONV_25_2016: TSmallintField
      FieldName = 'DESCRICAO_CF_CONV_25_2016'
      Required = True
    end
    object cdsConfiguracoesHABILITA_CONTAB_DOWNLOAD_XML: TSmallintField
      FieldName = 'HABILITA_CONTAB_DOWNLOAD_XML'
      Required = True
    end
    object cdsConfiguracoesATUALIZAR_NCM_PELA_ENTRADA: TSmallintField
      FieldName = 'ATUALIZAR_NCM_PELA_ENTRADA'
      Required = True
    end
    object cdsConfiguracoesPATH_LIVE_UPDATE: TStringField
      FieldName = 'PATH_LIVE_UPDATE'
      Size = 1024
    end
    object cdsConfiguracoesBUSCA_CEP: TIntegerField
      FieldName = 'BUSCA_CEP'
    end
    object cdsConfiguracoesCONSULTAR_CNPJ_CPF_RFB_SEFAZ: TSmallintField
      FieldName = 'CONSULTAR_CNPJ_CPF_RFB_SEFAZ'
      Required = True
    end
  end
  object dspAtlGAC: TDataSetProvider
    Left = 740
    Top = 3
  end
  object cdsAltGAC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtlGAC'
    Left = 828
    Top = 3
    object cdsAltGACATL_DATA: TDateField
      FieldName = 'ATL_DATA'
      Origin = 'ATL_DATA'
      Required = True
    end
    object cdsAltGACATL_VERSAO: TStringField
      FieldName = 'ATL_VERSAO'
      Origin = 'ATL_VERSAO'
      Required = True
      Size = 30
    end
    object cdsAltGACATL_MD5: TStringField
      FieldName = 'ATL_MD5'
      Origin = 'ATL_MD5'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1024
    end
    object cdsAltGACATL_NOME_ARQ: TStringField
      FieldName = 'ATL_NOME_ARQ'
      Origin = 'ATL_NOME_ARQ'
      Required = True
      Size = 50
    end
  end
  object dspSelAtlGAC: TDataSetProvider
    Left = 900
    Top = 3
  end
  object cdsSelAtlGAC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelAtlGAC'
    Left = 740
    Top = 49
    object cdsSelAtlGACOP_ATL_BINNARIO: TBlobField
      FieldName = 'OP_ATL_BINNARIO'
    end
    object cdsSelAtlGACOP_ATL_DATA: TDateField
      FieldName = 'OP_ATL_DATA'
    end
    object cdsSelAtlGACOP_ATL_VERSAO: TStringField
      FieldName = 'OP_ATL_VERSAO'
      Size = 30
    end
    object cdsSelAtlGACOP_ATL_MD5: TStringField
      FieldName = 'OP_ATL_MD5'
      Size = 1024
    end
    object cdsSelAtlGACOP_ATL_NOME_ARQ: TStringField
      FieldName = 'OP_ATL_NOME_ARQ'
      Size = 50
    end
    object cdsSelAtlGACOP_ATL_ID_ARQUIVO: TSmallintField
      FieldName = 'OP_ATL_ID_ARQUIVO'
    end
  end
  object dspCFOP_CFPS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCFOP_CFPS
    Left = 41
    Top = 232
  end
  object cdsCFOP_CFPS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCFOP_CFPS'
    OnCalcFields = cdsCFOP_CFPSCalcFields
    OnNewRecord = cdsCFOP_CFPSNewRecord
    Left = 147
    Top = 232
    object cdsCFOP_CFPSCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Origin = 'CFOP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsCFOP_CFPSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsCFOP_CFPSOPERACAO: TSmallintField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      Required = True
    end
    object cdsCFOP_CFPSCFOP_ENTRADA_ESTADUAL: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP_ENTRADA_ESTADUAL'
      Origin = 'CFOP_ENTRADA_ESTADUAL'
      Size = 5
    end
    object cdsCFOP_CFPSCFOP_ENTRADA_INTERESTADUAL: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP_ENTRADA_INTERESTADUAL'
      Origin = 'CFOP_ENTRADA_INTERESTADUAL'
      Size = 5
    end
    object cdsCFOP_CFPSCFOP_ENTRADA_ESTRANGEIRA: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP_ENTRADA_ESTRANGEIRA'
      Origin = 'CFOP_ENTRADA_ESTRANGEIRA'
      Size = 5
    end
    object cdsCFOP_CFPSATUALIZAR_CUSTOS: TSmallintField
      FieldName = 'ATUALIZAR_CUSTOS'
      Origin = 'ATUALIZAR_CUSTOS'
      Required = True
    end
    object cdsCFOP_CFPSNATUREZA_CFOP: TSmallintField
      FieldName = 'NATUREZA_CFOP'
      Origin = 'NATUREZA_CFOP'
      Required = True
    end
    object cdsCFOP_CFPSGERA_CREDITO_PIS_COFINS: TSmallintField
      FieldName = 'GERA_CREDITO_PIS_COFINS'
      Origin = 'GERA_CREDITO_PIS_COFINS'
      Required = True
    end
    object cdsCFOP_CFPSTABELA_4_3_7: TStringField
      Alignment = taRightJustify
      FieldName = 'TABELA_4_3_7'
      Origin = 'TABELA_4_3_7'
      Size = 10
    end
    object cdsCFOP_CFPSOBSERVACAO_NFS: TMemoField
      FieldName = 'OBSERVACAO_NFS'
      Origin = 'OBSERVACAO_NFS'
      BlobType = ftMemo
    end
    object cdsCFOP_CFPSDESCRICAO_NATUREZA: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_NATUREZA'
      Calculated = True
    end
    object cdsCFOP_CFPSGERA_DEBITO_CREDITO_ICMS: TSmallintField
      FieldName = 'GERA_DEBITO_CREDITO_ICMS'
      Origin = 'GERA_DEBITO_CREDITO_ICMS'
      Required = True
    end
    object cdsCFOP_CFPSSUBSTITUICAO_TRIBUTARIA: TSmallintField
      FieldName = 'SUBSTITUICAO_TRIBUTARIA'
      Origin = 'SUBSTITUICAO_TRIBUTARIA'
      Required = True
    end
    object cdsCFOP_CFPSGERA_DEBITO_CREDITO_IPI: TSmallintField
      FieldName = 'GERA_DEBITO_CREDITO_IPI'
      Origin = 'GERA_DEBITO_CREDITO_IPI'
      Required = True
    end
    object cdsCFOP_CFPSDESCRICAO_NATUREZA_RECEITA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_NATUREZA_RECEITA'
      LookupDataSet = cdsTabela_4_3_7
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TABELA_4_3_7'
      Size = 50
      Lookup = True
    end
    object cdsCFOP_CFPSDESCRICAO_OPERACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_OPERACAO'
      Calculated = True
    end
    object cdsCFOP_CFPSS_ATUALIZA_CUSTOS: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'S_ATUALIZA_CUSTOS'
      Size = 30
      Calculated = True
    end
    object cdsCFOP_CFPSS_GERA_CR_PIS_COFINS: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'S_GERA_CR_PIS_COFINS'
      Size = 30
      Calculated = True
    end
    object cdsCFOP_CFPSS_GERA_CR_DEB_ICMS: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'S_GERA_CR_DEB_ICMS'
      Size = 30
      Calculated = True
    end
    object cdsCFOP_CFPSS_GERA_CR_DEB_IPI: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'S_GERA_CR_DEB_IPI'
      Size = 30
      Calculated = True
    end
    object cdsCFOP_CFPSS_CFOP_ST: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'S_CFOP_ST'
      Size = 30
      Calculated = True
    end
    object cdsCFOP_CFPSCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsCFOP_CFPSALIQUOTA_PIS_ENTRADA: TBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCFOP_CFPSCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsCFOP_CFPSALIQUOTA_COFINS_ENTRADA: TBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCFOP_CFPSCST_PIS_SAIDA: TIntegerField
      FieldName = 'CST_PIS_SAIDA'
      Origin = 'CST_PIS_SAIDA'
    end
    object cdsCFOP_CFPSALIQUOTA_PIS_SAIDA: TBCDField
      FieldName = 'ALIQUOTA_PIS_SAIDA'
      Origin = 'ALIQUOTA_PIS_SAIDA'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCFOP_CFPSCST_COFINS_SAIDA: TIntegerField
      FieldName = 'CST_COFINS_SAIDA'
      Origin = 'CST_COFINS_SAIDA'
    end
    object cdsCFOP_CFPSALIQUOTA_COFINS_SAIDA: TBCDField
      FieldName = 'ALIQUOTA_COFINS_SAIDA'
      Origin = 'ALIQUOTA_COFINS_SAIDA'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCFOP_CFPSNATUREZA_RECEITA_PIS_COFINS: TIntegerField
      FieldName = 'NATUREZA_RECEITA_PIS_COFINS'
      Origin = 'NATUREZA_RECEITA_PIS_COFINS'
    end
    object cdsCFOP_CFPSCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
    object cdsCFOP_CFPSREMESSA: TSmallintField
      FieldName = 'REMESSA'
      Required = True
    end
    object cdsCFOP_CFPSCOD_CTA: TStringField
      FieldName = 'COD_CTA'
      Size = 255
    end
  end
  object dspTabela4_3_7: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTabela_4_3_7
    Left = 41
    Top = 279
  end
  object cdsTabela_4_3_7: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabela4_3_7'
    Left = 147
    Top = 279
    object cdsTabela_4_3_7CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsTabela_4_3_7DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object dspFuncionarios: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFuncionarios
    Left = 41
    Top = 324
  end
  object cdsFuncionarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionarios'
    OnNewRecord = cdsFuncionariosNewRecord
    Left = 147
    Top = 324
    object cdsFuncionariosFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsFuncionariosCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
      EditMask = 'dd/mm/yyyy;1;_'
    end
    object cdsFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
    end
    object cdsFuncionariosIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Origin = 'IDENTIDADE'
    end
    object cdsFuncionariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 40
    end
    object cdsFuncionariosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsFuncionariosCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '99999-999;0;_'
      Size = 9
    end
    object cdsFuncionariosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object cdsFuncionariosCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
    end
    object cdsFuncionariosESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsFuncionariosDDD: TIntegerField
      FieldName = 'DDD'
      Origin = 'DDD'
    end
    object cdsFuncionariosTELEFONE: TIntegerField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object cdsFuncionariosCELULAR: TIntegerField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
    end
    object cdsFuncionariosATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsFuncionariosBARRAS: TStringField
      FieldName = 'BARRAS'
      Origin = 'BARRAS'
      Size = 13
    end
    object cdsFuncionariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
    end
    object cdsFuncionariosCARGO: TStringField
      FieldName = 'CARGO'
      Origin = 'CARGO'
      Size = 30
    end
    object cdsFuncionariosPERCENTUAL_COMISSAO_VENDA: TBCDField
      FieldName = 'PERCENTUAL_COMISSAO_VENDA'
      Origin = 'PERCENTUAL_COMISSAO_VENDA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
  end
  object cdsConfig_ini: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 908
    Top = 49
    object cdsConfig_iniSERV_TIPO: TSmallintField
      FieldName = 'SERV_TIPO'
    end
    object cdsConfig_iniSERV_PROTOCOLO: TSmallintField
      FieldName = 'SERV_PROTOCOLO'
    end
    object cdsConfig_iniSERV_VERSAO: TSmallintField
      FieldName = 'SERV_VERSAO'
    end
    object cdsConfig_iniSERV_TCPIP: TStringField
      FieldName = 'SERV_TCPIP'
      Size = 50
    end
    object cdsConfig_iniMARCA_MODELO_IMP_TERMICA: TSmallintField
      FieldName = 'MARCA_MODELO_IMP_TERMICA'
    end
    object cdsConfig_iniPORTA_IMP_TERMICA: TStringField
      FieldName = 'PORTA_IMP_TERMICA'
      Size = 200
    end
    object cdsConfig_iniBPS_IMP_TERMICA: TIntegerField
      FieldName = 'BPS_IMP_TERMICA'
    end
    object cdsConfig_iniBITS_DADOS_IMP_TERMICA: TSmallintField
      FieldName = 'BITS_DADOS_IMP_TERMICA'
    end
    object cdsConfig_iniBITS_PARADA_IMP_TERMCA: TSmallintField
      FieldName = 'BITS_PARADA_IMP_TERMCA'
    end
    object cdsConfig_iniMODELO_ETQ_GONDOLA: TSmallintField
      FieldName = 'MODELO_ETQ_GONDOLA'
    end
    object cdsConfig_iniPARIDADE_IMP_TERMICA: TSmallintField
      FieldName = 'PARIDADE_IMP_TERMICA'
    end
    object cdsConfig_iniCTRL_FLUXO_IMP_TERMICA: TSmallintField
      FieldName = 'CTRL_FLUXO_IMP_TERMICA'
    end
    object cdsConfig_iniSERIE_CERTIFICADO_DIGITAL: TStringField
      FieldName = 'SERIE_CERTIFICADO_DIGITAL'
      Size = 300
    end
    object cdsConfig_iniVENCIMENTO_CERTIICADO_DIGITAL: TDateField
      FieldName = 'VENCIMENTO_CERTIICADO_DIGITAL'
    end
    object cdsConfig_iniPATH_TABELAS_AUX_SPED_F: TStringField
      FieldName = 'PATH_TABELAS_AUX_SPED_F'
      Size = 200
    end
    object cdsConfig_iniPATH_ATUALIZACAO: TStringField
      FieldName = 'PATH_ATUALIZACAO'
      Size = 300
    end
    object cdsConfig_iniLOJA: TIntegerField
      FieldName = 'LOJA'
    end
    object cdsConfig_iniNOME_LOJA: TStringField
      FieldName = 'NOME_LOJA'
      Size = 40
    end
    object cdsConfig_iniULTIMO_USUARIO: TStringField
      FieldName = 'ULTIMO_USUARIO'
    end
    object cdsConfig_iniUF_WEBSERVICE: TStringField
      FieldName = 'UF_WEBSERVICE'
      Size = 2
    end
    object cdsConfig_iniAMBIENTE_NFE: TIntegerField
      FieldName = 'AMBIENTE_NFE'
    end
    object cdsConfig_iniPATH_NFE: TStringField
      FieldName = 'PATH_NFE'
      Size = 500
    end
    object cdsConfig_iniPATH_NFE_INUTILIZADA: TStringField
      FieldName = 'PATH_NFE_INUTILIZADA'
      Size = 500
    end
    object cdsConfig_iniMODELO_DF_NFE: TIntegerField
      FieldName = 'MODELO_DF_NFE'
    end
    object cdsConfig_iniVERSAO_DF_NFE: TIntegerField
      FieldName = 'VERSAO_DF_NFE'
    end
    object cdsConfig_iniPATH_SCHEMAS_NFE: TStringField
      FieldName = 'PATH_SCHEMAS_NFE'
      Size = 500
    end
  end
  object dspModelo_Doc: TDataSetProvider
    DataSet = dmDBEXMaster.fdqModelo_doc
    Left = 41
    Top = 370
  end
  object cdsModelo_Doc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelo_Doc'
    Left = 147
    Top = 370
    object cdsModelo_DocMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsModelo_DocDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object cdsModelo_DocREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = 'REGISTRO'
      FixedChar = True
      Size = 2
    end
    object cdsModelo_DocCODIGOSINTEGRA: TStringField
      FieldName = 'CODIGOSINTEGRA'
      Origin = 'CODIGOSINTEGRA'
      Required = True
      Size = 4
    end
  end
  object dspConfigECF: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConfigECF
    Left = 41
    Top = 417
  end
  object cdsConfigECF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigECF'
    OnNewRecord = cdsConfigECFNewRecord
    Left = 147
    Top = 417
    object cdsConfigECFCONFIG_CAIXAS: TIntegerField
      FieldName = 'CONFIG_CAIXAS'
      Origin = 'CONFIG_CAIXAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConfigECFNUMERO_CAIXA: TIntegerField
      FieldName = 'NUMERO_CAIXA'
      Origin = 'NUMERO_CAIXA'
      Required = True
    end
    object cdsConfigECFNUMERO_SERIE_ECF: TStringField
      FieldName = 'NUMERO_SERIE_ECF'
      Origin = 'NUMERO_SERIE_ECF'
    end
    object cdsConfigECFCODIGO_MODELO_DOCUMENTO: TStringField
      FieldName = 'CODIGO_MODELO_DOCUMENTO'
      Origin = 'CODIGO_MODELO_DOCUMENTO'
      Size = 2
    end
    object cdsConfigECFMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
      Origin = 'MODELO_ECF'
    end
  end
  object dspModEtqGond: TDataSetProvider
    DataSet = dmDBEXMaster.fdqModeloEtiqGond
    Left = 41
    Top = 463
  end
  object cdsModEtqGond: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModEtqGond'
    Left = 147
    Top = 463
    object cdsModEtqGondMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsModEtqGondDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
  end
  object cdsAdministradoras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAdministradoras'
    OnNewRecord = cdsAdministradorasNewRecord
    Left = 147
    Top = 509
    object cdsAdministradorasADMINISTRADORA: TIntegerField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAdministradorasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsAdministradorasDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsAdministradorasPRAZO: TSmallintField
      FieldName = 'PRAZO'
      Origin = 'PRAZO'
      Required = True
    end
    object cdsAdministradorasBANCO: TIntegerField
      FieldName = 'BANCO'
      Origin = 'BANCO'
    end
    object cdsAdministradorasAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Size = 10
    end
    object cdsAdministradorasCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Size = 15
    end
    object cdsAdministradorasCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsAdministradorasCOD_REDE: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_REDE'
      Origin = 'COD_REDE'
      Required = True
      Size = 10
    end
    object cdsAdministradorasCOD_BANDEIRA: TStringField
      Alignment = taRightJustify
      FieldName = 'COD_BANDEIRA'
      Origin = 'COD_BANDEIRA'
      Required = True
      Size = 10
    end
  end
  object dspAdministradoras: TDataSetProvider
    DataSet = dmDBEXMaster.fdqAdministradoras
    Left = 41
    Top = 509
  end
  object cdsContaCorrente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContaCorrente'
    Left = 147
    Top = 555
    object cdsContaCorrenteCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsContaCorrenteABERTURA: TDateField
      FieldName = 'ABERTURA'
      Origin = 'ABERTURA'
      Required = True
    end
    object cdsContaCorrenteTITULAR: TStringField
      FieldName = 'TITULAR'
      Origin = 'TITULAR'
      Required = True
      Size = 40
    end
    object cdsContaCorrenteBANCO: TIntegerField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Required = True
    end
    object cdsContaCorrenteAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Required = True
      Size = 10
    end
    object cdsContaCorrenteSALDOINICIAL: TBCDField
      FieldName = 'SALDOINICIAL'
      Origin = 'SALDOINICIAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContaCorrenteSALDOATUAL: TBCDField
      FieldName = 'SALDOATUAL'
      Origin = 'SALDOATUAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContaCorrenteCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 10
    end
  end
  object dspContaCorrente: TDataSetProvider
    DataSet = dmDBEXMaster.fdqContaCorrente
    Left = 41
    Top = 555
  end
  object cdsCtrlCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrlCartoes'
    OnCalcFields = cdsCtrlCartoesCalcFields
    OnNewRecord = cdsCtrlCartoesNewRecord
    Left = 147
    Top = 604
    object cdsCtrlCartoesCONTROLECARTAOTICKET: TIntegerField
      FieldName = 'CONTROLECARTAOTICKET'
      Origin = 'CONTROLECARTAOTICKET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCtrlCartoesADMINISTRADORA: TIntegerField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA'
      Required = True
    end
    object cdsCtrlCartoesEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsCtrlCartoesDEPOSITO: TDateField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsCtrlCartoesRECEBIMENTO: TDateField
      FieldName = 'RECEBIMENTO'
      Origin = 'RECEBIMENTO'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsCtrlCartoesBAIXA: TDateField
      FieldName = 'BAIXA'
      Origin = 'BAIXA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCtrlCartoesVALORDACOMPRA: TBCDField
      FieldName = 'VALORDACOMPRA'
      Origin = 'VALORDACOMPRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlCartoesVALORDODESCONTO: TBCDField
      FieldName = 'VALORDODESCONTO'
      Origin = 'VALORDODESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlCartoesVALORARECEBER: TBCDField
      FieldName = 'VALORARECEBER'
      Origin = 'VALORARECEBER'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlCartoesSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsCtrlCartoesTIPO_OPERACAO: TSmallintField
      FieldName = 'TIPO_OPERACAO'
      Origin = 'TIPO_OPERACAO'
      Required = True
    end
    object cdsCtrlCartoesDESCR_STATUS: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'DESCR_STATUS'
      Size = 8
      Calculated = True
    end
    object cdsCtrlCartoesDESCR_TIPO_OPER: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCR_TIPO_OPER'
      Size = 8
      Calculated = True
    end
    object cdsCtrlCartoesNOME_ADM: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_ADM'
      LookupDataSet = cdsAdministradoras
      LookupKeyFields = 'ADMINISTRADORA'
      LookupResultField = 'NOME'
      KeyFields = 'ADMINISTRADORA'
      Size = 40
      Lookup = True
    end
  end
  object dspCtrlCartoes: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCtrlCartoes
    Left = 41
    Top = 604
  end
  object cdsSelBaixaCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelBaixaCartao'
    OnCalcFields = cdsCtrlCartoesCalcFields
    OnNewRecord = cdsCtrlCartoesNewRecord
    Left = 147
    Top = 648
    object cdsSelBaixaCartaoCONTROLECARTAOTICKET: TIntegerField
      FieldName = 'CONTROLECARTAOTICKET'
      Origin = 'CONTROLECARTAOTICKET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSelBaixaCartaoADMINISTRADORA: TIntegerField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA'
      Required = True
    end
    object cdsSelBaixaCartaoEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
    end
    object cdsSelBaixaCartaoDEPOSITO: TDateField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      Required = True
    end
    object cdsSelBaixaCartaoRECEBIMENTO: TDateField
      FieldName = 'RECEBIMENTO'
      Origin = 'RECEBIMENTO'
      Required = True
    end
    object cdsSelBaixaCartaoBAIXA: TDateField
      FieldName = 'BAIXA'
      Origin = 'BAIXA'
    end
    object cdsSelBaixaCartaoVALORDACOMPRA: TBCDField
      FieldName = 'VALORDACOMPRA'
      Origin = 'VALORDACOMPRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsSelBaixaCartaoVALORDODESCONTO: TBCDField
      FieldName = 'VALORDODESCONTO'
      Origin = 'VALORDODESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsSelBaixaCartaoVALORARECEBER: TBCDField
      FieldName = 'VALORARECEBER'
      Origin = 'VALORARECEBER'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsSelBaixaCartaoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsSelBaixaCartaoTIPO_OPERACAO: TSmallintField
      FieldName = 'TIPO_OPERACAO'
      Origin = 'TIPO_OPERACAO'
      Required = True
    end
  end
  object dspSelBaixaCartao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelBaixaCartao
    Left = 41
    Top = 648
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    OnNewRecord = cdsFornecedorNewRecord
    Left = 147
    Top = 693
    object cdsFornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFornecedorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object cdsFornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 30
    end
    object cdsFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsFornecedorINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
    end
    object cdsFornecedorCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
    end
    object cdsFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object cdsFornecedorNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsFornecedorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '99999-999;0;_'
      Size = 9
    end
    object cdsFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object cdsFornecedorESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsFornecedorDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      FixedChar = True
      Size = 5
    end
    object cdsFornecedorTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Origin = 'TELEFONE1'
      Size = 15
    end
    object cdsFornecedorTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Origin = 'TELEFONE2'
      Size = 15
    end
    object cdsFornecedorFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object cdsFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 30
    end
    object cdsFornecedorCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 30
    end
    object cdsFornecedorHTTP: TStringField
      FieldName = 'HTTP'
      Origin = 'HTTP'
      Size = 50
    end
    object cdsFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object cdsFornecedorTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsFornecedorOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsFornecedorULTIMOPEDIDO: TIntegerField
      FieldName = 'ULTIMOPEDIDO'
      Origin = 'ULTIMOPEDIDO'
    end
    object cdsFornecedorDATAULTIMOPEDIDO: TDateField
      FieldName = 'DATAULTIMOPEDIDO'
      Origin = 'DATAULTIMOPEDIDO'
    end
    object cdsFornecedorVALORULTIMOPEDIDO: TBCDField
      FieldName = 'VALORULTIMOPEDIDO'
      Origin = 'VALORULTIMOPEDIDO'
      Precision = 18
      Size = 2
    end
    object cdsFornecedorULTIMANF: TStringField
      FieldName = 'ULTIMANF'
      Origin = 'ULTIMANF'
      Size = 15
    end
    object cdsFornecedorDATAULTIMANF: TDateField
      FieldName = 'DATAULTIMANF'
      Origin = 'DATAULTIMANF'
    end
    object cdsFornecedorVALORULTIMANF: TBCDField
      FieldName = 'VALORULTIMANF'
      Origin = 'VALORULTIMANF'
      Precision = 18
      Size = 2
    end
    object cdsFornecedorRAMODEATIVIDADE: TSmallintField
      FieldName = 'RAMODEATIVIDADE'
      Origin = 'RAMODEATIVIDADE'
      Required = True
    end
    object cdsFornecedorCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
    end
    object cdsFornecedorATACADISTAREGIMEESPECIAL: TSmallintField
      FieldName = 'ATACADISTAREGIMEESPECIAL'
      Origin = 'ATACADISTAREGIMEESPECIAL'
      Required = True
    end
    object cdsFornecedorREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Origin = 'REPRESENTANTE'
      Size = 30
    end
    object cdsFornecedorOPTANTE_SIMPLES: TSmallintField
      FieldName = 'OPTANTE_SIMPLES'
      Origin = 'OPTANTE_SIMPLES'
      Required = True
    end
    object cdsFornecedorAPROVEITA_DESCONTO_ITEM_NF: TIntegerField
      FieldName = 'APROVEITA_DESCONTO_ITEM_NF'
      Origin = 'APROVEITA_DESCONTO_ITEM_NF'
      Required = True
    end
    object cdsFornecedorPAIS: TIntegerField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
    end
    object cdsFornecedorINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Origin = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
    object cdsFornecedorNOME_CIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CIDADE'
      LookupDataSet = cdsCidades
      LookupKeyFields = 'CIDADE'
      LookupResultField = 'NOME'
      KeyFields = 'CIDADE'
      Size = 40
      Lookup = True
    end
    object cdsFornecedorNOME_ESTADO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_ESTADO'
      LookupDataSet = cdsEstados
      LookupKeyFields = 'SIGLA'
      LookupResultField = 'NOME'
      KeyFields = 'ESTADO'
      Size = 40
      Lookup = True
    end
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFornecedor
    Left = 41
    Top = 693
  end
  object cdsNFEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFEntrada'
    OnCalcFields = cdsNFEntradaCalcFields
    OnNewRecord = cdsNFEntradaNewRecord
    Left = 392
    Top = 140
    object cdsNFEntradaNFENTRADA: TIntegerField
      FieldName = 'NFENTRADA'
      Origin = 'NFENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNFEntradaNOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Origin = 'NOTAFISCAL'
      Required = True
      Size = 15
    end
    object cdsNFEntradaNOTAFISCALINTERNA: TStringField
      FieldName = 'NOTAFISCALINTERNA'
      Origin = 'NOTAFISCALINTERNA'
      Size = 15
    end
    object cdsNFEntradaFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object cdsNFEntradaORDEMDECOMPRA: TIntegerField
      FieldName = 'ORDEMDECOMPRA'
      Origin = 'ORDEMDECOMPRA'
    end
    object cdsNFEntradaENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
    end
    object cdsNFEntradaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
    end
    object cdsNFEntradaSAIDA: TDateField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
    end
    object cdsNFEntradaCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 5
    end
    object cdsNFEntradaTRANSPORTADORA: TIntegerField
      FieldName = 'TRANSPORTADORA'
      Origin = 'TRANSPORTADORA'
    end
    object cdsNFEntradaTIPOFRETE: TSmallintField
      FieldName = 'TIPOFRETE'
      Origin = 'TIPOFRETE'
      Required = True
    end
    object cdsNFEntradaFRETEAGREGADO: TSmallintField
      FieldName = 'FRETEAGREGADO'
      Origin = 'FRETEAGREGADO'
      Required = True
    end
    object cdsNFEntradaBASEICMS: TBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      Origin = 'VALORICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaBASESUBSTITUICAO: TBCDField
      FieldName = 'BASESUBSTITUICAO'
      Origin = 'BASESUBSTITUICAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORSUBSTITUICAO: TBCDField
      FieldName = 'VALORSUBSTITUICAO'
      Origin = 'VALORSUBSTITUICAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORDOFRETE: TBCDField
      FieldName = 'VALORDOFRETE'
      Origin = 'VALORDOFRETE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORDOSEGURO: TBCDField
      FieldName = 'VALORDOSEGURO'
      Origin = 'VALORDOSEGURO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaOUTRASDESPESAS: TBCDField
      FieldName = 'OUTRASDESPESAS'
      Origin = 'OUTRASDESPESAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORDOSPRODUTOS: TBCDField
      FieldName = 'VALORDOSPRODUTOS'
      Origin = 'VALORDOSPRODUTOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Origin = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaBASEICMSCALCULADO: TBCDField
      FieldName = 'BASEICMSCALCULADO'
      Origin = 'BASEICMSCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORICMSCALCULADO: TBCDField
      FieldName = 'VALORICMSCALCULADO'
      Origin = 'VALORICMSCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaBASESUBSTITUICAOCALCULADO: TBCDField
      FieldName = 'BASESUBSTITUICAOCALCULADO'
      Origin = 'BASESUBSTITUICAOCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORSUBSTITUICAOCALCULADO: TBCDField
      FieldName = 'VALORSUBSTITUICAOCALCULADO'
      Origin = 'VALORSUBSTITUICAOCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORDOFRETECALCULADO: TBCDField
      FieldName = 'VALORDOFRETECALCULADO'
      Origin = 'VALORDOFRETECALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORDOSEGUROCALCULADO: TBCDField
      FieldName = 'VALORDOSEGUROCALCULADO'
      Origin = 'VALORDOSEGUROCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaOUTRASDESPESASCALCULADO: TBCDField
      FieldName = 'OUTRASDESPESASCALCULADO'
      Origin = 'OUTRASDESPESASCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORDOIPICALCULADO: TBCDField
      FieldName = 'VALORDOIPICALCULADO'
      Origin = 'VALORDOIPICALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORDOSPRODUTOSCALCULADO: TBCDField
      FieldName = 'VALORDOSPRODUTOSCALCULADO'
      Origin = 'VALORDOSPRODUTOSCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaVALORDANOTACALCULADO: TBCDField
      FieldName = 'VALORDANOTACALCULADO'
      Origin = 'VALORDANOTACALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaDESCONTOGERAL: TBCDField
      FieldName = 'DESCONTOGERAL'
      Origin = 'DESCONTOGERAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaDESCONTOGERALCALCULADO: TBCDField
      FieldName = 'DESCONTOGERALCALCULADO'
      Origin = 'DESCONTOGERALCALCULADO'
      Required = True
      Precision = 18
    end
    object cdsNFEntradaPESOBRUTO: TBCDField
      FieldName = 'PESOBRUTO'
      Origin = 'PESOBRUTO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsNFEntradaPESOLIQUIDO: TBCDField
      FieldName = 'PESOLIQUIDO'
      Origin = 'PESOLIQUIDO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsNFEntradaQUANTIDADEVOLUME: TBCDField
      FieldName = 'QUANTIDADEVOLUME'
      Origin = 'QUANTIDADEVOLUME'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsNFEntradaESPECIEVOLUME: TStringField
      FieldName = 'ESPECIEVOLUME'
      Origin = 'ESPECIEVOLUME'
      Size = 10
    end
    object cdsNFEntradaMARCAVOLUME: TStringField
      FieldName = 'MARCAVOLUME'
      Origin = 'MARCAVOLUME'
      Size = 10
    end
    object cdsNFEntradaNUMEROVOLUME: TIntegerField
      FieldName = 'NUMEROVOLUME'
      Origin = 'NUMEROVOLUME'
    end
    object cdsNFEntradaPLACAVEICULO: TStringField
      FieldName = 'PLACAVEICULO'
      Origin = 'PLACAVEICULO'
      Size = 10
    end
    object cdsNFEntradaUFVEICULO: TStringField
      FieldName = 'UFVEICULO'
      Origin = 'UFVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsNFEntradaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsNFEntradaIMPRESSO: TSmallintField
      FieldName = 'IMPRESSO'
      Origin = 'IMPRESSO'
      Required = True
    end
    object cdsNFEntradaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsNFEntradaSERIENF: TStringField
      FieldName = 'SERIENF'
      Origin = 'SERIENF'
      Size = 10
    end
    object cdsNFEntradaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsNFEntradaCANCELADA: TSmallintField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
    object cdsNFEntradaRATEAR_DESCONTO: TSmallintField
      FieldName = 'RATEAR_DESCONTO'
      Origin = 'RATEAR_DESCONTO'
      Required = True
    end
    object cdsNFEntradaTIPO_CONTABIL: TSmallintField
      FieldName = 'TIPO_CONTABIL'
      Origin = 'TIPO_CONTABIL'
      Required = True
    end
    object cdsNFEntradaCODIGO_VALOR_FISCAL: TSmallintField
      FieldName = 'CODIGO_VALOR_FISCAL'
      Origin = 'CODIGO_VALOR_FISCAL'
      Required = True
    end
    object cdsNFEntradaSOMAR_DESPACESS_BASEICMS: TSmallintField
      FieldName = 'SOMAR_DESPACESS_BASEICMS'
      Origin = 'SOMAR_DESPACESS_BASEICMS'
      Required = True
    end
    object cdsNFEntradaSOMAR_IPI_BASEICMS: TSmallintField
      FieldName = 'SOMAR_IPI_BASEICMS'
      Origin = 'SOMAR_IPI_BASEICMS'
      Required = True
    end
    object cdsNFEntradaSOMAR_ICMSR_VALORNOTA: TSmallintField
      FieldName = 'SOMAR_ICMSR_VALORNOTA'
      Origin = 'SOMAR_ICMSR_VALORNOTA'
      Required = True
    end
    object cdsNFEntradaREDUCAO_PIS_COFINS: TSmallintField
      FieldName = 'REDUCAO_PIS_COFINS'
      Origin = 'REDUCAO_PIS_COFINS'
      Required = True
    end
    object cdsNFEntradaALIQUOTA_CREDITO_SIMPLES: TCurrencyField
      FieldName = 'ALIQUOTA_CREDITO_SIMPLES'
      Origin = 'ALIQUOTA_CREDITO_SIMPLES'
      Required = True
    end
    object cdsNFEntradaCOMPRADOR: TIntegerField
      FieldName = 'COMPRADOR'
      Origin = 'COMPRADOR'
    end
    object cdsNFEntradaPROTOCOLO_DANFE: TStringField
      FieldName = 'PROTOCOLO_DANFE'
      Origin = 'PROTOCOLO_DANFE'
      Size = 200
    end
    object cdsNFEntradaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALOR_PIS_ST: TBCDField
      FieldName = 'VALOR_PIS_ST'
      Origin = 'VALOR_PIS_ST'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaVALOR_COFINS_ST: TBCDField
      FieldName = 'VALOR_COFINS_ST'
      Origin = 'VALOR_COFINS_ST'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFEntradaSITUACAO_DOCUMENTO: TStringField
      FieldName = 'SITUACAO_DOCUMENTO'
      Origin = 'SITUACAO_DOCUMENTO'
      Required = True
      Size = 2
    end
    object cdsNFEntradaCOM_FRETE: TStringField
      FieldKind = fkCalculated
      FieldName = 'COM_FRETE'
      Size = 3
      Calculated = True
    end
    object cdsNFEntradaDESCRICAO_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_STATUS'
      Size = 15
      Calculated = True
    end
  end
  object dspNFEntrada: TDataSetProvider
    DataSet = dmDBEXMaster.fdqNFEntrada
    Left = 257
    Top = 140
  end
  object cdsParcelasNFE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcelasNFE'
    OnNewRecord = cdsParcelasNFENewRecord
    Left = 392
    Top = 3
    object cdsParcelasNFEPARCELASNFE: TIntegerField
      FieldName = 'PARCELASNFE'
      Origin = 'PARCELASNFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParcelasNFENOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Origin = 'NOTAFISCAL'
      Required = True
      Size = 15
    end
    object cdsParcelasNFEDOCUMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
      Size = 15
    end
    object cdsParcelasNFEVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsParcelasNFEVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspParcelasNFE: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParcelasNFE
    Left = 257
    Top = 3
  end
  object cdsCFOP_NFEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCFOP_NFEntrada'
    Left = 392
    Top = 49
    object cdsCFOP_NFEntradaCFOP_NFENTRADA: TIntegerField
      FieldName = 'CFOP_NFENTRADA'
      Origin = 'CFOP_NFENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCFOP_NFEntradaNFENTRADA: TIntegerField
      FieldName = 'NFENTRADA'
      Origin = 'NFENTRADA'
      Required = True
    end
    object cdsCFOP_NFEntradaCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsCFOP_NFEntradaNOME_CFOP: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CFOP'
      LookupDataSet = cdsCFOP_CFPS
      LookupKeyFields = 'CFOP'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CFOP'
      Size = 40
      Lookup = True
    end
  end
  object dspCFOP_NFEntrada: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCFOP_NF_Entrada
    Left = 257
    Top = 49
  end
  object cdsSituacao_Doc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSituacao_Doc'
    Left = 392
    Top = 94
    object cdsSituacao_DocCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSituacao_DocDESCRICAO_SITUACAO: TStringField
      FieldName = 'DESCRICAO_SITUACAO'
      Origin = 'DESCRICAO_SITUACAO'
      Required = True
      Size = 600
    end
  end
  object dspSituacao_Doc: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSituacao_Doc
    Left = 257
    Top = 94
  end
  object cdsItem_NFEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItem_NFEntrada'
    Left = 392
    Top = 186
    object cdsItem_NFEntradaITEMNFENTRADA: TIntegerField
      FieldName = 'ITEMNFENTRADA'
      Origin = 'ITEMNFENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItem_NFEntradaNFENTRADA: TIntegerField
      FieldName = 'NFENTRADA'
      Origin = 'NFENTRADA'
      Required = True
    end
    object cdsItem_NFEntradaEAN: TStringField
      FieldName = 'EAN'
      Origin = 'EAN'
      Required = True
      Size = 15
    end
    object cdsItem_NFEntradaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsItem_NFEntradaCST: TSmallintField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      DisplayFormat = '000'
    end
    object cdsItem_NFEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItem_NFEntradaUNIDADEEMBALAGEM: TBCDField
      FieldName = 'UNIDADEEMBALAGEM'
      Origin = 'UNIDADEEMBALAGEM'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItem_NFEntradaVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      DisplayFormat = '#,##0.00000'
      Precision = 18
    end
    object cdsItem_NFEntradaDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
    end
    object cdsItem_NFEntradaIPI: TCurrencyField
      FieldName = 'IPI'
      Origin = 'IPI'
      Required = True
    end
    object cdsItem_NFEntradaICMSENTRADA: TCurrencyField
      FieldName = 'ICMSENTRADA'
      Origin = 'ICMSENTRADA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItem_NFEntradaICMSSAIDA: TCurrencyField
      FieldName = 'ICMSSAIDA'
      Origin = 'ICMSSAIDA'
      Required = True
    end
    object cdsItem_NFEntradaCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsItem_NFEntradaBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaBASE_SUBSTITUICAO: TBCDField
      FieldName = 'BASE_SUBSTITUICAO'
      Origin = 'BASE_SUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_SUBSTITUICAO: TBCDField
      FieldName = 'VALOR_SUBSTITUICAO'
      Origin = 'VALOR_SUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaTIPO_DESCONTO: TSmallintField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Required = True
    end
    object cdsItem_NFEntradaSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaISENTO_NAOTRIBUTADO: TBCDField
      FieldName = 'ISENTO_NAOTRIBUTADO'
      Origin = 'ISENTO_NAOTRIBUTADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaENCARGOS: TBCDField
      FieldName = 'ENCARGOS'
      Origin = 'ENCARGOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object cdsItem_NFEntradaREDUCAO_BASE: TFMTBCDField
      FieldName = 'REDUCAO_BASE'
      Origin = 'REDUCAO_BASE'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object cdsItem_NFEntradaBASE_ICMS_SIMPLES: TBCDField
      FieldName = 'BASE_ICMS_SIMPLES'
      Origin = 'BASE_ICMS_SIMPLES'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_ICMS_SIMPLES: TBCDField
      FieldName = 'VALOR_ICMS_SIMPLES'
      Origin = 'VALOR_ICMS_SIMPLES'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaALIQUOTA_ST: TCurrencyField
      FieldName = 'ALIQUOTA_ST'
      Origin = 'ALIQUOTA_ST'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItem_NFEntradaIND_APURACAO_IPI: TIntegerField
      FieldName = 'IND_APURACAO_IPI'
      Origin = 'IND_APURACAO_IPI'
      Required = True
    end
    object cdsItem_NFEntradaCOD_ENQUADRAMENTO_IPI: TStringField
      FieldName = 'COD_ENQUADRAMENTO_IPI'
      Origin = 'COD_ENQUADRAMENTO_IPI'
      Size = 3
    end
    object cdsItem_NFEntradaBASE_CALCULO_IPI: TBCDField
      FieldName = 'BASE_CALCULO_IPI'
      Origin = 'BASE_CALCULO_IPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaALIQUOTA_IPI: TCurrencyField
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'ALIQUOTA_IPI'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItem_NFEntradaCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_BASE_PIS: TBCDField
      FieldName = 'VALOR_BASE_PIS'
      Origin = 'VALOR_BASE_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaP_ALIQUOTA_PIS: TBCDField
      FieldName = 'P_ALIQUOTA_PIS'
      Origin = 'P_ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsItem_NFEntradaQUANT_BC_PIS: TBCDField
      FieldName = 'QUANT_BC_PIS'
      Origin = 'QUANT_BC_PIS'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsItem_NFEntradaV_ALIQUOTA_PIS: TBCDField
      FieldName = 'V_ALIQUOTA_PIS'
      Origin = 'V_ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsItem_NFEntradaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object cdsItem_NFEntradaVALOR_BC_COFINS: TBCDField
      FieldName = 'VALOR_BC_COFINS'
      Origin = 'VALOR_BC_COFINS'
      Required = True
      Precision = 18
    end
    object cdsItem_NFEntradaP_ALIQUOTA_COFINS: TBCDField
      FieldName = 'P_ALIQUOTA_COFINS'
      Origin = 'P_ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsItem_NFEntradaQUANTIDADE_BC_COFINS: TBCDField
      FieldName = 'QUANTIDADE_BC_COFINS'
      Origin = 'QUANTIDADE_BC_COFINS'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsItem_NFEntradaV_ALIQUOTA_COFINS: TBCDField
      FieldName = 'V_ALIQUOTA_COFINS'
      Origin = 'V_ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsItem_NFEntradaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItem_NFEntradaCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object cdsItem_NFEntradaNUMERO_ITEM: TIntegerField
      FieldName = 'NUMERO_ITEM'
      Origin = 'NUMERO_ITEM'
    end
    object cdsItem_NFEntradaDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 40
      Lookup = True
    end
    object cdsItem_NFEntradaUND_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'UND_PRODUTO'
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'UNIDADE'
      KeyFields = 'PRODUTO'
      Size = 2
      Lookup = True
    end
    object cdsItem_NFEntradaFRETE_RATEADO: TBCDField
      FieldName = 'FRETE_RATEADO'
      Origin = 'FRETE_RATEADO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspItem_NFEntrada: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItem_NFEntrada
    UpdateMode = upWhereKeyOnly
    Left = 257
    Top = 186
  end
  object cdsConhecimentoFrete: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConhecimentoFrete'
    OnNewRecord = cdsConhecimentoFreteNewRecord
    Left = 392
    Top = 232
    object cdsConhecimentoFreteCONHECIMENTO_FRETE: TIntegerField
      FieldName = 'CONHECIMENTO_FRETE'
      Origin = 'CONHECIMENTO_FRETE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConhecimentoFreteNF_ENTRADA: TIntegerField
      FieldName = 'NF_ENTRADA'
      Origin = 'NF_ENTRADA'
    end
    object cdsConhecimentoFreteFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object cdsConhecimentoFreteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 14
    end
    object cdsConhecimentoFreteINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
      Required = True
      Size = 14
    end
    object cdsConhecimentoFreteEMISSAO_ENTRADA: TDateField
      FieldName = 'EMISSAO_ENTRADA'
      Origin = 'EMISSAO_ENTRADA'
      Required = True
    end
    object cdsConhecimentoFreteESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsConhecimentoFreteMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
    end
    object cdsConhecimentoFreteSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      FixedChar = True
      Size = 1
    end
    object cdsConhecimentoFreteSUBSERIE: TStringField
      FieldName = 'SUBSERIE'
      Origin = 'SUBSERIE'
      FixedChar = True
      Size = 2
    end
    object cdsConhecimentoFreteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object cdsConhecimentoFreteCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsConhecimentoFreteVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConhecimentoFreteBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'BASE_CALCULO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConhecimentoFreteVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConhecimentoFreteISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ISENTA_NAO_TRIBUTADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConhecimentoFreteOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'OUTRAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConhecimentoFreteCIF_FOB: TSmallintField
      FieldName = 'CIF_FOB'
      Origin = 'CIF_FOB'
      Required = True
    end
    object cdsConhecimentoFreteCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsConhecimentoFreteSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsConhecimentoFreteTIPO_CTE: TSmallintField
      FieldName = 'TIPO_CTE'
      Origin = 'TIPO_CTE'
      Required = True
    end
    object cdsConhecimentoFreteVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConhecimentoFreteCHAVE_CTE: TStringField
      FieldName = 'CHAVE_CTE'
      Origin = 'CHAVE_CTE'
      Size = 44
    end
    object cdsConhecimentoFreteCHAVE_CTE_REF: TStringField
      FieldName = 'CHAVE_CTE_REF'
      Origin = 'CHAVE_CTE_REF'
      Size = 44
    end
    object cdsConhecimentoFreteCST_ICMS: TIntegerField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      Required = True
    end
  end
  object dspConhecimentoFrete: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConhecimentoFrete
    Left = 257
    Top = 232
  end
  object dspTipo_CTE: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTipo_CTE
    Left = 257
    Top = 279
  end
  object cdsTipo_CTE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipo_CTE'
    Left = 392
    Top = 279
    object cdsTipo_CTETIPO_CTE: TIntegerField
      FieldName = 'TIPO_CTE'
      Origin = 'TIPO_CTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTipo_CTEDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 300
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqProdutos
    Left = 257
    Top = 324
  end
  object dspOrdemCompra: TDataSetProvider
    DataSet = dmDBEXMaster.fdqOrdemCompra
    Left = 257
    Top = 417
  end
  object cdsOrdemCompra: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ORDEMDECOMPRA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'EMISSAO'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'FATURAMENTO'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ENTREGA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PROGRAMACAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CFOP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'FORNECEDOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COMPRADOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VENDEDOR'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TIPOFRETE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TOTALDOSPRODUTOS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'TOTALDOPEDIDO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCONTOSTRIBUTADOS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCONTOSISENTOS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESPESASTRIBUTADAS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESPESASISENTAS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'IPI'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'OUTRASDESPESAS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'FRETE'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'ICMSR'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATUS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'FORMAPAGAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'PERCENTUALFRETE'
        Attributes = [faRequired]
        DataType = ftCurrency
      end
      item
        Name = 'FRETEAGREGADO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TRANSPORTADORA'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspOrdemCompra'
    StoreDefs = True
    Left = 392
    Top = 417
    object cdsOrdemCompraORDEMDECOMPRA: TIntegerField
      FieldName = 'ORDEMDECOMPRA'
      Origin = 'ORDEMDECOMPRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrdemCompraEMISSAO: TSQLTimeStampField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemCompraFATURAMENTO: TDateField
      FieldName = 'FATURAMENTO'
      Origin = 'FATURAMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemCompraENTREGA: TDateField
      FieldName = 'ENTREGA'
      Origin = 'ENTREGA'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemCompraPROGRAMACAO: TIntegerField
      FieldName = 'PROGRAMACAO'
      Origin = 'PROGRAMACAO'
      Required = True
    end
    object cdsOrdemCompraCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsOrdemCompraFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object cdsOrdemCompraCOMPRADOR: TIntegerField
      FieldName = 'COMPRADOR'
      Origin = 'COMPRADOR'
      Required = True
    end
    object cdsOrdemCompraVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
      Size = 30
    end
    object cdsOrdemCompraTIPOFRETE: TSmallintField
      FieldName = 'TIPOFRETE'
      Origin = 'TIPOFRETE'
      Required = True
    end
    object cdsOrdemCompraTOTALDOSPRODUTOS: TBCDField
      FieldName = 'TOTALDOSPRODUTOS'
      Origin = 'TOTALDOSPRODUTOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraTOTALDOPEDIDO: TBCDField
      FieldName = 'TOTALDOPEDIDO'
      Origin = 'TOTALDOPEDIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraDESCONTOSTRIBUTADOS: TBCDField
      FieldName = 'DESCONTOSTRIBUTADOS'
      Origin = 'DESCONTOSTRIBUTADOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraDESCONTOSISENTOS: TBCDField
      FieldName = 'DESCONTOSISENTOS'
      Origin = 'DESCONTOSISENTOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraDESPESASTRIBUTADAS: TBCDField
      FieldName = 'DESPESASTRIBUTADAS'
      Origin = 'DESPESASTRIBUTADAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraDESPESASISENTAS: TBCDField
      FieldName = 'DESPESASISENTAS'
      Origin = 'DESPESASISENTAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraIPI: TBCDField
      FieldName = 'IPI'
      Origin = 'IPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraOUTRASDESPESAS: TBCDField
      FieldName = 'OUTRASDESPESAS'
      Origin = 'OUTRASDESPESAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraFRETE: TBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraICMSR: TBCDField
      FieldName = 'ICMSR'
      Origin = 'ICMSR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemCompraOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsOrdemCompraTRANSPORTADORA: TIntegerField
      FieldName = 'TRANSPORTADORA'
      Origin = 'TRANSPORTADORA'
      Required = True
    end
    object cdsOrdemCompraDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 15
    end
    object cdsOrdemCompraSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsOrdemCompraFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
      Required = True
    end
    object cdsOrdemCompraPERCENTUALFRETE: TCurrencyField
      FieldName = 'PERCENTUALFRETE'
      Origin = 'PERCENTUALFRETE'
      Required = True
    end
    object cdsOrdemCompraFRETEAGREGADO: TSmallintField
      FieldName = 'FRETEAGREGADO'
      Origin = 'FRETEAGREGADO'
      Required = True
    end
  end
  object dspItemOrdemCompra: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemOrdemCompra
    Left = 257
    Top = 463
  end
  object cdsItemOrdemCompra: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ORDEMDECOMPRA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'EMISSAO'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'FATURAMENTO'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ENTREGA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PROGRAMACAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CFOP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'FORNECEDOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COMPRADOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VENDEDOR'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TIPOFRETE'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TOTALDOSPRODUTOS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'TOTALDOPEDIDO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCONTOSTRIBUTADOS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCONTOSISENTOS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESPESASTRIBUTADAS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESPESASISENTAS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'IPI'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'OUTRASDESPESAS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'FRETE'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'ICMSR'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
      end
      item
        Name = 'TRANSPORTADORA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATUS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'FORMAPAGAMENTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PERCENTUALFRETE'
        Attributes = [faRequired]
        DataType = ftCurrency
      end
      item
        Name = 'FRETEAGREGADO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspItemOrdemCompra'
    StoreDefs = True
    Left = 392
    Top = 463
  end
  object dspPlanoContas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPlanoContas
    Left = 257
    Top = 509
  end
  object cdsPlanoContas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PLANODECONTAS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPlanoContas'
    StoreDefs = True
    Left = 392
    Top = 509
    object cdsPlanoContasPLANODECONTAS: TIntegerField
      FieldName = 'PLANODECONTAS'
      Origin = 'PLANODECONTAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPlanoContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsPlanoContasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
  end
  object dspItemPlContas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemPlanoContas
    Left = 257
    Top = 555
  end
  object cdsItemPlContas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONTROLE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ITEMPLANODECONTAS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PLANODECONTAS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspItemPlContas'
    StoreDefs = True
    Left = 392
    Top = 555
    object cdsItemPlContasCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemPlContasITEMPLANODECONTAS: TIntegerField
      FieldName = 'ITEMPLANODECONTAS'
      Origin = 'ITEMPLANODECONTAS'
      Required = True
    end
    object cdsItemPlContasPLANODECONTAS: TIntegerField
      FieldName = 'PLANODECONTAS'
      Origin = 'PLANODECONTAS'
      Required = True
    end
    object cdsItemPlContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsItemPlContasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
  end
  object dspLancamentos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqLancamentos
    Left = 257
    Top = 604
  end
  object cdsLancamentos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'LANCAMENTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspLancamentos'
    StoreDefs = True
    Left = 392
    Top = 604
    object cdsLancamentosLANCAMENTO: TIntegerField
      FieldName = 'LANCAMENTO'
      Origin = 'LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLancamentosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsLancamentosTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
  end
  object dspDesdobRentabil: TDataSetProvider
    DataSet = dmDBEXMaster.fdqDesdob_Rentabil
    Left = 257
    Top = 648
  end
  object cdsDesdobRentabil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDesdobRentabil'
    OnCalcFields = cdsDesdobRentabilCalcFields
    Left = 392
    Top = 648
    object cdsDesdobRentabilENTRADASRENTABILIDADE: TIntegerField
      FieldName = 'ENTRADASRENTABILIDADE'
      Origin = 'ENTRADASRENTABILIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDesdobRentabilENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsDesdobRentabilPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsDesdobRentabilQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsDesdobRentabilRENDIMENTO: TCurrencyField
      FieldName = 'RENDIMENTO'
      Origin = 'RENDIMENTO'
      Required = True
      DisplayFormat = '##0.00'
    end
    object cdsDesdobRentabilRENTABILIDADE: TIntegerField
      FieldName = 'RENTABILIDADE'
      Origin = 'RENTABILIDADE'
      Required = True
    end
    object cdsDesdobRentabilSALDO_ATUAL: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'SALDO_ATUAL'
      LookupDataSet = cdsProdutoFilial
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'SALDO_TOTAL'
      KeyFields = 'PRODUTO'
      DisplayFormat = '#,##0.000'
      Lookup = True
    end
    object cdsDesdobRentabilSALDO_FUTURO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_FUTURO'
      DisplayFormat = '#,##0.000'
      Calculated = True
    end
    object cdsDesdobRentabilDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupKeyFields = 'DESCRICAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 100
      Lookup = True
    end
  end
  object dspProdutoFilial: TDataSetProvider
    DataSet = dmDBEXMaster.fdqProdutoFilial
    Left = 257
    Top = 370
  end
  object cdsProdutoFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutoFilial'
    OnCalcFields = cdsProdutoFilialCalcFields
    OnNewRecord = cdsProdutoFilialNewRecord
    Left = 392
    Top = 370
    object cdsProdutoFilialPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutoFilialFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutoFilialCUSTOBRUTO: TBCDField
      FieldName = 'CUSTOBRUTO'
      Origin = 'CUSTOBRUTO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
    end
    object cdsProdutoFilialCUSTOBRUTOANTERIOR: TBCDField
      FieldName = 'CUSTOBRUTOANTERIOR'
      Origin = 'CUSTOBRUTOANTERIOR'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
    end
    object cdsProdutoFilialCUSTOLIQUIDO: TBCDField
      FieldName = 'CUSTOLIQUIDO'
      Origin = 'CUSTOLIQUIDO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
    end
    object cdsProdutoFilialCUSTOLIQUIDOANTERIOR: TBCDField
      FieldName = 'CUSTOLIQUIDOANTERIOR'
      Origin = 'CUSTOLIQUIDOANTERIOR'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
    end
    object cdsProdutoFilialMENORPRECO: TBCDField
      FieldName = 'MENORPRECO'
      Origin = 'MENORPRECO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialPRECOCALCULADO: TBCDField
      FieldName = 'PRECOCALCULADO'
      Origin = 'PRECOCALCULADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialPRECOPROVISORIO: TBCDField
      FieldName = 'PRECOPROVISORIO'
      Origin = 'PRECOPROVISORIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialPRECODEVENDA: TBCDField
      FieldName = 'PRECODEVENDA'
      Origin = 'PRECODEVENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialPRECODEVENDAANTERIOR: TBCDField
      FieldName = 'PRECODEVENDAANTERIOR'
      Origin = 'PRECODEVENDAANTERIOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsProdutoFilialALTERACAO: TDateField
      FieldName = 'ALTERACAO'
      Origin = 'ALTERACAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsProdutoFilialREMARCACAO: TDateField
      FieldName = 'REMARCACAO'
      Origin = 'REMARCACAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsProdutoFilialLUCROICMSR: TBCDField
      FieldName = 'LUCROICMSR'
      Origin = 'LUCROICMSR'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialIMPOSTOSFEDERAIS: TBCDField
      FieldName = 'IMPOSTOSFEDERAIS'
      Origin = 'IMPOSTOSFEDERAIS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialCUSTOOPERACIONAL: TBCDField
      FieldName = 'CUSTOOPERACIONAL'
      Origin = 'CUSTOOPERACIONAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialCOMISSAOVENDA: TBCDField
      FieldName = 'COMISSAOVENDA'
      Origin = 'COMISSAOVENDA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialLUCROLIQUIDO: TBCDField
      FieldName = 'LUCROLIQUIDO'
      Origin = 'LUCROLIQUIDO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialDEPOSITO: TBCDField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialDEPOSITO1: TBCDField
      FieldName = 'DEPOSITO1'
      Origin = 'DEPOSITO1'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialLOJA: TBCDField
      FieldName = 'LOJA'
      Origin = 'LOJA'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialLOJA1: TBCDField
      FieldName = 'LOJA1'
      Origin = 'LOJA1'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialSALDOANTERIOR: TBCDField
      FieldName = 'SALDOANTERIOR'
      Origin = 'SALDOANTERIOR'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialSALDOMINIMO: TBCDField
      FieldName = 'SALDOMINIMO'
      Origin = 'SALDOMINIMO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialSALDOMAXIMO: TBCDField
      FieldName = 'SALDOMAXIMO'
      Origin = 'SALDOMAXIMO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialSETORDEBALANCA: TIntegerField
      FieldName = 'SETORDEBALANCA'
      Origin = 'SETORDEBALANCA'
    end
    object cdsProdutoFilialPRODUTOATIVO: TSmallintField
      FieldName = 'PRODUTOATIVO'
      Origin = 'PRODUTOATIVO'
      Required = True
    end
    object cdsProdutoFilialPROMOCAO: TSmallintField
      FieldName = 'PROMOCAO'
      Origin = 'PROMOCAO'
    end
    object cdsProdutoFilialTECLAASSOCIADA: TIntegerField
      FieldName = 'TECLAASSOCIADA'
      Origin = 'TECLAASSOCIADA'
    end
    object cdsProdutoFilialVALIDADE: TIntegerField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
    end
    object cdsProdutoFilialTECLADO: TSmallintField
      FieldName = 'TECLADO'
      Origin = 'TECLADO'
    end
    object cdsProdutoFilialREDUCAOBASEDECALCULO: TBCDField
      FieldName = 'REDUCAOBASEDECALCULO'
      Origin = 'REDUCAOBASEDECALCULO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutoFilialDESCONTOPROGRAMADO: TBCDField
      FieldName = 'DESCONTOPROGRAMADO'
      Origin = 'DESCONTOPROGRAMADO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialDESCRICAOCUPOMFISCAL: TStringField
      FieldName = 'DESCRICAOCUPOMFISCAL'
      Origin = 'DESCRICAOCUPOMFISCAL'
      Size = 40
    end
    object cdsProdutoFilialDESCRICAOGONDOLA1: TStringField
      FieldName = 'DESCRICAOGONDOLA1'
      Origin = 'DESCRICAOGONDOLA1'
      Size = 40
    end
    object cdsProdutoFilialDESCRICAOGONDOLA2: TStringField
      FieldName = 'DESCRICAOGONDOLA2'
      Origin = 'DESCRICAOGONDOLA2'
      Size = 40
    end
    object cdsProdutoFilialDESCRICAOBALANCA: TStringField
      FieldName = 'DESCRICAOBALANCA'
      Origin = 'DESCRICAOBALANCA'
      Size = 40
    end
    object cdsProdutoFilialDESCRICAOTIRATEIMA: TStringField
      FieldName = 'DESCRICAOTIRATEIMA'
      Origin = 'DESCRICAOTIRATEIMA'
      Size = 40
    end
    object cdsProdutoFilialENVIARPARABALANCA: TSmallintField
      FieldName = 'ENVIARPARABALANCA'
      Origin = 'ENVIARPARABALANCA'
      Required = True
    end
    object cdsProdutoFilialDESCONTONACOMPRA: TBCDField
      FieldName = 'DESCONTONACOMPRA'
      Origin = 'DESCONTONACOMPRA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutoFilialCREDITODEICMS: TBCDField
      FieldName = 'CREDITODEICMS'
      Origin = 'CREDITODEICMS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutoFilialIPI: TBCDField
      FieldName = 'IPI'
      Origin = 'IPI'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutoFilialOUTROSCUSTOS: TBCDField
      FieldName = 'OUTROSCUSTOS'
      Origin = 'OUTROSCUSTOS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutoFilialFRETE: TBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutoFilialICMSAPAGAR: TBCDField
      FieldName = 'ICMSAPAGAR'
      Origin = 'ICMSAPAGAR'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialDESCONTONAVENDA: TBCDField
      FieldName = 'DESCONTONAVENDA'
      Origin = 'DESCONTONAVENDA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialVALORDODESCONTONACOMPRA: TBCDField
      FieldName = 'VALORDODESCONTONACOMPRA'
      Origin = 'VALORDODESCONTONACOMPRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialVALORDOCREDITODEICMSR: TBCDField
      FieldName = 'VALORDOCREDITODEICMSR'
      Origin = 'VALORDOCREDITODEICMSR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialVALORDEOUTROSCUSTOS: TBCDField
      FieldName = 'VALORDEOUTROSCUSTOS'
      Origin = 'VALORDEOUTROSCUSTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialVALORDOFRETE: TBCDField
      FieldName = 'VALORDOFRETE'
      Origin = 'VALORDOFRETE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialVALORDOICMSR: TBCDField
      FieldName = 'VALORDOICMSR'
      Origin = 'VALORDOICMSR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutoFilialPRECOPROMOCAO: TBCDField
      FieldName = 'PRECOPROMOCAO'
      Origin = 'PRECOPROMOCAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialDESCONTOTABELA1: TCurrencyField
      FieldName = 'DESCONTOTABELA1'
      Origin = 'DESCONTOTABELA1'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsProdutoFilialDESCONTOTABELA2: TCurrencyField
      FieldName = 'DESCONTOTABELA2'
      Origin = 'DESCONTOTABELA2'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsProdutoFilialDESCONTOTABELA3: TCurrencyField
      FieldName = 'DESCONTOTABELA3'
      Origin = 'DESCONTOTABELA3'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsProdutoFilialVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialSUBSTITUICAOTRIBUTARIA: TCurrencyField
      FieldName = 'SUBSTITUICAOTRIBUTARIA'
      Origin = 'SUBSTITUICAOTRIBUTARIA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsProdutoFilialULTIMA_ENTRADA: TDateField
      FieldName = 'ULTIMA_ENTRADA'
      Origin = 'ULTIMA_ENTRADA'
      EditMask = '99/99/9999;0;_'
    end
    object cdsProdutoFilialSALDO_RESERVADO: TBCDField
      FieldName = 'SALDO_RESERVADO'
      Origin = 'SALDO_RESERVADO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutoFilialULTIMA_NF_ENTRADA: TStringField
      FieldName = 'ULTIMA_NF_ENTRADA'
      Origin = 'ULTIMA_NF_ENTRADA'
      Size = 10
    end
    object cdsProdutoFilialCUSTO_MEDIO: TBCDField
      FieldName = 'CUSTO_MEDIO'
      Origin = 'CUSTO_MEDIO'
      Required = True
      DisplayFormat = '#,##0.0000'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialCUSTO_MEDIO_ANTERIOR: TBCDField
      FieldName = 'CUSTO_MEDIO_ANTERIOR'
      Origin = 'CUSTO_MEDIO_ANTERIOR'
      Required = True
      DisplayFormat = '#,##0.0000'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialDATA_CUSTO_MEDIO: TDateField
      FieldName = 'DATA_CUSTO_MEDIO'
      Origin = 'DATA_CUSTO_MEDIO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsProdutoFilialDATA_CUSTO_MEDIO_ANTERIOR: TDateField
      FieldName = 'DATA_CUSTO_MEDIO_ANTERIOR'
      Origin = 'DATA_CUSTO_MEDIO_ANTERIOR'
      EditMask = '99/99/9999;0;_'
    end
    object cdsProdutoFilialPRECO_ATACADO: TBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialDESCRICAO_ATACADO: TStringField
      FieldName = 'DESCRICAO_ATACADO'
      Origin = 'DESCRICAO_ATACADO'
      Size = 44
    end
    object cdsProdutoFilialPERCENTUAL_ISS: TBCDField
      FieldName = 'PERCENTUAL_ISS'
      Origin = 'PERCENTUAL_ISS'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialPERCENTUAL_IOF: TBCDField
      FieldName = 'PERCENTUAL_IOF'
      Origin = 'PERCENTUAL_IOF'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialPERCENTUAL_CIDE: TBCDField
      FieldName = 'PERCENTUAL_CIDE'
      Origin = 'PERCENTUAL_CIDE'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoFilialSALDO_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_TOTAL'
      DisplayFormat = '#,##0.000'
      Calculated = True
    end
    object cdsProdutoFilialV_ICMS_PAGAR: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'V_ICMS_PAGAR'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsProdutoFilialV_IMPOSTOS_FEDERAIS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'V_IMPOSTOS_FEDERAIS'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsProdutoFilialV_CUSTO_OPERACIONAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'V_CUSTO_OPERACIONAL'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsProdutoFilialV_COMISSAO_VENDA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'V_COMISSAO_VENDA'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsProdutoFilialV_LUCRO_LIQUIDO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'V_LUCRO_LIQUIDO'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsProdutoFilialV_DESCONTO_VENDA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'V_DESCONTO_VENDA'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsProdutoFilialNOME_SETOR_BALANCA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_SETOR_BALANCA'
      LookupDataSet = cdsSetorBalanca
      LookupKeyFields = 'SETOR'
      LookupResultField = 'NOME'
      KeyFields = 'SETORDEBALANCA'
      Size = 40
      Lookup = True
    end
    object cdsProdutoFilialSALDO_ALMOXARIFADO: TBCDField
      FieldName = 'SALDO_ALMOXARIFADO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
  end
  object dspSubGrupo: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSubGrupo
    Left = 41
    Top = 785
  end
  object cdsSubGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubGrupo'
    Left = 147
    Top = 785
    object cdsSubGrupoSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
      Origin = 'SUBGRUPO'
      Required = True
    end
    object cdsSubGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsSubGrupoCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSubGrupoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Required = True
    end
    object cdsSubGrupoTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
    end
    object cdsSubGrupoCUSTO_OPERACIONAL: TCurrencyField
      FieldName = 'CUSTO_OPERACIONAL'
      Origin = 'CUSTO_OPERACIONAL'
      Required = True
    end
    object cdsSubGrupoLUCRO_LIQUIDO: TCurrencyField
      FieldName = 'LUCRO_LIQUIDO'
      Origin = 'LUCRO_LIQUIDO'
      Required = True
    end
    object cdsSubGrupoLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
    end
    object cdsSubGrupoCST_IPI: TSmallintField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsSubGrupoCST_ICMS: TSmallintField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
    end
    object cdsSubGrupoCST_PIS_ENTRADA: TSmallintField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsSubGrupoCST_PIS_SAIDA: TSmallintField
      FieldName = 'CST_PIS_SAIDA'
      Origin = 'CST_PIS_SAIDA'
    end
    object cdsSubGrupoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSubGrupoCST_COFINS_ENTRADA: TSmallintField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsSubGrupoCST_COFINS_SAIDA: TSmallintField
      FieldName = 'CST_COFINS_SAIDA'
      Origin = 'CST_COFINS_SAIDA'
    end
    object cdsSubGrupoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSubGrupoNATUREZA_RECEITA: TSmallintField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsSubGrupoALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSubGrupoALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSubGrupoCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = dmDBEXMaster.fdqGrupo
    Left = 41
    Top = 738
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 147
    Top = 738
    object cdsGrupoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsGrupoTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
    end
    object cdsGrupoIMPOSTOSFEDERAIS: TBCDField
      FieldName = 'IMPOSTOSFEDERAIS'
      Origin = 'IMPOSTOSFEDERAIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsGrupoCUSTOOPERACIONAL: TBCDField
      FieldName = 'CUSTOOPERACIONAL'
      Origin = 'CUSTOOPERACIONAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsGrupoLUCROLIQUIDO: TBCDField
      FieldName = 'LUCROLIQUIDO'
      Origin = 'LUCROLIQUIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsGrupoATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsGrupoLEI_PIS_COFINS: TStringField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
      Size = 300
    end
    object cdsGrupoDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsGrupoLEIS_PIS_COFINS: TIntegerField
      FieldName = 'LEIS_PIS_COFINS'
      Origin = 'LEIS_PIS_COFINS'
    end
    object cdsGrupoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsGrupoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsGrupoCST_IPI: TSmallintField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsGrupoCST_ICMS: TSmallintField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
    end
    object cdsGrupoCST_PIS_ENTRADA: TSmallintField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsGrupoCST_PIS_SAIDA: TSmallintField
      FieldName = 'CST_PIS_SAIDA'
      Origin = 'CST_PIS_SAIDA'
    end
    object cdsGrupoCST_COFINS_ENTRADA: TSmallintField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsGrupoCST_COFINS_SAIDA: TSmallintField
      FieldName = 'CST_COFINS_SAIDA'
      Origin = 'CST_COFINS_SAIDA'
    end
    object cdsGrupoNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsGrupoALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsGrupoALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsGrupoCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
  end
  object cdsSecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSecao'
    Left = 147
    Top = 830
    object cdsSecaoSECAO: TIntegerField
      FieldName = 'SECAO'
      Origin = 'SECAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSecaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsSecaoCODIGO_SETOR: TStringField
      FieldName = 'CODIGO_SETOR'
      Origin = 'CODIGO_SETOR'
      Size = 4
    end
    object cdsSecaoTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
    end
    object cdsSecaoCUSTO_OPERACIONAL: TCurrencyField
      FieldName = 'CUSTO_OPERACIONAL'
      Origin = 'CUSTO_OPERACIONAL'
      Required = True
    end
    object cdsSecaoLUCRO_LIQUIDO: TCurrencyField
      FieldName = 'LUCRO_LIQUIDO'
      Origin = 'LUCRO_LIQUIDO'
      Required = True
    end
    object cdsSecaoLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
    end
    object cdsSecaoCST_IPI: TSmallintField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsSecaoCST_ICMS: TSmallintField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
    end
    object cdsSecaoCST_PIS_ENTRADA: TSmallintField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsSecaoCST_PIS_SAIDA: TSmallintField
      FieldName = 'CST_PIS_SAIDA'
      Origin = 'CST_PIS_SAIDA'
    end
    object cdsSecaoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSecaoCST_COFINS_ENTRADA: TSmallintField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsSecaoCST_COFINS_SAIDA: TSmallintField
      FieldName = 'CST_COFINS_SAIDA'
      Origin = 'CST_COFINS_SAIDA'
    end
    object cdsSecaoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSecaoNATUREZA_RECEITA: TSmallintField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsSecaoALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSecaoALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsSecaoCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
    object cdsSecaoPERCENTUAL_ISS: TBCDField
      FieldName = 'PERCENTUAL_ISS'
      Origin = 'PERCENTUAL_ISS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSecaoPERCENTUAL_IOF: TBCDField
      FieldName = 'PERCENTUAL_IOF'
      Origin = 'PERCENTUAL_IOF'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSecaoPERCENTUAL_CIDE: TBCDField
      FieldName = 'PERCENTUAL_CIDE'
      Origin = 'PERCENTUAL_CIDE'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspSecao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSecao
    Left = 41
    Top = 830
  end
  object dspTributacao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTributacao
    Left = 257
    Top = 693
  end
  object cdsTributacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTributacao'
    Left = 392
    Top = 693
    object cdsTributacaoTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTributacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsTributacaoALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsTributacaoCODIGOECF: TStringField
      FieldName = 'CODIGOECF'
      Origin = 'CODIGOECF'
      Size = 5
    end
    object cdsTributacaoREDUCAOBASECALCULO: TCurrencyField
      FieldName = 'REDUCAOBASECALCULO'
      Origin = 'REDUCAOBASECALCULO'
      Required = True
    end
    object cdsTributacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsTributacaoCODIGO_TOTALIZADOR: TIntegerField
      FieldName = 'CODIGO_TOTALIZADOR'
      Origin = 'CODIGO_TOTALIZADOR'
    end
  end
  object dspSetorBalanca: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSetorBalanca
    Left = 257
    Top = 738
  end
  object cdsSetorBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetorBalanca'
    Left = 392
    Top = 738
    object cdsSetorBalancaSETOR: TIntegerField
      FieldName = 'SETOR'
      Origin = 'SETOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSetorBalancaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsSetorBalancaETIQUETA: TIntegerField
      FieldName = 'ETIQUETA'
      Origin = 'ETIQUETA'
    end
  end
  object dspInventario: TDataSetProvider
    DataSet = dmRelatorios.fdqInventario
    Left = 257
    Top = 785
  end
  object cdsInventario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInventario'
    Left = 392
    Top = 785
    object cdsInventarioINVENTARIO: TIntegerField
      FieldName = 'INVENTARIO'
      Origin = 'INVENTARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInventarioFILIAL: TSmallintField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsInventarioDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object cdsInventarioANODEREFERENCIA: TIntegerField
      FieldName = 'ANODEREFERENCIA'
      Origin = 'ANODEREFERENCIA'
      Required = True
    end
    object cdsInventarioVALORDOINVENTARIO: TBCDField
      FieldName = 'VALORDOINVENTARIO'
      Origin = 'VALORDOINVENTARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsInventarioTIPOCUSTOINVENTARIO: TSmallintField
      FieldName = 'TIPOCUSTOINVENTARIO'
      Origin = 'TIPOCUSTOINVENTARIO'
      Required = True
    end
    object cdsInventarioSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsInventarioVALORLIQUIDODOINVENTARIO: TBCDField
      FieldName = 'VALORLIQUIDODOINVENTARIO'
      Origin = 'VALORLIQUIDODOINVENTARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsInventarioNUMERO_ORDEM: TIntegerField
      FieldName = 'NUMERO_ORDEM'
      Origin = 'NUMERO_ORDEM'
      Required = True
    end
    object cdsInventarioMOTIVO_INVENTARIO: TSmallintField
      FieldName = 'MOTIVO_INVENTARIO'
      Origin = 'MOTIVO_INVENTARIO'
      Required = True
    end
    object cdsInventarioTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
    end
    object cdsInventarioCODIGO_AJUSTE_APURACAO: TStringField
      FieldName = 'CODIGO_AJUSTE_APURACAO'
      Origin = 'CODIGO_AJUSTE_APURACAO'
    end
    object cdsInventarioDESCRICAO_COMPLEMENTAR_AJUSTE: TStringField
      FieldName = 'DESCRICAO_COMPLEMENTAR_AJUSTE'
      Origin = 'DESCRICAO_COMPLEMENTAR_AJUSTE'
      Size = 500
    end
  end
  object cdsBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    Left = 147
    Top = 877
    object cdsBancosBANCO: TIntegerField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBancosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
  end
  object dspBancos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqBancos
    Left = 41
    Top = 877
  end
  object cdsRegInventarioP7: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegInventarioP7'
    Left = 392
    Top = 830
    object cdsRegInventarioP7ANODEREFERENCIA: TIntegerField
      FieldName = 'ANODEREFERENCIA'
      Origin = 'ANODEREFERENCIA'
      Required = True
    end
    object cdsRegInventarioP7TIPOCUSTOINVENTARIO: TSmallintField
      FieldName = 'TIPOCUSTOINVENTARIO'
      Origin = 'TIPOCUSTOINVENTARIO'
      Required = True
    end
    object cdsRegInventarioP7VALORLIQUIDODOINVENTARIO: TBCDField
      FieldName = 'VALORLIQUIDODOINVENTARIO'
      Origin = 'VALORLIQUIDODOINVENTARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsRegInventarioP7NUMERO_ORDEM: TIntegerField
      FieldName = 'NUMERO_ORDEM'
      Origin = 'NUMERO_ORDEM'
      Required = True
    end
    object cdsRegInventarioP7QUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsRegInventarioP7PRECODECUSTO: TBCDField
      FieldName = 'PRECODECUSTO'
      Origin = 'PRECODECUSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsRegInventarioP7SUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 7
    end
    object cdsRegInventarioP7DESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsRegInventarioP7UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object cdsRegInventarioP7TRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRegInventarioP7DESCRICAO_TRIBUTACAO: TStringField
      FieldName = 'DESCRICAO_TRIBUTACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsRegInventarioP7PRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsRegInventarioP7DATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdsRegInventarioP7INVENTARIO: TIntegerField
      FieldName = 'INVENTARIO'
      Required = True
    end
  end
  object dspRegInventarioP7: TDataSetProvider
    DataSet = dmRelatorios.fdqRegInventarioP7
    Left = 257
    Top = 830
  end
  object dspVendaRankingGrupo: TDataSetProvider
    DataSet = dmRelatorios.fdqVendaRankingGrupo
    Left = 257
    Top = 922
  end
  object cdsVendaRankingGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendaRankingGrupo'
    Left = 392
    Top = 922
    object cdsVendaRankingGrupoOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Origin = 'OP_BARRAS'
      Size = 14
    end
    object cdsVendaRankingGrupoOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Origin = 'OP_DESCRICAO'
      Size = 40
    end
    object cdsVendaRankingGrupoOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Origin = 'OP_UNIDADE'
      Size = 2
    end
    object cdsVendaRankingGrupoOP_GRUPO: TIntegerField
      FieldName = 'OP_GRUPO'
      Origin = 'OP_GRUPO'
    end
    object cdsVendaRankingGrupoOP_NOME_GRUPO: TStringField
      FieldName = 'OP_NOME_GRUPO'
      Origin = 'OP_NOME_GRUPO'
      Size = 40
    end
    object cdsVendaRankingGrupoOP_QUANTIDADE: TBCDField
      FieldName = 'OP_QUANTIDADE'
      Origin = 'OP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsVendaRankingGrupoOP_SUBTOTAL: TBCDField
      FieldName = 'OP_SUBTOTAL'
      Origin = 'OP_SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object cdsVendaRankingGrupoOP_VALOR_MEDIO: TBCDField
      FieldName = 'OP_VALOR_MEDIO'
      Origin = 'OP_VALOR_MEDIO'
      Precision = 18
      Size = 2
    end
  end
  object cdsAdmCartoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAdmCartoes'
    Left = 147
    Top = 922
    object cdsAdmCartoesADMINISTRADORA: TIntegerField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAdmCartoesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsAdmCartoesDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsAdmCartoesPRAZO: TSmallintField
      FieldName = 'PRAZO'
      Origin = 'PRAZO'
      Required = True
    end
    object cdsAdmCartoesBANCO: TIntegerField
      FieldName = 'BANCO'
      Origin = 'BANCO'
    end
    object cdsAdmCartoesAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Size = 10
    end
    object cdsAdmCartoesCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Size = 15
    end
    object cdsAdmCartoesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
  end
  object dspAdmCartoes: TDataSetProvider
    DataSet = dmDBEXMaster.fdqAdministradoras
    Left = 41
    Top = 922
  end
  object cdsApoioEFDContr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApoioEFDContr'
    Left = 147
    Top = 967
    object cdsApoioEFDContrPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsApoioEFDContrDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsApoioEFDContrUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsApoioEFDContrNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object cdsApoioEFDContrCST_PIS_S: TIntegerField
      FieldName = 'CST_PIS_S'
      Origin = 'CST_PIS'
    end
    object cdsApoioEFDContrCST_COFINS_S: TIntegerField
      FieldName = 'CST_COFINS_S'
      Origin = 'CST_COFINS'
    end
    object cdsApoioEFDContrCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsApoioEFDContrCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsApoioEFDContrALIQ_PIS_S: TBCDField
      FieldName = 'ALIQ_PIS_S'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsApoioEFDContrALIQ_COFINS_S: TBCDField
      FieldName = 'ALIQ_COFINS_S'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsApoioEFDContrALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object cdsApoioEFDContrALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object cdsApoioEFDContrNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsApoioEFDContrCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
  end
  object dspApoioEFDContr: TDataSetProvider
    DataSet = dmRelatorios.fdqApoioEFDContr
    Left = 41
    Top = 967
  end
  object cdsPromocao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPromocao'
    Left = 147
    Top = 1011
    object cdsPromocaoPROMOCAO: TIntegerField
      FieldName = 'PROMOCAO'
      Origin = 'PROMOCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPromocaoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsPromocaoDATA_INCIO: TDateField
      FieldName = 'DATA_INCIO'
      Origin = 'DATA_INCIO'
      Required = True
    end
    object cdsPromocaoDATA_FIM: TDateField
      FieldName = 'DATA_FIM'
      Origin = 'DATA_FIM'
      Required = True
    end
    object cdsPromocaoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsPromocaoPRECO_DE_VENDA: TBCDField
      FieldName = 'PRECO_DE_VENDA'
      Origin = 'PRECO_DE_VENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPromocaoPRECO_PROMOCAO: TBCDField
      FieldName = 'PRECO_PROMOCAO'
      Origin = 'PRECO_PROMOCAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPromocaoBARRAS: TStringField
      FieldName = 'BARRAS'
      Origin = 'BARRAS'
      Size = 14
    end
    object cdsPromocaoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object cdsPromocaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
    end
    object cdsPromocaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dspPromocao: TDataSetProvider
    DataSet = dmRelatorios.fdqPromocao
    Left = 41
    Top = 1011
  end
  object cdsApoioInventario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApoioInventario'
    OnCalcFields = cdsApoioInventarioCalcFields
    Left = 392
    Top = 967
    object cdsApoioInventarioPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsApoioInventarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsApoioInventarioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsApoioInventarioDEPOSITO: TBCDField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsApoioInventarioLOJA: TBCDField
      FieldName = 'LOJA'
      Origin = 'LOJA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsApoioInventarioCUSTOLIQUIDO: TBCDField
      FieldName = 'CUSTOLIQUIDO'
      Origin = 'CUSTOLIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsApoioInventarioSALDO_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_TOTAL'
      DisplayFormat = '#,##0.000'
      currency = False
      Calculated = True
    end
    object cdsApoioInventarioVALOR_SALDO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALOR_SALDO'
      DisplayFormat = '#,##0.00'
      currency = False
      Calculated = True
    end
  end
  object dspApoioInventario: TDataSetProvider
    DataSet = dmRelatorios.fdqApoioInventario
    Left = 257
    Top = 967
  end
  object cdsTipoItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoItem'
    Left = 147
    Top = 1055
    object cdsTipoItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTipoItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object dspTipoItem: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTipoItem
    Left = 41
    Top = 1055
  end
  object dspRegistro50: TDataSetProvider
    DataSet = dmDBEXMaster.fdqRegistro50
    Left = 257
    Top = 1011
  end
  object cdsRegistro50: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro50'
    Left = 392
    Top = 1011
    object cdsRegistro50REGISTRO50: TIntegerField
      FieldName = 'REGISTRO50'
      Origin = 'REGISTRO50'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRegistro50CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object cdsRegistro50INSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
      Size = 14
    end
    object cdsRegistro50EMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object cdsRegistro50UF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro50MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro50SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object cdsRegistro50NOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Origin = 'NOTAFISCAL'
      Size = 10
    end
    object cdsRegistro50CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object cdsRegistro50EMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'EMITENTE'
      FixedChar = True
      Size = 1
    end
    object cdsRegistro50VALOR_TOTAL: TSingleField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsRegistro50BASE_CALCULO_ICMS: TSingleField
      FieldName = 'BASE_CALCULO_ICMS'
      Origin = 'BASE_CALCULO_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsRegistro50VALOR_ICMS: TSingleField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsRegistro50ISENTA_NAO_TRIBUTADA: TSingleField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ISENTA_NAO_TRIBUTADA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsRegistro50OUTRAS: TSingleField
      FieldName = 'OUTRAS'
      Origin = 'OUTRAS'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsRegistro50ALIQUOTA: TSingleField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsRegistro50SITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsRegistro50TIPO_NOTA: TSmallintField
      FieldName = 'TIPO_NOTA'
      Origin = 'TIPO_NOTA'
      Required = True
    end
    object cdsRegistro50ENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
    end
  end
  object dspRegistro54: TDataSetProvider
    DataSet = dmDBEXMaster.fdqRegistro54
    Left = 257
    Top = 1055
  end
  object cdsRegistro54: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro54'
    Left = 392
    Top = 1055
    object cdsRegistro54REGISTRO54: TIntegerField
      FieldName = 'REGISTRO54'
      Origin = 'REGISTRO54'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRegistro54CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object cdsRegistro54MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro54SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object cdsRegistro54NOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Origin = 'NOTAFISCAL'
      Required = True
      Size = 10
    end
    object cdsRegistro54CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 4
    end
    object cdsRegistro54CST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      Size = 3
    end
    object cdsRegistro54NUMERO_ITEM: TStringField
      FieldName = 'NUMERO_ITEM'
      Origin = 'NUMERO_ITEM'
      Required = True
      Size = 3
    end
    object cdsRegistro54PRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsRegistro54QUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsRegistro54VALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54BASE_CALCULO_ICMS: TBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      Origin = 'BASE_CALCULO_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54BASE_CALCULO_ICMSR: TBCDField
      FieldName = 'BASE_CALCULO_ICMSR'
      Origin = 'BASE_CALCULO_ICMSR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54VALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54ALIQUOTA_ICMS: TCurrencyField
      FieldName = 'ALIQUOTA_ICMS'
      Origin = 'ALIQUOTA_ICMS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsRegistro54EMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object cdsRegistro54VALOR_DESCONTO_DESPESA: TBCDField
      FieldName = 'VALOR_DESCONTO_DESPESA'
      Origin = 'VALOR_DESCONTO_DESPESA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54TIPO_NOTA: TSmallintField
      FieldName = 'TIPO_NOTA'
      Origin = 'TIPO_NOTA'
      Required = True
    end
    object cdsRegistro54UF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro54TIPO_CONTABIL: TSmallintField
      FieldName = 'TIPO_CONTABIL'
      Origin = 'TIPO_CONTABIL'
      Required = True
    end
    object cdsRegistro54CODIGO_VALOR_FISCAL: TSmallintField
      FieldName = 'CODIGO_VALOR_FISCAL'
      Origin = 'CODIGO_VALOR_FISCAL'
      Required = True
    end
    object cdsRegistro54ENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
    end
    object cdsRegistro54DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsRegistro54UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object cdsCLD_NFE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCLD_NFE'
    Left = 147
    Top = 1100
    object cdsCLD_NFEPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCLD_NFEDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsCLD_NFEUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsCLD_NFEPERMITE_VENDA_FRACIONADA: TSmallintField
      FieldName = 'PERMITE_VENDA_FRACIONADA'
      Origin = 'PERMITE_VENDA_FRACIONADA'
      Required = True
    end
    object cdsCLD_NFEUNIDADE_ATACADO: TBCDField
      FieldName = 'UNIDADE_ATACADO'
      Origin = 'UNIDADE_ATACADO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsCLD_NFEVALORDODESCONTONACOMPRA: TBCDField
      FieldName = 'VALORDODESCONTONACOMPRA'
      Origin = 'VALORDODESCONTONACOMPRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFECREDITODEICMS: TBCDField
      FieldName = 'CREDITODEICMS'
      Origin = 'CREDITODEICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEVALORDOCREDITODEICMSR: TBCDField
      FieldName = 'VALORDOCREDITODEICMSR'
      Origin = 'VALORDOCREDITODEICMSR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEVALORDEOUTROSCUSTOS: TBCDField
      FieldName = 'VALORDEOUTROSCUSTOS'
      Origin = 'VALORDEOUTROSCUSTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEVALORDOFRETE: TBCDField
      FieldName = 'VALORDOFRETE'
      Origin = 'VALORDOFRETE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEVALORDOICMSR: TBCDField
      FieldName = 'VALORDOICMSR'
      Origin = 'VALORDOICMSR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFECUSTOBRUTO: TBCDField
      FieldName = 'CUSTOBRUTO'
      Origin = 'CUSTOBRUTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFECUSTOLIQUIDO: TBCDField
      FieldName = 'CUSTOLIQUIDO'
      Origin = 'CUSTOLIQUIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEICMSAPAGAR: TBCDField
      FieldName = 'ICMSAPAGAR'
      Origin = 'ICMSAPAGAR'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 3
    end
    object cdsCLD_NFEIMPOSTOSFEDERAIS: TBCDField
      FieldName = 'IMPOSTOSFEDERAIS'
      Origin = 'IMPOSTOSFEDERAIS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFECOMISSAOVENDA: TBCDField
      FieldName = 'COMISSAOVENDA'
      Origin = 'COMISSAOVENDA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFECUSTOOPERACIONAL: TBCDField
      FieldName = 'CUSTOOPERACIONAL'
      Origin = 'CUSTOOPERACIONAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFELUCROLIQUIDO: TBCDField
      FieldName = 'LUCROLIQUIDO'
      Origin = 'LUCROLIQUIDO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFEPRECODEVENDA: TBCDField
      FieldName = 'PRECODEVENDA'
      Origin = 'PRECODEVENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEPRECOCALCULADO: TBCDField
      FieldName = 'PRECOCALCULADO'
      Origin = 'PRECOCALCULADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEREMARCACAO: TDateField
      FieldName = 'REMARCACAO'
      Origin = 'REMARCACAO'
      Required = True
    end
    object cdsCLD_NFEPRECODEVENDAANTERIOR: TBCDField
      FieldName = 'PRECODEVENDAANTERIOR'
      Origin = 'PRECODEVENDAANTERIOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEALTERACAO: TDateField
      FieldName = 'ALTERACAO'
      Origin = 'ALTERACAO'
      Required = True
    end
    object cdsCLD_NFECUSTOBRUTOANTERIOR: TBCDField
      FieldName = 'CUSTOBRUTOANTERIOR'
      Origin = 'CUSTOBRUTOANTERIOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFECUSTOLIQUIDOANTERIOR: TBCDField
      FieldName = 'CUSTOLIQUIDOANTERIOR'
      Origin = 'CUSTOLIQUIDOANTERIOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEDESCONTONACOMPRA: TBCDField
      FieldName = 'DESCONTONACOMPRA'
      Origin = 'DESCONTONACOMPRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEDESCONTONAVENDA: TBCDField
      FieldName = 'DESCONTONAVENDA'
      Origin = 'DESCONTONAVENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 3
    end
    object cdsCLD_NFEDESCONTOPROGRAMADO: TBCDField
      FieldName = 'DESCONTOPROGRAMADO'
      Origin = 'DESCONTOPROGRAMADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFEDESCONTOTABELA1: TCurrencyField
      FieldName = 'DESCONTOTABELA1'
      Origin = 'DESCONTOTABELA1'
      Required = True
    end
    object cdsCLD_NFEDESCONTOTABELA2: TCurrencyField
      FieldName = 'DESCONTOTABELA2'
      Origin = 'DESCONTOTABELA2'
      Required = True
    end
    object cdsCLD_NFEDESCONTOTABELA3: TCurrencyField
      FieldName = 'DESCONTOTABELA3'
      Origin = 'DESCONTOTABELA3'
      Required = True
    end
    object cdsCLD_NFEFRETE: TBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Required = True
      Precision = 18
    end
    object cdsCLD_NFEIPI: TBCDField
      FieldName = 'IPI'
      Origin = 'IPI'
      Required = True
      Precision = 18
    end
    object cdsCLD_NFELUCROICMSR: TBCDField
      FieldName = 'LUCROICMSR'
      Origin = 'LUCROICMSR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFEMENORPRECO: TBCDField
      FieldName = 'MENORPRECO'
      Origin = 'MENORPRECO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEOUTROSCUSTOS: TBCDField
      FieldName = 'OUTROSCUSTOS'
      Origin = 'OUTROSCUSTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEPRECOPROMOCAO: TBCDField
      FieldName = 'PRECOPROMOCAO'
      Origin = 'PRECOPROMOCAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 3
    end
    object cdsCLD_NFEVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLD_NFEPRECOPROVISORIO: TBCDField
      FieldName = 'PRECOPROVISORIO'
      Origin = 'PRECOPROVISORIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsCLD_NFEFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCLD_NFELOJA: TBCDField
      FieldName = 'LOJA'
      Origin = 'LOJA'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsCLD_NFEULTIMA_ENTRADA: TDateField
      FieldName = 'ULTIMA_ENTRADA'
      Origin = 'ULTIMA_ENTRADA'
    end
  end
  object dspCLD_NFE: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCLD_NFE
    Left = 41
    Top = 1100
  end
  object cdsItemRegInventP7: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemRegInventP7'
    Left = 392
    Top = 877
    object cdsItemRegInventP7ANODEREFERENCIA: TIntegerField
      FieldName = 'ANODEREFERENCIA'
      Origin = 'ANODEREFERENCIA'
      Required = True
    end
    object cdsItemRegInventP7TIPOCUSTOINVENTARIO: TSmallintField
      FieldName = 'TIPOCUSTOINVENTARIO'
      Origin = 'TIPOCUSTOINVENTARIO'
      Required = True
    end
    object cdsItemRegInventP7VALORLIQUIDODOINVENTARIO: TBCDField
      FieldName = 'VALORLIQUIDODOINVENTARIO'
      Origin = 'VALORLIQUIDODOINVENTARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemRegInventP7NUMERO_ORDEM: TIntegerField
      FieldName = 'NUMERO_ORDEM'
      Origin = 'NUMERO_ORDEM'
      Required = True
    end
    object cdsItemRegInventP7QUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemRegInventP7PRECODECUSTO: TBCDField
      FieldName = 'PRECODECUSTO'
      Origin = 'PRECODECUSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsItemRegInventP7SUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 7
    end
    object cdsItemRegInventP7DESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsItemRegInventP7UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object cdsItemRegInventP7TRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsItemRegInventP7DESCRICAO_TRIBUTACAO: TStringField
      FieldName = 'DESCRICAO_TRIBUTACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsItemRegInventP7PRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dspItemRegInventP7: TDataSetProvider
    DataSet = dmRelatorios.fdqRegInventarioP7
    Left = 257
    Top = 877
  end
  object dspVendaProdCFOP: TDataSetProvider
    DataSet = dmRelatorios.fdqVendaProdutoCFOP
    Left = 257
    Top = 1100
  end
  object cdsVendaProdCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendaProdCFOP'
    Left = 392
    Top = 1100
    object cdsVendaProdCFOPPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsVendaProdCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsVendaProdCFOPUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsVendaProdCFOPTOT_QUANTIDADE: TBCDField
      FieldName = 'TOT_QUANTIDADE'
      Origin = 'TOT_QUANTIDADE'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsVendaProdCFOPCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsVendaProdCFOPSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaProdCFOPVL_MEDIO: TFMTBCDField
      FieldName = 'VL_MEDIO'
      Origin = 'VL_MEDIO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 5
    end
    object cdsVendaProdCFOPNOME_CFOP: TStringField
      FieldName = 'NOME_CFOP'
      Origin = 'NOME_CFOP'
      Size = 100
    end
  end
  object dspCompraProdCFOP: TDataSetProvider
    DataSet = dmRelatorios.fdqCompraProdCFOP
    Left = 41
    Top = 1146
  end
  object cdsCompraProdCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompraProdCFOP'
    Left = 147
    Top = 1146
    object cdsCompraProdCFOPPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsCompraProdCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsCompraProdCFOPUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsCompraProdCFOPTOT_QUANTIDADE: TBCDField
      FieldName = 'TOT_QUANTIDADE'
      Origin = 'TOT_QUANTIDADE'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsCompraProdCFOPCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsCompraProdCFOPNOME_CFOP: TStringField
      FieldName = 'NOME_CFOP'
      Origin = 'NOME_CFOP'
      Size = 100
    end
    object cdsCompraProdCFOPSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCompraProdCFOPVL_MEDIO: TFMTBCDField
      FieldName = 'VL_MEDIO'
      Origin = 'VL_MEDIO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 5
    end
  end
  object cdsSituacoes_OS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSituacoes_OS'
    OnNewRecord = cdsSituacoes_OSNewRecord
    Left = 392
    Top = 1146
    object cdsSituacoes_OSCODIGO_SITUACAO: TIntegerField
      FieldName = 'CODIGO_SITUACAO'
      Origin = 'CODIGO_SITUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSituacoes_OSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object cdsSituacoes_OSABERTURA_OS: TSmallintField
      FieldName = 'ABERTURA_OS'
      Origin = 'ABERTURA_OS'
      Required = True
    end
    object cdsSituacoes_OSOFICINA: TSmallintField
      FieldName = 'OFICINA'
      Origin = 'OFICINA'
      Required = True
    end
    object cdsSituacoes_OSFECHAMENTO_OS: TSmallintField
      FieldName = 'FECHAMENTO_OS'
      Origin = 'FECHAMENTO_OS'
      Required = True
    end
    object cdsSituacoes_OSCONDICAO_FECHAMENTO_OS: TSmallintField
      FieldName = 'CONDICAO_FECHAMENTO_OS'
      Origin = 'CONDICAO_FECHAMENTO_OS'
      Required = True
    end
    object cdsSituacoes_OSPRONTO: TSmallintField
      FieldName = 'PRONTO'
      Origin = 'PRONTO'
      Required = True
    end
  end
  object dspSituacoes_OS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSituacoesOS
    Left = 258
    Top = 1146
  end
  object dspEquipamentos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqEquipamentos
    Left = 41
    Top = 1191
  end
  object cdsEquipamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEquipamentos'
    OnNewRecord = cdsEquipamentosNewRecord
    Left = 146
    Top = 1191
    object cdsEquipamentosCODIGO_EQUIPAMENTO: TIntegerField
      FieldName = 'CODIGO_EQUIPAMENTO'
      Origin = 'CODIGO_EQUIPAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEquipamentosCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'CODIGO_CLIENTE'
    end
    object cdsEquipamentosMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 100
    end
    object cdsEquipamentosMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 100
    end
    object cdsEquipamentosOPERADORA: TStringField
      FieldName = 'OPERADORA'
      Origin = 'OPERADORA'
      Size = 100
    end
    object cdsEquipamentosNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Origin = 'NUMERO_SERIE'
      Size = 100
    end
    object cdsEquipamentosETIQ_PATRIMONIO: TStringField
      FieldName = 'ETIQ_PATRIMONIO'
      Origin = 'ETIQ_PATRIMONIO'
      Size = 100
    end
    object cdsEquipamentosOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object cdsEquipamentosDATA_COMPRA: TDateField
      FieldName = 'DATA_COMPRA'
      Origin = 'DATA_COMPRA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsEquipamentosREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'REVENDA'
      Size = 100
    end
    object cdsEquipamentosNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = 'NUMERO_NF'
    end
    object cdsEquipamentosNUMERO_CERTIFICADO_GARANTIA: TStringField
      FieldName = 'NUMERO_CERTIFICADO_GARANTIA'
      Origin = 'NUMERO_CERTIFICADO_GARANTIA'
      Size = 100
    end
    object cdsEquipamentosNOME_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CLIENTE'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'CODIGO_CLIENTE'
      Size = 100
      Lookup = True
    end
    object cdsEquipamentosDDD_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'DDD_CLIENTE'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'DDD'
      KeyFields = 'CODIGO_CLIENTE'
      Size = 3
      Lookup = True
    end
    object cdsEquipamentosTELEFONE_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'TELEFONE_CLIENTE'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'TELEFONE1'
      KeyFields = 'CODIGO_CLIENTE'
      Size = 15
      Lookup = True
    end
    object cdsEquipamentosCODIGO_PRODUCAO: TIntegerField
      FieldName = 'CODIGO_PRODUCAO'
      Origin = 'CODIGO_PRODUCAO'
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = dmDBEXMaster.fdqClientes
    Left = 258
    Top = 1191
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    OnNewRecord = cdsClientesNewRecord
    Left = 392
    Top = 1191
    object cdsClientesCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object cdsClientesFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 30
    end
    object cdsClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsClientesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
    end
    object cdsClientesCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object cdsClientesNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '99.999-999;0;_'
      Size = 9
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object cdsClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 30
    end
    object cdsClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 30
    end
    object cdsClientesHTTP: TStringField
      FieldName = 'HTTP'
      Origin = 'HTTP'
      Size = 50
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object cdsClientesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsClientesDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      FixedChar = True
      Size = 5
    end
    object cdsClientesTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Origin = 'TELEFONE1'
      Size = 15
    end
    object cdsClientesTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Origin = 'TELEFONE2'
      Size = 15
    end
    object cdsClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object cdsClientesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object cdsClientesNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
    end
    object cdsClientesRENDA: TBCDField
      FieldName = 'RENDA'
      Origin = 'RENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesLIMITEDECREDITO: TBCDField
      FieldName = 'LIMITEDECREDITO'
      Origin = 'LIMITEDECREDITO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesSALDODEVEDOR: TBCDField
      FieldName = 'SALDODEVEDOR'
      Origin = 'SALDODEVEDOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsClientesBARRAS: TStringField
      FieldName = 'BARRAS'
      Origin = 'BARRAS'
      Size = 13
    end
    object cdsClientesENDERECOENTREGA: TStringField
      FieldName = 'ENDERECOENTREGA'
      Origin = 'ENDERECOENTREGA'
      Required = True
      Size = 40
    end
    object cdsClientesNUMEROENTREGA: TIntegerField
      FieldName = 'NUMEROENTREGA'
      Origin = 'NUMEROENTREGA'
    end
    object cdsClientesCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      Origin = 'CEPENTREGA'
      EditMask = '99.999-999;0;_'
      Size = 9
    end
    object cdsClientesBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Origin = 'BAIRROENTREGA'
      Size = 30
    end
    object cdsClientesESTADOENTREGA: TStringField
      FieldName = 'ESTADOENTREGA'
      Origin = 'ESTADOENTREGA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesENDERECOCOBRANCA: TStringField
      FieldName = 'ENDERECOCOBRANCA'
      Origin = 'ENDERECOCOBRANCA'
      Required = True
      Size = 40
    end
    object cdsClientesNUMEROCOBRANCA: TIntegerField
      FieldName = 'NUMEROCOBRANCA'
      Origin = 'NUMEROCOBRANCA'
    end
    object cdsClientesCEPCOBRANCA: TStringField
      FieldName = 'CEPCOBRANCA'
      Origin = 'CEPCOBRANCA'
      EditMask = '99.999-999;0;_'
      Size = 9
    end
    object cdsClientesBAIRROCOBRANCA: TStringField
      FieldName = 'BAIRROCOBRANCA'
      Origin = 'BAIRROCOBRANCA'
      Size = 30
    end
    object cdsClientesESTADOCOBRANCA: TStringField
      FieldName = 'ESTADOCOBRANCA'
      Origin = 'ESTADOCOBRANCA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesPONTODEREFERENCIA: TStringField
      FieldName = 'PONTODEREFERENCIA'
      Origin = 'PONTODEREFERENCIA'
      Size = 40
    end
    object cdsClientesVALIDADEDOCREDITO: TDateField
      FieldName = 'VALIDADEDOCREDITO'
      Origin = 'VALIDADEDOCREDITO'
    end
    object cdsClientesTIPODECREDITO: TSmallintField
      FieldName = 'TIPODECREDITO'
      Origin = 'TIPODECREDITO'
      Required = True
    end
    object cdsClientesDATACONSULTASPC: TDateField
      FieldName = 'DATACONSULTASPC'
      Origin = 'DATACONSULTASPC'
    end
    object cdsClientesFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object cdsClientesULTIPOPEDIDO: TIntegerField
      FieldName = 'ULTIPOPEDIDO'
      Origin = 'ULTIPOPEDIDO'
    end
    object cdsClientesDATAULTIMOPEDIDO: TDateField
      FieldName = 'DATAULTIMOPEDIDO'
      Origin = 'DATAULTIMOPEDIDO'
    end
    object cdsClientesVALORULTIMOPEDIDO: TBCDField
      FieldName = 'VALORULTIMOPEDIDO'
      Origin = 'VALORULTIMOPEDIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesULTIMANF: TStringField
      FieldName = 'ULTIMANF'
      Origin = 'ULTIMANF'
      Size = 15
    end
    object cdsClientesDATAULTIMANF: TDateField
      FieldName = 'DATAULTIMANF'
      Origin = 'DATAULTIMANF'
    end
    object cdsClientesVALORULTIMANF: TBCDField
      FieldName = 'VALORULTIMANF'
      Origin = 'VALORULTIMANF'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesULTIMOCHQUEDEVOLVIDO: TStringField
      FieldName = 'ULTIMOCHQUEDEVOLVIDO'
      Origin = 'ULTIMOCHQUEDEVOLVIDO'
      FixedChar = True
      Size = 15
    end
    object cdsClientesDATAULTIMOCHEQUEDEVOLVIDO: TDateField
      FieldName = 'DATAULTIMOCHEQUEDEVOLVIDO'
      Origin = 'DATAULTIMOCHEQUEDEVOLVIDO'
    end
    object cdsClientesVALORULTIMOCHEQUEDEVOLVIDO: TBCDField
      FieldName = 'VALORULTIMOCHEQUEDEVOLVIDO'
      Origin = 'VALORULTIMOCHEQUEDEVOLVIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesMOTIVODEVOLUCAO: TStringField
      FieldName = 'MOTIVODEVOLUCAO'
      Origin = 'MOTIVODEVOLUCAO'
      FixedChar = True
      Size = 4
    end
    object cdsClientesCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
    end
    object cdsClientesCIDADEENTREGA: TIntegerField
      FieldName = 'CIDADEENTREGA'
      Origin = 'CIDADEENTREGA'
    end
    object cdsClientesCIDADECOBRANCA: TIntegerField
      FieldName = 'CIDADECOBRANCA'
      Origin = 'CIDADECOBRANCA'
    end
    object cdsClientesATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsClientesPAI: TStringField
      FieldName = 'PAI'
      Origin = 'PAI'
      Size = 40
    end
    object cdsClientesMAE: TStringField
      FieldName = 'MAE'
      Origin = 'MAE'
      Size = 40
    end
    object cdsClientesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 40
    end
    object cdsClientesTELEFONEEMPRESA1: TStringField
      FieldName = 'TELEFONEEMPRESA1'
      Origin = 'TELEFONEEMPRESA1'
      Size = 15
    end
    object cdsClientesTELEFONEEMPRESA2: TStringField
      FieldName = 'TELEFONEEMPRESA2'
      Origin = 'TELEFONEEMPRESA2'
      Size = 15
    end
    object cdsClientesRAMAL: TStringField
      FieldName = 'RAMAL'
      Origin = 'RAMAL'
      Size = 4
    end
    object cdsClientesCONTATOEMPRESA: TStringField
      FieldName = 'CONTATOEMPRESA'
      Origin = 'CONTATOEMPRESA'
      Size = 30
    end
    object cdsClientesREFERENCIAPESSOAL1: TStringField
      FieldName = 'REFERENCIAPESSOAL1'
      Origin = 'REFERENCIAPESSOAL1'
      Size = 40
    end
    object cdsClientesREFERENCIAPESSOAL2: TStringField
      FieldName = 'REFERENCIAPESSOAL2'
      Origin = 'REFERENCIAPESSOAL2'
      Size = 40
    end
    object cdsClientesREFERENCIAPESSOAL3: TStringField
      FieldName = 'REFERENCIAPESSOAL3'
      Origin = 'REFERENCIAPESSOAL3'
      Size = 40
    end
    object cdsClientesTELEFONEREFERENCIA1: TStringField
      FieldName = 'TELEFONEREFERENCIA1'
      Origin = 'TELEFONEREFERENCIA1'
      Size = 15
    end
    object cdsClientesTELEFONEREFERENCIA2: TStringField
      FieldName = 'TELEFONEREFERENCIA2'
      Origin = 'TELEFONEREFERENCIA2'
      Size = 15
    end
    object cdsClientesTELEFONEREFERENCIA3: TStringField
      FieldName = 'TELEFONEREFERENCIA3'
      Origin = 'TELEFONEREFERENCIA3'
      Size = 15
    end
    object cdsClientesSEXO: TSmallintField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Required = True
    end
    object cdsClientesESTADOCIVIL: TSmallintField
      FieldName = 'ESTADOCIVIL'
      Origin = 'ESTADOCIVIL'
      Required = True
    end
    object cdsClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Origin = 'CONJUGE'
      Size = 40
    end
    object cdsClientesPOSSUIDEPENDENTES: TSmallintField
      FieldName = 'POSSUIDEPENDENTES'
      Origin = 'POSSUIDEPENDENTES'
      Required = True
    end
    object cdsClientesQUANTIDADEDEPENDENTES: TSmallintField
      FieldName = 'QUANTIDADEDEPENDENTES'
      Origin = 'QUANTIDADEDEPENDENTES'
    end
    object cdsClientesDEPENDENTES: TMemoField
      FieldName = 'DEPENDENTES'
      Origin = 'DEPENDENTES'
      BlobType = ftMemo
    end
    object cdsClientesTEMPODEEMPRESA: TBCDField
      FieldName = 'TEMPODEEMPRESA'
      Origin = 'TEMPODEEMPRESA'
      Precision = 18
      Size = 2
    end
    object cdsClientesTIPOTEMPOEMPRESA: TSmallintField
      FieldName = 'TIPOTEMPOEMPRESA'
      Origin = 'TIPOTEMPOEMPRESA'
      Required = True
    end
    object cdsClientesREFERENCIACOMERCIAL1: TStringField
      FieldName = 'REFERENCIACOMERCIAL1'
      Origin = 'REFERENCIACOMERCIAL1'
      Size = 40
    end
    object cdsClientesREFERENCIACOMERCIAL2: TStringField
      FieldName = 'REFERENCIACOMERCIAL2'
      Origin = 'REFERENCIACOMERCIAL2'
      Size = 40
    end
    object cdsClientesREFERENCIACOMERCIAL3: TStringField
      FieldName = 'REFERENCIACOMERCIAL3'
      Origin = 'REFERENCIACOMERCIAL3'
      Size = 40
    end
    object cdsClientesTELEFONEREFCOMERCIAL1: TStringField
      FieldName = 'TELEFONEREFCOMERCIAL1'
      Origin = 'TELEFONEREFCOMERCIAL1'
      Size = 15
    end
    object cdsClientesTELEFONEREFCOMERCIAL2: TStringField
      FieldName = 'TELEFONEREFCOMERCIAL2'
      Origin = 'TELEFONEREFCOMERCIAL2'
      Size = 15
    end
    object cdsClientesTELEFONEREFCOMERCIAL3: TStringField
      FieldName = 'TELEFONEREFCOMERCIAL3'
      Origin = 'TELEFONEREFCOMERCIAL3'
      Size = 15
    end
    object cdsClientesCONTATOREFCOMERCIAL1: TStringField
      FieldName = 'CONTATOREFCOMERCIAL1'
      Origin = 'CONTATOREFCOMERCIAL1'
    end
    object cdsClientesCONTATOREFCOMERCIAL2: TStringField
      FieldName = 'CONTATOREFCOMERCIAL2'
      Origin = 'CONTATOREFCOMERCIAL2'
    end
    object cdsClientesCONTATOREFCOMERCIAL3: TStringField
      FieldName = 'CONTATOREFCOMERCIAL3'
      Origin = 'CONTATOREFCOMERCIAL3'
    end
    object cdsClientesLIBERARVENDAACIMALIMITE: TSmallintField
      FieldName = 'LIBERARVENDAACIMALIMITE'
      Origin = 'LIBERARVENDAACIMALIMITE'
      Required = True
    end
    object cdsClientesVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
    end
    object cdsClientesCLIENTE2: TIntegerField
      FieldName = 'CLIENTE2'
      Origin = 'CLIENTE2'
    end
    object cdsClientesMODELO_TABELA_PRECOVENDA: TSmallintField
      FieldName = 'MODELO_TABELA_PRECOVENDA'
      Origin = 'MODELO_TABELA_PRECOVENDA'
      Required = True
    end
    object cdsClientesSOCIO: TSmallintField
      FieldName = 'SOCIO'
      Origin = 'SOCIO'
      Required = True
    end
    object cdsClientesCONTRIBUICAO: TBCDField
      FieldName = 'CONTRIBUICAO'
      Origin = 'CONTRIBUICAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesNUMERO_CARTAO: TStringField
      FieldName = 'NUMERO_CARTAO'
      Origin = 'NUMERO_CARTAO'
      Size = 100
    end
    object cdsClientesEMISSAO_CARTAO: TDateField
      FieldName = 'EMISSAO_CARTAO'
      Origin = 'EMISSAO_CARTAO'
    end
    object cdsClientesDATA_VALIDADE_CARTAO: TDateField
      FieldName = 'DATA_VALIDADE_CARTAO'
      Origin = 'DATA_VALIDADE_CARTAO'
    end
    object cdsClientesDESCONTO_PERSONALIZADO: TBCDField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsClientesFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
    end
    object cdsClientesUSUARIO_NFE: TSmallintField
      FieldName = 'USUARIO_NFE'
      Origin = 'USUARIO_NFE'
      Required = True
    end
    object cdsClientesPAIS: TIntegerField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
    end
    object cdsClientesINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Origin = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
    object cdsClientesNOME_CIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CIDADE'
      LookupDataSet = cdsCidades
      LookupKeyFields = 'CIDADE'
      LookupResultField = 'NOME'
      KeyFields = 'CIDADE'
      Size = 80
      Lookup = True
    end
    object cdsClientesNOME_CIDADE_ENTREGA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CIDADE_ENTREGA'
      LookupDataSet = cdsCidades
      LookupKeyFields = 'CIDADE'
      LookupResultField = 'NOME'
      KeyFields = 'CIDADEENTREGA'
      Size = 40
      Lookup = True
    end
    object cdsClientesGARANTIDOR_OS: TSmallintField
      FieldName = 'GARANTIDOR_OS'
      Origin = 'GARANTIDOR_OS'
      Required = True
    end
    object cdsClientesCONTRIBUINTE_ICMS: TSmallintField
      FieldName = 'CONTRIBUINTE_ICMS'
      Origin = 'CONTRIBUINTE_ICMS'
      Required = True
    end
    object cdsClientesNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsClientesNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsClientesCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsClientesCODIGO_ESTADO_IBGE: TIntegerField
      FieldName = 'CODIGO_ESTADO_IBGE'
      Origin = 'CODIGO_ESTADO_IBGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsClientesEND_ENTR_COBR_IGUAL_END: TSmallintField
      FieldName = 'END_ENTR_COBR_IGUAL_END'
      Required = True
    end
  end
  object dspOrdemServico: TDataSetProvider
    DataSet = dmDBEXMaster.fdqOrdemServico
    Left = 41
    Top = 1233
  end
  object cdsOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdemServico'
    OnCalcFields = cdsOrdemServicoCalcFields
    OnNewRecord = cdsOrdemServicoNewRecord
    Left = 146
    Top = 1234
    object cdsOrdemServicoORDEM_DE_SERVICO: TIntegerField
      FieldName = 'ORDEM_DE_SERVICO'
      Origin = 'ORDEM_DE_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrdemServicoCODIGO_SITUACAO: TIntegerField
      FieldName = 'CODIGO_SITUACAO'
      Origin = 'CODIGO_SITUACAO'
      Required = True
    end
    object cdsOrdemServicoCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object cdsOrdemServicoVALOR_MAO_DE_OBRA: TBCDField
      FieldName = 'VALOR_MAO_DE_OBRA'
      Origin = 'VALOR_MAO_DE_OBRA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVALOR_PECAS: TBCDField
      FieldName = 'VALOR_PECAS'
      Origin = 'VALOR_PECAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVALOR_DESLOCAMENTO: TBCDField
      FieldName = 'VALOR_DESLOCAMENTO'
      Origin = 'VALOR_DESLOCAMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVALOR_TERCEIRO: TBCDField
      FieldName = 'VALOR_TERCEIRO'
      Origin = 'VALOR_TERCEIRO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVALOR_OUTROS: TBCDField
      FieldName = 'VALOR_OUTROS'
      Origin = 'VALOR_OUTROS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoCODIGO_EQUIPAMENTO: TIntegerField
      FieldName = 'CODIGO_EQUIPAMENTO'
      Origin = 'CODIGO_EQUIPAMENTO'
    end
    object cdsOrdemServicoAPARELHO: TStringField
      FieldName = 'APARELHO'
      Origin = 'APARELHO'
      Size = 100
    end
    object cdsOrdemServicoMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 100
    end
    object cdsOrdemServicoMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 100
    end
    object cdsOrdemServicoNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Origin = 'NUMERO_SERIE'
      Size = 100
    end
    object cdsOrdemServicoETIQ_PATRIMONIO: TStringField
      FieldName = 'ETIQ_PATRIMONIO'
      Origin = 'ETIQ_PATRIMONIO'
      Size = 100
    end
    object cdsOrdemServicoACESSORIO: TStringField
      FieldName = 'ACESSORIO'
      Origin = 'ACESSORIO'
      Size = 254
    end
    object cdsOrdemServicoDEFEITO: TMemoField
      FieldName = 'DEFEITO'
      Origin = 'DEFEITO'
      BlobType = ftMemo
    end
    object cdsOrdemServicoOBS_SERVICO: TMemoField
      FieldName = 'OBS_SERVICO'
      Origin = 'OBS_SERVICO'
      BlobType = ftMemo
    end
    object cdsOrdemServicoLAUDO: TMemoField
      FieldName = 'LAUDO'
      Origin = 'LAUDO'
      BlobType = ftMemo
    end
    object cdsOrdemServicoOBSERVACAO_APARELHO: TStringField
      FieldName = 'OBSERVACAO_APARELHO'
      Origin = 'OBSERVACAO_APARELHO'
      Size = 254
    end
    object cdsOrdemServicoKILOMETRO: TIntegerField
      FieldName = 'KILOMETRO'
      Origin = 'KILOMETRO'
    end
    object cdsOrdemServicoNUMERO_NF_PEDIDO: TStringField
      FieldName = 'NUMERO_NF_PEDIDO'
      Origin = 'NUMERO_NF_PEDIDO'
      Size = 10
    end
    object cdsOrdemServicoEM_USO: TSmallintField
      FieldName = 'EM_USO'
      Origin = 'EM_USO'
      Required = True
    end
    object cdsOrdemServicoNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = 'NUMERO_NF'
      Size = 10
    end
    object cdsOrdemServicoOS_REABERTA: TSmallintField
      FieldName = 'OS_REABERTA'
      Origin = 'OS_REABERTA'
      Required = True
    end
    object cdsOrdemServicoOS_OUTROS: TBCDField
      FieldName = 'OS_OUTROS'
      Origin = 'OS_OUTROS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoOS_OUTROS_EMIT: TBCDField
      FieldName = 'OS_OUTROS_EMIT'
      Origin = 'OS_OUTROS_EMIT'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVALOR_SINAL: TBCDField
      FieldName = 'VALOR_SINAL'
      Origin = 'VALOR_SINAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoPRIORIDADE: TSmallintField
      FieldName = 'PRIORIDADE'
      Origin = 'PRIORIDADE'
      Required = True
    end
    object cdsOrdemServicoNF_REMESSA: TStringField
      FieldName = 'NF_REMESSA'
      Origin = 'NF_REMESSA'
      Size = 10
    end
    object cdsOrdemServicoVALOR_NF: TBCDField
      FieldName = 'VALOR_NF'
      Origin = 'VALOR_NF'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoNF_EMITENTE: TStringField
      FieldName = 'NF_EMITENTE'
      Origin = 'NF_EMITENTE'
      Size = 10
    end
    object cdsOrdemServicoGARANTIDOR: TIntegerField
      FieldName = 'GARANTIDOR'
      Origin = 'GARANTIDOR'
    end
    object cdsOrdemServicoNUMER_SERIE_GARANTIDOR: TStringField
      FieldName = 'NUMER_SERIE_GARANTIDOR'
      Origin = 'NUMER_SERIE_GARANTIDOR'
      Size = 100
    end
    object cdsOrdemServicoVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoVALOR_SEGURO: TBCDField
      FieldName = 'VALOR_SEGURO'
      Origin = 'VALOR_SEGURO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoUSUARIO_MICRO: TStringField
      FieldName = 'USUARIO_MICRO'
      Origin = 'USUARIO_MICRO'
      Size = 200
    end
    object cdsOrdemServicoORCA_FORMAS: TMemoField
      FieldName = 'ORCA_FORMAS'
      Origin = 'ORCA_FORMAS'
      BlobType = ftMemo
    end
    object cdsOrdemServicoALERTA_ABANDONO: TDateField
      FieldName = 'ALERTA_ABANDONO'
      Origin = 'ALERTA_ABANDONO'
    end
    object cdsOrdemServicoHORA_ABANDONO: TTimeField
      FieldName = 'HORA_ABANDONO'
      Origin = 'HORA_ABANDONO'
    end
    object cdsOrdemServicoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object cdsOrdemServicoOS_FABRICANTE: TStringField
      FieldName = 'OS_FABRICANTE'
      Origin = 'OS_FABRICANTE'
    end
    object cdsOrdemServicoNFC_NUMERO: TIntegerField
      FieldName = 'NFC_NUMERO'
      Origin = 'NFC_NUMERO'
    end
    object cdsOrdemServicoNOME_FUNCIOANARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FUNCIOANARIO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 100
      Lookup = True
    end
    object cdsOrdemServicoDESCRICAO_SITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_SITUACAO'
      LookupDataSet = cdsSituacoes_OS
      LookupKeyFields = 'CODIGO_SITUACAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGO_SITUACAO'
      Size = 100
      Lookup = True
    end
    object cdsOrdemServicoVALOR_TOTAL_OS: TBCDField
      FieldName = 'VALOR_TOTAL_OS'
      Origin = 'VALOR_TOTAL_OS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoTOTAL_HORAS: TBCDField
      FieldName = 'TOTAL_HORAS'
      Origin = 'TOTAL_HORAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsOrdemServicoDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemServicoDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      Origin = 'DATA_TERMINO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemServicoDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemServicoDATA_GARANTIA: TDateField
      FieldName = 'DATA_GARANTIA'
      Origin = 'DATA_GARANTIA'
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemServicoDATA_PREVISTO: TDateField
      FieldName = 'DATA_PREVISTO'
      Origin = 'DATA_PREVISTO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsOrdemServicoS_PRIORIDADE: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_PRIORIDADE'
      Size = 15
      Calculated = True
    end
    object cdsOrdemServicoHORA_ENTRADA: TTimeField
      FieldName = 'HORA_ENTRADA'
      Origin = 'HORA_ENTRADA'
      EditMask = '99:99;0;_'
    end
    object cdsOrdemServicoHORA_TERMINO: TTimeField
      FieldName = 'HORA_TERMINO'
      Origin = 'HORA_TERMINO'
      EditMask = '99:99;0;_'
    end
    object cdsOrdemServicoHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
      EditMask = '99:99;0;_'
    end
    object cdsOrdemServicoHORA_GARANTIA: TTimeField
      FieldName = 'HORA_GARANTIA'
      Origin = 'HORA_GARANTIA'
      EditMask = '99:99;0;_'
    end
    object cdsOrdemServicoHORA_PREVISTO: TTimeField
      FieldName = 'HORA_PREVISTO'
      Origin = 'HORA_PREVISTO'
      EditMask = '99:99;0;_'
    end
    object cdsOrdemServicoDESCRICAO_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_STATUS'
      Size = 10
      Calculated = True
    end
    object cdsOrdemServicoCODIGO_PRODUCAO: TIntegerField
      FieldName = 'CODIGO_PRODUCAO'
      Origin = 'CODIGO_PRODUCAO'
    end
    object cdsOrdemServicoCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Origin = 'CNPJ_CPF'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 15
    end
    object cdsOrdemServicoIE_RG: TStringField
      FieldName = 'IE_RG'
      Origin = 'IE_RG'
    end
    object cdsOrdemServicoENDERECO_CLIENTE: TStringField
      FieldName = 'ENDERECO_CLIENTE'
      Origin = 'ENDERECO_CLIENTE'
      Size = 40
    end
    object cdsOrdemServicoNUMERO_END_CLIENTE: TStringField
      FieldName = 'NUMERO_END_CLIENTE'
      Origin = 'NUMERO_END_CLIENTE'
    end
    object cdsOrdemServicoCEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      Origin = 'CEP_CLIENTE'
      EditMask = '99999-999;0;_'
      Size = 10
    end
    object cdsOrdemServicoBAIRRO_CLIENTE: TStringField
      FieldName = 'BAIRRO_CLIENTE'
      Origin = 'BAIRRO_CLIENTE'
      Size = 30
    end
    object cdsOrdemServicoCIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      Origin = 'CIDADE_CLIENTE'
      Size = 30
    end
    object cdsOrdemServicoDDD_CLIENTE: TStringField
      FieldName = 'DDD_CLIENTE'
      Origin = 'DDD_CLIENTE'
      Size = 3
    end
    object cdsOrdemServicoTELEFONE_CLIENTE: TStringField
      FieldName = 'TELEFONE_CLIENTE'
      Origin = 'TELEFONE_CLIENTE'
      Size = 12
    end
    object cdsOrdemServicoEMAIL_CLIENTE: TStringField
      FieldName = 'EMAIL_CLIENTE'
      Origin = 'EMAIL_CLIENTE'
      Size = 200
    end
    object cdsOrdemServicoUF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      Origin = 'UF_CLIENTE'
      Size = 2
    end
    object cdsOrdemServicoCONTATO_CLIENTE: TStringField
      FieldName = 'CONTATO_CLIENTE'
      Origin = 'CONTATO_CLIENTE'
    end
    object cdsOrdemServicoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 40
    end
  end
  object cdsFSituacaoPesq_OS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFSituacaoPesq_OS'
    Left = 146
    Top = 1283
    object cdsFSituacaoPesq_OSCODIGO_SITUACAO: TIntegerField
      FieldName = 'CODIGO_SITUACAO'
      Origin = 'CODIGO_SITUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFSituacaoPesq_OSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object dspFSituacaoPesq_OS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSituacoesOS
    Left = 41
    Top = 1283
  end
  object cdsFGarantidor_OS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFGarantidor_OS'
    Left = 146
    Top = 1326
    object cdsFGarantidor_OSCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFGarantidor_OSRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
  end
  object dspFGarantidor_OS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqClientes
    Left = 41
    Top = 1326
  end
  object dspItem_OS_Servico: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItens_OS_Servicos
    Left = 257
    Top = 1234
  end
  object cdsItens_OS_servico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItem_OS_servico'
    OnCalcFields = cdsItens_OS_servicoCalcFields
    OnNewRecord = cdsItens_OS_servicoNewRecord
    Left = 392
    Top = 1235
    object cdsItens_OS_servicoITENS_OS_SERVICOS: TIntegerField
      FieldName = 'ITENS_OS_SERVICOS'
      Origin = 'ITENS_OS_SERVICOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItens_OS_servicoORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO'
    end
    object cdsItens_OS_servicoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsItens_OS_servicoVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_CUSTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItens_OS_servicoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object cdsItens_OS_servicoTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsItens_OS_servicoCODIGO_SERVICO: TIntegerField
      FieldName = 'CODIGO_SERVICO'
      Origin = 'CODIGO_SERVICO'
    end
    object cdsItens_OS_servicoQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItens_OS_servicoCUSTO_TOTAL: TBCDField
      FieldName = 'CUSTO_TOTAL'
      Origin = 'CUSTO_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItens_OS_servicoX_PED: TStringField
      FieldName = 'X_PED'
      Origin = 'X_PED'
      Size = 15
    end
    object cdsItens_OS_servicoN_ITEM_PED: TStringField
      FieldName = 'N_ITEM_PED'
      Origin = 'N_ITEM_PED'
      Size = 6
    end
    object cdsItens_OS_servicoNOME_TECNICO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_TECNICO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 100
      Lookup = True
    end
    object cdsItens_OS_servicoDESCRICAO_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_TIPO'
      Size = 10
      Calculated = True
    end
    object cdsItens_OS_servicoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsItens_OS_servicoHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'HORA_INICIO'
      EditMask = '99:99;0;_'
    end
    object cdsItens_OS_servicoDATA_FIM: TDateField
      FieldName = 'DATA_FIM'
      Origin = 'DATA_FIM'
      EditMask = '99/99/9999;0;_'
    end
    object cdsItens_OS_servicoHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
      Origin = 'HORA_FIM'
      EditMask = '99:99;0;_'
    end
    object cdsItens_OS_servicoTIPO_COBRANCA: TSmallintField
      FieldName = 'TIPO_COBRANCA'
      Origin = 'TIPO_COBRANCA'
      Required = True
    end
    object cdsItens_OS_servicoUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
    end
    object cdsItens_OS_servicoNOME_USUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_USUARIO'
      LookupDataSet = cdsUsuarios
      LookupKeyFields = 'USUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'USUARIO'
      Size = 30
      Lookup = True
    end
  end
  object cdsItens_OS_Pecas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItem_OS_Pecas'
    OnCalcFields = cdsItens_OS_PecasCalcFields
    OnNewRecord = cdsItens_OS_PecasNewRecord
    Left = 392
    Top = 1283
    object cdsItens_OS_PecasITENS_OS_PECAS: TIntegerField
      FieldName = 'ITENS_OS_PECAS'
      Origin = 'ITENS_OS_PECAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItens_OS_PecasORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItens_OS_PecasCODIGO_PECA: TIntegerField
      FieldName = 'CODIGO_PECA'
      Origin = 'CODIGO_PECA'
    end
    object cdsItens_OS_PecasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsItens_OS_PecasVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItens_OS_PecasQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItens_OS_PecasDIA: TSQLTimeStampField
      FieldName = 'DIA'
      Origin = 'DIA'
    end
    object cdsItens_OS_PecasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItens_OS_PecasX_PED: TStringField
      FieldName = 'X_PED'
      Origin = 'X_PED'
      Size = 15
    end
    object cdsItens_OS_PecasN_ITEM_PED: TStringField
      FieldName = 'N_ITEM_PED'
      Origin = 'N_ITEM_PED'
      Size = 6
    end
    object cdsItens_OS_PecasNUMERO_SERIE: TMemoField
      FieldName = 'NUMERO_SERIE'
      Origin = 'NUMERO_SERIE'
      BlobType = ftMemo
    end
    object cdsItens_OS_PecasCODIGO_BAIXA: TIntegerField
      FieldName = 'CODIGO_BAIXA'
      Origin = 'CODIGO_BAIXA'
    end
    object cdsItens_OS_PecasNOME_TECNICO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_TECNICO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 100
      Lookup = True
    end
    object cdsItens_OS_PecasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsItens_OS_PecasDESCRICAO_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_TIPO'
      Size = 10
      Calculated = True
    end
    object cdsItens_OS_PecasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
    end
    object cdsItens_OS_PecasNOME_USURIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_USURIO'
      LookupDataSet = cdsUsuarios
      LookupKeyFields = 'USUARIO'
      LookupResultField = 'NOME'
      KeyFields = 'USUARIO'
      Size = 30
      Lookup = True
    end
    object cdsItens_OS_PecasSTATUS_SALDO: TSmallintField
      FieldName = 'STATUS_SALDO'
      Origin = 'STATUS_SALDO'
      Required = True
    end
    object cdsItens_OS_PecasFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
  end
  object dspItem_OS_Pecas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItens_OS_Pecas
    Left = 257
    Top = 1283
  end
  object dspAgenda: TDataSetProvider
    DataSet = dmDBEXMaster.fdqAgenda
    Left = 257
    Top = 1326
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgenda'
    OnNewRecord = cdsAgendaNewRecord
    Left = 392
    Top = 1326
    object cdsAgendaAGENDA: TIntegerField
      FieldName = 'AGENDA'
      Origin = 'AGENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAgendaCOMPROMISSO: TMemoField
      FieldName = 'COMPROMISSO'
      Origin = 'COMPROMISSO'
      BlobType = ftMemo
    end
    object cdsAgendaALERTA: TSmallintField
      FieldName = 'ALERTA'
      Origin = 'ALERTA'
      Required = True
    end
    object cdsAgendaFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
      Required = True
    end
    object cdsAgendaREALIZADO: TSmallintField
      FieldName = 'REALIZADO'
      Origin = 'REALIZADO'
      Required = True
    end
    object cdsAgendaDATA_COMPROMISSO: TDateField
      FieldName = 'DATA_COMPROMISSO'
      Origin = 'DATA_COMPROMISSO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsAgendaDATA_REALIZACAO: TDateField
      FieldName = 'DATA_REALIZACAO'
      Origin = 'DATA_REALIZACAO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsAgendaHORA_REALIZACAO: TTimeField
      FieldName = 'HORA_REALIZACAO'
      Origin = 'HORA_REALIZACAO'
    end
    object cdsAgendaHORA_COMPROMISSO: TTimeField
      FieldName = 'HORA_COMPROMISSO'
      Origin = 'HORA_COMPROMISSO'
    end
  end
  object dspServicos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqServicos
    Left = 41
    Top = 1370
  end
  object cdsServicos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServicos'
    OnNewRecord = cdsServicosNewRecord
    Left = 146
    Top = 1370
    object cdsServicosSERVICO: TIntegerField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsServicosDESCRICAO_1: TStringField
      FieldName = 'DESCRICAO_1'
      Origin = 'DESCRICAO_1'
      Required = True
      Size = 40
    end
    object cdsServicosDESCRICAO_2: TStringField
      FieldName = 'DESCRICAO_2'
      Origin = 'DESCRICAO_2'
      Size = 40
    end
    object cdsServicosVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsServicosCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsServicosCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object cdsServicosCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 3
    end
    object cdsServicosCST_PIS_ENTRADA: TStringField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
      Size = 3
    end
    object cdsServicosCST_COFINS_ENTRADA: TStringField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
      Size = 3
    end
    object cdsServicosALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsServicosALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsServicosCODIGO_ITEM: TStringField
      FieldName = 'CODIGO_ITEM'
      Origin = 'CODIGO_ITEM'
      Required = True
      Size = 60
    end
    object cdsServicosDESCRICAO_COMPLEMENTAR: TMemoField
      FieldName = 'DESCRICAO_COMPLEMENTAR'
      Origin = 'DESCRICAO_COMPLEMENTAR'
      Required = True
      BlobType = ftMemo
    end
  end
  object dspHistorico_OS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqHistorico_OS
    Left = 257
    Top = 1370
  end
  object cdsHistorico_OS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistorico_OS'
    OnNewRecord = cdsHistorico_OSNewRecord
    Left = 392
    Top = 1370
    object cdsHistorico_OSHISTORICO_ORDEM: TIntegerField
      FieldName = 'HISTORICO_ORDEM'
      Origin = 'HISTORICO_ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsHistorico_OSORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO'
      Required = True
    end
    object cdsHistorico_OSHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Required = True
      Size = 500
    end
    object cdsHistorico_OSUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 40
    end
    object cdsHistorico_OSDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object cdsHistorico_OSHORA_CADASTRO: TTimeField
      FieldName = 'HORA_CADASTRO'
      Origin = 'HORA_CADASTRO'
      Required = True
    end
    object cdsHistorico_OSTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsHistorico_OSCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
    end
  end
  object cdsSituacoesOS_ENC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSituacoesOS_ENC'
    Left = 146
    Top = 1412
    object cdsSituacoesOS_ENCCODIGO_SITUACAO: TIntegerField
      FieldName = 'CODIGO_SITUACAO'
      Origin = 'CODIGO_SITUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSituacoesOS_ENCDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object dspSituacoesOS_ENC: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSituacoesOS
    Left = 41
    Top = 1411
  end
  object cdsFormasPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormasPagamento'
    Left = 392
    Top = 1413
    object cdsFormasPagamentoFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFormasPagamentoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsFormasPagamentoCODIGOECF: TStringField
      FieldName = 'CODIGOECF'
      Origin = 'CODIGOECF'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsFormasPagamentoTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsFormasPagamentoENTRADA: TSmallintField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
    end
    object cdsFormasPagamentoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'PARCELAS'
      Required = True
    end
    object cdsFormasPagamentoINTERVALOENTREPARCELAS: TSmallintField
      FieldName = 'INTERVALOENTREPARCELAS'
      Origin = 'INTERVALOENTREPARCELAS'
      Required = True
    end
    object cdsFormasPagamentoATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsFormasPagamentoPERMITIRVENDACLIENTEBLOQUEADO: TSmallintField
      FieldName = 'PERMITIRVENDACLIENTEBLOQUEADO'
      Origin = 'PERMITIRVENDACLIENTEBLOQUEADO'
      Required = True
    end
    object cdsFormasPagamentoDESCONTOMAXIMO: TCurrencyField
      FieldName = 'DESCONTOMAXIMO'
      Origin = 'DESCONTOMAXIMO'
      Required = True
      currency = False
    end
    object cdsFormasPagamentoACRESCIMOMINIMO: TCurrencyField
      FieldName = 'ACRESCIMOMINIMO'
      Origin = 'ACRESCIMOMINIMO'
      Required = True
      currency = False
    end
    object cdsFormasPagamentoMORADIARIA: TCurrencyField
      FieldName = 'MORADIARIA'
      Origin = 'MORADIARIA'
      Required = True
      currency = False
    end
    object cdsFormasPagamentoPLANODECONTAS: TIntegerField
      FieldName = 'PLANODECONTAS'
      Origin = 'PLANODECONTAS'
    end
    object cdsFormasPagamentoITEMPLANODECONTAS: TIntegerField
      FieldName = 'ITEMPLANODECONTAS'
      Origin = 'ITEMPLANODECONTAS'
    end
    object cdsFormasPagamentoLANCAMENTO: TIntegerField
      FieldName = 'LANCAMENTO'
      Origin = 'LANCAMENTO'
    end
    object cdsFormasPagamentoTIPOOPERACAO: TSmallintField
      FieldName = 'TIPOOPERACAO'
      Origin = 'TIPOOPERACAO'
      Required = True
    end
    object cdsFormasPagamentoNOME_PL_CONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_PL_CONTA'
      LookupDataSet = cdsPlanoContas
      LookupKeyFields = 'PLANODECONTAS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PLANODECONTAS'
      Size = 40
      Lookup = True
    end
    object cdsFormasPagamentoNOME_ITEM_PL_CONTA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_ITEM_PL_CONTA'
      LookupDataSet = cdsItemPlContas
      LookupKeyFields = 'ITEMPLANODECONTAS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ITEMPLANODECONTAS'
      Size = 40
      Lookup = True
    end
  end
  object dspFormasPagamento: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFormasPagamento
    Left = 257
    Top = 1413
  end
  object dspPerdas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPerdas
    Left = 41
    Top = 1456
  end
  object cdsPerdas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerdas'
    OnNewRecord = cdsPerdasNewRecord
    Left = 145
    Top = 1456
    object cdsPerdasPERDAS: TIntegerField
      FieldName = 'PERDAS'
      Origin = 'PERDAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerdasFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object cdsPerdasDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'DATA_LANCAMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsPerdasTOTAL_QUANTIDADE: TBCDField
      FieldName = 'TOTAL_QUANTIDADE'
      Origin = 'TOTAL_QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsPerdasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPerdasFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
      Required = True
    end
    object cdsPerdasNOME_FORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FORNECEDOR'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'FORNECEDOR'
      Size = 100
      Lookup = True
    end
    object cdsPerdasNOME_FUNCIONARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FUNCIONARIO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 40
      Lookup = True
    end
  end
  object cdsItensPerdas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItensPerdas'
    OnNewRecord = cdsItensPerdasNewRecord
    Left = 147
    Top = 1500
    object cdsItensPerdasITENS_PERDAS: TIntegerField
      FieldName = 'ITENS_PERDAS'
      Origin = 'ITENS_PERDAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItensPerdasPERDA: TIntegerField
      FieldName = 'PERDA'
      Origin = 'PERDA'
      Required = True
    end
    object cdsItensPerdasPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsItensPerdasQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItensPerdasVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensPerdasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensPerdasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsItensPerdasUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object dspItensPerdas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItensPerdas
    Left = 43
    Top = 1500
  end
  object dspRControlePerda: TDataSetProvider
    DataSet = dmDBEXMaster.fdqRControlePerda
    Left = 257
    Top = 1456
  end
  object cdsRControlePerda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRControlePerda'
    Left = 392
    Top = 1456
    object cdsRControlePerdaOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
      Origin = 'OP_PRODUTO'
    end
    object cdsRControlePerdaOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Origin = 'OP_DESCRICAO'
      Size = 100
    end
    object cdsRControlePerdaOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Origin = 'OP_UNIDADE'
      Size = 3
    end
    object cdsRControlePerdaOP_FORNECEDOR: TIntegerField
      FieldName = 'OP_FORNECEDOR'
      Origin = 'OP_FORNECEDOR'
    end
    object cdsRControlePerdaOP_NOME_FORNECEDOR: TStringField
      FieldName = 'OP_NOME_FORNECEDOR'
      Origin = 'OP_NOME_FORNECEDOR'
      Size = 100
    end
    object cdsRControlePerdaOP_QTD_COMPRA: TBCDField
      FieldName = 'OP_QTD_COMPRA'
      Origin = 'OP_QTD_COMPRA'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsRControlePerdaOP_QTD_VENDA: TBCDField
      FieldName = 'OP_QTD_VENDA'
      Origin = 'OP_QTD_VENDA'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsRControlePerdaOP_QTD_PERDA: TBCDField
      FieldName = 'OP_QTD_PERDA'
      Origin = 'OP_QTD_PERDA'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsRControlePerdaOP_CUSTO_TOTAL: TBCDField
      FieldName = 'OP_CUSTO_TOTAL'
      Origin = 'OP_CUSTO_TOTAL'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspParcelasOS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParcelasOrdemServico
    Left = 40
    Top = 1544
  end
  object cdsParcelasOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParcelasOS'
    OnNewRecord = cdsParcelasOSNewRecord
    Left = 144
    Top = 1544
    object cdsParcelasOSPARCELAS_ORDEM_SERVICO: TIntegerField
      FieldName = 'PARCELAS_ORDEM_SERVICO'
      Origin = 'PARCELAS_ORDEM_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParcelasOSORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO'
      Required = True
    end
    object cdsParcelasOSDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
    end
    object cdsParcelasOSVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsParcelasOSVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspNcmNbs: TDataSetProvider
    DataSet = dmDBEXMaster.fdqNcmNbs
    Left = 257
    Top = 1500
  end
  object cdsDiasFormapagto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDiasFormapagto'
    OnNewRecord = cdsNcmNbsNewRecord
    Left = 392
    Top = 1544
    object cdsDiasFormapagtoDIASFORMAPAGAMENTO: TIntegerField
      FieldName = 'DIASFORMAPAGAMENTO'
      Origin = 'DIASFORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDiasFormapagtoFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDiasFormapagtoDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = 'DIAS'
      Required = True
    end
  end
  object dspDiasFormapagto: TDataSetProvider
    DataSet = dmDBEXMaster.fdqDiasFormaPagto
    Left = 257
    Top = 1544
  end
  object dspProducao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqProducao
    Left = 41
    Top = 1587
  end
  object cdsProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProducao'
    OnCalcFields = cdsProducaoCalcFields
    OnNewRecord = cdsProducaoNewRecord
    Left = 145
    Top = 1587
    object cdsProducaoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsProducaoRENDIMENTO: TBCDField
      FieldName = 'RENDIMENTO'
      Origin = 'RENDIMENTO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProducaoVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsProducaoCUSTO_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CUSTO_TOTAL'
      DisplayFormat = '#,##0.0000'
      currency = False
      Calculated = True
    end
    object cdsProducaoVENDA_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VENDA_TOTAL'
      DisplayFormat = '#,##0.00'
      currency = False
      Calculated = True
    end
    object cdsProducaoVALOR_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '#,##0.00'
      currency = False
      Calculated = True
    end
    object cdsProducaoPRODUCAO: TIntegerField
      FieldName = 'PRODUCAO'
      Origin = 'PRODUCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProducaoINGREDIENTE1: TStringField
      FieldName = 'INGREDIENTE1'
      Origin = 'INGREDIENTE1'
      Size = 50
    end
    object cdsProducaoINGREDIENTE2: TStringField
      FieldName = 'INGREDIENTE2'
      Origin = 'INGREDIENTE2'
      Size = 50
    end
    object cdsProducaoINGREDIENTE3: TStringField
      FieldName = 'INGREDIENTE3'
      Origin = 'INGREDIENTE3'
      Size = 50
    end
    object cdsProducaoINGREDIENTE4: TStringField
      FieldName = 'INGREDIENTE4'
      Origin = 'INGREDIENTE4'
      Size = 50
    end
    object cdsProducaoINGREDIENTE5: TStringField
      FieldName = 'INGREDIENTE5'
      Origin = 'INGREDIENTE5'
      Size = 50
    end
    object cdsProducaoINGREDIENTE6: TStringField
      FieldName = 'INGREDIENTE6'
      Origin = 'INGREDIENTE6'
      Size = 50
    end
    object cdsProducaoINGREDIENTE7: TStringField
      FieldName = 'INGREDIENTE7'
      Origin = 'INGREDIENTE7'
      Size = 50
    end
    object cdsProducaoDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupDataSet = cdsProdutoFT
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 100
      Lookup = True
    end
    object cdsProducaoUNID_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'UNID_PRODUTO'
      LookupDataSet = cdsProdutoFT
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'UNIDADE'
      KeyFields = 'PRODUTO'
      Size = 3
      Lookup = True
    end
  end
  object cdsItemProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemProducao'
    OnCalcFields = cdsItemProducaoCalcFields
    OnNewRecord = cdsItemProducaoNewRecord
    Left = 392
    Top = 1587
    object cdsItemProducaoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsItemProducaoQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemProducaoTOTAL_CUSTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CUSTO'
      DisplayFormat = '#,##0.000'
      currency = False
      Calculated = True
    end
    object cdsItemProducaoTOTAL_VENDA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = '#,##0.00'
      currency = False
      Calculated = True
    end
    object cdsItemProducaoITEMPRODUCAO: TIntegerField
      FieldName = 'ITEMPRODUCAO'
      Origin = 'ITEMPRODUCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemProducaoPRODUCAO: TIntegerField
      FieldName = 'PRODUCAO'
      Origin = 'PRODUCAO'
      Required = True
    end
    object cdsItemProducaoESTOQUE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'ESTOQUE'
      LookupDataSet = cdsProdutoFilial
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'SALDO_TOTAL'
      KeyFields = 'PRODUTO'
      DisplayFormat = '#,##0.000'
      currency = False
      Lookup = True
    end
    object cdsItemProducaoPERDA: TBCDField
      FieldName = 'PERDA'
      Origin = 'PERDA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemProducaoDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 100
      Lookup = True
    end
    object cdsItemProducaoCUSTO_LIQUIDO: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'CUSTO_LIQUIDO'
      LookupDataSet = cdsProdutoFilial
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'CUSTOLIQUIDO'
      KeyFields = 'PRODUTO'
      Lookup = True
    end
    object cdsItemProducaoPRECO_VENDA: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'PRECO_VENDA'
      LookupDataSet = cdsProdutoFilial
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'PRECODEVENDA'
      KeyFields = 'PRODUTO'
      Lookup = True
    end
  end
  object dspItemProducao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemProducao
    Left = 257
    Top = 1587
  end
  object dspPesqProdutos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPesqProdutos
    Left = 41
    Top = 1631
  end
  object cdsPesqProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqProdutos'
    OnCalcFields = cdsPesqProdutosCalcFields
    Left = 145
    Top = 1631
    object cdsPesqProdutosPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesqProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsPesqProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object cdsPesqProdutosSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
      Origin = 'SUBGRUPO'
    end
    object cdsPesqProdutosSECAO: TIntegerField
      FieldName = 'SECAO'
      Origin = 'SECAO'
    end
    object cdsPesqProdutosUNIDADEEMBALAGEM: TBCDField
      FieldName = 'UNIDADEEMBALAGEM'
      Origin = 'UNIDADEEMBALAGEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosPESOLIQUIDO: TBCDField
      FieldName = 'PESOLIQUIDO'
      Origin = 'PESOLIQUIDO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosPESOBRUTO: TBCDField
      FieldName = 'PESOBRUTO'
      Origin = 'PESOBRUTO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      Required = True
    end
    object cdsPesqProdutosATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsPesqProdutosREDBASECALCULO: TFMTBCDField
      FieldName = 'REDBASECALCULO'
      Origin = 'REDBASECALCULO'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsPesqProdutosCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPesqProdutosSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsPesqProdutosFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object cdsPesqProdutosNBM: TStringField
      FieldName = 'NBM'
      Origin = 'NBM'
      Size = 15
    end
    object cdsPesqProdutosNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object cdsPesqProdutosDOLARVENDA: TBCDField
      FieldName = 'DOLARVENDA'
      Origin = 'DOLARVENDA'
      Required = True
      Precision = 18
    end
    object cdsPesqProdutosINFNUTRICIONAL: TIntegerField
      FieldName = 'INFNUTRICIONAL'
      Origin = 'INFNUTRICIONAL'
    end
    object cdsPesqProdutosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object cdsPesqProdutosISENTOPISCOFINS: TSmallintField
      FieldName = 'ISENTOPISCOFINS'
      Origin = 'ISENTOPISCOFINS'
      Required = True
    end
    object cdsPesqProdutosSIMILAR: TIntegerField
      FieldName = 'SIMILAR'
      Origin = '"SIMILAR"'
    end
    object cdsPesqProdutosFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
      Origin = 'FABRICANTE'
    end
    object cdsPesqProdutosALTERAR_PRECOVENDA_PDVI: TSmallintField
      FieldName = 'ALTERAR_PRECOVENDA_PDVI'
      Origin = 'ALTERAR_PRECOVENDA_PDVI'
      Required = True
    end
    object cdsPesqProdutosLITRAGEM: TBCDField
      FieldName = 'LITRAGEM'
      Origin = 'LITRAGEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosCF_IPI: TSmallintField
      FieldName = 'CF_IPI'
      Origin = 'CF_IPI'
      Required = True
    end
    object cdsPesqProdutosCOMPOEM_CESTA_BASICA: TSmallintField
      FieldName = 'COMPOEM_CESTA_BASICA'
      Origin = 'COMPOEM_CESTA_BASICA'
      Required = True
    end
    object cdsPesqProdutosAUTOR1: TIntegerField
      FieldName = 'AUTOR1'
      Origin = 'AUTOR1'
    end
    object cdsPesqProdutosAUTOR2: TIntegerField
      FieldName = 'AUTOR2'
      Origin = 'AUTOR2'
    end
    object cdsPesqProdutosPERMITE_VENDA_FRACIONADA: TSmallintField
      FieldName = 'PERMITE_VENDA_FRACIONADA'
      Origin = 'PERMITE_VENDA_FRACIONADA'
      Required = True
    end
    object cdsPesqProdutosUNIDADE_ATACADO: TBCDField
      FieldName = 'UNIDADE_ATACADO'
      Origin = 'UNIDADE_ATACADO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsPesqProdutosALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsPesqProdutosVISIBILIDADE: TSmallintField
      FieldName = 'VISIBILIDADE'
      Origin = 'VISIBILIDADE'
      Required = True
    end
    object cdsPesqProdutosCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsPesqProdutosCST_PIS: TIntegerField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
    end
    object cdsPesqProdutosCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
    end
    object cdsPesqProdutosTIPO_ITEM: TSmallintField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
      Required = True
    end
    object cdsPesqProdutosMVA: TIntegerField
      FieldName = 'MVA'
      Origin = 'MVA'
    end
    object cdsPesqProdutosPAUTA_FISCAL: TIntegerField
      FieldName = 'PAUTA_FISCAL'
      Origin = 'PAUTA_FISCAL'
    end
    object cdsPesqProdutosLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
    end
    object cdsPesqProdutosPRODUTO_ORIGEM: TIntegerField
      FieldName = 'PRODUTO_ORIGEM'
      Origin = 'PRODUTO_ORIGEM'
    end
    object cdsPesqProdutosCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsPesqProdutosCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsPesqProdutosNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsPesqProdutosUND_ATACADO: TStringField
      FieldName = 'UND_ATACADO'
      Origin = 'UND_ATACADO'
      Size = 2
    end
    object cdsPesqProdutosALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsPesqProdutosALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsPesqProdutosCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
    object cdsPesqProdutosCODIGO_ANP: TStringField
      FieldName = 'CODIGO_ANP'
      Origin = 'CODIGO_ANP'
      Size = 9
    end
    object cdsPesqProdutosCARGA_TRIBUTARIA_NAC: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_NAC'
      Origin = 'CARGA_TRIBUTARIA_NAC'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosCARGA_TRIBUTARIA_IMP: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_IMP'
      Origin = 'CARGA_TRIBUTARIA_IMP'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosDESCONTO_PERSONALIZADO: TSmallintField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
      DisplayFormat = 'PRE'
    end
    object cdsPesqProdutosORIGEM_MERCADORIA: TSmallintField
      FieldName = 'ORIGEM_MERCADORIA'
      Origin = 'ORIGEM_MERCADORIA'
    end
    object cdsPesqProdutosPRODUTO_1: TIntegerField
      FieldName = 'PRODUTO_1'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosCUSTOBRUTO: TBCDField
      FieldName = 'CUSTOBRUTO'
      Origin = 'CUSTOBRUTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosCUSTOBRUTOANTERIOR: TBCDField
      FieldName = 'CUSTOBRUTOANTERIOR'
      Origin = 'CUSTOBRUTOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosCUSTOLIQUIDO: TBCDField
      FieldName = 'CUSTOLIQUIDO'
      Origin = 'CUSTOLIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.0000'
      Precision = 18
    end
    object cdsPesqProdutosCUSTOLIQUIDOANTERIOR: TBCDField
      FieldName = 'CUSTOLIQUIDOANTERIOR'
      Origin = 'CUSTOLIQUIDOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosMENORPRECO: TBCDField
      FieldName = 'MENORPRECO'
      Origin = 'MENORPRECO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosPRECOCALCULADO: TBCDField
      FieldName = 'PRECOCALCULADO'
      Origin = 'PRECOCALCULADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosPRECOPROVISORIO: TBCDField
      FieldName = 'PRECOPROVISORIO'
      Origin = 'PRECOPROVISORIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosPRECODEVENDA: TBCDField
      FieldName = 'PRECODEVENDA'
      Origin = 'PRECODEVENDA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsPesqProdutosPRECODEVENDAANTERIOR: TBCDField
      FieldName = 'PRECODEVENDAANTERIOR'
      Origin = 'PRECODEVENDAANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosALTERACAO: TDateField
      FieldName = 'ALTERACAO'
      Origin = 'ALTERACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosREMARCACAO: TDateField
      FieldName = 'REMARCACAO'
      Origin = 'REMARCACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosLUCROICMSR: TBCDField
      FieldName = 'LUCROICMSR'
      Origin = 'LUCROICMSR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosIMPOSTOSFEDERAIS: TBCDField
      FieldName = 'IMPOSTOSFEDERAIS'
      Origin = 'IMPOSTOSFEDERAIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosCUSTOOPERACIONAL: TBCDField
      FieldName = 'CUSTOOPERACIONAL'
      Origin = 'CUSTOOPERACIONAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosCOMISSAOVENDA: TBCDField
      FieldName = 'COMISSAOVENDA'
      Origin = 'COMISSAOVENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosLUCROLIQUIDO: TBCDField
      FieldName = 'LUCROLIQUIDO'
      Origin = 'LUCROLIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosDEPOSITO: TBCDField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosDEPOSITO1: TBCDField
      FieldName = 'DEPOSITO1'
      Origin = 'DEPOSITO1'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosLOJA: TBCDField
      FieldName = 'LOJA'
      Origin = 'LOJA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosLOJA1: TBCDField
      FieldName = 'LOJA1'
      Origin = 'LOJA1'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosSALDOANTERIOR: TBCDField
      FieldName = 'SALDOANTERIOR'
      Origin = 'SALDOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosSALDOMINIMO: TBCDField
      FieldName = 'SALDOMINIMO'
      Origin = 'SALDOMINIMO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosSALDOMAXIMO: TBCDField
      FieldName = 'SALDOMAXIMO'
      Origin = 'SALDOMAXIMO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosSETORDEBALANCA: TIntegerField
      FieldName = 'SETORDEBALANCA'
      Origin = 'SETORDEBALANCA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosPRODUTOATIVO: TSmallintField
      FieldName = 'PRODUTOATIVO'
      Origin = 'PRODUTOATIVO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosPROMOCAO: TSmallintField
      FieldName = 'PROMOCAO'
      Origin = 'PROMOCAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosTECLAASSOCIADA: TIntegerField
      FieldName = 'TECLAASSOCIADA'
      Origin = 'TECLAASSOCIADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosVALIDADE: TIntegerField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosTECLADO: TSmallintField
      FieldName = 'TECLADO'
      Origin = 'TECLADO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosREDUCAOBASEDECALCULO: TBCDField
      FieldName = 'REDUCAOBASEDECALCULO'
      Origin = 'REDUCAOBASEDECALCULO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosDESCONTOPROGRAMADO: TBCDField
      FieldName = 'DESCONTOPROGRAMADO'
      Origin = 'DESCONTOPROGRAMADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosDESCRICAOCUPOMFISCAL: TStringField
      FieldName = 'DESCRICAOCUPOMFISCAL'
      Origin = 'DESCRICAOCUPOMFISCAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsPesqProdutosDESCRICAOGONDOLA1: TStringField
      FieldName = 'DESCRICAOGONDOLA1'
      Origin = 'DESCRICAOGONDOLA1'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsPesqProdutosDESCRICAOGONDOLA2: TStringField
      FieldName = 'DESCRICAOGONDOLA2'
      Origin = 'DESCRICAOGONDOLA2'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsPesqProdutosDESCRICAOBALANCA: TStringField
      FieldName = 'DESCRICAOBALANCA'
      Origin = 'DESCRICAOBALANCA'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsPesqProdutosDESCRICAOTIRATEIMA: TStringField
      FieldName = 'DESCRICAOTIRATEIMA'
      Origin = 'DESCRICAOTIRATEIMA'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsPesqProdutosENVIARPARABALANCA: TSmallintField
      FieldName = 'ENVIARPARABALANCA'
      Origin = 'ENVIARPARABALANCA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosDESCONTONACOMPRA: TBCDField
      FieldName = 'DESCONTONACOMPRA'
      Origin = 'DESCONTONACOMPRA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosCREDITODEICMS: TBCDField
      FieldName = 'CREDITODEICMS'
      Origin = 'CREDITODEICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosIPI: TBCDField
      FieldName = 'IPI'
      Origin = 'IPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosOUTROSCUSTOS: TBCDField
      FieldName = 'OUTROSCUSTOS'
      Origin = 'OUTROSCUSTOS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosFRETE: TBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosICMSAPAGAR: TBCDField
      FieldName = 'ICMSAPAGAR'
      Origin = 'ICMSAPAGAR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosDESCONTONAVENDA: TBCDField
      FieldName = 'DESCONTONAVENDA'
      Origin = 'DESCONTONAVENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosVALORDODESCONTONACOMPRA: TBCDField
      FieldName = 'VALORDODESCONTONACOMPRA'
      Origin = 'VALORDODESCONTONACOMPRA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosVALORDOCREDITODEICMSR: TBCDField
      FieldName = 'VALORDOCREDITODEICMSR'
      Origin = 'VALORDOCREDITODEICMSR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosVALORDEOUTROSCUSTOS: TBCDField
      FieldName = 'VALORDEOUTROSCUSTOS'
      Origin = 'VALORDEOUTROSCUSTOS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosVALORDOFRETE: TBCDField
      FieldName = 'VALORDOFRETE'
      Origin = 'VALORDOFRETE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosVALORDOICMSR: TBCDField
      FieldName = 'VALORDOICMSR'
      Origin = 'VALORDOICMSR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsPesqProdutosPRECOPROMOCAO: TBCDField
      FieldName = 'PRECOPROMOCAO'
      Origin = 'PRECOPROMOCAO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosDESCONTOTABELA1: TCurrencyField
      FieldName = 'DESCONTOTABELA1'
      Origin = 'DESCONTOTABELA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosDESCONTOTABELA2: TCurrencyField
      FieldName = 'DESCONTOTABELA2'
      Origin = 'DESCONTOTABELA2'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosDESCONTOTABELA3: TCurrencyField
      FieldName = 'DESCONTOTABELA3'
      Origin = 'DESCONTOTABELA3'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosSUBSTITUICAOTRIBUTARIA: TCurrencyField
      FieldName = 'SUBSTITUICAOTRIBUTARIA'
      Origin = 'SUBSTITUICAOTRIBUTARIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosULTIMA_ENTRADA: TDateField
      FieldName = 'ULTIMA_ENTRADA'
      Origin = 'ULTIMA_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosSALDO_RESERVADO: TBCDField
      FieldName = 'SALDO_RESERVADO'
      Origin = 'SALDO_RESERVADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosULTIMA_NF_ENTRADA: TStringField
      FieldName = 'ULTIMA_NF_ENTRADA'
      Origin = 'ULTIMA_NF_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsPesqProdutosCUSTO_MEDIO: TBCDField
      FieldName = 'CUSTO_MEDIO'
      Origin = 'CUSTO_MEDIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosCUSTO_MEDIO_ANTERIOR: TBCDField
      FieldName = 'CUSTO_MEDIO_ANTERIOR'
      Origin = 'CUSTO_MEDIO_ANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosDATA_CUSTO_MEDIO: TDateField
      FieldName = 'DATA_CUSTO_MEDIO'
      Origin = 'DATA_CUSTO_MEDIO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosDATA_CUSTO_MEDIO_ANTERIOR: TDateField
      FieldName = 'DATA_CUSTO_MEDIO_ANTERIOR'
      Origin = 'DATA_CUSTO_MEDIO_ANTERIOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPesqProdutosPRECO_ATACADO: TBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosDESCRICAO_ATACADO: TStringField
      FieldName = 'DESCRICAO_ATACADO'
      Origin = 'DESCRICAO_ATACADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 44
    end
    object cdsPesqProdutosPERCENTUAL_ISS: TBCDField
      FieldName = 'PERCENTUAL_ISS'
      Origin = 'PERCENTUAL_ISS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosPERCENTUAL_IOF: TBCDField
      FieldName = 'PERCENTUAL_IOF'
      Origin = 'PERCENTUAL_IOF'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosPERCENTUAL_CIDE: TBCDField
      FieldName = 'PERCENTUAL_CIDE'
      Origin = 'PERCENTUAL_CIDE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutosSALDO_ATUAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_ATUAL'
      DisplayFormat = '#,##0.000'
      currency = False
      Calculated = True
    end
    object cdsPesqProdutosSALDO_ALMOXARIFADO: TBCDField
      FieldName = 'SALDO_ALMOXARIFADO'
      Origin = 'SALDO_ALMOXARIFADO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsPesqProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 6
    end
    object cdsPesqProdutosFRACAO: TSmallintField
      FieldName = 'FRACAO'
      ReadOnly = True
    end
    object cdsPesqProdutosCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
  end
  object cdsUltimaNFForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltimaNFForn'
    Left = 392
    Top = 1631
    object cdsUltimaNFFornNOTAFISCAL: TStringField
      Alignment = taRightJustify
      FieldName = 'NOTAFISCAL'
      Origin = 'NOTAFISCAL'
      Required = True
      Size = 15
    end
    object cdsUltimaNFFornENTRADA: TDateField
      Alignment = taRightJustify
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsUltimaNFFornEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsUltimaNFFornVALORDOSPRODUTOS: TBCDField
      FieldName = 'VALORDOSPRODUTOS'
      Origin = 'VALORDOSPRODUTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsUltimaNFFornVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Origin = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspUltimaNFForn: TDataSetProvider
    DataSet = dmDBEXMaster.fdqNFEntrada
    Left = 257
    Top = 1631
  end
  object dspUltimaOCForn: TDataSetProvider
    DataSet = dmDBEXMaster.fdqOrdemCompra
    Left = 37
    Top = 1675
  end
  object cdsUltimaOCForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltimaOCForn'
    OnCalcFields = cdsItemProducaoCalcFields
    OnNewRecord = cdsItemProducaoNewRecord
    Left = 142
    Top = 1675
    object cdsUltimaOCFornORDEMDECOMPRA: TIntegerField
      FieldName = 'ORDEMDECOMPRA'
      Origin = 'ORDEMDECOMPRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUltimaOCFornEMISSAO: TSQLTimeStampField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsUltimaOCFornFATURAMENTO: TDateField
      FieldName = 'FATURAMENTO'
      Origin = 'FATURAMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsUltimaOCFornTOTALDOPEDIDO: TBCDField
      FieldName = 'TOTALDOPEDIDO'
      Origin = 'TOTALDOPEDIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsUltimaOCFornENTREGA: TDateField
      FieldName = 'ENTREGA'
      Origin = 'ENTREGA'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
  end
  object dspPaises: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPaises
    Left = 39
    Top = 1763
  end
  object cdsPaises: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPaises'
    OnCalcFields = cdsItemProducaoCalcFields
    OnNewRecord = cdsItemProducaoNewRecord
    Left = 142
    Top = 1763
    object cdsPaisesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPaisesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
  end
  object dspBarras: TDataSetProvider
    DataSet = dmDBEXMaster.fdqBarras
    Left = 505
    Top = 3
  end
  object cdsBarras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBarras'
    Left = 625
    Top = 3
    object cdsBarrasBARRAS: TStringField
      FieldName = 'BARRAS'
      Origin = 'BARRAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object cdsBarrasPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsBarrasPESADO: TSmallintField
      FieldName = 'PESADO'
      Origin = 'PESADO'
      Required = True
    end
    object cdsBarrasGERADO: TSmallintField
      FieldName = 'GERADO'
      Origin = 'GERADO'
      Required = True
    end
    object cdsBarrasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
  end
  object cdsUndMedida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUndMedida'
    OnNewRecord = cdsUndMedidaNewRecord
    Left = 625
    Top = 49
    object cdsUndMedidaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object cdsUndMedidaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsUndMedidaPERMITE_VENDA_FRACIONADA: TSmallintField
      FieldName = 'PERMITE_VENDA_FRACIONADA'
      Origin = 'PERMITE_VENDA_FRACIONADA'
      Required = True
    end
  end
  object dspUndMedida: TDataSetProvider
    DataSet = dmDBEXMaster.fdqUnidadeMedida
    Left = 505
    Top = 49
  end
  object cdsMenuAtalhos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMenuAtalhos'
    Left = 625
    Top = 94
    object cdsMenuAtalhosTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Required = True
    end
    object cdsMenuAtalhosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 500
    end
    object cdsMenuAtalhosIMAGEM_ATALHO: TBlobField
      FieldName = 'IMAGEM_ATALHO'
      Origin = 'IMAGEM_ATALHO'
    end
    object cdsMenuAtalhosTIPO_ATALHO: TSmallintField
      FieldName = 'TIPO_ATALHO'
      Origin = 'TIPO_ATALHO'
      Required = True
    end
  end
  object dspMenuAtalhos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqMenuAtalhos
    Left = 505
    Top = 94
  end
  object cdsVersaoAtual: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 142
    Top = 1720
    object cdsVersaoAtualOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsVersaoAtualVERSAO: TStringField
      FieldName = 'VERSAO'
    end
    object cdsVersaoAtualARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 200
    end
  end
  object cdsLiveUpdate: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 1720
    object cdsLiveUpdateOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsLiveUpdateVERSAO: TStringField
      FieldName = 'VERSAO'
    end
    object cdsLiveUpdateARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 200
    end
    object cdsLiveUpdateNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 200
    end
  end
  object cdsAlmoxarifado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlmoxarifado'
    OnCalcFields = cdsAlmoxarifadoCalcFields
    OnNewRecord = cdsAlmoxarifadoNewRecord
    Left = 392
    Top = 1675
    object cdsAlmoxarifadoALMOXARIFADO: TIntegerField
      FieldName = 'ALMOXARIFADO'
      Origin = 'ALMOXARIFADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAlmoxarifadoEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsAlmoxarifadoHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      EditMask = '!90:00;0;_'
    end
    object cdsAlmoxarifadoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
      Required = True
    end
    object cdsAlmoxarifadoREQUERENTE: TIntegerField
      FieldName = 'REQUERENTE'
      Origin = 'REQUERENTE'
      Required = True
    end
    object cdsAlmoxarifadoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsAlmoxarifadoOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
    end
    object cdsAlmoxarifadoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 10
    end
    object cdsAlmoxarifadoNOME_REQUERENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_REQUERENTE'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'REQUERENTE'
      Size = 40
      Lookup = True
    end
    object cdsAlmoxarifadoDESCRICAO_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_STATUS'
      Size = 15
      Calculated = True
    end
    object cdsAlmoxarifadoNOME_ATENDENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_ATENDENTE'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 40
      Lookup = True
    end
  end
  object dspAlmoxarifado: TDataSetProvider
    DataSet = dmDBEXMaster.fdqAlmoxarifado
    Left = 257
    Top = 1675
  end
  object cdsItemAlmoxarifado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemAlmoxarifado'
    OnNewRecord = cdsItemAlmoxarifadoNewRecord
    Left = 392
    Top = 1720
    object cdsItemAlmoxarifadoITEM_ALMOXARIFADO: TIntegerField
      FieldName = 'ITEM_ALMOXARIFADO'
      Origin = 'ITEM_ALMOXARIFADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemAlmoxarifadoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsItemAlmoxarifadoQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemAlmoxarifadoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 10
    end
    object cdsItemAlmoxarifadoALMOXARIFADO: TIntegerField
      FieldName = 'ALMOXARIFADO'
      Origin = 'ALMOXARIFADO'
      Required = True
    end
    object cdsItemAlmoxarifadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object dspItemAlmoxarifado: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemAlmoxarifado
    Left = 257
    Top = 1720
  end
  object cdsCfgConexaoZeusRetail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCfgConexaoZeusRetail'
    Left = 392
    Top = 1763
    object cdsCfgConexaoZeusRetailIP_SERVIDOR: TStringField
      FieldName = 'IP_SERVIDOR'
      Origin = 'IP_SERVIDOR'
      Required = True
      Size = 40
    end
    object cdsCfgConexaoZeusRetailNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Origin = 'NOME_BANCO'
      Required = True
      Size = 100
    end
    object cdsCfgConexaoZeusRetailUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 10
    end
    object cdsCfgConexaoZeusRetailSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
    end
    object cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO: TSmallintField
      FieldName = 'TIPO_AUTENTICACAO'
      Origin = 'TIPO_AUTENTICACAO'
      Required = True
    end
    object cdsCfgConexaoZeusRetailPATH_ORIGEM_ARQ_PAF: TStringField
      FieldName = 'PATH_ORIGEM_ARQ_PAF'
      Size = 1000
    end
    object cdsCfgConexaoZeusRetailPATH_DESTINO_ARQ_PAF: TStringField
      FieldName = 'PATH_DESTINO_ARQ_PAF'
      Size = 1000
    end
    object cdsCfgConexaoZeusRetailMODELO_PDV: TSmallintField
      FieldName = 'MODELO_PDV'
      Required = True
    end
    object cdsCfgConexaoZeusRetailTIPO_SERVIDOR: TStringField
      FieldName = 'TIPO_SERVIDOR'
      Required = True
      Size = 10
    end
  end
  object dspCfgConexaoZeusRetail: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCfgConexaoZeusRetail
    Left = 257
    Top = 1763
  end
  object dspPedidoZeus: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPedidoZeus
    Left = 505
    Top = 140
  end
  object dspItemPedZeus: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemPedZeus
    Left = 505
    Top = 186
  end
  object cdsItemPedZeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItemPedZeus'
    OnCalcFields = cdsItemPedZeusCalcFields
    OnNewRecord = cdsItemPedZeusNewRecord
    Left = 625
    Top = 186
    object cdsItemPedZeusFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemPedZeusPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemPedZeusITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      Origin = 'ITEM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemPedZeusPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsItemPedZeusOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object cdsItemPedZeusGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object cdsItemPedZeusCOD_TRIBUTACAO: TStringField
      FieldName = 'COD_TRIBUTACAO'
      Origin = 'COD_TRIBUTACAO'
      Size = 10
    end
    object cdsItemPedZeusALIQUOTA_ICMS: TBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Origin = 'ALIQUOTA_ICMS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemPedZeusQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemPedZeusVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemPedZeusVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemPedZeusUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 30
    end
    object cdsItemPedZeusDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object cdsItemPedZeusDATA_ALTERACAO: TDateField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object cdsItemPedZeusCONTROLE_ALTERACAO: TSmallintField
      FieldName = 'CONTROLE_ALTERACAO'
      Origin = 'CONTROLE_ALTERACAO'
      Required = True
    end
    object cdsItemPedZeusVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'VALOR_ACRESCIMO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemPedZeusDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsItemPedZeusUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object cdsItemPedZeusSUB_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SUB_TOTAL'
      Calculated = True
    end
    object cdsItemPedZeusVALOR_TOTAL_ITEM: TBCDField
      FieldName = 'VALOR_TOTAL_ITEM'
      Origin = 'VALOR_TOTAL_ITEM'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemPedZeusGTIN: TStringField
      FieldName = 'GTIN'
      Origin = 'GTIN'
    end
    object cdsItemPedZeusENTREGA: TSmallintField
      FieldName = 'ENTREGA'
      Origin = 'ENTREGA'
      Required = True
    end
    object cdsItemPedZeusRESERVADO: TSmallintField
      FieldName = 'RESERVADO'
      Origin = 'RESERVADO'
      Required = True
    end
    object cdsItemPedZeusS_ENTREGA_RETIRADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_ENTREGA_RETIRADO'
      Size = 10
      Calculated = True
    end
    object cdsItemPedZeusS_RESERVADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_RESERVADO'
      Size = 10
      Calculated = True
    end
    object cdsItemPedZeusAUTORIZACAO_DESCONTO: TStringField
      FieldName = 'AUTORIZACAO_DESCONTO'
      Origin = 'AUTORIZACAO_DESCONTO'
      Size = 40
    end
    object cdsItemPedZeusTOTAL_MERCADORIAS: TAggregateField
      Alignment = taRightJustify
      DefaultExpression = '0'
      FieldName = 'TOTAL_MERCADORIAS'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(VALOR_TOTAL_ITEM)'
    end
    object cdsItemPedZeusTOTAL_PEDIDO: TAggregateField
      Alignment = taRightJustify
      DefaultExpression = '0'
      FieldName = 'TOTAL_PEDIDO'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(VALOR_TOTAL_ITEM)'
    end
    object cdsItemPedZeusTOT_DESCONTO: TAggregateField
      FieldName = 'TOT_DESCONTO'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR_DESCONTO)'
    end
    object cdsItemPedZeusTOT_ACRESCIMO: TAggregateField
      FieldName = 'TOT_ACRESCIMO'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR_ACRESCIMO)'
    end
  end
  object cdsEndEntregaPedZeus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEndEntregaPedZeus'
    OnNewRecord = cdsEndEntregaPedZeusNewRecord
    Left = 625
    Top = 232
    object cdsEndEntregaPedZeusFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEndEntregaPedZeusPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEndEntregaPedZeusTELEFONE_ENTREGA: TStringField
      FieldName = 'TELEFONE_ENTREGA'
      Origin = 'TELEFONE_ENTREGA'
      Size = 30
    end
    object cdsEndEntregaPedZeusENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 40
    end
    object cdsEndEntregaPedZeusNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsEndEntregaPedZeusCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object cdsEndEntregaPedZeusCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object cdsEndEntregaPedZeusBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object cdsEndEntregaPedZeusCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object cdsEndEntregaPedZeusESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object cdsEndEntregaPedZeusHORA_TRANSACAO: TTimeField
      FieldName = 'HORA_TRANSACAO'
      Origin = 'HORA_TRANSACAO'
    end
    object cdsEndEntregaPedZeusNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Required = True
      Size = 60
    end
  end
  object dspEndEntregaPedZeus: TDataSetProvider
    DataSet = dmDBEXMaster.fdqEndEntregaPedZeus
    Left = 505
    Top = 232
  end
  object cdsFinalizadoraPedZeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspFinalizadoraPedZeus'
    OnNewRecord = cdsFinalizadoraPedZeusNewRecord
    Left = 625
    Top = 279
    object cdsFinalizadoraPedZeusFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFinalizadoraPedZeusPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFinalizadoraPedZeusFORMA_PAGAMENTO: TIntegerField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = 'FORMA_PAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFinalizadoraPedZeusCOD_FINALIZADORA: TStringField
      FieldName = 'COD_FINALIZADORA'
      Origin = 'COD_FINALIZADORA'
      Size = 10
    end
    object cdsFinalizadoraPedZeusVALOR_FINALIZADO: TBCDField
      FieldName = 'VALOR_FINALIZADO'
      Origin = 'VALOR_FINALIZADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS: TIntegerField
      FieldName = 'QUANTIDADE_PARCELAS'
      Origin = 'QUANTIDADE_PARCELAS'
    end
    object cdsFinalizadoraPedZeusCLASSE_FINALIZADORA: TIntegerField
      FieldName = 'CLASSE_FINALIZADORA'
      Origin = 'CLASSE_FINALIZADORA'
    end
    object cdsFinalizadoraPedZeusNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsFinalizadoraPedZeusTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsFinalizadoraPedZeusTOTAL_RECEBIDO: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTAL_RECEBIDO'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(VALOR_FINALIZADO)'
    end
  end
  object dspFinalizadoraPedZeus: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFinalizPedZeus
    Left = 505
    Top = 279
  end
  object cdsPedidoZeus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidoZeus'
    OnCalcFields = cdsPedidoZeusCalcFields
    OnNewRecord = cdsPedidoZeusNewRecord
    Left = 625
    Top = 140
    object cdsPedidoZeusPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedidoZeusFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedidoZeusEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
    end
    object cdsPedidoZeusLOJA_SAI_MERCADORIA: TIntegerField
      FieldName = 'LOJA_SAI_MERCADORIA'
      Origin = 'LOJA_SAI_MERCADORIA'
      Required = True
    end
    object cdsPedidoZeusENTREGA: TSmallintField
      FieldName = 'ENTREGA'
      Origin = 'ENTREGA'
      Required = True
    end
    object cdsPedidoZeusSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
    end
    object cdsPedidoZeusNUMERO_ITENS_PEDIDO: TIntegerField
      FieldName = 'NUMERO_ITENS_PEDIDO'
      Origin = 'NUMERO_ITENS_PEDIDO'
      Required = True
    end
    object cdsPedidoZeusVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
      Required = True
    end
    object cdsPedidoZeusDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
      Required = True
    end
    object cdsPedidoZeusDATA_MONTAGEM: TDateField
      FieldName = 'DATA_MONTAGEM'
      Origin = 'DATA_MONTAGEM'
    end
    object cdsPedidoZeusTERMO_ENCOMENDA: TStringField
      FieldName = 'TERMO_ENCOMENDA'
      Origin = 'TERMO_ENCOMENDA'
      Size = 10
    end
    object cdsPedidoZeusVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidoZeusOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object cdsPedidoZeusHORARIO_PEDIDO: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORARIO_PEDIDO'
      Origin = 'HORARIO_PEDIDO'
      Required = True
    end
    object cdsPedidoZeusUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 35
    end
    object cdsPedidoZeusDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object cdsPedidoZeusDATA_ULTIMA_ALTERACAO: TDateField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
      Origin = 'DATA_ULTIMA_ALTERACAO'
    end
    object cdsPedidoZeusCONTROLE_ALTERACAO: TSmallintField
      FieldName = 'CONTROLE_ALTERACAO'
      Origin = 'CONTROLE_ALTERACAO'
    end
    object cdsPedidoZeusSITUACAO_ERP: TSmallintField
      FieldName = 'SITUACAO_ERP'
      Origin = 'SITUACAO_ERP'
      Required = True
    end
    object cdsPedidoZeusVALOR_DO_PEDIDO: TBCDField
      FieldName = 'VALOR_DO_PEDIDO'
      Origin = 'VALOR_DO_PEDIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidoZeusVALIDADE_PEDIDO: TDateField
      FieldName = 'VALIDADE_PEDIDO'
      Origin = 'VALIDADE_PEDIDO'
    end
    object cdsPedidoZeusNUMERO_PRE_VENDA: TIntegerField
      FieldName = 'NUMERO_PRE_VENDA'
      Origin = 'NUMERO_PRE_VENDA'
    end
    object cdsPedidoZeusNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
      Origin = 'NUMERO_DAV'
    end
    object cdsPedidoZeusSITUACAO_DAV: TSmallintField
      FieldName = 'SITUACAO_DAV'
      Origin = 'SITUACAO_DAV'
      Required = True
    end
    object cdsPedidoZeusVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'VALOR_ACRESCIMO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidoZeusPEDIDO_ORCAMENTO: TSmallintField
      FieldName = 'PEDIDO_ORCAMENTO'
      Origin = 'PEDIDO_ORCAMENTO'
      Required = True
    end
    object cdsPedidoZeusTOTAL_MERCADORIAS: TBCDField
      FieldName = 'TOTAL_MERCADORIAS'
      Origin = 'TOTAL_MERCADORIAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidoZeusENDERECOENTREGA: TStringField
      FieldName = 'ENDERECOENTREGA'
      Origin = 'ENDERECOENTREGA'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsPedidoZeusNUMEROENTREGA: TIntegerField
      FieldName = 'NUMEROENTREGA'
      Origin = 'NUMEROENTREGA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPedidoZeusCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      Origin = 'CEPENTREGA'
      ProviderFlags = []
      ReadOnly = True
      Size = 9
    end
    object cdsPedidoZeusCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsPedidoZeusESTADOENTREGA: TStringField
      FieldName = 'ESTADOENTREGA'
      Origin = 'ESTADOENTREGA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object cdsPedidoZeusDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object cdsPedidoZeusTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Origin = 'TELEFONE1'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object cdsPedidoZeusS_ORCAMENTO_PEDIDO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_ORCAMENTO_PEDIDO'
      Size = 15
      Calculated = True
    end
    object cdsPedidoZeusNOME: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'VENDEDOR'
      Size = 40
      Lookup = True
    end
    object cdsPedidoZeusRAZAOSOCIAL: TStringField
      FieldKind = fkLookup
      FieldName = 'RAZAOSOCIAL'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'CLIENTE'
      Size = 40
      Lookup = True
    end
    object cdsPedidoZeusCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object cdsPedidoZeusBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Origin = 'BAIRROENTREGA'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsPedidoZeusCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPedidoZeusCIDADE_ENTREGA: TStringField
      FieldName = 'CIDADE_ENTREGA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object cdsParcelasPedZeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspParcelasPedZeus'
    Left = 625
    Top = 509
    object cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS: TIntegerField
      FieldName = 'PARCELAS_PEDIDO_ZEUS'
      Origin = 'PARCELAS_PEDIDO_ZEUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParcelasPedZeusCODIGO_PEDIDO: TIntegerField
      FieldName = 'CODIGO_PEDIDO'
      Origin = 'CODIGO_PEDIDO'
      Required = True
    end
    object cdsParcelasPedZeusFORMA_PAGAMENTO: TIntegerField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = 'FORMA_PAGAMENTO'
      Required = True
    end
    object cdsParcelasPedZeusVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsParcelasPedZeusVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspParcelasPedZeus: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParcelasPedZeus
    Left = 505
    Top = 509
  end
  object dspCaixa_Loja: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCaixaLoja
    Left = 505
    Top = 555
  end
  object cdsCaixaLoja: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCaixa_Loja'
    OnCalcFields = cdsCaixaLojaCalcFields
    OnNewRecord = cdsCaixaLojaNewRecord
    Left = 625
    Top = 555
    object cdsCaixaLojaCAIXA_LOJA: TIntegerField
      FieldName = 'CAIXA_LOJA'
      Origin = 'CAIXA_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCaixaLojaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsCaixaLojaHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = 'HORA_ABERTURA'
      Required = True
    end
    object cdsCaixaLojaDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'DATA_FECHAMENTO'
    end
    object cdsCaixaLojaHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = 'HORA_FECHAMENTO'
    end
    object cdsCaixaLojaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsCaixaLojaVALOR_ABERTURA: TBCDField
      FieldName = 'VALOR_ABERTURA'
      Origin = 'VALOR_ABERTURA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaVALOR_MOVIMENTO: TBCDField
      FieldName = 'VALOR_MOVIMENTO'
      Origin = 'VALOR_MOVIMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
      Required = True
    end
    object cdsCaixaLojaNOME_FUNCIONARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FUNCIONARIO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 40
      Lookup = True
    end
    object cdsCaixaLojaSTATUS_CAIXA: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS_CAIXA'
      Size = 15
      Calculated = True
    end
    object cdsCaixaLojaVALOR_DINHEIRO: TBCDField
      FieldName = 'VALOR_DINHEIRO'
      Origin = 'VALOR_DINHEIRO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaVALOR_CHEQUE: TBCDField
      FieldName = 'VALOR_CHEQUE'
      Origin = 'VALOR_CHEQUE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaVALOR_CARTAO: TBCDField
      FieldName = 'VALOR_CARTAO'
      Origin = 'VALOR_CARTAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaVALOR_PRAZO: TBCDField
      FieldName = 'VALOR_PRAZO'
      Origin = 'VALOR_PRAZO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaOUTROS_VALORES: TBCDField
      FieldName = 'OUTROS_VALORES'
      Origin = 'OUTROS_VALORES'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaTOTAL_DEBITOS: TBCDField
      FieldName = 'TOTAL_DEBITOS'
      Origin = 'TOTAL_DEBITOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaLojaTOTAL_CREDITOS: TBCDField
      FieldName = 'TOTAL_CREDITOS'
      Origin = 'TOTAL_CREDITOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspItemCaixaLoja: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemCaixaLoja
    Left = 505
    Top = 604
  end
  object cdsItemCaixaLoja: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItemCaixaLoja'
    OnCalcFields = cdsItemCaixaLojaCalcFields
    Left = 625
    Top = 604
    object cdsItemCaixaLojaITEM_CAIXA_LOJA: TIntegerField
      FieldName = 'ITEM_CAIXA_LOJA'
      Origin = 'ITEM_CAIXA_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemCaixaLojaCAIXA_LOJA: TIntegerField
      FieldName = 'CAIXA_LOJA'
      Origin = 'CAIXA_LOJA'
    end
    object cdsItemCaixaLojaFAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      Origin = 'FAVORECIDO'
      Required = True
      Size = 60
    end
    object cdsItemCaixaLojaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
    end
    object cdsItemCaixaLojaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsItemCaixaLojaTIPO_LANCAMENTO: TSmallintField
      FieldName = 'TIPO_LANCAMENTO'
      Origin = 'TIPO_LANCAMENTO'
      Required = True
    end
    object cdsItemCaixaLojaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemCaixaLojaCREDITO_DEBITO: TStringField
      FieldName = 'CREDITO_DEBITO'
      Origin = 'CREDITO_DEBITO'
      Required = True
      Size = 1
    end
    object cdsItemCaixaLojaSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemCaixaLojaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 100
    end
    object cdsItemCaixaLojaCONTA_MOVIMENTO: TStringField
      FieldName = 'CONTA_MOVIMENTO'
      Origin = 'CONTA_MOVIMENTO'
      Size = 10
    end
    object cdsItemCaixaLojaPLANO_CONTA: TIntegerField
      FieldName = 'PLANO_CONTA'
      Origin = 'PLANO_CONTA'
    end
    object cdsItemCaixaLojaITEM_PLANO_CONTA: TIntegerField
      FieldName = 'ITEM_PLANO_CONTA'
      Origin = 'ITEM_PLANO_CONTA'
    end
    object cdsItemCaixaLojaDEBITO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DEBITO'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsItemCaixaLojaCREDITO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CREDITO'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object cdsItemCaixaLojaS_TIPO_LANCAMENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_TIPO_LANCAMENTO'
      Calculated = True
    end
    object cdsItemCaixaLojaHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      DisplayFormat = 'hh:mm:ss'
    end
    object cdsItemCaixaLojaFUNCIONARIO_RETIRANTE: TStringField
      FieldName = 'FUNCIONARIO_RETIRANTE'
      Origin = 'FUNCIONARIO_RETIRANTE'
      Size = 40
    end
    object cdsItemCaixaLojaFUNCIONARIO_AUTORIZADOR: TStringField
      FieldName = 'FUNCIONARIO_AUTORIZADOR'
      Origin = 'FUNCIONARIO_AUTORIZADOR'
      Size = 40
    end
  end
  object cdsValorPrazoPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspValorPrazoPedido'
    Left = 625
    Top = 324
    object cdsValorPrazoPedidoTOTAL_PRAZO: TBCDField
      FieldName = 'TOTAL_PRAZO'
      Origin = 'TOTAL_PRAZO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspValorPrazoPedido: TDataSetProvider
    DataSet = dmDBEXMaster.fdqValorPrazoPedido
    Left = 505
    Top = 324
  end
  object cdsParcelamentoCX: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspParcelamentoCX'
    OnCalcFields = cdsItemCaixaLojaCalcFields
    Left = 625
    Top = 648
    object cdsParcelamentoCXNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object cdsParcelamentoCXPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'PARCELAS'
      Required = True
    end
    object cdsParcelamentoCXFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParcelamentoCXPLANODECONTAS: TIntegerField
      FieldName = 'PLANODECONTAS'
      Origin = 'PLANODECONTAS'
    end
    object cdsParcelamentoCXITEMPLANODECONTAS: TIntegerField
      FieldName = 'ITEMPLANODECONTAS'
      Origin = 'ITEMPLANODECONTAS'
    end
    object cdsParcelamentoCXLANCAMENTO: TIntegerField
      FieldName = 'LANCAMENTO'
      Origin = 'LANCAMENTO'
    end
  end
  object dspParcelamentoCX: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParcelamentoCX
    Left = 505
    Top = 648
  end
  object cdsParcelasCRE_TEMP_CX: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    OnCalcFields = cdsItemCaixaLojaCalcFields
    Left = 740
    Top = 94
    object cdsParcelasCRE_TEMP_CXPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object cdsParcelasCRE_TEMP_CXNUM_PARCELA: TIntegerField
      FieldName = 'NUM_PARCELA'
    end
    object cdsParcelasCRE_TEMP_CXVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'VENCIMENTO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsParcelasCRE_TEMP_CXVALOR: TCurrencyField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsParcelasCRE_TEMP_CXPLANO_CONTA: TIntegerField
      FieldName = 'PLANO_CONTA'
    end
    object cdsParcelasCRE_TEMP_CXITEM_PLANO_CONTA: TIntegerField
      FieldName = 'ITEM_PLANO_CONTA'
    end
    object cdsParcelasCRE_TEMP_CXLANCAMENTO: TIntegerField
      FieldName = 'LANCAMENTO'
    end
    object cdsParcelasCRE_TEMP_CXDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsParcelasCRE_TEMP_CXDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsParcelasCRE_TEMP_CXNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 40
    end
    object cdsParcelasCRE_TEMP_CXCNPJ_CLIENTE: TStringField
      FieldName = 'CNPJ_CLIENTE'
    end
    object cdsParcelasCRE_TEMP_CXMORA_RIARIA: TCurrencyField
      FieldName = 'MORA_RIARIA'
    end
  end
  object cdsCst: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCst'
    Left = 625
    Top = 370
    object cdsCstCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsCstDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsCstOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsCstCRT: TIntegerField
      FieldName = 'CRT'
      Origin = 'CRT'
      Required = True
    end
    object cdsCstCSOSN: TIntegerField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
    end
    object cdsCstCST_TRANSICAO: TStringField
      FieldName = 'CST_TRANSICAO'
      Origin = 'CST_TRANSICAO'
      Size = 3
    end
  end
  object dspCst: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCst
    Left = 505
    Top = 370
  end
  object cdsNcmNbs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNcmNbs'
    OnNewRecord = cdsNcmNbsNewRecord
    Left = 392
    Top = 1500
    object cdsNcmNbsCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      Size = 15
    end
    object cdsNcmNbsNOME_NCM: TStringField
      FieldName = 'NOME_NCM'
      Origin = 'NOME_NCM'
      Size = 55
    end
    object cdsNcmNbsNCM_NBS: TSmallintField
      FieldName = 'NCM_NBS'
      Origin = 'NCM_NBS'
      Required = True
    end
    object cdsNcmNbsEX_TIPI: TStringField
      FieldName = 'EX_TIPI'
      Origin = 'EX_TIPI'
      Size = 2
    end
    object cdsNcmNbsCARGA_NAC_FEDERAL: TBCDField
      FieldName = 'CARGA_NAC_FEDERAL'
      Origin = 'CARGA_NAC_FEDERAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsCARGA_IMP_FEDERAL: TBCDField
      FieldName = 'CARGA_IMP_FEDERAL'
      Origin = 'CARGA_IMP_FEDERAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsCARGA_ESTADUAL: TBCDField
      FieldName = 'CARGA_ESTADUAL'
      Origin = 'CARGA_ESTADUAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsCARGA_MUNICIPAL: TBCDField
      FieldName = 'CARGA_MUNICIPAL'
      Origin = 'CARGA_MUNICIPAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 100
    end
    object cdsNcmNbsFONTE: TStringField
      FieldName = 'FONTE'
      Origin = 'FONTE'
      Size = 100
    end
    object cdsNcmNbsCOD_NBM: TStringField
      FieldName = 'COD_NBM'
      Origin = 'COD_NBM'
      Size = 15
    end
    object cdsNcmNbsNOME_NBM: TStringField
      FieldName = 'NOME_NBM'
      Origin = 'NOME_NBM'
      Size = 55
    end
    object cdsNcmNbsALIQUOTA_NACIONAL: TBCDField
      FieldName = 'ALIQUOTA_NACIONAL'
      Origin = 'ALIQUOTA_NACIONAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsALIQUOTA_IMPORTACAO: TBCDField
      FieldName = 'ALIQUOTA_IMPORTACAO'
      Origin = 'ALIQUOTA_IMPORTACAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsALIQ_EX_NAC_TIPI: TBCDField
      FieldName = 'ALIQ_EX_NAC_TIPI'
      Origin = 'ALIQ_EX_NAC_TIPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsALIQ_EX_IMP_TIPI: TBCDField
      FieldName = 'ALIQ_EX_IMP_TIPI'
      Origin = 'ALIQ_EX_IMP_TIPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNcmNbsTABELA_CEST: TStringField
      FieldName = 'TABELA_CEST'
      Origin = 'TABELA_CEST'
      Size = 15
    end
    object cdsNcmNbsDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsNcmNbsDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      EditMask = '99/99/9999;0;_'
    end
  end
  object cdsConfigBuscaCEP: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspConfigBuscaCEP'
    OnCalcFields = cdsItemCaixaLojaCalcFields
    OnNewRecord = cdsConfigBuscaCEPNewRecord
    Left = 625
    Top = 693
    object cdsConfigBuscaCEPWEB_SERVICE: TSmallintField
      FieldName = 'WEB_SERVICE'
      Origin = 'WEB_SERVICE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConfigBuscaCEPPROXY_HOST: TStringField
      FieldName = 'PROXY_HOST'
      Origin = 'PROXY_HOST'
      Size = 200
    end
    object cdsConfigBuscaCEPPROXY_PORT: TStringField
      FieldName = 'PROXY_PORT'
      Origin = 'PROXY_PORT'
      Size = 200
    end
    object cdsConfigBuscaCEPPROXY_USER: TStringField
      FieldName = 'PROXY_USER'
      Origin = 'PROXY_USER'
      Size = 200
    end
    object cdsConfigBuscaCEPPROXY_PASSWORD: TStringField
      FieldName = 'PROXY_PASSWORD'
      Origin = 'PROXY_PASSWORD'
      Size = 200
    end
    object cdsConfigBuscaCEPCHAVE_ACESSO: TStringField
      FieldName = 'CHAVE_ACESSO'
      Origin = 'CHAVE_ACESSO'
      Size = 200
    end
  end
  object dspConfigBuscaCEP: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConfBuscaCep
    Left = 505
    Top = 693
  end
  object dspOrdemProducao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqOrdemProducao
    Left = 505
    Top = 417
  end
  object cdsOrdemProducao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspOrdemProducao'
    OnCalcFields = cdsOrdemProducaoCalcFields
    OnNewRecord = cdsOrdemProducaoNewRecord
    Left = 625
    Top = 417
    object cdsOrdemProducaoORDEM_DE_PRODUCAO: TIntegerField
      FieldName = 'ORDEM_DE_PRODUCAO'
      Origin = 'ORDEM_DE_PRODUCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrdemProducaoFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrdemProducaoSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
    end
    object cdsOrdemProducaoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
      Required = True
    end
    object cdsOrdemProducaoDATA_PREVISTA: TDateField
      FieldName = 'DATA_PREVISTA'
      Origin = 'DATA_PREVISTA'
      Required = True
    end
    object cdsOrdemProducaoDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      Origin = 'DATA_TERMINO'
    end
    object cdsOrdemProducaoORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO'
    end
    object cdsOrdemProducaoPRODUTO_FINAL: TIntegerField
      FieldName = 'PRODUTO_FINAL'
      Origin = 'PRODUTO_FINAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrdemProducaoQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsOrdemProducaoTIPO_PRODUCAO: TSmallintField
      FieldName = 'TIPO_PRODUCAO'
      Origin = 'TIPO_PRODUCAO'
      Required = True
    end
    object cdsOrdemProducaoFUNCIONARIO_RESPONSAVEL: TIntegerField
      FieldName = 'FUNCIONARIO_RESPONSAVEL'
      Origin = 'FUNCIONARIO_RESPONSAVEL'
      Required = True
    end
    object cdsOrdemProducaoNOME_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_PRODUTO'
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_FINAL'
      Size = 100
      Lookup = True
    end
    object cdsOrdemProducaoS_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_SITUACAO'
      Calculated = True
    end
    object cdsOrdemProducaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsOrdemProducaoRENDIMENTO: TBCDField
      FieldName = 'RENDIMENTO'
      Origin = 'RENDIMENTO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsOrdemProducaoESTOQUE_ATUAL: TBCDField
      FieldName = 'ESTOQUE_ATUAL'
      Origin = 'ESTOQUE_ATUAL'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsOrdemProducaoQUANT_PRODUZIDA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'QUANT_PRODUZIDA'
      DisplayFormat = '#,##0.000'
      Calculated = True
    end
    object cdsOrdemProducaoDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_FINAL'
      Size = 100
      Lookup = True
    end
    object cdsOrdemProducaoUND_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'UND_PRODUTO'
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'UNIDADE'
      KeyFields = 'PRODUTO_FINAL'
      Size = 3
      Lookup = True
    end
    object cdsOrdemProducaoS_TIPO_PRODUCAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_TIPO_PRODUCAO'
      Size = 15
      Calculated = True
    end
  end
  object cdsItemOrdemProducao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItemOrdemProducao'
    OnNewRecord = cdsItemOrdemProducaoNewRecord
    Left = 625
    Top = 463
    object cdsItemOrdemProducaoFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemOrdemProducaoORDEM_DE_PRODUCAO: TIntegerField
      FieldName = 'ORDEM_DE_PRODUCAO'
      Origin = 'ORDEM_DE_PRODUCAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemOrdemProducaoPRODUTO_INSUMO: TIntegerField
      FieldName = 'PRODUTO_INSUMO'
      Origin = 'PRODUTO_INSUMO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemOrdemProducaoQUANTIDADE_PREVISTA: TBCDField
      FieldName = 'QUANTIDADE_PREVISTA'
      Origin = 'QUANTIDADE_PREVISTA'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemOrdemProducaoQUANTIDADE_UTILIZADA: TBCDField
      FieldName = 'QUANTIDADE_UTILIZADA'
      Origin = 'QUANTIDADE_UTILIZADA'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemOrdemProducaoPERDA: TBCDField
      FieldName = 'PERDA'
      Origin = 'PERDA'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 2
    end
    object cdsItemOrdemProducaoESTOQUE_ATUAL: TBCDField
      FieldName = 'ESTOQUE_ATUAL'
      Origin = 'ESTOQUE_ATUAL'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemOrdemProducaoFLAG_SALDO: TSmallintField
      FieldName = 'FLAG_SALDO'
      Origin = 'FLAG_SALDO'
      Required = True
    end
    object cdsItemOrdemProducaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 40
    end
    object cdsItemOrdemProducaoDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_INSUMO'
      Size = 100
      Lookup = True
    end
  end
  object dspItemOrdemProducao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemOrdemProducao
    Left = 505
    Top = 463
  end
  object cdsProdutoFT: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspProdutoFT'
    Left = 625
    Top = 738
    object cdsProdutoFTPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutoFTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsProdutoFTGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object cdsProdutoFTSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
      Origin = 'SUBGRUPO'
    end
    object cdsProdutoFTSECAO: TIntegerField
      FieldName = 'SECAO'
      Origin = 'SECAO'
    end
    object cdsProdutoFTUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoFTUNIDADEEMBALAGEM: TBCDField
      FieldName = 'UNIDADEEMBALAGEM'
      Origin = 'UNIDADEEMBALAGEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoFTPESOLIQUIDO: TBCDField
      FieldName = 'PESOLIQUIDO'
      Origin = 'PESOLIQUIDO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoFTPESOBRUTO: TBCDField
      FieldName = 'PESOBRUTO'
      Origin = 'PESOBRUTO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoFTTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      Required = True
    end
    object cdsProdutoFTATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsProdutoFTREDBASECALCULO: TFMTBCDField
      FieldName = 'REDBASECALCULO'
      Origin = 'REDBASECALCULO'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsProdutoFTCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsProdutoFTSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsProdutoFTFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object cdsProdutoFTNBM: TStringField
      FieldName = 'NBM'
      Origin = 'NBM'
      Size = 15
    end
    object cdsProdutoFTNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object cdsProdutoFTDOLARVENDA: TBCDField
      FieldName = 'DOLARVENDA'
      Origin = 'DOLARVENDA'
      Required = True
      Precision = 18
    end
    object cdsProdutoFTINFNUTRICIONAL: TIntegerField
      FieldName = 'INFNUTRICIONAL'
      Origin = 'INFNUTRICIONAL'
    end
    object cdsProdutoFTCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object cdsProdutoFTISENTOPISCOFINS: TSmallintField
      FieldName = 'ISENTOPISCOFINS'
      Origin = 'ISENTOPISCOFINS'
      Required = True
    end
    object cdsProdutoFTSIMILAR: TIntegerField
      FieldName = 'SIMILAR'
      Origin = '"SIMILAR"'
    end
    object cdsProdutoFTFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
      Origin = 'FABRICANTE'
    end
    object cdsProdutoFTALTERAR_PRECOVENDA_PDVI: TSmallintField
      FieldName = 'ALTERAR_PRECOVENDA_PDVI'
      Origin = 'ALTERAR_PRECOVENDA_PDVI'
      Required = True
    end
    object cdsProdutoFTLITRAGEM: TBCDField
      FieldName = 'LITRAGEM'
      Origin = 'LITRAGEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoFTCF_IPI: TSmallintField
      FieldName = 'CF_IPI'
      Origin = 'CF_IPI'
      Required = True
    end
    object cdsProdutoFTCOMPOEM_CESTA_BASICA: TSmallintField
      FieldName = 'COMPOEM_CESTA_BASICA'
      Origin = 'COMPOEM_CESTA_BASICA'
      Required = True
    end
    object cdsProdutoFTAUTOR1: TIntegerField
      FieldName = 'AUTOR1'
      Origin = 'AUTOR1'
    end
    object cdsProdutoFTAUTOR2: TIntegerField
      FieldName = 'AUTOR2'
      Origin = 'AUTOR2'
    end
    object cdsProdutoFTPERMITE_VENDA_FRACIONADA: TSmallintField
      FieldName = 'PERMITE_VENDA_FRACIONADA'
      Origin = 'PERMITE_VENDA_FRACIONADA'
      Required = True
    end
    object cdsProdutoFTUNIDADE_ATACADO: TBCDField
      FieldName = 'UNIDADE_ATACADO'
      Origin = 'UNIDADE_ATACADO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoFTALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsProdutoFTALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsProdutoFTVISIBILIDADE: TSmallintField
      FieldName = 'VISIBILIDADE'
      Origin = 'VISIBILIDADE'
      Required = True
    end
    object cdsProdutoFTCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsProdutoFTCST_PIS: TIntegerField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
    end
    object cdsProdutoFTCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
    end
    object cdsProdutoFTTIPO_ITEM: TSmallintField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
      Required = True
    end
    object cdsProdutoFTMVA: TIntegerField
      FieldName = 'MVA'
      Origin = 'MVA'
    end
    object cdsProdutoFTPAUTA_FISCAL: TIntegerField
      FieldName = 'PAUTA_FISCAL'
      Origin = 'PAUTA_FISCAL'
    end
    object cdsProdutoFTLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
    end
    object cdsProdutoFTPRODUTO_ORIGEM: TIntegerField
      FieldName = 'PRODUTO_ORIGEM'
      Origin = 'PRODUTO_ORIGEM'
    end
    object cdsProdutoFTCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsProdutoFTCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsProdutoFTNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsProdutoFTUND_ATACADO: TStringField
      FieldName = 'UND_ATACADO'
      Origin = 'UND_ATACADO'
      Size = 2
    end
    object cdsProdutoFTALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsProdutoFTALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsProdutoFTCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
    object cdsProdutoFTCODIGO_ANP: TStringField
      FieldName = 'CODIGO_ANP'
      Origin = 'CODIGO_ANP'
      Size = 9
    end
    object cdsProdutoFTCARGA_TRIBUTARIA_NAC: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_NAC'
      Origin = 'CARGA_TRIBUTARIA_NAC'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoFTCARGA_TRIBUTARIA_IMP: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_IMP'
      Origin = 'CARGA_TRIBUTARIA_IMP'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoFTDESCONTO_PERSONALIZADO: TSmallintField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
    end
    object cdsProdutoFTORIGEM_MERCADORIA: TSmallintField
      FieldName = 'ORIGEM_MERCADORIA'
      Origin = 'ORIGEM_MERCADORIA'
    end
    object cdsProdutoFTCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
  end
  object dspProdutoFT: TDataSetProvider
    DataSet = dmDBEXMaster.fdqProdutosFT
    Left = 505
    Top = 738
  end
  object cdsProdutoItemFT: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspProdutoItemFT'
    Left = 625
    Top = 785
    object cdsProdutoItemFTPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutoItemFTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsProdutoItemFTGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object cdsProdutoItemFTSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
      Origin = 'SUBGRUPO'
    end
    object cdsProdutoItemFTSECAO: TIntegerField
      FieldName = 'SECAO'
      Origin = 'SECAO'
    end
    object cdsProdutoItemFTUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoItemFTUNIDADEEMBALAGEM: TBCDField
      FieldName = 'UNIDADEEMBALAGEM'
      Origin = 'UNIDADEEMBALAGEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTPESOLIQUIDO: TBCDField
      FieldName = 'PESOLIQUIDO'
      Origin = 'PESOLIQUIDO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTPESOBRUTO: TBCDField
      FieldName = 'PESOBRUTO'
      Origin = 'PESOBRUTO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      Required = True
    end
    object cdsProdutoItemFTATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsProdutoItemFTREDBASECALCULO: TFMTBCDField
      FieldName = 'REDBASECALCULO'
      Origin = 'REDBASECALCULO'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsProdutoItemFTCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsProdutoItemFTSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsProdutoItemFTFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object cdsProdutoItemFTNBM: TStringField
      FieldName = 'NBM'
      Origin = 'NBM'
      Size = 15
    end
    object cdsProdutoItemFTNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object cdsProdutoItemFTDOLARVENDA: TBCDField
      FieldName = 'DOLARVENDA'
      Origin = 'DOLARVENDA'
      Required = True
      Precision = 18
    end
    object cdsProdutoItemFTINFNUTRICIONAL: TIntegerField
      FieldName = 'INFNUTRICIONAL'
      Origin = 'INFNUTRICIONAL'
    end
    object cdsProdutoItemFTCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object cdsProdutoItemFTISENTOPISCOFINS: TSmallintField
      FieldName = 'ISENTOPISCOFINS'
      Origin = 'ISENTOPISCOFINS'
      Required = True
    end
    object cdsProdutoItemFTSIMILAR: TIntegerField
      FieldName = 'SIMILAR'
      Origin = '"SIMILAR"'
    end
    object cdsProdutoItemFTFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
      Origin = 'FABRICANTE'
    end
    object cdsProdutoItemFTALTERAR_PRECOVENDA_PDVI: TSmallintField
      FieldName = 'ALTERAR_PRECOVENDA_PDVI'
      Origin = 'ALTERAR_PRECOVENDA_PDVI'
      Required = True
    end
    object cdsProdutoItemFTLITRAGEM: TBCDField
      FieldName = 'LITRAGEM'
      Origin = 'LITRAGEM'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTCF_IPI: TSmallintField
      FieldName = 'CF_IPI'
      Origin = 'CF_IPI'
      Required = True
    end
    object cdsProdutoItemFTCOMPOEM_CESTA_BASICA: TSmallintField
      FieldName = 'COMPOEM_CESTA_BASICA'
      Origin = 'COMPOEM_CESTA_BASICA'
      Required = True
    end
    object cdsProdutoItemFTAUTOR1: TIntegerField
      FieldName = 'AUTOR1'
      Origin = 'AUTOR1'
    end
    object cdsProdutoItemFTAUTOR2: TIntegerField
      FieldName = 'AUTOR2'
      Origin = 'AUTOR2'
    end
    object cdsProdutoItemFTPERMITE_VENDA_FRACIONADA: TSmallintField
      FieldName = 'PERMITE_VENDA_FRACIONADA'
      Origin = 'PERMITE_VENDA_FRACIONADA'
      Required = True
    end
    object cdsProdutoItemFTUNIDADE_ATACADO: TBCDField
      FieldName = 'UNIDADE_ATACADO'
      Origin = 'UNIDADE_ATACADO'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsProdutoItemFTALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsProdutoItemFTVISIBILIDADE: TSmallintField
      FieldName = 'VISIBILIDADE'
      Origin = 'VISIBILIDADE'
      Required = True
    end
    object cdsProdutoItemFTCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsProdutoItemFTCST_PIS: TIntegerField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
    end
    object cdsProdutoItemFTCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
    end
    object cdsProdutoItemFTTIPO_ITEM: TSmallintField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
      Required = True
    end
    object cdsProdutoItemFTMVA: TIntegerField
      FieldName = 'MVA'
      Origin = 'MVA'
    end
    object cdsProdutoItemFTPAUTA_FISCAL: TIntegerField
      FieldName = 'PAUTA_FISCAL'
      Origin = 'PAUTA_FISCAL'
    end
    object cdsProdutoItemFTLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
    end
    object cdsProdutoItemFTPRODUTO_ORIGEM: TIntegerField
      FieldName = 'PRODUTO_ORIGEM'
      Origin = 'PRODUTO_ORIGEM'
    end
    object cdsProdutoItemFTCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsProdutoItemFTCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsProdutoItemFTNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsProdutoItemFTUND_ATACADO: TStringField
      FieldName = 'UND_ATACADO'
      Origin = 'UND_ATACADO'
      Size = 2
    end
    object cdsProdutoItemFTALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsProdutoItemFTALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsProdutoItemFTCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
    object cdsProdutoItemFTCODIGO_ANP: TStringField
      FieldName = 'CODIGO_ANP'
      Origin = 'CODIGO_ANP'
      Size = 9
    end
    object cdsProdutoItemFTCARGA_TRIBUTARIA_NAC: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_NAC'
      Origin = 'CARGA_TRIBUTARIA_NAC'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTCARGA_TRIBUTARIA_IMP: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_IMP'
      Origin = 'CARGA_TRIBUTARIA_IMP'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTDESCONTO_PERSONALIZADO: TSmallintField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
    end
    object cdsProdutoItemFTORIGEM_MERCADORIA: TSmallintField
      FieldName = 'ORIGEM_MERCADORIA'
      Origin = 'ORIGEM_MERCADORIA'
    end
    object cdsProdutoItemFTCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object cdsProdutoItemFTPRODUTO_1: TIntegerField
      FieldName = 'PRODUTO_1'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTCUSTOBRUTO: TBCDField
      FieldName = 'CUSTOBRUTO'
      Origin = 'CUSTOBRUTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTCUSTOBRUTOANTERIOR: TBCDField
      FieldName = 'CUSTOBRUTOANTERIOR'
      Origin = 'CUSTOBRUTOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTCUSTOLIQUIDO: TBCDField
      FieldName = 'CUSTOLIQUIDO'
      Origin = 'CUSTOLIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTCUSTOLIQUIDOANTERIOR: TBCDField
      FieldName = 'CUSTOLIQUIDOANTERIOR'
      Origin = 'CUSTOLIQUIDOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTMENORPRECO: TBCDField
      FieldName = 'MENORPRECO'
      Origin = 'MENORPRECO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTPRECOCALCULADO: TBCDField
      FieldName = 'PRECOCALCULADO'
      Origin = 'PRECOCALCULADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTPRECOPROVISORIO: TBCDField
      FieldName = 'PRECOPROVISORIO'
      Origin = 'PRECOPROVISORIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTPRECODEVENDA: TBCDField
      FieldName = 'PRECODEVENDA'
      Origin = 'PRECODEVENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTPRECODEVENDAANTERIOR: TBCDField
      FieldName = 'PRECODEVENDAANTERIOR'
      Origin = 'PRECODEVENDAANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTALTERACAO: TDateField
      FieldName = 'ALTERACAO'
      Origin = 'ALTERACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTREMARCACAO: TDateField
      FieldName = 'REMARCACAO'
      Origin = 'REMARCACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTLUCROICMSR: TBCDField
      FieldName = 'LUCROICMSR'
      Origin = 'LUCROICMSR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTIMPOSTOSFEDERAIS: TBCDField
      FieldName = 'IMPOSTOSFEDERAIS'
      Origin = 'IMPOSTOSFEDERAIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTCUSTOOPERACIONAL: TBCDField
      FieldName = 'CUSTOOPERACIONAL'
      Origin = 'CUSTOOPERACIONAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTCOMISSAOVENDA: TBCDField
      FieldName = 'COMISSAOVENDA'
      Origin = 'COMISSAOVENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTLUCROLIQUIDO: TBCDField
      FieldName = 'LUCROLIQUIDO'
      Origin = 'LUCROLIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTDEPOSITO: TBCDField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTDEPOSITO1: TBCDField
      FieldName = 'DEPOSITO1'
      Origin = 'DEPOSITO1'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTLOJA: TBCDField
      FieldName = 'LOJA'
      Origin = 'LOJA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTLOJA1: TBCDField
      FieldName = 'LOJA1'
      Origin = 'LOJA1'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTSALDOANTERIOR: TBCDField
      FieldName = 'SALDOANTERIOR'
      Origin = 'SALDOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTSALDOMINIMO: TBCDField
      FieldName = 'SALDOMINIMO'
      Origin = 'SALDOMINIMO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTSALDOMAXIMO: TBCDField
      FieldName = 'SALDOMAXIMO'
      Origin = 'SALDOMAXIMO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTSETORDEBALANCA: TIntegerField
      FieldName = 'SETORDEBALANCA'
      Origin = 'SETORDEBALANCA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTPRODUTOATIVO: TSmallintField
      FieldName = 'PRODUTOATIVO'
      Origin = 'PRODUTOATIVO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTPROMOCAO: TSmallintField
      FieldName = 'PROMOCAO'
      Origin = 'PROMOCAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTTECLAASSOCIADA: TIntegerField
      FieldName = 'TECLAASSOCIADA'
      Origin = 'TECLAASSOCIADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTVALIDADE: TIntegerField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTTECLADO: TSmallintField
      FieldName = 'TECLADO'
      Origin = 'TECLADO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTREDUCAOBASEDECALCULO: TBCDField
      FieldName = 'REDUCAOBASEDECALCULO'
      Origin = 'REDUCAOBASEDECALCULO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTDESCONTOPROGRAMADO: TBCDField
      FieldName = 'DESCONTOPROGRAMADO'
      Origin = 'DESCONTOPROGRAMADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTDESCRICAOCUPOMFISCAL: TStringField
      FieldName = 'DESCRICAOCUPOMFISCAL'
      Origin = 'DESCRICAOCUPOMFISCAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsProdutoItemFTDESCRICAOGONDOLA1: TStringField
      FieldName = 'DESCRICAOGONDOLA1'
      Origin = 'DESCRICAOGONDOLA1'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsProdutoItemFTDESCRICAOGONDOLA2: TStringField
      FieldName = 'DESCRICAOGONDOLA2'
      Origin = 'DESCRICAOGONDOLA2'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsProdutoItemFTDESCRICAOBALANCA: TStringField
      FieldName = 'DESCRICAOBALANCA'
      Origin = 'DESCRICAOBALANCA'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsProdutoItemFTDESCRICAOTIRATEIMA: TStringField
      FieldName = 'DESCRICAOTIRATEIMA'
      Origin = 'DESCRICAOTIRATEIMA'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsProdutoItemFTENVIARPARABALANCA: TSmallintField
      FieldName = 'ENVIARPARABALANCA'
      Origin = 'ENVIARPARABALANCA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTDESCONTONACOMPRA: TBCDField
      FieldName = 'DESCONTONACOMPRA'
      Origin = 'DESCONTONACOMPRA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTCREDITODEICMS: TBCDField
      FieldName = 'CREDITODEICMS'
      Origin = 'CREDITODEICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTIPI: TBCDField
      FieldName = 'IPI'
      Origin = 'IPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTOUTROSCUSTOS: TBCDField
      FieldName = 'OUTROSCUSTOS'
      Origin = 'OUTROSCUSTOS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTFRETE: TBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTICMSAPAGAR: TBCDField
      FieldName = 'ICMSAPAGAR'
      Origin = 'ICMSAPAGAR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTDESCONTONAVENDA: TBCDField
      FieldName = 'DESCONTONAVENDA'
      Origin = 'DESCONTONAVENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTVALORDODESCONTONACOMPRA: TBCDField
      FieldName = 'VALORDODESCONTONACOMPRA'
      Origin = 'VALORDODESCONTONACOMPRA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTVALORDOCREDITODEICMSR: TBCDField
      FieldName = 'VALORDOCREDITODEICMSR'
      Origin = 'VALORDOCREDITODEICMSR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTVALORDEOUTROSCUSTOS: TBCDField
      FieldName = 'VALORDEOUTROSCUSTOS'
      Origin = 'VALORDEOUTROSCUSTOS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTVALORDOFRETE: TBCDField
      FieldName = 'VALORDOFRETE'
      Origin = 'VALORDOFRETE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTVALORDOICMSR: TBCDField
      FieldName = 'VALORDOICMSR'
      Origin = 'VALORDOICMSR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsProdutoItemFTPRECOPROMOCAO: TBCDField
      FieldName = 'PRECOPROMOCAO'
      Origin = 'PRECOPROMOCAO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTDESCONTOTABELA1: TCurrencyField
      FieldName = 'DESCONTOTABELA1'
      Origin = 'DESCONTOTABELA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTDESCONTOTABELA2: TCurrencyField
      FieldName = 'DESCONTOTABELA2'
      Origin = 'DESCONTOTABELA2'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTDESCONTOTABELA3: TCurrencyField
      FieldName = 'DESCONTOTABELA3'
      Origin = 'DESCONTOTABELA3'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTSUBSTITUICAOTRIBUTARIA: TCurrencyField
      FieldName = 'SUBSTITUICAOTRIBUTARIA'
      Origin = 'SUBSTITUICAOTRIBUTARIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTULTIMA_ENTRADA: TDateField
      FieldName = 'ULTIMA_ENTRADA'
      Origin = 'ULTIMA_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTSALDO_RESERVADO: TBCDField
      FieldName = 'SALDO_RESERVADO'
      Origin = 'SALDO_RESERVADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object cdsProdutoItemFTULTIMA_NF_ENTRADA: TStringField
      FieldName = 'ULTIMA_NF_ENTRADA'
      Origin = 'ULTIMA_NF_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsProdutoItemFTCUSTO_MEDIO: TBCDField
      FieldName = 'CUSTO_MEDIO'
      Origin = 'CUSTO_MEDIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTCUSTO_MEDIO_ANTERIOR: TBCDField
      FieldName = 'CUSTO_MEDIO_ANTERIOR'
      Origin = 'CUSTO_MEDIO_ANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTDATA_CUSTO_MEDIO: TDateField
      FieldName = 'DATA_CUSTO_MEDIO'
      Origin = 'DATA_CUSTO_MEDIO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTDATA_CUSTO_MEDIO_ANTERIOR: TDateField
      FieldName = 'DATA_CUSTO_MEDIO_ANTERIOR'
      Origin = 'DATA_CUSTO_MEDIO_ANTERIOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutoItemFTPRECO_ATACADO: TBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTDESCRICAO_ATACADO: TStringField
      FieldName = 'DESCRICAO_ATACADO'
      Origin = 'DESCRICAO_ATACADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 44
    end
    object cdsProdutoItemFTPERCENTUAL_ISS: TBCDField
      FieldName = 'PERCENTUAL_ISS'
      Origin = 'PERCENTUAL_ISS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTPERCENTUAL_IOF: TBCDField
      FieldName = 'PERCENTUAL_IOF'
      Origin = 'PERCENTUAL_IOF'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTPERCENTUAL_CIDE: TBCDField
      FieldName = 'PERCENTUAL_CIDE'
      Origin = 'PERCENTUAL_CIDE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoItemFTSALDO_ALMOXARIFADO: TBCDField
      FieldName = 'SALDO_ALMOXARIFADO'
      Origin = 'SALDO_ALMOXARIFADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object dspProdutoItemFT: TDataSetProvider
    DataSet = dmDBEXMaster.fdqProdutosItemFT
    Left = 505
    Top = 785
  end
  object cdsLicGen: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 829
    Top = 49
    object cdsLicGenCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLicGenRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Required = True
      Size = 60
    end
    object cdsLicGenTIPO_LICENCA: TSmallintField
      FieldName = 'TIPO_LICENCA'
      Origin = 'TIPO_LICENCA'
      Required = True
    end
    object cdsLicGenMODULOS_LICENCA: TStringField
      FieldName = 'MODULOS_LICENCA'
      Origin = 'MODULOS_LICENCA'
      Required = True
      Size = 4096
    end
    object cdsLicGenDATA_LICENCA: TSQLTimeStampField
      FieldName = 'DATA_LICENCA'
      Origin = 'DATA_LICENCA'
      Required = True
    end
    object cdsLicGenVALIDADE_LICENCA: TDateField
      FieldName = 'VALIDADE_LICENCA'
      Origin = 'VALIDADE_LICENCA'
      Required = True
    end
    object cdsLicGenVALOR_LICENCA: TBCDField
      FieldName = 'VALOR_LICENCA'
      Origin = 'VALOR_LICENCA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLicGenEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object cdsLicGenDATA_ENVIO_EMAIL: TDateField
      FieldName = 'DATA_ENVIO_EMAIL'
      Origin = 'DATA_ENVIO_EMAIL'
    end
  end
  object dspCliente_Entrega: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCliente_Entrega
    Left = 505
    Top = 830
  end
  object cdsCliente_Entrega: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCliente_Entrega'
    Left = 625
    Top = 830
    object cdsCliente_EntregaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 60
    end
    object cdsCliente_EntregaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object cdsCliente_EntregaNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsCliente_EntregaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object cdsCliente_EntregaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object cdsCliente_EntregaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object cdsCliente_EntregaESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object cdsCliente_EntregaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 30
    end
    object cdsCliente_EntregaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
  end
  object dspNFSaida: TDataSetProvider
    DataSet = dmDBEXMaster.fdqNFSaida
    Left = 505
    Top = 877
  end
  object cdsNFSaida: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NFSAIDA'
    Params = <>
    ProviderName = 'dspNFSaida'
    OnCalcFields = cdsNFSaidaCalcFields
    OnNewRecord = cdsNFSaidaNewRecord
    Left = 625
    Top = 877
    object cdsNFSaidaNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNFSaidaDESTINATARIO: TIntegerField
      FieldName = 'DESTINATARIO'
      Origin = 'DESTINATARIO'
      Required = True
    end
    object cdsNFSaidaEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsNFSaidaSAIDA: TDateField
      Alignment = taRightJustify
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object cdsNFSaidaHORASAIDA: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORASAIDA'
      Origin = 'HORASAIDA'
      EditMask = '99:99:99;0;_'
    end
    object cdsNFSaidaBASECALCULOICMS: TBCDField
      FieldName = 'BASECALCULOICMS'
      Origin = 'BASECALCULOICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      Origin = 'VALORICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaBASESUBSTITUICAO: TBCDField
      FieldName = 'BASESUBSTITUICAO'
      Origin = 'BASESUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORSUBSTITUICAO: TBCDField
      FieldName = 'VALORSUBSTITUICAO'
      Origin = 'VALORSUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORDOSPRODUTOS: TBCDField
      FieldName = 'VALORDOSPRODUTOS'
      Origin = 'VALORDOSPRODUTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORDOFRETE: TBCDField
      FieldName = 'VALORDOFRETE'
      Origin = 'VALORDOFRETE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORDOSEGURO: TBCDField
      FieldName = 'VALORDOSEGURO'
      Origin = 'VALORDOSEGURO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaOUTRASDESPESAS: TBCDField
      FieldName = 'OUTRASDESPESAS'
      Origin = 'OUTRASDESPESAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Origin = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
      Origin = 'TRANSPORTADOR'
    end
    object cdsNFSaidaQUANTIDADEVOLUME: TBCDField
      FieldName = 'QUANTIDADEVOLUME'
      Origin = 'QUANTIDADEVOLUME'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsNFSaidaESPECIEVOLUME: TStringField
      FieldName = 'ESPECIEVOLUME'
      Origin = 'ESPECIEVOLUME'
      Size = 10
    end
    object cdsNFSaidaMARCAVOLUME: TStringField
      FieldName = 'MARCAVOLUME'
      Origin = 'MARCAVOLUME'
      Size = 10
    end
    object cdsNFSaidaNUMEROVOLUME: TIntegerField
      FieldName = 'NUMEROVOLUME'
      Origin = 'NUMEROVOLUME'
    end
    object cdsNFSaidaPESOBRUTO: TBCDField
      FieldName = 'PESOBRUTO'
      Origin = 'PESOBRUTO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsNFSaidaPESOLIQUIDO: TBCDField
      FieldName = 'PESOLIQUIDO'
      Origin = 'PESOLIQUIDO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsNFSaidaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsNFSaidaPLACAVEICULO: TStringField
      FieldName = 'PLACAVEICULO'
      Origin = 'PLACAVEICULO'
      Size = 15
    end
    object cdsNFSaidaUFVEICULO: TStringField
      FieldName = 'UFVEICULO'
      Origin = 'UFVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsNFSaidaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsNFSaidaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsNFSaidaTIPOCOBRANCA: TSmallintField
      FieldName = 'TIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA'
      Required = True
    end
    object cdsNFSaidaDESTINATARIO_: TStringField
      Alignment = taRightJustify
      FieldName = 'DESTINATARIO_'
      Origin = 'DESTINATARIO_'
      Required = True
    end
    object cdsNFSaidaDESCONTO_ST: TBCDField
      FieldName = 'DESCONTO_ST'
      Origin = 'DESCONTO_ST'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaTIPO_CONTABIL: TSmallintField
      FieldName = 'TIPO_CONTABIL'
      Origin = 'TIPO_CONTABIL'
      Required = True
    end
    object cdsNFSaidaENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Origin = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsNFSaidaBASE_ISSQN_R: TBCDField
      FieldName = 'BASE_ISSQN_R'
      Origin = 'BASE_ISSQN_R'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ISSQN_R: TBCDField
      FieldName = 'VALOR_ISSQN_R'
      Origin = 'VALOR_ISSQN_R'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaPERCENTUAL_PIS: TCurrencyField
      FieldName = 'PERCENTUAL_PIS'
      Origin = 'PERCENTUAL_PIS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsNFSaidaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaPERCENTUAL_COFINS: TCurrencyField
      FieldName = 'PERCENTUAL_COFINS'
      Origin = 'PERCENTUAL_COFINS'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsNFSaidaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaDANFE_CANCELADA: TSmallintField
      FieldName = 'DANFE_CANCELADA'
      Origin = 'DANFE_CANCELADA'
      Required = True
    end
    object cdsNFSaidaDANFE_INUTILIZADA: TSmallintField
      FieldName = 'DANFE_INUTILIZADA'
      Origin = 'DANFE_INUTILIZADA'
      Required = True
    end
    object cdsNFSaidaDANFE_CONTINGENCIA: TSmallintField
      FieldName = 'DANFE_CONTINGENCIA'
      Origin = 'DANFE_CONTINGENCIA'
      Required = True
    end
    object cdsNFSaidaNUMERO_DANFE: TStringField
      Alignment = taCenter
      FieldName = 'NUMERO_DANFE'
      Origin = 'NUMERO_DANFE'
      Size = 100
    end
    object cdsNFSaidaPROTOCOLO_DANFE: TStringField
      FieldName = 'PROTOCOLO_DANFE'
      Origin = 'PROTOCOLO_DANFE'
      Size = 100
    end
    object cdsNFSaidaLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      Origin = 'LOCAL_EMBARQUE'
      Size = 50
    end
    object cdsNFSaidaSERIE: TStringField
      Alignment = taRightJustify
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object cdsNFSaidaVALOR_TOTAL_IMPOSTOS: TBCDField
      FieldName = 'VALOR_TOTAL_IMPOSTOS'
      Origin = 'VALOR_TOTAL_IMPOSTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaFINALIDADE_NF: TSmallintField
      FieldName = 'FINALIDADE_NF'
      Origin = 'FINALIDADE_NF'
      Required = True
    end
    object cdsNFSaidaPROT_NF_REFERENCIA: TStringField
      FieldName = 'PROT_NF_REFERENCIA'
      Origin = 'PROT_NF_REFERENCIA'
      Size = 50
    end
    object cdsNFSaidaINFO_FISCO: TMemoField
      FieldName = 'INFO_FISCO'
      Origin = 'INFO_FISCO'
      BlobType = ftMemo
    end
    object cdsNFSaidaCANCELAMENTO_ESTEMPORANEO: TSmallintField
      FieldName = 'CANCELAMENTO_ESTEMPORANEO'
      Origin = 'CANCELAMENTO_ESTEMPORANEO'
      Required = True
    end
    object cdsNFSaidaCARGA_NAC_FEDERAL: TBCDField
      FieldName = 'CARGA_NAC_FEDERAL'
      Origin = 'CARGA_NAC_FEDERAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaCARGA_IMP_FEDERAL: TBCDField
      FieldName = 'CARGA_IMP_FEDERAL'
      Origin = 'CARGA_IMP_FEDERAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaCARGA_ESTADUAL: TBCDField
      FieldName = 'CARGA_ESTADUAL'
      Origin = 'CARGA_ESTADUAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaCARGA_MUNICIPAL: TBCDField
      FieldName = 'CARGA_MUNICIPAL'
      Origin = 'CARGA_MUNICIPAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_CARGA_NAC_FEDERAL: TBCDField
      FieldName = 'VALOR_CARGA_NAC_FEDERAL'
      Origin = 'VALOR_CARGA_NAC_FEDERAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_CARGA_IMP_FEDERAL: TBCDField
      FieldName = 'VALOR_CARGA_IMP_FEDERAL'
      Origin = 'VALOR_CARGA_IMP_FEDERAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_CARGA_ESTADUAL: TBCDField
      FieldName = 'VALOR_CARGA_ESTADUAL'
      Origin = 'VALOR_CARGA_ESTADUAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_CARGA_MUNICIPAL: TBCDField
      FieldName = 'VALOR_CARGA_MUNICIPAL'
      Origin = 'VALOR_CARGA_MUNICIPAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaDESTINO_OPERACAO: TSmallintField
      FieldName = 'DESTINO_OPERACAO'
      Origin = 'DESTINO_OPERACAO'
      Required = True
    end
    object cdsNFSaidaLOCAL_RETIRADA: TSmallintField
      FieldName = 'LOCAL_RETIRADA'
      Origin = 'LOCAL_RETIRADA'
      Required = True
    end
    object cdsNFSaidaLOCAL_ENTREGA: TSmallintField
      FieldName = 'LOCAL_ENTREGA'
      Origin = 'LOCAL_ENTREGA'
      Required = True
    end
    object cdsNFSaidaTOTAL_ICMS_DESONERADO: TBCDField
      FieldName = 'TOTAL_ICMS_DESONERADO'
      Origin = 'TOTAL_ICMS_DESONERADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaTRANSPORTADOR_ISENTO_ICMS: TSmallintField
      FieldName = 'TRANSPORTADOR_ISENTO_ICMS'
      Origin = 'TRANSPORTADOR_ISENTO_ICMS'
      Required = True
    end
    object cdsNFSaidaS_STATUS: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'S_STATUS'
      Calculated = True
    end
    object cdsNFSaidaRS_DESTINATARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'RS_DESTINATARIO'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'DESTINATARIO'
      Size = 100
      Lookup = True
    end
    object cdsNFSaidaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsNFSaidaHORA_EMISSAO: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object cdsNFSaidaTIPO_ATENDIMENTO: TSmallintField
      FieldName = 'TIPO_ATENDIMENTO'
      Origin = 'TIPO_ATENDIMENTO'
      Required = True
    end
    object cdsNFSaidaIE_DESTINATARIO: TStringField
      Alignment = taRightJustify
      FieldKind = fkLookup
      FieldName = 'IE_DESTINATARIO'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'INSCRICAO'
      KeyFields = 'DESTINATARIO'
      Lookup = True
    end
    object cdsNFSaidaENDERECO_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'ENDERECO_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'ENDERECOENTREGA'
      KeyFields = 'DESTINATARIO'
      Size = 100
      Lookup = True
    end
    object cdsNFSaidaNUMERO_DEST: TIntegerField
      FieldKind = fkLookup
      FieldName = 'NUMERO_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'NUMEROENTREGA'
      KeyFields = 'DESTINATARIO'
      Lookup = True
    end
    object cdsNFSaidaCEP_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'CEP_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'CEPENTREGA'
      KeyFields = 'DESTINATARIO'
      EditMask = '99999-999;0;_'
      Size = 9
      Lookup = True
    end
    object cdsNFSaidaBAIRRO_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'BAIRRO_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'BAIRROENTREGA'
      KeyFields = 'DESTINATARIO'
      Size = 30
      Lookup = True
    end
    object cdsNFSaidaUF_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'UF_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'ESTADOENTREGA'
      KeyFields = 'DESTINATARIO'
      Size = 2
      Lookup = True
    end
    object cdsNFSaidaCOMPLEMENTO_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'COMPLEMENTO_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'COMPLEMENTO'
      KeyFields = 'DESTINATARIO'
      Size = 30
      Lookup = True
    end
    object cdsNFSaidaCIDADE_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'CIDADE_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'NOME_CIDADE_ENTREGA'
      KeyFields = 'DESTINATARIO'
      Size = 40
      Lookup = True
    end
    object cdsNFSaidaI_SUFRAMA_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'I_SUFRAMA_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'INSCRICAO_SUFRAMA'
      KeyFields = 'DESTINATARIO'
      Size = 30
      Lookup = True
    end
    object cdsNFSaidaEMAIL_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'EMAIL_DEST'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'EMAIL'
      KeyFields = 'DESTINATARIO'
      Size = 200
      Lookup = True
    end
    object cdsNFSaidaUF_EMBARQUE: TStringField
      FieldName = 'UF_EMBARQUE'
      Origin = 'UF_EMBARQUE'
      Size = 2
    end
    object cdsNFSaidaLOCAL_DESPACHO: TStringField
      FieldName = 'LOCAL_DESPACHO'
      Origin = 'LOCAL_DESPACHO'
      Size = 200
    end
    object cdsNFSaidaPAIS_DESTINATARIO: TIntegerField
      FieldKind = fkLookup
      FieldName = 'PAIS_DESTINATARIO'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'PAIS'
      KeyFields = 'DESTINATARIO'
      Lookup = True
    end
    object cdsNFSaidaORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO'
    end
    object cdsNFSaidaDEST_CONTRIBUINTE_ICMS: TSmallintField
      FieldKind = fkLookup
      FieldName = 'DEST_CONTRIBUINTE_ICMS'
      LookupDataSet = cdsClientes
      LookupKeyFields = 'CLIENTE'
      LookupResultField = 'CONTRIBUINTE_ICMS'
      KeyFields = 'DESTINATARIO'
      Lookup = True
    end
    object cdsNFSaidaFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
    end
    object cdsNFSaidaIMPRESSO: TSmallintField
      FieldName = 'IMPRESSO'
      Origin = 'IMPRESSO'
      Required = True
    end
    object cdsNFSaidaCUPOMFISCAL: TIntegerField
      FieldName = 'CUPOMFISCAL'
      Origin = 'CUPOMFISCAL'
    end
    object cdsNFSaidaECF: TIntegerField
      FieldName = 'ECF'
      Origin = 'ECF'
    end
    object cdsNFSaidaCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 5
    end
    object cdsNFSaidaCOMISSAO: TCurrencyField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      Required = True
    end
    object cdsNFSaidaPEDIDOEXTERNO: TStringField
      FieldName = 'PEDIDOEXTERNO'
      Origin = 'PEDIDOEXTERNO'
      Size = 10
    end
    object cdsNFSaidaFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object cdsNFSaidaVALORDOSPRODUTOSREAL: TBCDField
      FieldName = 'VALORDOSPRODUTOSREAL'
      Origin = 'VALORDOSPRODUTOSREAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaDESCONTOCALCULADO: TCurrencyField
      FieldName = 'DESCONTOCALCULADO'
      Origin = 'DESCONTOCALCULADO'
      Required = True
    end
    object cdsNFSaidaDESCONTOCALCULADOREAL: TCurrencyField
      FieldName = 'DESCONTOCALCULADOREAL'
      Origin = 'DESCONTOCALCULADOREAL'
      Required = True
    end
    object cdsNFSaidaPERCENTUAL: TCurrencyField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Required = True
    end
    object cdsNFSaidaVALORCUPOMFISCAL: TBCDField
      FieldName = 'VALORCUPOMFISCAL'
      Origin = 'VALORCUPOMFISCAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaDATACUPOMFISCAL: TDateField
      FieldName = 'DATACUPOMFISCAL'
      Origin = 'DATACUPOMFISCAL'
    end
    object cdsNFSaidaCFOP_: TStringField
      FieldName = 'CFOP_'
      Origin = 'CFOP_'
      Size = 5
    end
    object cdsNFSaidaCANCELADA: TSmallintField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
    object cdsNFSaidaC_M_C: TStringField
      FieldName = 'C_M_C'
      Origin = 'C_M_C'
    end
    object cdsNFSaidaTOTAL_DOS_SERVICOS: TBCDField
      FieldName = 'TOTAL_DOS_SERVICOS'
      Origin = 'TOTAL_DOS_SERVICOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaPERCENTUAL_CSLL: TCurrencyField
      FieldName = 'PERCENTUAL_CSLL'
      Origin = 'PERCENTUAL_CSLL'
      Required = True
    end
    object cdsNFSaidaVALOR_CSLL: TBCDField
      FieldName = 'VALOR_CSLL'
      Origin = 'VALOR_CSLL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaPERCENTUAL_IRRF: TCurrencyField
      FieldName = 'PERCENTUAL_IRRF'
      Origin = 'PERCENTUAL_IRRF'
      Required = True
    end
    object cdsNFSaidaVALOR_IRRF: TBCDField
      FieldName = 'VALOR_IRRF'
      Origin = 'VALOR_IRRF'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaPERCENTUAL_INSS: TCurrencyField
      FieldName = 'PERCENTUAL_INSS'
      Origin = 'PERCENTUAL_INSS'
      Required = True
    end
    object cdsNFSaidaVALOR_INSS: TBCDField
      FieldName = 'VALOR_INSS'
      Origin = 'VALOR_INSS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaBASE_ISSQN: TBCDField
      FieldName = 'BASE_ISSQN'
      Origin = 'BASE_ISSQN'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ISSQN: TBCDField
      FieldName = 'VALOR_ISSQN'
      Origin = 'VALOR_ISSQN'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaRETER_PIS: TSmallintField
      FieldName = 'RETER_PIS'
      Origin = 'RETER_PIS'
      Required = True
    end
    object cdsNFSaidaRETER_COFINS: TSmallintField
      FieldName = 'RETER_COFINS'
      Origin = 'RETER_COFINS'
      Required = True
    end
    object cdsNFSaidaRETER_CSLL: TSmallintField
      FieldName = 'RETER_CSLL'
      Origin = 'RETER_CSLL'
      Required = True
    end
    object cdsNFSaidaRETER_INSS: TSmallintField
      FieldName = 'RETER_INSS'
      Origin = 'RETER_INSS'
      Required = True
    end
    object cdsNFSaidaRETER_IRRF: TSmallintField
      FieldName = 'RETER_IRRF'
      Origin = 'RETER_IRRF'
      Required = True
    end
    object cdsNFSaidaRETER_ISSQN: TSmallintField
      FieldName = 'RETER_ISSQN'
      Origin = 'RETER_ISSQN'
      Required = True
    end
    object cdsNFSaidaVALOR_IOF: TBCDField
      FieldName = 'VALOR_IOF'
      Origin = 'VALOR_IOF'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_CIDE: TBCDField
      FieldName = 'VALOR_CIDE'
      Origin = 'VALOR_CIDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ISS: TBCDField
      FieldName = 'VALOR_ISS'
      Origin = 'VALOR_ISS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ICMS_12741: TBCDField
      FieldName = 'VALOR_ICMS_12741'
      Origin = 'VALOR_ICMS_12741'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaCARGA_TRIBUTARIA: TBCDField
      FieldName = 'CARGA_TRIBUTARIA'
      Origin = 'CARGA_TRIBUTARIA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaUF_REFERENCIA_DEVOL: TStringField
      FieldName = 'UF_REFERENCIA_DEVOL'
      Origin = 'UF_REFERENCIA_DEVOL'
      Size = 2
    end
    object cdsNFSaidaANO_MES_REFERENCIA_DEVOL: TStringField
      FieldName = 'ANO_MES_REFERENCIA_DEVOL'
      Origin = 'ANO_MES_REFERENCIA_DEVOL'
      Size = 10
    end
    object cdsNFSaidaCNPJ_REFERENCIA_DEVOL: TStringField
      FieldName = 'CNPJ_REFERENCIA_DEVOL'
      Origin = 'CNPJ_REFERENCIA_DEVOL'
    end
    object cdsNFSaidaMODELO_REFERENCIA_DEVOL: TStringField
      FieldName = 'MODELO_REFERENCIA_DEVOL'
      Origin = 'MODELO_REFERENCIA_DEVOL'
      Size = 2
    end
    object cdsNFSaidaSERIE_REFERENCIA_DEVOL: TStringField
      FieldName = 'SERIE_REFERENCIA_DEVOL'
      Origin = 'SERIE_REFERENCIA_DEVOL'
      Size = 10
    end
    object cdsNFSaidaNUMERO_NF_REFERENCIA_DEVOL: TStringField
      FieldName = 'NUMERO_NF_REFERENCIA_DEVOL'
      Origin = 'NUMERO_NF_REFERENCIA_DEVOL'
    end
    object cdsNFSaidaVALOR_FCP_UF_DESTINO: TBCDField
      FieldName = 'VALOR_FCP_UF_DESTINO'
      Origin = 'VALOR_FCP_UF_DESTINO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ICMS_UF_DESTINO: TBCDField
      FieldName = 'VALOR_ICMS_UF_DESTINO'
      Origin = 'VALOR_ICMS_UF_DESTINO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ICMS_UF_REMETENTE: TBCDField
      FieldName = 'VALOR_ICMS_UF_REMETENTE'
      Origin = 'VALOR_ICMS_UF_REMETENTE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaVALOR_ENTRADA: TBCDField
      FieldName = 'VALOR_ENTRADA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaTIPOFRETE: TSmallintField
      FieldName = 'TIPOFRETE'
    end
    object cdsNFSaidaCONSUMIDOR_FINAL: TSmallintField
      FieldName = 'CONSUMIDOR_FINAL'
    end
    object cdsNFSaidaINDICADOR_IE_DESTINATARIO: TSmallintField
      FieldName = 'INDICADOR_IE_DESTINATARIO'
      Required = True
    end
  end
  object dspItemNFSaida: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemNFSaida
    Left = 505
    Top = 922
  end
  object cdsItemNFSaida: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'dspItemNFSaida'
    AfterPost = cdsItemNFSaidaAfterPost
    AfterDelete = cdsItemNFSaidaAfterPost
    OnNewRecord = cdsItemNFSaidaNewRecord
    Left = 625
    Top = 922
    object cdsItemNFSaidaITEMNFSAIDA: TIntegerField
      FieldName = 'ITEMNFSAIDA'
      Origin = 'ITEMNFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemNFSaidaNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      Required = True
    end
    object cdsItemNFSaidaEAN: TStringField
      FieldName = 'EAN'
      Origin = 'EAN'
      Required = True
      Size = 14
    end
    object cdsItemNFSaidaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object cdsItemNFSaidaCST: TSmallintField
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      DisplayFormat = '000'
    end
    object cdsItemNFSaidaDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsItemNFSaidaICMS: TCurrencyField
      FieldName = 'ICMS'
      Origin = 'ICMS'
      Required = True
      DisplayFormat = '#0.00'
      currency = False
    end
    object cdsItemNFSaidaCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsItemNFSaidaVALORUNITARIOREAL: TBCDField
      FieldName = 'VALORUNITARIOREAL'
      Origin = 'VALORUNITARIOREAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaIPI: TCurrencyField
      FieldName = 'IPI'
      Origin = 'IPI'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItemNFSaidaCF_IPI: TStringField
      Alignment = taRightJustify
      FieldName = 'CF_IPI'
      Origin = 'CF_IPI'
      Required = True
      Size = 9
    end
    object cdsItemNFSaidaBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaBASE_SUBSTITUICAO: TBCDField
      FieldName = 'BASE_SUBSTITUICAO'
      Origin = 'BASE_SUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_SUBSTITUICAO: TBCDField
      FieldName = 'VALOR_SUBSTITUICAO'
      Origin = 'VALOR_SUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERCENTUAL_REDUCAO: TCurrencyField
      FieldName = 'PERCENTUAL_REDUCAO'
      Origin = 'PERCENTUAL_REDUCAO'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS: TBCDField
      FieldName = 'ISENTAS_NAO_TRIBUTADAS'
      Origin = 'ISENTAS_NAO_TRIBUTADAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaDESCONTO_RATEADO: TBCDField
      FieldName = 'DESCONTO_RATEADO'
      Origin = 'DESCONTO_RATEADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
      Size = 2
    end
    object cdsItemNFSaidaCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object cdsItemNFSaidaCOD_ENQUADRAMENTO: TStringField
      FieldName = 'COD_ENQUADRAMENTO'
      Origin = 'COD_ENQUADRAMENTO'
      Size = 3
    end
    object cdsItemNFSaidaBASE_IPI: TBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaALIQUOTA_IPI: TCurrencyField
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'ALIQUOTA_IPI'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItemNFSaidaBASE_PIS: TBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaP_ALIQUOTA_PIS: TBCDField
      FieldName = 'P_ALIQUOTA_PIS'
      Origin = 'P_ALIQUOTA_PIS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsItemNFSaidaQUANTIDADE_BC_PIS: TBCDField
      FieldName = 'QUANTIDADE_BC_PIS'
      Origin = 'QUANTIDADE_BC_PIS'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsItemNFSaidaV_ALIQUOTA_PIS: TBCDField
      FieldName = 'V_ALIQUOTA_PIS'
      Origin = 'V_ALIQUOTA_PIS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsItemNFSaidaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_BC_COFINS: TBCDField
      FieldName = 'VALOR_BC_COFINS'
      Origin = 'VALOR_BC_COFINS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaP_ALIQUOTA_COFINS: TBCDField
      FieldName = 'P_ALIQUOTA_COFINS'
      Origin = 'P_ALIQUOTA_COFINS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsItemNFSaidaQUANTIDADE_BC_COFINS: TBCDField
      FieldName = 'QUANTIDADE_BC_COFINS'
      Origin = 'QUANTIDADE_BC_COFINS'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsItemNFSaidaV_ALIQUOTA_COFINS: TBCDField
      FieldName = 'V_ALIQUOTA_COFINS'
      Origin = 'V_ALIQUOTA_COFINS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsItemNFSaidaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCOD_CONTA_ANALITICA: TStringField
      FieldName = 'COD_CONTA_ANALITICA'
      Origin = 'COD_CONTA_ANALITICA'
      Size = 60
    end
    object cdsItemNFSaidaPERCENTUAL_ISS: TBCDField
      FieldName = 'PERCENTUAL_ISS'
      Origin = 'PERCENTUAL_ISS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ISS: TBCDField
      FieldName = 'VALOR_ISS'
      Origin = 'VALOR_ISS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERCENTUAL_IOF: TBCDField
      FieldName = 'PERCENTUAL_IOF'
      Origin = 'PERCENTUAL_IOF'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_IOF: TBCDField
      FieldName = 'VALOR_IOF'
      Origin = 'VALOR_IOF'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERCENTUAL_CIDE: TBCDField
      FieldName = 'PERCENTUAL_CIDE'
      Origin = 'PERCENTUAL_CIDE'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_CIDE: TBCDField
      FieldName = 'VALOR_CIDE'
      Origin = 'VALOR_CIDE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaTOTAL_IMPOSTOS: TBCDField
      FieldName = 'TOTAL_IMPOSTOS'
      Origin = 'TOTAL_IMPOSTOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCARGA_TRIBUTARIA: TBCDField
      FieldName = 'CARGA_TRIBUTARIA'
      Origin = 'CARGA_TRIBUTARIA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCARGA_NAC_FEDERAL: TBCDField
      FieldName = 'CARGA_NAC_FEDERAL'
      Origin = 'CARGA_NAC_FEDERAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCARGA_IMP_FEDERAL: TBCDField
      FieldName = 'CARGA_IMP_FEDERAL'
      Origin = 'CARGA_IMP_FEDERAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCARGA_ESTADUAL: TBCDField
      FieldName = 'CARGA_ESTADUAL'
      Origin = 'CARGA_ESTADUAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCARGA_MUNICIPAL: TBCDField
      FieldName = 'CARGA_MUNICIPAL'
      Origin = 'CARGA_MUNICIPAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL: TBCDField
      FieldName = 'VALOR_CARGA_NAC_FEDERAL'
      Origin = 'VALOR_CARGA_NAC_FEDERAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL: TBCDField
      FieldName = 'VALOR_CARGA_IMP_FEDERAL'
      Origin = 'VALOR_CARGA_IMP_FEDERAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_CARGA_ESTADUAL: TBCDField
      FieldName = 'VALOR_CARGA_ESTADUAL'
      Origin = 'VALOR_CARGA_ESTADUAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_CARGA_MUNICIPAL: TBCDField
      FieldName = 'VALOR_CARGA_MUNICIPAL'
      Origin = 'VALOR_CARGA_MUNICIPAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaASSINATURA_IBPT: TStringField
      FieldName = 'ASSINATURA_IBPT'
      Origin = 'ASSINATURA_IBPT'
    end
    object cdsItemNFSaidaORIGEM_MERCADORIA: TSmallintField
      FieldName = 'ORIGEM_MERCADORIA'
      Origin = 'ORIGEM_MERCADORIA'
      Required = True
    end
    object cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA: TStringField
      FieldName = 'FONTE_CARGA_TRIBUTARIA'
      Origin = 'FONTE_CARGA_TRIBUTARIA'
      Size = 40
    end
    object cdsItemNFSaidaMERCADORIA_CONSUMO: TSmallintField
      FieldName = 'MERCADORIA_CONSUMO'
      Origin = 'MERCADORIA_CONSUMO'
      Required = True
    end
    object cdsItemNFSaidaOUTROS_VALORES: TBCDField
      FieldName = 'OUTROS_VALORES'
      Origin = 'OUTROS_VALORES'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object cdsItemNFSaidaORIGEM_CST_ICMS_PART: TSmallintField
      FieldName = 'ORIGEM_CST_ICMS_PART'
      Origin = 'ORIGEM_CST_ICMS_PART'
    end
    object cdsItemNFSaidaCST_ICMS_PART: TSmallintField
      FieldName = 'CST_ICMS_PART'
      Origin = 'CST_ICMS_PART'
    end
    object cdsItemNFSaidaMOD_BASE_CALC_ICMS_PART: TSmallintField
      FieldName = 'MOD_BASE_CALC_ICMS_PART'
      Origin = 'MOD_BASE_CALC_ICMS_PART'
    end
    object cdsItemNFSaidaBASE_CALC_ICMS_PART: TBCDField
      FieldName = 'BASE_CALC_ICMS_PART'
      Origin = 'BASE_CALC_ICMS_PART'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERCENTUAL_ICMS_PART: TBCDField
      FieldName = 'PERCENTUAL_ICMS_PART'
      Origin = 'PERCENTUAL_ICMS_PART'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ICMS_PART: TBCDField
      FieldName = 'VALOR_ICMS_PART'
      Origin = 'VALOR_ICMS_PART'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaMOD_BASE_CALC_ICMS_ST_PART: TSmallintField
      FieldName = 'MOD_BASE_CALC_ICMS_ST_PART'
      Origin = 'MOD_BASE_CALC_ICMS_ST_PART'
    end
    object cdsItemNFSaidaBASE_CALC_ICMS_STR_PART: TBCDField
      FieldName = 'BASE_CALC_ICMS_STR_PART'
      Origin = 'BASE_CALC_ICMS_STR_PART'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERCENTUAL_ICMS_ST_PART: TBCDField
      FieldName = 'PERCENTUAL_ICMS_ST_PART'
      Origin = 'PERCENTUAL_ICMS_ST_PART'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ICMS_ST_PART: TBCDField
      FieldName = 'VALOR_ICMS_ST_PART'
      Origin = 'VALOR_ICMS_ST_PART'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaBASE_CALC_OPERACAO_PART: TBCDField
      FieldName = 'BASE_CALC_OPERACAO_PART'
      Origin = 'BASE_CALC_OPERACAO_PART'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaUF_ST_PART: TStringField
      FieldName = 'UF_ST_PART'
      Origin = 'UF_ST_PART'
      Size = 2
    end
    object cdsItemNFSaidaEX_TIPI: TSmallintField
      FieldName = 'EX_TIPI'
      Origin = 'EX_TIPI'
    end
    object cdsItemNFSaidaUNIDADE_COMERCIAL: TStringField
      FieldName = 'UNIDADE_COMERCIAL'
      Origin = 'UNIDADE_COMERCIAL'
      Size = 10
    end
    object cdsItemNFSaidaUNIDADE_TRIBUTAVEL: TStringField
      FieldName = 'UNIDADE_TRIBUTAVEL'
      Origin = 'UNIDADE_TRIBUTAVEL'
      Size = 10
    end
    object cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL: TBCDField
      FieldName = 'QUANTIDADE_TRIBUTAVEL'
      Origin = 'QUANTIDADE_TRIBUTAVEL'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemNFSaidaVALOR_SEGURO: TBCDField
      FieldName = 'VALOR_SEGURO'
      Origin = 'VALOR_SEGURO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPEDIDO_DE_COMPRA: TStringField
      FieldName = 'PEDIDO_DE_COMPRA'
      Origin = 'PEDIDO_DE_COMPRA'
    end
    object cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA: TSmallintField
      FieldName = 'NUMERO_ITEM_EDIDO_COMPRA'
      Origin = 'NUMERO_ITEM_EDIDO_COMPRA'
    end
    object cdsItemNFSaidaNUMERO_FCI: TStringField
      FieldName = 'NUMERO_FCI'
      Origin = 'NUMERO_FCI'
      Size = 10
    end
    object cdsItemNFSaidaALIQUOTA_CRED_SIMPLES: TBCDField
      FieldName = 'ALIQUOTA_CRED_SIMPLES'
      Origin = 'ALIQUOTA_CRED_SIMPLES'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_CRED_ICMS_SIMPLES: TBCDField
      FieldName = 'VALOR_CRED_ICMS_SIMPLES'
      Origin = 'VALOR_CRED_ICMS_SIMPLES'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCLASSE_EMQUADRAMENTO_IPI: TStringField
      FieldName = 'CLASSE_EMQUADRAMENTO_IPI'
      Origin = 'CLASSE_EMQUADRAMENTO_IPI'
      Size = 10
    end
    object cdsItemNFSaidaEAN_TRIBUTAVEL: TStringField
      FieldName = 'EAN_TRIBUTAVEL'
      Origin = 'EAN_TRIBUTAVEL'
    end
    object cdsItemNFSaidaPERC_BC_OPER_PROPRIA: TBCDField
      FieldName = 'PERC_BC_OPER_PROPRIA'
      Origin = 'PERC_BC_OPER_PROPRIA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaBC_ICMS_OPERACAO_DIFERIMENTO: TBCDField
      FieldName = 'BC_ICMS_OPERACAO_DIFERIMENTO'
      Origin = 'BC_ICMS_OPERACAO_DIFERIMENTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERC_ICMS_DIFERIMENTO: TBCDField
      FieldName = 'PERC_ICMS_DIFERIMENTO'
      Origin = 'PERC_ICMS_DIFERIMENTO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ICMS_DIFERIDO: TBCDField
      FieldName = 'VALOR_ICMS_DIFERIDO'
      Origin = 'VALOR_ICMS_DIFERIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERC_REDUCAO_BC_ICMS_ST: TBCDField
      FieldName = 'PERC_REDUCAO_BC_ICMS_ST'
      Origin = 'PERC_REDUCAO_BC_ICMS_ST'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaMVA: TBCDField
      FieldName = 'MVA'
      Origin = 'MVA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaALIQUOTA_ICMS_ST: TBCDField
      FieldName = 'ALIQUOTA_ICMS_ST'
      Origin = 'ALIQUOTA_ICMS_ST'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL: TBCDField
      FieldName = 'ALIQUOTA_ICMS_INTERESTADUAL'
      Origin = 'ALIQUOTA_ICMS_INTERESTADUAL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERC_DIFERENCIAL_ALIQUOTA: TBCDField
      FieldName = 'PERC_DIFERENCIAL_ALIQUOTA'
      Origin = 'PERC_DIFERENCIAL_ALIQUOTA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO: TBCDField
      FieldName = 'ALIQUOTA_ICMS_INTERNA_DESTINO'
      Origin = 'ALIQUOTA_ICMS_INTERNA_DESTINO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM: TBCDField
      FieldName = 'PERC_ICMS_PARTILHA_ORIGEM'
      Origin = 'PERC_ICMS_PARTILHA_ORIGEM'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO: TBCDField
      FieldName = 'PERC_ICMS_PARTILHA_DESTINO'
      Origin = 'PERC_ICMS_PARTILHA_DESTINO'
      Required = True
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERC_FCP: TBCDField
      FieldName = 'PERC_FCP'
      Origin = 'PERC_FCP'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM: TBCDField
      FieldName = 'VALOR_ICMS_PARTILHA_ORIGEM'
      Origin = 'VALOR_ICMS_PARTILHA_ORIGEM'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO: TBCDField
      FieldName = 'VALOR_ICMS_PARTILHA_DESTINO'
      Origin = 'VALOR_ICMS_PARTILHA_DESTINO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_FCP_DESTINO: TBCDField
      FieldName = 'VALOR_FCP_DESTINO'
      Origin = 'VALOR_FCP_DESTINO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 100
      Lookup = True
    end
    object cdsItemNFSaidaUNIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'UNIDADE'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'UNIDADE'
      KeyFields = 'PRODUTO'
      Size = 3
      Lookup = True
    end
    object cdsItemNFSaidaISENTAS_NTRIB_ICMS_ST: TBCDField
      FieldName = 'ISENTAS_NTRIB_ICMS_ST'
      Origin = 'ISENTAS_NTRIB_ICMS_ST'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaPERCENTUAL_IPI_DEVOLVIDO: TBCDField
      FieldName = 'PERCENTUAL_IPI_DEVOLVIDO'
      Origin = 'PERCENTUAL_IPI_DEVOLVIDO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaVALOR_IPI_DEVOLVIDO: TBCDField
      FieldName = 'VALOR_IPI_DEVOLVIDO'
      Origin = 'VALOR_IPI_DEVOLVIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemNFSaidaCST_PIS: TIntegerField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      DisplayFormat = '00'
    end
    object cdsItemNFSaidaCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      DisplayFormat = '00'
    end
    object cdsItemNFSaidaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.00000'
      EditFormat = '#,##0.00000'
      Precision = 18
    end
    object cdsItemNFSaidaVALORUNITARIO: TFloatField
      FieldName = 'VALORUNITARIO'
      Required = True
      DisplayFormat = '#,##0.0000000000'
      EditFormat = '#,##0.0000000000'
    end
    object cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL: TFloatField
      FieldName = 'VALOR_UNITARIO_TRIBUTAVEL'
      Required = True
      DisplayFormat = '#,##0.0000000000'
      EditFormat = '#,##0.0000000000'
    end
  end
  object dspCFOP_NFSaida: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCFOP_NFSaida
    Left = 505
    Top = 967
  end
  object cdsCFOP_NFSaida: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCFOP_NFSaida'
    OnNewRecord = cdsCFOP_NFSaidaNewRecord
    Left = 625
    Top = 967
    object cdsCFOP_NFSaidaCFOP_NFSAIDA: TIntegerField
      FieldName = 'CFOP_NFSAIDA'
      Origin = 'CFOP_NFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCFOP_NFSaidaNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      Required = True
    end
    object cdsCFOP_NFSaidaCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsCFOP_NFSaidaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
      Size = 2
    end
    object cdsCFOP_NFSaidaDESCRICAO_CFOP: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_CFOP'
      LookupDataSet = cdsCFOP_CFPS
      LookupKeyFields = 'CFOP'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CFOP'
      Size = 100
      Lookup = True
    end
    object cdsCFOP_NFSaidaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
  end
  object dspParcelasNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParcelasNFS
    Left = 505
    Top = 1011
  end
  object cdsParcelasNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspParcelasNFS'
    OnNewRecord = cdsParcelasNFSNewRecord
    Left = 625
    Top = 1011
    object cdsParcelasNFSPARCELASNFSAIDA: TIntegerField
      FieldName = 'PARCELASNFSAIDA'
      Origin = 'PARCELASNFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParcelasNFSNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      Required = True
    end
    object cdsParcelasNFSDOCUMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
      Size = 15
    end
    object cdsParcelasNFSVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasNFSVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParcelasNFSMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Required = True
      Size = 2
    end
    object cdsParcelasNFSFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
  end
  object dspTransportadoraNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTransportadoraNFS
    Left = 505
    Top = 1055
  end
  object cdsTransportadoraNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspTransportadoraNFS'
    OnNewRecord = cdsTransportadoraNFSNewRecord
    Left = 625
    Top = 1055
    object cdsTransportadoraNFSNF_SAIDA: TIntegerField
      FieldName = 'NF_SAIDA'
      Origin = 'NF_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTransportadoraNFSSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsTransportadoraNFSMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsTransportadoraNFSCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTransportadoraNFSISENTO_ICMS: TSmallintField
      FieldName = 'ISENTO_ICMS'
      Origin = 'ISENTO_ICMS'
      Required = True
    end
    object cdsTransportadoraNFSUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object cdsTransportadoraNFSPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Required = True
    end
    object cdsTransportadoraNFSRNTC: TStringField
      FieldName = 'RNTC'
      Origin = 'RNTC'
      Size = 30
    end
    object cdsTransportadoraNFSBC_CALCULO_ICMS_RETENCAO: TBCDField
      FieldName = 'BC_CALCULO_ICMS_RETENCAO'
      Origin = 'BC_CALCULO_ICMS_RETENCAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsTransportadoraNFSALIQUOTA_ICMS_RETENCAO: TBCDField
      FieldName = 'ALIQUOTA_ICMS_RETENCAO'
      Origin = 'ALIQUOTA_ICMS_RETENCAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsTransportadoraNFSVALOR_DO_SERVICO: TBCDField
      FieldName = 'VALOR_DO_SERVICO'
      Origin = 'VALOR_DO_SERVICO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsTransportadoraNFSUF_RETENCAO: TStringField
      FieldName = 'UF_RETENCAO'
      Origin = 'UF_RETENCAO'
      Size = 2
    end
    object cdsTransportadoraNFSMUNICIPIO_RETENCAO: TIntegerField
      FieldName = 'MUNICIPIO_RETENCAO'
      Origin = 'MUNICIPIO_RETENCAO'
    end
    object cdsTransportadoraNFSCFOP_RETENCAO: TStringField
      FieldName = 'CFOP_RETENCAO'
      Origin = 'CFOP_RETENCAO'
      Size = 5
    end
    object cdsTransportadoraNFSVALOR_ICMS_RETENCAO: TBCDField
      FieldName = 'VALOR_ICMS_RETENCAO'
      Origin = 'VALOR_ICMS_RETENCAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsTransportadoraNFSTRANSPORTADOR: TIntegerField
      FieldName = 'TRANSPORTADOR'
      Origin = 'TRANSPORTADOR'
      Required = True
    end
    object cdsTransportadoraNFSFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsTransportadoraNFSINSCRICAO_EST: TStringField
      FieldKind = fkLookup
      FieldName = 'INSCRICAO_EST'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'INSCRICAO'
      KeyFields = 'TRANSPORTADOR'
      Lookup = True
    end
    object cdsTransportadoraNFSRSOCIAL: TStringField
      FieldKind = fkLookup
      FieldName = 'RSOCIAL'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'TRANSPORTADOR'
      Size = 100
      Lookup = True
    end
    object cdsTransportadoraNFSENDERECO: TStringField
      FieldKind = fkLookup
      FieldName = 'ENDERECO'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'ENDERECO'
      KeyFields = 'TRANSPORTADOR'
      Size = 100
      Lookup = True
    end
    object cdsTransportadoraNFSNUMERO: TIntegerField
      FieldKind = fkLookup
      FieldName = 'NUMERO'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'NUMERO'
      KeyFields = 'TRANSPORTADOR'
      Lookup = True
    end
    object cdsTransportadoraNFSCEP: TStringField
      FieldKind = fkLookup
      FieldName = 'CEP'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'CEP'
      KeyFields = 'TRANSPORTADOR'
      Size = 9
      Lookup = True
    end
    object cdsTransportadoraNFSBAIRRO: TStringField
      FieldKind = fkLookup
      FieldName = 'BAIRRO'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'BAIRRO'
      KeyFields = 'TRANSPORTADOR'
      Size = 40
      Lookup = True
    end
    object cdsTransportadoraNFSNOME_CIDADE_TRANSP: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CIDADE_TRANSP'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'NOME_CIDADE'
      KeyFields = 'TRANSPORTADOR'
      Size = 40
      Lookup = True
    end
    object cdsTransportadoraNFSESTADO: TStringField
      FieldKind = fkLookup
      FieldName = 'ESTADO'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'ESTADO'
      KeyFields = 'TRANSPORTADOR'
      Size = 2
      Lookup = True
    end
  end
  object dspExportacaoNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqExportacaoNFS
    Left = 505
    Top = 1100
  end
  object cdsExpoirtacaoNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspExportacaoNFS'
    OnNewRecord = cdsExpoirtacaoNFSNewRecord
    Left = 625
    Top = 1100
    object cdsExpoirtacaoNFSNF_SAIDA: TIntegerField
      FieldName = 'NF_SAIDA'
      Origin = 'NF_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsExpoirtacaoNFSMODELO_NF_SAIDA: TStringField
      FieldName = 'MODELO_NF_SAIDA'
      Origin = 'MODELO_NF_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsExpoirtacaoNFSSERIE_NF_SAIDA: TStringField
      FieldName = 'SERIE_NF_SAIDA'
      Origin = 'SERIE_NF_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsExpoirtacaoNFSUF_EMBARQUE: TStringField
      FieldName = 'UF_EMBARQUE'
      Origin = 'UF_EMBARQUE'
      Size = 2
    end
    object cdsExpoirtacaoNFSLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      Origin = 'LOCAL_EMBARQUE'
      Size = 300
    end
    object cdsExpoirtacaoNFSLOCAL_DESPACHO: TStringField
      FieldName = 'LOCAL_DESPACHO'
      Origin = 'LOCAL_DESPACHO'
      Size = 300
    end
  end
  object dspDocumentoRef_NFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqDocumentoRef_NFS
    Left = 505
    Top = 1146
  end
  object cdsDocumentoRef_NFS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocumentoRef_NFS'
    OnCalcFields = cdsDocumentoRef_NFSCalcFields
    OnNewRecord = cdsDocumentoRef_NFSNewRecord
    Left = 625
    Top = 1146
    object cdsDocumentoRef_NFSS_TIPO_DOCUMENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_TIPO_DOCUMENTO'
      Size = 4
      Calculated = True
    end
    object cdsDocumentoRef_NFSNF_SAIDA: TIntegerField
      FieldName = 'NF_SAIDA'
      Origin = 'NF_SAIDA'
      Required = True
    end
    object cdsDocumentoRef_NFSMODELO_NF_SAIDA: TStringField
      FieldName = 'MODELO_NF_SAIDA'
      Origin = 'MODELO_NF_SAIDA'
      Required = True
      Size = 10
    end
    object cdsDocumentoRef_NFSSERIE_NF_SAIDA: TStringField
      FieldName = 'SERIE_NF_SAIDA'
      Origin = 'SERIE_NF_SAIDA'
      Size = 10
    end
    object cdsDocumentoRef_NFSCNPJ_NF_SAIDA: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_NF_SAIDA'
      Origin = 'CNPJ_NF_SAIDA'
      Required = True
      EditMask = '99.999.999./9999-99;0;_'
    end
    object cdsDocumentoRef_NFSDOCUMENTO_REF: TStringField
      FieldName = 'DOCUMENTO_REF'
      Origin = 'DOCUMENTO_REF'
      Required = True
    end
    object cdsDocumentoRef_NFSMODELO_DOC_REF: TStringField
      FieldName = 'MODELO_DOC_REF'
      Origin = 'MODELO_DOC_REF'
      Required = True
      Size = 10
    end
    object cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_FORNECEDOR_REF'
      Origin = 'CNPJ_FORNECEDOR_REF'
      EditMask = '99.999.999./9999-99;0;_'
    end
    object cdsDocumentoRef_NFSCHAVE_DOCUMENTO_REF: TStringField
      FieldName = 'CHAVE_DOCUMENTO_REF'
      Origin = 'CHAVE_DOCUMENTO_REF'
      Size = 200
    end
    object cdsDocumentoRef_NFSSERIE_DOC_REF: TIntegerField
      FieldName = 'SERIE_DOC_REF'
      Origin = 'SERIE_DOC_REF'
    end
    object cdsDocumentoRef_NFSANO_MES_EMISSAO: TStringField
      FieldName = 'ANO_MES_EMISSAO'
      Origin = 'ANO_MES_EMISSAO'
      Size = 10
    end
    object cdsDocumentoRef_NFSUF_DOCUMENTO_REF: TIntegerField
      FieldName = 'UF_DOCUMENTO_REF'
      Origin = 'UF_DOCUMENTO_REF'
    end
    object cdsDocumentoRef_NFSEMISSAO_DOCUMENTO_REF: TDateField
      Alignment = taRightJustify
      FieldName = 'EMISSAO_DOCUMENTO_REF'
      Origin = 'EMISSAO_DOCUMENTO_REF'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDocumentoRef_NFSINDICADOR_EMITENTE: TSmallintField
      FieldName = 'INDICADOR_EMITENTE'
      Origin = 'INDICADOR_EMITENTE'
    end
    object cdsDocumentoRef_NFSINDICADOR_OPERACAO: TSmallintField
      FieldName = 'INDICADOR_OPERACAO'
      Origin = 'INDICADOR_OPERACAO'
    end
    object cdsDocumentoRef_NFSFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsDocumentoRef_NFSTIPO_DOCUMENTO: TSmallintField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = 'TIPO_DOCUMENTO'
      Required = True
    end
    object cdsDocumentoRef_NFSINSCRICAO_ESTADUAL_EMITENTE: TStringField
      FieldName = 'INSCRICAO_ESTADUAL_EMITENTE'
      Origin = 'INSCRICAO_ESTADUAL_EMITENTE'
    end
    object cdsDocumentoRef_NFSSIGLA_UF_EMITENTE: TStringField
      FieldName = 'SIGLA_UF_EMITENTE'
      Origin = 'SIGLA_UF_EMITENTE'
      Size = 2
    end
  end
  object dspEndRetiradaNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqEndRetiradaNFS
    Left = 505
    Top = 1191
  end
  object cdsEndRetiradaNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspEndRetiradaNFS'
    OnNewRecord = cdsEndRetiradaNFSNewRecord
    Left = 625
    Top = 1191
    object cdsEndRetiradaNFSNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEndRetiradaNFSSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsEndRetiradaNFSMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsEndRetiradaNFSFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEndRetiradaNFSCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object cdsEndRetiradaNFSENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object cdsEndRetiradaNFSNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object cdsEndRetiradaNFSBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object cdsEndRetiradaNFSESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object cdsEndRetiradaNFSCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
    end
  end
  object dspEndEntregaNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqEndEntregaNFS
    Left = 505
    Top = 1236
  end
  object cdsEndEntregaNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspEndEntregaNFS'
    OnNewRecord = cdsEndEntregaNFSNewRecord
    Left = 625
    Top = 1236
    object cdsEndEntregaNFSNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEndEntregaNFSSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsEndEntregaNFSMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsEndEntregaNFSFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEndEntregaNFSCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object cdsEndEntregaNFSENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object cdsEndEntregaNFSNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object cdsEndEntregaNFSCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object cdsEndEntregaNFSBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object cdsEndEntregaNFSESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object cdsEndEntregaNFSCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
    end
  end
  object dspOrigemMercadoria: TDataSetProvider
    DataSet = dmDBEXMaster.fdqOrigemMercadoria
    Left = 505
    Top = 1283
  end
  object cdsOrigemMercadoria: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspOrigemMercadoria'
    Left = 625
    Top = 1283
    object cdsOrigemMercadoriaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrigemMercadoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object cdsCST_PIS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCST_PIS'
    Left = 625
    Top = 1326
    object cdsCST_PISCST_PIS_PASEP: TIntegerField
      FieldName = 'CST_PIS_PASEP'
      Origin = 'CST_PIS_PASEP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsCST_PISDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsCST_PISENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Origin = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsCST_PISGERA_CREDITO: TSmallintField
      FieldName = 'GERA_CREDITO'
      Origin = 'GERA_CREDITO'
      Required = True
    end
  end
  object dspCST_PIS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCST_PIS
    Left = 505
    Top = 1326
  end
  object cdsCST_COFINS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCST_COFINS'
    Left = 625
    Top = 1370
    object cdsCST_COFINSCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsCST_COFINSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsCST_COFINSENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Origin = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsCST_COFINSGERA_CREDITO: TSmallintField
      FieldName = 'GERA_CREDITO'
      Origin = 'GERA_CREDITO'
      Required = True
    end
  end
  object dspCST_COFINS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCST_COFINS
    Left = 505
    Top = 1370
  end
  object dspSelItemNFS_LS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelecionaItensNFSaida_LS
    Left = 39
    Top = 1807
  end
  object cdsSelItemNFS_LS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelItemNFS_LS'
    OnCalcFields = cdsItemProducaoCalcFields
    OnNewRecord = cdsItemProducaoNewRecord
    Left = 142
    Top = 1807
    object cdsSelItemNFS_LSOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsSelItemNFS_LSOP_ALIQUOTA: TCurrencyField
      FieldName = 'OP_ALIQUOTA'
      Origin = 'OP_ALIQUOTA'
    end
    object cdsSelItemNFS_LSOP_BASE_ICMS: TBCDField
      FieldName = 'OP_BASE_ICMS'
      Origin = 'OP_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelItemNFS_LSOP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Origin = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelItemNFS_LSOP_SUB_TOTAL: TBCDField
      FieldName = 'OP_SUB_TOTAL'
      Origin = 'OP_SUB_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsSelItemNFS_LSOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsSelItemNFS_LSOP_DESCONTO_RATEADO: TBCDField
      FieldName = 'OP_DESCONTO_RATEADO'
      Origin = 'OP_DESCONTO_RATEADO'
      Precision = 18
      Size = 2
    end
    object cdsSelItemNFS_LSOP_CST: TSmallintField
      FieldName = 'OP_CST'
      Origin = 'OP_CST'
    end
    object cdsSelItemNFS_LSOP_VALOR_IPI: TBCDField
      FieldName = 'OP_VALOR_IPI'
      Origin = 'OP_VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsSelItemNFS_LSOP_VALOR_SUBSTITUICAO: TBCDField
      FieldName = 'OP_VALOR_SUBSTITUICAO'
      Origin = 'OP_VALOR_SUBSTITUICAO'
      Precision = 18
      Size = 2
    end
  end
  object cdsMVA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMVA'
    OnNewRecord = cdsMVANewRecord
    Left = 392
    Top = 1807
    object cdsMVAMVA: TIntegerField
      FieldName = 'MVA'
      Origin = 'MVA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMVAESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      Size = 2
    end
    object cdsMVAPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
    end
    object cdsMVAMARGEM_MVA: TCurrencyField
      FieldName = 'MARGEM_MVA'
      Origin = 'MARGEM_MVA'
    end
    object cdsMVAICMS_INTERESTADUAL: TCurrencyField
      FieldName = 'ICMS_INTERESTADUAL'
      Origin = 'ICMS_INTERESTADUAL'
      Required = True
    end
    object cdsMVAICMS_INTERNO: TCurrencyField
      FieldName = 'ICMS_INTERNO'
      Origin = 'ICMS_INTERNO'
      Required = True
    end
  end
  object dspMVA: TDataSetProvider
    DataSet = dmDBEXMaster.fdqMVA
    Left = 257
    Top = 1807
  end
  object dspPesqClientes: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPesqCliente
    Left = 505
    Top = 1414
  end
  object cdsPesqClientes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspPesqClientes'
    Left = 625
    Top = 1414
    object cdsPesqClientesCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesqClientesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object cdsPesqClientesFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 30
    end
    object cdsPesqClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object cdsPesqClientesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
    end
    object cdsPesqClientesCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Origin = 'CADASTRO'
      Required = True
    end
    object cdsPesqClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object cdsPesqClientesNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsPesqClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object cdsPesqClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object cdsPesqClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsPesqClientesTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsPesqClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 30
    end
    object cdsPesqClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 30
    end
    object cdsPesqClientesHTTP: TStringField
      FieldName = 'HTTP'
      Origin = 'HTTP'
      Size = 50
    end
    object cdsPesqClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object cdsPesqClientesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsPesqClientesDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      FixedChar = True
      Size = 5
    end
    object cdsPesqClientesTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Origin = 'TELEFONE1'
      Size = 15
    end
    object cdsPesqClientesTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Origin = 'TELEFONE2'
      Size = 15
    end
    object cdsPesqClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object cdsPesqClientesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object cdsPesqClientesNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
    end
    object cdsPesqClientesRENDA: TBCDField
      FieldName = 'RENDA'
      Origin = 'RENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesLIMITEDECREDITO: TBCDField
      FieldName = 'LIMITEDECREDITO'
      Origin = 'LIMITEDECREDITO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesSALDODEVEDOR: TBCDField
      FieldName = 'SALDODEVEDOR'
      Origin = 'SALDODEVEDOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsPesqClientesBARRAS: TStringField
      FieldName = 'BARRAS'
      Origin = 'BARRAS'
      Size = 13
    end
    object cdsPesqClientesENDERECOENTREGA: TStringField
      FieldName = 'ENDERECOENTREGA'
      Origin = 'ENDERECOENTREGA'
      Required = True
      Size = 40
    end
    object cdsPesqClientesNUMEROENTREGA: TIntegerField
      FieldName = 'NUMEROENTREGA'
      Origin = 'NUMEROENTREGA'
    end
    object cdsPesqClientesCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      Origin = 'CEPENTREGA'
      Size = 9
    end
    object cdsPesqClientesBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Origin = 'BAIRROENTREGA'
      Size = 30
    end
    object cdsPesqClientesESTADOENTREGA: TStringField
      FieldName = 'ESTADOENTREGA'
      Origin = 'ESTADOENTREGA'
      FixedChar = True
      Size = 2
    end
    object cdsPesqClientesENDERECOCOBRANCA: TStringField
      FieldName = 'ENDERECOCOBRANCA'
      Origin = 'ENDERECOCOBRANCA'
      Required = True
      Size = 40
    end
    object cdsPesqClientesNUMEROCOBRANCA: TIntegerField
      FieldName = 'NUMEROCOBRANCA'
      Origin = 'NUMEROCOBRANCA'
    end
    object cdsPesqClientesCEPCOBRANCA: TStringField
      FieldName = 'CEPCOBRANCA'
      Origin = 'CEPCOBRANCA'
      Size = 9
    end
    object cdsPesqClientesBAIRROCOBRANCA: TStringField
      FieldName = 'BAIRROCOBRANCA'
      Origin = 'BAIRROCOBRANCA'
      Size = 30
    end
    object cdsPesqClientesESTADOCOBRANCA: TStringField
      FieldName = 'ESTADOCOBRANCA'
      Origin = 'ESTADOCOBRANCA'
      FixedChar = True
      Size = 2
    end
    object cdsPesqClientesPONTODEREFERENCIA: TStringField
      FieldName = 'PONTODEREFERENCIA'
      Origin = 'PONTODEREFERENCIA'
      Size = 40
    end
    object cdsPesqClientesVALIDADEDOCREDITO: TDateField
      FieldName = 'VALIDADEDOCREDITO'
      Origin = 'VALIDADEDOCREDITO'
    end
    object cdsPesqClientesTIPODECREDITO: TSmallintField
      FieldName = 'TIPODECREDITO'
      Origin = 'TIPODECREDITO'
      Required = True
    end
    object cdsPesqClientesDATACONSULTASPC: TDateField
      FieldName = 'DATACONSULTASPC'
      Origin = 'DATACONSULTASPC'
    end
    object cdsPesqClientesFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object cdsPesqClientesULTIPOPEDIDO: TIntegerField
      FieldName = 'ULTIPOPEDIDO'
      Origin = 'ULTIPOPEDIDO'
    end
    object cdsPesqClientesDATAULTIMOPEDIDO: TDateField
      FieldName = 'DATAULTIMOPEDIDO'
      Origin = 'DATAULTIMOPEDIDO'
    end
    object cdsPesqClientesVALORULTIMOPEDIDO: TBCDField
      FieldName = 'VALORULTIMOPEDIDO'
      Origin = 'VALORULTIMOPEDIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesULTIMANF: TStringField
      FieldName = 'ULTIMANF'
      Origin = 'ULTIMANF'
      Size = 15
    end
    object cdsPesqClientesDATAULTIMANF: TDateField
      FieldName = 'DATAULTIMANF'
      Origin = 'DATAULTIMANF'
    end
    object cdsPesqClientesVALORULTIMANF: TBCDField
      FieldName = 'VALORULTIMANF'
      Origin = 'VALORULTIMANF'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesULTIMOCHQUEDEVOLVIDO: TStringField
      FieldName = 'ULTIMOCHQUEDEVOLVIDO'
      Origin = 'ULTIMOCHQUEDEVOLVIDO'
      FixedChar = True
      Size = 15
    end
    object cdsPesqClientesDATAULTIMOCHEQUEDEVOLVIDO: TDateField
      FieldName = 'DATAULTIMOCHEQUEDEVOLVIDO'
      Origin = 'DATAULTIMOCHEQUEDEVOLVIDO'
    end
    object cdsPesqClientesVALORULTIMOCHEQUEDEVOLVIDO: TBCDField
      FieldName = 'VALORULTIMOCHEQUEDEVOLVIDO'
      Origin = 'VALORULTIMOCHEQUEDEVOLVIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesMOTIVODEVOLUCAO: TStringField
      FieldName = 'MOTIVODEVOLUCAO'
      Origin = 'MOTIVODEVOLUCAO'
      FixedChar = True
      Size = 4
    end
    object cdsPesqClientesCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
    end
    object cdsPesqClientesCIDADEENTREGA: TIntegerField
      FieldName = 'CIDADEENTREGA'
      Origin = 'CIDADEENTREGA'
    end
    object cdsPesqClientesCIDADECOBRANCA: TIntegerField
      FieldName = 'CIDADECOBRANCA'
      Origin = 'CIDADECOBRANCA'
    end
    object cdsPesqClientesATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsPesqClientesPAI: TStringField
      FieldName = 'PAI'
      Origin = 'PAI'
      Size = 40
    end
    object cdsPesqClientesMAE: TStringField
      FieldName = 'MAE'
      Origin = 'MAE'
      Size = 40
    end
    object cdsPesqClientesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 40
    end
    object cdsPesqClientesTELEFONEEMPRESA1: TStringField
      FieldName = 'TELEFONEEMPRESA1'
      Origin = 'TELEFONEEMPRESA1'
      Size = 15
    end
    object cdsPesqClientesTELEFONEEMPRESA2: TStringField
      FieldName = 'TELEFONEEMPRESA2'
      Origin = 'TELEFONEEMPRESA2'
      Size = 15
    end
    object cdsPesqClientesRAMAL: TStringField
      FieldName = 'RAMAL'
      Origin = 'RAMAL'
      Size = 4
    end
    object cdsPesqClientesCONTATOEMPRESA: TStringField
      FieldName = 'CONTATOEMPRESA'
      Origin = 'CONTATOEMPRESA'
      Size = 30
    end
    object cdsPesqClientesREFERENCIAPESSOAL1: TStringField
      FieldName = 'REFERENCIAPESSOAL1'
      Origin = 'REFERENCIAPESSOAL1'
      Size = 40
    end
    object cdsPesqClientesREFERENCIAPESSOAL2: TStringField
      FieldName = 'REFERENCIAPESSOAL2'
      Origin = 'REFERENCIAPESSOAL2'
      Size = 40
    end
    object cdsPesqClientesREFERENCIAPESSOAL3: TStringField
      FieldName = 'REFERENCIAPESSOAL3'
      Origin = 'REFERENCIAPESSOAL3'
      Size = 40
    end
    object cdsPesqClientesTELEFONEREFERENCIA1: TStringField
      FieldName = 'TELEFONEREFERENCIA1'
      Origin = 'TELEFONEREFERENCIA1'
      Size = 15
    end
    object cdsPesqClientesTELEFONEREFERENCIA2: TStringField
      FieldName = 'TELEFONEREFERENCIA2'
      Origin = 'TELEFONEREFERENCIA2'
      Size = 15
    end
    object cdsPesqClientesTELEFONEREFERENCIA3: TStringField
      FieldName = 'TELEFONEREFERENCIA3'
      Origin = 'TELEFONEREFERENCIA3'
      Size = 15
    end
    object cdsPesqClientesSEXO: TSmallintField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Required = True
    end
    object cdsPesqClientesESTADOCIVIL: TSmallintField
      FieldName = 'ESTADOCIVIL'
      Origin = 'ESTADOCIVIL'
      Required = True
    end
    object cdsPesqClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Origin = 'CONJUGE'
      Size = 40
    end
    object cdsPesqClientesPOSSUIDEPENDENTES: TSmallintField
      FieldName = 'POSSUIDEPENDENTES'
      Origin = 'POSSUIDEPENDENTES'
      Required = True
    end
    object cdsPesqClientesQUANTIDADEDEPENDENTES: TSmallintField
      FieldName = 'QUANTIDADEDEPENDENTES'
      Origin = 'QUANTIDADEDEPENDENTES'
    end
    object cdsPesqClientesDEPENDENTES: TMemoField
      FieldName = 'DEPENDENTES'
      Origin = 'DEPENDENTES'
      BlobType = ftMemo
    end
    object cdsPesqClientesTEMPODEEMPRESA: TBCDField
      FieldName = 'TEMPODEEMPRESA'
      Origin = 'TEMPODEEMPRESA'
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesTIPOTEMPOEMPRESA: TSmallintField
      FieldName = 'TIPOTEMPOEMPRESA'
      Origin = 'TIPOTEMPOEMPRESA'
      Required = True
    end
    object cdsPesqClientesREFERENCIACOMERCIAL1: TStringField
      FieldName = 'REFERENCIACOMERCIAL1'
      Origin = 'REFERENCIACOMERCIAL1'
      Size = 40
    end
    object cdsPesqClientesREFERENCIACOMERCIAL2: TStringField
      FieldName = 'REFERENCIACOMERCIAL2'
      Origin = 'REFERENCIACOMERCIAL2'
      Size = 40
    end
    object cdsPesqClientesREFERENCIACOMERCIAL3: TStringField
      FieldName = 'REFERENCIACOMERCIAL3'
      Origin = 'REFERENCIACOMERCIAL3'
      Size = 40
    end
    object cdsPesqClientesTELEFONEREFCOMERCIAL1: TStringField
      FieldName = 'TELEFONEREFCOMERCIAL1'
      Origin = 'TELEFONEREFCOMERCIAL1'
      Size = 15
    end
    object cdsPesqClientesTELEFONEREFCOMERCIAL2: TStringField
      FieldName = 'TELEFONEREFCOMERCIAL2'
      Origin = 'TELEFONEREFCOMERCIAL2'
      Size = 15
    end
    object cdsPesqClientesTELEFONEREFCOMERCIAL3: TStringField
      FieldName = 'TELEFONEREFCOMERCIAL3'
      Origin = 'TELEFONEREFCOMERCIAL3'
      Size = 15
    end
    object cdsPesqClientesCONTATOREFCOMERCIAL1: TStringField
      FieldName = 'CONTATOREFCOMERCIAL1'
      Origin = 'CONTATOREFCOMERCIAL1'
    end
    object cdsPesqClientesCONTATOREFCOMERCIAL2: TStringField
      FieldName = 'CONTATOREFCOMERCIAL2'
      Origin = 'CONTATOREFCOMERCIAL2'
    end
    object cdsPesqClientesCONTATOREFCOMERCIAL3: TStringField
      FieldName = 'CONTATOREFCOMERCIAL3'
      Origin = 'CONTATOREFCOMERCIAL3'
    end
    object cdsPesqClientesLIBERARVENDAACIMALIMITE: TSmallintField
      FieldName = 'LIBERARVENDAACIMALIMITE'
      Origin = 'LIBERARVENDAACIMALIMITE'
      Required = True
    end
    object cdsPesqClientesVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
    end
    object cdsPesqClientesCLIENTE2: TIntegerField
      FieldName = 'CLIENTE2'
      Origin = 'CLIENTE2'
    end
    object cdsPesqClientesMODELO_TABELA_PRECOVENDA: TSmallintField
      FieldName = 'MODELO_TABELA_PRECOVENDA'
      Origin = 'MODELO_TABELA_PRECOVENDA'
      Required = True
    end
    object cdsPesqClientesSOCIO: TSmallintField
      FieldName = 'SOCIO'
      Origin = 'SOCIO'
      Required = True
    end
    object cdsPesqClientesCONTRIBUICAO: TBCDField
      FieldName = 'CONTRIBUICAO'
      Origin = 'CONTRIBUICAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesNUMERO_CARTAO: TStringField
      FieldName = 'NUMERO_CARTAO'
      Origin = 'NUMERO_CARTAO'
      Size = 100
    end
    object cdsPesqClientesEMISSAO_CARTAO: TDateField
      FieldName = 'EMISSAO_CARTAO'
      Origin = 'EMISSAO_CARTAO'
    end
    object cdsPesqClientesDATA_VALIDADE_CARTAO: TDateField
      FieldName = 'DATA_VALIDADE_CARTAO'
      Origin = 'DATA_VALIDADE_CARTAO'
    end
    object cdsPesqClientesDESCONTO_PERSONALIZADO: TBCDField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqClientesFORMAPAGAMENTO: TIntegerField
      FieldName = 'FORMAPAGAMENTO'
      Origin = 'FORMAPAGAMENTO'
    end
    object cdsPesqClientesUSUARIO_NFE: TSmallintField
      FieldName = 'USUARIO_NFE'
      Origin = 'USUARIO_NFE'
      Required = True
    end
    object cdsPesqClientesPAIS: TIntegerField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
    end
    object cdsPesqClientesINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Origin = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
    object cdsPesqClientesGARANTIDOR_OS: TSmallintField
      FieldName = 'GARANTIDOR_OS'
      Origin = 'GARANTIDOR_OS'
      Required = True
    end
    object cdsPesqClientesCONTRIBUINTE_ICMS: TSmallintField
      FieldName = 'CONTRIBUINTE_ICMS'
      Origin = 'CONTRIBUINTE_ICMS'
      Required = True
    end
  end
  object dspPesqCFOP: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPesqCFOP
    Left = 505
    Top = 1456
  end
  object cdsPesqCFOP: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspPesqCFOP'
    Left = 625
    Top = 1456
    object cdsPesqCFOPCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsPesqCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsPesqCFOPOPERACAO: TSmallintField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      Required = True
    end
    object cdsPesqCFOPCFOP_ENTRADA_ESTADUAL: TStringField
      FieldName = 'CFOP_ENTRADA_ESTADUAL'
      Origin = 'CFOP_ENTRADA_ESTADUAL'
      Size = 5
    end
    object cdsPesqCFOPCFOP_ENTRADA_INTERESTADUAL: TStringField
      FieldName = 'CFOP_ENTRADA_INTERESTADUAL'
      Origin = 'CFOP_ENTRADA_INTERESTADUAL'
      Size = 5
    end
    object cdsPesqCFOPCFOP_ENTRADA_ESTRANGEIRA: TStringField
      FieldName = 'CFOP_ENTRADA_ESTRANGEIRA'
      Origin = 'CFOP_ENTRADA_ESTRANGEIRA'
      Size = 5
    end
    object cdsPesqCFOPATUALIZAR_CUSTOS: TSmallintField
      FieldName = 'ATUALIZAR_CUSTOS'
      Origin = 'ATUALIZAR_CUSTOS'
      Required = True
    end
    object cdsPesqCFOPNATUREZA_CFOP: TSmallintField
      FieldName = 'NATUREZA_CFOP'
      Origin = 'NATUREZA_CFOP'
      Required = True
    end
    object cdsPesqCFOPGERA_CREDITO_PIS_COFINS: TSmallintField
      FieldName = 'GERA_CREDITO_PIS_COFINS'
      Origin = 'GERA_CREDITO_PIS_COFINS'
      Required = True
    end
    object cdsPesqCFOPTABELA_4_3_7: TStringField
      FieldName = 'TABELA_4_3_7'
      Origin = 'TABELA_4_3_7'
      Size = 10
    end
    object cdsPesqCFOPOBSERVACAO_NFS: TMemoField
      FieldName = 'OBSERVACAO_NFS'
      Origin = 'OBSERVACAO_NFS'
      BlobType = ftMemo
    end
    object cdsPesqCFOPDESCONTO_PERSONALIZADO: TBCDField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Precision = 18
      Size = 2
    end
    object cdsPesqCFOPGERA_DEBITO_CREDITO_ICMS: TSmallintField
      FieldName = 'GERA_DEBITO_CREDITO_ICMS'
      Origin = 'GERA_DEBITO_CREDITO_ICMS'
      Required = True
    end
    object cdsPesqCFOPSUBSTITUICAO_TRIBUTARIA: TSmallintField
      FieldName = 'SUBSTITUICAO_TRIBUTARIA'
      Origin = 'SUBSTITUICAO_TRIBUTARIA'
      Required = True
    end
    object cdsPesqCFOPGERA_DEBITO_CREDITO_IPI: TSmallintField
      FieldName = 'GERA_DEBITO_CREDITO_IPI'
      Origin = 'GERA_DEBITO_CREDITO_IPI'
      Required = True
    end
    object cdsPesqCFOPCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsPesqCFOPALIQUOTA_PIS_ENTRADA: TBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqCFOPCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsPesqCFOPALIQUOTA_COFINS_ENTRADA: TBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqCFOPCST_PIS_SAIDA: TIntegerField
      FieldName = 'CST_PIS_SAIDA'
      Origin = 'CST_PIS_SAIDA'
    end
    object cdsPesqCFOPALIQUOTA_PIS_SAIDA: TBCDField
      FieldName = 'ALIQUOTA_PIS_SAIDA'
      Origin = 'ALIQUOTA_PIS_SAIDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqCFOPCST_COFINS_SAIDA: TIntegerField
      FieldName = 'CST_COFINS_SAIDA'
      Origin = 'CST_COFINS_SAIDA'
    end
    object cdsPesqCFOPALIQUOTA_COFINS_SAIDA: TBCDField
      FieldName = 'ALIQUOTA_COFINS_SAIDA'
      Origin = 'ALIQUOTA_COFINS_SAIDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesqCFOPNATUREZA_RECEITA_PIS_COFINS: TIntegerField
      FieldName = 'NATUREZA_RECEITA_PIS_COFINS'
      Origin = 'NATUREZA_RECEITA_PIS_COFINS'
    end
    object cdsPesqCFOPCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
  end
  object dspConsisteCFOP_ITNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConsisteCFOP_ITNFS
    Left = 505
    Top = 1500
  end
  object cdsConsisteCFOP_ITNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspConsisteCFOP_ITNFS'
    Left = 625
    Top = 1500
    object cdsConsisteCFOP_ITNFSOP_QTD_CFOP_IT: TIntegerField
      FieldName = 'OP_QTD_CFOP_IT'
      Origin = 'OP_QTD_CFOP_IT'
    end
  end
  object dspParametros_NFE: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParametros_NFE
    Left = 505
    Top = 1544
  end
  object cdsParametros_NFE: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspParametros_NFE'
    Left = 625
    Top = 1544
    object cdsParametros_NFEPARAMETROS_NFE: TIntegerField
      FieldName = 'PARAMETROS_NFE'
      Origin = 'PARAMETROS_NFE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsParametros_NFEORIENTACAO_IMPRESSAO: TSmallintField
      FieldName = 'ORIENTACAO_IMPRESSAO'
      Origin = 'ORIENTACAO_IMPRESSAO'
      Required = True
    end
    object cdsParametros_NFEREPOSITORIO_XML: TStringField
      FieldName = 'REPOSITORIO_XML'
      Origin = 'REPOSITORIO_XML'
      Size = 500
    end
    object cdsParametros_NFEREPOSITORIO_PDF: TStringField
      FieldName = 'REPOSITORIO_PDF'
      Origin = 'REPOSITORIO_PDF'
      Size = 500
    end
    object cdsParametros_NFELOGO_MARCA: TStringField
      FieldName = 'LOGO_MARCA'
      Origin = 'LOGO_MARCA'
      Size = 500
    end
    object cdsParametros_NFEATUALIZAR_XML: TSmallintField
      FieldName = 'ATUALIZAR_XML'
      Origin = 'ATUALIZAR_XML'
      Required = True
    end
    object cdsParametros_NFEEXIBIR_ERRO_SCHEMA: TSmallintField
      FieldName = 'EXIBIR_ERRO_SCHEMA'
      Origin = 'EXIBIR_ERRO_SCHEMA'
      Required = True
    end
    object cdsParametros_NFERETIRAR_ACENTOS_XML_ENVIADO: TSmallintField
      FieldName = 'RETIRAR_ACENTOS_XML_ENVIADO'
      Origin = 'RETIRAR_ACENTOS_XML_ENVIADO'
      Required = True
    end
    object cdsParametros_NFESALVAR_ARQUIVOS_ENVIO_RESPOSTA: TSmallintField
      FieldName = 'SALVAR_ARQUIVOS_ENVIO_RESPOSTA'
      Origin = 'SALVAR_ARQUIVOS_ENVIO_RESPOSTA'
      Required = True
    end
    object cdsParametros_NFEFORMATO_ALERTA: TStringField
      FieldName = 'FORMATO_ALERTA'
      Origin = 'FORMATO_ALERTA'
      Size = 500
    end
    object cdsParametros_NFEPASTA_LOGS: TStringField
      FieldName = 'PASTA_LOGS'
      Origin = 'PASTA_LOGS'
      Size = 500
    end
    object cdsParametros_NFEPASTA_SCHEMAS: TStringField
      FieldName = 'PASTA_SCHEMAS'
      Origin = 'PASTA_SCHEMAS'
      Size = 500
    end
    object cdsParametros_NFESALVAR_ARQS_EM_PASTAS_SEPARADAS: TSmallintField
      FieldName = 'SALVAR_ARQS_EM_PASTAS_SEPARADAS'
      Origin = 'SALVAR_ARQS_EM_PASTAS_SEPARADAS'
      Required = True
    end
    object cdsParametros_NFECRIAR_PASTAS_MENSALMENTE: TSmallintField
      FieldName = 'CRIAR_PASTAS_MENSALMENTE'
      Origin = 'CRIAR_PASTAS_MENSALMENTE'
      Required = True
    end
    object cdsParametros_NFEADICIONAR_LITERAL_NOME_PASTAS: TSmallintField
      FieldName = 'ADICIONAR_LITERAL_NOME_PASTAS'
      Origin = 'ADICIONAR_LITERAL_NOME_PASTAS'
      Required = True
    end
    object cdsParametros_NFESALVAR_NFE_PELA_EMISSAO: TSmallintField
      FieldName = 'SALVAR_NFE_PELA_EMISSAO'
      Origin = 'SALVAR_NFE_PELA_EMISSAO'
      Required = True
    end
    object cdsParametros_NFESALVAR_ARQUIVOS_EVENTOS: TSmallintField
      FieldName = 'SALVAR_ARQUIVOS_EVENTOS'
      Origin = 'SALVAR_ARQUIVOS_EVENTOS'
      Required = True
    end
    object cdsParametros_NFESEPARAR_ARQ_POR_CNPJ_CERTIF: TSmallintField
      FieldName = 'SEPARAR_ARQ_POR_CNPJ_CERTIF'
      Origin = 'SEPARAR_ARQ_POR_CNPJ_CERTIF'
      Required = True
    end
    object cdsParametros_NFESEPARAR_ARQ_POR_MODELO_DOC: TSmallintField
      FieldName = 'SEPARAR_ARQ_POR_MODELO_DOC'
      Origin = 'SEPARAR_ARQ_POR_MODELO_DOC'
      Required = True
    end
    object cdsParametros_NFEPASTA_ARQS_NFE: TStringField
      FieldName = 'PASTA_ARQS_NFE'
      Origin = 'PASTA_ARQS_NFE'
      Size = 500
    end
    object cdsParametros_NFEPASTA_ARQS_CANCELAMENTO: TStringField
      FieldName = 'PASTA_ARQS_CANCELAMENTO'
      Origin = 'PASTA_ARQS_CANCELAMENTO'
      Size = 500
    end
    object cdsParametros_NFEPASTA_ARQS_CCE: TStringField
      FieldName = 'PASTA_ARQS_CCE'
      Origin = 'PASTA_ARQS_CCE'
      Size = 500
    end
    object cdsParametros_NFEPASTA_ARQS_INUTILIZACAO: TStringField
      FieldName = 'PASTA_ARQS_INUTILIZACAO'
      Origin = 'PASTA_ARQS_INUTILIZACAO'
      Size = 500
    end
    object cdsParametros_NFEPASTA_ARQS_DEPEC: TStringField
      FieldName = 'PASTA_ARQS_DEPEC'
      Origin = 'PASTA_ARQS_DEPEC'
      Size = 500
    end
    object cdsParametros_NFEPASTA_ARQS_EVENTO: TStringField
      FieldName = 'PASTA_ARQS_EVENTO'
      Origin = 'PASTA_ARQS_EVENTO'
      Size = 500
    end
    object cdsParametros_NFESALVAR_ENVELOP_SOAP: TSmallintField
      FieldName = 'SALVAR_ENVELOP_SOAP'
      Origin = 'SALVAR_ENVELOP_SOAP'
      Required = True
    end
    object cdsParametros_NFEAJUSTAR_MSG_AGUARDE: TSmallintField
      FieldName = 'AJUSTAR_MSG_AGUARDE'
      Origin = 'AJUSTAR_MSG_AGUARDE'
      Required = True
    end
    object cdsParametros_NFETEMPO_AGUARDAR_ENVIO: TSmallintField
      FieldName = 'TEMPO_AGUARDAR_ENVIO'
      Origin = 'TEMPO_AGUARDAR_ENVIO'
      Required = True
    end
    object cdsParametros_NFETENTATIVAS_ENVIO: TSmallintField
      FieldName = 'TENTATIVAS_ENVIO'
      Origin = 'TENTATIVAS_ENVIO'
      Required = True
    end
    object cdsParametros_NFEINTERVALO_TENTATIVAS: TSmallintField
      FieldName = 'INTERVALO_TENTATIVAS'
      Origin = 'INTERVALO_TENTATIVAS'
      Required = True
    end
    object cdsParametros_NFESSL_LIB: TSmallintField
      FieldName = 'SSL_LIB'
      Required = True
    end
    object cdsParametros_NFECRYPT_LIB: TSmallintField
      FieldName = 'CRYPT_LIB'
      Required = True
    end
    object cdsParametros_NFEHTTP_LIB: TSmallintField
      FieldName = 'HTTP_LIB'
      Required = True
    end
    object cdsParametros_NFEXMLSIGN_LIB: TSmallintField
      FieldName = 'XMLSIGN_LIB'
      Required = True
    end
    object cdsParametros_NFEMODELO_CERTIFICADO: TSmallintField
      FieldName = 'MODELO_CERTIFICADO'
      Required = True
    end
    object cdsParametros_NFECAMINHO_CERTIFICADO: TStringField
      FieldName = 'CAMINHO_CERTIFICADO'
      Size = 300
    end
    object cdsParametros_NFESSL_TYPE: TSmallintField
      FieldName = 'SSL_TYPE'
      Required = True
    end
    object cdsParametros_NFESENHA_CERTIFICADO: TStringField
      FieldName = 'SENHA_CERTIFICADO'
      Size = 100
    end
    object cdsParametros_NFEVERSAO_NFE: TSmallintField
      FieldName = 'VERSAO_NFE'
      Required = True
    end
  end
  object cdsDetalhesCupomRefNFS_TEMP: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 885
    Top = 94
    object cdsDetalhesCupomRefNFS_TEMPNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object cdsDetalhesCupomRefNFS_TEMPNUMERO_ECF: TIntegerField
      FieldName = 'NUMERO_ECF'
    end
    object cdsDetalhesCupomRefNFS_TEMPCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object cdsDetalhesCupomRefNFS_TEMPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsDetalhesCupomRefNFS_TEMPQUANTIDADE: TCurrencyField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.000'
      currency = False
    end
    object cdsDetalhesCupomRefNFS_TEMPVALOR_UNITARIO: TCurrencyField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '#,##0.0000'
      currency = False
    end
    object cdsDetalhesCupomRefNFS_TEMPSUBTOTAL: TCurrencyField
      FieldName = 'SUBTOTAL'
      DisplayFormat = '#,##0.00'
      currency = False
    end
    object cdsDetalhesCupomRefNFS_TEMPDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,##0.00'
      currency = False
    end
    object cdsDetalhesCupomRefNFS_TEMPEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'EMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDetalhesCupomRefNFS_TEMPGTIN: TStringField
      FieldName = 'GTIN'
      Size = 14
    end
    object cdsDetalhesCupomRefNFS_TEMPSERIE_FAB: TStringField
      FieldName = 'SERIE_FAB'
      Size = 30
    end
  end
  object cdsCCe: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCCe'
    Left = 625
    Top = 1587
    object cdsCCeCCE: TIntegerField
      FieldName = 'CCE'
      Origin = 'CCE'
      Required = True
    end
    object cdsCCeNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Origin = 'NOTA_FISCAL'
      Size = 10
    end
    object cdsCCeEMISSAO_NOTA: TDateField
      FieldName = 'EMISSAO_NOTA'
      Origin = 'EMISSAO_NOTA'
      EditMask = '99/99/9999;0;_'
    end
    object cdsCCeDATA_CCE: TDateField
      FieldName = 'DATA_CCE'
      Origin = 'DATA_CCE'
      EditMask = '99/99/9999;0;_'
    end
    object cdsCCeCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Origin = 'CHAVE_NFE'
      Size = 44
    end
    object cdsCCeLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 10
    end
    object cdsCCeORGAO: TStringField
      FieldName = 'ORGAO'
      Origin = 'ORGAO'
      Size = 10
    end
    object cdsCCeTIPO_EVENTO: TStringField
      FieldName = 'TIPO_EVENTO'
      Origin = 'TIPO_EVENTO'
      Size = 10
    end
    object cdsCCeVERSAO_EVENTO: TStringField
      FieldName = 'VERSAO_EVENTO'
      Origin = 'VERSAO_EVENTO'
      Size = 10
    end
    object cdsCCePROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 44
    end
    object cdsCCeCORRECAO: TMemoField
      FieldName = 'CORRECAO'
      Origin = 'CORRECAO'
      BlobType = ftMemo
    end
  end
  object dspCCe: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCCe
    Left = 505
    Top = 1587
  end
  object dspCupomFiscalRefNFS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqDocumentoRef_NFS
    Left = 505
    Top = 1631
  end
  object cdsCupomFiscalRefNFS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCupomFiscalRefNFS'
    OnNewRecord = cdsCupomFiscalRefNFSNewRecord
    Left = 625
    Top = 1631
    object cdsCupomFiscalRefNFSNF_SAIDA: TIntegerField
      FieldName = 'NF_SAIDA'
      Origin = 'NF_SAIDA'
      Required = True
    end
    object cdsCupomFiscalRefNFSMODELO_NF_SAIDA: TStringField
      FieldName = 'MODELO_NF_SAIDA'
      Origin = 'MODELO_NF_SAIDA'
      Required = True
      Size = 10
    end
    object cdsCupomFiscalRefNFSSERIE_NF_SAIDA: TStringField
      FieldName = 'SERIE_NF_SAIDA'
      Origin = 'SERIE_NF_SAIDA'
      Size = 10
    end
    object cdsCupomFiscalRefNFSCNPJ_NF_SAIDA: TStringField
      FieldName = 'CNPJ_NF_SAIDA'
      Origin = 'CNPJ_NF_SAIDA'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsCupomFiscalRefNFSDOCUMENTO_REF: TStringField
      FieldName = 'DOCUMENTO_REF'
      Origin = 'DOCUMENTO_REF'
      Required = True
    end
    object cdsCupomFiscalRefNFSMODELO_DOC_REF: TStringField
      FieldName = 'MODELO_DOC_REF'
      Origin = 'MODELO_DOC_REF'
      Required = True
      Size = 10
    end
    object cdsCupomFiscalRefNFSCNPJ_FORNECEDOR_REF: TStringField
      FieldName = 'CNPJ_FORNECEDOR_REF'
      Origin = 'CNPJ_FORNECEDOR_REF'
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsCupomFiscalRefNFSCHAVE_DOCUMENTO_REF: TStringField
      FieldName = 'CHAVE_DOCUMENTO_REF'
      Origin = 'CHAVE_DOCUMENTO_REF'
      Size = 200
    end
    object cdsCupomFiscalRefNFSSERIE_DOC_REF: TIntegerField
      FieldName = 'SERIE_DOC_REF'
      Origin = 'SERIE_DOC_REF'
    end
    object cdsCupomFiscalRefNFSANO_MES_EMISSAO: TStringField
      FieldName = 'ANO_MES_EMISSAO'
      Origin = 'ANO_MES_EMISSAO'
      Size = 10
    end
    object cdsCupomFiscalRefNFSUF_DOCUMENTO_REF: TIntegerField
      FieldName = 'UF_DOCUMENTO_REF'
      Origin = 'UF_DOCUMENTO_REF'
    end
    object cdsCupomFiscalRefNFSEMISSAO_DOCUMENTO_REF: TDateField
      FieldName = 'EMISSAO_DOCUMENTO_REF'
      Origin = 'EMISSAO_DOCUMENTO_REF'
      EditMask = '99/99/9999;0;_'
    end
    object cdsCupomFiscalRefNFSINDICADOR_EMITENTE: TSmallintField
      FieldName = 'INDICADOR_EMITENTE'
      Origin = 'INDICADOR_EMITENTE'
    end
    object cdsCupomFiscalRefNFSINDICADOR_OPERACAO: TSmallintField
      FieldName = 'INDICADOR_OPERACAO'
      Origin = 'INDICADOR_OPERACAO'
    end
    object cdsCupomFiscalRefNFSFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsCupomFiscalRefNFSTIPO_DOCUMENTO: TSmallintField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = 'TIPO_DOCUMENTO'
      Required = True
    end
    object cdsCupomFiscalRefNFSINSCRICAO_ESTADUAL_EMITENTE: TStringField
      FieldName = 'INSCRICAO_ESTADUAL_EMITENTE'
      Origin = 'INSCRICAO_ESTADUAL_EMITENTE'
    end
    object cdsCupomFiscalRefNFSSIGLA_UF_EMITENTE: TStringField
      FieldName = 'SIGLA_UF_EMITENTE'
      Origin = 'SIGLA_UF_EMITENTE'
      Size = 2
    end
  end
  object dspFCP_Estados: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFCP_Estados
    Constraints = False
    Left = 505
    Top = 1675
  end
  object cdsFCP_Estados: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspFCP_Estados'
    OnCalcFields = cdsFCP_EstadosCalcFields
    OnNewRecord = cdsFCP_EstadosNewRecord
    Left = 625
    Top = 1675
    object cdsFCP_EstadosSIGLA: TStringField
      Alignment = taRightJustify
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsFCP_EstadosNCM: TStringField
      Alignment = taRightJustify
      FieldName = 'NCM'
      Origin = 'NCM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object cdsFCP_EstadosFCP: TBCDField
      FieldName = 'FCP'
      Origin = 'FCP'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsFCP_EstadosNOME_NCM: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_NCM'
      LookupDataSet = cdsNcmNbs
      LookupKeyFields = 'COD_NCM'
      LookupResultField = 'NOME_NCM'
      KeyFields = 'NCM'
      Size = 100
      Lookup = True
    end
    object cdsFCP_EstadosEXCECAO: TSmallintField
      FieldName = 'EXCECAO'
      Origin = 'EXCECAO'
      Required = True
    end
    object cdsFCP_EstadosS_EXCECAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_EXCECAO'
      Size = 3
      Calculated = True
    end
    object cdsFCP_EstadosALIQUOTA_INTERNA_DESTINO: TBCDField
      FieldName = 'ALIQUOTA_INTERNA_DESTINO'
      Origin = 'ALIQUOTA_INTERNA_DESTINO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspCre: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCre
    Constraints = False
    Left = 505
    Top = 1720
  end
  object cdsCre: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCre'
    Left = 625
    Top = 1720
    object cdsCreCRE: TIntegerField
      FieldName = 'CRE'
      Origin = 'CRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCreFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsCreDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
      Size = 10
    end
    object cdsCreSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
    end
    object cdsCreENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
    end
    object cdsCreSACADO: TIntegerField
      FieldName = 'SACADO'
      Origin = 'SACADO'
      Required = True
    end
    object cdsCreTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object cdsCreEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
    end
    object cdsCreVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      Required = True
    end
    object cdsCreMOEDA: TSmallintField
      FieldName = 'MOEDA'
      Origin = 'MOEDA'
      Required = True
    end
    object cdsCreVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreMORA: TBCDField
      FieldName = 'MORA'
      Origin = 'MORA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreDATADESCONTO: TDateField
      FieldName = 'DATADESCONTO'
      Origin = 'DATADESCONTO'
    end
    object cdsCreHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Required = True
      Size = 80
    end
    object cdsCreNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
      Origin = 'NOSSONUMERO'
    end
    object cdsCreVENCIMENTOPRORROGADO: TDateField
      FieldName = 'VENCIMENTOPRORROGADO'
      Origin = 'VENCIMENTOPRORROGADO'
    end
    object cdsCrePOSICAO: TSmallintField
      FieldName = 'POSICAO'
      Origin = 'POSICAO'
      Required = True
    end
    object cdsCreENTRADANOBANCO: TDateField
      FieldName = 'ENTRADANOBANCO'
      Origin = 'ENTRADANOBANCO'
    end
    object cdsCreBAIXA: TDateField
      FieldName = 'BAIXA'
      Origin = 'BAIXA'
    end
    object cdsCreDESCONTOCONCEDIDO: TBCDField
      FieldName = 'DESCONTOCONCEDIDO'
      Origin = 'DESCONTOCONCEDIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreABATIMENTOS: TBCDField
      FieldName = 'ABATIMENTOS'
      Origin = 'ABATIMENTOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreOUTRASDESPESAS: TBCDField
      FieldName = 'OUTRASDESPESAS'
      Origin = 'OUTRASDESPESAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreVALORPAGO: TBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreTARIFASBANCARIAS: TBCDField
      FieldName = 'TARIFASBANCARIAS'
      Origin = 'TARIFASBANCARIAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreJUROSRECEBIDOS: TBCDField
      FieldName = 'JUROSRECEBIDOS'
      Origin = 'JUROSRECEBIDOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreOUTROSCREDITOS: TBCDField
      FieldName = 'OUTROSCREDITOS'
      Origin = 'OUTROSCREDITOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreCONTA: TIntegerField
      FieldName = 'CONTA'
      Origin = 'CONTA'
    end
    object cdsCreSUBCONTA: TIntegerField
      FieldName = 'SUBCONTA'
      Origin = 'SUBCONTA'
    end
    object cdsCreTIPOOCORRENCIA: TSmallintField
      FieldName = 'TIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA'
    end
    object cdsCreTIPOAVISO: TSmallintField
      FieldName = 'TIPOAVISO'
      Origin = 'TIPOAVISO'
    end
    object cdsCreOCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      Origin = 'OCORRENCIA'
      FixedChar = True
      Size = 2
    end
    object cdsCreAVISOCOBRANCA: TStringField
      FieldName = 'AVISOCOBRANCA'
      Origin = 'AVISOCOBRANCA'
      FixedChar = True
      Size = 2
    end
    object cdsCreLANCAMENTO: TIntegerField
      FieldName = 'LANCAMENTO'
      Origin = 'LANCAMENTO'
    end
    object cdsCreTIPOCOBRANCA: TSmallintField
      FieldName = 'TIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA'
      Required = True
    end
    object cdsCreCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Origin = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object cdsCreCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 10
    end
    object cdsCreTIPOPARCELA: TSmallintField
      FieldName = 'TIPOPARCELA'
      Origin = 'TIPOPARCELA'
      Required = True
    end
    object cdsCrePEDIDODEVENDA: TIntegerField
      FieldName = 'PEDIDODEVENDA'
      Origin = 'PEDIDODEVENDA'
    end
    object cdsCrePEDIDOEXTERNO: TStringField
      FieldName = 'PEDIDOEXTERNO'
      Origin = 'PEDIDOEXTERNO'
      Size = 10
    end
    object cdsCreDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object cdsCrePERCENTUAL: TCurrencyField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Required = True
    end
    object cdsCreREDUCAO: TCurrencyField
      FieldName = 'REDUCAO'
      Origin = 'REDUCAO'
      Required = True
    end
    object cdsCreVALORCOMISSAO: TBCDField
      FieldName = 'VALORCOMISSAO'
      Origin = 'VALORCOMISSAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
    end
    object cdsCreOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object cdsCreVALOR_CHQ_DEVOLVIDO: TBCDField
      FieldName = 'VALOR_CHQ_DEVOLVIDO'
      Origin = 'VALOR_CHQ_DEVOLVIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreSEQUENCIAL: TIntegerField
      FieldName = 'SEQUENCIAL'
      Origin = 'SEQUENCIAL'
      Required = True
    end
    object cdsCreOUTROS_DEBITOS: TBCDField
      FieldName = 'OUTROS_DEBITOS'
      Origin = 'OUTROS_DEBITOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCreCONTROLE_FECHAMENTO: TIntegerField
      FieldName = 'CONTROLE_FECHAMENTO'
      Origin = 'CONTROLE_FECHAMENTO'
    end
    object cdsCreMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsCreRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object dspNFSaidaRefer: TDataSetProvider
    DataSet = dmDBEXMaster.fdqNFSaidaRefer
    Constraints = False
    Left = 505
    Top = 1763
  end
  object cdsNFSaidaRefer: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspNFSaidaRefer'
    Left = 625
    Top = 1763
    object cdsNFSaidaReferNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Required = True
    end
    object cdsNFSaidaReferEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsNFSaidaReferVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFSaidaReferNUMERO_DANFE: TStringField
      FieldName = 'NUMERO_DANFE'
      Size = 100
    end
    object cdsNFSaidaReferMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsNFSaidaReferSERIE: TStringField
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object cdsVersaoBanco: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspVersaoBanco'
    Left = 625
    Top = 1807
    object cdsVersaoBancoVERSAO: TStringField
      FieldName = 'VERSAO'
      Required = True
    end
    object cdsVersaoBancoDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdsVersaoBancoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Required = True
    end
  end
  object dspVersaoBanco: TDataSetProvider
    DataSet = dmDBEXMaster.fdqVersaoBanco
    Constraints = False
    Left = 505
    Top = 1807
  end
  object cdsLivroFiscalEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLivroFiscalEntrada'
    Left = 142
    Top = 1852
    object cdsLivroFiscalEntradaLIVRO_ENTRADA: TIntegerField
      FieldName = 'LIVRO_ENTRADA'
      Origin = 'LIVRO_ENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLivroFiscalEntradaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Required = True
    end
    object cdsLivroFiscalEntradaMES_ANO: TStringField
      FieldName = 'MES_ANO'
      Origin = 'MES_ANO'
      Required = True
      Size = 10
    end
    object cdsLivroFiscalEntradaDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsLivroFiscalEntradaNUMERO_DOCUMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Required = True
      Size = 15
    end
    object cdsLivroFiscalEntradaTIPO_ESPECIE_DOCUMENTO: TStringField
      FieldName = 'TIPO_ESPECIE_DOCUMENTO'
      Origin = 'TIPO_ESPECIE_DOCUMENTO'
      Required = True
      Size = 5
    end
    object cdsLivroFiscalEntradaSERIE_SUBSERIE: TStringField
      Alignment = taRightJustify
      FieldName = 'SERIE_SUBSERIE'
      Origin = 'SERIE_SUBSERIE'
      Size = 3
    end
    object cdsLivroFiscalEntradaDATA_DOCUMENTO: TDateField
      FieldName = 'DATA_DOCUMENTO'
      Origin = 'DATA_DOCUMENTO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsLivroFiscalEntradaCNPJ_EMITENTE: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_EMITENTE'
      Origin = 'CNPJ_EMITENTE'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsLivroFiscalEntradaUF_ORIGEM: TStringField
      FieldName = 'UF_ORIGEM'
      Origin = 'UF_ORIGEM'
      Required = True
      Size = 2
    end
    object cdsLivroFiscalEntradaVALOR_CONTABIL: TBCDField
      FieldName = 'VALOR_CONTABIL'
      Origin = 'VALOR_CONTABIL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalEntradaCODIGO_CONTABIL: TSmallintField
      FieldName = 'CODIGO_CONTABIL'
      Origin = 'CODIGO_CONTABIL'
      Required = True
    end
    object cdsLivroFiscalEntradaCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 4
    end
    object cdsLivroFiscalEntradaIDENTIFICACAO_ICMS_IPI: TSmallintField
      FieldName = 'IDENTIFICACAO_ICMS_IPI'
      Origin = 'IDENTIFICACAO_ICMS_IPI'
      Required = True
    end
    object cdsLivroFiscalEntradaCODIGO_VALORES_FISCAIS: TSmallintField
      FieldName = 'CODIGO_VALORES_FISCAIS'
      Origin = 'CODIGO_VALORES_FISCAIS'
      Required = True
    end
    object cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO: TBCDField
      FieldName = 'BASE_CALCULO_VALOR_OPERACAO'
      Origin = 'BASE_CALCULO_VALOR_OPERACAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalEntradaALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalEntradaIMPOSTO_CREDITADO: TBCDField
      FieldName = 'IMPOSTO_CREDITADO'
      Origin = 'IMPOSTO_CREDITADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalEntradaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
  end
  object dspLivroFiscalEntrada: TDataSetProvider
    DataSet = dmDBEXMaster.fdqLivroFiscalEntrada
    Left = 39
    Top = 1852
  end
  object cdsLivroFiscalSaida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLivroFiscalSaida'
    OnNewRecord = cdsLivroFiscalSaidaNewRecord
    Left = 142
    Top = 1899
    object cdsLivroFiscalSaidaLIVRO_SAIDA: TIntegerField
      FieldName = 'LIVRO_SAIDA'
      Required = True
    end
    object cdsLivroFiscalSaidaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsLivroFiscalSaidaMES_ANO: TStringField
      FieldName = 'MES_ANO'
      Required = True
      Size = 10
    end
    object cdsLivroFiscalSaidaTIPO_ESPECIE_DOCUMENTO: TStringField
      FieldName = 'TIPO_ESPECIE_DOCUMENTO'
      Required = True
      Size = 5
    end
    object cdsLivroFiscalSaidaSERIE_SUBSERIE: TStringField
      Alignment = taRightJustify
      FieldName = 'SERIE_SUBSERIE'
      Size = 4
    end
    object cdsLivroFiscalSaidaNUMERO_DOCUMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'NUMERO_DOCUMENTO'
      Required = True
      Size = 15
    end
    object cdsLivroFiscalSaidaUF_DESTINATARIO: TStringField
      FieldName = 'UF_DESTINATARIO'
      Required = True
      Size = 2
    end
    object cdsLivroFiscalSaidaDATA_DOCUMENTO: TDateField
      FieldName = 'DATA_DOCUMENTO'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsLivroFiscalSaidaVALOR_CONTABIL: TBCDField
      FieldName = 'VALOR_CONTABIL'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalSaidaCODIGO_CONTABIL: TSmallintField
      FieldName = 'CODIGO_CONTABIL'
      Required = True
    end
    object cdsLivroFiscalSaidaCFOP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsLivroFiscalSaidaBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalSaidaALIQUOTA: TCurrencyField
      FieldName = 'ALIQUOTA'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsLivroFiscalSaidaIMPOSTO_DEBITADO: TBCDField
      FieldName = 'IMPOSTO_DEBITADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalSaidaISENTAS_NAO_TRIBUTADAS: TBCDField
      FieldName = 'ISENTAS_NAO_TRIBUTADAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalSaidaOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalSaidaTOTALIZADOR_GERAL: TBCDField
      FieldName = 'TOTALIZADOR_GERAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsLivroFiscalSaidaCRZ: TIntegerField
      FieldName = 'CRZ'
      Required = True
    end
    object cdsLivroFiscalSaidaIDENTIFICACAO_ICMS_IPI: TSmallintField
      FieldName = 'IDENTIFICACAO_ICMS_IPI'
      Required = True
    end
    object cdsLivroFiscalSaidaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
  end
  object dspLivroFiscalSaida: TDataSetProvider
    DataSet = dmDBEXMaster.fdqLivroFiscalSaida
    Left = 39
    Top = 1899
  end
  object cdsPrecoQuantidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrecoQuantidade'
    Left = 392
    Top = 1852
    object cdsPrecoQuantidadePRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsPrecoQuantidadeQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsPrecoQuantidadePRECO_DESCONTO: TSmallintField
      FieldName = 'PRECO_DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsPrecoQuantidadePRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPrecoQuantidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsPrecoQuantidadeFILIAL: TSmallintField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsPrecoQuantidadeBARRAS: TStringField
      FieldName = 'BARRAS'
      Size = 17
    end
    object cdsPrecoQuantidadePERCENTUAL_DESCONTO: TCurrencyField
      FieldName = 'PERCENTUAL_DESCONTO'
      Required = True
      DisplayFormat = '#0.00'
    end
  end
  object dspPrecoQuantidade: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPrecoQuantidade
    Left = 257
    Top = 1852
  end
  object cdsSimilar: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspSimilar'
    Left = 625
    Top = 1852
    object cdsSimilarPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsSimilarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsSimilarSIMILAR: TIntegerField
      FieldName = 'SIMILAR'
    end
    object cdsSimilarUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 6
    end
  end
  object dspSimilar: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSimilar
    Constraints = False
    Left = 505
    Top = 1852
  end
  object cdsIOS_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIOS_Produto'
    Left = 625
    Top = 1899
    object cdsIOS_ProdutoITENS_OS_PECAS: TIntegerField
      FieldName = 'ITENS_OS_PECAS'
      Required = True
    end
    object cdsIOS_ProdutoORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Required = True
    end
    object cdsIOS_ProdutoCODIGO_PECA: TIntegerField
      FieldName = 'CODIGO_PECA'
    end
    object cdsIOS_ProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsIOS_ProdutoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsIOS_ProdutoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Required = True
    end
    object cdsIOS_ProdutoQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsIOS_ProdutoDIA: TSQLTimeStampField
      FieldName = 'DIA'
    end
    object cdsIOS_ProdutoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsIOS_ProdutoX_PED: TStringField
      FieldName = 'X_PED'
      Size = 15
    end
    object cdsIOS_ProdutoN_ITEM_PED: TStringField
      FieldName = 'N_ITEM_PED'
      Size = 6
    end
    object cdsIOS_ProdutoNUMERO_SERIE: TMemoField
      FieldName = 'NUMERO_SERIE'
      BlobType = ftMemo
    end
    object cdsIOS_ProdutoCODIGO_BAIXA: TIntegerField
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsIOS_ProdutoTIPO: TSmallintField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsIOS_ProdutoUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsIOS_ProdutoSTATUS_SALDO: TSmallintField
      FieldName = 'STATUS_SALDO'
      Required = True
    end
  end
  object dspIOS_Produto: TDataSetProvider
    DataSet = dmDBEXMaster.fdqIOS_Produto
    Left = 505
    Top = 1899
  end
  object cdsOS_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOS_Produto'
    Left = 392
    Top = 1899
    object cdsOS_ProdutoORDEM_DE_SERVICO: TIntegerField
      FieldName = 'ORDEM_DE_SERVICO'
      Required = True
    end
    object cdsOS_ProdutoCODIGO_SITUACAO: TIntegerField
      FieldName = 'CODIGO_SITUACAO'
      Required = True
    end
    object cdsOS_ProdutoCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object cdsOS_ProdutoDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object cdsOS_ProdutoHORA_ENTRADA: TTimeField
      FieldName = 'HORA_ENTRADA'
    end
    object cdsOS_ProdutoDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
    end
    object cdsOS_ProdutoHORA_TERMINO: TTimeField
      FieldName = 'HORA_TERMINO'
    end
    object cdsOS_ProdutoDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
    end
    object cdsOS_ProdutoHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
    end
    object cdsOS_ProdutoDATA_GARANTIA: TDateField
      FieldName = 'DATA_GARANTIA'
    end
    object cdsOS_ProdutoHORA_GARANTIA: TTimeField
      FieldName = 'HORA_GARANTIA'
    end
    object cdsOS_ProdutoVALOR_MAO_DE_OBRA: TBCDField
      FieldName = 'VALOR_MAO_DE_OBRA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoVALOR_PECAS: TBCDField
      FieldName = 'VALOR_PECAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoVALOR_DESLOCAMENTO: TBCDField
      FieldName = 'VALOR_DESLOCAMENTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoVALOR_TERCEIRO: TBCDField
      FieldName = 'VALOR_TERCEIRO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoVALOR_OUTROS: TBCDField
      FieldName = 'VALOR_OUTROS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoCODIGO_EQUIPAMENTO: TIntegerField
      FieldName = 'CODIGO_EQUIPAMENTO'
    end
    object cdsOS_ProdutoAPARELHO: TStringField
      FieldName = 'APARELHO'
      Size = 100
    end
    object cdsOS_ProdutoMARCA: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object cdsOS_ProdutoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 100
    end
    object cdsOS_ProdutoNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 100
    end
    object cdsOS_ProdutoETIQ_PATRIMONIO: TStringField
      FieldName = 'ETIQ_PATRIMONIO'
      Size = 100
    end
    object cdsOS_ProdutoACESSORIO: TStringField
      FieldName = 'ACESSORIO'
      Size = 254
    end
    object cdsOS_ProdutoDEFEITO: TMemoField
      FieldName = 'DEFEITO'
      BlobType = ftMemo
    end
    object cdsOS_ProdutoOBS_SERVICO: TMemoField
      FieldName = 'OBS_SERVICO'
      BlobType = ftMemo
    end
    object cdsOS_ProdutoLAUDO: TMemoField
      FieldName = 'LAUDO'
      BlobType = ftMemo
    end
    object cdsOS_ProdutoOBSERVACAO_APARELHO: TStringField
      FieldName = 'OBSERVACAO_APARELHO'
      Size = 254
    end
    object cdsOS_ProdutoKILOMETRO: TIntegerField
      FieldName = 'KILOMETRO'
    end
    object cdsOS_ProdutoNUMERO_NF_PEDIDO: TStringField
      FieldName = 'NUMERO_NF_PEDIDO'
      Size = 10
    end
    object cdsOS_ProdutoEM_USO: TSmallintField
      FieldName = 'EM_USO'
      Required = True
    end
    object cdsOS_ProdutoNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Size = 10
    end
    object cdsOS_ProdutoOS_REABERTA: TSmallintField
      FieldName = 'OS_REABERTA'
      Required = True
    end
    object cdsOS_ProdutoOS_OUTROS: TBCDField
      FieldName = 'OS_OUTROS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoOS_OUTROS_EMIT: TBCDField
      FieldName = 'OS_OUTROS_EMIT'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoVALOR_SINAL: TBCDField
      FieldName = 'VALOR_SINAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoPRIORIDADE: TSmallintField
      FieldName = 'PRIORIDADE'
      Required = True
    end
    object cdsOS_ProdutoNF_REMESSA: TStringField
      FieldName = 'NF_REMESSA'
      Size = 10
    end
    object cdsOS_ProdutoVALOR_NF: TBCDField
      FieldName = 'VALOR_NF'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoNF_EMITENTE: TStringField
      FieldName = 'NF_EMITENTE'
      Size = 10
    end
    object cdsOS_ProdutoGARANTIDOR: TIntegerField
      FieldName = 'GARANTIDOR'
    end
    object cdsOS_ProdutoNUMER_SERIE_GARANTIDOR: TStringField
      FieldName = 'NUMER_SERIE_GARANTIDOR'
      Size = 100
    end
    object cdsOS_ProdutoVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoVALOR_SEGURO: TBCDField
      FieldName = 'VALOR_SEGURO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoUSUARIO_MICRO: TStringField
      FieldName = 'USUARIO_MICRO'
      Size = 200
    end
    object cdsOS_ProdutoORCA_FORMAS: TMemoField
      FieldName = 'ORCA_FORMAS'
      BlobType = ftMemo
    end
    object cdsOS_ProdutoALERTA_ABANDONO: TDateField
      FieldName = 'ALERTA_ABANDONO'
    end
    object cdsOS_ProdutoHORA_ABANDONO: TTimeField
      FieldName = 'HORA_ABANDONO'
    end
    object cdsOS_ProdutoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object cdsOS_ProdutoOS_FABRICANTE: TStringField
      FieldName = 'OS_FABRICANTE'
    end
    object cdsOS_ProdutoNFC_NUMERO: TIntegerField
      FieldName = 'NFC_NUMERO'
    end
    object cdsOS_ProdutoDATA_PREVISTO: TDateField
      FieldName = 'DATA_PREVISTO'
    end
    object cdsOS_ProdutoHORA_PREVISTO: TTimeField
      FieldName = 'HORA_PREVISTO'
    end
    object cdsOS_ProdutoVALOR_TOTAL_OS: TBCDField
      FieldName = 'VALOR_TOTAL_OS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoTOTAL_HORAS: TBCDField
      FieldName = 'TOTAL_HORAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOS_ProdutoCODIGO_PRODUCAO: TIntegerField
      FieldName = 'CODIGO_PRODUCAO'
    end
    object cdsOS_ProdutoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 40
    end
    object cdsOS_ProdutoCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 15
    end
    object cdsOS_ProdutoIE_RG: TStringField
      FieldName = 'IE_RG'
    end
    object cdsOS_ProdutoENDERECO_CLIENTE: TStringField
      FieldName = 'ENDERECO_CLIENTE'
      Size = 40
    end
    object cdsOS_ProdutoNUMERO_END_CLIENTE: TStringField
      FieldName = 'NUMERO_END_CLIENTE'
    end
    object cdsOS_ProdutoCEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      Size = 10
    end
    object cdsOS_ProdutoBAIRRO_CLIENTE: TStringField
      FieldName = 'BAIRRO_CLIENTE'
      Size = 30
    end
    object cdsOS_ProdutoCIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      Size = 30
    end
    object cdsOS_ProdutoDDD_CLIENTE: TStringField
      FieldName = 'DDD_CLIENTE'
      Size = 3
    end
    object cdsOS_ProdutoTELEFONE_CLIENTE: TStringField
      FieldName = 'TELEFONE_CLIENTE'
      Size = 12
    end
    object cdsOS_ProdutoEMAIL_CLIENTE: TStringField
      FieldName = 'EMAIL_CLIENTE'
      Size = 200
    end
    object cdsOS_ProdutoUF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      Size = 2
    end
    object cdsOS_ProdutoCONTATO_CLIENTE: TStringField
      FieldName = 'CONTATO_CLIENTE'
    end
  end
  object dspOS_Produto: TDataSetProvider
    DataSet = dmDBEXMaster.fdqOS_Produto
    Left = 257
    Top = 1899
  end
  object dspUltimaNFEntradaProduto: TDataSetProvider
    DataSet = dmDBEXMaster.fdqUltimaNFEntradaProduto
    Left = 740
    Top = 140
  end
  object cdsUltimaNFEntradaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltimaNFEntradaProduto'
    Left = 885
    Top = 140
    object cdsUltimaNFEntradaProdutoENTRADA: TDateField
      Alignment = taRightJustify
      FieldName = 'ENTRADA'
      ReadOnly = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsUltimaNFEntradaProdutoEMISSAO: TDateField
      Alignment = taRightJustify
      FieldName = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsUltimaNFEntradaProdutoNFENTRADA: TIntegerField
      FieldName = 'NFENTRADA'
      Required = True
    end
    object cdsUltimaNFEntradaProdutoNOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Required = True
      Size = 15
    end
  end
  object dspItemUltimaNF: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItemUltimaNF
    Left = 740
    Top = 186
  end
  object cdsItemUltimaNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemUltimaNF'
    Left = 885
    Top = 186
    object cdsItemUltimaNFITEMNFENTRADA: TIntegerField
      FieldName = 'ITEMNFENTRADA'
      Required = True
    end
    object cdsItemUltimaNFNFENTRADA: TIntegerField
      FieldName = 'NFENTRADA'
      Required = True
    end
    object cdsItemUltimaNFEAN: TStringField
      FieldName = 'EAN'
      Required = True
      Size = 15
    end
    object cdsItemUltimaNFPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsItemUltimaNFCST: TSmallintField
      FieldName = 'CST'
      Required = True
      DisplayFormat = '000'
    end
    object cdsItemUltimaNFQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemUltimaNFUNIDADEEMBALAGEM: TBCDField
      FieldName = 'UNIDADEEMBALAGEM'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsItemUltimaNFVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Required = True
      Precision = 18
    end
    object cdsItemUltimaNFDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsItemUltimaNFIPI: TCurrencyField
      FieldName = 'IPI'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItemUltimaNFICMSENTRADA: TCurrencyField
      FieldName = 'ICMSENTRADA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItemUltimaNFICMSSAIDA: TCurrencyField
      FieldName = 'ICMSSAIDA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsItemUltimaNFCFOP: TStringField
      FieldName = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsItemUltimaNFBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFBASE_SUBSTITUICAO: TBCDField
      FieldName = 'BASE_SUBSTITUICAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFVALOR_SUBSTITUICAO: TBCDField
      FieldName = 'VALOR_SUBSTITUICAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFTIPO_DESCONTO: TSmallintField
      FieldName = 'TIPO_DESCONTO'
      Required = True
    end
    object cdsItemUltimaNFSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFISENTO_NAOTRIBUTADO: TBCDField
      FieldName = 'ISENTO_NAOTRIBUTADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFENCARGOS: TBCDField
      FieldName = 'ENCARGOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFNCM: TStringField
      FieldName = 'NCM'
      Size = 15
    end
    object cdsItemUltimaNFREDUCAO_BASE: TFMTBCDField
      FieldName = 'REDUCAO_BASE'
      Required = True
      Precision = 18
      Size = 5
    end
    object cdsItemUltimaNFDESCONTO_RATEADO: TBCDField
      FieldName = 'DESCONTO_RATEADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFDESPESA_RATEADA: TBCDField
      FieldName = 'DESPESA_RATEADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFFRETE_RATEADO: TBCDField
      FieldName = 'FRETE_RATEADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFBASE_ICMS_SIMPLES: TBCDField
      FieldName = 'BASE_ICMS_SIMPLES'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFVALOR_ICMS_SIMPLES: TBCDField
      FieldName = 'VALOR_ICMS_SIMPLES'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFALIQUOTA_ST: TCurrencyField
      FieldName = 'ALIQUOTA_ST'
      Required = True
    end
    object cdsItemUltimaNFIND_APURACAO_IPI: TIntegerField
      FieldName = 'IND_APURACAO_IPI'
      Required = True
    end
    object cdsItemUltimaNFCOD_ENQUADRAMENTO_IPI: TStringField
      FieldName = 'COD_ENQUADRAMENTO_IPI'
      Size = 3
    end
    object cdsItemUltimaNFBASE_CALCULO_IPI: TBCDField
      FieldName = 'BASE_CALCULO_IPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFALIQUOTA_IPI: TCurrencyField
      FieldName = 'ALIQUOTA_IPI'
      Required = True
    end
    object cdsItemUltimaNFCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 2
    end
    object cdsItemUltimaNFVALOR_BASE_PIS: TBCDField
      FieldName = 'VALOR_BASE_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFP_ALIQUOTA_PIS: TBCDField
      FieldName = 'P_ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsItemUltimaNFQUANT_BC_PIS: TBCDField
      FieldName = 'QUANT_BC_PIS'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsItemUltimaNFV_ALIQUOTA_PIS: TBCDField
      FieldName = 'V_ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object cdsItemUltimaNFVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object cdsItemUltimaNFVALOR_BC_COFINS: TBCDField
      FieldName = 'VALOR_BC_COFINS'
      Required = True
      Precision = 18
    end
    object cdsItemUltimaNFP_ALIQUOTA_COFINS: TBCDField
      FieldName = 'P_ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsItemUltimaNFQUANTIDADE_BC_COFINS: TBCDField
      FieldName = 'QUANTIDADE_BC_COFINS'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsItemUltimaNFV_ALIQUOTA_COFINS: TBCDField
      FieldName = 'V_ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object cdsItemUltimaNFVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsItemUltimaNFCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 2
    end
    object cdsItemUltimaNFNUMERO_ITEM: TIntegerField
      FieldName = 'NUMERO_ITEM'
    end
  end
  object cdsFCP_NCM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFCP_NCM'
    Left = 885
    Top = 232
    object cdsFCP_NCMSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 2
    end
    object cdsFCP_NCMNCM: TStringField
      FieldName = 'NCM'
      Required = True
      Size = 8
    end
    object cdsFCP_NCMFCP: TBCDField
      FieldName = 'FCP'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsFCP_NCMEXCECAO: TSmallintField
      FieldName = 'EXCECAO'
      Required = True
    end
    object cdsFCP_NCMALIQUOTA_INTERNA_DESTINO: TBCDField
      FieldName = 'ALIQUOTA_INTERNA_DESTINO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspFCP_NCM: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFCP_NCM
    Left = 740
    Top = 232
  end
  object cdsInfoNutricional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInfoNutricional'
    Left = 885
    Top = 279
    object cdsInfoNutricionalINFNUTRICIONAL: TIntegerField
      FieldName = 'INFNUTRICIONAL'
      Origin = 'INFNUTRICIONAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInfoNutricionalPORCAO: TStringField
      FieldName = 'PORCAO'
      Origin = 'PORCAO'
      Required = True
      Size = 100
    end
    object cdsInfoNutricionalQUANTIDADE: TLargeintField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object cdsInfoNutricionalUNIDADEDEPORCAO: TStringField
      FieldName = 'UNIDADEDEPORCAO'
      Origin = 'UNIDADEDEPORCAO'
      Required = True
      Size = 2
    end
    object cdsInfoNutricionalPARTEINTEIRAMEDIDACASEIRA: TLargeintField
      FieldName = 'PARTEINTEIRAMEDIDACASEIRA'
      Origin = 'PARTEINTEIRAMEDIDACASEIRA'
      Required = True
    end
    object cdsInfoNutricionalPARTEDECIMALMEDIDACASEIRA: TStringField
      FieldName = 'PARTEDECIMALMEDIDACASEIRA'
      Origin = 'PARTEDECIMALMEDIDACASEIRA'
      Required = True
      Size = 3
    end
    object cdsInfoNutricionalMEDIDACASEIRAUTILIZADA: TStringField
      FieldName = 'MEDIDACASEIRAUTILIZADA'
      Origin = 'MEDIDACASEIRAUTILIZADA'
      Required = True
      Size = 25
    end
    object cdsInfoNutricionalVALORCALORICO: TLargeintField
      FieldName = 'VALORCALORICO'
      Origin = 'VALORCALORICO'
      Required = True
    end
    object cdsInfoNutricionalVDVALORCALORICO: TLargeintField
      FieldName = 'VDVALORCALORICO'
      Origin = 'VDVALORCALORICO'
      Required = True
    end
    object cdsInfoNutricionalCARBOIDRATOS: TLargeintField
      FieldName = 'CARBOIDRATOS'
      Origin = 'CARBOIDRATOS'
      Required = True
    end
    object cdsInfoNutricionalMENOR1GCARBOIDRATOS: TSmallintField
      FieldName = 'MENOR1GCARBOIDRATOS'
      Origin = 'MENOR1GCARBOIDRATOS'
      Required = True
    end
    object cdsInfoNutricionalVDCARBOIDRATOS: TLargeintField
      FieldName = 'VDCARBOIDRATOS'
      Origin = 'VDCARBOIDRATOS'
      Required = True
    end
    object cdsInfoNutricionalPROTEINAS: TBCDField
      FieldName = 'PROTEINAS'
      Origin = 'PROTEINAS'
      Required = True
      Precision = 18
      Size = 1
    end
    object cdsInfoNutricionalMENOR1GPROTEINA: TSmallintField
      FieldName = 'MENOR1GPROTEINA'
      Origin = 'MENOR1GPROTEINA'
      Required = True
    end
    object cdsInfoNutricionalVDPROTEINAS: TLargeintField
      FieldName = 'VDPROTEINAS'
      Origin = 'VDPROTEINAS'
      Required = True
    end
    object cdsInfoNutricionalGORDURASTOTAIS: TBCDField
      FieldName = 'GORDURASTOTAIS'
      Origin = 'GORDURASTOTAIS'
      Required = True
      Precision = 18
      Size = 1
    end
    object cdsInfoNutricionalVDGORDURASTOTAIS: TLargeintField
      FieldName = 'VDGORDURASTOTAIS'
      Origin = 'VDGORDURASTOTAIS'
      Required = True
    end
    object cdsInfoNutricionalGORDURASSATURADAS: TBCDField
      FieldName = 'GORDURASSATURADAS'
      Origin = 'GORDURASSATURADAS'
      Required = True
      Precision = 18
      Size = 1
    end
    object cdsInfoNutricionalVDGORDURASSATURADAS: TLargeintField
      FieldName = 'VDGORDURASSATURADAS'
      Origin = 'VDGORDURASSATURADAS'
      Required = True
    end
    object cdsInfoNutricionalCOLESTEROL: TLargeintField
      FieldName = 'COLESTEROL'
      Origin = 'COLESTEROL'
      Required = True
    end
    object cdsInfoNutricionalMENOR5GCOLESTEROL: TSmallintField
      FieldName = 'MENOR5GCOLESTEROL'
      Origin = 'MENOR5GCOLESTEROL'
      Required = True
    end
    object cdsInfoNutricionalVDCOLESTEROL: TLargeintField
      FieldName = 'VDCOLESTEROL'
      Origin = 'VDCOLESTEROL'
      Required = True
    end
    object cdsInfoNutricionalFIBRAALIMENTAR: TBCDField
      FieldName = 'FIBRAALIMENTAR'
      Origin = 'FIBRAALIMENTAR'
      Required = True
      Precision = 18
      Size = 1
    end
    object cdsInfoNutricionalMENOR1GFIBRAALIMENTAR: TSmallintField
      FieldName = 'MENOR1GFIBRAALIMENTAR'
      Origin = 'MENOR1GFIBRAALIMENTAR'
      Required = True
    end
    object cdsInfoNutricionalVDFIBRAALIMENTAR: TLargeintField
      FieldName = 'VDFIBRAALIMENTAR'
      Origin = 'VDFIBRAALIMENTAR'
      Required = True
    end
    object cdsInfoNutricionalCALCIO: TLargeintField
      FieldName = 'CALCIO'
      Origin = 'CALCIO'
      Required = True
    end
    object cdsInfoNutricionalQTNAOSIGNIFICATIVACALCIO: TSmallintField
      FieldName = 'QTNAOSIGNIFICATIVACALCIO'
      Origin = 'QTNAOSIGNIFICATIVACALCIO'
      Required = True
    end
    object cdsInfoNutricionalVDCALCIO: TLargeintField
      FieldName = 'VDCALCIO'
      Origin = 'VDCALCIO'
      Required = True
    end
    object cdsInfoNutricionalFERRO: TBCDField
      FieldName = 'FERRO'
      Origin = 'FERRO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsInfoNutricionalQTNAODIGINIFICATIVAFERRO: TSmallintField
      FieldName = 'QTNAODIGINIFICATIVAFERRO'
      Origin = 'QTNAODIGINIFICATIVAFERRO'
      Required = True
    end
    object cdsInfoNutricionalVDFERRO: TLargeintField
      FieldName = 'VDFERRO'
      Origin = 'VDFERRO'
      Required = True
    end
    object cdsInfoNutricionalSODIO: TLargeintField
      FieldName = 'SODIO'
      Origin = 'SODIO'
      Required = True
    end
    object cdsInfoNutricionalVDSODIO: TLargeintField
      FieldName = 'VDSODIO'
      Origin = 'VDSODIO'
      Required = True
    end
    object cdsInfoNutricionalVALORENERGETICO_KC: TLargeintField
      FieldName = 'VALORENERGETICO_KC'
      Origin = 'VALORENERGETICO_KC'
      Required = True
    end
    object cdsInfoNutricionalVALORENERGETICO_KJ: TLargeintField
      FieldName = 'VALORENERGETICO_KJ'
      Origin = 'VALORENERGETICO_KJ'
      Required = True
    end
    object cdsInfoNutricionalVDENERGETICO: TLargeintField
      FieldName = 'VDENERGETICO'
      Origin = 'VDENERGETICO'
      Required = True
    end
    object cdsInfoNutricionalGORDURASTRANS: TBCDField
      FieldName = 'GORDURASTRANS'
      Origin = 'GORDURASTRANS'
      Required = True
      Precision = 18
      Size = 1
    end
  end
  object dspInfoNutricional: TDataSetProvider
    DataSet = dmDBEXMaster.fdqInfoNutricional
    Left = 740
    Top = 279
  end
  object cdsReceitaProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReceitaProdutos'
    Left = 885
    Top = 324
    object cdsReceitaProdutosRECEITA_PRODUTOS: TIntegerField
      FieldName = 'RECEITA_PRODUTOS'
      Required = True
    end
    object cdsReceitaProdutosFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsReceitaProdutosPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsReceitaProdutosINGREDIENTE1: TStringField
      FieldName = 'INGREDIENTE1'
      Size = 50
    end
    object cdsReceitaProdutosINGREDIENTE2: TStringField
      FieldName = 'INGREDIENTE2'
      Size = 50
    end
    object cdsReceitaProdutosINGREDIENTE3: TStringField
      FieldName = 'INGREDIENTE3'
      Size = 50
    end
    object cdsReceitaProdutosINGREDIENTE4: TStringField
      FieldName = 'INGREDIENTE4'
      Size = 50
    end
    object cdsReceitaProdutosINGREDIENTE5: TStringField
      FieldName = 'INGREDIENTE5'
      Size = 50
    end
    object cdsReceitaProdutosINGREDIENTE6: TStringField
      FieldName = 'INGREDIENTE6'
      Size = 50
    end
    object cdsReceitaProdutosINGREDIENTE7: TStringField
      FieldName = 'INGREDIENTE7'
      Size = 50
    end
  end
  object dspReceitaProdutos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqReceitaProdutos
    Left = 740
    Top = 324
  end
  object cdsTeclado_Balanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTeclado_Balanca'
    Left = 885
    Top = 370
    object cdsTeclado_BalancaSETOR: TIntegerField
      FieldName = 'SETOR'
      Required = True
    end
    object cdsTeclado_BalancaTECLA: TIntegerField
      FieldName = 'TECLA'
      Required = True
    end
    object cdsTeclado_BalancaTECLADO: TIntegerField
      FieldName = 'TECLADO'
      Required = True
    end
    object cdsTeclado_BalancaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsTeclado_BalancaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsTeclado_BalancaTEXTOBOTAO1: TStringField
      FieldName = 'TEXTOBOTAO1'
      Size = 14
    end
    object cdsTeclado_BalancaTEXTOBOTAO2: TStringField
      FieldName = 'TEXTOBOTAO2'
      Size = 14
    end
    object cdsTeclado_BalancaTEXTOBOTAO3: TStringField
      FieldName = 'TEXTOBOTAO3'
      Size = 14
    end
    object cdsTeclado_BalancaTEXTOCONJUGADO1: TStringField
      FieldName = 'TEXTOCONJUGADO1'
      Size = 14
    end
    object cdsTeclado_BalancaTEXTOCONJUGADO2: TStringField
      FieldName = 'TEXTOCONJUGADO2'
      Size = 14
    end
    object cdsTeclado_BalancaTEXTOCONJUGADO3: TStringField
      FieldName = 'TEXTOCONJUGADO3'
      Size = 14
    end
    object cdsTeclado_BalancaOPCAO: TSmallintField
      FieldName = 'OPCAO'
      Required = True
    end
    object cdsTeclado_BalancaCAMINHOIMAGEM: TStringField
      FieldName = 'CAMINHOIMAGEM'
      Size = 100
    end
    object cdsTeclado_BalancaOPCAOLOCAL: TSmallintField
      FieldName = 'OPCAOLOCAL'
      Required = True
    end
  end
  object dspTeclado_Balanca: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTeclado_Balanca
    Left = 740
    Top = 370
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    AfterEdit = cdsProdutosAfterEdit
    OnCalcFields = cdsProdutosCalcFields
    OnNewRecord = cdsProdutosNewRecord
    Left = 392
    Top = 324
    object cdsProdutosPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object cdsProdutosSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
      Origin = 'SUBGRUPO'
    end
    object cdsProdutosSECAO: TIntegerField
      FieldName = 'SECAO'
      Origin = 'SECAO'
    end
    object cdsProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 6
    end
    object cdsProdutosUNIDADEEMBALAGEM: TBCDField
      FieldName = 'UNIDADEEMBALAGEM'
      Origin = 'UNIDADEEMBALAGEM'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosPESOLIQUIDO: TBCDField
      FieldName = 'PESOLIQUIDO'
      Origin = 'PESOLIQUIDO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosPESOBRUTO: TBCDField
      FieldName = 'PESOBRUTO'
      Origin = 'PESOBRUTO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      Origin = 'TRIBUTACAO'
      Required = True
    end
    object cdsProdutosATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
    end
    object cdsProdutosREDBASECALCULO: TFMTBCDField
      FieldName = 'REDBASECALCULO'
      Origin = 'REDBASECALCULO'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object cdsProdutosCST: TStringField
      Alignment = taRightJustify
      FieldName = 'CST'
      Origin = 'CST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsProdutosSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsProdutosFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
    end
    object cdsProdutosNBM: TStringField
      FieldName = 'NBM'
      Origin = 'NBM'
      Size = 15
    end
    object cdsProdutosNCM: TStringField
      Alignment = taRightJustify
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object cdsProdutosDOLARVENDA: TBCDField
      FieldName = 'DOLARVENDA'
      Origin = 'DOLARVENDA'
      Required = True
      Precision = 18
    end
    object cdsProdutosINFNUTRICIONAL: TIntegerField
      FieldName = 'INFNUTRICIONAL'
      Origin = 'INFNUTRICIONAL'
    end
    object cdsProdutosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object cdsProdutosISENTOPISCOFINS: TSmallintField
      FieldName = 'ISENTOPISCOFINS'
      Origin = 'ISENTOPISCOFINS'
      Required = True
    end
    object cdsProdutosSIMILAR: TIntegerField
      FieldName = 'SIMILAR'
      Origin = '"SIMILAR"'
    end
    object cdsProdutosFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
      Origin = 'FABRICANTE'
    end
    object cdsProdutosALTERAR_PRECOVENDA_PDVI: TSmallintField
      FieldName = 'ALTERAR_PRECOVENDA_PDVI'
      Origin = 'ALTERAR_PRECOVENDA_PDVI'
      Required = True
    end
    object cdsProdutosLITRAGEM: TBCDField
      FieldName = 'LITRAGEM'
      Origin = 'LITRAGEM'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosCF_IPI: TSmallintField
      FieldName = 'CF_IPI'
      Origin = 'CF_IPI'
      Required = True
    end
    object cdsProdutosCOMPOEM_CESTA_BASICA: TSmallintField
      FieldName = 'COMPOEM_CESTA_BASICA'
      Origin = 'COMPOEM_CESTA_BASICA'
      Required = True
    end
    object cdsProdutosAUTOR1: TIntegerField
      FieldName = 'AUTOR1'
      Origin = 'AUTOR1'
    end
    object cdsProdutosAUTOR2: TIntegerField
      FieldName = 'AUTOR2'
      Origin = 'AUTOR2'
    end
    object cdsProdutosPERMITE_VENDA_FRACIONADA: TSmallintField
      FieldName = 'PERMITE_VENDA_FRACIONADA'
      Origin = 'PERMITE_VENDA_FRACIONADA'
      Required = True
    end
    object cdsProdutosUNIDADE_ATACADO: TBCDField
      FieldName = 'UNIDADE_ATACADO'
      Origin = 'UNIDADE_ATACADO'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutosALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
    end
    object cdsProdutosVISIBILIDADE: TSmallintField
      FieldName = 'VISIBILIDADE'
      Origin = 'VISIBILIDADE'
      Required = True
    end
    object cdsProdutosCST_IPI: TIntegerField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
    end
    object cdsProdutosCST_PIS: TIntegerField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
    end
    object cdsProdutosCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
    end
    object cdsProdutosTIPO_ITEM: TSmallintField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
      Required = True
    end
    object cdsProdutosMVA: TIntegerField
      FieldName = 'MVA'
      Origin = 'MVA'
    end
    object cdsProdutosPAUTA_FISCAL: TIntegerField
      FieldName = 'PAUTA_FISCAL'
      Origin = 'PAUTA_FISCAL'
    end
    object cdsProdutosLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
      Origin = 'LEI_PIS_COFINS'
    end
    object cdsProdutosPRODUTO_ORIGEM: TIntegerField
      FieldName = 'PRODUTO_ORIGEM'
      Origin = 'PRODUTO_ORIGEM'
    end
    object cdsProdutosCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object cdsProdutosCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object cdsProdutosNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object cdsProdutosUND_ATACADO: TStringField
      FieldName = 'UND_ATACADO'
      Origin = 'UND_ATACADO'
      Size = 2
    end
    object cdsProdutosALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object cdsProdutosALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 5
    end
    object cdsProdutosCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
    object cdsProdutosCODIGO_ANP: TStringField
      FieldName = 'CODIGO_ANP'
      Origin = 'CODIGO_ANP'
      Size = 9
    end
    object cdsProdutosCARGA_TRIBUTARIA_NAC: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_NAC'
      Origin = 'CARGA_TRIBUTARIA_NAC'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutosCARGA_TRIBUTARIA_IMP: TBCDField
      FieldName = 'CARGA_TRIBUTARIA_IMP'
      Origin = 'CARGA_TRIBUTARIA_IMP'
      Required = True
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutosDESCONTO_PERSONALIZADO: TSmallintField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Origin = 'DESCONTO_PERSONALIZADO'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsProdutosORIGEM_MERCADORIA: TSmallintField
      FieldName = 'ORIGEM_MERCADORIA'
      Origin = 'ORIGEM_MERCADORIA'
    end
    object cdsProdutosCEST: TStringField
      Alignment = taRightJustify
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object cdsProdutosLOJA: TBCDField
      FieldName = 'LOJA'
      Origin = 'LOJA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosDEPOSITO: TBCDField
      FieldName = 'DEPOSITO'
      Origin = 'DEPOSITO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosSALDOMINIMO: TBCDField
      FieldName = 'SALDOMINIMO'
      Origin = 'SALDOMINIMO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosSALDOMAXIMO: TBCDField
      FieldName = 'SALDOMAXIMO'
      Origin = 'SALDOMAXIMO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosSALDOANTERIOR: TBCDField
      FieldName = 'SALDOANTERIOR'
      Origin = 'SALDOANTERIOR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosSALDO_RESERVADO: TBCDField
      FieldName = 'SALDO_RESERVADO'
      Origin = 'SALDO_RESERVADO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosSALDO_ALMOXARIFADO: TBCDField
      FieldName = 'SALDO_ALMOXARIFADO'
      Origin = 'SALDO_ALMOXARIFADO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object cdsProdutosPROMOCAO: TSmallintField
      FieldName = 'PROMOCAO'
      Origin = 'PROMOCAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsProdutosPRECODEVENDA: TBCDField
      FieldName = 'PRECODEVENDA'
      Origin = 'PRECODEVENDA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
    end
    object cdsProdutosDESCRICAO_CST: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_CST'
      LookupDataSet = cdsCst
      LookupKeyFields = 'CST'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CST'
      Size = 40
      Lookup = True
    end
    object cdsProdutosNOME_FORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FORNECEDOR'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'FORNECEDOR'
      Size = 40
      Lookup = True
    end
    object cdsProdutosNOME_GRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_GRUPO'
      LookupDataSet = cdsGrupo
      LookupKeyFields = 'GRUPO'
      LookupResultField = 'NOME'
      KeyFields = 'GRUPO'
      Size = 40
      Lookup = True
    end
    object cdsProdutosNOME_SUBGRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_SUBGRUPO'
      LookupDataSet = cdsSubGrupo
      LookupKeyFields = 'SUBGRUPO'
      LookupResultField = 'NOME'
      KeyFields = 'SUBGRUPO'
      Size = 40
      Lookup = True
    end
    object cdsProdutosNOME_SECAO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_SECAO'
      LookupDataSet = cdsSecao
      LookupKeyFields = 'SECAO'
      LookupResultField = 'NOME'
      KeyFields = 'SECAO'
      Size = 40
      Lookup = True
    end
    object cdsProdutosNOME_TRIBUTACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_TRIBUTACAO'
      LookupDataSet = cdsTributacao
      LookupKeyFields = 'TRIBUTACAO'
      LookupResultField = 'NOME'
      KeyFields = 'TRIBUTACAO'
      Size = 40
      Lookup = True
    end
    object cdsProdutosS_ATIVO: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'S_ATIVO'
      Size = 3
      Calculated = True
    end
    object cdsProdutosS_PROMOCAO: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'S_PROMOCAO'
      Size = 3
      Calculated = True
    end
    object cdsProdutosSALDO_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALDO_TOTAL'
      DisplayFormat = '#,##0.000'
      Calculated = True
    end
    object cdsProdutosDESCRICAO_PRODUTO_ORIGEM: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO_ORIGEM'
      LookupDataSet = cdsProduto_Origem
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_ORIGEM'
      Size = 40
      Lookup = True
    end
  end
  object cdsProduto_Origem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto_Origem'
    Left = 885
    Top = 417
    object cdsProduto_OrigemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsProduto_OrigemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dspProduto_Origem: TDataSetProvider
    DataSet = dmDBEXMaster.fdqProduto_Origem
    Left = 740
    Top = 417
  end
  object dspSel_Prod_E_S_Promo: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSel_Prod_E_S_Promo
    Left = 740
    Top = 463
  end
  object cdsSel_Prod_E_S_Promo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSel_Prod_E_S_Promo'
    Left = 885
    Top = 463
    object cdsSel_Prod_E_S_PromoOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsSel_Prod_E_S_PromoOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Size = 40
    end
    object cdsSel_Prod_E_S_PromoOP_PRECO_VENDA: TBCDField
      FieldName = 'OP_PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object cdsSel_Prod_E_S_PromoOP_PRECO_PROMO: TBCDField
      FieldName = 'OP_PRECO_PROMO'
      Precision = 18
      Size = 2
    end
    object cdsSel_Prod_E_S_PromoOP_DATA_INI: TDateField
      FieldName = 'OP_DATA_INI'
    end
    object cdsSel_Prod_E_S_PromoOP_DATA_FIM: TDateField
      FieldName = 'OP_DATA_FIM'
    end
    object cdsSel_Prod_E_S_PromoOP_STATUS: TIntegerField
      FieldName = 'OP_STATUS'
    end
  end
  object dspConsultaAgenda: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConsultaAgenda
    Left = 740
    Top = 509
  end
  object cdsConsultaAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaAgenda'
    Left = 885
    Top = 509
    object cdsConsultaAgendaAGENDA: TIntegerField
      FieldName = 'AGENDA'
      Required = True
    end
    object cdsConsultaAgendaCOMPROMISSO: TMemoField
      FieldName = 'COMPROMISSO'
      BlobType = ftMemo
    end
    object cdsConsultaAgendaDATA_COMPROMISSO: TDateField
      FieldName = 'DATA_COMPROMISSO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsConsultaAgendaHORA_COMPROMISSO: TTimeField
      FieldName = 'HORA_COMPROMISSO'
      EditMask = '99:99;0;_'
    end
    object cdsConsultaAgendaALERTA: TSmallintField
      FieldName = 'ALERTA'
      Required = True
    end
    object cdsConsultaAgendaFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Required = True
    end
    object cdsConsultaAgendaDATA_REALIZACAO: TDateField
      FieldName = 'DATA_REALIZACAO'
      EditMask = '99/99/9999;0;_'
    end
    object cdsConsultaAgendaHORA_REALIZACAO: TTimeField
      FieldName = 'HORA_REALIZACAO'
      EditMask = '99:99;0;_'
    end
    object cdsConsultaAgendaREALIZADO: TSmallintField
      FieldName = 'REALIZADO'
      Required = True
    end
    object cdsConsultaAgendaNOME_FUNCIONARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FUNCIONARIO'
      LookupDataSet = cdsFuncionarios
      LookupKeyFields = 'FUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'FUNCIONARIO'
      Size = 40
      Lookup = True
    end
  end
  object cdsFretePedidoVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFretePedidoVenda'
    OnNewRecord = cdsFretePedidoVendaNewRecord
    Left = 885
    Top = 555
    object cdsFretePedidoVendaFRETE_PEDIDO_VENDA: TIntegerField
      FieldName = 'FRETE_PEDIDO_VENDA'
      Required = True
    end
    object cdsFretePedidoVendaPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Required = True
    end
    object cdsFretePedidoVendaTIPO_LANCAMENTO: TIntegerField
      FieldName = 'TIPO_LANCAMENTO'
    end
    object cdsFretePedidoVendaPLANO_CONTAS: TIntegerField
      FieldName = 'PLANO_CONTAS'
    end
    object cdsFretePedidoVendaITEM_PLANO_CONTAS: TIntegerField
      FieldName = 'ITEM_PLANO_CONTAS'
    end
    object cdsFretePedidoVendaTIPO_PAGAMENTO: TSmallintField
      FieldName = 'TIPO_PAGAMENTO'
      Required = True
    end
    object cdsFretePedidoVendaVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Required = True
    end
    object cdsFretePedidoVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsFretePedidoVendaS_LANCAMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'S_LANCAMENTO'
      LookupDataSet = cdsLancamentos
      LookupKeyFields = 'LANCAMENTO'
      LookupResultField = 'NOME'
      KeyFields = 'TIPO_LANCAMENTO'
      Size = 40
      Lookup = True
    end
    object cdsFretePedidoVendaS_PLANO_CONTAS: TStringField
      FieldKind = fkLookup
      FieldName = 'S_PLANO_CONTAS'
      LookupDataSet = cdsPlanoContas
      LookupKeyFields = 'PLANODECONTAS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PLANO_CONTAS'
      Size = 40
      Lookup = True
    end
    object cdsFretePedidoVendaS_ITEM_PLANO_CONTAS: TStringField
      FieldKind = fkLookup
      FieldName = 'S_ITEM_PLANO_CONTAS'
      LookupDataSet = cdsItemPlContas
      LookupKeyFields = 'ITEMPLANODECONTAS'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ITEM_PLANO_CONTAS'
      Size = 40
      Lookup = True
    end
  end
  object dspFretePedidoVenda: TDataSetProvider
    DataSet = dmDBEXMaster.fdqFretePedidoVenda
    Left = 740
    Top = 555
  end
  object cdsDeslocamentoOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeslocamentoOS'
    OnCalcFields = cdsDeslocamentoOSCalcFields
    OnNewRecord = cdsDeslocamentoOSNewRecord
    Left = 885
    Top = 604
    object cdsDeslocamentoOSDESLOCAMENTO_OS: TIntegerField
      FieldName = 'DESLOCAMENTO_OS'
      Required = True
    end
    object cdsDeslocamentoOSORDEM_SERVICO: TIntegerField
      FieldName = 'ORDEM_SERVICO'
      Required = True
    end
    object cdsDeslocamentoOSDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
    object cdsDeslocamentoOSHORA_SAIDA_ORIGEM: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORA_SAIDA_ORIGEM'
      Required = True
      DisplayFormat = 'hh:mm'
      EditMask = '99:99;0;_'
    end
    object cdsDeslocamentoOSKM_SAIDA_ORIGEM: TIntegerField
      FieldName = 'KM_SAIDA_ORIGEM'
      Required = True
    end
    object cdsDeslocamentoOSHORA_CHEGADA_DESTINO: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORA_CHEGADA_DESTINO'
      DisplayFormat = 'hh:mm'
      EditMask = '99:99;0;_'
    end
    object cdsDeslocamentoOSKM_CHEGADA_DESTINO: TIntegerField
      FieldName = 'KM_CHEGADA_DESTINO'
      Required = True
    end
    object cdsDeslocamentoOSHORA_SAIDA_DESTINO: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORA_SAIDA_DESTINO'
      DisplayFormat = 'hh:mm'
      EditMask = '99:99;0;_'
    end
    object cdsDeslocamentoOSKM_SAIDA_DESTINO: TIntegerField
      FieldName = 'KM_SAIDA_DESTINO'
      Required = True
    end
    object cdsDeslocamentoOSHORA_REGRESSO_ORIGEM: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORA_REGRESSO_ORIGEM'
      DisplayFormat = 'hh:mm'
      EditMask = '99:99;0;_'
    end
    object cdsDeslocamentoOSKM_REGRESSO_ORIGEM: TIntegerField
      FieldName = 'KM_REGRESSO_ORIGEM'
      Required = True
    end
    object cdsDeslocamentoOSVALOR_ALIMENTACAO: TBCDField
      FieldName = 'VALOR_ALIMENTACAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsDeslocamentoOSVALOR_HOSPEDAGEM: TIntegerField
      FieldName = 'VALOR_HOSPEDAGEM'
      DisplayFormat = '#,##0.00'
    end
    object cdsDeslocamentoOSKM_TOTAL: TIntegerField
      FieldName = 'KM_TOTAL'
      Required = True
    end
    object cdsDeslocamentoOSHORAS_TOTAL: TTimeField
      Alignment = taRightJustify
      FieldName = 'HORAS_TOTAL'
      Required = True
      DisplayFormat = 'hh:mm'
      EditMask = '99:99;0;_'
    end
    object cdsDeslocamentoOSKM_CALC: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'KM_CALC'
      Calculated = True
    end
    object cdsDeslocamentoOSHORAS_CALC: TTimeField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'HORAS_CALC'
      DisplayFormat = 'HH:mm'
      Calculated = True
    end
  end
  object dspDeslocamentoOS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqDeslocamentoOS
    Left = 740
    Top = 604
  end
  object dspConfig_financeiro: TDataSetProvider
    DataSet = dmDBEXMaster.fdqConfig_financeiro
    Left = 740
    Top = 648
  end
  object cdsConfig_financeiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig_financeiro'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 885
    Top = 648
    object cdsConfig_financeiroCONFIG_FINANCEIRO: TIntegerField
      FieldName = 'CONFIG_FINANCEIRO'
      Required = True
    end
    object cdsConfig_financeiroEMITIR_RECIBO_RECEBIMENTO: TSmallintField
      FieldName = 'EMITIR_RECIBO_RECEBIMENTO'
      Required = True
    end
    object cdsConfig_financeiroIMPORTAR_CHEQUES_PDV: TSmallintField
      FieldName = 'IMPORTAR_CHEQUES_PDV'
      Required = True
    end
  end
  object cdsTotalizaVContabilE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalizaVContabilE'
    Left = 176
    Top = 1944
    object cdsTotalizaVContabilEOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsTotalizaVContabilEOP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsTotalizaVContabilEOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilEOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilEOP_IMPOSTO_CREDITADO: TBCDField
      FieldName = 'OP_IMPOSTO_CREDITADO'
      Origin = 'OP_IMPOSTO_CREDITADO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilEOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilEOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
  end
  object dspTotalizaVContabilE: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTotalizaVContabilE
    Left = 41
    Top = 1944
  end
  object cdsTotalizaValoresEST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalizaValoresEST'
    Left = 176
    Top = 1987
    object cdsTotalizaValoresESTOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsTotalizaValoresESTOP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsTotalizaValoresESTOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresESTOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresESTOP_IMPOSTO_CREDITADO: TBCDField
      FieldName = 'OP_IMPOSTO_CREDITADO'
      Origin = 'OP_IMPOSTO_CREDITADO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresESTOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresESTOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
  end
  object dspTotalizaValoresEST: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTotalizaVContabilE
    Left = 41
    Top = 1987
  end
  object cdsTotalizaValoresINTER: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalizaValoresINTER'
    Left = 176
    Top = 2033
    object cdsTotalizaValoresINTEROP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsTotalizaValoresINTEROP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsTotalizaValoresINTEROP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTEROP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTEROP_IMPOSTO_CREDITADO: TBCDField
      FieldName = 'OP_IMPOSTO_CREDITADO'
      Origin = 'OP_IMPOSTO_CREDITADO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTEROP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTEROP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
  end
  object dspTotalizaValoresINTER: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTotalizaVContabilE
    Left = 41
    Top = 2033
  end
  object cdsTotalizaVContabilS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalizaVContabilS'
    Left = 176
    Top = 2083
    object cdsTotalizaVContabilSOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsTotalizaVContabilSOP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsTotalizaVContabilSOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilSOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilSOP_IMPOSTO_DEBITADO: TBCDField
      FieldName = 'OP_IMPOSTO_DEBITADO'
      Origin = 'OP_IMPOSTO_DEBITADO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilSOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaVContabilSOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
  end
  object dspTotalizaVContabilS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTotalizaVContabilS
    Left = 41
    Top = 2083
  end
  object cdsTotalizaValoresEST_S: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalizaValoresEST_S'
    Left = 176
    Top = 2131
    object cdsTotalizaValoresEST_SOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsTotalizaValoresEST_SOP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsTotalizaValoresEST_SOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresEST_SOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresEST_SOP_IMPOSTO_DEBITADO: TBCDField
      FieldName = 'OP_IMPOSTO_DEBITADO'
      Origin = 'OP_IMPOSTO_DEBITADO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresEST_SOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresEST_SOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
  end
  object dspTotalizaValoresEST_S: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTotalizaVContabilS
    Left = 41
    Top = 2131
  end
  object cdsTotalizaValoresINTER_S: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalizaValoresINTER_S'
    Left = 176
    Top = 2179
    object cdsTotalizaValoresINTER_SOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsTotalizaValoresINTER_SOP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsTotalizaValoresINTER_SOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTER_SOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTER_SOP_IMPOSTO_DEBITADO: TBCDField
      FieldName = 'OP_IMPOSTO_DEBITADO'
      Origin = 'OP_IMPOSTO_DEBITADO'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTER_SOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsTotalizaValoresINTER_SOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
  end
  object dspTotalizaValoresINTER_S: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTotalizaVContabilS
    Left = 41
    Top = 2179
  end
  object dspSelProdExpBalanca: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelProdExpBalanca
    Left = 740
    Top = 693
  end
  object cdsSelProdExpBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelProdExpBalanca'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 885
    Top = 693
    object cdsSelProdExpBalancaOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Size = 14
    end
    object cdsSelProdExpBalancaOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsSelProdExpBalancaOP_PESADO: TIntegerField
      FieldName = 'OP_PESADO'
    end
    object cdsSelProdExpBalancaOP_QUANTIDADE: TIntegerField
      FieldName = 'OP_QUANTIDADE'
    end
    object cdsSelProdExpBalancaOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Size = 40
    end
    object cdsSelProdExpBalancaOP_INF_NUTRICIONAL: TIntegerField
      FieldName = 'OP_INF_NUTRICIONAL'
    end
    object cdsSelProdExpBalancaOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Size = 2
    end
    object cdsSelProdExpBalancaOP_PRECO_VENDA: TBCDField
      FieldName = 'OP_PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpBalancaOP_PROMOCAO: TIntegerField
      FieldName = 'OP_PROMOCAO'
    end
    object cdsSelProdExpBalancaOP_PRECO_PROMOCAO: TBCDField
      FieldName = 'OP_PRECO_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpBalancaOP_SETOR_BALANCA: TIntegerField
      FieldName = 'OP_SETOR_BALANCA'
    end
    object cdsSelProdExpBalancaOP_TECLA_ASSOCIADA: TIntegerField
      FieldName = 'OP_TECLA_ASSOCIADA'
    end
    object cdsSelProdExpBalancaOP_VALIDADE: TIntegerField
      FieldName = 'OP_VALIDADE'
    end
    object cdsSelProdExpBalancaOP_DESCRICAO_BALANCA: TStringField
      FieldName = 'OP_DESCRICAO_BALANCA'
      Size = 40
    end
    object cdsSelProdExpBalancaOP_ETIQUETA: TIntegerField
      FieldName = 'OP_ETIQUETA'
    end
    object cdsSelProdExpBalancaOP_INGREDIENTE_1: TStringField
      FieldName = 'OP_INGREDIENTE_1'
      Size = 50
    end
    object cdsSelProdExpBalancaOP_INGREDIENTE_2: TStringField
      FieldName = 'OP_INGREDIENTE_2'
      Size = 50
    end
    object cdsSelProdExpBalancaOP_INGREDIENTE_3: TStringField
      FieldName = 'OP_INGREDIENTE_3'
      Size = 50
    end
    object cdsSelProdExpBalancaOP_INGREDIENTE_4: TStringField
      FieldName = 'OP_INGREDIENTE_4'
      Size = 50
    end
    object cdsSelProdExpBalancaOP_INGREDIENTE_5: TStringField
      FieldName = 'OP_INGREDIENTE_5'
      Size = 50
    end
    object cdsSelProdExpBalancaOP_TECLADO: TIntegerField
      FieldName = 'OP_TECLADO'
    end
    object cdsSelProdExpBalancaOP_PRODUCAO: TIntegerField
      FieldName = 'OP_PRODUCAO'
    end
    object cdsSelProdExpBalancaOP_NOME_SETOR: TStringField
      FieldName = 'OP_NOME_SETOR'
      Size = 10
    end
  end
  object cdsSelSetorExpBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelSetorExpBalanca'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 885
    Top = 738
    object cdsSelSetorExpBalancaOP_SETOR: TIntegerField
      FieldName = 'OP_SETOR'
    end
    object cdsSelSetorExpBalancaOP_NOME: TStringField
      FieldName = 'OP_NOME'
      Size = 40
    end
    object cdsSelSetorExpBalancaOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsSelSetorExpBalancaOP_ETIQUETA: TIntegerField
      FieldName = 'OP_ETIQUETA'
    end
    object cdsSelSetorExpBalancaOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Size = 14
    end
    object cdsSelSetorExpBalancaOP_TECLA_ASSOCIADA: TIntegerField
      FieldName = 'OP_TECLA_ASSOCIADA'
    end
  end
  object dspSelSetorExpBalanca: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelSetorExpBalanca
    Left = 740
    Top = 738
  end
  object cdsSelReceitaExpBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelReceitaExpBalanca'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 885
    Top = 738
    object cdsSelReceitaExpBalancaOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsSelReceitaExpBalancaOP_PRODUCAO: TIntegerField
      FieldName = 'OP_PRODUCAO'
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_1: TStringField
      FieldName = 'OP_INGREDIENTE_1'
      Size = 50
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_2: TStringField
      FieldName = 'OP_INGREDIENTE_2'
      Size = 50
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_3: TStringField
      FieldName = 'OP_INGREDIENTE_3'
      Size = 50
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_4: TStringField
      FieldName = 'OP_INGREDIENTE_4'
      Size = 50
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_5: TStringField
      FieldName = 'OP_INGREDIENTE_5'
      Size = 50
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_6: TStringField
      FieldName = 'OP_INGREDIENTE_6'
      Size = 50
    end
    object cdsSelReceitaExpBalancaOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Size = 14
    end
    object cdsSelReceitaExpBalancaOP_NOME_SETOR: TStringField
      FieldName = 'OP_NOME_SETOR'
      Size = 40
    end
    object cdsSelReceitaExpBalancaOP_SETOR: TIntegerField
      FieldName = 'OP_SETOR'
    end
    object cdsSelReceitaExpBalancaOP_INGREDIENTE_7: TStringField
      FieldName = 'OP_INGREDIENTE_7'
      Size = 50
    end
  end
  object dspSelReceitaExpBalanca: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelReceitaExpBalanca
    Left = 740
    Top = 785
  end
  object cdsSelInfNutriExpBal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelInfNutriExpBal'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 885
    Top = 738
    object cdsSelInfNutriExpBalOP_INF_NUTRICIONAL: TIntegerField
      FieldName = 'OP_INF_NUTRICIONAL'
    end
    object cdsSelInfNutriExpBalOP_PORCAO: TStringField
      FieldName = 'OP_PORCAO'
      Size = 100
    end
    object cdsSelInfNutriExpBalOP_QUANTIDADE: TLargeintField
      FieldName = 'OP_QUANTIDADE'
    end
    object cdsSelInfNutriExpBalOP_UND_PORCAO: TStringField
      FieldName = 'OP_UND_PORCAO'
      Size = 2
    end
    object cdsSelInfNutriExpBalOP_PARTE_INT_MED_CAS: TBCDField
      FieldName = 'OP_PARTE_INT_MED_CAS'
      Precision = 18
      Size = 2
    end
    object cdsSelInfNutriExpBalOP_PARTE_DEC_MED_CAS: TStringField
      FieldName = 'OP_PARTE_DEC_MED_CAS'
      Size = 3
    end
    object cdsSelInfNutriExpBalOP_MEDIDA_CAS_UTIL: TStringField
      FieldName = 'OP_MEDIDA_CAS_UTIL'
      Size = 25
    end
    object cdsSelInfNutriExpBalOP_VALOR_CALORICO: TLargeintField
      FieldName = 'OP_VALOR_CALORICO'
    end
    object cdsSelInfNutriExpBalOP_VD_VALOR_CALORICO: TLargeintField
      FieldName = 'OP_VD_VALOR_CALORICO'
    end
    object cdsSelInfNutriExpBalOP_CARBOIDRATOS: TLargeintField
      FieldName = 'OP_CARBOIDRATOS'
    end
    object cdsSelInfNutriExpBalOP_MENOR_1G_CARBO: TSmallintField
      FieldName = 'OP_MENOR_1G_CARBO'
    end
    object cdsSelInfNutriExpBalOP_VD_CARBOIDRATOS: TLargeintField
      FieldName = 'OP_VD_CARBOIDRATOS'
    end
    object cdsSelInfNutriExpBalOP_PROTEINAS: TBCDField
      FieldName = 'OP_PROTEINAS'
      Precision = 18
      Size = 1
    end
    object cdsSelInfNutriExpBalOP_MENOR_1G_PROTEINA: TSmallintField
      FieldName = 'OP_MENOR_1G_PROTEINA'
    end
    object cdsSelInfNutriExpBalOP_VD_PROTEINAS: TLargeintField
      FieldName = 'OP_VD_PROTEINAS'
    end
    object cdsSelInfNutriExpBalOP_GORDURAS_TOT: TBCDField
      FieldName = 'OP_GORDURAS_TOT'
      Precision = 18
      Size = 1
    end
    object cdsSelInfNutriExpBalOP_VD_GORD_TOT: TLargeintField
      FieldName = 'OP_VD_GORD_TOT'
    end
    object cdsSelInfNutriExpBalOP_GORD_SATURADAS: TBCDField
      FieldName = 'OP_GORD_SATURADAS'
      Precision = 18
      Size = 1
    end
    object cdsSelInfNutriExpBalOP_VD_GORD_SATURADAS: TLargeintField
      FieldName = 'OP_VD_GORD_SATURADAS'
    end
    object cdsSelInfNutriExpBalOP_COLESTEROL: TLargeintField
      FieldName = 'OP_COLESTEROL'
    end
    object cdsSelInfNutriExpBalOP_MENOR_5G_COLESTEROL: TSmallintField
      FieldName = 'OP_MENOR_5G_COLESTEROL'
    end
    object cdsSelInfNutriExpBalOP_VD_COLESTEROL: TLargeintField
      FieldName = 'OP_VD_COLESTEROL'
    end
    object cdsSelInfNutriExpBalOP_FIBRA_ALIMENTAR: TBCDField
      FieldName = 'OP_FIBRA_ALIMENTAR'
      Precision = 18
      Size = 1
    end
    object cdsSelInfNutriExpBalOP_MENOR_1G_FIBRA: TSmallintField
      FieldName = 'OP_MENOR_1G_FIBRA'
    end
    object cdsSelInfNutriExpBalOP_VD_FIBRA_ALIMENTAR: TLargeintField
      FieldName = 'OP_VD_FIBRA_ALIMENTAR'
    end
    object cdsSelInfNutriExpBalOP_CALCIO: TLargeintField
      FieldName = 'OP_CALCIO'
    end
    object cdsSelInfNutriExpBalOP_QT_NAO_SIG_CALCIO: TSmallintField
      FieldName = 'OP_QT_NAO_SIG_CALCIO'
    end
    object cdsSelInfNutriExpBalOP_VD_CALCIO: TLargeintField
      FieldName = 'OP_VD_CALCIO'
    end
    object cdsSelInfNutriExpBalOP_FERRO: TBCDField
      FieldName = 'OP_FERRO'
      Precision = 18
      Size = 2
    end
    object cdsSelInfNutriExpBalOP_QT_NAO_SIG_FERRO: TSmallintField
      FieldName = 'OP_QT_NAO_SIG_FERRO'
    end
    object cdsSelInfNutriExpBalOP_VD_FERRO: TLargeintField
      FieldName = 'OP_VD_FERRO'
    end
    object cdsSelInfNutriExpBalOP_SODIO: TLargeintField
      FieldName = 'OP_SODIO'
    end
    object cdsSelInfNutriExpBalOP_VD_SODIO: TLargeintField
      FieldName = 'OP_VD_SODIO'
    end
    object cdsSelInfNutriExpBalOP_VALOR_ENERGETICO_KC: TLargeintField
      FieldName = 'OP_VALOR_ENERGETICO_KC'
    end
    object cdsSelInfNutriExpBalOP_VALOR_ENERGETICO_KJ: TLargeintField
      FieldName = 'OP_VALOR_ENERGETICO_KJ'
    end
    object cdsSelInfNutriExpBalOP_VD_ENERGETICO: TLargeintField
      FieldName = 'OP_VD_ENERGETICO'
    end
    object cdsSelInfNutriExpBalOP_GORDURAS_TRANS: TBCDField
      FieldName = 'OP_GORDURAS_TRANS'
      Precision = 18
      Size = 1
    end
  end
  object dspSelInfNutriExpBal: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelInfNutriExpBal
    Left = 740
    Top = 830
  end
  object cdsSelTecladoExpBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelTecladoExpBalanca'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 885
    Top = 738
    object cdsSelTecladoExpBalancaOP_SETOR: TIntegerField
      FieldName = 'OP_SETOR'
    end
    object cdsSelTecladoExpBalancaOP_TECLA: TIntegerField
      FieldName = 'OP_TECLA'
    end
    object cdsSelTecladoExpBalancaOP_TECLADO: TIntegerField
      FieldName = 'OP_TECLADO'
    end
    object cdsSelTecladoExpBalancaOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsSelTecladoExpBalancaOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Size = 40
    end
    object cdsSelTecladoExpBalancaOP_TEXTOBOTAO1: TStringField
      FieldName = 'OP_TEXTOBOTAO1'
      Size = 14
    end
    object cdsSelTecladoExpBalancaOP_TEXTOBOTAO2: TStringField
      FieldName = 'OP_TEXTOBOTAO2'
      Size = 14
    end
    object cdsSelTecladoExpBalancaOP_TEXTOBOTAO3: TStringField
      FieldName = 'OP_TEXTOBOTAO3'
      Size = 14
    end
    object cdsSelTecladoExpBalancaOP_TEXTOCONJUGADO1: TStringField
      FieldName = 'OP_TEXTOCONJUGADO1'
      Size = 14
    end
    object cdsSelTecladoExpBalancaOP_TEXTOCONJUGADO2: TStringField
      FieldName = 'OP_TEXTOCONJUGADO2'
      Size = 14
    end
    object cdsSelTecladoExpBalancaOP_TEXTOCONJUGADO3: TStringField
      FieldName = 'OP_TEXTOCONJUGADO3'
      Size = 14
    end
    object cdsSelTecladoExpBalancaOP_OPCAO: TSmallintField
      FieldName = 'OP_OPCAO'
    end
    object cdsSelTecladoExpBalancaOP_CAMINHOIMAGEM: TStringField
      FieldName = 'OP_CAMINHOIMAGEM'
      Size = 100
    end
    object cdsSelTecladoExpBalancaOP_OPCAOLOCAL: TSmallintField
      FieldName = 'OP_OPCAOLOCAL'
    end
    object cdsSelTecladoExpBalancaOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Size = 13
    end
  end
  object dspSelTecladoExpBalanca: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelTecladoExpBalanca
    Left = 740
    Top = 877
  end
  object cdsSelProdExpPdv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelProdExpPdv'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 1021
    Top = 506
    object cdsSelProdExpPdvOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Size = 14
    end
    object cdsSelProdExpPdvOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Size = 40
    end
    object cdsSelProdExpPdvOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Size = 3
    end
    object cdsSelProdExpPdvOP_DESCRICAO_CUPOM: TStringField
      FieldName = 'OP_DESCRICAO_CUPOM'
      Size = 40
    end
    object cdsSelProdExpPdvOP_CODIGO_ECF: TStringField
      FieldName = 'OP_CODIGO_ECF'
      Size = 10
    end
    object cdsSelProdExpPdvOP_PRECO_VENDA: TBCDField
      FieldName = 'OP_PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_SIMILAR: TIntegerField
      FieldName = 'OP_SIMILAR'
    end
    object cdsSelProdExpPdvOP_PROMOCAO: TSmallintField
      FieldName = 'OP_PROMOCAO'
    end
    object cdsSelProdExpPdvOP_PRECO_PROMOCAO: TBCDField
      FieldName = 'OP_PRECO_PROMOCAO'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ENVIAR_PARA_BALANCA: TSmallintField
      FieldName = 'OP_ENVIAR_PARA_BALANCA'
    end
    object cdsSelProdExpPdvOP_QUANTIDADE: TIntegerField
      FieldName = 'OP_QUANTIDADE'
    end
    object cdsSelProdExpPdvOP_PESADO: TIntegerField
      FieldName = 'OP_PESADO'
    end
    object cdsSelProdExpPdvOP_GERADO: TIntegerField
      FieldName = 'OP_GERADO'
    end
    object cdsSelProdExpPdvOP_DATA_REMARCACAO: TDateField
      FieldName = 'OP_DATA_REMARCACAO'
    end
    object cdsSelProdExpPdvOP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsSelProdExpPdvOP_SETOR_BALANCA: TIntegerField
      FieldName = 'OP_SETOR_BALANCA'
    end
    object cdsSelProdExpPdvOP_SALDO_ATUAL: TBCDField
      FieldName = 'OP_SALDO_ATUAL'
      Precision = 18
      Size = 3
    end
    object cdsSelProdExpPdvOP_CST: TStringField
      FieldName = 'OP_CST'
      Size = 3
    end
    object cdsSelProdExpPdvOP_GRUPO: TIntegerField
      FieldName = 'OP_GRUPO'
    end
    object cdsSelProdExpPdvOP_STATUS: TIntegerField
      FieldName = 'OP_STATUS'
    end
    object cdsSelProdExpPdvOP_FORNECEDOR: TIntegerField
      FieldName = 'OP_FORNECEDOR'
    end
    object cdsSelProdExpPdvOP_CUSTO_LIQUIDO: TBCDField
      FieldName = 'OP_CUSTO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_PRECO_ATACADO: TBCDField
      FieldName = 'OP_PRECO_ATACADO'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ATIVO: TSmallintField
      FieldName = 'OP_ATIVO'
    end
    object cdsSelProdExpPdvOP_DESCRICAO_ATACADO: TStringField
      FieldName = 'OP_DESCRICAO_ATACADO'
      Size = 40
    end
    object cdsSelProdExpPdvOP_PERMITE_VENDA_FRAC: TSmallintField
      FieldName = 'OP_PERMITE_VENDA_FRAC'
    end
    object cdsSelProdExpPdvOP_PERCENTUAL_ISS: TBCDField
      FieldName = 'OP_PERCENTUAL_ISS'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_PERCENTUAL_IOF: TBCDField
      FieldName = 'OP_PERCENTUAL_IOF'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_PERCENTUAL_CIDE: TBCDField
      FieldName = 'OP_PERCENTUAL_CIDE'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ALIQUOTA_PIS: TBCDField
      FieldName = 'OP_ALIQUOTA_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ALIQUOTA_COFINS: TBCDField
      FieldName = 'OP_ALIQUOTA_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ALIQUOTA_ICMS: TBCDField
      FieldName = 'OP_ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ALIQUOTA_IPI: TBCDField
      FieldName = 'OP_ALIQUOTA_IPI'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_NCM: TStringField
      FieldName = 'OP_NCM'
      Size = 10
    end
    object cdsSelProdExpPdvOP_ALIQ_MED_NAC: TBCDField
      FieldName = 'OP_ALIQ_MED_NAC'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ALIQ_MED_IMP: TBCDField
      FieldName = 'OP_ALIQ_MED_IMP'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_DESCONTO_PER: TSmallintField
      FieldName = 'OP_DESCONTO_PER'
    end
    object cdsSelProdExpPdvOP_EX_TIPI: TSmallintField
      FieldName = 'OP_EX_TIPI'
    end
    object cdsSelProdExpPdvOP_NAT_REC: TIntegerField
      FieldName = 'OP_NAT_REC'
    end
    object cdsSelProdExpPdvOP_TIPO_ITEM: TSmallintField
      FieldName = 'OP_TIPO_ITEM'
    end
    object cdsSelProdExpPdvOP_CHAVE: TStringField
      FieldName = 'OP_CHAVE'
      Size = 100
    end
    object cdsSelProdExpPdvOP_FONTE: TStringField
      FieldName = 'OP_FONTE'
      Size = 100
    end
    object cdsSelProdExpPdvOP_CARGA_NAC_FEDERAL: TBCDField
      FieldName = 'OP_CARGA_NAC_FEDERAL'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_CARGA_IMP_FEDERAL: TBCDField
      FieldName = 'OP_CARGA_IMP_FEDERAL'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_CARGA_ESTADUAL: TBCDField
      FieldName = 'OP_CARGA_ESTADUAL'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_CARGA_MUNICIPAL: TBCDField
      FieldName = 'OP_CARGA_MUNICIPAL'
      Precision = 18
      Size = 2
    end
    object cdsSelProdExpPdvOP_ORIGEM_MERCADORIA: TSmallintField
      FieldName = 'OP_ORIGEM_MERCADORIA'
    end
    object cdsSelProdExpPdvOP_CEST: TStringField
      FieldName = 'OP_CEST'
      Size = 15
    end
    object cdsSelProdExpPdvOP_COMPLEMENTO: TStringField
      FieldName = 'OP_COMPLEMENTO'
    end
    object cdsSelProdExpPdvOP_DESCRICAO_GRUPO: TStringField
      FieldName = 'OP_DESCRICAO_GRUPO'
      Size = 40
    end
    object cdsSelProdExpPdvOP_CODIGO_ANP: TStringField
      FieldName = 'OP_CODIGO_ANP'
      Size = 9
    end
    object cdsSelProdExpPdvOP_CST_PIS: TIntegerField
      FieldName = 'OP_CST_PIS'
    end
    object cdsSelProdExpPdvOP_CST_COFINS: TIntegerField
      FieldName = 'OP_CST_COFINS'
    end
  end
  object dspSelProdExpPdv: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelProdExpPdv
    Left = 740
    Top = 922
  end
  object cdsSelCliExportacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelCliExportacao'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 1021
    Top = 602
    object cdsSelCliExportacaoOP_BAIRRO: TStringField
      FieldName = 'OP_BAIRRO'
      Size = 30
    end
    object cdsSelCliExportacaoOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Size = 13
    end
    object cdsSelCliExportacaoOP_CLIENTE: TIntegerField
      FieldName = 'OP_CLIENTE'
    end
    object cdsSelCliExportacaoOP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
    end
    object cdsSelCliExportacaoOP_RAZAO_SOCIAL: TStringField
      FieldName = 'OP_RAZAO_SOCIAL'
      Size = 40
    end
    object cdsSelCliExportacaoOP_ENDERECO: TStringField
      FieldName = 'OP_ENDERECO'
      Size = 40
    end
    object cdsSelCliExportacaoOP_PONTO_REFERENCIA: TStringField
      FieldName = 'OP_PONTO_REFERENCIA'
      Size = 40
    end
    object cdsSelCliExportacaoOP_ESTADO: TStringField
      FieldName = 'OP_ESTADO'
      Size = 2
    end
    object cdsSelCliExportacaoOP_DDD: TStringField
      FieldName = 'OP_DDD'
      Size = 5
    end
    object cdsSelCliExportacaoOP_TELEFONE1: TStringField
      FieldName = 'OP_TELEFONE1'
      Size = 15
    end
    object cdsSelCliExportacaoOP_LIMITE_CREDITO: TBCDField
      FieldName = 'OP_LIMITE_CREDITO'
      Precision = 18
      Size = 2
    end
    object cdsSelCliExportacaoOP_SALDO_DEVEDOR: TBCDField
      FieldName = 'OP_SALDO_DEVEDOR'
      Precision = 18
      Size = 2
    end
    object cdsSelCliExportacaoOP_STATUS: TIntegerField
      FieldName = 'OP_STATUS'
    end
    object cdsSelCliExportacaoOP_NOME_CIDADE: TStringField
      FieldName = 'OP_NOME_CIDADE'
      Size = 40
    end
    object cdsSelCliExportacaoOP_NUMERO: TIntegerField
      FieldName = 'OP_NUMERO'
    end
    object cdsSelCliExportacaoOP_CEP: TStringField
      FieldName = 'OP_CEP'
      Size = 9
    end
    object cdsSelCliExportacaoOP_INSCRICAO: TStringField
      FieldName = 'OP_INSCRICAO'
    end
    object cdsSelCliExportacaoOP_NASCIMENTO: TDateField
      FieldName = 'OP_NASCIMENTO'
    end
    object cdsSelCliExportacaoOP_ULTIMA_COMPRA: TDateField
      FieldName = 'OP_ULTIMA_COMPRA'
    end
    object cdsSelCliExportacaoOP_VALOR_ULTIMO_PEDIDO: TBCDField
      FieldName = 'OP_VALOR_ULTIMO_PEDIDO'
      Precision = 18
      Size = 2
    end
    object cdsSelCliExportacaoOP_FANTASIA: TStringField
      FieldName = 'OP_FANTASIA'
      Size = 30
    end
    object cdsSelCliExportacaoOP_CADASTRO: TDateField
      FieldName = 'OP_CADASTRO'
    end
    object cdsSelCliExportacaoOP_TIPO: TSmallintField
      FieldName = 'OP_TIPO'
    end
    object cdsSelCliExportacaoOP_ENDERECO_COBRANCA: TStringField
      FieldName = 'OP_ENDERECO_COBRANCA'
      Size = 45
    end
    object cdsSelCliExportacaoOP_BAIRRO_COBRANCA: TStringField
      FieldName = 'OP_BAIRRO_COBRANCA'
      Size = 30
    end
    object cdsSelCliExportacaoOP_CEP_COBRANCA: TStringField
      FieldName = 'OP_CEP_COBRANCA'
      Size = 9
    end
    object cdsSelCliExportacaoOP_ESTADO_COBRANCA: TStringField
      FieldName = 'OP_ESTADO_COBRANCA'
      Size = 2
    end
    object cdsSelCliExportacaoOP_CIDADE_COBRANCA: TStringField
      FieldName = 'OP_CIDADE_COBRANCA'
      Size = 40
    end
    object cdsSelCliExportacaoOP_CONTATO: TStringField
      FieldName = 'OP_CONTATO'
      Size = 30
    end
    object cdsSelCliExportacaoOP_EMAIL: TStringField
      FieldName = 'OP_EMAIL'
      Size = 200
    end
    object cdsSelCliExportacaoOP_SEXO: TSmallintField
      FieldName = 'OP_SEXO'
    end
    object cdsSelCliExportacaoOP_RENDA: TBCDField
      FieldName = 'OP_RENDA'
      Precision = 18
      Size = 2
    end
    object cdsSelCliExportacaoOP_ESTADO_CIVIL: TSmallintField
      FieldName = 'OP_ESTADO_CIVIL'
    end
    object cdsSelCliExportacaoOP_NUMERO_COBR: TIntegerField
      FieldName = 'OP_NUMERO_COBR'
    end
    object cdsSelCliExportacaoOP_COMPLEMENTO: TStringField
      FieldName = 'OP_COMPLEMENTO'
      Size = 50
    end
    object cdsSelCliExportacaoOP_COD_MUNICIPIO: TIntegerField
      FieldName = 'OP_COD_MUNICIPIO'
    end
    object cdsSelCliExportacaoOP_ATIVO: TSmallintField
      FieldName = 'OP_ATIVO'
    end
  end
  object dspSelCliExportacao: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelCliExportacao
    Left = 740
    Top = 967
  end
  object cdsSelPrecoQtdExp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelPrecoQtdExp'
    OnNewRecord = cdsConfig_financeiroNewRecord
    Left = 1021
    Top = 554
    object cdsSelPrecoQtdExpOP_BARRAS: TStringField
      FieldName = 'OP_BARRAS'
      Origin = 'OP_BARRAS'
      Size = 17
    end
    object cdsSelPrecoQtdExpOP_QUANTIDADE: TBCDField
      FieldName = 'OP_QUANTIDADE'
      Origin = 'OP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsSelPrecoQtdExpOP_PRECO_UNITARIO: TBCDField
      FieldName = 'OP_PRECO_UNITARIO'
      Origin = 'OP_PRECO_UNITARIO'
      Precision = 18
      Size = 2
    end
    object cdsSelPrecoQtdExpOP_PERCENTUAL_DESCONTO: TCurrencyField
      FieldName = 'OP_PERCENTUAL_DESCONTO'
      Origin = 'OP_PERCENTUAL_DESCONTO'
    end
  end
  object dspSelPrecoQtdExp: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelPrecoQtdExp
    Constraints = False
    Left = 740
    Top = 1011
  end
  object fdmImpCupom: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 5
    object fdmImpCupomSERIE_ECF: TStringField
      FieldName = 'SERIE_ECF'
    end
    object fdmImpCupomNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object fdmImpCupomEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object fdmImpCupomHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
    end
    object fdmImpCupomVALOR_UNITARIO: TCurrencyField
      FieldName = 'VALOR_UNITARIO'
    end
    object fdmImpCupomQUANTIDADE: TCurrencyField
      FieldName = 'QUANTIDADE'
    end
    object fdmImpCupomSUB_TOTAL: TCurrencyField
      FieldName = 'SUB_TOTAL'
    end
    object fdmImpCupomVALOR_DESCONTO: TCurrencyField
      FieldName = 'VALOR_DESCONTO'
    end
    object fdmImpCupomVALOR_ACRESCIMO: TCurrencyField
      FieldName = 'VALOR_ACRESCIMO'
    end
    object fdmImpCupomNUMERO_CAIXA: TIntegerField
      FieldName = 'NUMERO_CAIXA'
    end
    object fdmImpCupomNUMERO_ITEM: TIntegerField
      FieldName = 'NUMERO_ITEM'
    end
    object fdmImpCupomSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object fdmImpCupomQUANTIDADE_CANCELADA: TCurrencyField
      FieldName = 'QUANTIDADE_CANCELADA'
    end
    object fdmImpCupomVALOR_CANCELADO: TCurrencyField
      FieldName = 'VALOR_CANCELADO'
    end
    object fdmImpCupomCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object fdmImpCupomBARRAS: TStringField
      FieldName = 'BARRAS'
      Size = 17
    end
    object fdmImpCupomTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
    end
    object fdmImpCupomALIQUOTA_ICMS: TStringField
      FieldName = 'ALIQUOTA_ICMS'
      Size = 4
    end
  end
  object fdmFinalizadoras: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 51
    object fdmFinalizadorasCOD_FINALIZADORA: TStringField
      FieldName = 'COD_FINALIZADORA'
      Size = 5
    end
    object fdmFinalizadorasVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object fdmFinalizadorasCODIGO_PEDIDO: TIntegerField
      FieldName = 'CODIGO_PEDIDO'
    end
  end
  object fdmImpCheque: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 97
    object fdmImpChequeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object fdmImpChequeDATA: TDateField
      FieldName = 'DATA'
    end
    object fdmImpChequeBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object fdmImpChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 15
    end
    object fdmImpChequeCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object fdmImpChequeCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Size = 15
    end
    object fdmImpChequeEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object fdmImpChequeVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object fdmImpChequeCUPOM: TIntegerField
      FieldName = 'CUPOM'
    end
    object fdmImpChequeVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object fdmImpChequePL_CONTAS: TIntegerField
      FieldName = 'PL_CONTAS'
    end
    object fdmImpChequeITEM_PL_CONTAS: TIntegerField
      FieldName = 'ITEM_PL_CONTAS'
    end
    object fdmImpChequeLANCAMENTO: TIntegerField
      FieldName = 'LANCAMENTO'
    end
  end
  object fdmImpReg60M: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 143
    object fdmImpReg60MTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object fdmImpReg60MSUBTIPO: TStringField
      FieldName = 'SUBTIPO'
      Size = 1
    end
    object fdmImpReg60MDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object fdmImpReg60MSERIE_ECF: TStringField
      FieldName = 'SERIE_ECF'
    end
    object fdmImpReg60MNUMERO_CAIXA: TIntegerField
      FieldName = 'NUMERO_CAIXA'
    end
    object fdmImpReg60MCOO_INICIAL: TIntegerField
      FieldName = 'COO_INICIAL'
    end
    object fdmImpReg60MCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
    end
    object fdmImpReg60MCRZ: TIntegerField
      FieldName = 'CRZ'
    end
    object fdmImpReg60MCRO: TIntegerField
      FieldName = 'CRO'
    end
    object fdmImpReg60MVENDA_BRUTA: TCurrencyField
      FieldName = 'VENDA_BRUTA'
    end
    object fdmImpReg60MVALOR_GT: TCurrencyField
      FieldName = 'VALOR_GT'
    end
    object fdmImpReg60MMODELO_DOCUMENTO: TStringField
      FieldName = 'MODELO_DOCUMENTO'
      Size = 2
    end
  end
  object fdmImpReg60A: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 189
    object fdmImpReg60ATIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object fdmImpReg60ASUBTIPO: TStringField
      FieldName = 'SUBTIPO'
      Size = 1
    end
    object fdmImpReg60ADATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object fdmImpReg60AALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      Size = 4
    end
    object fdmImpReg60AVALOR_ALIQUOTA: TCurrencyField
      FieldName = 'VALOR_ALIQUOTA'
    end
    object fdmImpReg60ASERIE_ECF: TStringField
      FieldName = 'SERIE_ECF'
    end
    object fdmImpReg60ACRZ: TIntegerField
      FieldName = 'CRZ'
    end
    object fdmImpReg60ANUMERO_CAIXA: TIntegerField
      FieldName = 'NUMERO_CAIXA'
    end
    object fdmImpReg60AGT: TCurrencyField
      FieldName = 'GT'
    end
    object fdmImpReg60APOSICAO_ALIQUOTA: TStringField
      FieldName = 'POSICAO_ALIQUOTA'
      Size = 2
    end
  end
  object fdmPedidoZeus: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 236
    object fdmPedidoZeusNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object fdmPedidoZeusSTATUS_PEDIDO: TSmallintField
      FieldName = 'STATUS_PEDIDO'
    end
  end
  object fdmFinalizadoraPedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 284
    object fdmFinalizadoraPedidoCOD_FINALIZADORA: TStringField
      FieldName = 'COD_FINALIZADORA'
      Size = 4
    end
    object fdmFinalizadoraPedidoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object fdmFinalizadoraPedidoCODIGO_PEDIDO: TIntegerField
      FieldName = 'CODIGO_PEDIDO'
    end
  end
  object fdmImpFinanceiro: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1056
    Top = 332
    object fdmImpFinanceiroIP_CRE: TIntegerField
      FieldName = 'IP_CRE'
    end
    object fdmImpFinanceiroIP_FILIAL: TIntegerField
      FieldName = 'IP_FILIAL'
    end
    object fdmImpFinanceiroIP_DOCUMENTO: TStringField
      FieldName = 'IP_DOCUMENTO'
      Size = 10
    end
    object fdmImpFinanceiroIP_SITUACAO: TSmallintField
      FieldName = 'IP_SITUACAO'
    end
    object fdmImpFinanceiroIP_DATA_ENTRADA: TDateField
      FieldName = 'IP_DATA_ENTRADA'
    end
    object fdmImpFinanceiroIP_SACADO: TIntegerField
      FieldName = 'IP_SACADO'
    end
    object fdmImpFinanceiroIP_TIPO: TSmallintField
      FieldName = 'IP_TIPO'
    end
    object fdmImpFinanceiroIP_DATA_EMISSAO: TDateField
      FieldName = 'IP_DATA_EMISSAO'
    end
    object fdmImpFinanceiroIP_DATA_VENCIMENTO: TDateField
      FieldName = 'IP_DATA_VENCIMENTO'
    end
    object fdmImpFinanceiroIP_MOEDA: TCurrencyField
      FieldName = 'IP_MOEDA'
    end
    object fdmImpFinanceiroIP_MORA_DIARIA: TCurrencyField
      FieldName = 'IP_MORA_DIARIA'
    end
    object fdmImpFinanceiroIP_DESCONTO: TCurrencyField
      FieldName = 'IP_DESCONTO'
    end
    object fdmImpFinanceiroIP_DATA_DESCONTO: TDateField
      FieldName = 'IP_DATA_DESCONTO'
    end
    object fdmImpFinanceiroIP_HISTORICO: TStringField
      FieldName = 'IP_HISTORICO'
      Size = 80
    end
    object fdmImpFinanceiroIP_NOSSO_NUMERO: TStringField
      FieldName = 'IP_NOSSO_NUMERO'
    end
    object fdmImpFinanceiroIP_VENCIMENTO_PRORROGADO: TDateField
      FieldName = 'IP_VENCIMENTO_PRORROGADO'
    end
    object fdmImpFinanceiroIP_POSICAO: TSmallintField
      FieldName = 'IP_POSICAO'
    end
    object fdmImpFinanceiroIP_DATA_ENTRADA_NO_BANCO: TDateField
      FieldName = 'IP_DATA_ENTRADA_NO_BANCO'
    end
    object fdmImpFinanceiroIP_DATA_BAIXA: TDateField
      FieldName = 'IP_DATA_B AIXA'
    end
    object fdmImpFinanceiroIP_DESCONTO_CONCEDIDO: TCurrencyField
      FieldName = 'IP_DESCONTO_CONCEDIDO'
    end
    object fdmImpFinanceiroIP_ABATIMENTOS: TCurrencyField
      FieldName = 'IP_ABATIMENTOS'
    end
    object fdmImpFinanceiroIP_OUTRAS_DESPESAS: TCurrencyField
      FieldName = 'IP_OUTRAS_DESPESAS'
    end
    object fdmImpFinanceiroIP_VALOR_PAGO: TCurrencyField
      FieldName = 'IP_VALOR_PAGO'
    end
    object fdmImpFinanceiroIP_TARIFAS_BANCARIAS: TCurrencyField
      FieldName = 'IP_TARIFAS_BANCARIAS'
    end
    object fdmImpFinanceiroIP_JUROS_RECEBIDOS: TCurrencyField
      FieldName = 'IP_JUROS_RECEBIDOS'
    end
    object fdmImpFinanceiroIP_OUTROS_CREDITOS: TCurrencyField
      FieldName = 'IP_OUTROS_CREDITOS'
    end
    object fdmImpFinanceiroIP_PLANO_CONTAS: TIntegerField
      FieldName = 'IP_PLANO_CONTAS'
    end
    object fdmImpFinanceiroIP_SUB_CONTA: TIntegerField
      FieldName = 'IP_SUB_CONTA'
    end
    object fdmImpFinanceiroIP_TIPO_AVISO: TSmallintField
      FieldName = 'IP_TIPO_AVISO'
    end
    object fdmImpFinanceiroIP_OCORRENCIA: TStringField
      FieldName = 'IP_OCORRENCIA'
      Size = 2
    end
    object fdmImpFinanceiroIP_AVISO_COBRANCA: TStringField
      FieldName = 'IP_AVISO_COBRANCA'
      Size = 2
    end
    object fdmImpFinanceiroIP_LANCAMENTO: TIntegerField
      FieldName = 'IP_LANCAMENTO'
    end
    object fdmImpFinanceiroIP_TIPO_COBRANCA: TSmallintField
      FieldName = 'IP_TIPO_COBRANCA'
    end
    object fdmImpFinanceiroIP_CONTA_CORRENTE: TStringField
      FieldName = 'IP_CONTA_CORRENTE'
      Size = 15
    end
    object fdmImpFinanceiroIP_CARTEIRA: TStringField
      FieldName = 'IP_CARTEIRA'
      Size = 10
    end
    object fdmImpFinanceiroIP_TIPO_PARCELA: TSmallintField
      FieldName = 'IP_TIPO_PARCELA'
    end
    object fdmImpFinanceiroIP_PEDIDO_DE_VENDA: TStringField
      FieldName = 'IP_PEDIDO_DE_VENDA'
      Size = 10
    end
    object fdmImpFinanceiroIP_DATA: TDateField
      FieldName = 'IP_DATA'
    end
    object fdmImpFinanceiroIP_PERCENTUAL: TCurrencyField
      FieldName = 'IP_PERCENTUAL'
    end
    object fdmImpFinanceiroIP_REDUCAO: TCurrencyField
      FieldName = 'IP_REDUCAO'
    end
    object fdmImpFinanceiroIP_VALOR_COMISSAO: TCurrencyField
      FieldName = 'IP_VALOR_COMISSAO'
    end
    object fdmImpFinanceiroIP_NF_SAIDA: TIntegerField
      FieldName = 'IP_NF_SAIDA'
    end
    object fdmImpFinanceiroIP_OBSERVACOES: TStringField
      FieldName = 'IP_OBSERVACOES'
      Size = 20000
    end
    object fdmImpFinanceiroIP_VALOR_CHQ_DEVOLVIDO: TCurrencyField
      FieldName = 'IP_VALOR_CHQ_DEVOLVIDO'
    end
    object fdmImpFinanceiroIP_SEQUENCIAL: TIntegerField
      FieldName = 'IP_SEQUENCIAL'
    end
    object fdmImpFinanceiroIP_OUTROS_DEBITOS: TCurrencyField
      FieldName = 'IP_OUTROS_DEBITOS'
    end
    object fdmImpFinanceiroIP_MODELO_DOCUMENTO: TStringField
      FieldName = 'IP_MODELO_DOCUMENTO'
      Size = 2
    end
    object fdmImpFinanceiroIP_PEDIDO_EXTERNO: TStringField
      FieldName = 'IP_PEDIDO_EXTERNO'
      Size = 10
    end
    object fdmImpFinanceiroIP_TIPO_OCORRENCIA: TSmallintField
      FieldName = 'IP_TIPO_OCORRENCIA'
    end
    object fdmImpFinanceiroIP_VALOR: TCurrencyField
      FieldName = 'IP_VALOR'
    end
  end
  object dspRegistro60_Mestre: TDataSetProvider
    DataSet = dmDBEXMaster.fdqRegistro60_Mestre
    Left = 289
    Top = 1944
  end
  object cdsRegistro60_Mestre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro60_Mestre'
    Left = 402
    Top = 1944
    object cdsRegistro60_MestreREGISTRO60MESTRE: TIntegerField
      FieldName = 'REGISTRO60MESTRE'
      Required = True
    end
    object cdsRegistro60_MestreNUMERODESERIEEQUIPAMENTO: TStringField
      FieldName = 'NUMERODESERIEEQUIPAMENTO'
      Required = True
    end
    object cdsRegistro60_MestreEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
    end
    object cdsRegistro60_MestreNUMEROECF: TSmallintField
      FieldName = 'NUMEROECF'
      Required = True
    end
    object cdsRegistro60_MestreCOOINICIAL: TIntegerField
      FieldName = 'COOINICIAL'
      Required = True
    end
    object cdsRegistro60_MestreCOOFINAL: TIntegerField
      FieldName = 'COOFINAL'
      Required = True
    end
    object cdsRegistro60_MestreCONTADORREDUCAOZ: TSmallintField
      FieldName = 'CONTADORREDUCAOZ'
      Required = True
    end
    object cdsRegistro60_MestreVENDABRUTA: TBCDField
      FieldName = 'VENDABRUTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsRegistro60_MestreGTFINAL: TBCDField
      FieldName = 'GTFINAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsRegistro60_MestreCRO: TIntegerField
      FieldName = 'CRO'
      Required = True
    end
    object cdsRegistro60_MestreMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      Size = 2
    end
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 1056
    Top = 384
  end
  object dspCST_PIS_ENT: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCST_PIS_ENT
    Constraints = False
    Left = 740
    Top = 1055
  end
  object cdsCST_PIS_ENT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCST_PIS_ENT'
    Left = 981
    Top = 834
    object cdsCST_PIS_ENTCST_PIS_PASEP: TIntegerField
      FieldName = 'CST_PIS_PASEP'
      Required = True
      DisplayFormat = '00'
    end
    object cdsCST_PIS_ENTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCST_PIS_ENTENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsCST_PIS_ENTGERA_CREDITO: TSmallintField
      FieldName = 'GERA_CREDITO'
      Required = True
    end
  end
  object dspCST_PIS_SAI: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCST_PIS_SAI
    Constraints = False
    Left = 740
    Top = 1100
  end
  object cdsCST_PIS_SAI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCST_PIS_SAI'
    Left = 1013
    Top = 690
    object cdsCST_PIS_SAICST_PIS_PASEP: TIntegerField
      FieldName = 'CST_PIS_PASEP'
      Required = True
      DisplayFormat = '00'
    end
    object cdsCST_PIS_SAIDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCST_PIS_SAIENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsCST_PIS_SAIGERA_CREDITO: TSmallintField
      FieldName = 'GERA_CREDITO'
      Required = True
    end
  end
  object dspCST_COFINS_ENT: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCST_COFINS_ENT
    Constraints = False
    Left = 740
    Top = 1146
  end
  object cdsCST_COFINS_ENT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCST_COFINS_ENT'
    Left = 1013
    Top = 770
    object cdsCST_COFINS_ENTCST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Required = True
      DisplayFormat = '00'
    end
    object cdsCST_COFINS_ENTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCST_COFINS_ENTENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsCST_COFINS_ENTGERA_CREDITO: TSmallintField
      FieldName = 'GERA_CREDITO'
      Required = True
    end
  end
  object dspCST_COFINS_SAI: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCST_COFINS_SAI
    Constraints = False
    Left = 740
    Top = 1191
  end
  object cdsCST_COFINS_SAI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCST_COFINS_SAI'
    Left = 893
    Top = 818
    object cdsCST_COFINS_SAICST_COFINS: TIntegerField
      FieldName = 'CST_COFINS'
      Required = True
      DisplayFormat = '00'
    end
    object cdsCST_COFINS_SAIDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCST_COFINS_SAIENTRADA_SAIDA: TSmallintField
      FieldName = 'ENTRADA_SAIDA'
      Required = True
    end
    object cdsCST_COFINS_SAIGERA_CREDITO: TSmallintField
      FieldName = 'GERA_CREDITO'
      Required = True
    end
  end
  object dspCtrlNotas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCtrlNotas
    Left = 505
    Top = 1944
  end
  object cdsCtrlNotas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CTRL_NOTAS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA_ENTRADA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'FILIAL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FORNECEDOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_DOCUMENTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR_NOTA'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'VALOR_ICMS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'VALOR_DEVOLUCAO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'VALOR_BRINDE'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'VALOR_REMESSA'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'VALOR_IMOBILIZADO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'TIPO_UTILIDADE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_TIPO_UTILIDADE'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SETOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_SETOR'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'TIPO_LANCAMENTO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'USUARIO_DUPLICADOR'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspCtrlNotas'
    StoreDefs = True
    OnCalcFields = cdsCtrlNotasCalcFields
    OnNewRecord = cdsCtrlNotasNewRecord
    Left = 640
    Top = 1944
    object cdsCtrlNotasCTRL_NOTAS: TIntegerField
      FieldName = 'CTRL_NOTAS'
      Required = True
    end
    object cdsCtrlNotasDATA_ENTRADA: TDateField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATA_ENTRADA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object cdsCtrlNotasFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsCtrlNotasFORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo FornecedorR'
      FieldName = 'FORNECEDOR'
      Required = True
    end
    object cdsCtrlNotasNUMERO_DOCUMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'NUMERO_DOCUMENTO'
      Required = True
    end
    object cdsCtrlNotasVALOR_NOTA: TBCDField
      FieldName = 'VALOR_NOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlNotasVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlNotasVALOR_DEVOLUCAO: TBCDField
      FieldName = 'VALOR_DEVOLUCAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlNotasVALOR_BRINDE: TBCDField
      FieldName = 'VALOR_BRINDE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlNotasVALOR_REMESSA: TBCDField
      FieldName = 'VALOR_REMESSA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlNotasVALOR_IMOBILIZADO: TBCDField
      FieldName = 'VALOR_IMOBILIZADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCtrlNotasTIPO_UTILIDADE: TIntegerField
      FieldName = 'TIPO_UTILIDADE'
      Required = True
    end
    object cdsCtrlNotasDESCRICAO_TIPO_UTILIDADE: TStringField
      FieldName = 'DESCRICAO_TIPO_UTILIDADE'
      Size = 200
    end
    object cdsCtrlNotasSETOR: TIntegerField
      FieldName = 'SETOR'
      Required = True
    end
    object cdsCtrlNotasDESCRICAO_SETOR: TStringField
      FieldName = 'DESCRICAO_SETOR'
      Size = 200
    end
    object cdsCtrlNotasOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsCtrlNotasTIPO_LANCAMENTO: TSmallintField
      FieldName = 'TIPO_LANCAMENTO'
      Required = True
    end
    object cdsCtrlNotasUSUARIO_DUPLICADOR: TStringField
      FieldName = 'USUARIO_DUPLICADOR'
      Size = 10
    end
    object cdsCtrlNotasS_TIPO_LANCAMENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_TIPO_LANCAMENTO'
      Size = 40
      Calculated = True
    end
    object cdsCtrlNotasRAZAO_SOCIAL: TStringField
      FieldKind = fkLookup
      FieldName = 'RAZAO_SOCIAL'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'FORNECEDOR'
      Size = 40
      Lookup = True
    end
  end
  object dspTipoUtilCtrlNotas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTipoUtilCtrlNotas
    Left = 289
    Top = 1987
  end
  object cdsTipoUtilCtrlNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoUtilCtrlNotas'
    OnNewRecord = cdsTipoUtilCtrlNotasNewRecord
    Left = 402
    Top = 1987
    object cdsTipoUtilCtrlNotasTIPO_UTIL_CTRL_NOTAS: TIntegerField
      FieldName = 'TIPO_UTIL_CTRL_NOTAS'
      Required = True
    end
    object cdsTipoUtilCtrlNotasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object cdsSetorCtrlNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetorCtrlNotas'
    Left = 402
    Top = 2033
    object cdsSetorCtrlNotasSETOR_CTRL_NOTAS: TIntegerField
      FieldName = 'SETOR_CTRL_NOTAS'
      Required = True
    end
    object cdsSetorCtrlNotasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object dspSetorCtrlNotas: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSetorCtrlNotas
    Left = 289
    Top = 2033
  end
  object cdsReferenciaFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReferenciaFornecedor'
    OnNewRecord = cdsReferenciaFornecedorNewRecord
    Left = 425
    Top = 2083
    object cdsReferenciaFornecedorREFERENCIAFORNECEDOR: TIntegerField
      FieldName = 'REFERENCIAFORNECEDOR'
      Required = True
    end
    object cdsReferenciaFornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Required = True
    end
    object cdsReferenciaFornecedorREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      Size = 40
    end
    object cdsReferenciaFornecedorPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsReferenciaFornecedorNOME_FORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_FORNECEDOR'
      LookupDataSet = cdsFornecedor
      LookupKeyFields = 'FORNECEDOR'
      LookupResultField = 'RAZAOSOCIAL'
      KeyFields = 'FORNECEDOR'
      Size = 60
      Lookup = True
    end
    object cdsReferenciaFornecedorNOME_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_PRODUTO'
      LookupDataSet = cdsProdutos
      LookupKeyFields = 'PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 100
      Lookup = True
    end
  end
  object dspReferenciaFornecedor: TDataSetProvider
    DataSet = dmDBEXMaster.fdqReferenciaFornecedor
    Left = 289
    Top = 2083
  end
  object dspCtrlModulos: TDataSetProvider
    DataSet = dmDBEXMaster.fdqCtrlModulos
    Left = 290
    Top = 2131
  end
  object cdsCtrlModulos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrlModulos'
    OnNewRecord = cdsReferenciaFornecedorNewRecord
    Left = 426
    Top = 2131
    object cdsCtrlModulosCTRL_MODULOS: TIntegerField
      FieldName = 'CTRL_MODULOS'
      Required = True
    end
    object cdsCtrlModulosNOME_MODULO: TStringField
      FieldName = 'NOME_MODULO'
      Required = True
      Size = 250
    end
  end
  object dspParamIntegraPDV: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParamIntegraPDV
    Left = 505
    Top = 1990
  end
  object cdsParamIntegraPDV: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MODELO_PDV'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_INTEGRACAO_EXPORTACAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_INTEGRACAO_IMPORTACAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ARREDONDA_TRUNCA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PASTA_EXPORTACAO'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'PASTA_IMPORTACAO'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'ARQUIVO_PRODUTOS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_COD_BARRAS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_MONTAGEM_KIT'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_CLIENTES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_AUTORIZADOS_CLIENTE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_LISTA_NEGRA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_VENDEDOR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_COFINS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_COFINS_ST'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_ICMS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_IMPOSTO_IMPORTACAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_IPI'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_ISSQN'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_PIS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_PIS_ST'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_TRANSPORTADORAS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_FORMA_PAGAMENTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_PLANO_PAGAMENTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_ADMINISTRADORAS_CARTAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_PERGUNTAS_LISTA_VEZ'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_MOTIVO_CANCELAMENTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_MOTIVO_DESCONTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_MOTIVO_DEVOLUCAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_OPERADORES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_NCM'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_PRE_VENDA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_RESPOSTA_PRE_VENDA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_KARDEX'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_ATUALIZACAO_PRECO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_CEST'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_ANP'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ARQUIVO_TRANSPORTADORA_VEICULOS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIPO_CODIGO_INTEGRACAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspParamIntegraPDV'
    StoreDefs = True
    OnNewRecord = cdsParamIntegraPDVNewRecord
    Left = 640
    Top = 1990
    object cdsParamIntegraPDVMODELO_PDV: TSmallintField
      FieldName = 'MODELO_PDV'
      Required = True
    end
    object cdsParamIntegraPDVTIPO_INTEGRACAO_EXPORTACAO: TSmallintField
      FieldName = 'TIPO_INTEGRACAO_EXPORTACAO'
      Required = True
    end
    object cdsParamIntegraPDVTIPO_INTEGRACAO_IMPORTACAO: TSmallintField
      FieldName = 'TIPO_INTEGRACAO_IMPORTACAO'
      Required = True
    end
    object cdsParamIntegraPDVARREDONDA_TRUNCA: TSmallintField
      FieldName = 'ARREDONDA_TRUNCA'
      Required = True
    end
    object cdsParamIntegraPDVPASTA_EXPORTACAO: TStringField
      FieldName = 'PASTA_EXPORTACAO'
      Size = 1024
    end
    object cdsParamIntegraPDVPASTA_IMPORTACAO: TStringField
      FieldName = 'PASTA_IMPORTACAO'
      Size = 1024
    end
    object cdsParamIntegraPDVARQUIVO_PRODUTOS: TStringField
      FieldName = 'ARQUIVO_PRODUTOS'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_COD_BARRAS: TStringField
      FieldName = 'ARQUIVO_COD_BARRAS'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_MONTAGEM_KIT: TStringField
      FieldName = 'ARQUIVO_MONTAGEM_KIT'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_CLIENTES: TStringField
      FieldName = 'ARQUIVO_CLIENTES'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_AUTORIZADOS_CLIENTE: TStringField
      FieldName = 'ARQUIVO_AUTORIZADOS_CLIENTE'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_LISTA_NEGRA: TStringField
      FieldName = 'ARQUIVO_LISTA_NEGRA'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_VENDEDOR: TStringField
      FieldName = 'ARQUIVO_VENDEDOR'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_COFINS: TStringField
      FieldName = 'ARQUIVO_COFINS'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_COFINS_ST: TStringField
      FieldName = 'ARQUIVO_COFINS_ST'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_ICMS: TStringField
      FieldName = 'ARQUIVO_ICMS'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_IMPOSTO_IMPORTACAO: TStringField
      FieldName = 'ARQUIVO_IMPOSTO_IMPORTACAO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_IPI: TStringField
      FieldName = 'ARQUIVO_IPI'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_ISSQN: TStringField
      FieldName = 'ARQUIVO_ISSQN'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_PIS: TStringField
      FieldName = 'ARQUIVO_PIS'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_PIS_ST: TStringField
      FieldName = 'ARQUIVO_PIS_ST'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_TRANSPORTADORAS: TStringField
      FieldName = 'ARQUIVO_TRANSPORTADORAS'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_FORMA_PAGAMENTO: TStringField
      FieldName = 'ARQUIVO_FORMA_PAGAMENTO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_PLANO_PAGAMENTO: TStringField
      FieldName = 'ARQUIVO_PLANO_PAGAMENTO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_ADMINISTRADORAS_CARTAO: TStringField
      FieldName = 'ARQUIVO_ADMINISTRADORAS_CARTAO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_PERGUNTAS_LISTA_VEZ: TStringField
      FieldName = 'ARQUIVO_PERGUNTAS_LISTA_VEZ'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_MOTIVO_CANCELAMENTO: TStringField
      FieldName = 'ARQUIVO_MOTIVO_CANCELAMENTO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_MOTIVO_DESCONTO: TStringField
      FieldName = 'ARQUIVO_MOTIVO_DESCONTO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_MOTIVO_DEVOLUCAO: TStringField
      FieldName = 'ARQUIVO_MOTIVO_DEVOLUCAO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_OPERADORES: TStringField
      FieldName = 'ARQUIVO_OPERADORES'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_NCM: TStringField
      FieldName = 'ARQUIVO_NCM'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_PRE_VENDA: TStringField
      FieldName = 'ARQUIVO_PRE_VENDA'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_RESPOSTA_PRE_VENDA: TStringField
      FieldName = 'ARQUIVO_RESPOSTA_PRE_VENDA'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_KARDEX: TStringField
      FieldName = 'ARQUIVO_KARDEX'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_ATUALIZACAO_PRECO: TStringField
      FieldName = 'ARQUIVO_ATUALIZACAO_PRECO'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_CEST: TStringField
      FieldName = 'ARQUIVO_CEST'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_ANP: TStringField
      FieldName = 'ARQUIVO_ANP'
      Size = 40
    end
    object cdsParamIntegraPDVARQUIVO_TRANSPORTADORA_VEICULOS: TStringField
      FieldName = 'ARQUIVO_TRANSPORTADORA_VEICULOS'
      Size = 40
    end
    object cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO: TSmallintField
      FieldName = 'TIPO_CODIGO_INTEGRACAO'
      Required = True
    end
  end
  object dspSped_R0500: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSped_R0500
    Left = 289
    Top = 2179
  end
  object cdsSped_R0500: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSped_R0500'
    Left = 424
    Top = 2179
    object cdsSped_R0500COD_CTA: TStringField
      FieldName = 'COD_CTA'
      Required = True
      Size = 255
    end
    object cdsSped_R0500NOME_CTA: TStringField
      FieldName = 'NOME_CTA'
      Required = True
      Size = 60
    end
    object cdsSped_R0500DATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsSped_R0500COD_NAT_CC: TStringField
      FieldName = 'COD_NAT_CC'
      Required = True
      Size = 3
    end
    object cdsSped_R0500IND_CTA: TStringField
      FieldName = 'IND_CTA'
      Required = True
      Size = 1
    end
    object cdsSped_R0500NIVEL: TIntegerField
      FieldName = 'NIVEL'
      Required = True
    end
    object cdsSped_R0500COD_CTA_REFER: TStringField
      FieldName = 'COD_CTA_REFER'
      Size = 255
    end
    object cdsSped_R0500CNPJ_EST: TStringField
      FieldName = 'CNPJ_EST'
    end
  end
  object dspParticipantes: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParticipantes
    Left = 505
    Top = 2033
  end
  object cdsParticipantes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PARTICIPANTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FILIAL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'STATUS_CREDITO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_EMPRESA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SITUACAO_EMPRESA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA_NASCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'DATA_ABERTURA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'DATA_CADASTRO'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'DATA_ENCERRAMENTO'
        DataType = ftDate
      end
      item
        Name = 'NOME_RAZAO_SOCIAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOME_FANTASIA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ_CPF_CEI'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'RG_IE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PESSOA_FISICA_JURIDICA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'INSCRICAO_MUNICIPAL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'INSCRICAO_SUFRAMA'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CRT'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'CNAE_PRINCIPAL'
        DataType = ftString
        Size = 1024
      end
      item
        Name = 'CNAE_SECUNDARIOS'
        DataType = ftMemo
      end
      item
        Name = 'CODIGO_PAIS'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_LOGRADOURO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ENDERECO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODIGO_MUNICIPIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ESTADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DDD'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TELEFONE1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TELEFONE2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'USAR_ENDERECOS_IGUAIS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'ENDERECO_ENTREGA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMERO_ENTREGA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COMPLEMENTO_ENTREGA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO_ENTREGA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODIGO_MUNICIPIO_ENTREGA'
        DataType = ftInteger
      end
      item
        Name = 'CEP_ENTREGA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ESTADO_ENTREGA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ENDERECO_COBRANCA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMERO_COBRANCA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COMPLEMENTO_COBRANCA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO_COBRANCA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODIGO_MUNICIPIO_COBRANCA'
        DataType = ftInteger
      end
      item
        Name = 'CEP_COBRANCA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ESTADO_COBRANCA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'GARANTIDOR_OS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PRODUTOR_RURAL'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_INSCRICAO_FEDERAL'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'INSCRICAO_PRODUTOR'
        DataType = ftInteger
      end
      item
        Name = 'CONTRIBUINTE_ICMS'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'INSCR_ESTADUAL_SUBST_TRIB'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PIS_PASEP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'WEB_SITE'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
      end
      item
        Name = 'RENDA'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'LIMITE_CREDITO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'SALDO_DEVEDOR'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CODIGO_ATIVIDADE_FEDERAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODIGO_ATIVIDADE_ESTADUAL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CODIGO_ATIVIDADE_MUNICIPAL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CODIGO_UNIFICACAO'
        DataType = ftInteger
      end
      item
        Name = 'PONTO_REFERENCIA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PONTO_REFERENCIA_ENTREGA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PONTO_REFERENCIA_COBRANCA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VENDEDOR'
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE_FORNECEDOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PERMITE_VENDA_STATUS_BLOQUEADO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCONTO_PERSONALIZADO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'NOMECIDADE'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOMEESTADO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'MUNICIPIO_IBGE'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_ESTADO_IBGE'
        Attributes = [faReadonly]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspParticipantes'
    StoreDefs = True
    OnCalcFields = cdsParticipantesCalcFields
    OnNewRecord = cdsParticipantesNewRecord
    Left = 640
    Top = 2033
    object cdsParticipantesPARTICIPANTE: TIntegerField
      FieldName = 'PARTICIPANTE'
      Required = True
    end
    object cdsParticipantesFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsParticipantesATIVO: TSmallintField
      FieldName = 'ATIVO'
      Required = True
    end
    object cdsParticipantesSTATUS_CREDITO: TSmallintField
      FieldName = 'STATUS_CREDITO'
      Required = True
    end
    object cdsParticipantesTIPO_EMPRESA: TStringField
      FieldName = 'TIPO_EMPRESA'
    end
    object cdsParticipantesSITUACAO_EMPRESA: TStringField
      FieldName = 'SITUACAO_EMPRESA'
    end
    object cdsParticipantesDATA_NASCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA_NASCIMENTO'
    end
    object cdsParticipantesDATA_ABERTURA: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA_ABERTURA'
      Required = True
    end
    object cdsParticipantesDATA_CADASTRO: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsParticipantesDATA_ENCERRAMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA_ENCERRAMENTO'
    end
    object cdsParticipantesNOME_RAZAO_SOCIAL: TStringField
      FieldName = 'NOME_RAZAO_SOCIAL'
      Required = True
      Size = 60
    end
    object cdsParticipantesNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 60
    end
    object cdsParticipantesRG_IE: TStringField
      Alignment = taRightJustify
      FieldName = 'RG_IE'
      Required = True
      Size = 25
    end
    object cdsParticipantesPESSOA_FISICA_JURIDICA: TSmallintField
      FieldName = 'PESSOA_FISICA_JURIDICA'
      Required = True
    end
    object cdsParticipantesINSCRICAO_MUNICIPAL: TStringField
      Alignment = taRightJustify
      FieldName = 'INSCRICAO_MUNICIPAL'
      Size = 15
    end
    object cdsParticipantesINSCRICAO_SUFRAMA: TStringField
      Alignment = taRightJustify
      FieldName = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
    object cdsParticipantesCRT: TSmallintField
      FieldName = 'CRT'
      Required = True
    end
    object cdsParticipantesCNAE_PRINCIPAL: TStringField
      FieldName = 'CNAE_PRINCIPAL'
      Size = 1024
    end
    object cdsParticipantesCNAE_SECUNDARIOS: TMemoField
      FieldName = 'CNAE_SECUNDARIOS'
      BlobType = ftMemo
    end
    object cdsParticipantesCODIGO_PAIS: TIntegerField
      FieldName = 'CODIGO_PAIS'
    end
    object cdsParticipantesTIPO_LOGRADOURO: TSmallintField
      FieldName = 'TIPO_LOGRADOURO'
      Required = True
    end
    object cdsParticipantesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 60
    end
    object cdsParticipantesNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 10
    end
    object cdsParticipantesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsParticipantesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 60
    end
    object cdsParticipantesCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Required = True
    end
    object cdsParticipantesCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99.999-999;0;_'
      Size = 10
    end
    object cdsParticipantesESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 2
    end
    object cdsParticipantesCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object cdsParticipantesDDD: TStringField
      FieldName = 'DDD'
      Size = 3
    end
    object cdsParticipantesTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      EditMask = '9999-9999;0;_'
    end
    object cdsParticipantesTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      EditMask = '9999-9999;0;_'
    end
    object cdsParticipantesCELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '9999-9999;0;_'
    end
    object cdsParticipantesUSAR_ENDERECOS_IGUAIS: TSmallintField
      FieldName = 'USAR_ENDERECOS_IGUAIS'
      Required = True
    end
    object cdsParticipantesENDERECO_ENTREGA: TStringField
      FieldName = 'ENDERECO_ENTREGA'
      Size = 60
    end
    object cdsParticipantesNUMERO_ENTREGA: TStringField
      FieldName = 'NUMERO_ENTREGA'
      Size = 10
    end
    object cdsParticipantesCOMPLEMENTO_ENTREGA: TStringField
      FieldName = 'COMPLEMENTO_ENTREGA'
      Size = 60
    end
    object cdsParticipantesBAIRRO_ENTREGA: TStringField
      FieldName = 'BAIRRO_ENTREGA'
      Size = 60
    end
    object cdsParticipantesCODIGO_MUNICIPIO_ENTREGA: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO_ENTREGA'
    end
    object cdsParticipantesCEP_ENTREGA: TStringField
      Alignment = taRightJustify
      FieldName = 'CEP_ENTREGA'
      EditMask = '99.999-999;0;_'
      Size = 10
    end
    object cdsParticipantesESTADO_ENTREGA: TStringField
      FieldName = 'ESTADO_ENTREGA'
      Size = 2
    end
    object cdsParticipantesENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Size = 60
    end
    object cdsParticipantesNUMERO_COBRANCA: TStringField
      FieldName = 'NUMERO_COBRANCA'
      Size = 10
    end
    object cdsParticipantesCOMPLEMENTO_COBRANCA: TStringField
      FieldName = 'COMPLEMENTO_COBRANCA'
      Size = 60
    end
    object cdsParticipantesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 60
    end
    object cdsParticipantesCODIGO_MUNICIPIO_COBRANCA: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO_COBRANCA'
    end
    object cdsParticipantesCEP_COBRANCA: TStringField
      Alignment = taRightJustify
      FieldName = 'CEP_COBRANCA'
      EditMask = '99.999-999;0;_'
      Size = 10
    end
    object cdsParticipantesESTADO_COBRANCA: TStringField
      FieldName = 'ESTADO_COBRANCA'
      Size = 2
    end
    object cdsParticipantesGARANTIDOR_OS: TSmallintField
      FieldName = 'GARANTIDOR_OS'
      Required = True
    end
    object cdsParticipantesPRODUTOR_RURAL: TSmallintField
      FieldName = 'PRODUTOR_RURAL'
      Required = True
    end
    object cdsParticipantesTIPO_INSCRICAO_FEDERAL: TSmallintField
      FieldName = 'TIPO_INSCRICAO_FEDERAL'
      Required = True
    end
    object cdsParticipantesINSCRICAO_PRODUTOR: TIntegerField
      FieldName = 'INSCRICAO_PRODUTOR'
    end
    object cdsParticipantesCONTRIBUINTE_ICMS: TSmallintField
      FieldName = 'CONTRIBUINTE_ICMS'
      Required = True
    end
    object cdsParticipantesINSCR_ESTADUAL_SUBST_TRIB: TStringField
      FieldName = 'INSCR_ESTADUAL_SUBST_TRIB'
      Size = 25
    end
    object cdsParticipantesPIS_PASEP: TStringField
      FieldName = 'PIS_PASEP'
      Size = 25
    end
    object cdsParticipantesWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 500
    end
    object cdsParticipantesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 500
    end
    object cdsParticipantesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsParticipantesRENDA: TBCDField
      FieldName = 'RENDA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParticipantesLIMITE_CREDITO: TBCDField
      FieldName = 'LIMITE_CREDITO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParticipantesSALDO_DEVEDOR: TBCDField
      FieldName = 'SALDO_DEVEDOR'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParticipantesCODIGO_ATIVIDADE_FEDERAL: TStringField
      FieldName = 'CODIGO_ATIVIDADE_FEDERAL'
      Size = 10
    end
    object cdsParticipantesCODIGO_ATIVIDADE_ESTADUAL: TStringField
      FieldName = 'CODIGO_ATIVIDADE_ESTADUAL'
      Size = 25
    end
    object cdsParticipantesCODIGO_ATIVIDADE_MUNICIPAL: TStringField
      FieldName = 'CODIGO_ATIVIDADE_MUNICIPAL'
      Size = 25
    end
    object cdsParticipantesCODIGO_UNIFICACAO: TIntegerField
      FieldName = 'CODIGO_UNIFICACAO'
    end
    object cdsParticipantesPONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Size = 60
    end
    object cdsParticipantesPONTO_REFERENCIA_ENTREGA: TStringField
      FieldName = 'PONTO_REFERENCIA_ENTREGA'
      Size = 60
    end
    object cdsParticipantesPONTO_REFERENCIA_COBRANCA: TStringField
      FieldName = 'PONTO_REFERENCIA_COBRANCA'
      Size = 60
    end
    object cdsParticipantesNOMECIDADE: TStringField
      FieldName = 'NOMECIDADE'
      ReadOnly = True
      Size = 40
    end
    object cdsParticipantesNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      ReadOnly = True
      Size = 40
    end
    object cdsParticipantesMUNICIPIO_IBGE: TIntegerField
      FieldName = 'MUNICIPIO_IBGE'
      ReadOnly = True
    end
    object cdsParticipantesCODIGO_ESTADO_IBGE: TIntegerField
      FieldName = 'CODIGO_ESTADO_IBGE'
      ReadOnly = True
    end
    object cdsParticipantesVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
    end
    object cdsParticipantesCNPJ_CPF_CEI: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_CPF_CEI'
      OnGetText = cdsParticipantesCNPJ_CPF_CEIGetText
      Size = 25
    end
    object cdsParticipantesCLIENTE_FORNECEDOR: TIntegerField
      FieldName = 'CLIENTE_FORNECEDOR'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsParticipantesPERMITE_VENDA_STATUS_BLOQUEADO: TSmallintField
      FieldName = 'PERMITE_VENDA_STATUS_BLOQUEADO'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsParticipantesDESCONTO_PERSONALIZADO: TBCDField
      FieldName = 'DESCONTO_PERSONALIZADO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsParticipantesLIMITE_DISPONIVEL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'LIMITE_DISPONIVEL'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
  end
  object dspTipoLogradouro: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTipoLogradouro
    Left = 534
    Top = 2083
  end
  object cdsTipoLogradouro: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPO_LOGRADOURO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspTipoLogradouro'
    StoreDefs = True
    OnNewRecord = cdsTipoLogradouroNewRecord
    Left = 669
    Top = 2083
    object cdsTipoLogradouroTIPO_LOGRADOURO: TIntegerField
      FieldName = 'TIPO_LOGRADOURO'
      Required = True
    end
    object cdsTipoLogradouroSIGLA: TStringField
      FieldName = 'SIGLA'
    end
    object cdsTipoLogradouroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object dspRegimeTributario: TDataSetProvider
    DataSet = dmDBEXMaster.fdqRegimeTributario
    Left = 534
    Top = 2131
  end
  object cdsRegimeTributario: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'REGIME TRIBUTARIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspRegimeTributario'
    StoreDefs = True
    OnNewRecord = cdsParticipantesNewRecord
    Left = 669
    Top = 2131
    object cdsRegimeTributarioREGIMETRIBUTARIO: TIntegerField
      FieldName = 'REGIME TRIBUTARIO'
      Required = True
    end
    object cdsRegimeTributarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dspParametrosNFCe: TDataSetProvider
    DataSet = dmDBEXMaster.fdqParametrosNFCe
    Left = 534
    Top = 2179
  end
  object cdsParametrosNFCe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametrosNFce'
    Left = 669
    Top = 2179
    object cdsParametrosNFCeLOJA: TIntegerField
      FieldName = 'LOJA'
      Required = True
    end
    object cdsParametrosNFCeNOME_TERMINAL: TStringField
      FieldName = 'NOME_TERMINAL'
      Required = True
      Size = 10
    end
    object cdsParametrosNFCeULTIMA_NFCE_IMPRESSA: TIntegerField
      FieldName = 'ULTIMA_NFCE_IMPRESSA'
      Required = True
    end
    object cdsParametrosNFCeSERIE_NFCE: TSmallintField
      FieldName = 'SERIE_NFCE'
      Required = True
    end
    object cdsParametrosNFCeHOMOLOGACAO_PRODUCAO_CSC: TSmallintField
      FieldName = 'HOMOLOGACAO_PRODUCAO_CSC'
      Required = True
    end
    object cdsParametrosNFCeCSC: TStringField
      FieldName = 'CSC'
      Required = True
      Size = 500
    end
    object cdsParametrosNFCeMODELO_IMPRESSORA: TSmallintField
      FieldName = 'MODELO_IMPRESSORA'
      Required = True
    end
    object cdsParametrosNFCePORTA_IMPRESSORA: TStringField
      FieldName = 'PORTA_IMPRESSORA'
      Required = True
      Size = 10
    end
    object cdsParametrosNFCeVELOCIDADE_PORTA_IMPRESSORA: TIntegerField
      FieldName = 'VELOCIDADE_PORTA_IMPRESSORA'
      Required = True
    end
    object cdsParametrosNFCeIGNORAR_TAGS_FORMATACAO: TSmallintField
      FieldName = 'IGNORAR_TAGS_FORMATACAO'
      Required = True
    end
    object cdsParametrosNFCeIMPRIMIR_ITEM_UMA_LINHA: TSmallintField
      FieldName = 'IMPRIMIR_ITEM_UMA_LINHA'
      Required = True
    end
    object cdsParametrosNFCeIMPR_DESCONTO_ACRESCIMO_ITEM: TSmallintField
      FieldName = 'IMPR_DESCONTO_ACRESCIMO_ITEM'
      Required = True
    end
    object cdsParametrosNFCeQTD_LINHAS_ENTRE_CUPOM: TSmallintField
      FieldName = 'QTD_LINHAS_ENTRE_CUPOM'
      Required = True
    end
    object cdsParametrosNFCeIMPRIMIR_CUPOM_RESUMIDO: TSmallintField
      FieldName = 'IMPRIMIR_CUPOM_RESUMIDO'
      Required = True
    end
  end
  object cdsPesqFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqFornecedor'
    Left = 176
    Top = 2223
    object cdsPesqFornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Required = True
    end
    object cdsPesqFornecedorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object cdsPesqFornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsPesqFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
    end
    object cdsPesqFornecedorINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
    end
    object cdsPesqFornecedorCADASTRO: TDateField
      FieldName = 'CADASTRO'
      Required = True
    end
    object cdsPesqFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 40
    end
    object cdsPesqFornecedorNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsPesqFornecedorCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsPesqFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPesqFornecedorESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsPesqFornecedorDDD: TStringField
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object cdsPesqFornecedorTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object cdsPesqFornecedorTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object cdsPesqFornecedorFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object cdsPesqFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsPesqFornecedorCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object cdsPesqFornecedorHTTP: TStringField
      FieldName = 'HTTP'
      Size = 50
    end
    object cdsPesqFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsPesqFornecedorTIPO: TSmallintField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsPesqFornecedorOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsPesqFornecedorULTIMOPEDIDO: TIntegerField
      FieldName = 'ULTIMOPEDIDO'
    end
    object cdsPesqFornecedorDATAULTIMOPEDIDO: TDateField
      FieldName = 'DATAULTIMOPEDIDO'
    end
    object cdsPesqFornecedorVALORULTIMOPEDIDO: TBCDField
      FieldName = 'VALORULTIMOPEDIDO'
      Precision = 18
      Size = 2
    end
    object cdsPesqFornecedorULTIMANF: TStringField
      FieldName = 'ULTIMANF'
      Size = 15
    end
    object cdsPesqFornecedorDATAULTIMANF: TDateField
      FieldName = 'DATAULTIMANF'
    end
    object cdsPesqFornecedorVALORULTIMANF: TBCDField
      FieldName = 'VALORULTIMANF'
      Precision = 18
      Size = 2
    end
    object cdsPesqFornecedorRAMODEATIVIDADE: TSmallintField
      FieldName = 'RAMODEATIVIDADE'
      Required = True
    end
    object cdsPesqFornecedorCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Required = True
    end
    object cdsPesqFornecedorATACADISTAREGIMEESPECIAL: TSmallintField
      FieldName = 'ATACADISTAREGIMEESPECIAL'
      Required = True
    end
    object cdsPesqFornecedorREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 30
    end
    object cdsPesqFornecedorOPTANTE_SIMPLES: TSmallintField
      FieldName = 'OPTANTE_SIMPLES'
      Required = True
    end
    object cdsPesqFornecedorAPROVEITA_DESCONTO_ITEM_NF: TIntegerField
      FieldName = 'APROVEITA_DESCONTO_ITEM_NF'
      Required = True
    end
    object cdsPesqFornecedorPAIS: TIntegerField
      FieldName = 'PAIS'
      Required = True
    end
    object cdsPesqFornecedorINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
  end
  object dspPesqFornecedor: TDataSetProvider
    DataSet = dmDBEXMaster.fdqPesqFornecedor
    Left = 41
    Top = 2223
  end
  object cdsUltimaNFSaidaPart: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUltimaNFsaidaPart'
    Left = 424
    Top = 2223
    object cdsUltimaNFSaidaPartNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Required = True
    end
    object cdsUltimaNFSaidaPartEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsUltimaNFSaidaPartSAIDA: TDateField
      FieldName = 'SAIDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsUltimaNFSaidaPartVALORDOSPRODUTOS: TBCDField
      FieldName = 'VALORDOSPRODUTOS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsUltimaNFSaidaPartVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspUltimaNFSaidaPart: TDataSetProvider
    DataSet = dmDBEXMaster.fdqNFSaida
    Left = 289
    Top = 2223
  end
  object dspTabelaCEST: TDataSetProvider
    DataSet = dmDBEXMaster.fdqTabelaCEST
    Left = 537
    Top = 2223
  end
  object cdsTabelaCEST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabelaCEST'
    Left = 672
    Top = 2223
    object cdsTabelaCESTCEST: TStringField
      FieldName = 'CEST'
      Required = True
      Size = 7
    end
    object cdsTabelaCESTNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cdsTabelaCESTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 512
    end
  end
  object dspSelecionaTabelaLOG: TDataSetProvider
    DataSet = dmDBEXMaster.fdqSelecionaTabelaLOG
    Left = 41
    Top = 2271
  end
  object cdsSelecionaTabelaLOG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelecionaTabelaLOG'
    Left = 176
    Top = 2271
    object cdsSelecionaTabelaLOGTABELA_MODULO: TStringField
      FieldName = 'TABELA_MODULO'
      Required = True
      Size = 400
    end
  end
  object cdsLogSys: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogSys'
    OnCalcFields = cdsLogSysCalcFields
    Left = 424
    Top = 2271
    object cdsLogSysOP_DATA: TDateField
      Alignment = taRightJustify
      FieldName = 'OP_DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsLogSysOP_HORA: TTimeField
      Alignment = taRightJustify
      FieldName = 'OP_HORA'
      DisplayFormat = 'hh:mm:ss'
    end
    object cdsLogSysOP_TABELA_MODULO: TStringField
      FieldName = 'OP_TABELA_MODULO'
      Size = 400
    end
    object cdsLogSysOP_OPERACAO: TSmallintField
      FieldName = 'OP_OPERACAO'
    end
    object cdsLogSysOP_COMPUTADOR: TStringField
      FieldName = 'OP_COMPUTADOR'
      Size = 15
    end
    object cdsLogSysOP_NUMERO_IP: TStringField
      FieldName = 'OP_NUMERO_IP'
      Size = 16
    end
    object cdsLogSysOP_LOG: TMemoField
      FieldName = 'OP_LOG'
      BlobType = ftMemo
    end
    object cdsLogSysOP_FOTO: TBlobField
      FieldName = 'OP_FOTO'
    end
    object cdsLogSysOP_NOME_USUARIO: TStringField
      FieldName = 'OP_NOME_USUARIO'
    end
    object cdsLogSysOP_LOG_ERRO: TMemoField
      FieldName = 'OP_LOG_ERRO'
      BlobType = ftMemo
    end
    object cdsLogSysS_OPERACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_OPERACAO'
      Calculated = True
    end
  end
  object dspLogSys: TDataSetProvider
    DataSet = dmDBEXMaster.fdqLogSys
    Left = 289
    Top = 2271
  end
end