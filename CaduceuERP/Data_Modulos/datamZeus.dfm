object dmMZeus: TdmMZeus
  OldCreateOrder = False
  Height = 491
  Width = 1044
  object fdtZeus: TFDTransaction
    Connection = fdcZeusRetail
    Left = 812
    Top = 112
  end
  object fdcZeusRetail: TFDConnection
    ConnectionName = 'fdcZeusRetail'
    Params.Strings = (
      'Server=127.0.0.1'
      'User_Name=sa'
      'Password=zanthus'
      'OSAuthent=No'
      'Database=ZeusRetail'
      'DriverID=MSSQL')
    UpdateOptions.AssignedValues = [uvUpdateMode, uvLockMode, uvRefreshMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.LockMode = lmOptimistic
    UpdateOptions.RefreshMode = rmAll
    LoginPrompt = False
    Transaction = fdtZeus
    UpdateTransaction = fdtZeus
    Left = 812
    Top = 16
  end
  object fdqIntPedidoZeus: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_pedido')
    Left = 39
    Top = 15
  end
  object fdqItemIntPedZeus: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_pedido_item')
    Left = 39
    Top = 61
  end
  object fdqEndEntIntPedZeus: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_endereco_pedido')
    Left = 39
    Top = 107
  end
  object fdqFinalizIntPedZeus: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_pedido_finaliz')
    Left = 39
    Top = 153
  end
  object dspIntPedZeus: TDataSetProvider
    DataSet = fdqIntPedidoZeus
    Left = 152
    Top = 15
  end
  object cdsIntPedZeus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIntPedZeus'
    OnNewRecord = cdsIntPedZeusNewRecord
    Left = 272
    Top = 15
    object cdsIntPedZeuscod_loja: TIntegerField
      FieldName = 'cod_loja'
      Origin = 'cod_loja'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIntPedZeuscod_funcionario_liberador: TIntegerField
      FieldName = 'cod_funcionario_liberador'
      Origin = 'cod_funcionario_liberador'
    end
    object cdsIntPedZeuscod_pedido: TIntegerField
      FieldName = 'cod_pedido'
      Origin = 'cod_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIntPedZeuscod_loja_saida_mercadoria: TIntegerField
      FieldName = 'cod_loja_saida_mercadoria'
      Origin = 'cod_loja_saida_mercadoria'
    end
    object cdsIntPedZeusdata_pedido: TSQLTimeStampField
      FieldName = 'data_pedido'
      Origin = 'data_pedido'
    end
    object cdsIntPedZeusentrega: TStringField
      FieldName = 'entrega'
      Origin = 'entrega'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusdata_entrega: TSQLTimeStampField
      FieldName = 'data_entrega'
      Origin = 'data_entrega'
    end
    object cdsIntPedZeustermo_encomenda: TStringField
      FieldName = 'termo_encomenda'
      Origin = 'termo_encomenda'
      Size = 5
    end
    object cdsIntPedZeusdata_montagem: TSQLTimeStampField
      FieldName = 'data_montagem'
      Origin = 'data_montagem'
    end
    object cdsIntPedZeusnome_cliente: TStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 50
    end
    object cdsIntPedZeusobservacoes: TStringField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Size = 255
    end
    object cdsIntPedZeuscnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 18
    end
    object cdsIntPedZeusinscricao_estadual: TStringField
      FieldName = 'inscricao_estadual'
      Origin = 'inscricao_estadual'
      Size = 18
    end
    object cdsIntPedZeuscodigo_cliente: TStringField
      FieldName = 'codigo_cliente'
      Origin = 'codigo_cliente'
    end
    object cdsIntPedZeussituacao: TStringField
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 10
    end
    object cdsIntPedZeussituacao_erp: TStringField
      FieldName = 'situacao_erp'
      Origin = 'situacao_erp'
      Size = 10
    end
    object cdsIntPedZeuspresente: TStringField
      FieldName = 'presente'
      Origin = 'presente'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusnome_presenteador: TStringField
      FieldName = 'nome_presenteador'
      Origin = 'nome_presenteador'
      Size = 50
    end
    object cdsIntPedZeustelefone_presenteador: TStringField
      FieldName = 'telefone_presenteador'
      Origin = 'telefone_presenteador'
      Size = 50
    end
    object cdsIntPedZeusnumero_ajuste_roupa: TStringField
      FieldName = 'numero_ajuste_roupa'
      Origin = 'numero_ajuste_roupa'
      Size = 10
    end
    object cdsIntPedZeuscod_lista_noiva: TStringField
      FieldName = 'cod_lista_noiva'
      Origin = 'cod_lista_noiva'
      Size = 10
    end
    object cdsIntPedZeususuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 35
    end
    object cdsIntPedZeusdata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object cdsIntPedZeushorario_transacao: TStringField
      FieldName = 'horario_transacao'
      Origin = 'horario_transacao'
      Size = 4
    end
    object cdsIntPedZeusforma_geracao_pedido: TStringField
      FieldName = 'forma_geracao_pedido'
      Origin = 'forma_geracao_pedido'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeuscod_vendedor: TIntegerField
      FieldName = 'cod_vendedor'
      Origin = 'cod_vendedor'
    end
    object cdsIntPedZeusdata_ultima_alteracao: TSQLTimeStampField
      FieldName = 'data_ultima_alteracao'
      Origin = 'data_ultima_alteracao'
    end
    object cdsIntPedZeuscontrole: TStringField
      FieldName = 'controle'
      Origin = 'controle'
      Size = 3
    end
    object cdsIntPedZeusvalor_desconto: TBCDField
      FieldName = 'valor_desconto'
      Origin = 'valor_desconto'
      Precision = 12
      Size = 2
    end
    object cdsIntPedZeuscod_motivo_desconto: TIntegerField
      FieldName = 'cod_motivo_desconto'
      Origin = 'cod_motivo_desconto'
    end
    object cdsIntPedZeusnum_itens_pedido: TIntegerField
      FieldName = 'num_itens_pedido'
      Origin = 'num_itens_pedido'
    end
    object cdsIntPedZeusvalor_pedido: TBCDField
      FieldName = 'valor_pedido'
      Origin = 'valor_pedido'
      Precision = 12
      Size = 2
    end
    object cdsIntPedZeusdata_encomenda: TSQLTimeStampField
      FieldName = 'data_encomenda'
      Origin = 'data_encomenda'
    end
    object cdsIntPedZeusdata_entrega_encomenda: TSQLTimeStampField
      FieldName = 'data_entrega_encomenda'
      Origin = 'data_entrega_encomenda'
    end
    object cdsIntPedZeusvalor_desconto_adicional: TBCDField
      FieldName = 'valor_desconto_adicional'
      Origin = 'valor_desconto_adicional'
      Precision = 12
      Size = 2
    end
    object cdsIntPedZeusvalidade_proposta: TSQLTimeStampField
      FieldName = 'validade_proposta'
      Origin = 'validade_proposta'
    end
    object cdsIntPedZeussessao_plano_pgto: TStringField
      FieldName = 'sessao_plano_pgto'
      Origin = 'sessao_plano_pgto'
      Size = 255
    end
    object cdsIntPedZeusnum_prevenda: TBCDField
      FieldName = 'num_prevenda'
      Origin = 'num_prevenda'
      Precision = 10
      Size = 0
    end
    object cdsIntPedZeusnum_dav: TBCDField
      FieldName = 'num_dav'
      Origin = 'num_dav'
      Precision = 10
      Size = 0
    end
    object cdsIntPedZeussituacao_dav: TSmallintField
      FieldName = 'situacao_dav'
      Origin = 'situacao_dav'
    end
    object cdsIntPedZeusdata_dav: TSQLTimeStampField
      FieldName = 'data_dav'
      Origin = 'data_dav'
    end
    object cdsIntPedZeuspdv_emissao: TIntegerField
      FieldName = 'pdv_emissao'
      Origin = 'pdv_emissao'
    end
    object cdsIntPedZeuscoo_emissao: TIntegerField
      FieldName = 'coo_emissao'
      Origin = 'coo_emissao'
    end
    object cdsIntPedZeuspdv_venda: TIntegerField
      FieldName = 'pdv_venda'
      Origin = 'pdv_venda'
    end
    object cdsIntPedZeuscoo_venda: TIntegerField
      FieldName = 'coo_venda'
      Origin = 'coo_venda'
    end
    object cdsIntPedZeusdata_venda: TSQLTimeStampField
      FieldName = 'data_venda'
      Origin = 'data_venda'
    end
    object cdsIntPedZeuspdv_cancelamento: TIntegerField
      FieldName = 'pdv_cancelamento'
      Origin = 'pdv_cancelamento'
    end
    object cdsIntPedZeuscoo_cancelamento: TIntegerField
      FieldName = 'coo_cancelamento'
      Origin = 'coo_cancelamento'
    end
    object cdsIntPedZeusassinatura: TStringField
      FieldName = 'assinatura'
      Origin = 'assinatura'
      Size = 500
    end
    object cdsIntPedZeuschave_pdv: TStringField
      FieldName = 'chave_pdv'
      Origin = 'chave_pdv'
      Size = 200
    end
    object cdsIntPedZeususo_interno: TStringField
      FieldName = 'uso_interno'
      Origin = 'uso_interno'
      Size = 2000
    end
    object cdsIntPedZeusnum_linhas_item: TIntegerField
      FieldName = 'num_linhas_item'
      Origin = 'num_linhas_item'
    end
    object cdsIntPedZeuspreco_tipo_venda_usado: TStringField
      FieldName = 'preco_tipo_venda_usado'
      Origin = 'preco_tipo_venda_usado'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusproibicao_venda_tipo_1: TStringField
      FieldName = 'proibicao_venda_tipo_1'
      Origin = 'proibicao_venda_tipo_1'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusproibicao_venda_tipo_2: TStringField
      FieldName = 'proibicao_venda_tipo_2'
      Origin = 'proibicao_venda_tipo_2'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusproibicao_venda_tipo_3: TStringField
      FieldName = 'proibicao_venda_tipo_3'
      Origin = 'proibicao_venda_tipo_3'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusproibicao_venda_tipo_4: TStringField
      FieldName = 'proibicao_venda_tipo_4'
      Origin = 'proibicao_venda_tipo_4'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusproibicao_venda_tipo_5: TStringField
      FieldName = 'proibicao_venda_tipo_5'
      Origin = 'proibicao_venda_tipo_5'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusopcao_mensagem: TIntegerField
      FieldName = 'opcao_mensagem'
      Origin = 'opcao_mensagem'
    end
    object cdsIntPedZeusvalor_acrescimo: TBCDField
      FieldName = 'valor_acrescimo'
      Origin = 'valor_acrescimo'
      Precision = 12
      Size = 2
    end
    object cdsIntPedZeusvalor_acrescimo_adicional: TBCDField
      FieldName = 'valor_acrescimo_adicional'
      Origin = 'valor_acrescimo_adicional'
      Precision = 12
      Size = 2
    end
    object cdsIntPedZeuspedido_ja_conferido: TStringField
      FieldName = 'pedido_ja_conferido'
      Origin = 'pedido_ja_conferido'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusflg_pedido_exclusivo: TStringField
      FieldName = 'flg_pedido_exclusivo'
      Origin = 'flg_pedido_exclusivo'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeustipo_cancelamento: TBCDField
      FieldName = 'tipo_cancelamento'
      Origin = 'tipo_cancelamento'
      Precision = 1
      Size = 0
    end
    object cdsIntPedZeusflg_integracao_01: TIntegerField
      FieldName = 'flg_integracao_01'
      Origin = 'flg_integracao_01'
    end
    object cdsIntPedZeusdth_integracao_01: TSQLTimeStampField
      FieldName = 'dth_integracao_01'
      Origin = 'dth_integracao_01'
    end
    object cdsIntPedZeusflg_integracao_02: TIntegerField
      FieldName = 'flg_integracao_02'
      Origin = 'flg_integracao_02'
    end
    object cdsIntPedZeusdth_integracao_02: TSQLTimeStampField
      FieldName = 'dth_integracao_02'
      Origin = 'dth_integracao_02'
    end
    object cdsIntPedZeusflg_pedido_especial: TStringField
      FieldName = 'flg_pedido_especial'
      Origin = 'flg_pedido_especial'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusobservacoes_2: TStringField
      FieldName = 'observacoes_2'
      Origin = 'observacoes_2'
      Size = 2000
    end
    object cdsIntPedZeusflg_tipo_cobranca_frete: TStringField
      FieldName = 'flg_tipo_cobranca_frete'
      Origin = 'flg_tipo_cobranca_frete'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusflg_venda_para_exterior: TStringField
      FieldName = 'flg_venda_para_exterior'
      Origin = 'flg_venda_para_exterior'
      FixedChar = True
      Size = 1
    end
    object cdsIntPedZeusqtde_volumes: TIntegerField
      FieldName = 'qtde_volumes'
    end
    object cdsIntPedZeusespecie_volumes: TStringField
      FieldName = 'especie_volumes'
      Size = 50
    end
    object cdsIntPedZeusmarca_volumes: TStringField
      FieldName = 'marca_volumes'
      Size = 50
    end
    object cdsIntPedZeusnumeracao_volumes: TStringField
      FieldName = 'numeracao_volumes'
      Size = 50
    end
    object cdsIntPedZeuspeso_bruto: TBCDField
      FieldName = 'peso_bruto'
      Precision = 12
      Size = 3
    end
    object cdsIntPedZeuspeso_liquido: TBCDField
      FieldName = 'peso_liquido'
      Precision = 12
      Size = 3
    end
  end
  object cdsIntItemPedidoZeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspIntItemPedidoZeus'
    OnNewRecord = cdsIntItemPedidoZeusNewRecord
    Left = 272
    Top = 61
    object cdsIntItemPedidoZeuscod_loja: TIntegerField
      FieldName = 'cod_loja'
      Required = True
    end
    object cdsIntItemPedidoZeuscod_pedido: TIntegerField
      FieldName = 'cod_pedido'
      Required = True
    end
    object cdsIntItemPedidoZeuscod_pedido_item: TIntegerField
      FieldName = 'cod_pedido_item'
      Required = True
    end
    object cdsIntItemPedidoZeuscod_mercadoria: TStringField
      FieldName = 'cod_mercadoria'
      Size = 17
    end
    object cdsIntItemPedidoZeuscod_vendedor: TIntegerField
      FieldName = 'cod_vendedor'
    end
    object cdsIntItemPedidoZeusobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 200
    end
    object cdsIntItemPedidoZeususuario: TStringField
      FieldName = 'usuario'
      Size = 35
    end
    object cdsIntItemPedidoZeusdata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
    end
    object cdsIntItemPedidoZeusdata_ultima_alteracao: TSQLTimeStampField
      FieldName = 'data_ultima_alteracao'
    end
    object cdsIntItemPedidoZeuscontrole: TStringField
      FieldName = 'controle'
      FixedChar = True
      Size = 3
    end
    object cdsIntItemPedidoZeuscod_departamento: TIntegerField
      FieldName = 'cod_departamento'
    end
    object cdsIntItemPedidoZeuscod_tributacao: TIntegerField
      FieldName = 'cod_tributacao'
    end
    object cdsIntItemPedidoZeuscomplemento_descricao_mercador: TStringField
      FieldName = 'complemento_descricao_mercador'
      Size = 88
    end
    object cdsIntItemPedidoZeusgrupo_garantia_extendida: TIntegerField
      FieldName = 'grupo_garantia_extendida'
    end
    object cdsIntItemPedidoZeusopcao_grupo: TIntegerField
      FieldName = 'opcao_grupo'
    end
    object cdsIntItemPedidoZeusvigencia_garantia: TIntegerField
      FieldName = 'vigencia_garantia'
    end
    object cdsIntItemPedidoZeustipo_assistencia_tecnica: TIntegerField
      FieldName = 'tipo_assistencia_tecnica'
    end
    object cdsIntItemPedidoZeusvalor_garantia: TBCDField
      FieldName = 'valor_garantia'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeusquantidade: TBCDField
      FieldName = 'quantidade'
      Precision = 9
      Size = 3
    end
    object cdsIntItemPedidoZeuspreco_unitario: TBCDField
      FieldName = 'preco_unitario'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeusvalor_desconto: TBCDField
      FieldName = 'valor_desconto'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeuscod_motivo_desconto: TIntegerField
      FieldName = 'cod_motivo_desconto'
    end
    object cdsIntItemPedidoZeusaliquota_tributacao: TBCDField
      FieldName = 'aliquota_tributacao'
      Precision = 5
      Size = 2
    end
    object cdsIntItemPedidoZeusgarantia_fabricante: TIntegerField
      FieldName = 'garantia_fabricante'
    end
    object cdsIntItemPedidoZeusentrega: TStringField
      FieldName = 'entrega'
      FixedChar = True
      Size = 1
    end
    object cdsIntItemPedidoZeusencomenda: TStringField
      FieldName = 'encomenda'
      FixedChar = True
      Size = 1
    end
    object cdsIntItemPedidoZeusdata_encomenda: TSQLTimeStampField
      FieldName = 'data_encomenda'
    end
    object cdsIntItemPedidoZeusdata_entrega_prod: TSQLTimeStampField
      FieldName = 'data_entrega_prod'
    end
    object cdsIntItemPedidoZeusdata_montagem: TSQLTimeStampField
      FieldName = 'data_montagem'
    end
    object cdsIntItemPedidoZeusvalor_desconto_adicional: TBCDField
      FieldName = 'valor_desconto_adicional'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeusnum_lote: TStringField
      FieldName = 'num_lote'
    end
    object cdsIntItemPedidoZeusnum_serie: TStringField
      FieldName = 'num_serie'
    end
    object cdsIntItemPedidoZeuscod_local: TIntegerField
      FieldName = 'cod_local'
    end
    object cdsIntItemPedidoZeuscod_loja_reserva: TIntegerField
      FieldName = 'cod_loja_reserva'
    end
    object cdsIntItemPedidoZeussituacao: TStringField
      FieldName = 'situacao'
      FixedChar = True
      Size = 1
    end
    object cdsIntItemPedidoZeusnum_dav: TBCDField
      FieldName = 'num_dav'
      Precision = 10
      Size = 0
    end
    object cdsIntItemPedidoZeusassinatura: TStringField
      FieldName = 'assinatura'
      Size = 500
    end
    object cdsIntItemPedidoZeusdata_cupom: TSQLTimeStampField
      FieldName = 'data_cupom'
    end
    object cdsIntItemPedidoZeusloja_cupom: TIntegerField
      FieldName = 'loja_cupom'
    end
    object cdsIntItemPedidoZeuspdv_cupom: TIntegerField
      FieldName = 'pdv_cupom'
    end
    object cdsIntItemPedidoZeusnum_cupom: TIntegerField
      FieldName = 'num_cupom'
    end
    object cdsIntItemPedidoZeusvalor_acrescimo: TBCDField
      FieldName = 'valor_acrescimo'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeusvalor_acrescimo_adicional: TBCDField
      FieldName = 'valor_acrescimo_adicional'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeusdocumento_registro: TSmallintField
      FieldName = 'documento_registro'
    end
    object cdsIntItemPedidoZeusitem_ja_conferido: TStringField
      FieldName = 'item_ja_conferido'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsIntItemPedidoZeusdata_cupom_doc_fiscal: TSQLTimeStampField
      FieldName = 'data_cupom_doc_fiscal'
    end
    object cdsIntItemPedidoZeusloja_cupom_doc_fiscal: TIntegerField
      FieldName = 'loja_cupom_doc_fiscal'
    end
    object cdsIntItemPedidoZeuspdv_cupom_doc_fiscal: TIntegerField
      FieldName = 'pdv_cupom_doc_fiscal'
    end
    object cdsIntItemPedidoZeusnum_cupom_doc_fiscal: TIntegerField
      FieldName = 'num_cupom_doc_fiscal'
    end
    object cdsIntItemPedidoZeusval_desconto_promocao: TBCDField
      FieldName = 'val_desconto_promocao'
      Precision = 12
      Size = 2
    end
    object cdsIntItemPedidoZeuscod_promocao: TIntegerField
      FieldName = 'cod_promocao'
    end
    object cdsIntItemPedidoZeusflags: TIntegerField
      FieldName = 'flags'
      Required = True
    end
    object cdsIntItemPedidoZeuspeso_bruto: TBCDField
      FieldName = 'peso_bruto'
      Precision = 12
      Size = 3
    end
    object cdsIntItemPedidoZeuspeso_liquido: TBCDField
      FieldName = 'peso_liquido'
      Precision = 12
      Size = 3
    end
  end
  object dspIntItemPedidoZeus: TDataSetProvider
    DataSet = fdqItemIntPedZeus
    Left = 152
    Top = 61
  end
  object dspIntEndEntregaZeus: TDataSetProvider
    DataSet = fdqEndEntIntPedZeus
    Left = 152
    Top = 107
  end
  object cdsIntEndEntregaZeus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIntEndEntregaZeus'
    Left = 272
    Top = 107
    object cdsIntEndEntregaZeuscod_loja: TIntegerField
      FieldName = 'cod_loja'
      Required = True
    end
    object cdsIntEndEntregaZeuscod_pedido: TIntegerField
      FieldName = 'cod_pedido'
      Required = True
    end
    object cdsIntEndEntregaZeustelefone_entrega: TStringField
      FieldName = 'telefone_entrega'
    end
    object cdsIntEndEntregaZeusapelido_endereco: TStringField
      FieldName = 'apelido_endereco'
      Size = 50
    end
    object cdsIntEndEntregaZeusrua: TStringField
      FieldName = 'rua'
      Size = 40
    end
    object cdsIntEndEntregaZeusnumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object cdsIntEndEntregaZeuscomplemento: TStringField
      FieldName = 'complemento'
    end
    object cdsIntEndEntregaZeusbairro: TStringField
      FieldName = 'bairro'
      Size = 32
    end
    object cdsIntEndEntregaZeuscidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object cdsIntEndEntregaZeusuf: TStringField
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
    object cdsIntEndEntregaZeuscep: TStringField
      FieldName = 'cep'
      FixedChar = True
      Size = 9
    end
    object cdsIntEndEntregaZeustransportadora: TStringField
      FieldName = 'transportadora'
      Size = 50
    end
    object cdsIntEndEntregaZeusreferencia: TStringField
      FieldName = 'referencia'
      Size = 40
    end
    object cdsIntEndEntregaZeustelefone_transportadora: TStringField
      FieldName = 'telefone_transportadora'
    end
    object cdsIntEndEntregaZeusrua_transportadora: TStringField
      FieldName = 'rua_transportadora'
      Size = 40
    end
    object cdsIntEndEntregaZeusnumero_transportadora: TStringField
      FieldName = 'numero_transportadora'
      Size = 10
    end
    object cdsIntEndEntregaZeuscomplemento_transportadora: TStringField
      FieldName = 'complemento_transportadora'
    end
    object cdsIntEndEntregaZeusbairro_transportadora: TStringField
      FieldName = 'bairro_transportadora'
    end
    object cdsIntEndEntregaZeuscidade_transportadora: TStringField
      FieldName = 'cidade_transportadora'
      Size = 40
    end
    object cdsIntEndEntregaZeusuf_transportadora: TStringField
      FieldName = 'uf_transportadora'
      FixedChar = True
      Size = 2
    end
    object cdsIntEndEntregaZeuscep_transportadora: TStringField
      FieldName = 'cep_transportadora'
      FixedChar = True
      Size = 9
    end
    object cdsIntEndEntregaZeushorario_transacao: TStringField
      FieldName = 'horario_transacao'
      Size = 4
    end
    object cdsIntEndEntregaZeuscod_transportadora: TIntegerField
      FieldName = 'cod_transportadora'
    end
    object cdsIntEndEntregaZeusid_municipio: TIntegerField
      FieldName = 'id_municipio'
    end
  end
  object cdsIntFinalizPedZeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspIntFinalizPedZeus'
    Left = 272
    Top = 153
    object cdsIntFinalizPedZeuscod_loja: TIntegerField
      FieldName = 'cod_loja'
      Required = True
    end
    object cdsIntFinalizPedZeuscod_pedido: TIntegerField
      FieldName = 'cod_pedido'
      Required = True
    end
    object cdsIntFinalizPedZeuscod_pedido_ordem_finaliz: TIntegerField
      FieldName = 'cod_pedido_ordem_finaliz'
      Required = True
    end
    object cdsIntFinalizPedZeuscod_finalizadora: TIntegerField
      FieldName = 'cod_finalizadora'
    end
    object cdsIntFinalizPedZeusval_finalizado: TBCDField
      FieldName = 'val_finalizado'
      Precision = 12
      Size = 2
    end
    object cdsIntFinalizPedZeuscod_cliente: TLargeintField
      FieldName = 'cod_cliente'
    end
    object cdsIntFinalizPedZeusnum_doc1: TLargeintField
      FieldName = 'num_doc1'
    end
    object cdsIntFinalizPedZeusnum_doc2: TLargeintField
      FieldName = 'num_doc2'
    end
    object cdsIntFinalizPedZeusnum_doc3: TLargeintField
      FieldName = 'num_doc3'
    end
    object cdsIntFinalizPedZeusnum_doc4: TLargeintField
      FieldName = 'num_doc4'
    end
    object cdsIntFinalizPedZeusnum_doc5: TLargeintField
      FieldName = 'num_doc5'
    end
    object cdsIntFinalizPedZeusnum_doc6: TLargeintField
      FieldName = 'num_doc6'
    end
    object cdsIntFinalizPedZeusdata_informada: TSQLTimeStampField
      FieldName = 'data_informada'
    end
    object cdsIntFinalizPedZeusCMC_7: TStringField
      FieldName = 'CMC_7'
      Size = 50
    end
    object cdsIntFinalizPedZeuscod_plano: TIntegerField
      FieldName = 'cod_plano'
    end
    object cdsIntFinalizPedZeusqtd_parcelas: TIntegerField
      FieldName = 'qtd_parcelas'
    end
    object cdsIntFinalizPedZeusclasse: TIntegerField
      FieldName = 'classe'
    end
  end
  object dspIntFinalizPedZeus: TDataSetProvider
    DataSet = fdqFinalizIntPedZeus
    Left = 152
    Top = 153
  end
  object fdqProdutos_Zeus: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from tab_mercadoria_tipo_venda')
    Left = 39
    Top = 198
  end
  object cdsProdutos_Zeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspProdutos_Zeus'
    Left = 272
    Top = 198
    object cdsProdutos_Zeuscod_loja: TIntegerField
      FieldName = 'cod_loja'
      Required = True
    end
    object cdsProdutos_Zeuscontrole: TStringField
      FieldName = 'controle'
      Size = 3
    end
    object cdsProdutos_Zeuscod_mercadoria: TStringField
      FieldName = 'cod_mercadoria'
      Required = True
      Size = 17
    end
    object cdsProdutos_Zeuscod_tipo_venda: TIntegerField
      FieldName = 'cod_tipo_venda'
      Required = True
    end
    object cdsProdutos_Zeususuario: TStringField
      FieldName = 'usuario'
      Size = 35
    end
    object cdsProdutos_Zeusdata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
    end
    object cdsProdutos_Zeusdata_ultima_alteracao: TSQLTimeStampField
      FieldName = 'data_ultima_alteracao'
    end
    object cdsProdutos_Zeuspreco_unitario: TBCDField
      FieldName = 'preco_unitario'
      Precision = 11
      Size = 2
    end
    object cdsProdutos_Zeuspercentual_comissao_vendedor: TBCDField
      FieldName = 'percentual_comissao_vendedor'
      Precision = 5
      Size = 2
    end
  end
  object dspProdutos_Zeus: TDataSetProvider
    DataSet = fdqProdutos_Zeus
    Left = 152
    Top = 198
  end
  object fddMSQLMaster: TFDPhysMSSQLDriverLink
    Left = 813
    Top = 160
  end
  object fdqMercadorias_Zeus: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from tab_mercadoria')
    Left = 39
    Top = 243
  end
  object cdsMercadorias_Zeus: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspMercadoras_Zeus'
    Left = 272
    Top = 243
    object cdsMercadorias_Zeuscod_mercadoria: TStringField
      FieldName = 'cod_mercadoria'
      Required = True
      Size = 17
    end
    object cdsMercadorias_Zeusdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dspMercadoras_Zeus: TDataSetProvider
    DataSet = fdqMercadorias_Zeus
    Left = 152
    Top = 243
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 816
    Top = 216
  end
  object fdqTextoLinha: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from tab_texto_linha'
      'where cod_linha = 120000')
    Left = 39
    Top = 403
  end
  object cdsTextoLinha: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspTextoLinha'
    Left = 272
    Top = 403
    object cdsTextoLinhacod_loja: TIntegerField
      FieldName = 'cod_loja'
      Required = True
    end
    object cdsTextoLinhacod_texto: TIntegerField
      FieldName = 'cod_texto'
      Required = True
    end
    object cdsTextoLinhacod_linha: TIntegerField
      FieldName = 'cod_linha'
      Required = True
    end
    object cdsTextoLinhatipo_linha: TStringField
      FieldName = 'tipo_linha'
      FixedChar = True
      Size = 1
    end
    object cdsTextoLinhalinha: TStringField
      FieldName = 'linha'
      Size = 60
    end
    object cdsTextoLinhaalinhamento: TStringField
      FieldName = 'alinhamento'
      FixedChar = True
      Size = 2
    end
    object cdsTextoLinhausuario: TStringField
      FieldName = 'usuario'
      Size = 35
    end
    object cdsTextoLinhadata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
    end
    object cdsTextoLinhadata_ultima_alteracao: TSQLTimeStampField
      FieldName = 'data_ultima_alteracao'
    end
  end
  object dspTextoLinha: TDataSetProvider
    DataSet = fdqTextoLinha
    Left = 152
    Top = 403
  end
  object fdqCupoms: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m01')
    Left = 39
    Top = 287
  end
  object cdsCupoms: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCupoms'
    Left = 272
    Top = 287
    object cdsCupomsM00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsCupomsM00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsCupomsM00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsCupomsM00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsCupomsM00AD: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'M00AD'
      Required = True
    end
    object cdsCupomsM00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsCupomsM01AB: TStringField
      FieldName = 'M01AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsCupomsM01ZC: TSmallintField
      FieldName = 'M01ZC'
      Required = True
    end
    object cdsCupomsM01ZB: TSmallintField
      FieldName = 'M01ZB'
    end
    object cdsCupomsM01ZZA01: TSmallintField
      FieldName = 'M01ZZA01'
      Required = True
    end
    object cdsCupomsM01ZZA02: TSmallintField
      FieldName = 'M01ZZA02'
      Required = True
    end
    object cdsCupomsM01ZZA03: TSmallintField
      FieldName = 'M01ZZA03'
      Required = True
    end
    object cdsCupomsM01ZZA04: TSmallintField
      FieldName = 'M01ZZA04'
      Required = True
    end
    object cdsCupomsM01ZZA05: TSmallintField
      FieldName = 'M01ZZA05'
      Required = True
    end
    object cdsCupomsM01ZZA06: TIntegerField
      FieldName = 'M01ZZA06'
    end
    object cdsCupomsM01ZZA07: TIntegerField
      FieldName = 'M01ZZA07'
    end
    object cdsCupomsM01ZZA08: TIntegerField
      FieldName = 'M01ZZA08'
    end
    object cdsCupomsM01ZZA09: TIntegerField
      FieldName = 'M01ZZA09'
    end
    object cdsCupomsM01ZZA10: TIntegerField
      FieldName = 'M01ZZA10'
    end
    object cdsCupomsM01ZZB01: TSmallintField
      FieldName = 'M01ZZB01'
      Required = True
    end
    object cdsCupomsM01ZZB02: TSmallintField
      FieldName = 'M01ZZB02'
      Required = True
    end
    object cdsCupomsM01ZZB03: TSmallintField
      FieldName = 'M01ZZB03'
      Required = True
    end
    object cdsCupomsM01ZZB04: TSmallintField
      FieldName = 'M01ZZB04'
      Required = True
    end
    object cdsCupomsM01ZZB05: TSmallintField
      FieldName = 'M01ZZB05'
      Required = True
    end
    object cdsCupomsM01ZZB06: TIntegerField
      FieldName = 'M01ZZB06'
    end
    object cdsCupomsM01ZZB07: TIntegerField
      FieldName = 'M01ZZB07'
    end
    object cdsCupomsM01ZZB08: TIntegerField
      FieldName = 'M01ZZB08'
    end
    object cdsCupomsM01ZZB09: TIntegerField
      FieldName = 'M01ZZB09'
    end
    object cdsCupomsM01ZZB10: TIntegerField
      FieldName = 'M01ZZB10'
    end
    object cdsCupomsDATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsCupomsDATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsCupomsDATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsCupomsDATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsCupomsDATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsCupomsDATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsCupomsDATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsCupomsDATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsCupomsDATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsCupomsDATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsCupomscupom_cancelamento: TIntegerField
      FieldName = 'cupom_cancelamento'
      Required = True
    end
    object cdsCupomsM01AE: TSmallintField
      FieldName = 'M01AE'
    end
    object cdsCupomsM01AG: TSmallintField
      FieldName = 'M01AG'
    end
    object cdsCupomsM01AH: TIntegerField
      FieldName = 'M01AH'
    end
    object cdsCupomsM01AI: TSmallintField
      FieldName = 'M01AI'
    end
    object cdsCupomsM01AJ: TBCDField
      FieldName = 'M01AJ'
      Precision = 10
      Size = 3
    end
    object cdsCupomsM01AK: TBCDField
      FieldName = 'M01AK'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01AL: TIntegerField
      FieldName = 'M01AL'
    end
    object cdsCupomsM01AM: TBCDField
      FieldName = 'M01AM'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01AN: TIntegerField
      FieldName = 'M01AN'
    end
    object cdsCupomsM01AO: TBCDField
      FieldName = 'M01AO'
      Precision = 10
      Size = 3
    end
    object cdsCupomsM01AP: TBCDField
      FieldName = 'M01AP'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01AQ: TIntegerField
      FieldName = 'M01AQ'
    end
    object cdsCupomsM01AR: TBCDField
      FieldName = 'M01AR'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01AS: TIntegerField
      FieldName = 'M01AS'
    end
    object cdsCupomsM01ATA: TSmallintField
      FieldName = 'M01ATA'
    end
    object cdsCupomsM01ATB: TBCDField
      FieldName = 'M01ATB'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATC01: TIntegerField
      FieldName = 'M01ATC01'
    end
    object cdsCupomsM01ATC02: TBCDField
      FieldName = 'M01ATC02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATD01: TIntegerField
      FieldName = 'M01ATD01'
    end
    object cdsCupomsM01ATD02: TBCDField
      FieldName = 'M01ATD02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATE01: TIntegerField
      FieldName = 'M01ATE01'
    end
    object cdsCupomsM01ATE02: TBCDField
      FieldName = 'M01ATE02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATF01: TIntegerField
      FieldName = 'M01ATF01'
    end
    object cdsCupomsM01ATF02: TBCDField
      FieldName = 'M01ATF02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATG01: TIntegerField
      FieldName = 'M01ATG01'
    end
    object cdsCupomsM01ATG02: TBCDField
      FieldName = 'M01ATG02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATH01: TIntegerField
      FieldName = 'M01ATH01'
    end
    object cdsCupomsM01ATH02: TBCDField
      FieldName = 'M01ATH02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATI01: TIntegerField
      FieldName = 'M01ATI01'
    end
    object cdsCupomsM01ATI02: TBCDField
      FieldName = 'M01ATI02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATJ01: TIntegerField
      FieldName = 'M01ATJ01'
    end
    object cdsCupomsM01ATJ02: TBCDField
      FieldName = 'M01ATJ02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATK01: TIntegerField
      FieldName = 'M01ATK01'
    end
    object cdsCupomsM01ATK02: TBCDField
      FieldName = 'M01ATK02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01ATL01: TIntegerField
      FieldName = 'M01ATL01'
    end
    object cdsCupomsM01ATL02: TBCDField
      FieldName = 'M01ATL02'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01AU: TSmallintField
      FieldName = 'M01AU'
    end
    object cdsCupomsM01AV: TStringField
      FieldName = 'M01AV'
    end
    object cdsCupomsM01AW: TIntegerField
      FieldName = 'M01AW'
    end
    object cdsCupomsM01AX: TIntegerField
      FieldName = 'M01AX'
    end
    object cdsCupomsM01AY: TIntegerField
      FieldName = 'M01AY'
    end
    object cdsCupomsM01AZ: TIntegerField
      FieldName = 'M01AZ'
    end
    object cdsCupomsM01BA: TIntegerField
      FieldName = 'M01BA'
    end
    object cdsCupomsM01BB: TBCDField
      FieldName = 'M01BB'
      Precision = 9
      Size = 2
    end
    object cdsCupomsM01BC: TBCDField
      FieldName = 'M01BC'
      Precision = 9
      Size = 2
    end
    object cdsCupomsM01BD: TSmallintField
      FieldName = 'M01BD'
    end
    object cdsCupomsM01BE: TSmallintField
      FieldName = 'M01BE'
    end
    object cdsCupomsM01BG: TSmallintField
      FieldName = 'M01BG'
    end
    object cdsCupomsM01BI: TSmallintField
      FieldName = 'M01BI'
    end
    object cdsCupomsM01BJ: TStringField
      FieldName = 'M01BJ'
    end
    object cdsCupomsM01BK: TSmallintField
      FieldName = 'M01BK'
    end
    object cdsCupomsM01BL: TStringField
      FieldName = 'M01BL'
    end
    object cdsCupomsM01BM: TSmallintField
      FieldName = 'M01BM'
    end
    object cdsCupomsM01BN: TStringField
      FieldName = 'M01BN'
    end
    object cdsCupomsM01BO: TIntegerField
      FieldName = 'M01BO'
    end
    object cdsCupomsM01BP: TIntegerField
      FieldName = 'M01BP'
    end
    object cdsCupomsM01BQ: TIntegerField
      FieldName = 'M01BQ'
    end
    object cdsCupomsM01BR: TBCDField
      FieldName = 'M01BR'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01BS: TIntegerField
      FieldName = 'M01BS'
    end
    object cdsCupomsM01BT: TSmallintField
      FieldName = 'M01BT'
    end
    object cdsCupomsM01BU: TSmallintField
      FieldName = 'M01BU'
    end
    object cdsCupomsM01BV: TStringField
      FieldName = 'M01BV'
      Size = 15
    end
    object cdsCupomsM01BW: TIntegerField
      FieldName = 'M01BW'
    end
    object cdsCupomsM01BX: TIntegerField
      FieldName = 'M01BX'
    end
    object cdsCupomsM01BY: TBCDField
      FieldName = 'M01BY'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01BZ: TSmallintField
      FieldName = 'M01BZ'
    end
    object cdsCupomsM01CA: TBCDField
      FieldName = 'M01CA'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CB: TBCDField
      FieldName = 'M01CB'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CC: TBCDField
      FieldName = 'M01CC'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CD: TBCDField
      FieldName = 'M01CD'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CE: TStringField
      FieldName = 'M01CE'
    end
    object cdsCupomsM01CF: TSmallintField
      FieldName = 'M01CF'
    end
    object cdsCupomsM01CG00: TSmallintField
      FieldName = 'M01CG00'
    end
    object cdsCupomsM01CG01: TSmallintField
      FieldName = 'M01CG01'
    end
    object cdsCupomsM01CG10: TSmallintField
      FieldName = 'M01CG10'
    end
    object cdsCupomsM01CG11: TStringField
      FieldName = 'M01CG11'
      Size = 30
    end
    object cdsCupomsM01CG20: TSmallintField
      FieldName = 'M01CG20'
    end
    object cdsCupomsM01CG21: TStringField
      FieldName = 'M01CG21'
      Size = 30
    end
    object cdsCupomsM01CG30: TSmallintField
      FieldName = 'M01CG30'
    end
    object cdsCupomsM01CG31: TStringField
      FieldName = 'M01CG31'
      Size = 30
    end
    object cdsCupomsM01CH: TIntegerField
      FieldName = 'M01CH'
    end
    object cdsCupomsM01CIA: TBCDField
      FieldName = 'M01CIA'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CIB: TBCDField
      FieldName = 'M01CIB'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CIC: TBCDField
      FieldName = 'M01CIC'
      Precision = 12
      Size = 2
    end
    object cdsCupomsM01CID: TBCDField
      FieldName = 'M01CID'
      Precision = 12
      Size = 2
    end
  end
  object dspCupoms: TDataSetProvider
    DataSet = fdqCupoms
    Left = 152
    Top = 287
  end
  object fdqItemCupom: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m03')
    Left = 39
    Top = 331
  end
  object cdsItemCupom: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItemCupom'
    Left = 272
    Top = 331
    object cdsItemCupomM00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsItemCupomM00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsItemCupomM00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsItemCupomM00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsItemCupomM00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsItemCupomM00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsItemCupomM03AB: TStringField
      FieldName = 'M03AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsItemCupomM03ZC: TSmallintField
      FieldName = 'M03ZC'
      Required = True
    end
    object cdsItemCupomM03ZB: TSmallintField
      FieldName = 'M03ZB'
    end
    object cdsItemCupomM03ZZA01: TSmallintField
      FieldName = 'M03ZZA01'
      Required = True
    end
    object cdsItemCupomM03ZZA02: TSmallintField
      FieldName = 'M03ZZA02'
      Required = True
    end
    object cdsItemCupomM03ZZA03: TSmallintField
      FieldName = 'M03ZZA03'
      Required = True
    end
    object cdsItemCupomM03ZZA04: TSmallintField
      FieldName = 'M03ZZA04'
      Required = True
    end
    object cdsItemCupomM03ZZA05: TSmallintField
      FieldName = 'M03ZZA05'
      Required = True
    end
    object cdsItemCupomM03ZZA06: TIntegerField
      FieldName = 'M03ZZA06'
    end
    object cdsItemCupomM03ZZA07: TIntegerField
      FieldName = 'M03ZZA07'
    end
    object cdsItemCupomM03ZZA08: TIntegerField
      FieldName = 'M03ZZA08'
    end
    object cdsItemCupomM03ZZA09: TIntegerField
      FieldName = 'M03ZZA09'
    end
    object cdsItemCupomM03ZZA10: TIntegerField
      FieldName = 'M03ZZA10'
    end
    object cdsItemCupomM03ZZB01: TSmallintField
      FieldName = 'M03ZZB01'
      Required = True
    end
    object cdsItemCupomM03ZZB02: TSmallintField
      FieldName = 'M03ZZB02'
      Required = True
    end
    object cdsItemCupomM03ZZB03: TSmallintField
      FieldName = 'M03ZZB03'
      Required = True
    end
    object cdsItemCupomM03ZZB04: TSmallintField
      FieldName = 'M03ZZB04'
      Required = True
    end
    object cdsItemCupomM03ZZB05: TSmallintField
      FieldName = 'M03ZZB05'
      Required = True
    end
    object cdsItemCupomM03ZZB06: TIntegerField
      FieldName = 'M03ZZB06'
    end
    object cdsItemCupomM03ZZB07: TIntegerField
      FieldName = 'M03ZZB07'
    end
    object cdsItemCupomM03ZZB08: TIntegerField
      FieldName = 'M03ZZB08'
    end
    object cdsItemCupomM03ZZB09: TIntegerField
      FieldName = 'M03ZZB09'
    end
    object cdsItemCupomM03ZZB10: TIntegerField
      FieldName = 'M03ZZB10'
    end
    object cdsItemCupomQTD_TROCADO: TFloatField
      FieldName = 'QTD_TROCADO'
    end
    object cdsItemCupomQTD_REEMBOLSO: TFloatField
      FieldName = 'QTD_REEMBOLSO'
    end
    object cdsItemCupomVAL_REEMBOLSO: TBCDField
      FieldName = 'VAL_REEMBOLSO'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
    end
    object cdsItemCupomDATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsItemCupomDATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsItemCupomDATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsItemCupomDATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsItemCupomDATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsItemCupomDATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsItemCupomDATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsItemCupomDATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsItemCupomDATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsItemCupomDATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsItemCupomM03AE: TSmallintField
      FieldName = 'M03AE'
    end
    object cdsItemCupomM03AG: TSmallintField
      FieldName = 'M03AG'
    end
    object cdsItemCupomM03AH: TStringField
      FieldName = 'M03AH'
    end
    object cdsItemCupomM03AI: TIntegerField
      FieldName = 'M03AI'
    end
    object cdsItemCupomM03AJ: TSmallintField
      FieldName = 'M03AJ'
    end
    object cdsItemCupomM03AK: TSmallintField
      FieldName = 'M03AK'
    end
    object cdsItemCupomM03AL: TSmallintField
      FieldName = 'M03AL'
    end
    object cdsItemCupomM03AM: TIntegerField
      FieldName = 'M03AM'
    end
    object cdsItemCupomM03AN: TBCDField
      FieldName = 'M03AN'
      Precision = 5
      Size = 2
    end
    object cdsItemCupomM03AO: TBCDField
      FieldName = 'M03AO'
      Precision = 9
      Size = 3
    end
    object cdsItemCupomM03AP: TBCDField
      FieldName = 'M03AP'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03AQ: TBCDField
      FieldName = 'M03AQ'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03AR: TStringField
      FieldName = 'M03AR'
    end
    object cdsItemCupomM03AS: TSmallintField
      FieldName = 'M03AS'
    end
    object cdsItemCupomM03AT: TBCDField
      FieldName = 'M03AT'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03AU: TBCDField
      FieldName = 'M03AU'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03AV: TBCDField
      FieldName = 'M03AV'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03AW: TSmallintField
      FieldName = 'M03AW'
    end
    object cdsItemCupomM03AX: TBCDField
      FieldName = 'M03AX'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03AY: TBCDField
      FieldName = 'M03AY'
      Precision = 5
      Size = 2
    end
    object cdsItemCupomM03AZ: TSmallintField
      FieldName = 'M03AZ'
    end
    object cdsItemCupomM03BA: TBCDField
      FieldName = 'M03BA'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03BB: TStringField
      FieldName = 'M03BB'
    end
    object cdsItemCupomM03BC: TSmallintField
      FieldName = 'M03BC'
    end
    object cdsItemCupomM03BD: TStringField
      FieldName = 'M03BD'
    end
    object cdsItemCupomM03BE: TStringField
      FieldName = 'M03BE'
      Size = 15
    end
    object cdsItemCupomM03BF: TStringField
      FieldName = 'M03BF'
      Size = 30
    end
    object cdsItemCupomM03BG: TBCDField
      FieldName = 'M03BG'
      Precision = 9
      Size = 3
    end
    object cdsItemCupomM03BH: TIntegerField
      FieldName = 'M03BH'
    end
    object cdsItemCupomM03BI: TBCDField
      FieldName = 'M03BI'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03BJ: TSmallintField
      FieldName = 'M03BJ'
    end
    object cdsItemCupomM03BK: TStringField
      FieldName = 'M03BK'
    end
    object cdsItemCupomM03BM: TSmallintField
      FieldName = 'M03BM'
    end
    object cdsItemCupomM03BO: TSmallintField
      FieldName = 'M03BO'
    end
    object cdsItemCupomM03BP: TStringField
      FieldName = 'M03BP'
    end
    object cdsItemCupomM03BQ: TSmallintField
      FieldName = 'M03BQ'
    end
    object cdsItemCupomM03BR: TSmallintField
      FieldName = 'M03BR'
    end
    object cdsItemCupomM03BS: TBCDField
      FieldName = 'M03BS'
      Precision = 9
      Size = 3
    end
    object cdsItemCupomM03BT: TBCDField
      FieldName = 'M03BT'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03BU: TBCDField
      FieldName = 'M03BU'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03BV: TSmallintField
      FieldName = 'M03BV'
    end
    object cdsItemCupomM03BW: TIntegerField
      FieldName = 'M03BW'
    end
    object cdsItemCupomM03BX: TIntegerField
      FieldName = 'M03BX'
    end
    object cdsItemCupomM03BY: TSmallintField
      FieldName = 'M03BY'
    end
    object cdsItemCupomM03BZ: TSmallintField
      FieldName = 'M03BZ'
    end
    object cdsItemCupomM03CA: TBCDField
      FieldName = 'M03CA'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CA02: TBCDField
      FieldName = 'M03CA02'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CA03: TBCDField
      FieldName = 'M03CA03'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CA04: TBCDField
      FieldName = 'M03CA04'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CA05: TBCDField
      FieldName = 'M03CA05'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CB: TBCDField
      FieldName = 'M03CB'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CB02: TBCDField
      FieldName = 'M03CB02'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CB03: TBCDField
      FieldName = 'M03CB03'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CB04: TBCDField
      FieldName = 'M03CB04'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CB05: TBCDField
      FieldName = 'M03CB05'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CC: TBCDField
      FieldName = 'M03CC'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CC02: TBCDField
      FieldName = 'M03CC02'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CC03: TBCDField
      FieldName = 'M03CC03'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CC04: TBCDField
      FieldName = 'M03CC04'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CC05: TBCDField
      FieldName = 'M03CC05'
      Precision = 9
      Size = 2
    end
    object cdsItemCupomM03CD: TSmallintField
      FieldName = 'M03CD'
    end
    object cdsItemCupomM03CE: TIntegerField
      FieldName = 'M03CE'
    end
    object cdsItemCupomM03CF: TSmallintField
      FieldName = 'M03CF'
    end
    object cdsItemCupomM03CG: TIntegerField
      FieldName = 'M03CG'
    end
    object cdsItemCupomM03CH: TIntegerField
      FieldName = 'M03CH'
    end
    object cdsItemCupomM03CH02: TIntegerField
      FieldName = 'M03CH02'
    end
    object cdsItemCupomM03CH03: TIntegerField
      FieldName = 'M03CH03'
    end
    object cdsItemCupomM03CH04: TIntegerField
      FieldName = 'M03CH04'
    end
    object cdsItemCupomM03CH05: TIntegerField
      FieldName = 'M03CH05'
    end
    object cdsItemCupomM03CI: TIntegerField
      FieldName = 'M03CI'
    end
    object cdsItemCupomM03CJ: TIntegerField
      FieldName = 'M03CJ'
    end
    object cdsItemCupomM03CK: TSmallintField
      FieldName = 'M03CK'
    end
    object cdsItemCupomM03CL: TSmallintField
      FieldName = 'M03CL'
    end
    object cdsItemCupomM03CM: TStringField
      FieldName = 'M03CM'
    end
    object cdsItemCupomM03CN: TSmallintField
      FieldName = 'M03CN'
    end
    object cdsItemCupomM03CO: TStringField
      FieldName = 'M03CO'
    end
    object cdsItemCupomM03CP: TSmallintField
      FieldName = 'M03CP'
    end
    object cdsItemCupomM03CQ: TStringField
      FieldName = 'M03CQ'
    end
    object cdsItemCupomM03CR: TSmallintField
      FieldName = 'M03CR'
    end
    object cdsItemCupomM03CS: TStringField
      FieldName = 'M03CS'
    end
    object cdsItemCupomM03CT: TSmallintField
      FieldName = 'M03CT'
    end
    object cdsItemCupomM03CU: TStringField
      FieldName = 'M03CU'
    end
    object cdsItemCupomM03CV: TIntegerField
      FieldName = 'M03CV'
    end
    object cdsItemCupomM03CW: TSmallintField
      FieldName = 'M03CW'
    end
    object cdsItemCupomM03CX: TSmallintField
      FieldName = 'M03CX'
    end
    object cdsItemCupomM03CY: TIntegerField
      FieldName = 'M03CY'
    end
    object cdsItemCupomM03CZ: TIntegerField
      FieldName = 'M03CZ'
    end
    object cdsItemCupomM03DA: TIntegerField
      FieldName = 'M03DA'
    end
    object cdsItemCupomM03DB: TIntegerField
      FieldName = 'M03DB'
    end
    object cdsItemCupomM03DC: TIntegerField
      FieldName = 'M03DC'
    end
    object cdsItemCupomM03DD: TSmallintField
      FieldName = 'M03DD'
    end
    object cdsItemCupomM03DE: TIntegerField
      FieldName = 'M03DE'
    end
    object cdsItemCupomM03DF: TSmallintField
      FieldName = 'M03DF'
    end
    object cdsItemCupomM03DG: TIntegerField
      FieldName = 'M03DG'
    end
    object cdsItemCupomM03DH: TStringField
      FieldName = 'M03DH'
    end
    object cdsItemCupomM03DI: TBCDField
      FieldName = 'M03DI'
      Precision = 9
    end
    object cdsItemCupomM03DI02: TBCDField
      FieldName = 'M03DI02'
      Precision = 9
    end
    object cdsItemCupomM03DI03: TBCDField
      FieldName = 'M03DI03'
      Precision = 9
    end
    object cdsItemCupomM03DI04: TBCDField
      FieldName = 'M03DI04'
      Precision = 9
    end
    object cdsItemCupomM03DI05: TBCDField
      FieldName = 'M03DI05'
      Precision = 9
    end
    object cdsItemCupomM03DJ: TBCDField
      FieldName = 'M03DJ'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03DM: TIntegerField
      FieldName = 'M03DM'
    end
    object cdsItemCupomM03DN: TSmallintField
      FieldName = 'M03DN'
    end
    object cdsItemCupomM03DO: TIntegerField
      FieldName = 'M03DO'
    end
    object cdsItemCupomM03DP: TSmallintField
      FieldName = 'M03DP'
    end
    object cdsItemCupomM03DQ: TBCDField
      FieldName = 'M03DQ'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03DR: TBCDField
      FieldName = 'M03DR'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03DS: TStringField
      FieldName = 'M03DS'
      Size = 30
    end
    object cdsItemCupomM03DT: TStringField
      FieldName = 'M03DT'
      Size = 50
    end
    object cdsItemCupomM03DU: TSmallintField
      FieldName = 'M03DU'
    end
    object cdsItemCupomM03DV: TBCDField
      FieldName = 'M03DV'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03DW: TSmallintField
      FieldName = 'M03DW'
    end
    object cdsItemCupomM03DX: TSmallintField
      FieldName = 'M03DX'
    end
    object cdsItemCupomM03DY: TSmallintField
      FieldName = 'M03DY'
    end
    object cdsItemCupomM03DZ: TStringField
      FieldName = 'M03DZ'
    end
    object cdsItemCupomM03EA: TSmallintField
      FieldName = 'M03EA'
    end
    object cdsItemCupomM03EB: TBCDField
      FieldName = 'M03EB'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03EC: TBCDField
      FieldName = 'M03EC'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03ED: TBCDField
      FieldName = 'M03ED'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03EE: TSmallintField
      FieldName = 'M03EE'
    end
    object cdsItemCupomM03EFA: TBCDField
      FieldName = 'M03EFA'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03EFB: TSmallintField
      FieldName = 'M03EFB'
    end
    object cdsItemCupomM03EFC: TIntegerField
      FieldName = 'M03EFC'
    end
    object cdsItemCupomM03EFD: TIntegerField
      FieldName = 'M03EFD'
    end
    object cdsItemCupomM03EG: TSmallintField
      FieldName = 'M03EG'
    end
    object cdsItemCupomM03EH: TSmallintField
      FieldName = 'M03EH'
    end
    object cdsItemCupomM03EI: TIntegerField
      FieldName = 'M03EI'
    end
    object cdsItemCupomM03EJA: TSmallintField
      FieldName = 'M03EJA'
    end
    object cdsItemCupomM03EJB: TBCDField
      FieldName = 'M03EJB'
      Precision = 5
      Size = 2
    end
    object cdsItemCupomM03EJC: TBCDField
      FieldName = 'M03EJC'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomM03EJD: TBCDField
      FieldName = 'M03EJD'
      Precision = 12
      Size = 2
    end
    object cdsItemCupomval_liquido: TBCDField
      FieldName = 'val_liquido'
      Precision = 12
      Size = 2
    end
  end
  object dspItemCupom: TDataSetProvider
    DataSet = fdqItemCupom
    Left = 152
    Top = 331
  end
  object fdqZan_M05: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m05'
      'where m00af = '#39'11/08/16'#39)
    Left = 415
    Top = 15
  end
  object dspZan_M05: TDataSetProvider
    DataSet = fdqZan_M05
    Left = 528
    Top = 15
  end
  object cdsZan_M05: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M05'
    Left = 648
    Top = 15
    object cdsZan_M05M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M05M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M05M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M05M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M05M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M05M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M05M05AB: TStringField
      FieldName = 'M05AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M05M05ZC: TSmallintField
      FieldName = 'M05ZC'
      Required = True
    end
    object cdsZan_M05M05ZB: TSmallintField
      FieldName = 'M05ZB'
    end
    object cdsZan_M05M05ZZA01: TSmallintField
      FieldName = 'M05ZZA01'
      Required = True
    end
    object cdsZan_M05M05ZZA02: TSmallintField
      FieldName = 'M05ZZA02'
      Required = True
    end
    object cdsZan_M05M05ZZA03: TSmallintField
      FieldName = 'M05ZZA03'
      Required = True
    end
    object cdsZan_M05M05ZZA04: TSmallintField
      FieldName = 'M05ZZA04'
      Required = True
    end
    object cdsZan_M05M05ZZA05: TSmallintField
      FieldName = 'M05ZZA05'
      Required = True
    end
    object cdsZan_M05M05ZZA06: TIntegerField
      FieldName = 'M05ZZA06'
    end
    object cdsZan_M05M05ZZA07: TIntegerField
      FieldName = 'M05ZZA07'
    end
    object cdsZan_M05M05ZZA08: TIntegerField
      FieldName = 'M05ZZA08'
    end
    object cdsZan_M05M05ZZA09: TIntegerField
      FieldName = 'M05ZZA09'
    end
    object cdsZan_M05M05ZZA10: TIntegerField
      FieldName = 'M05ZZA10'
    end
    object cdsZan_M05M05ZZB01: TSmallintField
      FieldName = 'M05ZZB01'
      Required = True
    end
    object cdsZan_M05M05ZZB02: TSmallintField
      FieldName = 'M05ZZB02'
      Required = True
    end
    object cdsZan_M05M05ZZB03: TSmallintField
      FieldName = 'M05ZZB03'
      Required = True
    end
    object cdsZan_M05M05ZZB04: TSmallintField
      FieldName = 'M05ZZB04'
      Required = True
    end
    object cdsZan_M05M05ZZB05: TSmallintField
      FieldName = 'M05ZZB05'
      Required = True
    end
    object cdsZan_M05M05ZZB06: TIntegerField
      FieldName = 'M05ZZB06'
    end
    object cdsZan_M05M05ZZB07: TIntegerField
      FieldName = 'M05ZZB07'
    end
    object cdsZan_M05M05ZZB08: TIntegerField
      FieldName = 'M05ZZB08'
    end
    object cdsZan_M05M05ZZB09: TIntegerField
      FieldName = 'M05ZZB09'
    end
    object cdsZan_M05M05ZZB10: TIntegerField
      FieldName = 'M05ZZB10'
    end
    object cdsZan_M05DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M05DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M05DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M05DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M05DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M05DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M05DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M05DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M05DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M05DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M05M05ZZC01: TStringField
      FieldName = 'M05ZZC01'
      Size = 14
    end
    object cdsZan_M05DTA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DTA_ULTIMA_ALTERACAO'
    end
    object cdsZan_M05M05AE: TSmallintField
      FieldName = 'M05AE'
    end
    object cdsZan_M05M05AG: TSmallintField
      FieldName = 'M05AG'
    end
    object cdsZan_M05M05AI: TSmallintField
      FieldName = 'M05AI'
    end
    object cdsZan_M05M05AJ: TIntegerField
      FieldName = 'M05AJ'
    end
    object cdsZan_M05M05AK: TIntegerField
      FieldName = 'M05AK'
    end
    object cdsZan_M05M05AL: TIntegerField
      FieldName = 'M05AL'
    end
    object cdsZan_M05M05AM: TBCDField
      FieldName = 'M05AM'
      Precision = 16
      Size = 2
    end
    object cdsZan_M05M05AN: TBCDField
      FieldName = 'M05AN'
      Precision = 16
      Size = 2
    end
    object cdsZan_M05M05AO: TBCDField
      FieldName = 'M05AO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AP: TBCDField
      FieldName = 'M05AP'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AQ: TBCDField
      FieldName = 'M05AQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AR: TBCDField
      FieldName = 'M05AR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AS: TBCDField
      FieldName = 'M05AS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AT: TBCDField
      FieldName = 'M05AT'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AU: TBCDField
      FieldName = 'M05AU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AV: TBCDField
      FieldName = 'M05AV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AW: TBCDField
      FieldName = 'M05AW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AX: TBCDField
      FieldName = 'M05AX'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AY: TBCDField
      FieldName = 'M05AY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05AZ: TBCDField
      FieldName = 'M05AZ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05BA: TBCDField
      FieldName = 'M05BA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05BB: TStringField
      FieldName = 'M05BB'
      Size = 25
    end
    object cdsZan_M05M05BC: TIntegerField
      FieldName = 'M05BC'
    end
    object cdsZan_M05M05BE: TSmallintField
      FieldName = 'M05BE'
    end
    object cdsZan_M05M05BG: TBCDField
      FieldName = 'M05BG'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05BH: TIntegerField
      FieldName = 'M05BH'
    end
    object cdsZan_M05M05BI: TSmallintField
      FieldName = 'M05BI'
    end
    object cdsZan_M05M05BJ: TSmallintField
      FieldName = 'M05BJ'
    end
    object cdsZan_M05M05BK: TIntegerField
      FieldName = 'M05BK'
    end
    object cdsZan_M05M05BL: TSmallintField
      FieldName = 'M05BL'
    end
    object cdsZan_M05M05BM: TStringField
      FieldName = 'M05BM'
      Size = 25
    end
    object cdsZan_M05M05BN: TSmallintField
      FieldName = 'M05BN'
    end
    object cdsZan_M05M05BOA: TBCDField
      FieldName = 'M05BOA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05BOB: TBCDField
      FieldName = 'M05BOB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05BOC: TBCDField
      FieldName = 'M05BOC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05BOD: TBCDField
      FieldName = 'M05BOD'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAJ: TBCDField
      FieldName = 'M05XAJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAK: TBCDField
      FieldName = 'M05XAK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAL: TBCDField
      FieldName = 'M05XAL'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAM: TBCDField
      FieldName = 'M05XAM'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAN: TBCDField
      FieldName = 'M05XAN'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAO: TBCDField
      FieldName = 'M05XAO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAP: TBCDField
      FieldName = 'M05XAP'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAQ: TBCDField
      FieldName = 'M05XAQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAR: TBCDField
      FieldName = 'M05XAR'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAS: TBCDField
      FieldName = 'M05XAS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAT: TBCDField
      FieldName = 'M05XAT'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAU: TBCDField
      FieldName = 'M05XAU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAV: TBCDField
      FieldName = 'M05XAV'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAW: TBCDField
      FieldName = 'M05XAW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAX: TBCDField
      FieldName = 'M05XAX'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XAY: TBCDField
      FieldName = 'M05XAY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XAZ: TBCDField
      FieldName = 'M05XAZ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XBA: TBCDField
      FieldName = 'M05XBA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XBB: TBCDField
      FieldName = 'M05XBB'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XBC: TBCDField
      FieldName = 'M05XBC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XBD: TBCDField
      FieldName = 'M05XBD'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XBE: TBCDField
      FieldName = 'M05XBE'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XBF: TBCDField
      FieldName = 'M05XBF'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XBG: TBCDField
      FieldName = 'M05XBG'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XBH: TBCDField
      FieldName = 'M05XBH'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XBI: TBCDField
      FieldName = 'M05XBI'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XBJ: TBCDField
      FieldName = 'M05XBJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M05M05XBK: TBCDField
      FieldName = 'M05XBK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M05M05XBL: TSmallintField
      FieldName = 'M05XBL'
    end
  end
  object fdqZan_M01: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m01'
      'where m00af = '#39'12/23/16'#39
      'and m00ad = 6499')
    Left = 415
    Top = 107
  end
  object dspZan_M01: TDataSetProvider
    DataSet = fdqZan_M01
    Left = 528
    Top = 107
  end
  object cdsZan_M01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M01'
    Left = 648
    Top = 107
    object cdsZan_M01M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M01M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M01M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M01M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M01M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M01M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M01M01AB: TStringField
      FieldName = 'M01AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M01M01ZC: TSmallintField
      FieldName = 'M01ZC'
      Required = True
    end
    object cdsZan_M01M01ZB: TSmallintField
      FieldName = 'M01ZB'
    end
    object cdsZan_M01M01ZZA01: TSmallintField
      FieldName = 'M01ZZA01'
      Required = True
    end
    object cdsZan_M01M01ZZA02: TSmallintField
      FieldName = 'M01ZZA02'
      Required = True
    end
    object cdsZan_M01M01ZZA03: TSmallintField
      FieldName = 'M01ZZA03'
      Required = True
    end
    object cdsZan_M01M01ZZA04: TSmallintField
      FieldName = 'M01ZZA04'
      Required = True
    end
    object cdsZan_M01M01ZZA05: TSmallintField
      FieldName = 'M01ZZA05'
      Required = True
    end
    object cdsZan_M01M01ZZA06: TIntegerField
      FieldName = 'M01ZZA06'
    end
    object cdsZan_M01M01ZZA07: TIntegerField
      FieldName = 'M01ZZA07'
    end
    object cdsZan_M01M01ZZA08: TIntegerField
      FieldName = 'M01ZZA08'
    end
    object cdsZan_M01M01ZZA09: TIntegerField
      FieldName = 'M01ZZA09'
    end
    object cdsZan_M01M01ZZA10: TIntegerField
      FieldName = 'M01ZZA10'
    end
    object cdsZan_M01M01ZZB01: TSmallintField
      FieldName = 'M01ZZB01'
      Required = True
    end
    object cdsZan_M01M01ZZB02: TSmallintField
      FieldName = 'M01ZZB02'
      Required = True
    end
    object cdsZan_M01M01ZZB03: TSmallintField
      FieldName = 'M01ZZB03'
      Required = True
    end
    object cdsZan_M01M01ZZB04: TSmallintField
      FieldName = 'M01ZZB04'
      Required = True
    end
    object cdsZan_M01M01ZZB05: TSmallintField
      FieldName = 'M01ZZB05'
      Required = True
    end
    object cdsZan_M01M01ZZB06: TIntegerField
      FieldName = 'M01ZZB06'
    end
    object cdsZan_M01M01ZZB07: TIntegerField
      FieldName = 'M01ZZB07'
    end
    object cdsZan_M01M01ZZB08: TIntegerField
      FieldName = 'M01ZZB08'
    end
    object cdsZan_M01M01ZZB09: TIntegerField
      FieldName = 'M01ZZB09'
    end
    object cdsZan_M01M01ZZB10: TIntegerField
      FieldName = 'M01ZZB10'
    end
    object cdsZan_M01DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M01DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M01DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M01DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M01DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M01DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M01DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M01DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M01DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M01DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M01cupom_cancelamento: TIntegerField
      FieldName = 'cupom_cancelamento'
      Required = True
    end
    object cdsZan_M01M01AE: TSmallintField
      FieldName = 'M01AE'
    end
    object cdsZan_M01M01AG: TSmallintField
      FieldName = 'M01AG'
    end
    object cdsZan_M01M01AH: TIntegerField
      FieldName = 'M01AH'
    end
    object cdsZan_M01M01AI: TSmallintField
      FieldName = 'M01AI'
    end
    object cdsZan_M01M01AJ: TBCDField
      FieldName = 'M01AJ'
      Precision = 10
      Size = 3
    end
    object cdsZan_M01M01AK: TBCDField
      FieldName = 'M01AK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01AL: TIntegerField
      FieldName = 'M01AL'
    end
    object cdsZan_M01M01AM: TBCDField
      FieldName = 'M01AM'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01AN: TIntegerField
      FieldName = 'M01AN'
    end
    object cdsZan_M01M01AO: TBCDField
      FieldName = 'M01AO'
      Precision = 10
      Size = 3
    end
    object cdsZan_M01M01AP: TBCDField
      FieldName = 'M01AP'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01AQ: TIntegerField
      FieldName = 'M01AQ'
    end
    object cdsZan_M01M01AR: TBCDField
      FieldName = 'M01AR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01AS: TIntegerField
      FieldName = 'M01AS'
    end
    object cdsZan_M01M01ATA: TSmallintField
      FieldName = 'M01ATA'
    end
    object cdsZan_M01M01ATB: TBCDField
      FieldName = 'M01ATB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATC01: TIntegerField
      FieldName = 'M01ATC01'
    end
    object cdsZan_M01M01ATC02: TBCDField
      FieldName = 'M01ATC02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATD01: TIntegerField
      FieldName = 'M01ATD01'
    end
    object cdsZan_M01M01ATD02: TBCDField
      FieldName = 'M01ATD02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATE01: TIntegerField
      FieldName = 'M01ATE01'
    end
    object cdsZan_M01M01ATE02: TBCDField
      FieldName = 'M01ATE02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATF01: TIntegerField
      FieldName = 'M01ATF01'
    end
    object cdsZan_M01M01ATF02: TBCDField
      FieldName = 'M01ATF02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATG01: TIntegerField
      FieldName = 'M01ATG01'
    end
    object cdsZan_M01M01ATG02: TBCDField
      FieldName = 'M01ATG02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATH01: TIntegerField
      FieldName = 'M01ATH01'
    end
    object cdsZan_M01M01ATH02: TBCDField
      FieldName = 'M01ATH02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATI01: TIntegerField
      FieldName = 'M01ATI01'
    end
    object cdsZan_M01M01ATI02: TBCDField
      FieldName = 'M01ATI02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATJ01: TIntegerField
      FieldName = 'M01ATJ01'
    end
    object cdsZan_M01M01ATJ02: TBCDField
      FieldName = 'M01ATJ02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATK01: TIntegerField
      FieldName = 'M01ATK01'
    end
    object cdsZan_M01M01ATK02: TBCDField
      FieldName = 'M01ATK02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01ATL01: TIntegerField
      FieldName = 'M01ATL01'
    end
    object cdsZan_M01M01ATL02: TBCDField
      FieldName = 'M01ATL02'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01AU: TSmallintField
      FieldName = 'M01AU'
    end
    object cdsZan_M01M01AV: TStringField
      FieldName = 'M01AV'
    end
    object cdsZan_M01M01AW: TIntegerField
      FieldName = 'M01AW'
    end
    object cdsZan_M01M01AX: TIntegerField
      FieldName = 'M01AX'
    end
    object cdsZan_M01M01AY: TIntegerField
      FieldName = 'M01AY'
    end
    object cdsZan_M01M01AZ: TIntegerField
      FieldName = 'M01AZ'
    end
    object cdsZan_M01M01BA: TIntegerField
      FieldName = 'M01BA'
    end
    object cdsZan_M01M01BB: TBCDField
      FieldName = 'M01BB'
      Precision = 9
      Size = 2
    end
    object cdsZan_M01M01BC: TBCDField
      FieldName = 'M01BC'
      Precision = 9
      Size = 2
    end
    object cdsZan_M01M01BD: TSmallintField
      FieldName = 'M01BD'
    end
    object cdsZan_M01M01BE: TSmallintField
      FieldName = 'M01BE'
    end
    object cdsZan_M01M01BG: TSmallintField
      FieldName = 'M01BG'
    end
    object cdsZan_M01M01BI: TSmallintField
      FieldName = 'M01BI'
    end
    object cdsZan_M01M01BJ: TStringField
      FieldName = 'M01BJ'
    end
    object cdsZan_M01M01BK: TSmallintField
      FieldName = 'M01BK'
    end
    object cdsZan_M01M01BL: TStringField
      FieldName = 'M01BL'
    end
    object cdsZan_M01M01BM: TSmallintField
      FieldName = 'M01BM'
    end
    object cdsZan_M01M01BN: TStringField
      FieldName = 'M01BN'
    end
    object cdsZan_M01M01BO: TIntegerField
      FieldName = 'M01BO'
    end
    object cdsZan_M01M01BP: TIntegerField
      FieldName = 'M01BP'
    end
    object cdsZan_M01M01BQ: TIntegerField
      FieldName = 'M01BQ'
    end
    object cdsZan_M01M01BR: TBCDField
      FieldName = 'M01BR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01BS: TIntegerField
      FieldName = 'M01BS'
    end
    object cdsZan_M01M01BT: TSmallintField
      FieldName = 'M01BT'
    end
    object cdsZan_M01M01BU: TSmallintField
      FieldName = 'M01BU'
    end
    object cdsZan_M01M01BV: TStringField
      FieldName = 'M01BV'
      Size = 15
    end
    object cdsZan_M01M01BW: TIntegerField
      FieldName = 'M01BW'
    end
    object cdsZan_M01M01BX: TIntegerField
      FieldName = 'M01BX'
    end
    object cdsZan_M01M01BY: TBCDField
      FieldName = 'M01BY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01BZ: TSmallintField
      FieldName = 'M01BZ'
    end
    object cdsZan_M01M01CA: TBCDField
      FieldName = 'M01CA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CB: TBCDField
      FieldName = 'M01CB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CC: TBCDField
      FieldName = 'M01CC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CD: TBCDField
      FieldName = 'M01CD'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CE: TStringField
      FieldName = 'M01CE'
    end
    object cdsZan_M01M01CF: TSmallintField
      FieldName = 'M01CF'
    end
    object cdsZan_M01M01CG00: TSmallintField
      FieldName = 'M01CG00'
    end
    object cdsZan_M01M01CG01: TSmallintField
      FieldName = 'M01CG01'
    end
    object cdsZan_M01M01CG10: TSmallintField
      FieldName = 'M01CG10'
    end
    object cdsZan_M01M01CG11: TStringField
      FieldName = 'M01CG11'
      Size = 30
    end
    object cdsZan_M01M01CG20: TSmallintField
      FieldName = 'M01CG20'
    end
    object cdsZan_M01M01CG21: TStringField
      FieldName = 'M01CG21'
      Size = 30
    end
    object cdsZan_M01M01CG30: TSmallintField
      FieldName = 'M01CG30'
    end
    object cdsZan_M01M01CG31: TStringField
      FieldName = 'M01CG31'
      Size = 30
    end
    object cdsZan_M01M01CH: TIntegerField
      FieldName = 'M01CH'
    end
    object cdsZan_M01M01CIA: TBCDField
      FieldName = 'M01CIA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CIB: TBCDField
      FieldName = 'M01CIB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CIC: TBCDField
      FieldName = 'M01CIC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M01M01CID: TBCDField
      FieldName = 'M01CID'
      Precision = 12
      Size = 2
    end
  end
  object fdqZan_M03: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m03'
      'where m00af = '#39'11/08/16'#39)
    Left = 415
    Top = 198
  end
  object dspZan_M03: TDataSetProvider
    DataSet = fdqZan_M03
    Left = 528
    Top = 198
  end
  object cdsZan_M03: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M03'
    Left = 648
    Top = 198
    object cdsZan_M03M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M03M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M03M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M03M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M03M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M03M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M03M03AB: TStringField
      FieldName = 'M03AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M03M03ZC: TSmallintField
      FieldName = 'M03ZC'
      Required = True
    end
    object cdsZan_M03M03ZB: TSmallintField
      FieldName = 'M03ZB'
    end
    object cdsZan_M03M03ZZA01: TSmallintField
      FieldName = 'M03ZZA01'
      Required = True
    end
    object cdsZan_M03M03ZZA02: TSmallintField
      FieldName = 'M03ZZA02'
      Required = True
    end
    object cdsZan_M03M03ZZA03: TSmallintField
      FieldName = 'M03ZZA03'
      Required = True
    end
    object cdsZan_M03M03ZZA04: TSmallintField
      FieldName = 'M03ZZA04'
      Required = True
    end
    object cdsZan_M03M03ZZA05: TSmallintField
      FieldName = 'M03ZZA05'
      Required = True
    end
    object cdsZan_M03M03ZZA06: TIntegerField
      FieldName = 'M03ZZA06'
    end
    object cdsZan_M03M03ZZA07: TIntegerField
      FieldName = 'M03ZZA07'
    end
    object cdsZan_M03M03ZZA08: TIntegerField
      FieldName = 'M03ZZA08'
    end
    object cdsZan_M03M03ZZA09: TIntegerField
      FieldName = 'M03ZZA09'
    end
    object cdsZan_M03M03ZZA10: TIntegerField
      FieldName = 'M03ZZA10'
    end
    object cdsZan_M03M03ZZB01: TSmallintField
      FieldName = 'M03ZZB01'
      Required = True
    end
    object cdsZan_M03M03ZZB02: TSmallintField
      FieldName = 'M03ZZB02'
      Required = True
    end
    object cdsZan_M03M03ZZB03: TSmallintField
      FieldName = 'M03ZZB03'
      Required = True
    end
    object cdsZan_M03M03ZZB04: TSmallintField
      FieldName = 'M03ZZB04'
      Required = True
    end
    object cdsZan_M03M03ZZB05: TSmallintField
      FieldName = 'M03ZZB05'
      Required = True
    end
    object cdsZan_M03M03ZZB06: TIntegerField
      FieldName = 'M03ZZB06'
    end
    object cdsZan_M03M03ZZB07: TIntegerField
      FieldName = 'M03ZZB07'
    end
    object cdsZan_M03M03ZZB08: TIntegerField
      FieldName = 'M03ZZB08'
    end
    object cdsZan_M03M03ZZB09: TIntegerField
      FieldName = 'M03ZZB09'
    end
    object cdsZan_M03M03ZZB10: TIntegerField
      FieldName = 'M03ZZB10'
    end
    object cdsZan_M03QTD_TROCADO: TFloatField
      FieldName = 'QTD_TROCADO'
    end
    object cdsZan_M03QTD_REEMBOLSO: TFloatField
      FieldName = 'QTD_REEMBOLSO'
    end
    object cdsZan_M03VAL_REEMBOLSO: TBCDField
      FieldName = 'VAL_REEMBOLSO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03NUM_NF: TIntegerField
      FieldName = 'NUM_NF'
    end
    object cdsZan_M03DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M03DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M03DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M03DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M03DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M03DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M03DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M03DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M03DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M03DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M03M03AE: TSmallintField
      FieldName = 'M03AE'
    end
    object cdsZan_M03M03AG: TSmallintField
      FieldName = 'M03AG'
    end
    object cdsZan_M03M03AH: TStringField
      FieldName = 'M03AH'
    end
    object cdsZan_M03M03AI: TIntegerField
      FieldName = 'M03AI'
    end
    object cdsZan_M03M03AJ: TSmallintField
      FieldName = 'M03AJ'
    end
    object cdsZan_M03M03AK: TSmallintField
      FieldName = 'M03AK'
    end
    object cdsZan_M03M03AL: TSmallintField
      FieldName = 'M03AL'
    end
    object cdsZan_M03M03AM: TIntegerField
      FieldName = 'M03AM'
    end
    object cdsZan_M03M03AN: TBCDField
      FieldName = 'M03AN'
      Precision = 5
      Size = 2
    end
    object cdsZan_M03M03AO: TBCDField
      FieldName = 'M03AO'
      Precision = 9
      Size = 3
    end
    object cdsZan_M03M03AP: TBCDField
      FieldName = 'M03AP'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03AQ: TBCDField
      FieldName = 'M03AQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03AR: TStringField
      FieldName = 'M03AR'
    end
    object cdsZan_M03M03AS: TSmallintField
      FieldName = 'M03AS'
    end
    object cdsZan_M03M03AT: TBCDField
      FieldName = 'M03AT'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03AU: TBCDField
      FieldName = 'M03AU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03AV: TBCDField
      FieldName = 'M03AV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03AW: TSmallintField
      FieldName = 'M03AW'
    end
    object cdsZan_M03M03AX: TBCDField
      FieldName = 'M03AX'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03AY: TBCDField
      FieldName = 'M03AY'
      Precision = 5
      Size = 2
    end
    object cdsZan_M03M03AZ: TSmallintField
      FieldName = 'M03AZ'
    end
    object cdsZan_M03M03BA: TBCDField
      FieldName = 'M03BA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03BB: TStringField
      FieldName = 'M03BB'
    end
    object cdsZan_M03M03BC: TSmallintField
      FieldName = 'M03BC'
    end
    object cdsZan_M03M03BD: TStringField
      FieldName = 'M03BD'
    end
    object cdsZan_M03M03BE: TStringField
      FieldName = 'M03BE'
      Size = 15
    end
    object cdsZan_M03M03BF: TStringField
      FieldName = 'M03BF'
      Size = 30
    end
    object cdsZan_M03M03BG: TBCDField
      FieldName = 'M03BG'
      Precision = 9
      Size = 3
    end
    object cdsZan_M03M03BH: TIntegerField
      FieldName = 'M03BH'
    end
    object cdsZan_M03M03BI: TBCDField
      FieldName = 'M03BI'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03BJ: TSmallintField
      FieldName = 'M03BJ'
    end
    object cdsZan_M03M03BK: TStringField
      FieldName = 'M03BK'
    end
    object cdsZan_M03M03BM: TSmallintField
      FieldName = 'M03BM'
    end
    object cdsZan_M03M03BO: TSmallintField
      FieldName = 'M03BO'
    end
    object cdsZan_M03M03BP: TStringField
      FieldName = 'M03BP'
    end
    object cdsZan_M03M03BQ: TSmallintField
      FieldName = 'M03BQ'
    end
    object cdsZan_M03M03BR: TSmallintField
      FieldName = 'M03BR'
    end
    object cdsZan_M03M03BS: TBCDField
      FieldName = 'M03BS'
      Precision = 9
      Size = 3
    end
    object cdsZan_M03M03BT: TBCDField
      FieldName = 'M03BT'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03BU: TBCDField
      FieldName = 'M03BU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03BV: TSmallintField
      FieldName = 'M03BV'
    end
    object cdsZan_M03M03BW: TIntegerField
      FieldName = 'M03BW'
    end
    object cdsZan_M03M03BX: TIntegerField
      FieldName = 'M03BX'
    end
    object cdsZan_M03M03BY: TSmallintField
      FieldName = 'M03BY'
    end
    object cdsZan_M03M03BZ: TSmallintField
      FieldName = 'M03BZ'
    end
    object cdsZan_M03M03CA: TBCDField
      FieldName = 'M03CA'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CA02: TBCDField
      FieldName = 'M03CA02'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CA03: TBCDField
      FieldName = 'M03CA03'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CA04: TBCDField
      FieldName = 'M03CA04'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CA05: TBCDField
      FieldName = 'M03CA05'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CB: TBCDField
      FieldName = 'M03CB'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CB02: TBCDField
      FieldName = 'M03CB02'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CB03: TBCDField
      FieldName = 'M03CB03'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CB04: TBCDField
      FieldName = 'M03CB04'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CB05: TBCDField
      FieldName = 'M03CB05'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CC: TBCDField
      FieldName = 'M03CC'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CC02: TBCDField
      FieldName = 'M03CC02'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CC03: TBCDField
      FieldName = 'M03CC03'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CC04: TBCDField
      FieldName = 'M03CC04'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CC05: TBCDField
      FieldName = 'M03CC05'
      Precision = 9
      Size = 2
    end
    object cdsZan_M03M03CD: TSmallintField
      FieldName = 'M03CD'
    end
    object cdsZan_M03M03CE: TIntegerField
      FieldName = 'M03CE'
    end
    object cdsZan_M03M03CF: TSmallintField
      FieldName = 'M03CF'
    end
    object cdsZan_M03M03CG: TIntegerField
      FieldName = 'M03CG'
    end
    object cdsZan_M03M03CH: TIntegerField
      FieldName = 'M03CH'
    end
    object cdsZan_M03M03CH02: TIntegerField
      FieldName = 'M03CH02'
    end
    object cdsZan_M03M03CH03: TIntegerField
      FieldName = 'M03CH03'
    end
    object cdsZan_M03M03CH04: TIntegerField
      FieldName = 'M03CH04'
    end
    object cdsZan_M03M03CH05: TIntegerField
      FieldName = 'M03CH05'
    end
    object cdsZan_M03M03CI: TIntegerField
      FieldName = 'M03CI'
    end
    object cdsZan_M03M03CJ: TIntegerField
      FieldName = 'M03CJ'
    end
    object cdsZan_M03M03CK: TSmallintField
      FieldName = 'M03CK'
    end
    object cdsZan_M03M03CL: TSmallintField
      FieldName = 'M03CL'
    end
    object cdsZan_M03M03CM: TStringField
      FieldName = 'M03CM'
    end
    object cdsZan_M03M03CN: TSmallintField
      FieldName = 'M03CN'
    end
    object cdsZan_M03M03CO: TStringField
      FieldName = 'M03CO'
    end
    object cdsZan_M03M03CP: TSmallintField
      FieldName = 'M03CP'
    end
    object cdsZan_M03M03CQ: TStringField
      FieldName = 'M03CQ'
    end
    object cdsZan_M03M03CR: TSmallintField
      FieldName = 'M03CR'
    end
    object cdsZan_M03M03CS: TStringField
      FieldName = 'M03CS'
    end
    object cdsZan_M03M03CT: TSmallintField
      FieldName = 'M03CT'
    end
    object cdsZan_M03M03CU: TStringField
      FieldName = 'M03CU'
    end
    object cdsZan_M03M03CV: TIntegerField
      FieldName = 'M03CV'
    end
    object cdsZan_M03M03CW: TSmallintField
      FieldName = 'M03CW'
    end
    object cdsZan_M03M03CX: TSmallintField
      FieldName = 'M03CX'
    end
    object cdsZan_M03M03CY: TIntegerField
      FieldName = 'M03CY'
    end
    object cdsZan_M03M03CZ: TIntegerField
      FieldName = 'M03CZ'
    end
    object cdsZan_M03M03DA: TIntegerField
      FieldName = 'M03DA'
    end
    object cdsZan_M03M03DB: TIntegerField
      FieldName = 'M03DB'
    end
    object cdsZan_M03M03DC: TIntegerField
      FieldName = 'M03DC'
    end
    object cdsZan_M03M03DD: TSmallintField
      FieldName = 'M03DD'
    end
    object cdsZan_M03M03DE: TIntegerField
      FieldName = 'M03DE'
    end
    object cdsZan_M03M03DF: TSmallintField
      FieldName = 'M03DF'
    end
    object cdsZan_M03M03DG: TIntegerField
      FieldName = 'M03DG'
    end
    object cdsZan_M03M03DH: TStringField
      FieldName = 'M03DH'
    end
    object cdsZan_M03M03DI: TBCDField
      FieldName = 'M03DI'
      Precision = 9
    end
    object cdsZan_M03M03DI02: TBCDField
      FieldName = 'M03DI02'
      Precision = 9
    end
    object cdsZan_M03M03DI03: TBCDField
      FieldName = 'M03DI03'
      Precision = 9
    end
    object cdsZan_M03M03DI04: TBCDField
      FieldName = 'M03DI04'
      Precision = 9
    end
    object cdsZan_M03M03DI05: TBCDField
      FieldName = 'M03DI05'
      Precision = 9
    end
    object cdsZan_M03M03DJ: TBCDField
      FieldName = 'M03DJ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03DM: TIntegerField
      FieldName = 'M03DM'
    end
    object cdsZan_M03M03DN: TSmallintField
      FieldName = 'M03DN'
    end
    object cdsZan_M03M03DO: TIntegerField
      FieldName = 'M03DO'
    end
    object cdsZan_M03M03DP: TSmallintField
      FieldName = 'M03DP'
    end
    object cdsZan_M03M03DQ: TBCDField
      FieldName = 'M03DQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03DR: TBCDField
      FieldName = 'M03DR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03DS: TStringField
      FieldName = 'M03DS'
      Size = 30
    end
    object cdsZan_M03M03DT: TStringField
      FieldName = 'M03DT'
      Size = 50
    end
    object cdsZan_M03M03DU: TSmallintField
      FieldName = 'M03DU'
    end
    object cdsZan_M03M03DV: TBCDField
      FieldName = 'M03DV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03DW: TSmallintField
      FieldName = 'M03DW'
    end
    object cdsZan_M03M03DX: TSmallintField
      FieldName = 'M03DX'
    end
    object cdsZan_M03M03DY: TSmallintField
      FieldName = 'M03DY'
    end
    object cdsZan_M03M03DZ: TStringField
      FieldName = 'M03DZ'
    end
    object cdsZan_M03M03EA: TSmallintField
      FieldName = 'M03EA'
    end
    object cdsZan_M03M03EB: TBCDField
      FieldName = 'M03EB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03EC: TBCDField
      FieldName = 'M03EC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03ED: TBCDField
      FieldName = 'M03ED'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03EE: TSmallintField
      FieldName = 'M03EE'
    end
    object cdsZan_M03M03EFA: TBCDField
      FieldName = 'M03EFA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03EFB: TSmallintField
      FieldName = 'M03EFB'
    end
    object cdsZan_M03M03EFC: TIntegerField
      FieldName = 'M03EFC'
    end
    object cdsZan_M03M03EFD: TIntegerField
      FieldName = 'M03EFD'
    end
    object cdsZan_M03M03EG: TSmallintField
      FieldName = 'M03EG'
    end
    object cdsZan_M03M03EH: TSmallintField
      FieldName = 'M03EH'
    end
    object cdsZan_M03M03EI: TIntegerField
      FieldName = 'M03EI'
    end
    object cdsZan_M03M03EJA: TSmallintField
      FieldName = 'M03EJA'
    end
    object cdsZan_M03M03EJB: TBCDField
      FieldName = 'M03EJB'
      Precision = 5
      Size = 2
    end
    object cdsZan_M03M03EJC: TBCDField
      FieldName = 'M03EJC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03M03EJD: TBCDField
      FieldName = 'M03EJD'
      Precision = 12
      Size = 2
    end
    object cdsZan_M03val_liquido: TBCDField
      FieldName = 'val_liquido'
      Precision = 12
      Size = 2
    end
  end
  object fdqZan_M02: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m02'
      'where m00af = '#39'11/08/16'#39)
    Left = 415
    Top = 153
  end
  object dspZan_M02: TDataSetProvider
    DataSet = fdqZan_M02
    Left = 528
    Top = 153
  end
  object cdsZan_M02: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M02'
    Left = 648
    Top = 153
    object cdsZan_M02M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M02M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M02M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M02M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M02M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M02M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M02M02AB: TStringField
      FieldName = 'M02AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M02M02ZC: TSmallintField
      FieldName = 'M02ZC'
      Required = True
    end
    object cdsZan_M02M02ZB: TSmallintField
      FieldName = 'M02ZB'
    end
    object cdsZan_M02M02ZZA01: TSmallintField
      FieldName = 'M02ZZA01'
      Required = True
    end
    object cdsZan_M02M02ZZA02: TSmallintField
      FieldName = 'M02ZZA02'
      Required = True
    end
    object cdsZan_M02M02ZZA03: TSmallintField
      FieldName = 'M02ZZA03'
      Required = True
    end
    object cdsZan_M02M02ZZA04: TSmallintField
      FieldName = 'M02ZZA04'
      Required = True
    end
    object cdsZan_M02M02ZZA05: TSmallintField
      FieldName = 'M02ZZA05'
      Required = True
    end
    object cdsZan_M02M02ZZA06: TIntegerField
      FieldName = 'M02ZZA06'
    end
    object cdsZan_M02M02ZZA07: TIntegerField
      FieldName = 'M02ZZA07'
    end
    object cdsZan_M02M02ZZA08: TIntegerField
      FieldName = 'M02ZZA08'
    end
    object cdsZan_M02M02ZZA09: TIntegerField
      FieldName = 'M02ZZA09'
    end
    object cdsZan_M02M02ZZA10: TIntegerField
      FieldName = 'M02ZZA10'
    end
    object cdsZan_M02M02ZZB01: TSmallintField
      FieldName = 'M02ZZB01'
      Required = True
    end
    object cdsZan_M02M02ZZB02: TSmallintField
      FieldName = 'M02ZZB02'
      Required = True
    end
    object cdsZan_M02M02ZZB03: TSmallintField
      FieldName = 'M02ZZB03'
      Required = True
    end
    object cdsZan_M02M02ZZB04: TSmallintField
      FieldName = 'M02ZZB04'
      Required = True
    end
    object cdsZan_M02M02ZZB05: TSmallintField
      FieldName = 'M02ZZB05'
      Required = True
    end
    object cdsZan_M02M02ZZB06: TIntegerField
      FieldName = 'M02ZZB06'
    end
    object cdsZan_M02M02ZZB07: TIntegerField
      FieldName = 'M02ZZB07'
    end
    object cdsZan_M02M02ZZB08: TIntegerField
      FieldName = 'M02ZZB08'
    end
    object cdsZan_M02M02ZZB09: TIntegerField
      FieldName = 'M02ZZB09'
    end
    object cdsZan_M02M02ZZB10: TIntegerField
      FieldName = 'M02ZZB10'
    end
    object cdsZan_M02DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M02DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M02DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M02DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M02DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M02DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M02DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M02DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M02DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M02DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M02m02_hora_lock: TSQLTimeStampField
      FieldName = 'm02_hora_lock'
    end
    object cdsZan_M02m02_ip_lock: TStringField
      FieldName = 'm02_ip_lock'
      Size = 300
    end
    object cdsZan_M02M02AE: TSmallintField
      FieldName = 'M02AE'
    end
    object cdsZan_M02M02AG: TSmallintField
      FieldName = 'M02AG'
    end
    object cdsZan_M02M02AH: TIntegerField
      FieldName = 'M02AH'
    end
    object cdsZan_M02M02AI: TSmallintField
      FieldName = 'M02AI'
    end
    object cdsZan_M02M02AJ: TIntegerField
      FieldName = 'M02AJ'
    end
    object cdsZan_M02M02AK: TBCDField
      FieldName = 'M02AK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M02M02AL: TBCDField
      FieldName = 'M02AL'
      Precision = 12
      Size = 2
    end
    object cdsZan_M02M02AM: TStringField
      FieldName = 'M02AM'
    end
    object cdsZan_M02M02AN: TSmallintField
      FieldName = 'M02AN'
    end
    object cdsZan_M02M02AO: TIntegerField
      FieldName = 'M02AO'
    end
    object cdsZan_M02M02AP: TStringField
      FieldName = 'M02AP'
    end
    object cdsZan_M02M02AQ: TStringField
      FieldName = 'M02AQ'
    end
    object cdsZan_M02M02AR: TIntegerField
      FieldName = 'M02AR'
    end
    object cdsZan_M02M02AS: TSQLTimeStampField
      FieldName = 'M02AS'
    end
    object cdsZan_M02M02AT: TStringField
      FieldName = 'M02AT'
    end
    object cdsZan_M02M02AU: TStringField
      FieldName = 'M02AU'
    end
    object cdsZan_M02M02AV: TStringField
      FieldName = 'M02AV'
    end
    object cdsZan_M02M02AW: TSmallintField
      FieldName = 'M02AW'
    end
    object cdsZan_M02M02AX: TIntegerField
      FieldName = 'M02AX'
    end
    object cdsZan_M02M02AY: TSmallintField
      FieldName = 'M02AY'
    end
    object cdsZan_M02M02AZA: TStringField
      FieldName = 'M02AZA'
      Size = 15
    end
    object cdsZan_M02M02AZB: TIntegerField
      FieldName = 'M02AZB'
    end
    object cdsZan_M02M02BA: TIntegerField
      FieldName = 'M02BA'
    end
    object cdsZan_M02M02BBA: TSmallintField
      FieldName = 'M02BBA'
    end
    object cdsZan_M02M02BBB: TSmallintField
      FieldName = 'M02BBB'
    end
    object cdsZan_M02M02BBC: TIntegerField
      FieldName = 'M02BBC'
    end
    object cdsZan_M02M02BBD: TSmallintField
      FieldName = 'M02BBD'
    end
    object cdsZan_M02M02BC: TSmallintField
      FieldName = 'M02BC'
    end
    object cdsZan_M02M02BD: TSmallintField
      FieldName = 'M02BD'
    end
    object cdsZan_M02M02BE: TBCDField
      FieldName = 'M02BE'
      Precision = 9
      Size = 2
    end
    object cdsZan_M02M02BF: TStringField
      FieldName = 'M02BF'
    end
    object cdsZan_M02M02BG: TStringField
      FieldName = 'M02BG'
    end
    object cdsZan_M02M02BH: TSQLTimeStampField
      FieldName = 'M02BH'
    end
    object cdsZan_M02M02BI: TStringField
      FieldName = 'M02BI'
    end
    object cdsZan_M02M02BJ: TSmallintField
      FieldName = 'M02BJ'
    end
    object cdsZan_M02M02BK: TSmallintField
      FieldName = 'M02BK'
    end
    object cdsZan_M02M02BL: TStringField
      FieldName = 'M02BL'
      Size = 15
    end
    object cdsZan_M02M02BM: TStringField
      FieldName = 'M02BM'
      Size = 15
    end
    object cdsZan_M02M02BN: TStringField
      FieldName = 'M02BN'
      Size = 15
    end
    object cdsZan_M02M02BO: TStringField
      FieldName = 'M02BO'
      Size = 50
    end
    object cdsZan_M02M02BP: TStringField
      FieldName = 'M02BP'
      Size = 5
    end
    object cdsZan_M02M02BQ: TBCDField
      FieldName = 'M02BQ'
      Precision = 9
      Size = 2
    end
    object cdsZan_M02M02BR: TStringField
      FieldName = 'M02BR'
    end
    object cdsZan_M02M02BS: TIntegerField
      FieldName = 'M02BS'
    end
    object cdsZan_M02M02BU: TSmallintField
      FieldName = 'M02BU'
    end
    object cdsZan_M02M02BW: TStringField
      FieldName = 'M02BW'
    end
    object cdsZan_M02M02BX: TIntegerField
      FieldName = 'M02BX'
    end
    object cdsZan_M02M02BY: TSmallintField
      FieldName = 'M02BY'
    end
    object cdsZan_M02M02BZ: TStringField
      FieldName = 'M02BZ'
      Size = 15
    end
    object cdsZan_M02M02CA: TIntegerField
      FieldName = 'M02CA'
    end
    object cdsZan_M02M02CB: TIntegerField
      FieldName = 'M02CB'
    end
    object cdsZan_M02M02CC: TIntegerField
      FieldName = 'M02CC'
    end
    object cdsZan_M02M02CD: TStringField
      FieldName = 'M02CD'
    end
    object cdsZan_M02M02CE: TStringField
      FieldName = 'M02CE'
    end
    object cdsZan_M02M02CF: TBCDField
      FieldName = 'M02CF'
      Precision = 8
    end
    object cdsZan_M02M02CG: TIntegerField
      FieldName = 'M02CG'
    end
    object cdsZan_M02M02CH: TIntegerField
      FieldName = 'M02CH'
    end
    object cdsZan_M02M02CI: TSmallintField
      FieldName = 'M02CI'
    end
    object cdsZan_M02M02CJ: TIntegerField
      FieldName = 'M02CJ'
    end
    object cdsZan_M02M02CK: TSmallintField
      FieldName = 'M02CK'
    end
    object cdsZan_M02M02CL: TSmallintField
      FieldName = 'M02CL'
    end
    object cdsZan_M02M02CM: TIntegerField
      FieldName = 'M02CM'
    end
    object cdsZan_M02M02CN: TSmallintField
      FieldName = 'M02CN'
    end
    object cdsZan_M02M02CR: TSmallintField
      FieldName = 'M02CR'
    end
    object cdsZan_M02M02CS: TBCDField
      FieldName = 'M02CS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M02M02CT: TSmallintField
      FieldName = 'M02CT'
    end
    object cdsZan_M02M02CU: TStringField
      FieldName = 'M02CU'
      Size = 12
    end
    object cdsZan_M02M02CV: TSmallintField
      FieldName = 'M02CV'
    end
    object cdsZan_M02M02CW: TStringField
      FieldName = 'M02CW'
      Size = 5
    end
    object cdsZan_M02M02CX: TStringField
      FieldName = 'M02CX'
    end
    object cdsZan_M02M02CY: TIntegerField
      FieldName = 'M02CY'
    end
    object cdsZan_M02M02CZ: TStringField
      FieldName = 'M02CZ'
      Size = 14
    end
    object cdsZan_M02M02DA: TSmallintField
      FieldName = 'M02DA'
    end
    object cdsZan_M02M02DB: TStringField
      FieldName = 'M02DB'
    end
    object cdsZan_M02M02DC: TSmallintField
      FieldName = 'M02DC'
    end
    object cdsZan_M02M02DD: TSmallintField
      FieldName = 'M02DD'
    end
    object cdsZan_M02M02DE: TStringField
      FieldName = 'M02DE'
      Size = 40
    end
  end
  object fdqZan_M06: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m06'
      'where m00af = '#39'11/07/16'#39)
    Left = 415
    Top = 61
  end
  object dspZan_M06: TDataSetProvider
    DataSet = fdqZan_M06
    Left = 528
    Top = 61
  end
  object cdsZan_M06: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M06'
    Left = 648
    Top = 61
    object cdsZan_M06M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M06M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M06M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M06M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M06M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M06M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M06M06AB: TStringField
      FieldName = 'M06AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M06M06ZC: TSmallintField
      FieldName = 'M06ZC'
      Required = True
    end
    object cdsZan_M06M06ZB: TSmallintField
      FieldName = 'M06ZB'
    end
    object cdsZan_M06M06ZZA01: TSmallintField
      FieldName = 'M06ZZA01'
      Required = True
    end
    object cdsZan_M06M06ZZA02: TSmallintField
      FieldName = 'M06ZZA02'
      Required = True
    end
    object cdsZan_M06M06ZZA03: TSmallintField
      FieldName = 'M06ZZA03'
      Required = True
    end
    object cdsZan_M06M06ZZA04: TSmallintField
      FieldName = 'M06ZZA04'
      Required = True
    end
    object cdsZan_M06M06ZZA05: TSmallintField
      FieldName = 'M06ZZA05'
      Required = True
    end
    object cdsZan_M06M06ZZA06: TIntegerField
      FieldName = 'M06ZZA06'
    end
    object cdsZan_M06M06ZZA07: TIntegerField
      FieldName = 'M06ZZA07'
    end
    object cdsZan_M06M06ZZA08: TIntegerField
      FieldName = 'M06ZZA08'
    end
    object cdsZan_M06M06ZZA09: TIntegerField
      FieldName = 'M06ZZA09'
    end
    object cdsZan_M06M06ZZA10: TIntegerField
      FieldName = 'M06ZZA10'
    end
    object cdsZan_M06M06ZZB01: TSmallintField
      FieldName = 'M06ZZB01'
      Required = True
    end
    object cdsZan_M06M06ZZB02: TSmallintField
      FieldName = 'M06ZZB02'
      Required = True
    end
    object cdsZan_M06M06ZZB03: TSmallintField
      FieldName = 'M06ZZB03'
      Required = True
    end
    object cdsZan_M06M06ZZB04: TSmallintField
      FieldName = 'M06ZZB04'
      Required = True
    end
    object cdsZan_M06M06ZZB05: TSmallintField
      FieldName = 'M06ZZB05'
      Required = True
    end
    object cdsZan_M06M06ZZB06: TIntegerField
      FieldName = 'M06ZZB06'
    end
    object cdsZan_M06M06ZZB07: TIntegerField
      FieldName = 'M06ZZB07'
    end
    object cdsZan_M06M06ZZB08: TIntegerField
      FieldName = 'M06ZZB08'
    end
    object cdsZan_M06M06ZZB09: TIntegerField
      FieldName = 'M06ZZB09'
    end
    object cdsZan_M06M06ZZB10: TIntegerField
      FieldName = 'M06ZZB10'
    end
    object cdsZan_M06DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M06DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M06DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M06DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M06DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M06DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M06DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M06DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M06DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M06DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M06M06AE: TSmallintField
      FieldName = 'M06AE'
    end
    object cdsZan_M06M06AG: TSmallintField
      FieldName = 'M06AG'
    end
    object cdsZan_M06M06AI: TSmallintField
      FieldName = 'M06AI'
    end
    object cdsZan_M06M06AJ: TBCDField
      FieldName = 'M06AJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AK: TBCDField
      FieldName = 'M06AK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AL: TBCDField
      FieldName = 'M06AL'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AM: TBCDField
      FieldName = 'M06AM'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AN: TBCDField
      FieldName = 'M06AN'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AO: TBCDField
      FieldName = 'M06AO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AP: TBCDField
      FieldName = 'M06AP'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AQ: TBCDField
      FieldName = 'M06AQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AR: TBCDField
      FieldName = 'M06AR'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AS: TBCDField
      FieldName = 'M06AS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AT: TBCDField
      FieldName = 'M06AT'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AU: TBCDField
      FieldName = 'M06AU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AV: TBCDField
      FieldName = 'M06AV'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AW: TBCDField
      FieldName = 'M06AW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AX: TBCDField
      FieldName = 'M06AX'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06AY: TBCDField
      FieldName = 'M06AY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06AZ: TBCDField
      FieldName = 'M06AZ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06BA: TBCDField
      FieldName = 'M06BA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06BB: TBCDField
      FieldName = 'M06BB'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06BC: TBCDField
      FieldName = 'M06BC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06BD: TBCDField
      FieldName = 'M06BD'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06BE: TBCDField
      FieldName = 'M06BE'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06BF: TBCDField
      FieldName = 'M06BF'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06BG: TBCDField
      FieldName = 'M06BG'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06BH: TBCDField
      FieldName = 'M06BH'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06BI: TBCDField
      FieldName = 'M06BI'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06BJ: TBCDField
      FieldName = 'M06BJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M06M06BK: TBCDField
      FieldName = 'M06BK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M06M06BL: TSmallintField
      FieldName = 'M06BL'
    end
    object cdsZan_M06M06BN: TSmallintField
      FieldName = 'M06BN'
    end
    object cdsZan_M06M06BP: TIntegerField
      FieldName = 'M06BP'
    end
    object cdsZan_M06M06BQ: TSmallintField
      FieldName = 'M06BQ'
    end
    object cdsZan_M06M06BR: TSmallintField
      FieldName = 'M06BR'
    end
  end
  object fdqZan_M20: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m20'
      'where m00af = '#39'11/08/16'#39)
    Left = 415
    Top = 243
  end
  object dspZan_M20: TDataSetProvider
    DataSet = fdqZan_M20
    Left = 528
    Top = 243
  end
  object cdsZan_M20: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M20'
    Left = 648
    Top = 243
    object cdsZan_M20M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M20M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M20M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M20M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M20M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M20M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M20M20AB: TStringField
      FieldName = 'M20AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M20M20ZC: TSmallintField
      FieldName = 'M20ZC'
      Required = True
    end
    object cdsZan_M20M20ZB: TSmallintField
      FieldName = 'M20ZB'
    end
    object cdsZan_M20M20ZZA01: TSmallintField
      FieldName = 'M20ZZA01'
      Required = True
    end
    object cdsZan_M20M20ZZA02: TSmallintField
      FieldName = 'M20ZZA02'
      Required = True
    end
    object cdsZan_M20M20ZZA03: TSmallintField
      FieldName = 'M20ZZA03'
      Required = True
    end
    object cdsZan_M20M20ZZA04: TSmallintField
      FieldName = 'M20ZZA04'
      Required = True
    end
    object cdsZan_M20M20ZZA05: TSmallintField
      FieldName = 'M20ZZA05'
      Required = True
    end
    object cdsZan_M20M20ZZA06: TIntegerField
      FieldName = 'M20ZZA06'
    end
    object cdsZan_M20M20ZZA07: TIntegerField
      FieldName = 'M20ZZA07'
    end
    object cdsZan_M20M20ZZA08: TIntegerField
      FieldName = 'M20ZZA08'
    end
    object cdsZan_M20M20ZZA09: TIntegerField
      FieldName = 'M20ZZA09'
    end
    object cdsZan_M20M20ZZA10: TIntegerField
      FieldName = 'M20ZZA10'
    end
    object cdsZan_M20M20ZZB01: TSmallintField
      FieldName = 'M20ZZB01'
      Required = True
    end
    object cdsZan_M20M20ZZB02: TSmallintField
      FieldName = 'M20ZZB02'
      Required = True
    end
    object cdsZan_M20M20ZZB03: TSmallintField
      FieldName = 'M20ZZB03'
      Required = True
    end
    object cdsZan_M20M20ZZB04: TSmallintField
      FieldName = 'M20ZZB04'
      Required = True
    end
    object cdsZan_M20M20ZZB05: TSmallintField
      FieldName = 'M20ZZB05'
      Required = True
    end
    object cdsZan_M20M20ZZB06: TIntegerField
      FieldName = 'M20ZZB06'
    end
    object cdsZan_M20M20ZZB07: TIntegerField
      FieldName = 'M20ZZB07'
    end
    object cdsZan_M20M20ZZB08: TIntegerField
      FieldName = 'M20ZZB08'
    end
    object cdsZan_M20M20ZZB09: TIntegerField
      FieldName = 'M20ZZB09'
    end
    object cdsZan_M20M20ZZB10: TIntegerField
      FieldName = 'M20ZZB10'
    end
    object cdsZan_M20DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M20DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M20DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M20DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M20DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M20DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M20DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M20DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M20DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M20DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M20M20AE: TSmallintField
      FieldName = 'M20AE'
    end
    object cdsZan_M20M20AG: TIntegerField
      FieldName = 'M20AG'
    end
    object cdsZan_M20M20AH: TStringField
      FieldName = 'M20AH'
      Size = 15
    end
    object cdsZan_M20M20AI: TSmallintField
      FieldName = 'M20AI'
    end
    object cdsZan_M20M20AJ: TFloatField
      FieldName = 'M20AJ'
    end
    object cdsZan_M20M20AL: TSmallintField
      FieldName = 'M20AL'
    end
    object cdsZan_M20M20AN: TIntegerField
      FieldName = 'M20AN'
    end
    object cdsZan_M20M20AO: TIntegerField
      FieldName = 'M20AO'
    end
    object cdsZan_M20M20AP: TSmallintField
      FieldName = 'M20AP'
    end
    object cdsZan_M20M20AQ: TSmallintField
      FieldName = 'M20AQ'
    end
    object cdsZan_M20M20AR: TSmallintField
      FieldName = 'M20AR'
    end
    object cdsZan_M20M20AS: TSmallintField
      FieldName = 'M20AS'
    end
    object cdsZan_M20M20AT: TSmallintField
      FieldName = 'M20AT'
    end
  end
  object fdqZan_M33: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m33'
      'where m00af = '#39'11/08/16'#39)
    Left = 415
    Top = 287
  end
  object dspZan_M33: TDataSetProvider
    DataSet = fdqZan_M33
    Left = 528
    Top = 287
  end
  object cdsZan_M33: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M33'
    Left = 648
    Top = 287
    object cdsZan_M33M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M33M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M33M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M33M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M33M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M33M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M33M33AB: TStringField
      FieldName = 'M33AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M33M33ZC: TSmallintField
      FieldName = 'M33ZC'
      Required = True
    end
    object cdsZan_M33M33ZB: TSmallintField
      FieldName = 'M33ZB'
    end
    object cdsZan_M33M33ZZA01: TSmallintField
      FieldName = 'M33ZZA01'
      Required = True
    end
    object cdsZan_M33M33ZZA02: TSmallintField
      FieldName = 'M33ZZA02'
      Required = True
    end
    object cdsZan_M33M33ZZA03: TSmallintField
      FieldName = 'M33ZZA03'
      Required = True
    end
    object cdsZan_M33M33ZZA04: TSmallintField
      FieldName = 'M33ZZA04'
      Required = True
    end
    object cdsZan_M33M33ZZA05: TSmallintField
      FieldName = 'M33ZZA05'
      Required = True
    end
    object cdsZan_M33M33ZZA06: TIntegerField
      FieldName = 'M33ZZA06'
    end
    object cdsZan_M33M33ZZA07: TIntegerField
      FieldName = 'M33ZZA07'
    end
    object cdsZan_M33M33ZZA08: TIntegerField
      FieldName = 'M33ZZA08'
    end
    object cdsZan_M33M33ZZA09: TIntegerField
      FieldName = 'M33ZZA09'
    end
    object cdsZan_M33M33ZZA10: TIntegerField
      FieldName = 'M33ZZA10'
    end
    object cdsZan_M33M33ZZB01: TSmallintField
      FieldName = 'M33ZZB01'
      Required = True
    end
    object cdsZan_M33M33ZZB02: TSmallintField
      FieldName = 'M33ZZB02'
      Required = True
    end
    object cdsZan_M33M33ZZB03: TSmallintField
      FieldName = 'M33ZZB03'
      Required = True
    end
    object cdsZan_M33M33ZZB04: TSmallintField
      FieldName = 'M33ZZB04'
      Required = True
    end
    object cdsZan_M33M33ZZB05: TSmallintField
      FieldName = 'M33ZZB05'
      Required = True
    end
    object cdsZan_M33M33ZZB06: TIntegerField
      FieldName = 'M33ZZB06'
    end
    object cdsZan_M33M33ZZB07: TIntegerField
      FieldName = 'M33ZZB07'
    end
    object cdsZan_M33M33ZZB08: TIntegerField
      FieldName = 'M33ZZB08'
    end
    object cdsZan_M33M33ZZB09: TIntegerField
      FieldName = 'M33ZZB09'
    end
    object cdsZan_M33M33ZZB10: TIntegerField
      FieldName = 'M33ZZB10'
    end
    object cdsZan_M33DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M33DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M33DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M33DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M33DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M33DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M33DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M33DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M33DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M33DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M33M33AE: TSmallintField
      FieldName = 'M33AE'
    end
    object cdsZan_M33M33AG: TSmallintField
      FieldName = 'M33AG'
    end
    object cdsZan_M33M33AH: TStringField
      FieldName = 'M33AH'
    end
    object cdsZan_M33M33AI: TSmallintField
      FieldName = 'M33AI'
    end
    object cdsZan_M33M33AJ: TBCDField
      FieldName = 'M33AJ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M33M33AK: TStringField
      FieldName = 'M33AK'
    end
    object cdsZan_M33M33AM: TSmallintField
      FieldName = 'M33AM'
    end
    object cdsZan_M33M33AO: TIntegerField
      FieldName = 'M33AO'
    end
    object cdsZan_M33M33AP: TSmallintField
      FieldName = 'M33AP'
    end
    object cdsZan_M33M33AQ: TSmallintField
      FieldName = 'M33AQ'
    end
    object cdsZan_M33M33AR: TIntegerField
      FieldName = 'M33AR'
    end
  end
  object fdqZan_M36: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m36'
      'where m00af = '#39'11/07/16'#39)
    Left = 415
    Top = 331
  end
  object dspZan_M36: TDataSetProvider
    DataSet = fdqZan_M36
    Left = 528
    Top = 331
  end
  object cdsZan_M36: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M36'
    Left = 648
    Top = 331
    object cdsZan_M36M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M36M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M36M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M36M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M36M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M36M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M36M36AB: TStringField
      FieldName = 'M36AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M36M36ZC: TSmallintField
      FieldName = 'M36ZC'
      Required = True
    end
    object cdsZan_M36M36ZB: TSmallintField
      FieldName = 'M36ZB'
    end
    object cdsZan_M36M36ZZA01: TSmallintField
      FieldName = 'M36ZZA01'
      Required = True
    end
    object cdsZan_M36M36ZZA02: TSmallintField
      FieldName = 'M36ZZA02'
      Required = True
    end
    object cdsZan_M36M36ZZA03: TSmallintField
      FieldName = 'M36ZZA03'
      Required = True
    end
    object cdsZan_M36M36ZZA04: TSmallintField
      FieldName = 'M36ZZA04'
      Required = True
    end
    object cdsZan_M36M36ZZA05: TSmallintField
      FieldName = 'M36ZZA05'
      Required = True
    end
    object cdsZan_M36M36ZZA06: TIntegerField
      FieldName = 'M36ZZA06'
    end
    object cdsZan_M36M36ZZA07: TIntegerField
      FieldName = 'M36ZZA07'
    end
    object cdsZan_M36M36ZZA08: TIntegerField
      FieldName = 'M36ZZA08'
    end
    object cdsZan_M36M36ZZA09: TIntegerField
      FieldName = 'M36ZZA09'
    end
    object cdsZan_M36M36ZZA10: TIntegerField
      FieldName = 'M36ZZA10'
    end
    object cdsZan_M36M36ZZB01: TSmallintField
      FieldName = 'M36ZZB01'
      Required = True
    end
    object cdsZan_M36M36ZZB02: TSmallintField
      FieldName = 'M36ZZB02'
      Required = True
    end
    object cdsZan_M36M36ZZB03: TSmallintField
      FieldName = 'M36ZZB03'
      Required = True
    end
    object cdsZan_M36M36ZZB04: TSmallintField
      FieldName = 'M36ZZB04'
      Required = True
    end
    object cdsZan_M36M36ZZB05: TSmallintField
      FieldName = 'M36ZZB05'
      Required = True
    end
    object cdsZan_M36M36ZZB06: TIntegerField
      FieldName = 'M36ZZB06'
    end
    object cdsZan_M36M36ZZB07: TIntegerField
      FieldName = 'M36ZZB07'
    end
    object cdsZan_M36M36ZZB08: TIntegerField
      FieldName = 'M36ZZB08'
    end
    object cdsZan_M36M36ZZB09: TIntegerField
      FieldName = 'M36ZZB09'
    end
    object cdsZan_M36M36ZZB10: TIntegerField
      FieldName = 'M36ZZB10'
    end
    object cdsZan_M36DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M36DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M36DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M36DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M36DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M36DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M36DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M36DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M36DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M36DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M36M36AE: TSmallintField
      FieldName = 'M36AE'
    end
    object cdsZan_M36M36AG: TSmallintField
      FieldName = 'M36AG'
    end
    object cdsZan_M36M36AH: TStringField
      FieldName = 'M36AH'
    end
    object cdsZan_M36M36AI: TIntegerField
      FieldName = 'M36AI'
    end
    object cdsZan_M36M36AJ: TSmallintField
      FieldName = 'M36AJ'
    end
    object cdsZan_M36M36AK: TSmallintField
      FieldName = 'M36AK'
    end
    object cdsZan_M36M36AL: TSmallintField
      FieldName = 'M36AL'
    end
    object cdsZan_M36M36AM: TIntegerField
      FieldName = 'M36AM'
    end
    object cdsZan_M36M36AN: TBCDField
      FieldName = 'M36AN'
      Precision = 5
      Size = 2
    end
    object cdsZan_M36M36AO: TBCDField
      FieldName = 'M36AO'
      Precision = 9
      Size = 3
    end
    object cdsZan_M36M36AP: TBCDField
      FieldName = 'M36AP'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36AQ: TBCDField
      FieldName = 'M36AQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36AR: TStringField
      FieldName = 'M36AR'
    end
    object cdsZan_M36M36AS: TSmallintField
      FieldName = 'M36AS'
    end
    object cdsZan_M36M36AT: TBCDField
      FieldName = 'M36AT'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36AU: TBCDField
      FieldName = 'M36AU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36AV: TBCDField
      FieldName = 'M36AV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36AW: TSmallintField
      FieldName = 'M36AW'
    end
    object cdsZan_M36M36AX: TBCDField
      FieldName = 'M36AX'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36AY: TBCDField
      FieldName = 'M36AY'
      Precision = 5
      Size = 2
    end
    object cdsZan_M36M36AZ: TSmallintField
      FieldName = 'M36AZ'
    end
    object cdsZan_M36M36BA: TBCDField
      FieldName = 'M36BA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36BB: TStringField
      FieldName = 'M36BB'
    end
    object cdsZan_M36M36BC: TSmallintField
      FieldName = 'M36BC'
    end
    object cdsZan_M36M36BD: TStringField
      FieldName = 'M36BD'
    end
    object cdsZan_M36M36BE: TStringField
      FieldName = 'M36BE'
      Size = 15
    end
    object cdsZan_M36M36BF: TStringField
      FieldName = 'M36BF'
      Size = 30
    end
    object cdsZan_M36M36BG: TBCDField
      FieldName = 'M36BG'
      Precision = 9
      Size = 3
    end
    object cdsZan_M36M36BH: TIntegerField
      FieldName = 'M36BH'
    end
    object cdsZan_M36M36BI: TBCDField
      FieldName = 'M36BI'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36BJ: TSmallintField
      FieldName = 'M36BJ'
    end
    object cdsZan_M36M36BK: TStringField
      FieldName = 'M36BK'
    end
    object cdsZan_M36M36BM: TSmallintField
      FieldName = 'M36BM'
    end
    object cdsZan_M36M36BO: TSmallintField
      FieldName = 'M36BO'
    end
    object cdsZan_M36M36BP: TStringField
      FieldName = 'M36BP'
    end
    object cdsZan_M36M36BQ: TSmallintField
      FieldName = 'M36BQ'
    end
    object cdsZan_M36M36BR: TSmallintField
      FieldName = 'M36BR'
    end
    object cdsZan_M36M36BS: TBCDField
      FieldName = 'M36BS'
      Precision = 14
    end
    object cdsZan_M36M36BT: TBCDField
      FieldName = 'M36BT'
      Precision = 14
    end
    object cdsZan_M36M36BU: TBCDField
      FieldName = 'M36BU'
      Precision = 14
    end
    object cdsZan_M36M36BV: TSmallintField
      FieldName = 'M36BV'
    end
    object cdsZan_M36M36BW: TIntegerField
      FieldName = 'M36BW'
    end
    object cdsZan_M36M36BX: TIntegerField
      FieldName = 'M36BX'
    end
    object cdsZan_M36M36BY: TSmallintField
      FieldName = 'M36BY'
    end
    object cdsZan_M36M36BZ: TSmallintField
      FieldName = 'M36BZ'
    end
    object cdsZan_M36M36CA: TBCDField
      FieldName = 'M36CA'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CA02: TBCDField
      FieldName = 'M36CA02'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CA03: TBCDField
      FieldName = 'M36CA03'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CA04: TBCDField
      FieldName = 'M36CA04'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CA05: TBCDField
      FieldName = 'M36CA05'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CB: TBCDField
      FieldName = 'M36CB'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CB02: TBCDField
      FieldName = 'M36CB02'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CB03: TBCDField
      FieldName = 'M36CB03'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CB04: TBCDField
      FieldName = 'M36CB04'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CB05: TBCDField
      FieldName = 'M36CB05'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CC: TBCDField
      FieldName = 'M36CC'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CC02: TBCDField
      FieldName = 'M36CC02'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CC03: TBCDField
      FieldName = 'M36CC03'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CC04: TBCDField
      FieldName = 'M36CC04'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CC05: TBCDField
      FieldName = 'M36CC05'
      Precision = 9
      Size = 2
    end
    object cdsZan_M36M36CD: TSmallintField
      FieldName = 'M36CD'
    end
    object cdsZan_M36M36CE: TIntegerField
      FieldName = 'M36CE'
    end
    object cdsZan_M36M36CF: TSmallintField
      FieldName = 'M36CF'
    end
    object cdsZan_M36M36CG: TIntegerField
      FieldName = 'M36CG'
    end
    object cdsZan_M36M36CH: TIntegerField
      FieldName = 'M36CH'
    end
    object cdsZan_M36M36CH02: TIntegerField
      FieldName = 'M36CH02'
    end
    object cdsZan_M36M36CH03: TIntegerField
      FieldName = 'M36CH03'
    end
    object cdsZan_M36M36CH04: TIntegerField
      FieldName = 'M36CH04'
    end
    object cdsZan_M36M36CH05: TIntegerField
      FieldName = 'M36CH05'
    end
    object cdsZan_M36M36CI: TIntegerField
      FieldName = 'M36CI'
    end
    object cdsZan_M36M36CJ: TIntegerField
      FieldName = 'M36CJ'
    end
    object cdsZan_M36M36CK: TSmallintField
      FieldName = 'M36CK'
    end
    object cdsZan_M36M36CL: TSmallintField
      FieldName = 'M36CL'
    end
    object cdsZan_M36M36CM: TStringField
      FieldName = 'M36CM'
    end
    object cdsZan_M36M36CN: TSmallintField
      FieldName = 'M36CN'
    end
    object cdsZan_M36M36CO: TStringField
      FieldName = 'M36CO'
    end
    object cdsZan_M36M36CP: TSmallintField
      FieldName = 'M36CP'
    end
    object cdsZan_M36M36CQ: TStringField
      FieldName = 'M36CQ'
    end
    object cdsZan_M36M36CR: TSmallintField
      FieldName = 'M36CR'
    end
    object cdsZan_M36M36CS: TStringField
      FieldName = 'M36CS'
    end
    object cdsZan_M36M36CT: TSmallintField
      FieldName = 'M36CT'
    end
    object cdsZan_M36M36CU: TStringField
      FieldName = 'M36CU'
    end
    object cdsZan_M36M36CV: TIntegerField
      FieldName = 'M36CV'
    end
    object cdsZan_M36M36CW: TSmallintField
      FieldName = 'M36CW'
    end
    object cdsZan_M36M36CX: TSmallintField
      FieldName = 'M36CX'
    end
    object cdsZan_M36M36CY: TIntegerField
      FieldName = 'M36CY'
    end
    object cdsZan_M36M36CZ: TIntegerField
      FieldName = 'M36CZ'
    end
    object cdsZan_M36M36DA: TIntegerField
      FieldName = 'M36DA'
    end
    object cdsZan_M36M36DB: TIntegerField
      FieldName = 'M36DB'
    end
    object cdsZan_M36M36DC: TIntegerField
      FieldName = 'M36DC'
    end
    object cdsZan_M36M36DD: TSmallintField
      FieldName = 'M36DD'
    end
    object cdsZan_M36M36DE: TIntegerField
      FieldName = 'M36DE'
    end
    object cdsZan_M36M36DF: TSmallintField
      FieldName = 'M36DF'
    end
    object cdsZan_M36M36DG: TIntegerField
      FieldName = 'M36DG'
    end
    object cdsZan_M36M36DH: TStringField
      FieldName = 'M36DH'
    end
    object cdsZan_M36M36DI: TBCDField
      FieldName = 'M36DI'
      Precision = 9
    end
    object cdsZan_M36M36DI02: TBCDField
      FieldName = 'M36DI02'
      Precision = 9
    end
    object cdsZan_M36M36DI03: TBCDField
      FieldName = 'M36DI03'
      Precision = 9
    end
    object cdsZan_M36M36DI04: TBCDField
      FieldName = 'M36DI04'
      Precision = 9
    end
    object cdsZan_M36M36DI05: TBCDField
      FieldName = 'M36DI05'
      Precision = 9
    end
    object cdsZan_M36M36DJ: TBCDField
      FieldName = 'M36DJ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36DM: TIntegerField
      FieldName = 'M36DM'
    end
    object cdsZan_M36M36DN: TSmallintField
      FieldName = 'M36DN'
    end
    object cdsZan_M36M36DO: TIntegerField
      FieldName = 'M36DO'
    end
    object cdsZan_M36M36DP: TSmallintField
      FieldName = 'M36DP'
    end
    object cdsZan_M36M36DQ: TBCDField
      FieldName = 'M36DQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36DR: TBCDField
      FieldName = 'M36DR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36DS: TStringField
      FieldName = 'M36DS'
      Size = 30
    end
    object cdsZan_M36M36DT: TStringField
      FieldName = 'M36DT'
      Size = 50
    end
    object cdsZan_M36M36DU: TSmallintField
      FieldName = 'M36DU'
    end
    object cdsZan_M36M36DV: TBCDField
      FieldName = 'M36DV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36DW: TSmallintField
      FieldName = 'M36DW'
    end
    object cdsZan_M36M36DX: TSmallintField
      FieldName = 'M36DX'
    end
    object cdsZan_M36M36DY: TSmallintField
      FieldName = 'M36DY'
    end
    object cdsZan_M36M36DZ: TStringField
      FieldName = 'M36DZ'
    end
    object cdsZan_M36M36EA: TSmallintField
      FieldName = 'M36EA'
    end
    object cdsZan_M36M36EB: TBCDField
      FieldName = 'M36EB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36EC: TBCDField
      FieldName = 'M36EC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36ED: TBCDField
      FieldName = 'M36ED'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36EE: TSmallintField
      FieldName = 'M36EE'
    end
    object cdsZan_M36M36EFA: TBCDField
      FieldName = 'M36EFA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36EFB: TSmallintField
      FieldName = 'M36EFB'
    end
    object cdsZan_M36M36EFC: TIntegerField
      FieldName = 'M36EFC'
    end
    object cdsZan_M36M36EFD: TIntegerField
      FieldName = 'M36EFD'
    end
    object cdsZan_M36M36EG: TSmallintField
      FieldName = 'M36EG'
    end
    object cdsZan_M36M36EH: TSmallintField
      FieldName = 'M36EH'
    end
    object cdsZan_M36M36EI: TIntegerField
      FieldName = 'M36EI'
    end
    object cdsZan_M36M36EJA: TSmallintField
      FieldName = 'M36EJA'
    end
    object cdsZan_M36M36EJB: TBCDField
      FieldName = 'M36EJB'
      Precision = 5
      Size = 2
    end
    object cdsZan_M36M36EJC: TBCDField
      FieldName = 'M36EJC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36M36EJD: TBCDField
      FieldName = 'M36EJD'
      Precision = 12
      Size = 2
    end
    object cdsZan_M36val_liquido: TBCDField
      FieldName = 'val_liquido'
      Precision = 12
      Size = 2
    end
  end
  object fdqZan_M46: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m46'
      'where m00af = '#39'2016-12-14'#39
      'and m46bl = 1')
    Left = 415
    Top = 376
  end
  object dspZan_M46: TDataSetProvider
    DataSet = fdqZan_M46
    Left = 528
    Top = 376
  end
  object cdsZan_M46: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M46'
    Left = 648
    Top = 376
    object cdsZan_M46M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M46M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M46M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M46M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M46M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M46M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M46M46AB: TStringField
      FieldName = 'M46AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M46M46ZC: TSmallintField
      FieldName = 'M46ZC'
      Required = True
    end
    object cdsZan_M46M46ZB: TSmallintField
      FieldName = 'M46ZB'
    end
    object cdsZan_M46M46ZZA01: TSmallintField
      FieldName = 'M46ZZA01'
      Required = True
    end
    object cdsZan_M46M46ZZA02: TSmallintField
      FieldName = 'M46ZZA02'
      Required = True
    end
    object cdsZan_M46M46ZZA03: TSmallintField
      FieldName = 'M46ZZA03'
      Required = True
    end
    object cdsZan_M46M46ZZA04: TSmallintField
      FieldName = 'M46ZZA04'
      Required = True
    end
    object cdsZan_M46M46ZZA05: TSmallintField
      FieldName = 'M46ZZA05'
      Required = True
    end
    object cdsZan_M46M46ZZA06: TIntegerField
      FieldName = 'M46ZZA06'
    end
    object cdsZan_M46M46ZZA07: TIntegerField
      FieldName = 'M46ZZA07'
    end
    object cdsZan_M46M46ZZA08: TIntegerField
      FieldName = 'M46ZZA08'
    end
    object cdsZan_M46M46ZZA09: TIntegerField
      FieldName = 'M46ZZA09'
    end
    object cdsZan_M46M46ZZA10: TIntegerField
      FieldName = 'M46ZZA10'
    end
    object cdsZan_M46M46ZZB01: TSmallintField
      FieldName = 'M46ZZB01'
      Required = True
    end
    object cdsZan_M46M46ZZB02: TSmallintField
      FieldName = 'M46ZZB02'
      Required = True
    end
    object cdsZan_M46M46ZZB03: TSmallintField
      FieldName = 'M46ZZB03'
      Required = True
    end
    object cdsZan_M46M46ZZB04: TSmallintField
      FieldName = 'M46ZZB04'
      Required = True
    end
    object cdsZan_M46M46ZZB05: TSmallintField
      FieldName = 'M46ZZB05'
      Required = True
    end
    object cdsZan_M46M46ZZB06: TIntegerField
      FieldName = 'M46ZZB06'
    end
    object cdsZan_M46M46ZZB07: TIntegerField
      FieldName = 'M46ZZB07'
    end
    object cdsZan_M46M46ZZB08: TIntegerField
      FieldName = 'M46ZZB08'
    end
    object cdsZan_M46M46ZZB09: TIntegerField
      FieldName = 'M46ZZB09'
    end
    object cdsZan_M46M46ZZB10: TIntegerField
      FieldName = 'M46ZZB10'
    end
    object cdsZan_M46DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M46DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M46DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M46DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M46DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M46DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M46DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M46DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M46DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M46DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M46M46ZZC01: TStringField
      FieldName = 'M46ZZC01'
      Size = 14
    end
    object cdsZan_M46DTA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DTA_ULTIMA_ALTERACAO'
    end
    object cdsZan_M46M46AE: TSmallintField
      FieldName = 'M46AE'
    end
    object cdsZan_M46M46AG: TSmallintField
      FieldName = 'M46AG'
    end
    object cdsZan_M46M46AI: TSmallintField
      FieldName = 'M46AI'
    end
    object cdsZan_M46M46AJ: TIntegerField
      FieldName = 'M46AJ'
    end
    object cdsZan_M46M46AK: TIntegerField
      FieldName = 'M46AK'
    end
    object cdsZan_M46M46AL: TIntegerField
      FieldName = 'M46AL'
    end
    object cdsZan_M46M46AM: TBCDField
      FieldName = 'M46AM'
      Precision = 16
      Size = 2
    end
    object cdsZan_M46M46AN: TBCDField
      FieldName = 'M46AN'
      Precision = 16
      Size = 2
    end
    object cdsZan_M46M46AO: TBCDField
      FieldName = 'M46AO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AP: TBCDField
      FieldName = 'M46AP'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AQ: TBCDField
      FieldName = 'M46AQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AR: TBCDField
      FieldName = 'M46AR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AS: TBCDField
      FieldName = 'M46AS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AT: TBCDField
      FieldName = 'M46AT'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AU: TBCDField
      FieldName = 'M46AU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AV: TBCDField
      FieldName = 'M46AV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AW: TBCDField
      FieldName = 'M46AW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AX: TBCDField
      FieldName = 'M46AX'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AY: TBCDField
      FieldName = 'M46AY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46AZ: TBCDField
      FieldName = 'M46AZ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46BA: TBCDField
      FieldName = 'M46BA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46BB: TStringField
      FieldName = 'M46BB'
      Size = 25
    end
    object cdsZan_M46M46BC: TIntegerField
      FieldName = 'M46BC'
    end
    object cdsZan_M46M46BE: TSmallintField
      FieldName = 'M46BE'
    end
    object cdsZan_M46M46BG: TBCDField
      FieldName = 'M46BG'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46BH: TIntegerField
      FieldName = 'M46BH'
    end
    object cdsZan_M46M46BI: TSmallintField
      FieldName = 'M46BI'
    end
    object cdsZan_M46M46BJ: TSmallintField
      FieldName = 'M46BJ'
    end
    object cdsZan_M46M46BK: TIntegerField
      FieldName = 'M46BK'
    end
    object cdsZan_M46M46BL: TSmallintField
      FieldName = 'M46BL'
    end
    object cdsZan_M46M46BM: TStringField
      FieldName = 'M46BM'
      Size = 25
    end
    object cdsZan_M46M46BN: TSmallintField
      FieldName = 'M46BN'
    end
    object cdsZan_M46M46BOA: TBCDField
      FieldName = 'M46BOA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46BOB: TBCDField
      FieldName = 'M46BOB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46BOC: TBCDField
      FieldName = 'M46BOC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46BOD: TBCDField
      FieldName = 'M46BOD'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAJ: TBCDField
      FieldName = 'M46XAJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAK: TBCDField
      FieldName = 'M46XAK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAL: TBCDField
      FieldName = 'M46XAL'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAM: TBCDField
      FieldName = 'M46XAM'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAN: TBCDField
      FieldName = 'M46XAN'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAO: TBCDField
      FieldName = 'M46XAO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAP: TBCDField
      FieldName = 'M46XAP'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAQ: TBCDField
      FieldName = 'M46XAQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAR: TBCDField
      FieldName = 'M46XAR'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAS: TBCDField
      FieldName = 'M46XAS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAT: TBCDField
      FieldName = 'M46XAT'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAU: TBCDField
      FieldName = 'M46XAU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAV: TBCDField
      FieldName = 'M46XAV'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAW: TBCDField
      FieldName = 'M46XAW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAX: TBCDField
      FieldName = 'M46XAX'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XAY: TBCDField
      FieldName = 'M46XAY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XAZ: TBCDField
      FieldName = 'M46XAZ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XBA: TBCDField
      FieldName = 'M46XBA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XBB: TBCDField
      FieldName = 'M46XBB'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XBC: TBCDField
      FieldName = 'M46XBC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XBD: TBCDField
      FieldName = 'M46XBD'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XBE: TBCDField
      FieldName = 'M46XBE'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XBF: TBCDField
      FieldName = 'M46XBF'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XBG: TBCDField
      FieldName = 'M46XBG'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XBH: TBCDField
      FieldName = 'M46XBH'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XBI: TBCDField
      FieldName = 'M46XBI'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XBJ: TBCDField
      FieldName = 'M46XBJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M46M46XBK: TBCDField
      FieldName = 'M46XBK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M46M46XBL: TSmallintField
      FieldName = 'M46XBL'
    end
  end
  object fdqZan_M0_51: TFDQuery
    Connection = fdcZeusRetail
    SQL.Strings = (
      'select * from zan_m051'
      'where m00af = '#39'01/05/17'#39)
    Left = 415
    Top = 423
  end
  object dspZan_M0_51: TDataSetProvider
    DataSet = fdqZan_M0_51
    Left = 528
    Top = 423
  end
  object cdsZan_M0_51: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZan_M0_51'
    Left = 648
    Top = 423
    object cdsZan_M0_51M00AF: TSQLTimeStampField
      FieldName = 'M00AF'
      Required = True
    end
    object cdsZan_M0_51M00ZA: TSmallintField
      FieldName = 'M00ZA'
      Required = True
    end
    object cdsZan_M0_51M00AC: TSmallintField
      FieldName = 'M00AC'
      Required = True
    end
    object cdsZan_M0_51M00_CRO: TIntegerField
      FieldName = 'M00_CRO'
      Required = True
    end
    object cdsZan_M0_51M00AD: TIntegerField
      FieldName = 'M00AD'
      Required = True
    end
    object cdsZan_M0_51M00_TRN: TIntegerField
      FieldName = 'M00_TRN'
      Required = True
    end
    object cdsZan_M0_51M05AB: TStringField
      FieldName = 'M05AB'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsZan_M0_51M05ZC: TSmallintField
      FieldName = 'M05ZC'
      Required = True
    end
    object cdsZan_M0_51M05ZB: TSmallintField
      FieldName = 'M05ZB'
    end
    object cdsZan_M0_51M05ZZA01: TSmallintField
      FieldName = 'M05ZZA01'
      Required = True
    end
    object cdsZan_M0_51M05ZZA02: TSmallintField
      FieldName = 'M05ZZA02'
      Required = True
    end
    object cdsZan_M0_51M05ZZA03: TSmallintField
      FieldName = 'M05ZZA03'
      Required = True
    end
    object cdsZan_M0_51M05ZZA04: TSmallintField
      FieldName = 'M05ZZA04'
      Required = True
    end
    object cdsZan_M0_51M05ZZA05: TSmallintField
      FieldName = 'M05ZZA05'
      Required = True
    end
    object cdsZan_M0_51M05ZZB01: TSmallintField
      FieldName = 'M05ZZB01'
      Required = True
    end
    object cdsZan_M0_51M05ZZB02: TSmallintField
      FieldName = 'M05ZZB02'
      Required = True
    end
    object cdsZan_M0_51M05ZZB03: TSmallintField
      FieldName = 'M05ZZB03'
      Required = True
    end
    object cdsZan_M0_51M05ZZB04: TSmallintField
      FieldName = 'M05ZZB04'
      Required = True
    end
    object cdsZan_M0_51M05ZZB05: TSmallintField
      FieldName = 'M05ZZB05'
      Required = True
    end
    object cdsZan_M0_51DATA_ZZB01: TSQLTimeStampField
      FieldName = 'DATA_ZZB01'
    end
    object cdsZan_M0_51DATA_ZZB02: TSQLTimeStampField
      FieldName = 'DATA_ZZB02'
    end
    object cdsZan_M0_51DATA_ZZB03: TSQLTimeStampField
      FieldName = 'DATA_ZZB03'
    end
    object cdsZan_M0_51DATA_ZZB04: TSQLTimeStampField
      FieldName = 'DATA_ZZB04'
    end
    object cdsZan_M0_51DATA_ZZB05: TSQLTimeStampField
      FieldName = 'DATA_ZZB05'
    end
    object cdsZan_M0_51M05ZZC01: TStringField
      FieldName = 'M05ZZC01'
      Size = 14
    end
    object cdsZan_M0_51DTA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DTA_ULTIMA_ALTERACAO'
    end
    object cdsZan_M0_51M05AE: TSmallintField
      FieldName = 'M05AE'
    end
    object cdsZan_M0_51M05AG: TSmallintField
      FieldName = 'M05AG'
    end
    object cdsZan_M0_51M05AI: TSmallintField
      FieldName = 'M05AI'
    end
    object cdsZan_M0_51M05AJ: TIntegerField
      FieldName = 'M05AJ'
    end
    object cdsZan_M0_51M05AK: TIntegerField
      FieldName = 'M05AK'
    end
    object cdsZan_M0_51M05AL: TIntegerField
      FieldName = 'M05AL'
    end
    object cdsZan_M0_51M05AM: TBCDField
      FieldName = 'M05AM'
      Precision = 16
      Size = 2
    end
    object cdsZan_M0_51M05AN: TBCDField
      FieldName = 'M05AN'
      Precision = 16
      Size = 2
    end
    object cdsZan_M0_51M05AO: TBCDField
      FieldName = 'M05AO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AP: TBCDField
      FieldName = 'M05AP'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AQ: TBCDField
      FieldName = 'M05AQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AR: TBCDField
      FieldName = 'M05AR'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AS: TBCDField
      FieldName = 'M05AS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AT: TBCDField
      FieldName = 'M05AT'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AU: TBCDField
      FieldName = 'M05AU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AV: TBCDField
      FieldName = 'M05AV'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AW: TBCDField
      FieldName = 'M05AW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AX: TBCDField
      FieldName = 'M05AX'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AY: TBCDField
      FieldName = 'M05AY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05AZ: TBCDField
      FieldName = 'M05AZ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05BA: TBCDField
      FieldName = 'M05BA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05BB: TStringField
      FieldName = 'M05BB'
      Size = 25
    end
    object cdsZan_M0_51M05BC: TIntegerField
      FieldName = 'M05BC'
    end
    object cdsZan_M0_51M05BE: TSmallintField
      FieldName = 'M05BE'
    end
    object cdsZan_M0_51M05BG: TBCDField
      FieldName = 'M05BG'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05BH: TIntegerField
      FieldName = 'M05BH'
    end
    object cdsZan_M0_51M05BI: TSmallintField
      FieldName = 'M05BI'
    end
    object cdsZan_M0_51M05BJ: TSmallintField
      FieldName = 'M05BJ'
    end
    object cdsZan_M0_51M05BK: TIntegerField
      FieldName = 'M05BK'
    end
    object cdsZan_M0_51M05BL: TSmallintField
      FieldName = 'M05BL'
    end
    object cdsZan_M0_51M05BM: TStringField
      FieldName = 'M05BM'
      Size = 25
    end
    object cdsZan_M0_51M05XAJ: TBCDField
      FieldName = 'M05XAJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAK: TBCDField
      FieldName = 'M05XAK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAL: TBCDField
      FieldName = 'M05XAL'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAM: TBCDField
      FieldName = 'M05XAM'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAN: TBCDField
      FieldName = 'M05XAN'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAO: TBCDField
      FieldName = 'M05XAO'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAP: TBCDField
      FieldName = 'M05XAP'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAQ: TBCDField
      FieldName = 'M05XAQ'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAR: TBCDField
      FieldName = 'M05XAR'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAS: TBCDField
      FieldName = 'M05XAS'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAT: TBCDField
      FieldName = 'M05XAT'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAU: TBCDField
      FieldName = 'M05XAU'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAV: TBCDField
      FieldName = 'M05XAV'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAW: TBCDField
      FieldName = 'M05XAW'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAX: TBCDField
      FieldName = 'M05XAX'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XAY: TBCDField
      FieldName = 'M05XAY'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XAZ: TBCDField
      FieldName = 'M05XAZ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XBA: TBCDField
      FieldName = 'M05XBA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XBB: TBCDField
      FieldName = 'M05XBB'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XBC: TBCDField
      FieldName = 'M05XBC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XBD: TBCDField
      FieldName = 'M05XBD'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XBE: TBCDField
      FieldName = 'M05XBE'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XBF: TBCDField
      FieldName = 'M05XBF'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XBG: TBCDField
      FieldName = 'M05XBG'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XBH: TBCDField
      FieldName = 'M05XBH'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XBI: TBCDField
      FieldName = 'M05XBI'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XBJ: TBCDField
      FieldName = 'M05XBJ'
      Precision = 5
      Size = 2
    end
    object cdsZan_M0_51M05XBK: TBCDField
      FieldName = 'M05XBK'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05XBL: TSmallintField
      FieldName = 'M05XBL'
    end
    object cdsZan_M0_51M05ZZA06: TIntegerField
      FieldName = 'M05ZZA06'
    end
    object cdsZan_M0_51M05ZZA07: TIntegerField
      FieldName = 'M05ZZA07'
    end
    object cdsZan_M0_51M05ZZA08: TIntegerField
      FieldName = 'M05ZZA08'
    end
    object cdsZan_M0_51M05ZZA09: TIntegerField
      FieldName = 'M05ZZA09'
    end
    object cdsZan_M0_51M05ZZA10: TIntegerField
      FieldName = 'M05ZZA10'
    end
    object cdsZan_M0_51M05ZZB06: TIntegerField
      FieldName = 'M05ZZB06'
    end
    object cdsZan_M0_51M05ZZB07: TIntegerField
      FieldName = 'M05ZZB07'
    end
    object cdsZan_M0_51M05ZZB08: TIntegerField
      FieldName = 'M05ZZB08'
    end
    object cdsZan_M0_51M05ZZB09: TIntegerField
      FieldName = 'M05ZZB09'
    end
    object cdsZan_M0_51M05ZZB10: TIntegerField
      FieldName = 'M05ZZB10'
    end
    object cdsZan_M0_51DATA_ZZB06: TSQLTimeStampField
      FieldName = 'DATA_ZZB06'
    end
    object cdsZan_M0_51DATA_ZZB07: TSQLTimeStampField
      FieldName = 'DATA_ZZB07'
    end
    object cdsZan_M0_51DATA_ZZB08: TSQLTimeStampField
      FieldName = 'DATA_ZZB08'
    end
    object cdsZan_M0_51DATA_ZZB09: TSQLTimeStampField
      FieldName = 'DATA_ZZB09'
    end
    object cdsZan_M0_51DATA_ZZB10: TSQLTimeStampField
      FieldName = 'DATA_ZZB10'
    end
    object cdsZan_M0_51M05BN: TSmallintField
      FieldName = 'M05BN'
    end
    object cdsZan_M0_51M05BOA: TBCDField
      FieldName = 'M05BOA'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05BOB: TBCDField
      FieldName = 'M05BOB'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05BOC: TBCDField
      FieldName = 'M05BOC'
      Precision = 12
      Size = 2
    end
    object cdsZan_M0_51M05BOD: TBCDField
      FieldName = 'M05BOD'
      Precision = 12
      Size = 2
    end
  end
end
