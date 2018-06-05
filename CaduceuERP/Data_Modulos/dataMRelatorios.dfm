object dmRelatorios: TdmRelatorios
  OldCreateOrder = False
  Height = 774
  Width = 1168
  object sqqProdutoPIS_COFINS: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'IP_DATA_INICIO'
        ParamType = ptInput
        Value = 40695d
      end
      item
        DataType = ftDateTime
        Name = 'IP_DATA_FIM'
        ParamType = ptInput
        Value = 40724d
      end
      item
        DataType = ftInteger
        Name = 'IP_LEI_PIS_COFINS'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IP_FILIAL'
        ParamType = ptInput
        Value = 1
      end>
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_PRODUTO_PIS_COFINS(:IP_DATA_INICIO, :IP' +
        '_DATA_FIM,'
      '    :IP_LEI_PIS_COFINS, :IP_FILIAL)')
    Left = 1071
    Top = 258
  end
  object cdsVendaPisCofins: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1071
    Top = 408
    object cdsVendaPisCofinsPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object cdsVendaPisCofinsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsVendaPisCofinsUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object cdsVendaPisCofinsQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
      DisplayFormat = '#,##0.000'
    end
    object cdsVendaPisCofinsVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
      DisplayFormat = '#,##0.00'
      currency = False
    end
    object cdsVendaPisCofinsQUANTIDADE_SAIDA: TFloatField
      FieldName = 'QUANTIDADE_SAIDA'
      DisplayFormat = '#,##0.000'
    end
    object cdsVendaPisCofinsVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
      DisplayFormat = '#,##0.00'
      currency = False
    end
    object cdsVendaPisCofinsLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
    end
    object cdsVendaPisCofinsDESCRICAO_LEI_PIS_COFINS: TStringField
      FieldName = 'DESCRICAO_LEI_PIS_COFINS'
      Size = 60
    end
  end
  object dtsVendaPisCofins: TDataSource
    DataSet = cdsVendaPisCofins
    Left = 1071
    Top = 360
  end
  object fdqInventario: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from inventario')
    Left = 56
    Top = 16
  end
  object sqqRegInventario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 1071
    Top = 312
  end
  object fdqRegInventarioP7: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT INVENTARIO.INVENTARIO,INVENTARIO.anodereferencia, INVENTA' +
        'RIO.tipocustoinventario, INVENTARIO.valorliquidodoinventario,'
      
        'INVENTARIO.numero_ordem, iteminventario.quantidade, iteminventar' +
        'io.precodecusto,'
      
        '(iteminventario.precodecusto * iteminventario.quantidade) subtot' +
        'al,'
      
        'produto.descricao as descricao_produto, produto.unidade, produto' +
        '.tributacao,'
      
        'aliquotas.nome as descricao_tributacao, iteminventario.produto f' +
        'rom inventario'
      'join iteminventario iteminventario'
      'on(iteminventario.inventario = inventario.inventario)'
      'join produto produto'
      'on(produto.produto = iteminventario.produto)'
      'join aliquotas aliquotas'
      'on(aliquotas.tributacao = produto.tributacao)')
    Left = 56
    Top = 64
  end
  object fdqApoioEFDContr: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT PRODUTO, DESCRICAO, UNIDADE, NCM, cst_pis as cst_pis_s, c' +
        'st_cofins as cst_cofins_s,'
      
        'cst_pis_entrada, cst_cofins_entrada, aliquota_pis as aliq_pis_s,' +
        ' aliquota_cofins as aliq_cofins_s,'
      
        'aliquota_pis_entrada, aliquota_cofins_entrada, natureza_receita,' +
        ' CODIGO_CREDITO_PIS_COFINS FROM PRODUTO')
    Left = 56
    Top = 114
    object fdqApoioEFDContrPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqApoioEFDContrDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object fdqApoioEFDContrUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object fdqApoioEFDContrNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object fdqApoioEFDContrCST_PIS_S: TIntegerField
      FieldName = 'CST_PIS_S'
      Origin = 'CST_PIS'
    end
    object fdqApoioEFDContrCST_COFINS_S: TIntegerField
      FieldName = 'CST_COFINS_S'
      Origin = 'CST_COFINS'
    end
    object fdqApoioEFDContrCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object fdqApoioEFDContrCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object fdqApoioEFDContrALIQ_PIS_S: TBCDField
      FieldName = 'ALIQ_PIS_S'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object fdqApoioEFDContrALIQ_COFINS_S: TBCDField
      FieldName = 'ALIQ_COFINS_S'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object fdqApoioEFDContrALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object fdqApoioEFDContrALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object fdqApoioEFDContrNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object fdqApoioEFDContrCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
  end
  object fdqPromocao: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select prom.*, pro.descricao from promocao prom'
      'join produto pro'
      'on(pro.produto = prom.produto)'
      'where prom.status = 1'
      'order by pro.descricao')
    Left = 56
    Top = 162
  end
  object fdqApoioInventario: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT PRO.PRODUTO, PRO.DESCRICAO, PRO.UNIDADE, (select custoliq' +
        'uido from produtofilial where produto = pro.produto and filial =' +
        ' 1),'
      
        '(select deposito from produtofilial where produto = pro.produto ' +
        'and filial = 1),'
      
        '(select loja from produtofilial where produto = pro.produto and ' +
        'filial = 1)'
      ' FROM PRODUTO PRO')
    Left = 56
    Top = 210
  end
  object fdqVendaRankingGrupo: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM RVENDA_RANKING_PRO_GRUPO(:IP_DATA_INICIAL, :IP_DAT' +
        'A_FINAL, :IP_GRUPO,:IP_TIPO_RANKING)')
    Left = 219
    Top = 16
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '01/09/14'
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end
      item
        Name = 'IP_GRUPO'
        DataType = ftInteger
        FDDataType = dtInt16
        ParamType = ptInput
        Value = '-1'
      end
      item
        Name = 'IP_TIPO_RANKING'
        DataType = ftInteger
        FDDataType = dtInt16
        ParamType = ptInput
        Value = '0'
      end>
  end
  object fdqVendaProdutoCFOP: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select pro.produto, pro.descricao, pro.unidade, sum(mov.quantida' +
        'desaida) as tot_quantidade, mov.cfop, cfop.descricao nome_cfop,'
      
        'sum(mov.subtotalsaida) as sub_total,(sum(mov.subtotalsaida) / su' +
        'm(mov.quantidadesaida)) as vl_medio from movimento mov'
      '        '
      'join produto pro'
      'on pro.produto = mov.produto'
      ''
      'left join cfop cfop'
      'on cfop.cfop = mov.cfop'
      ''
      'where mov.data between :ip_data_inicial and :ip_data_final'
      'and mov.subtotalsaida > 0'
      ''
      
        'group by mov.cfop, pro.descricao, pro.produto, pro.unidade, cfop' +
        '.descricao'
      ''
      'order by mov.cfop, pro.descricao')
    Left = 56
    Top = 258
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end>
  end
  object fdqCompraProdCFOP: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select pro.produto, pro.descricao, pro.unidade, sum(mov.quantida' +
        'deentrada) as tot_quantidade, mov.cfop, cfop.descricao nome_cfop' +
        ','
      
        'sum(mov.subtotalentrada) as sub_total,(sum(mov.subtotalentrada) ' +
        '/ sum(mov.quantidadeentrada)) as vl_medio from movimento mov'
      '        '
      'join produto pro'
      'on pro.produto = mov.produto'
      ''
      'left join cfop cfop'
      'on cfop.cfop = mov.cfop'
      ''
      'where mov.data between :ip_data_inicial and :ip_data_final'
      'and mov.subtotalentrada > 0'
      ''
      
        'group by mov.cfop, pro.descricao, pro.produto, pro.unidade, cfop' +
        '.descricao'
      ''
      'order by mov.cfop, pro.descricao')
    Left = 56
    Top = 306
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end>
  end
  object dspRequisicaoPecaOS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItens_OS_Pecas
    Left = 56
    Top = 352
  end
  object cdsRequisicaoPecaOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRequisicaoPecaOS'
    Left = 219
    Top = 352
    object cdsRequisicaoPecaOSCODIGO_PECA: TIntegerField
      FieldName = 'CODIGO_PECA'
      Origin = 'CODIGO_PECA'
    end
    object cdsRequisicaoPecaOSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsRequisicaoPecaOSQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
  end
  object fdqMovCompraProd: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM RMOVIMENTO_ENTRADA_PRODUTO(:IP_DATA_INICIAL, :IP_D' +
        'ATA_FINAL,:IP_FORNECEDOR)')
    Left = 219
    Top = 258
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end
      item
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdqMovVendaProd: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM RMOVIMENTO_SAIDA_PRODUTO(:IP_DATA_INICIAL, :IP_DAT' +
        'A_FINAL,:IP_FORNECEDOR)')
    Left = 219
    Top = 306
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end
      item
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object rvpGenesisAC: TRvProject
    Engine = rvsGenesisAC
    Left = 530
    Top = 16
  end
  object rvdOrdemServico: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsOrdemServico
    Left = 952
    Top = 64
  end
  object rvdItensServicoOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsItens_OS_servico
    Left = 952
    Top = 114
  end
  object rvdIrtensPecaOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsItens_OS_Pecas
    Left = 952
    Top = 162
  end
  object rvdFilial: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsFilial
    Left = 952
    Top = 210
  end
  object rvdPerdas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 952
    Top = 258
  end
  object rvdItensPerdas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 952
    Top = 306
  end
  object rvdRControlePerda: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 952
    Top = 352
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    UseCompression = True
    DocInfo.Author = 'Samptec'
    DocInfo.Creator = 'Samptec'
    DocInfo.Producer = 'Samptec'
    Left = 1071
    Top = 16
  end
  object RvRenderRTF1: TRvRenderRTF
    DisplayName = 'Rich Text Format (RTF)'
    FileExtension = '*.rtf'
    Left = 1071
    Top = 120
  end
  object RvRenderText1: TRvRenderText
    DisplayName = 'Plain Text (TXT)'
    FileExtension = '*.txt'
    CPI = 10.000000000000000000
    LPI = 6.000000000000000000
    Left = 1071
    Top = 208
  end
  object rvdTransferencia: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 952
    Top = 16
  end
  object rvdGenesis: TRvDataSetConnection
    RuntimeVisibility = rtEndUser
    DataSet = cdsListNFsaida
    Left = 530
    Top = 64
  end
  object rvdOrcamentoZeus: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsPedidoZeus
    Left = 824
    Top = 16
  end
  object rvdItemOrcamentoZeus: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsItemPedZeus
    Left = 824
    Top = 64
  end
  object rvdEndEntregaOrcaZeus: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsEndEntregaPedZeus
    Left = 824
    Top = 114
  end
  object rvdFinalizaOrcaZeus: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmDBEXMaster.fdqFinalizPedZeus
    Left = 824
    Top = 162
  end
  object rvsGenesisAC: TRvSystem
    TitleSetup = 'Op'#231#245'es'
    TitleStatus = 'Status'
    TitlePreview = 'Visualizador de Relat'#243'rio'
    SystemFiler.StatusFormat = 'Gerando p'#225'gina %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Imprimindo page %p'
    SystemPrinter.Title = 'GenesisAC - XE'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 530
    Top = 114
  end
  object rvdCaixaLoja: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsCaixaLoja
    Left = 824
    Top = 306
  end
  object rvdItemCaixaLoja: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsItemCaixaLoja
    Left = 824
    Top = 352
  end
  object rvdParcelasCRE: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsParcelasCRE_TEMP_CX
    Left = 824
    Top = 396
  end
  object rvdConfiguracoes: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsConfiguracoes
    Left = 824
    Top = 440
  end
  object rvdOrdemProducao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsOrdemProducao
    Left = 824
    Top = 210
  end
  object rvdItemOrdemProducao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsItemOrdemProducao
    Left = 824
    Top = 258
  end
  object rvdFretePedido: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsFretePedidoVenda
    Left = 824
    Top = 488
  end
  object rvdListagemPedVenda: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsListagemPedVenda
    Left = 952
    Top = 396
  end
  object fdqListagemPedVenda: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select pvz.pedido, pvz.emissao, pvz.situacao, pvz.vendedor, pvz.' +
        'cliente, pvz.valor_do_pedido,'
      'cli.razaosocial, func.nome, fpg.tipo from pedido_venda_zeus pvz'
      'left join clientes cli'
      'on(cli.cliente = pvz.cliente)'
      'join funcionario func'
      'on(func.funcionario = pvz.vendedor)'
      'join finalizadora_pedido_zeus fin'
      'on(fin.pedido = pvz.pedido)'
      'join formapagamento fpg'
      'on(fpg.formapagamento = fin.forma_pagamento)'
      'order by fpg.tipo, pvz.pedido, cli.razaosocial')
    Left = 219
    Top = 64
  end
  object dspListagemPedvenda: TDataSetProvider
    DataSet = fdqListagemPedVenda
    Left = 56
    Top = 396
  end
  object cdsListagemPedVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListagemPedvenda'
    OnCalcFields = cdsListagemPedVendaCalcFields
    Left = 219
    Top = 396
    object cdsListagemPedVendaPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListagemPedVendaSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
    end
    object cdsListagemPedVendaVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
      Required = True
    end
    object cdsListagemPedVendaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
    end
    object cdsListagemPedVendaVALOR_DO_PEDIDO: TBCDField
      FieldName = 'VALOR_DO_PEDIDO'
      Origin = 'VALOR_DO_PEDIDO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListagemPedVendaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsListagemPedVendaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsListagemPedVendaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsListagemPedVendaS_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_TIPO'
      Size = 30
      Calculated = True
    end
    object cdsListagemPedVendaS_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_SITUACAO'
      Calculated = True
    end
    object cdsListagemPedVendaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      EditMask = '99/99/9999;0;_'
    end
  end
  object rvdLivroEntrada: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsRelLivroEntrada
    Left = 530
    Top = 162
  end
  object fdqRelLivroEntrada: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        ' select * from SELECIONAR_LIVRO_ENTRADA(:IP_DATA_INICIAL, :IP_DA' +
        'TA_FINAL, :IP_ORDENACAO)')
    Left = 219
    Top = 114
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = 42614d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
        Value = 42643d
      end
      item
        Name = 'IP_ORDENACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object dspRelLivroEntrada: TDataSetProvider
    DataSet = fdqRelLivroEntrada
    Left = 56
    Top = 445
  end
  object cdsRelLivroEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelLivroEntrada'
    OnCalcFields = cdsListagemPedVendaCalcFields
    Left = 219
    Top = 445
    object cdsRelLivroEntradaOP_DATA_ENTRADA: TDateField
      FieldName = 'OP_DATA_ENTRADA'
      Origin = 'OP_DATA_ENTRADA'
    end
    object cdsRelLivroEntradaOP_TIPO_ESP_DOCUMENTO: TStringField
      FieldName = 'OP_TIPO_ESP_DOCUMENTO'
      Origin = 'OP_TIPO_ESP_DOCUMENTO'
      Size = 5
    end
    object cdsRelLivroEntradaOP_SERIE_SUB_SERIE: TStringField
      FieldName = 'OP_SERIE_SUB_SERIE'
      Origin = 'OP_SERIE_SUB_SERIE'
      Size = 3
    end
    object cdsRelLivroEntradaOP_NUMERO_DOCUMENTO: TStringField
      FieldName = 'OP_NUMERO_DOCUMENTO'
      Origin = 'OP_NUMERO_DOCUMENTO'
      Size = 15
    end
    object cdsRelLivroEntradaOP_DATA_DOCUMENTO: TDateField
      FieldName = 'OP_DATA_DOCUMENTO'
      Origin = 'OP_DATA_DOCUMENTO'
    end
    object cdsRelLivroEntradaOP_CNPJ_EMITENTE: TStringField
      FieldName = 'OP_CNPJ_EMITENTE'
      Origin = 'OP_CNPJ_EMITENTE'
      Size = 14
    end
    object cdsRelLivroEntradaOP_UF_ORIGEM: TStringField
      FieldName = 'OP_UF_ORIGEM'
      Origin = 'OP_UF_ORIGEM'
      Size = 2
    end
    object cdsRelLivroEntradaOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsRelLivroEntradaOP_CODIGO_CONTABIL: TSmallintField
      FieldName = 'OP_CODIGO_CONTABIL'
      Origin = 'OP_CODIGO_CONTABIL'
    end
    object cdsRelLivroEntradaOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 4
    end
    object cdsRelLivroEntradaOP_IDENT_ICMS_IPI: TSmallintField
      FieldName = 'OP_IDENT_ICMS_IPI'
      Origin = 'OP_IDENT_ICMS_IPI'
    end
    object cdsRelLivroEntradaOP_COD_VALORES_FISCAIS: TSmallintField
      FieldName = 'OP_COD_VALORES_FISCAIS'
      Origin = 'OP_COD_VALORES_FISCAIS'
    end
    object cdsRelLivroEntradaOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsRelLivroEntradaOP_ALIQUOTA: TBCDField
      FieldName = 'OP_ALIQUOTA'
      Origin = 'OP_ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsRelLivroEntradaOP_IMPOSTO_CREDITADO: TBCDField
      FieldName = 'OP_IMPOSTO_CREDITADO'
      Origin = 'OP_IMPOSTO_CREDITADO'
      Precision = 18
      Size = 2
    end
    object cdsRelLivroEntradaOP_OBSERVACAO: TStringField
      FieldName = 'OP_OBSERVACAO'
      Origin = 'OP_OBSERVACAO'
      Size = 100
    end
  end
  object rvdRelTotalizaLivroEntrada: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = fdqRelTotalizaLivroEntradaEST
    Left = 530
    Top = 210
  end
  object fdqRelTotalizaLivroEntradaEST: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        ' select * from TOTALIZAR_LIVRO_ENTRADA (:IP_UF_ORIGEM, :IP_MES_A' +
        'NO, :IP_ESTADUAL, :IP_TIPO_TOTALIZACAO)')
    Left = 220
    Top = 162
    ParamData = <
      item
        Name = 'IP_UF_ORIGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = 'ES'
      end
      item
        Name = 'IP_MES_ANO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = '092016'
      end
      item
        Name = 'IP_ESTADUAL'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'IP_TIPO_TOTALIZACAO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 0
      end>
  end
  object dspRelTotalizaLivroEntradaEST: TDataSetProvider
    DataSet = fdqRelTotalizaLivroEntradaEST
    Left = 55
    Top = 488
  end
  object cdsRelTotalizaLivroEntradaEST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelTotalizaLivroEntradaEST'
    OnCalcFields = cdsListagemPedVendaCalcFields
    Left = 219
    Top = 488
    object cdsRelTotalizaLivroEntradaESTOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsRelTotalizaLivroEntradaESTOP_CFOP_DESCRICAO: TStringField
      FieldName = 'OP_CFOP_DESCRICAO'
      Origin = 'OP_CFOP_DESCRICAO'
      Size = 100
    end
    object cdsRelTotalizaLivroEntradaESTOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaESTOP_BASE_CALCULO_CFOP: TBCDField
      FieldName = 'OP_BASE_CALCULO_CFOP'
      Origin = 'OP_BASE_CALCULO_CFOP'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaESTOP_IMPOSTO_CREDITADO_CFOP: TBCDField
      FieldName = 'OP_IMPOSTO_CREDITADO_CFOP'
      Origin = 'OP_IMPOSTO_CREDITADO_CFOP'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaESTOP_ISENTAS: TBCDField
      FieldName = 'OP_ISENTAS'
      Origin = 'OP_ISENTAS'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaESTOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaESTOP_ALIQUOTA: TBCDField
      FieldName = 'OP_ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaESTOP_UF: TStringField
      FieldName = 'OP_UF'
      Size = 2
    end
  end
  object fdqRelTotalizaLivroEntradaINTER: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        ' select * from TOTALIZAR_LIVRO_ENTRADA (:IP_UF_ORIGEM, :IP_MES_A' +
        'NO, :IP_ESTADUAL, :IP_TIPO_TOTALIZACAO)')
    Left = 220
    Top = 210
    ParamData = <
      item
        Name = 'IP_UF_ORIGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = 'ES'
      end
      item
        Name = 'IP_MES_ANO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = '092016'
      end
      item
        Name = 'IP_ESTADUAL'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IP_TIPO_TOTALIZACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object dspRelTotalizaLivroEntradaINTER: TDataSetProvider
    DataSet = fdqRelTotalizaLivroEntradaINTER
    Left = 54
    Top = 531
  end
  object cdsRelTotalizaLivroEntradaINTER: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelTotalizaLivroEntradaINTER'
    OnCalcFields = cdsListagemPedVendaCalcFields
    Left = 219
    Top = 531
    object StringField1: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'OP_CFOP_DESCRICAO'
      Origin = 'OP_CFOP_DESCRICAO'
      Size = 100
    end
    object BCDField1: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'OP_BASE_CALCULO_CFOP'
      Origin = 'OP_BASE_CALCULO_CFOP'
      Precision = 18
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'OP_IMPOSTO_CREDITADO_CFOP'
      Origin = 'OP_IMPOSTO_CREDITADO_CFOP'
      Precision = 18
      Size = 2
    end
    object BCDField4: TBCDField
      FieldName = 'OP_ISENTAS'
      Origin = 'OP_ISENTAS'
      Precision = 18
      Size = 2
    end
    object BCDField5: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaINTEROP_ALIQUOTA: TBCDField
      FieldName = 'OP_ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroEntradaINTEROP_UF: TStringField
      FieldName = 'OP_UF'
      Size = 2
    end
  end
  object rvdRelTotalizaLivroEntradaINTER: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = fdqRelTotalizaLivroEntradaINTER
    Left = 530
    Top = 258
  end
  object fdmTotalAliqLivroEntrada: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 530
    Top = 392
    object fdmTotalAliqLivroEntradaALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      Size = 100
    end
    object fdmTotalAliqLivroEntradaVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
  object rvdTotalAliqLivroEntrada: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = fdmTotalAliqLivroEntrada
    Left = 530
    Top = 303
  end
  object fdmTotalOperInterLivroEntrada: TFDMemTable
    OnNewRecord = fdmTotalOperInterLivroEntradaNewRecord
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 530
    Top = 440
    object fdmTotalOperInterLivroEntradaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object fdmTotalOperInterLivroEntradaBASE_CALCULO: TCurrencyField
      FieldName = 'BASE_CALCULO'
    end
    object fdmTotalOperInterLivroEntradaVALOR_CONTABIL: TCurrencyField
      FieldName = 'VALOR_CONTABIL'
    end
    object fdmTotalOperInterLivroEntradaISENTAS: TCurrencyField
      FieldName = 'ISENTAS'
    end
    object fdmTotalOperInterLivroEntradaOUTRAS: TCurrencyField
      FieldName = 'OUTRAS'
    end
    object fdmTotalOperInterLivroEntradaICMS_RETIDO: TCurrencyField
      FieldName = 'ICMS_RETIDO'
    end
    object fdmTotalOperInterLivroEntradaBC_ICMS_RETIDO: TCurrencyField
      FieldName = 'BC_ICMS_RETIDO'
    end
  end
  object rvdTotalOperInterLivroEntrada: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = fdmTotalOperInterLivroEntrada
    Left = 530
    Top = 347
  end
  object rvdLivroSaida: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsLivroFiscalSaida
    Left = 689
    Top = 162
  end
  object rvdTotalizaLivroSaida: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = fdqRelTotalizaLivroSaidaEST
    Left = 689
    Top = 210
  end
  object fdqRelTotalizaLivroSaidaEST: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        ' select * from TOTALIZAR_LIVRO_SAIDA(:IP_DATA_INCIAL, :IP_DATA_F' +
        'INAL, :IP_UF_DESTINATARIO, :IP_TIPO_TOTALIZACAO, :IP_ESTADUAL)')
    Left = 379
    Top = 162
    ParamData = <
      item
        Name = 'IP_DATA_INCIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = 42614d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
        Value = 42643d
      end
      item
        Name = 'IP_UF_DESTINATARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = 'ES'
      end
      item
        Name = 'IP_TIPO_TOTALIZACAO'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'IP_ESTADUAL'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object dspRelTotalizaLivroSaidaEST: TDataSetProvider
    DataSet = fdqRelTotalizaLivroSaidaEST
    Left = 379
    Top = 488
  end
  object cdsRelTotalizaLivroSaidaEST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelTotalizaLivroSaidaEST'
    OnCalcFields = cdsListagemPedVendaCalcFields
    Left = 530
    Top = 488
    object cdsRelTotalizaLivroSaidaESTOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsRelTotalizaLivroSaidaESTOP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsRelTotalizaLivroSaidaESTOP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaESTOP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaESTOP_IMPOSTO_DEBITADO: TBCDField
      FieldName = 'OP_IMPOSTO_DEBITADO'
      Origin = 'OP_IMPOSTO_DEBITADO'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaESTOP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaESTOP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaESTOP_ALIQUOTA: TBCDField
      FieldName = 'OP_ALIQUOTA'
      Precision = 18
      Size = 2
    end
  end
  object fdmTotalAliqLivroSaida: TFDMemTable
    OnNewRecord = fdmTotalAliqLivroSaidaNewRecord
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 379
    Top = 392
    object fdmTotalAliqLivroSaidaVALOR: TCurrencyField
      FieldName = 'VALOR'
      currency = False
    end
    object fdmTotalAliqLivroSaidaALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
    end
  end
  object rvdTotalAliqLivroSaida: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = fdmTotalAliqLivroSaida
    Left = 689
    Top = 303
  end
  object fdqRelTotalizaLivroSaidaINTER: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        ' select * from TOTALIZAR_LIVRO_SAIDA(:IP_DATA_INCIAL, :IP_DATA_F' +
        'INAL, :IP_UF_DESTINATARIO, :IP_TIPO_TOTALIZACAO, :IP_ESTADUAL)')
    Left = 379
    Top = 210
    ParamData = <
      item
        Name = 'IP_DATA_INCIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = 42614d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
        Value = 42643d
      end
      item
        Name = 'IP_UF_DESTINATARIO'
        DataType = ftString
        ParamType = ptInput
        Value = 'ES'
      end
      item
        Name = 'IP_TIPO_TOTALIZACAO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'IP_ESTADUAL'
        DataType = ftSmallint
        ParamType = ptInput
        Value = 1
      end>
  end
  object cdsRelTotalizaLivroSaidaINTER: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelTotalizaLivroSaidaINTER'
    OnCalcFields = cdsListagemPedVendaCalcFields
    Left = 530
    Top = 531
    object cdsRelTotalizaLivroSaidaINTEROP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Origin = 'OP_CFOP'
      Size = 5
    end
    object cdsRelTotalizaLivroSaidaINTEROP_DESCRICAO_CFOP: TStringField
      FieldName = 'OP_DESCRICAO_CFOP'
      Origin = 'OP_DESCRICAO_CFOP'
      Size = 100
    end
    object cdsRelTotalizaLivroSaidaINTEROP_VALOR_CONTABIL: TBCDField
      FieldName = 'OP_VALOR_CONTABIL'
      Origin = 'OP_VALOR_CONTABIL'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaINTEROP_BASE_CALCULO: TBCDField
      FieldName = 'OP_BASE_CALCULO'
      Origin = 'OP_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaINTEROP_IMPOSTO_DEBITADO: TBCDField
      FieldName = 'OP_IMPOSTO_DEBITADO'
      Origin = 'OP_IMPOSTO_DEBITADO'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaINTEROP_ISENTAS_NT: TBCDField
      FieldName = 'OP_ISENTAS_NT'
      Origin = 'OP_ISENTAS_NT'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaINTEROP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Origin = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaINTEROP_ALIQUOTA: TBCDField
      FieldName = 'OP_ALIQUOTA'
      Origin = 'OP_ALIQUOTA'
      Precision = 18
      Size = 2
    end
    object cdsRelTotalizaLivroSaidaINTEROP_UF: TStringField
      FieldName = 'OP_UF'
      Origin = 'OP_UF'
      Size = 2
    end
  end
  object dspRelTotalizaLivroSaidaINTER: TDataSetProvider
    DataSet = fdqRelTotalizaLivroSaidaINTER
    Left = 379
    Top = 531
  end
  object rvdRelTotalizaLivroSaidaINTER: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsRelTotalizaLivroSaidaINTER
    Left = 689
    Top = 258
  end
  object rvdApuracaoEntrada: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsTotalizaVContabilE
    Left = 689
    Top = 347
  end
  object rvdTotalizaValoresEST: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsTotalizaValoresEST
    Left = 690
    Top = 393
  end
  object rvdTotalizaValoresINTER: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsTotalizaValoresINTER
    Left = 690
    Top = 439
  end
  object rvdApuracaoSaida: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsTotalizaVContabilS
    Left = 692
    Top = 489
  end
  object rvdTotalizaValoresEST_S: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsTotalizaValoresEST_S
    Left = 691
    Top = 531
  end
  object rvdTotalizaValoresINTER_S: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmMProvider.cdsTotalizaValoresINTER_S
    Left = 826
    Top = 531
  end
  object rvdDeslocamentoOS: TRvDataSetConnection
    RuntimeVisibility = rtEndUser
    DataSet = dmMProvider.cdsDeslocamentoOS
    Left = 953
    Top = 442
  end
  object rvdCtrlNotas: TRvDataSetConnection
    RuntimeVisibility = rtEndUser
    DataSet = dmMProvider.cdsCtrlNotas
    Left = 956
    Top = 488
  end
  object dspListNFEntrada: TDataSetProvider
    DataSet = fdqListNFEntrada
    Left = 219
    Top = 575
  end
  object cdsListNFEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListNFEntrada'
    OnCalcFields = cdsListNFEntradaCalcFields
    Left = 379
    Top = 575
    object cdsListNFEntradaNOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Origin = 'NOTAFISCAL'
      Required = True
      Size = 15
    end
    object cdsListNFEntradaENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsListNFEntradaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsListNFEntradaFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object cdsListNFEntradaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsListNFEntradaVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Origin = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaBASEICMS: TBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      Origin = 'VALORICMS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaBASESUBSTITUICAO: TBCDField
      FieldName = 'BASESUBSTITUICAO'
      Origin = 'BASESUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaVALORSUBSTITUICAO: TBCDField
      FieldName = 'VALORSUBSTITUICAO'
      Origin = 'VALORSUBSTITUICAO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsListNFEntradaVALORDOSEGURO: TBCDField
      FieldName = 'VALORDOSEGURO'
      Origin = 'VALORDOSEGURO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaFRETE_AGREGADO: TBCDField
      FieldName = 'FRETE_AGREGADO'
      Origin = 'VALORDOFRETE'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaOUTRASDESPESAS: TBCDField
      FieldName = 'OUTRASDESPESAS'
      Origin = 'OUTRASDESPESAS'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaVALORDOIPI: TBCDField
      FieldName = 'VALORDOIPI'
      Origin = 'VALORDOIPI'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaCH_FRETE: TBCDField
      FieldName = 'CH_FRETE'
      Origin = 'CH_FRETE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFEntradaS_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_STATUS'
      Size = 15
      Calculated = True
    end
    object cdsListNFEntradaFINALIDADE_NF: TSmallintField
      FieldName = 'FINALIDADE_NF'
      Origin = 'FINALIDADE_NF'
    end
    object cdsListNFEntradaOBSERVACAO_FINALIDADE: TStringField
      FieldName = 'OBSERVACAO_FINALIDADE'
      Origin = 'OBSERVACAO_FINALIDADE'
      Size = 100
    end
    object cdsListNFEntradaS_FINALIDADE: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_FINALIDADE'
      Size = 10
      Calculated = True
    end
  end
  object fdqListNFEntrada: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT NFENTRADA.NOTAFISCAL, NFENTRADA.ENTRADA, NFENTRADA.EMISSA' +
        'O, NFENTRADA.FORNECEDOR,'
      
        'FORNECEDOR.RAZAOSOCIAL, NFENTRADA.VALORDANOTA, nfentrada.baseicm' +
        's, nfentrada.valoricms,'
      
        'nfentrada.valordoseguro, nfentrada.valordofrete Frete_agregado, ' +
        'nfentrada.outrasdespesas,'
      
        'nfentrada.valordoipi, nfentrada.basesubstituicao, nfentrada.valo' +
        'rsubstituicao ,'
      'coalesce(c_frt.valor_total,0) CH_Frete, NFENTRADA.STATUS,'
      'nfentrada.finalidade_nf,nfentrada.OBSERVACAO_FINALIDADE'
      'FROM NFENTRADA NFENTRADA'
      'JOIN FORNECEDOR FORNECEDOR'
      'ON (FORNECEDOR.FORNECEDOR = NFENTRADA.FORNECEDOR)'
      'left join conhecimento_frete c_frt'
      'on (c_frt.nf_entrada = nfentrada.nfentrada)')
    Left = 54
    Top = 575
  end
  object fdqListNFsaida: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT NFS.EMISSAO, NFS.NFSAIDA NFSAIDA, NFS.DESTINATARIO, NFS.D' +
        'ESTINATARIO_,'
      'NFS.VALORDANOTA, NFS.STATUS, NFS.CANCELADA, CLI.RAZAOSOCIAL'
      'FROM NFSAIDA NFS'
      ''
      'JOIN CLIENTES CLI'
      'ON(CLI.CLIENTE = NFS.DESTINATARIO)'
      ''
      'where nfs.emissao between '#39'05/01/17'#39' and '#39'05/31/17'#39
      'ORDER BY NFS.EMISSAO, NFS.NFSAIDA')
    Left = 54
    Top = 618
  end
  object dspListNFsaida: TDataSetProvider
    DataSet = fdqListNFsaida
    Left = 219
    Top = 618
  end
  object cdsListNFsaida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListNFsaida'
    OnCalcFields = cdsListNFsaidaCalcFields
    Left = 379
    Top = 618
    object cdsListNFsaidaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      Required = True
    end
    object cdsListNFsaidaNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListNFsaidaDESTINATARIO_: TStringField
      FieldName = 'DESTINATARIO_'
      Origin = 'DESTINATARIO_'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
    end
    object cdsListNFsaidaVALORDANOTA: TBCDField
      FieldName = 'VALORDANOTA'
      Origin = 'VALORDANOTA'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsListNFsaidaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object cdsListNFsaidaCANCELADA: TSmallintField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
    object cdsListNFsaidaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object cdsListNFsaidaS_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_STATUS'
      Size = 15
      Calculated = True
    end
  end
  object dspTotCFOP_NFS: TDataSetProvider
    DataSet = fdqTotCFOP_NFS
    Left = 219
    Top = 661
  end
  object cdsTotCFOP_NFS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotCFOP_NFS'
    OnCalcFields = cdsListNFsaidaCalcFields
    Left = 379
    Top = 661
    object cdsTotCFOP_NFSNFSAIDA: TIntegerField
      FieldName = 'NFSAIDA'
      Origin = 'NFSAIDA'
      Required = True
    end
    object cdsTotCFOP_NFSCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsTotCFOP_NFSST: TBCDField
      FieldName = 'ST'
      Origin = 'ST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object dtsListNFSaida: TDataSource
    DataSet = cdsListNFsaida
    Left = 471
    Top = 617
  end
  object rvdTotCFOP_NFS: TRvDataSetConnection
    RuntimeVisibility = rtEndUser
    DataSet = cdsTotCFOP_NFS
    Left = 956
    Top = 531
  end
  object fdqTotCFOP_NFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT NFSAIDA, CFOP, SUM(COALESCE(sub_total - valor_desconto,0)' +
        ') AS ST'
      'FROM itemnfsaida ITNFS'
      ''
      'GROUP BY CFOP, NFSAIDA'
      ''
      'order by cfop')
    Left = 54
    Top = 661
  end
  object dspTotGeralCFOP_NFS: TDataSetProvider
    DataSet = fdqTotGeralCFOP_NFS
    Left = 219
    Top = 705
  end
  object cdsTotGeralCFOP_NFS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotGeralCFOP_NFS'
    OnCalcFields = cdsListNFsaidaCalcFields
    Left = 379
    Top = 705
    object cdsTotGeralCFOP_NFSCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Required = True
      Size = 5
    end
    object cdsTotGeralCFOP_NFSST: TBCDField
      FieldName = 'ST'
      Origin = 'ST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object fdqTotGeralCFOP_NFS: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT CFOP, SUM(COALESCE(sub_total - valor_desconto,0)) AS ST'
      'FROM itemnfsaida ITNFS'
      ''
      
        'where nfsaida in (select nfsaida from nfsaida where emissao betw' +
        'een '#39'01.05.17'#39' and '#39'31.05.17'#39')'
      ''
      'GROUP BY CFOP'
      ''
      'order by cfop')
    Left = 54
    Top = 705
  end
  object rvdTotGeralCFOP_NFS: TRvDataSetConnection
    RuntimeVisibility = rtEndUser
    DataSet = cdsTotGeralCFOP_NFS
    Left = 1068
    Top = 532
  end
end
