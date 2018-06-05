unit dataMProvider;

interface

uses
  System.SysUtils, System.Classes, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  MidasLib, Dialogs, IdBaseComponent, IdIntercept, IdBlockCipherIntercept, Forms,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageXML, MaskUtils;

type
  TdmMProvider = class(TDataModule)
    dspEstados: TDataSetProvider;
    cdsEstados: TClientDataSet;
    cdsEstadosSIGLA: TStringField;
    cdsEstadosNOME: TStringField;
    cdsEstadosCODIGO_ESTADO_IBGE: TIntegerField;
    cdsEstadosMVA: TCurrencyField;
    cdsEstadosICMS_INTERESTADUAL: TBCDField;
    cdsEstadosICMS_INTERNO: TBCDField;
    dspCidades: TDataSetProvider;
    cdsCidades: TClientDataSet;
    cdsCidadesCIDADE: TIntegerField;
    cdsCidadesNOME: TStringField;
    cdsCidadesESTADO: TStringField;
    cdsCidadesCODIGO_MUNICIPIO: TIntegerField;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    cdsFilialFILIAL: TIntegerField;
    cdsFilialRAZAOSOCIAL: TStringField;
    cdsFilialFANTASIA: TStringField;
    cdsFilialCNPJ: TStringField;
    cdsFilialINSCRICAO: TStringField;
    cdsFilialENDERECO: TStringField;
    cdsFilialNUMERO: TIntegerField;
    cdsFilialCEP: TStringField;
    cdsFilialBAIRRO: TStringField;
    cdsFilialESTADO: TStringField;
    cdsFilialDDD: TStringField;
    cdsFilialTELEFONE1: TStringField;
    cdsFilialTELEFONE2: TStringField;
    cdsFilialFAX: TStringField;
    cdsFilialHTTP: TStringField;
    cdsFilialEMAIL: TStringField;
    cdsFilialCOMPLEMENTO: TStringField;
    cdsFilialCONTATO: TStringField;
    cdsFilialENDERECOCOBRANCA: TStringField;
    cdsFilialNUMEROCOBRANCA: TIntegerField;
    cdsFilialCEPCOBRANCA: TStringField;
    cdsFilialBAIRROCOBRANCA: TStringField;
    cdsFilialESTADOCOBRANCA: TStringField;
    cdsFilialENDERECOENTREGA: TStringField;
    cdsFilialNUMEROENTREGA: TIntegerField;
    cdsFilialCEPENTREGA: TStringField;
    cdsFilialBAIRROENTREGA: TStringField;
    cdsFilialESTADOENTREGA: TStringField;
    cdsFilialCIDADE: TIntegerField;
    cdsFilialCIDADEENTREGA: TIntegerField;
    cdsFilialCIDADECOBRANCA: TIntegerField;
    cdsFilialSUBSTITUTOTRIBUTARIO: TSmallintField;
    cdsFilialCONTRIBUINTEDOIPI: TSmallintField;
    cdsFilialTIPO_EMPRESA: TSmallintField;
    cdsFilialREGISTROJUNTACOMERCIAL: TStringField;
    cdsFilialMETRO_QUADRADO: TBCDField;
    cdsFilialREGIME_TRIBUTARIO: TSmallintField;
    cdsFilialINSCRICAO_MUNICIPAL: TStringField;
    cdsFilialINSCRICAO_SUFRAMA: TStringField;
    cdsFilialCRT: TIntegerField;
    cdsFilialCSOSN: TIntegerField;
    cdsFilialPAIS: TIntegerField;
    cdsFilialOBSERVACAO_NFSAIDA: TMemoField;
    cdsFilialNATUREZA_PESSOA_JURIDICA: TIntegerField;
    cdsFilialPERFIL_SPED: TSmallintField;
    cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC: TBCDField;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosUSUARIO: TIntegerField;
    cdsUsuariosNOME: TStringField;
    cdsUsuariosLOGIN: TStringField;
    cdsUsuariosSENHA: TStringField;
    cdsUsuariosDATA: TDateField;
    cdsFilialIMPOSTO_SIMPLES_NACIONAL: TBCDField;
    dspConfiguracoes: TDataSetProvider;
    cdsConfiguracoes: TClientDataSet;
    cdsConfiguracoesCONFIGURACAO: TIntegerField;
    cdsConfiguracoesPERCENTUALLIMITEDECREDITO: TBCDField;
    cdsConfiguracoesMULTA: TBCDField;
    cdsConfiguracoesMORADIARIA: TBCDField;
    cdsConfiguracoesDPR: TDateField;
    cdsConfiguracoesFLAGDPR: TSmallintField;
    cdsConfiguracoesTIPOMULTA: TSmallintField;
    cdsConfiguracoesTIPOMORADIARIA: TSmallintField;
    cdsConfiguracoesMODELOBALANCA: TSmallintField;
    cdsConfiguracoesIMPOSTOSFEDERAIS: TBCDField;
    cdsConfiguracoesCUSTOOPERACIONAL: TBCDField;
    cdsConfiguracoesTIPOCLD: TSmallintField;
    cdsConfiguracoesMODELOPDV: TSmallintField;
    cdsConfiguracoesARQUIVODENOTAFISCAL: TStringField;
    cdsConfiguracoesARQUIVODEVENDA: TStringField;
    cdsConfiguracoesARQUIVODECAIXA: TStringField;
    cdsConfiguracoesARQUIVODEFORMAPAGAMENTO: TStringField;
    cdsConfiguracoesARQUIVODESECOES: TStringField;
    cdsConfiguracoesARQUIVODERECEBIMENTOS: TStringField;
    cdsConfiguracoesARQUIVODEVENDADECLIENTE: TStringField;
    cdsConfiguracoesARQUIVODECHEQUES: TStringField;
    cdsConfiguracoesARQUIVODEPRODUTOSGERAL: TStringField;
    cdsConfiguracoesARQUIVODEPRODUTOSALTERADOS: TStringField;
    cdsConfiguracoesARQUIVODECLIENTES: TStringField;
    cdsConfiguracoesQUANTIDADEDEPDV: TSmallintField;
    cdsConfiguracoesARQUIVODEFORNECEDOR: TStringField;
    cdsConfiguracoesARQUIVODEMAPARESUMO: TStringField;
    cdsConfiguracoesARQUIVODECUPOMDIA: TStringField;
    cdsConfiguracoesARQUIVODEALIQUOTAS: TStringField;
    cdsConfiguracoesARQUIVODEBANCOS: TStringField;
    cdsConfiguracoesARQUIVODEMENSAGENS: TStringField;
    cdsConfiguracoesQUANTIDADEDETECLAS: TSmallintField;
    cdsConfiguracoesARQUIVODEPRODUTOSPARABALANCA: TStringField;
    cdsConfiguracoesARQUIVODESETORPARABALANCA: TStringField;
    cdsConfiguracoesARQUIVODERECEITASPARABALANCA: TStringField;
    cdsConfiguracoesARQUIVODETECLADOPARABALANCA: TStringField;
    cdsConfiguracoesARQUIVODEMENSAGENSPARABALANCA: TStringField;
    cdsConfiguracoesARQUIVODETEXTOGENPARABALANCA: TStringField;
    cdsConfiguracoesARQUIVODEINFORMACAONUTRICIONAL: TStringField;
    cdsConfiguracoesFATURAMENTO: TBCDField;
    cdsConfiguracoesPROLABORE: TBCDField;
    cdsConfiguracoesENCARGOSPROLABORE: TBCDField;
    cdsConfiguracoesSALARIOS: TBCDField;
    cdsConfiguracoesENCARGOSSALARIOS: TBCDField;
    cdsConfiguracoesSEGUROS: TBCDField;
    cdsConfiguracoesDESPESASBANCARIAS: TBCDField;
    cdsConfiguracoesJUROS: TBCDField;
    cdsConfiguracoesHONORARIOSCONTABEIS: TBCDField;
    cdsConfiguracoesMATERIALDEEXPEDIENTE: TBCDField;
    cdsConfiguracoesALUGUEL: TBCDField;
    cdsConfiguracoesDESPESASDEVIAGEM: TBCDField;
    cdsConfiguracoesAGUA: TBCDField;
    cdsConfiguracoesENERGIA: TBCDField;
    cdsConfiguracoesTELEFONE: TBCDField;
    cdsConfiguracoesPROPAGANDA: TBCDField;
    cdsConfiguracoesDEPRECIACAO: TBCDField;
    cdsConfiguracoesMATERIALDELIMPEZA: TBCDField;
    cdsConfiguracoesMANUTENCAO: TBCDField;
    cdsConfiguracoesOUTROS: TBCDField;
    cdsConfiguracoesVENDAAPRAZO: TBCDField;
    cdsConfiguracoesTIPOBLOQUETO: TSmallintField;
    cdsConfiguracoesTIPODOCUMENTOCARTEIRA: TSmallintField;
    cdsConfiguracoesMODELO: TStringField;
    cdsConfiguracoesSERIE: TStringField;
    cdsConfiguracoesULTIMANOTAFISCALIMPRESSA: TIntegerField;
    cdsConfiguracoesEMAILSUPORTE: TStringField;
    cdsConfiguracoesDDDSUPORTE: TStringField;
    cdsConfiguracoesTELEFONESUPORTE1: TStringField;
    cdsConfiguracoesTELEFONESUPORTE2: TStringField;
    cdsConfiguracoesTELEFONESUPORTE3: TStringField;
    cdsConfiguracoesSUPORTECONTATO: TStringField;
    cdsConfiguracoesINTERVALOENTREBACKUP: TSmallintField;
    cdsConfiguracoesMOSTRARTOTALCRETELA: TSmallintField;
    cdsConfiguracoesMOSTRARTOTALCPATELA: TSmallintField;
    cdsConfiguracoesUNIFICARPRECODEVENDA: TIntegerField;
    cdsConfiguracoesDDP: TStringField;
    cdsConfiguracoesRELACIONAR_PRODUTO_CLIENTE: TSmallintField;
    cdsConfiguracoesCONTA_PADRAO_FLUXO_CX: TStringField;
    cdsConfiguracoesATUALIZAR_CUSTOS_SIMILAR: TSmallintField;
    cdsConfiguracoesVER_SIMILAR_PARA_ALTERAR: TSmallintField;
    cdsConfiguracoesTOTALIZAR_CFOP: TSmallintField;
    cdsConfiguracoesARQUIVOIMEDITOPRODUTOS: TStringField;
    cdsConfiguracoesARQUIVOPRODUTOCESTABASICA: TStringField;
    cdsConfiguracoesARQUIVOLISTANEGRA: TStringField;
    cdsConfiguracoesARQUIVOCUPOM: TStringField;
    cdsConfiguracoesARQUIVOITEMCUPOM: TStringField;
    cdsConfiguracoesARQUIVODEINVENTARIO: TStringField;
    cdsConfiguracoesARQUIVODETEF: TStringField;
    cdsConfiguracoesARQUIVODEPEDIDO: TStringField;
    cdsConfiguracoesPERCENTUAL_PIS: TCurrencyField;
    cdsConfiguracoesPERCENTUAL_COFINS: TCurrencyField;
    cdsConfiguracoesPERCENTUAL_CSLL: TCurrencyField;
    cdsConfiguracoesPERCENTUAL_IRRF: TCurrencyField;
    cdsConfiguracoesPERCENTUAL_INSS: TCurrencyField;
    cdsConfiguracoesPERCENTUAL_ISSQN: TCurrencyField;
    cdsConfiguracoesTIPO_ESTOQUE_NF_ENTREDA: TSmallintField;
    cdsConfiguracoesTIPO_ESTOQUE_NF_SAIDA: TSmallintField;
    cdsConfiguracoesPDV_TRUNCA_ARREDONDA: TStringField;
    cdsConfiguracoesALIQUOTA_PIS: TBCDField;
    cdsConfiguracoesALIQUOTA_COFINS: TBCDField;
    cdsConfiguracoesMODELO_TERMINAL_CONSULTA: TSmallintField;
    cdsConfiguracoesDESCONTO_PERSONALIZADO: TBCDField;
    cdsConfiguracoesPATH_ATUALIZACAO: TStringField;
    cdsConfiguracoesATIVAR_RENTABILIDADE: TSmallintField;
    cdsConfiguracoesSERVIDOR_SMTP: TStringField;
    cdsConfiguracoesPORTA_SMTP: TStringField;
    cdsConfiguracoesUSUARIO_SMTP: TStringField;
    cdsConfiguracoesPASSWORD_SMTP: TStringField;
    cdsConfiguracoesUSAR_SSL_SMTP: TSmallintField;
    cdsConfiguracoesAUTENTICA_SMTP: TSmallintField;
    cdsConfiguracoesWS_NFE: TStringField;
    cdsConfiguracoesAMBIENTE_NFE: TSmallintField;
    cdsConfiguracoesVISUALIZAR_MSG_NFE: TSmallintField;
    cdsConfiguracoesORIENTACAO_IMP_DANFE: TSmallintField;
    cdsConfiguracoesFORMA_EMSSAO_DANFE: TSmallintField;
    cdsConfiguracoesLOGOMARCA_DANFE: TStringField;
    cdsConfiguracoesCODIGO_PAIS_DANFE: TIntegerField;
    cdsConfiguracoesSALVAR_DANFE: TSmallintField;
    cdsConfiguracoesPATH_SALVAR_DANFE: TStringField;
    cdsConfiguracoesPATH_SCHEMAS_NFE: TStringField;
    cdsConfiguracoesPATH_SALVAR_XML: TStringField;
    cdsConfiguracoesPATH_SALVAR_PDF: TStringField;
    cdsConfiguracoesCPF_CONTADOR: TStringField;
    cdsConfiguracoesCRC_CONTADOR: TStringField;
    cdsConfiguracoesCNPJ_CONTADOR: TStringField;
    cdsConfiguracoesCEP_CONTADOR: TStringField;
    cdsConfiguracoesNUMERO_CONTADOR: TStringField;
    cdsConfiguracoesDDD_CONTADOR: TStringField;
    cdsConfiguracoesTELEFONE_CONTADOR: TStringField;
    cdsConfiguracoesFAX_CONTADOR: TStringField;
    cdsConfiguracoesUSAR_PRECO_PROMOCAO_PV2: TSmallintField;
    cdsConfiguracoesUTILIZAR_SIMILAR_PRECO: TSmallintField;
    cdsConfiguracoesINTERVALO_ENTRE_BACKUP: TIntegerField;
    cdsConfiguracoesPATH_BACKUP_1: TStringField;
    cdsConfiguracoesPATH_BACKUP_2: TStringField;
    cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV: TSmallintField;
    cdsConfiguracoesPATH_EXPORTACAO_PDV: TStringField;
    cdsConfiguracoesPATH_IMPORTACAO_PDV: TStringField;
    cdsConfiguracoesPATH_EXPORTACAO_BALANCA: TStringField;
    cdsConfiguracoesPATH_TERMINAL_CONSULTA: TStringField;
    cdsConfiguracoesUTILIZAR_PRECO_ATACADO: TSmallintField;
    cdsConfiguracoesUTILIZACOBRANCAMAGNETICA: TSmallintField;
    cdsConfiguracoesUSAR_COBRANCA_REGISTRADA: TSmallintField;
    cdsConfiguracoesCOBRANCA_IMP_BANCO: TSmallintField;
    cdsAltGAC: TClientDataSet;
    dspAtlGAC: TDataSetProvider;
    cdsAltGACATL_DATA: TDateField;
    cdsAltGACATL_VERSAO: TStringField;
    cdsAltGACATL_MD5: TStringField;
    cdsAltGACATL_NOME_ARQ: TStringField;
    dspSelAtlGAC: TDataSetProvider;
    cdsSelAtlGAC: TClientDataSet;
    cdsSelAtlGACOP_ATL_BINNARIO: TBlobField;
    cdsSelAtlGACOP_ATL_DATA: TDateField;
    cdsSelAtlGACOP_ATL_VERSAO: TStringField;
    cdsSelAtlGACOP_ATL_MD5: TStringField;
    cdsSelAtlGACOP_ATL_NOME_ARQ: TStringField;
    cdsSelAtlGACOP_ATL_ID_ARQUIVO: TSmallintField;
    dspCFOP_CFPS: TDataSetProvider;
    cdsCFOP_CFPS: TClientDataSet;
    cdsCFOP_CFPSCFOP: TStringField;
    cdsCFOP_CFPSDESCRICAO: TStringField;
    cdsCFOP_CFPSOPERACAO: TSmallintField;
    cdsCFOP_CFPSCFOP_ENTRADA_ESTADUAL: TStringField;
    cdsCFOP_CFPSCFOP_ENTRADA_INTERESTADUAL: TStringField;
    cdsCFOP_CFPSCFOP_ENTRADA_ESTRANGEIRA: TStringField;
    cdsCFOP_CFPSATUALIZAR_CUSTOS: TSmallintField;
    cdsCFOP_CFPSNATUREZA_CFOP: TSmallintField;
    cdsCFOP_CFPSGERA_CREDITO_PIS_COFINS: TSmallintField;
    cdsCFOP_CFPSTABELA_4_3_7: TStringField;
    cdsCFOP_CFPSOBSERVACAO_NFS: TMemoField;
    cdsCFOP_CFPSDESCRICAO_NATUREZA: TStringField;
    cdsCFOP_CFPSGERA_DEBITO_CREDITO_ICMS: TSmallintField;
    cdsCFOP_CFPSSUBSTITUICAO_TRIBUTARIA: TSmallintField;
    cdsCFOP_CFPSGERA_DEBITO_CREDITO_IPI: TSmallintField;
    dspTabela4_3_7: TDataSetProvider;
    cdsTabela_4_3_7: TClientDataSet;
    cdsTabela_4_3_7CODIGO: TStringField;
    cdsTabela_4_3_7DESCRICAO: TStringField;
    cdsCFOP_CFPSDESCRICAO_NATUREZA_RECEITA: TStringField;
    dspFuncionarios: TDataSetProvider;
    cdsFuncionarios: TClientDataSet;
    cdsFuncionariosFUNCIONARIO: TIntegerField;
    cdsFuncionariosNOME: TStringField;
    cdsFuncionariosCADASTRO: TDateField;
    cdsFuncionariosCPF: TStringField;
    cdsFuncionariosIDENTIDADE: TStringField;
    cdsFuncionariosENDERECO: TStringField;
    cdsFuncionariosNUMERO: TIntegerField;
    cdsFuncionariosCEP: TStringField;
    cdsFuncionariosBAIRRO: TStringField;
    cdsFuncionariosCIDADE: TIntegerField;
    cdsFuncionariosESTADO: TStringField;
    cdsFuncionariosDDD: TIntegerField;
    cdsFuncionariosTELEFONE: TIntegerField;
    cdsFuncionariosCELULAR: TIntegerField;
    cdsFuncionariosATIVO: TSmallintField;
    cdsFuncionariosBARRAS: TStringField;
    cdsFuncionariosSENHA: TStringField;
    cdsFuncionariosCARGO: TStringField;
    cdsConfig_ini: TClientDataSet;
    cdsConfig_iniSERV_TIPO: TSmallintField;
    cdsConfig_iniSERV_PROTOCOLO: TSmallintField;
    cdsConfig_iniSERV_VERSAO: TSmallintField;
    cdsConfig_iniSERV_TCPIP: TStringField;
    dspModelo_Doc: TDataSetProvider;
    cdsModelo_Doc: TClientDataSet;
    cdsModelo_DocMODELO: TStringField;
    cdsModelo_DocDESCRICAO: TStringField;
    cdsModelo_DocREGISTRO: TStringField;
    cdsModelo_DocCODIGOSINTEGRA: TStringField;
    dspConfigECF: TDataSetProvider;
    cdsConfigECF: TClientDataSet;
    cdsConfigECFCONFIG_CAIXAS: TIntegerField;
    cdsConfigECFNUMERO_CAIXA: TIntegerField;
    cdsConfigECFNUMERO_SERIE_ECF: TStringField;
    cdsConfigECFCODIGO_MODELO_DOCUMENTO: TStringField;
    cdsConfigECFMODELO_ECF: TStringField;
    dspModEtqGond: TDataSetProvider;
    cdsModEtqGond: TClientDataSet;
    cdsModEtqGondMODELO: TSmallintField;
    cdsModEtqGondDESCRICAO: TStringField;
    cdsConfig_iniMARCA_MODELO_IMP_TERMICA: TSmallintField;
    cdsConfig_iniPORTA_IMP_TERMICA: TStringField;
    cdsConfig_iniBPS_IMP_TERMICA: TIntegerField;
    cdsConfig_iniBITS_DADOS_IMP_TERMICA: TSmallintField;
    cdsConfig_iniBITS_PARADA_IMP_TERMCA: TSmallintField;
    cdsConfig_iniMODELO_ETQ_GONDOLA: TSmallintField;
    cdsConfig_iniPARIDADE_IMP_TERMICA: TSmallintField;
    cdsConfig_iniCTRL_FLUXO_IMP_TERMICA: TSmallintField;
    cdsConfig_iniSERIE_CERTIFICADO_DIGITAL: TStringField;
    cdsConfig_iniVENCIMENTO_CERTIICADO_DIGITAL: TDateField;
    cdsAdministradoras: TClientDataSet;
    dspAdministradoras: TDataSetProvider;
    cdsAdministradorasADMINISTRADORA: TIntegerField;
    cdsAdministradorasNOME: TStringField;
    cdsAdministradorasDESCONTO: TBCDField;
    cdsAdministradorasPRAZO: TSmallintField;
    cdsAdministradorasBANCO: TIntegerField;
    cdsAdministradorasAGENCIA: TStringField;
    cdsAdministradorasCONTA: TStringField;
    cdsAdministradorasCNPJ: TStringField;
    cdsContaCorrente: TClientDataSet;
    dspContaCorrente: TDataSetProvider;
    cdsContaCorrenteCONTA: TStringField;
    cdsContaCorrenteABERTURA: TDateField;
    cdsContaCorrenteTITULAR: TStringField;
    cdsContaCorrenteBANCO: TIntegerField;
    cdsContaCorrenteAGENCIA: TStringField;
    cdsContaCorrenteSALDOINICIAL: TBCDField;
    cdsContaCorrenteSALDOATUAL: TBCDField;
    cdsContaCorrenteCARTEIRA: TStringField;
    cdsCtrlCartoes: TClientDataSet;
    dspCtrlCartoes: TDataSetProvider;
    cdsCtrlCartoesCONTROLECARTAOTICKET: TIntegerField;
    cdsCtrlCartoesADMINISTRADORA: TIntegerField;
    cdsCtrlCartoesEMISSAO: TDateField;
    cdsCtrlCartoesDEPOSITO: TDateField;
    cdsCtrlCartoesRECEBIMENTO: TDateField;
    cdsCtrlCartoesBAIXA: TDateField;
    cdsCtrlCartoesVALORDACOMPRA: TBCDField;
    cdsCtrlCartoesVALORDODESCONTO: TBCDField;
    cdsCtrlCartoesVALORARECEBER: TBCDField;
    cdsCtrlCartoesSTATUS: TSmallintField;
    cdsCtrlCartoesTIPO_OPERACAO: TSmallintField;
    cdsCtrlCartoesDESCR_STATUS: TStringField;
    cdsCtrlCartoesDESCR_TIPO_OPER: TStringField;
    cdsCtrlCartoesNOME_ADM: TStringField;
    cdsSelBaixaCartao: TClientDataSet;
    dspSelBaixaCartao: TDataSetProvider;
    cdsSelBaixaCartaoCONTROLECARTAOTICKET: TIntegerField;
    cdsSelBaixaCartaoADMINISTRADORA: TIntegerField;
    cdsSelBaixaCartaoEMISSAO: TDateField;
    cdsSelBaixaCartaoDEPOSITO: TDateField;
    cdsSelBaixaCartaoRECEBIMENTO: TDateField;
    cdsSelBaixaCartaoBAIXA: TDateField;
    cdsSelBaixaCartaoVALORDACOMPRA: TBCDField;
    cdsSelBaixaCartaoVALORDODESCONTO: TBCDField;
    cdsSelBaixaCartaoVALORARECEBER: TBCDField;
    cdsSelBaixaCartaoSTATUS: TSmallintField;
    cdsSelBaixaCartaoTIPO_OPERACAO: TSmallintField;
    cdsConfig_iniPATH_TABELAS_AUX_SPED_F: TStringField;
    cdsFornecedor: TClientDataSet;
    dspFornecedor: TDataSetProvider;
    cdsFornecedorFORNECEDOR: TIntegerField;
    cdsFornecedorRAZAOSOCIAL: TStringField;
    cdsFornecedorFANTASIA: TStringField;
    cdsFornecedorCNPJ: TStringField;
    cdsFornecedorINSCRICAO: TStringField;
    cdsFornecedorCADASTRO: TDateField;
    cdsFornecedorENDERECO: TStringField;
    cdsFornecedorNUMERO: TIntegerField;
    cdsFornecedorCEP: TStringField;
    cdsFornecedorBAIRRO: TStringField;
    cdsFornecedorESTADO: TStringField;
    cdsFornecedorDDD: TStringField;
    cdsFornecedorTELEFONE1: TStringField;
    cdsFornecedorTELEFONE2: TStringField;
    cdsFornecedorFAX: TStringField;
    cdsFornecedorCOMPLEMENTO: TStringField;
    cdsFornecedorCONTATO: TStringField;
    cdsFornecedorHTTP: TStringField;
    cdsFornecedorEMAIL: TStringField;
    cdsFornecedorTIPO: TSmallintField;
    cdsFornecedorOBSERVACAO: TMemoField;
    cdsFornecedorULTIMOPEDIDO: TIntegerField;
    cdsFornecedorDATAULTIMOPEDIDO: TDateField;
    cdsFornecedorVALORULTIMOPEDIDO: TBCDField;
    cdsFornecedorULTIMANF: TStringField;
    cdsFornecedorDATAULTIMANF: TDateField;
    cdsFornecedorVALORULTIMANF: TBCDField;
    cdsFornecedorRAMODEATIVIDADE: TSmallintField;
    cdsFornecedorCIDADE: TIntegerField;
    cdsFornecedorATACADISTAREGIMEESPECIAL: TSmallintField;
    cdsFornecedorREPRESENTANTE: TStringField;
    cdsFornecedorOPTANTE_SIMPLES: TSmallintField;
    cdsFornecedorAPROVEITA_DESCONTO_ITEM_NF: TIntegerField;
    cdsFornecedorPAIS: TIntegerField;
    cdsFornecedorINSCRICAO_SUFRAMA: TStringField;
    cdsNFEntrada: TClientDataSet;
    dspNFEntrada: TDataSetProvider;
    cdsParcelasNFE: TClientDataSet;
    dspParcelasNFE: TDataSetProvider;
    cdsParcelasNFEPARCELASNFE: TIntegerField;
    cdsParcelasNFENOTAFISCAL: TStringField;
    cdsParcelasNFEDOCUMENTO: TStringField;
    cdsParcelasNFEVENCIMENTO: TDateField;
    cdsParcelasNFEVALOR: TBCDField;
    cdsCFOP_NFEntrada: TClientDataSet;
    dspCFOP_NFEntrada: TDataSetProvider;
    cdsCFOP_NFEntradaCFOP_NFENTRADA: TIntegerField;
    cdsCFOP_NFEntradaNFENTRADA: TIntegerField;
    cdsCFOP_NFEntradaCFOP: TStringField;
    cdsSituacao_Doc: TClientDataSet;
    dspSituacao_Doc: TDataSetProvider;
    cdsSituacao_DocCODIGO: TIntegerField;
    cdsSituacao_DocDESCRICAO_SITUACAO: TStringField;
    cdsItem_NFEntrada: TClientDataSet;
    dspItem_NFEntrada: TDataSetProvider;
    cdsItem_NFEntradaITEMNFENTRADA: TIntegerField;
    cdsItem_NFEntradaNFENTRADA: TIntegerField;
    cdsItem_NFEntradaEAN: TStringField;
    cdsItem_NFEntradaPRODUTO: TIntegerField;
    cdsItem_NFEntradaCST: TSmallintField;
    cdsItem_NFEntradaQUANTIDADE: TBCDField;
    cdsItem_NFEntradaUNIDADEEMBALAGEM: TBCDField;
    cdsItem_NFEntradaVALORUNITARIO: TBCDField;
    cdsItem_NFEntradaDESCONTO: TCurrencyField;
    cdsItem_NFEntradaIPI: TCurrencyField;
    cdsItem_NFEntradaICMSENTRADA: TCurrencyField;
    cdsItem_NFEntradaICMSSAIDA: TCurrencyField;
    cdsItem_NFEntradaCFOP: TStringField;
    cdsItem_NFEntradaBASE_ICMS: TBCDField;
    cdsItem_NFEntradaBASE_SUBSTITUICAO: TBCDField;
    cdsItem_NFEntradaVALOR_DESCONTO: TBCDField;
    cdsItem_NFEntradaVALOR_ICMS: TBCDField;
    cdsItem_NFEntradaVALOR_IPI: TBCDField;
    cdsItem_NFEntradaVALOR_SUBSTITUICAO: TBCDField;
    cdsItem_NFEntradaTIPO_DESCONTO: TSmallintField;
    cdsItem_NFEntradaSUB_TOTAL: TBCDField;
    cdsItem_NFEntradaISENTO_NAOTRIBUTADO: TBCDField;
    cdsItem_NFEntradaENCARGOS: TBCDField;
    cdsItem_NFEntradaNCM: TStringField;
    cdsItem_NFEntradaREDUCAO_BASE: TFMTBCDField;
    cdsItem_NFEntradaBASE_ICMS_SIMPLES: TBCDField;
    cdsItem_NFEntradaVALOR_ICMS_SIMPLES: TBCDField;
    cdsItem_NFEntradaALIQUOTA_ST: TCurrencyField;
    cdsItem_NFEntradaIND_APURACAO_IPI: TIntegerField;
    cdsItem_NFEntradaCOD_ENQUADRAMENTO_IPI: TStringField;
    cdsItem_NFEntradaBASE_CALCULO_IPI: TBCDField;
    cdsItem_NFEntradaALIQUOTA_IPI: TCurrencyField;
    cdsItem_NFEntradaCST_PIS: TStringField;
    cdsItem_NFEntradaVALOR_BASE_PIS: TBCDField;
    cdsItem_NFEntradaP_ALIQUOTA_PIS: TBCDField;
    cdsItem_NFEntradaQUANT_BC_PIS: TBCDField;
    cdsItem_NFEntradaV_ALIQUOTA_PIS: TBCDField;
    cdsItem_NFEntradaVALOR_PIS: TBCDField;
    cdsItem_NFEntradaCST_COFINS: TStringField;
    cdsItem_NFEntradaVALOR_BC_COFINS: TBCDField;
    cdsItem_NFEntradaP_ALIQUOTA_COFINS: TBCDField;
    cdsItem_NFEntradaQUANTIDADE_BC_COFINS: TBCDField;
    cdsItem_NFEntradaV_ALIQUOTA_COFINS: TBCDField;
    cdsItem_NFEntradaVALOR_COFINS: TBCDField;
    cdsItem_NFEntradaCST_IPI: TStringField;
    cdsItem_NFEntradaNUMERO_ITEM: TIntegerField;
    cdsConhecimentoFrete: TClientDataSet;
    dspConhecimentoFrete: TDataSetProvider;
    dspTipo_CTE: TDataSetProvider;
    cdsTipo_CTE: TClientDataSet;
    cdsTipo_CTETIPO_CTE: TIntegerField;
    cdsTipo_CTEDESCRICAO: TStringField;
    cdsCFOP_NFEntradaNOME_CFOP: TStringField;
    dspProdutos: TDataSetProvider;
    cdsItem_NFEntradaDESCRICAO_PRODUTO: TStringField;
    cdsItem_NFEntradaUND_PRODUTO: TStringField;
    cdsItem_NFEntradaFRETE_RATEADO: TBCDField;
    dspOrdemCompra: TDataSetProvider;
    cdsOrdemCompra: TClientDataSet;
    cdsOrdemCompraORDEMDECOMPRA: TIntegerField;
    cdsOrdemCompraEMISSAO: TSQLTimeStampField;
    cdsOrdemCompraFATURAMENTO: TDateField;
    cdsOrdemCompraENTREGA: TDateField;
    cdsOrdemCompraPROGRAMACAO: TIntegerField;
    cdsOrdemCompraCFOP: TStringField;
    cdsOrdemCompraFORNECEDOR: TIntegerField;
    cdsOrdemCompraCOMPRADOR: TIntegerField;
    cdsOrdemCompraVENDEDOR: TStringField;
    cdsOrdemCompraTIPOFRETE: TSmallintField;
    cdsOrdemCompraTOTALDOSPRODUTOS: TBCDField;
    cdsOrdemCompraTOTALDOPEDIDO: TBCDField;
    cdsOrdemCompraDESCONTOSTRIBUTADOS: TBCDField;
    cdsOrdemCompraDESCONTOSISENTOS: TBCDField;
    cdsOrdemCompraDESPESASTRIBUTADAS: TBCDField;
    cdsOrdemCompraDESPESASISENTAS: TBCDField;
    cdsOrdemCompraIPI: TBCDField;
    cdsOrdemCompraOUTRASDESPESAS: TBCDField;
    cdsOrdemCompraFRETE: TBCDField;
    cdsOrdemCompraICMSR: TBCDField;
    cdsOrdemCompraOBSERVACAO: TMemoField;
    cdsOrdemCompraTRANSPORTADORA: TIntegerField;
    cdsOrdemCompraDOCUMENTO: TStringField;
    cdsOrdemCompraSTATUS: TSmallintField;
    cdsOrdemCompraFORMAPAGAMENTO: TIntegerField;
    cdsOrdemCompraPERCENTUALFRETE: TCurrencyField;
    cdsOrdemCompraFRETEAGREGADO: TSmallintField;
    dspItemOrdemCompra: TDataSetProvider;
    cdsItemOrdemCompra: TClientDataSet;
    dspPlanoContas: TDataSetProvider;
    cdsPlanoContas: TClientDataSet;
    cdsPlanoContasPLANODECONTAS: TIntegerField;
    cdsPlanoContasDESCRICAO: TStringField;
    cdsPlanoContasTIPO: TSmallintField;
    dspItemPlContas: TDataSetProvider;
    cdsItemPlContas: TClientDataSet;
    cdsItemPlContasCONTROLE: TIntegerField;
    cdsItemPlContasITEMPLANODECONTAS: TIntegerField;
    cdsItemPlContasPLANODECONTAS: TIntegerField;
    cdsItemPlContasDESCRICAO: TStringField;
    cdsItemPlContasTIPO: TSmallintField;
    dspLancamentos: TDataSetProvider;
    cdsLancamentos: TClientDataSet;
    cdsLancamentosLANCAMENTO: TIntegerField;
    cdsLancamentosNOME: TStringField;
    cdsLancamentosTIPO: TSmallintField;
    dspDesdobRentabil: TDataSetProvider;
    cdsDesdobRentabil: TClientDataSet;
    cdsDesdobRentabilENTRADASRENTABILIDADE: TIntegerField;
    cdsDesdobRentabilENTRADA: TDateField;
    cdsDesdobRentabilPRODUTO: TIntegerField;
    cdsDesdobRentabilQUANTIDADE: TBCDField;
    cdsDesdobRentabilRENDIMENTO: TCurrencyField;
    cdsDesdobRentabilRENTABILIDADE: TIntegerField;
    dspProdutoFilial: TDataSetProvider;
    cdsProdutoFilial: TClientDataSet;
    cdsProdutoFilialPRODUTO: TIntegerField;
    cdsProdutoFilialFILIAL: TIntegerField;
    cdsProdutoFilialCUSTOBRUTO: TBCDField;
    cdsProdutoFilialCUSTOBRUTOANTERIOR: TBCDField;
    cdsProdutoFilialCUSTOLIQUIDO: TBCDField;
    cdsProdutoFilialCUSTOLIQUIDOANTERIOR: TBCDField;
    cdsProdutoFilialMENORPRECO: TBCDField;
    cdsProdutoFilialPRECOCALCULADO: TBCDField;
    cdsProdutoFilialPRECOPROVISORIO: TBCDField;
    cdsProdutoFilialPRECODEVENDA: TBCDField;
    cdsProdutoFilialPRECODEVENDAANTERIOR: TBCDField;
    cdsProdutoFilialCADASTRO: TDateField;
    cdsProdutoFilialALTERACAO: TDateField;
    cdsProdutoFilialREMARCACAO: TDateField;
    cdsProdutoFilialLUCROICMSR: TBCDField;
    cdsProdutoFilialIMPOSTOSFEDERAIS: TBCDField;
    cdsProdutoFilialCUSTOOPERACIONAL: TBCDField;
    cdsProdutoFilialCOMISSAOVENDA: TBCDField;
    cdsProdutoFilialLUCROLIQUIDO: TBCDField;
    cdsProdutoFilialDEPOSITO: TBCDField;
    cdsProdutoFilialDEPOSITO1: TBCDField;
    cdsProdutoFilialLOJA: TBCDField;
    cdsProdutoFilialLOJA1: TBCDField;
    cdsProdutoFilialSALDOANTERIOR: TBCDField;
    cdsProdutoFilialSALDOMINIMO: TBCDField;
    cdsProdutoFilialSALDOMAXIMO: TBCDField;
    cdsProdutoFilialSETORDEBALANCA: TIntegerField;
    cdsProdutoFilialPRODUTOATIVO: TSmallintField;
    cdsProdutoFilialPROMOCAO: TSmallintField;
    cdsProdutoFilialTECLAASSOCIADA: TIntegerField;
    cdsProdutoFilialVALIDADE: TIntegerField;
    cdsProdutoFilialTECLADO: TSmallintField;
    cdsProdutoFilialREDUCAOBASEDECALCULO: TBCDField;
    cdsProdutoFilialDESCONTOPROGRAMADO: TBCDField;
    cdsProdutoFilialDESCRICAOCUPOMFISCAL: TStringField;
    cdsProdutoFilialDESCRICAOGONDOLA1: TStringField;
    cdsProdutoFilialDESCRICAOGONDOLA2: TStringField;
    cdsProdutoFilialDESCRICAOBALANCA: TStringField;
    cdsProdutoFilialDESCRICAOTIRATEIMA: TStringField;
    cdsProdutoFilialENVIARPARABALANCA: TSmallintField;
    cdsProdutoFilialDESCONTONACOMPRA: TBCDField;
    cdsProdutoFilialCREDITODEICMS: TBCDField;
    cdsProdutoFilialIPI: TBCDField;
    cdsProdutoFilialOUTROSCUSTOS: TBCDField;
    cdsProdutoFilialFRETE: TBCDField;
    cdsProdutoFilialICMSAPAGAR: TBCDField;
    cdsProdutoFilialDESCONTONAVENDA: TBCDField;
    cdsProdutoFilialVALORDODESCONTONACOMPRA: TBCDField;
    cdsProdutoFilialVALORDOCREDITODEICMSR: TBCDField;
    cdsProdutoFilialVALORDOIPI: TBCDField;
    cdsProdutoFilialVALORDEOUTROSCUSTOS: TBCDField;
    cdsProdutoFilialVALORDOFRETE: TBCDField;
    cdsProdutoFilialVALORDOICMSR: TBCDField;
    cdsProdutoFilialPRECOPROMOCAO: TBCDField;
    cdsProdutoFilialDESCONTOTABELA1: TCurrencyField;
    cdsProdutoFilialDESCONTOTABELA2: TCurrencyField;
    cdsProdutoFilialDESCONTOTABELA3: TCurrencyField;
    cdsProdutoFilialVALORUNITARIO: TBCDField;
    cdsProdutoFilialSUBSTITUICAOTRIBUTARIA: TCurrencyField;
    cdsProdutoFilialULTIMA_ENTRADA: TDateField;
    cdsProdutoFilialSALDO_RESERVADO: TBCDField;
    cdsProdutoFilialULTIMA_NF_ENTRADA: TStringField;
    cdsProdutoFilialCUSTO_MEDIO: TBCDField;
    cdsProdutoFilialCUSTO_MEDIO_ANTERIOR: TBCDField;
    cdsProdutoFilialDATA_CUSTO_MEDIO: TDateField;
    cdsProdutoFilialDATA_CUSTO_MEDIO_ANTERIOR: TDateField;
    cdsProdutoFilialPRECO_ATACADO: TBCDField;
    cdsProdutoFilialDESCRICAO_ATACADO: TStringField;
    cdsProdutoFilialPERCENTUAL_ISS: TBCDField;
    cdsProdutoFilialPERCENTUAL_IOF: TBCDField;
    cdsProdutoFilialPERCENTUAL_CIDE: TBCDField;
    cdsProdutoFilialSALDO_TOTAL: TCurrencyField;
    cdsDesdobRentabilSALDO_ATUAL: TCurrencyField;
    cdsDesdobRentabilSALDO_FUTURO: TCurrencyField;
    cdsDesdobRentabilDESCRICAO: TStringField;
    dspSubGrupo: TDataSetProvider;
    cdsSubGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    cdsSecao: TClientDataSet;
    dspSecao: TDataSetProvider;
    cdsGrupoGRUPO: TIntegerField;
    cdsGrupoNOME: TStringField;
    cdsGrupoTRIBUTACAO: TIntegerField;
    cdsGrupoIMPOSTOSFEDERAIS: TBCDField;
    cdsGrupoCUSTOOPERACIONAL: TBCDField;
    cdsGrupoLUCROLIQUIDO: TBCDField;
    cdsGrupoATIVO: TSmallintField;
    cdsGrupoLEI_PIS_COFINS: TStringField;
    cdsGrupoDESCONTO: TBCDField;
    cdsGrupoLEIS_PIS_COFINS: TIntegerField;
    cdsGrupoALIQUOTA_PIS: TFMTBCDField;
    cdsGrupoALIQUOTA_COFINS: TFMTBCDField;
    cdsGrupoCST_IPI: TSmallintField;
    cdsGrupoCST_ICMS: TSmallintField;
    cdsGrupoCST_PIS_ENTRADA: TSmallintField;
    cdsGrupoCST_PIS_SAIDA: TSmallintField;
    cdsGrupoCST_COFINS_ENTRADA: TSmallintField;
    cdsGrupoCST_COFINS_SAIDA: TSmallintField;
    cdsGrupoNATUREZA_RECEITA: TIntegerField;
    cdsGrupoALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsGrupoALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsGrupoCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsSecaoSECAO: TIntegerField;
    cdsSecaoNOME: TStringField;
    cdsSecaoCODIGO_SETOR: TStringField;
    cdsSecaoTRIBUTACAO: TIntegerField;
    cdsSecaoCUSTO_OPERACIONAL: TCurrencyField;
    cdsSecaoLUCRO_LIQUIDO: TCurrencyField;
    cdsSecaoLEI_PIS_COFINS: TIntegerField;
    cdsSecaoCST_IPI: TSmallintField;
    cdsSecaoCST_ICMS: TSmallintField;
    cdsSecaoCST_PIS_ENTRADA: TSmallintField;
    cdsSecaoCST_PIS_SAIDA: TSmallintField;
    cdsSecaoALIQUOTA_PIS: TFMTBCDField;
    cdsSecaoCST_COFINS_ENTRADA: TSmallintField;
    cdsSecaoCST_COFINS_SAIDA: TSmallintField;
    cdsSecaoALIQUOTA_COFINS: TFMTBCDField;
    cdsSecaoNATUREZA_RECEITA: TSmallintField;
    cdsSecaoALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsSecaoALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsSecaoCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsSecaoPERCENTUAL_ISS: TBCDField;
    cdsSecaoPERCENTUAL_IOF: TBCDField;
    cdsSecaoPERCENTUAL_CIDE: TBCDField;
    dspTributacao: TDataSetProvider;
    cdsTributacao: TClientDataSet;
    cdsTributacaoTRIBUTACAO: TIntegerField;
    cdsTributacaoNOME: TStringField;
    cdsTributacaoALIQUOTA: TBCDField;
    cdsTributacaoCODIGOECF: TStringField;
    cdsTributacaoREDUCAOBASECALCULO: TCurrencyField;
    cdsTributacaoOBSERVACAO: TMemoField;
    cdsTributacaoCODIGO_TOTALIZADOR: TIntegerField;
    dspSetorBalanca: TDataSetProvider;
    cdsSetorBalanca: TClientDataSet;
    cdsSetorBalancaSETOR: TIntegerField;
    cdsSetorBalancaNOME: TStringField;
    cdsSetorBalancaETIQUETA: TIntegerField;
    dspInventario: TDataSetProvider;
    cdsInventario: TClientDataSet;
    cdsInventarioINVENTARIO: TIntegerField;
    cdsInventarioFILIAL: TSmallintField;
    cdsInventarioDATA: TDateField;
    cdsInventarioANODEREFERENCIA: TIntegerField;
    cdsInventarioVALORDOINVENTARIO: TBCDField;
    cdsInventarioTIPOCUSTOINVENTARIO: TSmallintField;
    cdsInventarioSTATUS: TSmallintField;
    cdsInventarioVALORLIQUIDODOINVENTARIO: TBCDField;
    cdsInventarioNUMERO_ORDEM: TIntegerField;
    cdsInventarioMOTIVO_INVENTARIO: TSmallintField;
    cdsBancos: TClientDataSet;
    dspBancos: TDataSetProvider;
    cdsBancosBANCO: TIntegerField;
    cdsBancosNOME: TStringField;
    cdsRegInventarioP7: TClientDataSet;
    dspRegInventarioP7: TDataSetProvider;
    dspVendaRankingGrupo: TDataSetProvider;
    cdsVendaRankingGrupo: TClientDataSet;
    cdsAdmCartoes: TClientDataSet;
    dspAdmCartoes: TDataSetProvider;
    cdsAdmCartoesADMINISTRADORA: TIntegerField;
    cdsAdmCartoesNOME: TStringField;
    cdsAdmCartoesDESCONTO: TBCDField;
    cdsAdmCartoesPRAZO: TSmallintField;
    cdsAdmCartoesBANCO: TIntegerField;
    cdsAdmCartoesAGENCIA: TStringField;
    cdsAdmCartoesCONTA: TStringField;
    cdsAdmCartoesCNPJ: TStringField;
    cdsApoioEFDContr: TClientDataSet;
    dspApoioEFDContr: TDataSetProvider;
    cdsPromocao: TClientDataSet;
    dspPromocao: TDataSetProvider;
    cdsApoioInventario: TClientDataSet;
    dspApoioInventario: TDataSetProvider;
    cdsApoioInventarioPRODUTO: TIntegerField;
    cdsApoioInventarioDESCRICAO: TStringField;
    cdsApoioInventarioUNIDADE: TStringField;
    cdsApoioInventarioDEPOSITO: TBCDField;
    cdsApoioInventarioLOJA: TBCDField;
    cdsPromocaoPROMOCAO: TIntegerField;
    cdsPromocaoPRODUTO: TIntegerField;
    cdsPromocaoDATA_INCIO: TDateField;
    cdsPromocaoDATA_FIM: TDateField;
    cdsPromocaoSTATUS: TSmallintField;
    cdsPromocaoPRECO_DE_VENDA: TBCDField;
    cdsPromocaoPRECO_PROMOCAO: TBCDField;
    cdsPromocaoBARRAS: TStringField;
    cdsPromocaoDATA_CADASTRO: TDateField;
    cdsPromocaoUSUARIO: TStringField;
    cdsPromocaoDESCRICAO: TStringField;
    cdsVendaRankingGrupoOP_BARRAS: TStringField;
    cdsVendaRankingGrupoOP_DESCRICAO: TStringField;
    cdsVendaRankingGrupoOP_UNIDADE: TStringField;
    cdsVendaRankingGrupoOP_GRUPO: TIntegerField;
    cdsVendaRankingGrupoOP_NOME_GRUPO: TStringField;
    cdsVendaRankingGrupoOP_QUANTIDADE: TBCDField;
    cdsVendaRankingGrupoOP_SUBTOTAL: TBCDField;
    cdsVendaRankingGrupoOP_VALOR_MEDIO: TBCDField;
    cdsTipoItem: TClientDataSet;
    dspTipoItem: TDataSetProvider;
    cdsTipoItemCODIGO: TIntegerField;
    cdsTipoItemDESCRICAO: TStringField;
    cdsApoioInventarioCUSTOLIQUIDO: TBCDField;
    cdsApoioInventarioSALDO_TOTAL: TCurrencyField;
    cdsApoioInventarioVALOR_SALDO: TCurrencyField;
    cdsApoioEFDContrPRODUTO: TIntegerField;
    cdsApoioEFDContrDESCRICAO: TStringField;
    cdsApoioEFDContrUNIDADE: TStringField;
    cdsApoioEFDContrNCM: TStringField;
    cdsApoioEFDContrCST_PIS_S: TIntegerField;
    cdsApoioEFDContrCST_COFINS_S: TIntegerField;
    cdsApoioEFDContrCST_PIS_ENTRADA: TIntegerField;
    cdsApoioEFDContrCST_COFINS_ENTRADA: TIntegerField;
    cdsApoioEFDContrALIQ_PIS_S: TBCDField;
    cdsApoioEFDContrALIQ_COFINS_S: TBCDField;
    cdsApoioEFDContrALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsApoioEFDContrALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsApoioEFDContrNATUREZA_RECEITA: TIntegerField;
    cdsApoioEFDContrCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsSubGrupoSUBGRUPO: TIntegerField;
    cdsSubGrupoNOME: TStringField;
    cdsSubGrupoCONTROLE: TIntegerField;
    cdsSubGrupoGRUPO: TIntegerField;
    cdsSubGrupoTRIBUTACAO: TIntegerField;
    cdsSubGrupoCUSTO_OPERACIONAL: TCurrencyField;
    cdsSubGrupoLUCRO_LIQUIDO: TCurrencyField;
    cdsSubGrupoLEI_PIS_COFINS: TIntegerField;
    cdsSubGrupoCST_IPI: TSmallintField;
    cdsSubGrupoCST_ICMS: TSmallintField;
    cdsSubGrupoCST_PIS_ENTRADA: TSmallintField;
    cdsSubGrupoCST_PIS_SAIDA: TSmallintField;
    cdsSubGrupoALIQUOTA_PIS: TFMTBCDField;
    cdsSubGrupoCST_COFINS_ENTRADA: TSmallintField;
    cdsSubGrupoCST_COFINS_SAIDA: TSmallintField;
    cdsSubGrupoALIQUOTA_COFINS: TFMTBCDField;
    cdsSubGrupoNATUREZA_RECEITA: TSmallintField;
    cdsSubGrupoALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsSubGrupoALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsSubGrupoCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    dspRegistro50: TDataSetProvider;
    cdsRegistro50: TClientDataSet;
    cdsRegistro50REGISTRO50: TIntegerField;
    cdsRegistro50CNPJ: TStringField;
    cdsRegistro50INSCRICAO: TStringField;
    cdsRegistro50EMISSAO: TDateField;
    cdsRegistro50UF: TStringField;
    cdsRegistro50MODELO: TStringField;
    cdsRegistro50SERIE: TStringField;
    cdsRegistro50NOTAFISCAL: TStringField;
    cdsRegistro50CFOP: TStringField;
    cdsRegistro50EMITENTE: TStringField;
    cdsRegistro50VALOR_TOTAL: TSingleField;
    cdsRegistro50BASE_CALCULO_ICMS: TSingleField;
    cdsRegistro50VALOR_ICMS: TSingleField;
    cdsRegistro50ISENTA_NAO_TRIBUTADA: TSingleField;
    cdsRegistro50OUTRAS: TSingleField;
    cdsRegistro50ALIQUOTA: TSingleField;
    cdsRegistro50SITUACAO: TStringField;
    cdsRegistro50TIPO_NOTA: TSmallintField;
    cdsRegistro50ENTRADA: TDateField;
    dspRegistro54: TDataSetProvider;
    cdsRegistro54: TClientDataSet;
    cdsRegistro54REGISTRO54: TIntegerField;
    cdsRegistro54CNPJ: TStringField;
    cdsRegistro54MODELO: TStringField;
    cdsRegistro54SERIE: TStringField;
    cdsRegistro54NOTAFISCAL: TStringField;
    cdsRegistro54CFOP: TStringField;
    cdsRegistro54CST: TStringField;
    cdsRegistro54NUMERO_ITEM: TStringField;
    cdsRegistro54PRODUTO: TIntegerField;
    cdsRegistro54QUANTIDADE: TBCDField;
    cdsRegistro54VALOR_UNITARIO: TBCDField;
    cdsRegistro54BASE_CALCULO_ICMS: TBCDField;
    cdsRegistro54BASE_CALCULO_ICMSR: TBCDField;
    cdsRegistro54VALOR_IPI: TBCDField;
    cdsRegistro54ALIQUOTA_ICMS: TCurrencyField;
    cdsRegistro54EMISSAO: TDateField;
    cdsRegistro54VALOR_DESCONTO_DESPESA: TBCDField;
    cdsRegistro54TIPO_NOTA: TSmallintField;
    cdsRegistro54UF: TStringField;
    cdsRegistro54TIPO_CONTABIL: TSmallintField;
    cdsRegistro54CODIGO_VALOR_FISCAL: TSmallintField;
    cdsRegistro54ENTRADA: TDateField;
    cdsRegistro54DESCRICAO: TStringField;
    cdsRegistro54UNIDADE: TStringField;
    cdsCLD_NFE: TClientDataSet;
    dspCLD_NFE: TDataSetProvider;
    cdsCLD_NFEPRODUTO: TIntegerField;
    cdsCLD_NFEDESCRICAO: TStringField;
    cdsCLD_NFEUNIDADE: TStringField;
    cdsCLD_NFEPERMITE_VENDA_FRACIONADA: TSmallintField;
    cdsCLD_NFEUNIDADE_ATACADO: TBCDField;
    cdsCLD_NFEVALORDODESCONTONACOMPRA: TBCDField;
    cdsCLD_NFECREDITODEICMS: TBCDField;
    cdsCLD_NFEVALORDOCREDITODEICMSR: TBCDField;
    cdsCLD_NFEVALORDOIPI: TBCDField;
    cdsCLD_NFEVALORDEOUTROSCUSTOS: TBCDField;
    cdsCLD_NFEVALORDOFRETE: TBCDField;
    cdsCLD_NFEVALORDOICMSR: TBCDField;
    cdsCLD_NFECUSTOBRUTO: TBCDField;
    cdsCLD_NFECUSTOLIQUIDO: TBCDField;
    cdsCLD_NFEICMSAPAGAR: TBCDField;
    cdsCLD_NFEIMPOSTOSFEDERAIS: TBCDField;
    cdsCLD_NFECOMISSAOVENDA: TBCDField;
    cdsCLD_NFECUSTOOPERACIONAL: TBCDField;
    cdsCLD_NFELUCROLIQUIDO: TBCDField;
    cdsCLD_NFEPRECODEVENDA: TBCDField;
    cdsCLD_NFEPRECOCALCULADO: TBCDField;
    cdsCLD_NFEREMARCACAO: TDateField;
    cdsCLD_NFEPRECODEVENDAANTERIOR: TBCDField;
    cdsCLD_NFEALTERACAO: TDateField;
    cdsCLD_NFECUSTOBRUTOANTERIOR: TBCDField;
    cdsCLD_NFECUSTOLIQUIDOANTERIOR: TBCDField;
    cdsCLD_NFEDESCONTONACOMPRA: TBCDField;
    cdsCLD_NFEDESCONTONAVENDA: TBCDField;
    cdsCLD_NFEDESCONTOPROGRAMADO: TBCDField;
    cdsCLD_NFEDESCONTOTABELA1: TCurrencyField;
    cdsCLD_NFEDESCONTOTABELA2: TCurrencyField;
    cdsCLD_NFEDESCONTOTABELA3: TCurrencyField;
    cdsCLD_NFEFRETE: TBCDField;
    cdsCLD_NFEIPI: TBCDField;
    cdsCLD_NFELUCROICMSR: TBCDField;
    cdsCLD_NFEMENORPRECO: TBCDField;
    cdsCLD_NFEOUTROSCUSTOS: TBCDField;
    cdsCLD_NFEPRECOPROMOCAO: TBCDField;
    cdsCLD_NFEVALORUNITARIO: TBCDField;
    cdsCLD_NFEPRECOPROVISORIO: TBCDField;
    cdsCLD_NFEFILIAL: TIntegerField;
    cdsCLD_NFELOJA: TBCDField;
    cdsCLD_NFEULTIMA_ENTRADA: TDateField;
    cdsItemRegInventP7: TClientDataSet;
    dspItemRegInventP7: TDataSetProvider;
    cdsItemRegInventP7ANODEREFERENCIA: TIntegerField;
    cdsItemRegInventP7TIPOCUSTOINVENTARIO: TSmallintField;
    cdsItemRegInventP7VALORLIQUIDODOINVENTARIO: TBCDField;
    cdsItemRegInventP7NUMERO_ORDEM: TIntegerField;
    cdsItemRegInventP7QUANTIDADE: TBCDField;
    cdsItemRegInventP7PRECODECUSTO: TBCDField;
    cdsItemRegInventP7SUBTOTAL: TFMTBCDField;
    cdsItemRegInventP7DESCRICAO_PRODUTO: TStringField;
    cdsItemRegInventP7UNIDADE: TStringField;
    cdsItemRegInventP7TRIBUTACAO: TIntegerField;
    cdsItemRegInventP7DESCRICAO_TRIBUTACAO: TStringField;
    cdsItemRegInventP7PRODUTO: TIntegerField;
    dspVendaProdCFOP: TDataSetProvider;
    cdsVendaProdCFOP: TClientDataSet;
    cdsVendaProdCFOPPRODUTO: TIntegerField;
    cdsVendaProdCFOPDESCRICAO: TStringField;
    cdsVendaProdCFOPUNIDADE: TStringField;
    cdsVendaProdCFOPTOT_QUANTIDADE: TBCDField;
    cdsVendaProdCFOPCFOP: TStringField;
    cdsVendaProdCFOPSUB_TOTAL: TBCDField;
    cdsVendaProdCFOPVL_MEDIO: TFMTBCDField;
    cdsVendaProdCFOPNOME_CFOP: TStringField;
    cdsCFOP_CFPSDESCRICAO_OPERACAO: TStringField;
    cdsCFOP_CFPSS_ATUALIZA_CUSTOS: TStringField;
    cdsCFOP_CFPSS_GERA_CR_PIS_COFINS: TStringField;
    cdsCFOP_CFPSS_GERA_CR_DEB_ICMS: TStringField;
    cdsCFOP_CFPSS_GERA_CR_DEB_IPI: TStringField;
    cdsCFOP_CFPSS_CFOP_ST: TStringField;
    dspCompraProdCFOP: TDataSetProvider;
    cdsCompraProdCFOP: TClientDataSet;
    cdsCompraProdCFOPPRODUTO: TIntegerField;
    cdsCompraProdCFOPDESCRICAO: TStringField;
    cdsCompraProdCFOPUNIDADE: TStringField;
    cdsCompraProdCFOPTOT_QUANTIDADE: TBCDField;
    cdsCompraProdCFOPCFOP: TStringField;
    cdsCompraProdCFOPNOME_CFOP: TStringField;
    cdsCompraProdCFOPSUB_TOTAL: TBCDField;
    cdsCompraProdCFOPVL_MEDIO: TFMTBCDField;
    cdsConfig_iniPATH_ATUALIZACAO: TStringField;
    cdsSituacoes_OS: TClientDataSet;
    dspSituacoes_OS: TDataSetProvider;
    cdsSituacoes_OSCODIGO_SITUACAO: TIntegerField;
    cdsSituacoes_OSDESCRICAO: TStringField;
    cdsSituacoes_OSABERTURA_OS: TSmallintField;
    cdsSituacoes_OSOFICINA: TSmallintField;
    cdsSituacoes_OSFECHAMENTO_OS: TSmallintField;
    cdsSituacoes_OSCONDICAO_FECHAMENTO_OS: TSmallintField;
    cdsSituacoes_OSPRONTO: TSmallintField;
    cdsFuncionariosPERCENTUAL_COMISSAO_VENDA: TBCDField;
    dspEquipamentos: TDataSetProvider;
    cdsEquipamentos: TClientDataSet;
    cdsEquipamentosCODIGO_EQUIPAMENTO: TIntegerField;
    cdsEquipamentosCODIGO_CLIENTE: TIntegerField;
    cdsEquipamentosMODELO: TStringField;
    cdsEquipamentosMARCA: TStringField;
    cdsEquipamentosOPERADORA: TStringField;
    cdsEquipamentosNUMERO_SERIE: TStringField;
    cdsEquipamentosETIQ_PATRIMONIO: TStringField;
    cdsEquipamentosOBSERVACOES: TMemoField;
    cdsEquipamentosDATA_COMPRA: TDateField;
    cdsEquipamentosREVENDA: TStringField;
    cdsEquipamentosNUMERO_NF: TStringField;
    cdsEquipamentosNUMERO_CERTIFICADO_GARANTIA: TStringField;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesCLIENTE: TIntegerField;
    cdsClientesRAZAOSOCIAL: TStringField;
    cdsClientesFANTASIA: TStringField;
    cdsClientesCNPJ: TStringField;
    cdsClientesINSCRICAO: TStringField;
    cdsClientesCADASTRO: TDateField;
    cdsClientesENDERECO: TStringField;
    cdsClientesNUMERO: TIntegerField;
    cdsClientesCEP: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesESTADO: TStringField;
    cdsClientesTIPO: TSmallintField;
    cdsClientesCOMPLEMENTO: TStringField;
    cdsClientesCONTATO: TStringField;
    cdsClientesHTTP: TStringField;
    cdsClientesEMAIL: TStringField;
    cdsClientesOBSERVACAO: TMemoField;
    cdsClientesDDD: TStringField;
    cdsClientesTELEFONE1: TStringField;
    cdsClientesTELEFONE2: TStringField;
    cdsClientesCELULAR: TStringField;
    cdsClientesFAX: TStringField;
    cdsClientesNASCIMENTO: TDateField;
    cdsClientesRENDA: TBCDField;
    cdsClientesLIMITEDECREDITO: TBCDField;
    cdsClientesSALDODEVEDOR: TBCDField;
    cdsClientesSTATUS: TSmallintField;
    cdsClientesBARRAS: TStringField;
    cdsClientesENDERECOENTREGA: TStringField;
    cdsClientesNUMEROENTREGA: TIntegerField;
    cdsClientesCEPENTREGA: TStringField;
    cdsClientesBAIRROENTREGA: TStringField;
    cdsClientesESTADOENTREGA: TStringField;
    cdsClientesENDERECOCOBRANCA: TStringField;
    cdsClientesNUMEROCOBRANCA: TIntegerField;
    cdsClientesCEPCOBRANCA: TStringField;
    cdsClientesBAIRROCOBRANCA: TStringField;
    cdsClientesESTADOCOBRANCA: TStringField;
    cdsClientesPONTODEREFERENCIA: TStringField;
    cdsClientesVALIDADEDOCREDITO: TDateField;
    cdsClientesTIPODECREDITO: TSmallintField;
    cdsClientesDATACONSULTASPC: TDateField;
    cdsClientesFUNCIONARIO: TIntegerField;
    cdsClientesULTIPOPEDIDO: TIntegerField;
    cdsClientesDATAULTIMOPEDIDO: TDateField;
    cdsClientesVALORULTIMOPEDIDO: TBCDField;
    cdsClientesULTIMANF: TStringField;
    cdsClientesDATAULTIMANF: TDateField;
    cdsClientesVALORULTIMANF: TBCDField;
    cdsClientesULTIMOCHQUEDEVOLVIDO: TStringField;
    cdsClientesDATAULTIMOCHEQUEDEVOLVIDO: TDateField;
    cdsClientesVALORULTIMOCHEQUEDEVOLVIDO: TBCDField;
    cdsClientesMOTIVODEVOLUCAO: TStringField;
    cdsClientesCIDADE: TIntegerField;
    cdsClientesCIDADEENTREGA: TIntegerField;
    cdsClientesCIDADECOBRANCA: TIntegerField;
    cdsClientesATIVO: TSmallintField;
    cdsClientesPAI: TStringField;
    cdsClientesMAE: TStringField;
    cdsClientesEMPRESA: TStringField;
    cdsClientesTELEFONEEMPRESA1: TStringField;
    cdsClientesTELEFONEEMPRESA2: TStringField;
    cdsClientesRAMAL: TStringField;
    cdsClientesCONTATOEMPRESA: TStringField;
    cdsClientesREFERENCIAPESSOAL1: TStringField;
    cdsClientesREFERENCIAPESSOAL2: TStringField;
    cdsClientesREFERENCIAPESSOAL3: TStringField;
    cdsClientesTELEFONEREFERENCIA1: TStringField;
    cdsClientesTELEFONEREFERENCIA2: TStringField;
    cdsClientesTELEFONEREFERENCIA3: TStringField;
    cdsClientesSEXO: TSmallintField;
    cdsClientesESTADOCIVIL: TSmallintField;
    cdsClientesCONJUGE: TStringField;
    cdsClientesPOSSUIDEPENDENTES: TSmallintField;
    cdsClientesQUANTIDADEDEPENDENTES: TSmallintField;
    cdsClientesDEPENDENTES: TMemoField;
    cdsClientesTEMPODEEMPRESA: TBCDField;
    cdsClientesTIPOTEMPOEMPRESA: TSmallintField;
    cdsClientesREFERENCIACOMERCIAL1: TStringField;
    cdsClientesREFERENCIACOMERCIAL2: TStringField;
    cdsClientesREFERENCIACOMERCIAL3: TStringField;
    cdsClientesTELEFONEREFCOMERCIAL1: TStringField;
    cdsClientesTELEFONEREFCOMERCIAL2: TStringField;
    cdsClientesTELEFONEREFCOMERCIAL3: TStringField;
    cdsClientesCONTATOREFCOMERCIAL1: TStringField;
    cdsClientesCONTATOREFCOMERCIAL2: TStringField;
    cdsClientesCONTATOREFCOMERCIAL3: TStringField;
    cdsClientesLIBERARVENDAACIMALIMITE: TSmallintField;
    cdsClientesVENDEDOR: TIntegerField;
    cdsClientesCLIENTE2: TIntegerField;
    cdsClientesMODELO_TABELA_PRECOVENDA: TSmallintField;
    cdsClientesSOCIO: TSmallintField;
    cdsClientesCONTRIBUICAO: TBCDField;
    cdsClientesNUMERO_CARTAO: TStringField;
    cdsClientesEMISSAO_CARTAO: TDateField;
    cdsClientesDATA_VALIDADE_CARTAO: TDateField;
    cdsClientesDESCONTO_PERSONALIZADO: TBCDField;
    cdsClientesFORMAPAGAMENTO: TIntegerField;
    cdsClientesUSUARIO_NFE: TSmallintField;
    cdsClientesPAIS: TIntegerField;
    cdsClientesINSCRICAO_SUFRAMA: TStringField;
    cdsEquipamentosNOME_CLIENTE: TStringField;
    cdsEquipamentosDDD_CLIENTE: TStringField;
    cdsEquipamentosTELEFONE_CLIENTE: TStringField;
    dspOrdemServico: TDataSetProvider;
    cdsOrdemServico: TClientDataSet;
    cdsOrdemServicoORDEM_DE_SERVICO: TIntegerField;
    cdsOrdemServicoCODIGO_SITUACAO: TIntegerField;
    cdsOrdemServicoCLIENTE: TIntegerField;
    cdsOrdemServicoVALOR_MAO_DE_OBRA: TBCDField;
    cdsOrdemServicoVALOR_PECAS: TBCDField;
    cdsOrdemServicoVALOR_DESLOCAMENTO: TBCDField;
    cdsOrdemServicoVALOR_TERCEIRO: TBCDField;
    cdsOrdemServicoVALOR_OUTROS: TBCDField;
    cdsOrdemServicoCODIGO_EQUIPAMENTO: TIntegerField;
    cdsOrdemServicoAPARELHO: TStringField;
    cdsOrdemServicoMARCA: TStringField;
    cdsOrdemServicoMODELO: TStringField;
    cdsOrdemServicoNUMERO_SERIE: TStringField;
    cdsOrdemServicoETIQ_PATRIMONIO: TStringField;
    cdsOrdemServicoACESSORIO: TStringField;
    cdsOrdemServicoDEFEITO: TMemoField;
    cdsOrdemServicoOBS_SERVICO: TMemoField;
    cdsOrdemServicoLAUDO: TMemoField;
    cdsOrdemServicoOBSERVACAO_APARELHO: TStringField;
    cdsOrdemServicoKILOMETRO: TIntegerField;
    cdsOrdemServicoNUMERO_NF_PEDIDO: TStringField;
    cdsOrdemServicoEM_USO: TSmallintField;
    cdsOrdemServicoNUMERO_NF: TStringField;
    cdsOrdemServicoOS_REABERTA: TSmallintField;
    cdsOrdemServicoOS_OUTROS: TBCDField;
    cdsOrdemServicoOS_OUTROS_EMIT: TBCDField;
    cdsOrdemServicoVALOR_SINAL: TBCDField;
    cdsOrdemServicoPRIORIDADE: TSmallintField;
    cdsOrdemServicoNF_REMESSA: TStringField;
    cdsOrdemServicoVALOR_NF: TBCDField;
    cdsOrdemServicoNF_EMITENTE: TStringField;
    cdsOrdemServicoGARANTIDOR: TIntegerField;
    cdsOrdemServicoNUMER_SERIE_GARANTIDOR: TStringField;
    cdsOrdemServicoVALOR_FRETE: TBCDField;
    cdsOrdemServicoVALOR_SEGURO: TBCDField;
    cdsOrdemServicoUSUARIO_MICRO: TStringField;
    cdsOrdemServicoORCA_FORMAS: TMemoField;
    cdsOrdemServicoALERTA_ABANDONO: TDateField;
    cdsOrdemServicoHORA_ABANDONO: TTimeField;
    cdsOrdemServicoFUNCIONARIO: TIntegerField;
    cdsOrdemServicoOS_FABRICANTE: TStringField;
    cdsOrdemServicoNFC_NUMERO: TIntegerField;
    cdsOrdemServicoNOME_FUNCIOANARIO: TStringField;
    cdsOrdemServicoDESCRICAO_SITUACAO: TStringField;
    cdsFSituacaoPesq_OS: TClientDataSet;
    dspFSituacaoPesq_OS: TDataSetProvider;
    cdsFSituacaoPesq_OSCODIGO_SITUACAO: TIntegerField;
    cdsFSituacaoPesq_OSDESCRICAO: TStringField;
    cdsFGarantidor_OS: TClientDataSet;
    dspFGarantidor_OS: TDataSetProvider;
    cdsFGarantidor_OSCLIENTE: TIntegerField;
    cdsFGarantidor_OSRAZAOSOCIAL: TStringField;
    cdsClientesNOME_CIDADE: TStringField;
    cdsOrdemServicoVALOR_TOTAL_OS: TBCDField;
    dspItem_OS_Servico: TDataSetProvider;
    cdsItens_OS_servico: TClientDataSet;
    cdsItens_OS_servicoITENS_OS_SERVICOS: TIntegerField;
    cdsItens_OS_servicoORDEM_SERVICO: TIntegerField;
    cdsItens_OS_servicoDESCRICAO: TStringField;
    cdsItens_OS_servicoVALOR_CUSTO: TBCDField;
    cdsItens_OS_servicoFUNCIONARIO: TIntegerField;
    cdsItens_OS_servicoTIPO: TSmallintField;
    cdsItens_OS_servicoCODIGO_SERVICO: TIntegerField;
    cdsItens_OS_servicoQUANTIDADE: TBCDField;
    cdsItens_OS_servicoCUSTO_TOTAL: TBCDField;
    cdsItens_OS_servicoX_PED: TStringField;
    cdsItens_OS_servicoN_ITEM_PED: TStringField;
    cdsItens_OS_servicoNOME_TECNICO: TStringField;
    cdsItens_OS_servicoDESCRICAO_TIPO: TStringField;
    cdsItens_OS_Pecas: TClientDataSet;
    dspItem_OS_Pecas: TDataSetProvider;
    cdsItens_OS_PecasITENS_OS_PECAS: TIntegerField;
    cdsItens_OS_PecasORDEM_SERVICO: TIntegerField;
    cdsItens_OS_PecasCODIGO_PECA: TIntegerField;
    cdsItens_OS_PecasDESCRICAO: TStringField;
    cdsItens_OS_PecasVALOR_UNITARIO: TBCDField;
    cdsItens_OS_PecasQUANTIDADE: TBCDField;
    cdsItens_OS_PecasDIA: TSQLTimeStampField;
    cdsItens_OS_PecasVALOR_TOTAL: TBCDField;
    cdsItens_OS_PecasX_PED: TStringField;
    cdsItens_OS_PecasN_ITEM_PED: TStringField;
    cdsItens_OS_PecasNUMERO_SERIE: TMemoField;
    cdsItens_OS_PecasCODIGO_BAIXA: TIntegerField;
    cdsItens_OS_PecasNOME_TECNICO: TStringField;
    cdsOrdemServicoTOTAL_HORAS: TBCDField;
    dspAgenda: TDataSetProvider;
    cdsAgenda: TClientDataSet;
    cdsAgendaAGENDA: TIntegerField;
    cdsAgendaCOMPROMISSO: TMemoField;
    cdsAgendaALERTA: TSmallintField;
    cdsAgendaFUNCIONARIO: TIntegerField;
    cdsAgendaREALIZADO: TSmallintField;
    cdsAgendaDATA_COMPROMISSO: TDateField;
    cdsAgendaDATA_REALIZACAO: TDateField;
    cdsAgendaHORA_REALIZACAO: TTimeField;
    cdsOrdemServicoDATA_ENTRADA: TDateField;
    cdsOrdemServicoDATA_TERMINO: TDateField;
    cdsOrdemServicoDATA_SAIDA: TDateField;
    cdsOrdemServicoDATA_GARANTIA: TDateField;
    cdsOrdemServicoDATA_PREVISTO: TDateField;
    cdsAgendaHORA_COMPROMISSO: TTimeField;
    cdsOrdemServicoS_PRIORIDADE: TStringField;
    dspServicos: TDataSetProvider;
    cdsServicos: TClientDataSet;
    cdsServicosSERVICO: TIntegerField;
    cdsServicosDESCRICAO_1: TStringField;
    cdsServicosDESCRICAO_2: TStringField;
    cdsServicosVALOR: TBCDField;
    cdsServicosCST: TStringField;
    cdsServicosCST_PIS: TStringField;
    cdsServicosCST_COFINS: TStringField;
    cdsServicosCST_PIS_ENTRADA: TStringField;
    cdsServicosCST_COFINS_ENTRADA: TStringField;
    cdsServicosALIQUOTA_PIS: TBCDField;
    cdsServicosALIQUOTA_COFINS: TBCDField;
    cdsServicosCODIGO_ITEM: TStringField;
    cdsServicosDESCRICAO_COMPLEMENTAR: TMemoField;
    cdsItens_OS_servicoDATA_INICIO: TDateField;
    cdsItens_OS_servicoHORA_INICIO: TTimeField;
    cdsItens_OS_servicoDATA_FIM: TDateField;
    cdsItens_OS_servicoHORA_FIM: TTimeField;
    cdsOrdemServicoHORA_ENTRADA: TTimeField;
    cdsOrdemServicoHORA_TERMINO: TTimeField;
    cdsOrdemServicoHORA_SAIDA: TTimeField;
    cdsOrdemServicoHORA_GARANTIA: TTimeField;
    cdsOrdemServicoHORA_PREVISTO: TTimeField;
    cdsItens_OS_servicoTIPO_COBRANCA: TSmallintField;
    dspHistorico_OS: TDataSetProvider;
    cdsHistorico_OS: TClientDataSet;
    cdsHistorico_OSHISTORICO_ORDEM: TIntegerField;
    cdsHistorico_OSORDEM_SERVICO: TIntegerField;
    cdsHistorico_OSHISTORICO: TStringField;
    cdsHistorico_OSUSUARIO: TStringField;
    cdsHistorico_OSDATA_CADASTRO: TDateField;
    cdsHistorico_OSHORA_CADASTRO: TTimeField;
    cdsHistorico_OSTIPO: TSmallintField;
    cdsHistorico_OSCONTATO: TStringField;
    cdsItens_OS_PecasTIPO: TSmallintField;
    cdsItens_OS_PecasDESCRICAO_TIPO: TStringField;
    cdsSituacoesOS_ENC: TClientDataSet;
    dspSituacoesOS_ENC: TDataSetProvider;
    cdsSituacoesOS_ENCCODIGO_SITUACAO: TIntegerField;
    cdsSituacoesOS_ENCDESCRICAO: TStringField;
    cdsFormasPagamento: TClientDataSet;
    dspFormasPagamento: TDataSetProvider;
    cdsFormasPagamentoFORMAPAGAMENTO: TIntegerField;
    cdsFormasPagamentoNOME: TStringField;
    cdsFormasPagamentoCODIGOECF: TStringField;
    cdsFormasPagamentoTIPO: TSmallintField;
    cdsFormasPagamentoENTRADA: TSmallintField;
    cdsFormasPagamentoPARCELAS: TIntegerField;
    cdsFormasPagamentoINTERVALOENTREPARCELAS: TSmallintField;
    cdsFormasPagamentoATIVO: TSmallintField;
    cdsFormasPagamentoPERMITIRVENDACLIENTEBLOQUEADO: TSmallintField;
    cdsFormasPagamentoDESCONTOMAXIMO: TCurrencyField;
    cdsFormasPagamentoACRESCIMOMINIMO: TCurrencyField;
    cdsFormasPagamentoMORADIARIA: TCurrencyField;
    cdsFormasPagamentoPLANODECONTAS: TIntegerField;
    cdsFormasPagamentoITEMPLANODECONTAS: TIntegerField;
    cdsFormasPagamentoLANCAMENTO: TIntegerField;
    cdsFormasPagamentoTIPOOPERACAO: TSmallintField;
    cdsFormasPagamentoNOME_PL_CONTA: TStringField;
    cdsFormasPagamentoNOME_ITEM_PL_CONTA: TStringField;
    dspPerdas: TDataSetProvider;
    cdsPerdas: TClientDataSet;
    cdsItensPerdas: TClientDataSet;
    dspItensPerdas: TDataSetProvider;
    cdsPerdasPERDAS: TIntegerField;
    cdsPerdasFORNECEDOR: TIntegerField;
    cdsPerdasDATA_LANCAMENTO: TDateField;
    cdsPerdasTOTAL_QUANTIDADE: TBCDField;
    cdsPerdasVALOR_TOTAL: TBCDField;
    cdsPerdasFUNCIONARIO: TIntegerField;
    cdsPerdasNOME_FORNECEDOR: TStringField;
    cdsPerdasNOME_FUNCIONARIO: TStringField;
    cdsItensPerdasITENS_PERDAS: TIntegerField;
    cdsItensPerdasPERDA: TIntegerField;
    cdsItensPerdasPRODUTO: TIntegerField;
    cdsItensPerdasQUANTIDADE: TBCDField;
    cdsItensPerdasVALOR_UNITARIO: TBCDField;
    cdsItensPerdasVALOR_TOTAL: TBCDField;
    cdsItensPerdasDESCRICAO: TStringField;
    cdsItensPerdasUNIDADE: TStringField;
    dspRControlePerda: TDataSetProvider;
    cdsRControlePerda: TClientDataSet;
    cdsRControlePerdaOP_PRODUTO: TIntegerField;
    cdsRControlePerdaOP_DESCRICAO: TStringField;
    cdsRControlePerdaOP_UNIDADE: TStringField;
    cdsRControlePerdaOP_FORNECEDOR: TIntegerField;
    cdsRControlePerdaOP_NOME_FORNECEDOR: TStringField;
    cdsRControlePerdaOP_QTD_COMPRA: TBCDField;
    cdsRControlePerdaOP_QTD_VENDA: TBCDField;
    cdsRControlePerdaOP_QTD_PERDA: TBCDField;
    cdsRControlePerdaOP_CUSTO_TOTAL: TBCDField;
    dspParcelasOS: TDataSetProvider;
    cdsParcelasOS: TClientDataSet;
    cdsParcelasOSPARCELAS_ORDEM_SERVICO: TIntegerField;
    cdsParcelasOSORDEM_SERVICO: TIntegerField;
    cdsParcelasOSDOCUMENTO: TStringField;
    cdsParcelasOSVENCIMENTO: TDateField;
    cdsParcelasOSVALOR: TBCDField;
    dspNcmNbs: TDataSetProvider;
    cdsConfiguracoesURL_IBPT: TStringField;
    cdsDiasFormapagto: TClientDataSet;
    dspDiasFormapagto: TDataSetProvider;
    cdsDiasFormapagtoDIASFORMAPAGAMENTO: TIntegerField;
    cdsDiasFormapagtoFORMAPAGAMENTO: TIntegerField;
    cdsDiasFormapagtoDIAS: TIntegerField;
    dspProducao: TDataSetProvider;
    cdsProducao: TClientDataSet;
    cdsItemProducao: TClientDataSet;
    dspItemProducao: TDataSetProvider;
    cdsProducaoPRODUTO: TIntegerField;
    cdsProducaoRENDIMENTO: TBCDField;
    cdsProducaoVALOR_DESCONTO: TBCDField;
    cdsItemProducaoPRODUTO: TIntegerField;
    cdsItemProducaoQUANTIDADE: TBCDField;
    cdsProducaoCUSTO_TOTAL: TCurrencyField;
    cdsProducaoVENDA_TOTAL: TCurrencyField;
    cdsProducaoVALOR_TOTAL: TCurrencyField;
    cdsProducaoPRODUCAO: TIntegerField;
    cdsItemProducaoTOTAL_CUSTO: TCurrencyField;
    cdsItemProducaoTOTAL_VENDA: TCurrencyField;
    cdsProducaoINGREDIENTE1: TStringField;
    cdsProducaoINGREDIENTE2: TStringField;
    cdsProducaoINGREDIENTE3: TStringField;
    cdsProducaoINGREDIENTE4: TStringField;
    cdsProducaoINGREDIENTE5: TStringField;
    cdsProducaoINGREDIENTE6: TStringField;
    cdsProducaoINGREDIENTE7: TStringField;
    cdsItemProducaoITEMPRODUCAO: TIntegerField;
    cdsItemProducaoPRODUCAO: TIntegerField;
    cdsItemProducaoESTOQUE: TCurrencyField;
    cdsAdministradorasCOD_REDE: TStringField;
    cdsAdministradorasCOD_BANDEIRA: TStringField;
    dspPesqProdutos: TDataSetProvider;
    cdsPesqProdutos: TClientDataSet;
    cdsPesqProdutosPRODUTO: TIntegerField;
    cdsPesqProdutosDESCRICAO: TStringField;
    cdsPesqProdutosGRUPO: TIntegerField;
    cdsPesqProdutosSUBGRUPO: TIntegerField;
    cdsPesqProdutosSECAO: TIntegerField;
    cdsPesqProdutosUNIDADEEMBALAGEM: TBCDField;
    cdsPesqProdutosPESOLIQUIDO: TBCDField;
    cdsPesqProdutosPESOBRUTO: TBCDField;
    cdsPesqProdutosTRIBUTACAO: TIntegerField;
    cdsPesqProdutosATIVO: TSmallintField;
    cdsPesqProdutosREDBASECALCULO: TFMTBCDField;
    cdsPesqProdutosCST: TStringField;
    cdsPesqProdutosSTATUS: TSmallintField;
    cdsPesqProdutosFORNECEDOR: TIntegerField;
    cdsPesqProdutosNBM: TStringField;
    cdsPesqProdutosNCM: TStringField;
    cdsPesqProdutosDOLARVENDA: TBCDField;
    cdsPesqProdutosINFNUTRICIONAL: TIntegerField;
    cdsPesqProdutosCOMPLEMENTO: TStringField;
    cdsPesqProdutosISENTOPISCOFINS: TSmallintField;
    cdsPesqProdutosSIMILAR: TIntegerField;
    cdsPesqProdutosFABRICANTE: TIntegerField;
    cdsPesqProdutosALTERAR_PRECOVENDA_PDVI: TSmallintField;
    cdsPesqProdutosLITRAGEM: TBCDField;
    cdsPesqProdutosCF_IPI: TSmallintField;
    cdsPesqProdutosCOMPOEM_CESTA_BASICA: TSmallintField;
    cdsPesqProdutosAUTOR1: TIntegerField;
    cdsPesqProdutosAUTOR2: TIntegerField;
    cdsPesqProdutosPERMITE_VENDA_FRACIONADA: TSmallintField;
    cdsPesqProdutosUNIDADE_ATACADO: TBCDField;
    cdsPesqProdutosALIQUOTA_PIS: TBCDField;
    cdsPesqProdutosALIQUOTA_COFINS: TBCDField;
    cdsPesqProdutosVISIBILIDADE: TSmallintField;
    cdsPesqProdutosCST_IPI: TIntegerField;
    cdsPesqProdutosCST_PIS: TIntegerField;
    cdsPesqProdutosCST_COFINS: TIntegerField;
    cdsPesqProdutosTIPO_ITEM: TSmallintField;
    cdsPesqProdutosMVA: TIntegerField;
    cdsPesqProdutosPAUTA_FISCAL: TIntegerField;
    cdsPesqProdutosLEI_PIS_COFINS: TIntegerField;
    cdsPesqProdutosPRODUTO_ORIGEM: TIntegerField;
    cdsPesqProdutosCST_PIS_ENTRADA: TIntegerField;
    cdsPesqProdutosCST_COFINS_ENTRADA: TIntegerField;
    cdsPesqProdutosNATUREZA_RECEITA: TIntegerField;
    cdsPesqProdutosUND_ATACADO: TStringField;
    cdsPesqProdutosALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsPesqProdutosALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsPesqProdutosCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsPesqProdutosCODIGO_ANP: TStringField;
    cdsPesqProdutosCARGA_TRIBUTARIA_NAC: TBCDField;
    cdsPesqProdutosCARGA_TRIBUTARIA_IMP: TBCDField;
    cdsPesqProdutosDESCONTO_PERSONALIZADO: TSmallintField;
    cdsPesqProdutosORIGEM_MERCADORIA: TSmallintField;
    cdsPesqProdutosPRODUTO_1: TIntegerField;
    cdsPesqProdutosFILIAL: TIntegerField;
    cdsPesqProdutosCUSTOBRUTO: TBCDField;
    cdsPesqProdutosCUSTOBRUTOANTERIOR: TBCDField;
    cdsPesqProdutosCUSTOLIQUIDO: TBCDField;
    cdsPesqProdutosCUSTOLIQUIDOANTERIOR: TBCDField;
    cdsPesqProdutosMENORPRECO: TBCDField;
    cdsPesqProdutosPRECOCALCULADO: TBCDField;
    cdsPesqProdutosPRECOPROVISORIO: TBCDField;
    cdsPesqProdutosPRECODEVENDA: TBCDField;
    cdsPesqProdutosPRECODEVENDAANTERIOR: TBCDField;
    cdsPesqProdutosCADASTRO: TDateField;
    cdsPesqProdutosALTERACAO: TDateField;
    cdsPesqProdutosREMARCACAO: TDateField;
    cdsPesqProdutosLUCROICMSR: TBCDField;
    cdsPesqProdutosIMPOSTOSFEDERAIS: TBCDField;
    cdsPesqProdutosCUSTOOPERACIONAL: TBCDField;
    cdsPesqProdutosCOMISSAOVENDA: TBCDField;
    cdsPesqProdutosLUCROLIQUIDO: TBCDField;
    cdsPesqProdutosDEPOSITO: TBCDField;
    cdsPesqProdutosDEPOSITO1: TBCDField;
    cdsPesqProdutosLOJA: TBCDField;
    cdsPesqProdutosLOJA1: TBCDField;
    cdsPesqProdutosSALDOANTERIOR: TBCDField;
    cdsPesqProdutosSALDOMINIMO: TBCDField;
    cdsPesqProdutosSALDOMAXIMO: TBCDField;
    cdsPesqProdutosSETORDEBALANCA: TIntegerField;
    cdsPesqProdutosPRODUTOATIVO: TSmallintField;
    cdsPesqProdutosPROMOCAO: TSmallintField;
    cdsPesqProdutosTECLAASSOCIADA: TIntegerField;
    cdsPesqProdutosVALIDADE: TIntegerField;
    cdsPesqProdutosTECLADO: TSmallintField;
    cdsPesqProdutosREDUCAOBASEDECALCULO: TBCDField;
    cdsPesqProdutosDESCONTOPROGRAMADO: TBCDField;
    cdsPesqProdutosDESCRICAOCUPOMFISCAL: TStringField;
    cdsPesqProdutosDESCRICAOGONDOLA1: TStringField;
    cdsPesqProdutosDESCRICAOGONDOLA2: TStringField;
    cdsPesqProdutosDESCRICAOBALANCA: TStringField;
    cdsPesqProdutosDESCRICAOTIRATEIMA: TStringField;
    cdsPesqProdutosENVIARPARABALANCA: TSmallintField;
    cdsPesqProdutosDESCONTONACOMPRA: TBCDField;
    cdsPesqProdutosCREDITODEICMS: TBCDField;
    cdsPesqProdutosIPI: TBCDField;
    cdsPesqProdutosOUTROSCUSTOS: TBCDField;
    cdsPesqProdutosFRETE: TBCDField;
    cdsPesqProdutosICMSAPAGAR: TBCDField;
    cdsPesqProdutosDESCONTONAVENDA: TBCDField;
    cdsPesqProdutosVALORDODESCONTONACOMPRA: TBCDField;
    cdsPesqProdutosVALORDOCREDITODEICMSR: TBCDField;
    cdsPesqProdutosVALORDOIPI: TBCDField;
    cdsPesqProdutosVALORDEOUTROSCUSTOS: TBCDField;
    cdsPesqProdutosVALORDOFRETE: TBCDField;
    cdsPesqProdutosVALORDOICMSR: TBCDField;
    cdsPesqProdutosPRECOPROMOCAO: TBCDField;
    cdsPesqProdutosDESCONTOTABELA1: TCurrencyField;
    cdsPesqProdutosDESCONTOTABELA2: TCurrencyField;
    cdsPesqProdutosDESCONTOTABELA3: TCurrencyField;
    cdsPesqProdutosVALORUNITARIO: TBCDField;
    cdsPesqProdutosSUBSTITUICAOTRIBUTARIA: TCurrencyField;
    cdsPesqProdutosULTIMA_ENTRADA: TDateField;
    cdsPesqProdutosSALDO_RESERVADO: TBCDField;
    cdsPesqProdutosULTIMA_NF_ENTRADA: TStringField;
    cdsPesqProdutosCUSTO_MEDIO: TBCDField;
    cdsPesqProdutosCUSTO_MEDIO_ANTERIOR: TBCDField;
    cdsPesqProdutosDATA_CUSTO_MEDIO: TDateField;
    cdsPesqProdutosDATA_CUSTO_MEDIO_ANTERIOR: TDateField;
    cdsPesqProdutosPRECO_ATACADO: TBCDField;
    cdsPesqProdutosDESCRICAO_ATACADO: TStringField;
    cdsPesqProdutosPERCENTUAL_ISS: TBCDField;
    cdsPesqProdutosPERCENTUAL_IOF: TBCDField;
    cdsPesqProdutosPERCENTUAL_CIDE: TBCDField;
    cdsPesqProdutosSALDO_ATUAL: TCurrencyField;
    cdsNFEntradaNFENTRADA: TIntegerField;
    cdsNFEntradaNOTAFISCAL: TStringField;
    cdsNFEntradaNOTAFISCALINTERNA: TStringField;
    cdsNFEntradaFORNECEDOR: TIntegerField;
    cdsNFEntradaORDEMDECOMPRA: TIntegerField;
    cdsNFEntradaENTRADA: TDateField;
    cdsNFEntradaEMISSAO: TDateField;
    cdsNFEntradaSAIDA: TDateField;
    cdsNFEntradaCFOP: TStringField;
    cdsNFEntradaTRANSPORTADORA: TIntegerField;
    cdsNFEntradaTIPOFRETE: TSmallintField;
    cdsNFEntradaFRETEAGREGADO: TSmallintField;
    cdsNFEntradaBASEICMS: TBCDField;
    cdsNFEntradaVALORICMS: TBCDField;
    cdsNFEntradaBASESUBSTITUICAO: TBCDField;
    cdsNFEntradaVALORSUBSTITUICAO: TBCDField;
    cdsNFEntradaVALORDOFRETE: TBCDField;
    cdsNFEntradaVALORDOSEGURO: TBCDField;
    cdsNFEntradaOUTRASDESPESAS: TBCDField;
    cdsNFEntradaVALORDOIPI: TBCDField;
    cdsNFEntradaVALORDOSPRODUTOS: TBCDField;
    cdsNFEntradaVALORDANOTA: TBCDField;
    cdsNFEntradaBASEICMSCALCULADO: TBCDField;
    cdsNFEntradaVALORICMSCALCULADO: TBCDField;
    cdsNFEntradaBASESUBSTITUICAOCALCULADO: TBCDField;
    cdsNFEntradaVALORSUBSTITUICAOCALCULADO: TBCDField;
    cdsNFEntradaVALORDOFRETECALCULADO: TBCDField;
    cdsNFEntradaVALORDOSEGUROCALCULADO: TBCDField;
    cdsNFEntradaOUTRASDESPESASCALCULADO: TBCDField;
    cdsNFEntradaVALORDOIPICALCULADO: TBCDField;
    cdsNFEntradaVALORDOSPRODUTOSCALCULADO: TBCDField;
    cdsNFEntradaVALORDANOTACALCULADO: TBCDField;
    cdsNFEntradaDESCONTOGERAL: TBCDField;
    cdsNFEntradaDESCONTOGERALCALCULADO: TBCDField;
    cdsNFEntradaPESOBRUTO: TBCDField;
    cdsNFEntradaPESOLIQUIDO: TBCDField;
    cdsNFEntradaQUANTIDADEVOLUME: TBCDField;
    cdsNFEntradaESPECIEVOLUME: TStringField;
    cdsNFEntradaMARCAVOLUME: TStringField;
    cdsNFEntradaNUMEROVOLUME: TIntegerField;
    cdsNFEntradaPLACAVEICULO: TStringField;
    cdsNFEntradaUFVEICULO: TStringField;
    cdsNFEntradaSTATUS: TSmallintField;
    cdsNFEntradaIMPRESSO: TSmallintField;
    cdsNFEntradaOBSERVACAO: TMemoField;
    cdsNFEntradaSERIENF: TStringField;
    cdsNFEntradaMODELO: TStringField;
    cdsNFEntradaCANCELADA: TSmallintField;
    cdsNFEntradaRATEAR_DESCONTO: TSmallintField;
    cdsNFEntradaTIPO_CONTABIL: TSmallintField;
    cdsNFEntradaCODIGO_VALOR_FISCAL: TSmallintField;
    cdsNFEntradaSOMAR_DESPACESS_BASEICMS: TSmallintField;
    cdsNFEntradaSOMAR_IPI_BASEICMS: TSmallintField;
    cdsNFEntradaSOMAR_ICMSR_VALORNOTA: TSmallintField;
    cdsNFEntradaREDUCAO_PIS_COFINS: TSmallintField;
    cdsNFEntradaALIQUOTA_CREDITO_SIMPLES: TCurrencyField;
    cdsNFEntradaCOMPRADOR: TIntegerField;
    cdsNFEntradaPROTOCOLO_DANFE: TStringField;
    cdsNFEntradaVALOR_PIS: TBCDField;
    cdsNFEntradaVALOR_COFINS: TBCDField;
    cdsNFEntradaVALOR_PIS_ST: TBCDField;
    cdsNFEntradaVALOR_COFINS_ST: TBCDField;
    cdsNFEntradaSITUACAO_DOCUMENTO: TStringField;
    cdsUltimaNFForn: TClientDataSet;
    dspUltimaNFForn: TDataSetProvider;
    cdsNFEntradaCOM_FRETE: TStringField;
    cdsNFEntradaDESCRICAO_STATUS: TStringField;
    dspUltimaOCForn: TDataSetProvider;
    cdsUltimaOCForn: TClientDataSet;
    cdsUltimaNFFornNOTAFISCAL: TStringField;
    cdsUltimaNFFornENTRADA: TDateField;
    cdsUltimaNFFornEMISSAO: TDateField;
    cdsUltimaNFFornVALORDOSPRODUTOS: TBCDField;
    cdsUltimaNFFornVALORDANOTA: TBCDField;
    cdsUltimaOCFornORDEMDECOMPRA: TIntegerField;
    cdsUltimaOCFornEMISSAO: TSQLTimeStampField;
    cdsUltimaOCFornFATURAMENTO: TDateField;
    cdsUltimaOCFornTOTALDOPEDIDO: TBCDField;
    cdsUltimaOCFornENTREGA: TDateField;
    dspPaises: TDataSetProvider;
    cdsPaises: TClientDataSet;
    cdsPaisesCODIGO: TIntegerField;
    cdsPaisesNOME: TStringField;
    cdsUsuariosSUPER_USUARIO: TSmallintField;
    cdsItens_OS_servicoUSUARIO: TIntegerField;
    cdsItens_OS_PecasUSUARIO: TIntegerField;
    cdsUsuariosATIVO: TSmallintField;
    cdsItens_OS_servicoNOME_USUARIO: TStringField;
    cdsItens_OS_PecasNOME_USURIO: TStringField;
    cdsConfiguracoesNOME_CONTADOR: TStringField;
    cdsConfiguracoesENDERECO_CONTADOR: TStringField;
    cdsConfiguracoesCOMPLEMENTO_CONTADOR: TStringField;
    cdsConfiguracoesBAIRRO_CONTADOR: TStringField;
    cdsConfiguracoesCIDADE_CONTADOR: TIntegerField;
    cdsConfiguracoesPATH_BANCO_DE_DADOS: TStringField;
    cdsConfiguracoesREPOSITORIO_XML_ENTRADA: TStringField;
    cdsConfiguracoesQUANTIDADE_TERMINAL_CONSULTA: TSmallintField;
    cdsConfiguracoesENDERECO_WS_GENESIS: TStringField;
    cdsConfiguracoesPORTA_WS_GENESIS: TStringField;
    cdsConfiguracoesCOPIAR_XML_ENTRADA_REPOSITORIO: TSmallintField;
    cdsConfiguracoesIMPORTAR_PARCELAS_NFE: TSmallintField;
    cdsConfiguracoesUSAR_CAMPO_COMPLE_PESQUISA_NFE: TSmallintField;
    cdsConfiguracoesENVIAR_XML_CONTABILIDADE: TSmallintField;
    cdsConfiguracoesEMAIL_CONTADOR: TStringField;
    dspBarras: TDataSetProvider;
    cdsBarras: TClientDataSet;
    cdsBarrasBARRAS: TStringField;
    cdsBarrasPRODUTO: TIntegerField;
    cdsBarrasPESADO: TSmallintField;
    cdsBarrasGERADO: TSmallintField;
    cdsBarrasQUANTIDADE: TIntegerField;
    cdsUndMedida: TClientDataSet;
    dspUndMedida: TDataSetProvider;
    cdsUndMedidaUNIDADE: TStringField;
    cdsUndMedidaDESCRICAO: TStringField;
    cdsMenuAtalhos: TClientDataSet;
    dspMenuAtalhos: TDataSetProvider;
    cdsMenuAtalhosTITULO: TStringField;
    cdsMenuAtalhosENDERECO: TStringField;
    cdsMenuAtalhosIMAGEM_ATALHO: TBlobField;
    cdsMenuAtalhosTIPO_ATALHO: TSmallintField;
    cdsVersaoAtual: TClientDataSet;
    cdsVersaoAtualOBSERVACAO: TMemoField;
    cdsVersaoAtualVERSAO: TStringField;
    cdsLiveUpdate: TClientDataSet;
    cdsLiveUpdateOBSERVACAO: TMemoField;
    cdsLiveUpdateVERSAO: TStringField;
    cdsAlmoxarifado: TClientDataSet;
    dspAlmoxarifado: TDataSetProvider;
    cdsAlmoxarifadoALMOXARIFADO: TIntegerField;
    cdsAlmoxarifadoEMISSAO: TDateField;
    cdsAlmoxarifadoHORA: TTimeField;
    cdsAlmoxarifadoFUNCIONARIO: TIntegerField;
    cdsAlmoxarifadoREQUERENTE: TIntegerField;
    cdsAlmoxarifadoSTATUS: TSmallintField;
    cdsAlmoxarifadoOBSERVACAO: TBlobField;
    cdsAlmoxarifadoUSUARIO: TStringField;
    cdsItemAlmoxarifado: TClientDataSet;
    dspItemAlmoxarifado: TDataSetProvider;
    cdsItemAlmoxarifadoITEM_ALMOXARIFADO: TIntegerField;
    cdsItemAlmoxarifadoPRODUTO: TIntegerField;
    cdsItemAlmoxarifadoQUANTIDADE: TBCDField;
    cdsItemAlmoxarifadoUSUARIO: TStringField;
    cdsItemAlmoxarifadoALMOXARIFADO: TIntegerField;
    cdsAlmoxarifadoNOME_REQUERENTE: TStringField;
    cdsItemAlmoxarifadoDESCRICAO: TStringField;
    cdsAlmoxarifadoDESCRICAO_STATUS: TStringField;
    cdsPesqProdutosSALDO_ALMOXARIFADO: TBCDField;
    cdsCfgConexaoZeusRetail: TClientDataSet;
    dspCfgConexaoZeusRetail: TDataSetProvider;
    cdsCfgConexaoZeusRetailIP_SERVIDOR: TStringField;
    cdsCfgConexaoZeusRetailNOME_BANCO: TStringField;
    cdsCfgConexaoZeusRetailUSUARIO: TStringField;
    cdsCfgConexaoZeusRetailSENHA: TStringField;
    cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO: TSmallintField;
    dspPedidoZeus: TDataSetProvider;
    dspItemPedZeus: TDataSetProvider;
    cdsItemPedZeus: TClientDataSet;
    cdsItemPedZeusFILIAL: TIntegerField;
    cdsItemPedZeusPEDIDO: TIntegerField;
    cdsItemPedZeusITEM_PEDIDO: TIntegerField;
    cdsItemPedZeusPRODUTO: TIntegerField;
    cdsItemPedZeusOBSERVACOES: TMemoField;
    cdsItemPedZeusGRUPO: TIntegerField;
    cdsItemPedZeusCOD_TRIBUTACAO: TStringField;
    cdsItemPedZeusALIQUOTA_ICMS: TBCDField;
    cdsItemPedZeusQUANTIDADE: TBCDField;
    cdsItemPedZeusVALOR_UNITARIO: TBCDField;
    cdsItemPedZeusVALOR_DESCONTO: TBCDField;
    cdsItemPedZeusUSUARIO: TStringField;
    cdsItemPedZeusDATA_CADASTRO: TDateField;
    cdsItemPedZeusDATA_ALTERACAO: TDateField;
    cdsItemPedZeusCONTROLE_ALTERACAO: TSmallintField;
    cdsItemPedZeusVALOR_ACRESCIMO: TBCDField;
    cdsItemPedZeusDESCRICAO: TStringField;
    cdsItemPedZeusUNIDADE: TStringField;
    cdsItemPedZeusSUB_TOTAL: TCurrencyField;
    cdsEndEntregaPedZeus: TClientDataSet;
    dspEndEntregaPedZeus: TDataSetProvider;
    cdsEndEntregaPedZeusFILIAL: TIntegerField;
    cdsEndEntregaPedZeusPEDIDO: TIntegerField;
    cdsEndEntregaPedZeusTELEFONE_ENTREGA: TStringField;
    cdsEndEntregaPedZeusENDERECO: TStringField;
    cdsEndEntregaPedZeusNUMERO: TIntegerField;
    cdsEndEntregaPedZeusCEP: TStringField;
    cdsEndEntregaPedZeusCOMPLEMENTO: TStringField;
    cdsEndEntregaPedZeusBAIRRO: TStringField;
    cdsEndEntregaPedZeusCIDADE: TStringField;
    cdsEndEntregaPedZeusESTADO: TStringField;
    cdsEndEntregaPedZeusHORA_TRANSACAO: TTimeField;
    cdsFinalizadoraPedZeus: TClientDataSet;
    dspFinalizadoraPedZeus: TDataSetProvider;
    cdsFinalizadoraPedZeusFILIAL: TIntegerField;
    cdsFinalizadoraPedZeusPEDIDO: TIntegerField;
    cdsFinalizadoraPedZeusFORMA_PAGAMENTO: TIntegerField;
    cdsFinalizadoraPedZeusCOD_FINALIZADORA: TStringField;
    cdsFinalizadoraPedZeusVALOR_FINALIZADO: TBCDField;
    cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS: TIntegerField;
    cdsFinalizadoraPedZeusCLASSE_FINALIZADORA: TIntegerField;
    cdsConfig_iniLOJA: TIntegerField;
    cdsConfig_iniNOME_LOJA: TStringField;
    cdsConfig_iniULTIMO_USUARIO: TStringField;
    cdsFinalizadoraPedZeusNOME: TStringField;
    cdsPedidoZeus: TClientDataSet;
    cdsPedidoZeusPEDIDO: TIntegerField;
    cdsPedidoZeusFILIAL: TIntegerField;
    cdsPedidoZeusEMISSAO: TDateField;
    cdsPedidoZeusLOJA_SAI_MERCADORIA: TIntegerField;
    cdsPedidoZeusENTREGA: TSmallintField;
    cdsPedidoZeusSITUACAO: TSmallintField;
    cdsPedidoZeusNUMERO_ITENS_PEDIDO: TIntegerField;
    cdsPedidoZeusVENDEDOR: TIntegerField;
    cdsPedidoZeusDATA_ENTREGA: TDateField;
    cdsPedidoZeusDATA_MONTAGEM: TDateField;
    cdsPedidoZeusTERMO_ENCOMENDA: TStringField;
    cdsPedidoZeusVALOR_DESCONTO: TBCDField;
    cdsPedidoZeusOBSERVACOES: TMemoField;
    cdsPedidoZeusHORARIO_PEDIDO: TTimeField;
    cdsPedidoZeusUSUARIO: TStringField;
    cdsPedidoZeusDATA_CADASTRO: TDateField;
    cdsPedidoZeusDATA_ULTIMA_ALTERACAO: TDateField;
    cdsPedidoZeusCONTROLE_ALTERACAO: TSmallintField;
    cdsPedidoZeusSITUACAO_ERP: TSmallintField;
    cdsPedidoZeusVALOR_DO_PEDIDO: TBCDField;
    cdsPedidoZeusVALIDADE_PEDIDO: TDateField;
    cdsPedidoZeusNUMERO_PRE_VENDA: TIntegerField;
    cdsPedidoZeusNUMERO_DAV: TIntegerField;
    cdsPedidoZeusSITUACAO_DAV: TSmallintField;
    cdsPedidoZeusVALOR_ACRESCIMO: TBCDField;
    cdsPedidoZeusPEDIDO_ORCAMENTO: TSmallintField;
    cdsPedidoZeusTOTAL_MERCADORIAS: TBCDField;
    cdsPedidoZeusENDERECOENTREGA: TStringField;
    cdsPedidoZeusNUMEROENTREGA: TIntegerField;
    cdsPedidoZeusCEPENTREGA: TStringField;
    cdsPedidoZeusCOMPLEMENTO: TStringField;
    cdsPedidoZeusESTADOENTREGA: TStringField;
    cdsPedidoZeusDDD: TStringField;
    cdsPedidoZeusTELEFONE1: TStringField;
    cdsPedidoZeusS_ORCAMENTO_PEDIDO: TStringField;
    cdsAlmoxarifadoNOME_ATENDENTE: TStringField;
    cdsPedidoZeusNOME: TStringField;
    cdsPedidoZeusRAZAOSOCIAL: TStringField;
    cdsItemPedZeusTOTAL_MERCADORIAS: TAggregateField;
    cdsItemPedZeusTOTAL_PEDIDO: TAggregateField;
    cdsItemPedZeusVALOR_TOTAL_ITEM: TBCDField;
    cdsFinalizadoraPedZeusTOTAL_RECEBIDO: TAggregateField;
    cdsPedidoZeusCLIENTE: TIntegerField;
    cdsItemPedZeusGTIN: TStringField;
    cdsItemPedZeusTOT_DESCONTO: TAggregateField;
    cdsItemPedZeusTOT_ACRESCIMO: TAggregateField;
    cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO: TSmallintField;
    cdsCidadesNOME_ESTADO: TStringField;
    cdsParcelasPedZeus: TClientDataSet;
    dspParcelasPedZeus: TDataSetProvider;
    cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS: TIntegerField;
    cdsParcelasPedZeusCODIGO_PEDIDO: TIntegerField;
    cdsParcelasPedZeusFORMA_PAGAMENTO: TIntegerField;
    cdsParcelasPedZeusVENCIMENTO: TDateField;
    cdsParcelasPedZeusVALOR: TBCDField;
    cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE: TSmallintField;
    dspCaixa_Loja: TDataSetProvider;
    cdsCaixaLoja: TClientDataSet;
    cdsCaixaLojaCAIXA_LOJA: TIntegerField;
    cdsCaixaLojaDATA_ABERTURA: TDateField;
    cdsCaixaLojaHORA_ABERTURA: TTimeField;
    cdsCaixaLojaDATA_FECHAMENTO: TDateField;
    cdsCaixaLojaHORA_FECHAMENTO: TTimeField;
    cdsCaixaLojaSTATUS: TSmallintField;
    cdsCaixaLojaVALOR_ABERTURA: TBCDField;
    cdsCaixaLojaVALOR_MOVIMENTO: TBCDField;
    cdsCaixaLojaFUNCIONARIO: TIntegerField;
    cdsCaixaLojaNOME_FUNCIONARIO: TStringField;
    cdsCaixaLojaSTATUS_CAIXA: TStringField;
    dspItemCaixaLoja: TDataSetProvider;
    cdsItemCaixaLoja: TClientDataSet;
    cdsItemCaixaLojaITEM_CAIXA_LOJA: TIntegerField;
    cdsItemCaixaLojaCAIXA_LOJA: TIntegerField;
    cdsItemCaixaLojaFAVORECIDO: TStringField;
    cdsItemCaixaLojaDOCUMENTO: TStringField;
    cdsItemCaixaLojaDATA: TDateField;
    cdsItemCaixaLojaTIPO_LANCAMENTO: TSmallintField;
    cdsItemCaixaLojaVALOR: TBCDField;
    cdsItemCaixaLojaCREDITO_DEBITO: TStringField;
    cdsItemCaixaLojaSALDO: TBCDField;
    cdsItemCaixaLojaHISTORICO: TStringField;
    cdsItemCaixaLojaCONTA_MOVIMENTO: TStringField;
    cdsItemCaixaLojaPLANO_CONTA: TIntegerField;
    cdsItemCaixaLojaITEM_PLANO_CONTA: TIntegerField;
    cdsItemCaixaLojaDEBITO: TCurrencyField;
    cdsItemCaixaLojaCREDITO: TCurrencyField;
    cdsConfiguracoesINTEGRAR_BALCAO_ZEUS: TSmallintField;
    cdsCaixaLojaVALOR_DINHEIRO: TBCDField;
    cdsCaixaLojaVALOR_CHEQUE: TBCDField;
    cdsCaixaLojaVALOR_CARTAO: TBCDField;
    cdsCaixaLojaVALOR_PRAZO: TBCDField;
    cdsCaixaLojaOUTROS_VALORES: TBCDField;
    cdsCaixaLojaTOTAL_DEBITOS: TBCDField;
    cdsCaixaLojaTOTAL_CREDITOS: TBCDField;
    cdsItemCaixaLojaS_TIPO_LANCAMENTO: TStringField;
    cdsConfiguracoesUSAR_NOME_PASTA_IMP_CUPOM_NFS: TSmallintField;
    cdsItemPedZeusENTREGA: TSmallintField;
    cdsItemPedZeusRESERVADO: TSmallintField;
    cdsItemPedZeusS_ENTREGA_RETIRADO: TStringField;
    cdsItemPedZeusS_RESERVADO: TStringField;
    cdsPedidoZeusBAIRROENTREGA: TStringField;
    cdsPedidoZeusCNPJ: TStringField;
    cdsPedidoZeusCIDADE_ENTREGA: TStringField;
    cdsConfiguracoesQUANTIDADEDECOPIASDEPEDIDO: TSmallintField;
    cdsFinalizadoraPedZeusTIPO: TSmallintField;
    cdsValorPrazoPedido: TClientDataSet;
    dspValorPrazoPedido: TDataSetProvider;
    cdsValorPrazoPedidoTOTAL_PRAZO: TBCDField;
    cdsParcelamentoCX: TClientDataSet;
    dspParcelamentoCX: TDataSetProvider;
    cdsParcelamentoCXNOME: TStringField;
    cdsParcelamentoCXPARCELAS: TIntegerField;
    cdsParcelamentoCXFORMAPAGAMENTO: TIntegerField;
    cdsParcelamentoCXPLANODECONTAS: TIntegerField;
    cdsParcelamentoCXITEMPLANODECONTAS: TIntegerField;
    cdsParcelamentoCXLANCAMENTO: TIntegerField;
    cdsParcelasCRE_TEMP_CX: TClientDataSet;
    cdsParcelasCRE_TEMP_CXPEDIDO: TIntegerField;
    cdsParcelasCRE_TEMP_CXNUM_PARCELA: TIntegerField;
    cdsParcelasCRE_TEMP_CXVENCIMENTO: TDateField;
    cdsParcelasCRE_TEMP_CXVALOR: TCurrencyField;
    cdsParcelasCRE_TEMP_CXPLANO_CONTA: TIntegerField;
    cdsParcelasCRE_TEMP_CXITEM_PLANO_CONTA: TIntegerField;
    cdsParcelasCRE_TEMP_CXLANCAMENTO: TIntegerField;
    cdsParcelasCRE_TEMP_CXDOCUMENTO: TStringField;
    cdsParcelasCRE_TEMP_CXDATA: TDateField;
    cdsParcelasCRE_TEMP_CXNOME_CLIENTE: TStringField;
    cdsParcelasCRE_TEMP_CXCNPJ_CLIENTE: TStringField;
    cdsParcelasCRE_TEMP_CXMORA_RIARIA: TCurrencyField;
    cdsUndMedidaPERMITE_VENDA_FRACIONADA: TSmallintField;
    cdsOrdemServicoDESCRICAO_STATUS: TStringField;
    cdsConfiguracoesMODELO_COMUNICACAO_SERVICO: TStringField;
    cdsEquipamentosCODIGO_PRODUCAO: TIntegerField;
    cdsCst: TClientDataSet;
    dspCst: TDataSetProvider;
    cdsCstCST: TStringField;
    cdsCstDESCRICAO: TStringField;
    cdsCstOBSERVACAO: TMemoField;
    cdsCstCRT: TIntegerField;
    cdsCstCSOSN: TIntegerField;
    cdsCstCST_TRANSICAO: TStringField;
    cdsCFOP_CFPSCST_PIS_ENTRADA: TIntegerField;
    cdsCFOP_CFPSALIQUOTA_PIS_ENTRADA: TBCDField;
    cdsCFOP_CFPSCST_COFINS_ENTRADA: TIntegerField;
    cdsCFOP_CFPSALIQUOTA_COFINS_ENTRADA: TBCDField;
    cdsCFOP_CFPSCST_PIS_SAIDA: TIntegerField;
    cdsCFOP_CFPSALIQUOTA_PIS_SAIDA: TBCDField;
    cdsCFOP_CFPSCST_COFINS_SAIDA: TIntegerField;
    cdsCFOP_CFPSALIQUOTA_COFINS_SAIDA: TBCDField;
    cdsConfiguracoesATUALIZAR_FOR_PRO_PELA_NFE: TSmallintField;
    cdsNcmNbs: TClientDataSet;
    cdsNcmNbsCOD_NCM: TStringField;
    cdsNcmNbsNOME_NCM: TStringField;
    cdsNcmNbsNCM_NBS: TSmallintField;
    cdsNcmNbsEX_TIPI: TStringField;
    cdsNcmNbsCARGA_NAC_FEDERAL: TBCDField;
    cdsNcmNbsCARGA_IMP_FEDERAL: TBCDField;
    cdsNcmNbsCARGA_ESTADUAL: TBCDField;
    cdsNcmNbsCARGA_MUNICIPAL: TBCDField;
    cdsNcmNbsCHAVE: TStringField;
    cdsNcmNbsFONTE: TStringField;
    cdsNcmNbsCOD_NBM: TStringField;
    cdsNcmNbsNOME_NBM: TStringField;
    cdsNcmNbsALIQUOTA_NACIONAL: TBCDField;
    cdsNcmNbsALIQUOTA_IMPORTACAO: TBCDField;
    cdsNcmNbsALIQ_EX_NAC_TIPI: TBCDField;
    cdsNcmNbsALIQ_EX_IMP_TIPI: TBCDField;
    cdsItemProducaoPERDA: TBCDField;
    cdsConfigBuscaCEP: TClientDataSet;
    dspConfigBuscaCEP: TDataSetProvider;
    cdsConfigBuscaCEPWEB_SERVICE: TSmallintField;
    cdsConfigBuscaCEPPROXY_HOST: TStringField;
    cdsConfigBuscaCEPPROXY_PORT: TStringField;
    cdsConfigBuscaCEPPROXY_USER: TStringField;
    cdsConfigBuscaCEPPROXY_PASSWORD: TStringField;
    cdsConfigBuscaCEPCHAVE_ACESSO: TStringField;
    dspOrdemProducao: TDataSetProvider;
    cdsOrdemProducao: TClientDataSet;
    cdsOrdemProducaoORDEM_DE_PRODUCAO: TIntegerField;
    cdsOrdemProducaoFILIAL: TIntegerField;
    cdsOrdemProducaoSITUACAO: TSmallintField;
    cdsOrdemProducaoDATA_INICIO: TDateField;
    cdsOrdemProducaoDATA_PREVISTA: TDateField;
    cdsOrdemProducaoDATA_TERMINO: TDateField;
    cdsOrdemProducaoORDEM_SERVICO: TIntegerField;
    cdsOrdemProducaoPRODUTO_FINAL: TIntegerField;
    cdsOrdemProducaoQUANTIDADE: TBCDField;
    cdsOrdemProducaoTIPO_PRODUCAO: TSmallintField;
    cdsOrdemProducaoFUNCIONARIO_RESPONSAVEL: TIntegerField;
    cdsOrdemProducaoNOME_PRODUTO: TStringField;
    cdsOrdemProducaoS_SITUACAO: TStringField;
    cdsOrdemProducaoOBSERVACAO: TMemoField;
    cdsConfiguracoesPERMITE_VENDA_ABAIXO_CUSTOLIQ: TSmallintField;
    cdsConfiguracoesDESCONTO_MAXIMO_VENDA: TBCDField;
    cdsItemPedZeusAUTORIZACAO_DESCONTO: TStringField;
    cdsOrdemProducaoRENDIMENTO: TBCDField;
    cdsOrdemProducaoESTOQUE_ATUAL: TBCDField;
    cdsOrdemProducaoQUANT_PRODUZIDA: TCurrencyField;
    cdsOrdemProducaoDESCRICAO_PRODUTO: TStringField;
    cdsOrdemProducaoUND_PRODUTO: TStringField;
    cdsItemOrdemProducao: TClientDataSet;
    dspItemOrdemProducao: TDataSetProvider;
    cdsItemOrdemProducaoFILIAL: TIntegerField;
    cdsItemOrdemProducaoORDEM_DE_PRODUCAO: TIntegerField;
    cdsItemOrdemProducaoPRODUTO_INSUMO: TIntegerField;
    cdsItemOrdemProducaoQUANTIDADE_PREVISTA: TBCDField;
    cdsItemOrdemProducaoQUANTIDADE_UTILIZADA: TBCDField;
    cdsItemOrdemProducaoPERDA: TBCDField;
    cdsItemOrdemProducaoESTOQUE_ATUAL: TBCDField;
    cdsItemOrdemProducaoFLAG_SALDO: TSmallintField;
    cdsItemOrdemProducaoUSUARIO: TStringField;
    cdsItemOrdemProducaoDESCRICAO_PRODUTO: TStringField;
    cdsOrdemProducaoS_TIPO_PRODUCAO: TStringField;
    cdsCFOP_CFPSNATUREZA_RECEITA_PIS_COFINS: TIntegerField;
    cdsCFOP_CFPSCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsProdutoFT: TClientDataSet;
    dspProdutoFT: TDataSetProvider;
    cdsProdutoFTPRODUTO: TIntegerField;
    cdsProdutoFTDESCRICAO: TStringField;
    cdsProdutoFTGRUPO: TIntegerField;
    cdsProdutoFTSUBGRUPO: TIntegerField;
    cdsProdutoFTSECAO: TIntegerField;
    cdsProdutoFTUNIDADE: TStringField;
    cdsProdutoFTUNIDADEEMBALAGEM: TBCDField;
    cdsProdutoFTPESOLIQUIDO: TBCDField;
    cdsProdutoFTPESOBRUTO: TBCDField;
    cdsProdutoFTTRIBUTACAO: TIntegerField;
    cdsProdutoFTATIVO: TSmallintField;
    cdsProdutoFTREDBASECALCULO: TFMTBCDField;
    cdsProdutoFTCST: TStringField;
    cdsProdutoFTSTATUS: TSmallintField;
    cdsProdutoFTFORNECEDOR: TIntegerField;
    cdsProdutoFTNBM: TStringField;
    cdsProdutoFTNCM: TStringField;
    cdsProdutoFTDOLARVENDA: TBCDField;
    cdsProdutoFTINFNUTRICIONAL: TIntegerField;
    cdsProdutoFTCOMPLEMENTO: TStringField;
    cdsProdutoFTISENTOPISCOFINS: TSmallintField;
    cdsProdutoFTSIMILAR: TIntegerField;
    cdsProdutoFTFABRICANTE: TIntegerField;
    cdsProdutoFTALTERAR_PRECOVENDA_PDVI: TSmallintField;
    cdsProdutoFTLITRAGEM: TBCDField;
    cdsProdutoFTCF_IPI: TSmallintField;
    cdsProdutoFTCOMPOEM_CESTA_BASICA: TSmallintField;
    cdsProdutoFTAUTOR1: TIntegerField;
    cdsProdutoFTAUTOR2: TIntegerField;
    cdsProdutoFTPERMITE_VENDA_FRACIONADA: TSmallintField;
    cdsProdutoFTUNIDADE_ATACADO: TBCDField;
    cdsProdutoFTALIQUOTA_PIS: TBCDField;
    cdsProdutoFTALIQUOTA_COFINS: TBCDField;
    cdsProdutoFTVISIBILIDADE: TSmallintField;
    cdsProdutoFTCST_IPI: TIntegerField;
    cdsProdutoFTCST_PIS: TIntegerField;
    cdsProdutoFTCST_COFINS: TIntegerField;
    cdsProdutoFTTIPO_ITEM: TSmallintField;
    cdsProdutoFTMVA: TIntegerField;
    cdsProdutoFTPAUTA_FISCAL: TIntegerField;
    cdsProdutoFTLEI_PIS_COFINS: TIntegerField;
    cdsProdutoFTPRODUTO_ORIGEM: TIntegerField;
    cdsProdutoFTCST_PIS_ENTRADA: TIntegerField;
    cdsProdutoFTCST_COFINS_ENTRADA: TIntegerField;
    cdsProdutoFTNATUREZA_RECEITA: TIntegerField;
    cdsProdutoFTUND_ATACADO: TStringField;
    cdsProdutoFTALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsProdutoFTALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsProdutoFTCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsProdutoFTCODIGO_ANP: TStringField;
    cdsProdutoFTCARGA_TRIBUTARIA_NAC: TBCDField;
    cdsProdutoFTCARGA_TRIBUTARIA_IMP: TBCDField;
    cdsProdutoFTDESCONTO_PERSONALIZADO: TSmallintField;
    cdsProdutoFTORIGEM_MERCADORIA: TSmallintField;
    cdsProdutoFTCEST: TStringField;
    cdsProducaoDESCRICAO_PRODUTO: TStringField;
    cdsProducaoUNID_PRODUTO: TStringField;
    cdsProdutoItemFT: TClientDataSet;
    dspProdutoItemFT: TDataSetProvider;
    cdsProdutoItemFTPRODUTO: TIntegerField;
    cdsProdutoItemFTDESCRICAO: TStringField;
    cdsProdutoItemFTGRUPO: TIntegerField;
    cdsProdutoItemFTSUBGRUPO: TIntegerField;
    cdsProdutoItemFTSECAO: TIntegerField;
    cdsProdutoItemFTUNIDADE: TStringField;
    cdsProdutoItemFTUNIDADEEMBALAGEM: TBCDField;
    cdsProdutoItemFTPESOLIQUIDO: TBCDField;
    cdsProdutoItemFTPESOBRUTO: TBCDField;
    cdsProdutoItemFTTRIBUTACAO: TIntegerField;
    cdsProdutoItemFTATIVO: TSmallintField;
    cdsProdutoItemFTREDBASECALCULO: TFMTBCDField;
    cdsProdutoItemFTCST: TStringField;
    cdsProdutoItemFTSTATUS: TSmallintField;
    cdsProdutoItemFTFORNECEDOR: TIntegerField;
    cdsProdutoItemFTNBM: TStringField;
    cdsProdutoItemFTNCM: TStringField;
    cdsProdutoItemFTDOLARVENDA: TBCDField;
    cdsProdutoItemFTINFNUTRICIONAL: TIntegerField;
    cdsProdutoItemFTCOMPLEMENTO: TStringField;
    cdsProdutoItemFTISENTOPISCOFINS: TSmallintField;
    cdsProdutoItemFTSIMILAR: TIntegerField;
    cdsProdutoItemFTFABRICANTE: TIntegerField;
    cdsProdutoItemFTALTERAR_PRECOVENDA_PDVI: TSmallintField;
    cdsProdutoItemFTLITRAGEM: TBCDField;
    cdsProdutoItemFTCF_IPI: TSmallintField;
    cdsProdutoItemFTCOMPOEM_CESTA_BASICA: TSmallintField;
    cdsProdutoItemFTAUTOR1: TIntegerField;
    cdsProdutoItemFTAUTOR2: TIntegerField;
    cdsProdutoItemFTPERMITE_VENDA_FRACIONADA: TSmallintField;
    cdsProdutoItemFTUNIDADE_ATACADO: TBCDField;
    cdsProdutoItemFTALIQUOTA_PIS: TBCDField;
    cdsProdutoItemFTALIQUOTA_COFINS: TBCDField;
    cdsProdutoItemFTVISIBILIDADE: TSmallintField;
    cdsProdutoItemFTCST_IPI: TIntegerField;
    cdsProdutoItemFTCST_PIS: TIntegerField;
    cdsProdutoItemFTCST_COFINS: TIntegerField;
    cdsProdutoItemFTTIPO_ITEM: TSmallintField;
    cdsProdutoItemFTMVA: TIntegerField;
    cdsProdutoItemFTPAUTA_FISCAL: TIntegerField;
    cdsProdutoItemFTLEI_PIS_COFINS: TIntegerField;
    cdsProdutoItemFTPRODUTO_ORIGEM: TIntegerField;
    cdsProdutoItemFTCST_PIS_ENTRADA: TIntegerField;
    cdsProdutoItemFTCST_COFINS_ENTRADA: TIntegerField;
    cdsProdutoItemFTNATUREZA_RECEITA: TIntegerField;
    cdsProdutoItemFTUND_ATACADO: TStringField;
    cdsProdutoItemFTALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsProdutoItemFTALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsProdutoItemFTCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsProdutoItemFTCODIGO_ANP: TStringField;
    cdsProdutoItemFTCARGA_TRIBUTARIA_NAC: TBCDField;
    cdsProdutoItemFTCARGA_TRIBUTARIA_IMP: TBCDField;
    cdsProdutoItemFTDESCONTO_PERSONALIZADO: TSmallintField;
    cdsProdutoItemFTORIGEM_MERCADORIA: TSmallintField;
    cdsProdutoItemFTCEST: TStringField;
    cdsProdutoItemFTPRODUTO_1: TIntegerField;
    cdsProdutoItemFTFILIAL: TIntegerField;
    cdsProdutoItemFTCUSTOBRUTO: TBCDField;
    cdsProdutoItemFTCUSTOBRUTOANTERIOR: TBCDField;
    cdsProdutoItemFTCUSTOLIQUIDO: TBCDField;
    cdsProdutoItemFTCUSTOLIQUIDOANTERIOR: TBCDField;
    cdsProdutoItemFTMENORPRECO: TBCDField;
    cdsProdutoItemFTPRECOCALCULADO: TBCDField;
    cdsProdutoItemFTPRECOPROVISORIO: TBCDField;
    cdsProdutoItemFTPRECODEVENDA: TBCDField;
    cdsProdutoItemFTPRECODEVENDAANTERIOR: TBCDField;
    cdsProdutoItemFTCADASTRO: TDateField;
    cdsProdutoItemFTALTERACAO: TDateField;
    cdsProdutoItemFTREMARCACAO: TDateField;
    cdsProdutoItemFTLUCROICMSR: TBCDField;
    cdsProdutoItemFTIMPOSTOSFEDERAIS: TBCDField;
    cdsProdutoItemFTCUSTOOPERACIONAL: TBCDField;
    cdsProdutoItemFTCOMISSAOVENDA: TBCDField;
    cdsProdutoItemFTLUCROLIQUIDO: TBCDField;
    cdsProdutoItemFTDEPOSITO: TBCDField;
    cdsProdutoItemFTDEPOSITO1: TBCDField;
    cdsProdutoItemFTLOJA: TBCDField;
    cdsProdutoItemFTLOJA1: TBCDField;
    cdsProdutoItemFTSALDOANTERIOR: TBCDField;
    cdsProdutoItemFTSALDOMINIMO: TBCDField;
    cdsProdutoItemFTSALDOMAXIMO: TBCDField;
    cdsProdutoItemFTSETORDEBALANCA: TIntegerField;
    cdsProdutoItemFTPRODUTOATIVO: TSmallintField;
    cdsProdutoItemFTPROMOCAO: TSmallintField;
    cdsProdutoItemFTTECLAASSOCIADA: TIntegerField;
    cdsProdutoItemFTVALIDADE: TIntegerField;
    cdsProdutoItemFTTECLADO: TSmallintField;
    cdsProdutoItemFTREDUCAOBASEDECALCULO: TBCDField;
    cdsProdutoItemFTDESCONTOPROGRAMADO: TBCDField;
    cdsProdutoItemFTDESCRICAOCUPOMFISCAL: TStringField;
    cdsProdutoItemFTDESCRICAOGONDOLA1: TStringField;
    cdsProdutoItemFTDESCRICAOGONDOLA2: TStringField;
    cdsProdutoItemFTDESCRICAOBALANCA: TStringField;
    cdsProdutoItemFTDESCRICAOTIRATEIMA: TStringField;
    cdsProdutoItemFTENVIARPARABALANCA: TSmallintField;
    cdsProdutoItemFTDESCONTONACOMPRA: TBCDField;
    cdsProdutoItemFTCREDITODEICMS: TBCDField;
    cdsProdutoItemFTIPI: TBCDField;
    cdsProdutoItemFTOUTROSCUSTOS: TBCDField;
    cdsProdutoItemFTFRETE: TBCDField;
    cdsProdutoItemFTICMSAPAGAR: TBCDField;
    cdsProdutoItemFTDESCONTONAVENDA: TBCDField;
    cdsProdutoItemFTVALORDODESCONTONACOMPRA: TBCDField;
    cdsProdutoItemFTVALORDOCREDITODEICMSR: TBCDField;
    cdsProdutoItemFTVALORDOIPI: TBCDField;
    cdsProdutoItemFTVALORDEOUTROSCUSTOS: TBCDField;
    cdsProdutoItemFTVALORDOFRETE: TBCDField;
    cdsProdutoItemFTVALORDOICMSR: TBCDField;
    cdsProdutoItemFTPRECOPROMOCAO: TBCDField;
    cdsProdutoItemFTDESCONTOTABELA1: TCurrencyField;
    cdsProdutoItemFTDESCONTOTABELA2: TCurrencyField;
    cdsProdutoItemFTDESCONTOTABELA3: TCurrencyField;
    cdsProdutoItemFTVALORUNITARIO: TBCDField;
    cdsProdutoItemFTSUBSTITUICAOTRIBUTARIA: TCurrencyField;
    cdsProdutoItemFTULTIMA_ENTRADA: TDateField;
    cdsProdutoItemFTSALDO_RESERVADO: TBCDField;
    cdsProdutoItemFTULTIMA_NF_ENTRADA: TStringField;
    cdsProdutoItemFTCUSTO_MEDIO: TBCDField;
    cdsProdutoItemFTCUSTO_MEDIO_ANTERIOR: TBCDField;
    cdsProdutoItemFTDATA_CUSTO_MEDIO: TDateField;
    cdsProdutoItemFTDATA_CUSTO_MEDIO_ANTERIOR: TDateField;
    cdsProdutoItemFTPRECO_ATACADO: TBCDField;
    cdsProdutoItemFTDESCRICAO_ATACADO: TStringField;
    cdsProdutoItemFTPERCENTUAL_ISS: TBCDField;
    cdsProdutoItemFTPERCENTUAL_IOF: TBCDField;
    cdsProdutoItemFTPERCENTUAL_CIDE: TBCDField;
    cdsProdutoItemFTSALDO_ALMOXARIFADO: TBCDField;
    cdsItemProducaoDESCRICAO_PRODUTO: TStringField;
    cdsItemProducaoCUSTO_LIQUIDO: TCurrencyField;
    cdsItemProducaoPRECO_VENDA: TCurrencyField;
    cdsLicGen: TClientDataSet;
    cdsLicGenCNPJ: TStringField;
    cdsLicGenRAZAO_SOCIAL: TStringField;
    cdsLicGenTIPO_LICENCA: TSmallintField;
    cdsLicGenMODULOS_LICENCA: TStringField;
    cdsLicGenDATA_LICENCA: TSQLTimeStampField;
    cdsLicGenVALIDADE_LICENCA: TDateField;
    cdsLicGenVALOR_LICENCA: TBCDField;
    cdsLicGenEMAIL: TStringField;
    cdsLicGenDATA_ENVIO_EMAIL: TDateField;
    cdsItemCaixaLojaHORA: TTimeField;
    cdsConfiguracoesMENSAGEM_FINANCEIRA: TMemoField;
    cdsItemCaixaLojaFUNCIONARIO_RETIRANTE: TStringField;
    cdsItemCaixaLojaFUNCIONARIO_AUTORIZADOR: TStringField;
    cdsConfiguracoesVALIDADE_ORCAMENTO: TSmallintField;
    dspCliente_Entrega: TDataSetProvider;
    cdsCliente_Entrega: TClientDataSet;
    cdsCliente_EntregaNOME_CLIENTE: TStringField;
    cdsCliente_EntregaENDERECO: TStringField;
    cdsCliente_EntregaNUMERO: TStringField;
    cdsCliente_EntregaCEP: TStringField;
    cdsCliente_EntregaBAIRRO: TStringField;
    cdsCliente_EntregaCIDADE: TStringField;
    cdsCliente_EntregaESTADO: TStringField;
    cdsCliente_EntregaCOMPLEMENTO: TStringField;
    cdsCliente_EntregaTELEFONE: TStringField;
    cdsEndEntregaPedZeusNOME_CLIENTE: TStringField;
    cdsConfiguracoesMENSAGEM_ENTREGA: TStringField;
    cdsNcmNbsTABELA_CEST: TStringField;
    dspNFSaida: TDataSetProvider;
    cdsNFSaida: TClientDataSet;
    cdsNFSaidaNFSAIDA: TIntegerField;
    cdsNFSaidaDESTINATARIO: TIntegerField;
    cdsNFSaidaEMISSAO: TDateField;
    cdsNFSaidaSAIDA: TDateField;
    cdsNFSaidaHORASAIDA: TTimeField;
    cdsNFSaidaBASECALCULOICMS: TBCDField;
    cdsNFSaidaVALORICMS: TBCDField;
    cdsNFSaidaBASESUBSTITUICAO: TBCDField;
    cdsNFSaidaVALORSUBSTITUICAO: TBCDField;
    cdsNFSaidaVALORDOSPRODUTOS: TBCDField;
    cdsNFSaidaVALORDOFRETE: TBCDField;
    cdsNFSaidaVALORDOSEGURO: TBCDField;
    cdsNFSaidaOUTRASDESPESAS: TBCDField;
    cdsNFSaidaVALORDOIPI: TBCDField;
    cdsNFSaidaVALORDANOTA: TBCDField;
    cdsNFSaidaTRANSPORTADOR: TIntegerField;
    cdsNFSaidaQUANTIDADEVOLUME: TBCDField;
    cdsNFSaidaESPECIEVOLUME: TStringField;
    cdsNFSaidaMARCAVOLUME: TStringField;
    cdsNFSaidaNUMEROVOLUME: TIntegerField;
    cdsNFSaidaPESOBRUTO: TBCDField;
    cdsNFSaidaPESOLIQUIDO: TBCDField;
    cdsNFSaidaOBSERVACAO: TMemoField;
    cdsNFSaidaPLACAVEICULO: TStringField;
    cdsNFSaidaUFVEICULO: TStringField;
    cdsNFSaidaSTATUS: TSmallintField;
    cdsNFSaidaMODELO: TStringField;
    cdsNFSaidaTIPOCOBRANCA: TSmallintField;
    cdsNFSaidaDESTINATARIO_: TStringField;
    cdsNFSaidaDESCONTO_ST: TBCDField;
    cdsNFSaidaTIPO_CONTABIL: TSmallintField;
    cdsNFSaidaENTRADA_SAIDA: TSmallintField;
    cdsNFSaidaBASE_ISSQN_R: TBCDField;
    cdsNFSaidaVALOR_ISSQN_R: TBCDField;
    cdsNFSaidaPERCENTUAL_PIS: TCurrencyField;
    cdsNFSaidaVALOR_PIS: TBCDField;
    cdsNFSaidaPERCENTUAL_COFINS: TCurrencyField;
    cdsNFSaidaVALOR_COFINS: TBCDField;
    cdsNFSaidaDANFE_CANCELADA: TSmallintField;
    cdsNFSaidaDANFE_INUTILIZADA: TSmallintField;
    cdsNFSaidaDANFE_CONTINGENCIA: TSmallintField;
    cdsNFSaidaNUMERO_DANFE: TStringField;
    cdsNFSaidaPROTOCOLO_DANFE: TStringField;
    cdsNFSaidaLOCAL_EMBARQUE: TStringField;
    cdsNFSaidaSERIE: TStringField;
    cdsNFSaidaVALOR_TOTAL_IMPOSTOS: TBCDField;
    cdsNFSaidaFINALIDADE_NF: TSmallintField;
    cdsNFSaidaPROT_NF_REFERENCIA: TStringField;
    cdsNFSaidaINFO_FISCO: TMemoField;
    cdsNFSaidaCANCELAMENTO_ESTEMPORANEO: TSmallintField;
    cdsNFSaidaCARGA_NAC_FEDERAL: TBCDField;
    cdsNFSaidaCARGA_IMP_FEDERAL: TBCDField;
    cdsNFSaidaCARGA_ESTADUAL: TBCDField;
    cdsNFSaidaCARGA_MUNICIPAL: TBCDField;
    cdsNFSaidaVALOR_CARGA_NAC_FEDERAL: TBCDField;
    cdsNFSaidaVALOR_CARGA_IMP_FEDERAL: TBCDField;
    cdsNFSaidaVALOR_CARGA_ESTADUAL: TBCDField;
    cdsNFSaidaVALOR_CARGA_MUNICIPAL: TBCDField;
    cdsNFSaidaDESTINO_OPERACAO: TSmallintField;
    cdsNFSaidaLOCAL_RETIRADA: TSmallintField;
    cdsNFSaidaLOCAL_ENTREGA: TSmallintField;
    cdsNFSaidaTOTAL_ICMS_DESONERADO: TBCDField;
    cdsNFSaidaTRANSPORTADOR_ISENTO_ICMS: TSmallintField;
    dspItemNFSaida: TDataSetProvider;
    cdsItemNFSaida: TClientDataSet;
    cdsItemNFSaidaITEMNFSAIDA: TIntegerField;
    cdsItemNFSaidaNFSAIDA: TIntegerField;
    cdsItemNFSaidaEAN: TStringField;
    cdsItemNFSaidaPRODUTO: TIntegerField;
    cdsItemNFSaidaCST: TSmallintField;
    cdsItemNFSaidaDESCONTO: TCurrencyField;
    cdsItemNFSaidaICMS: TCurrencyField;
    cdsItemNFSaidaCFOP: TStringField;
    cdsItemNFSaidaVALORUNITARIOREAL: TBCDField;
    cdsItemNFSaidaIPI: TCurrencyField;
    cdsItemNFSaidaCF_IPI: TStringField;
    cdsItemNFSaidaBASE_ICMS: TBCDField;
    cdsItemNFSaidaBASE_SUBSTITUICAO: TBCDField;
    cdsItemNFSaidaVALOR_DESCONTO: TBCDField;
    cdsItemNFSaidaVALOR_ICMS: TBCDField;
    cdsItemNFSaidaVALOR_IPI: TBCDField;
    cdsItemNFSaidaVALOR_SUBSTITUICAO: TBCDField;
    cdsItemNFSaidaSUB_TOTAL: TBCDField;
    cdsItemNFSaidaPERCENTUAL_REDUCAO: TCurrencyField;
    cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS: TBCDField;
    cdsItemNFSaidaDESCONTO_RATEADO: TBCDField;
    cdsItemNFSaidaMODELO: TStringField;
    cdsItemNFSaidaCST_IPI: TStringField;
    cdsItemNFSaidaCOD_ENQUADRAMENTO: TStringField;
    cdsItemNFSaidaBASE_IPI: TBCDField;
    cdsItemNFSaidaALIQUOTA_IPI: TCurrencyField;
    cdsItemNFSaidaBASE_PIS: TBCDField;
    cdsItemNFSaidaP_ALIQUOTA_PIS: TBCDField;
    cdsItemNFSaidaQUANTIDADE_BC_PIS: TBCDField;
    cdsItemNFSaidaV_ALIQUOTA_PIS: TBCDField;
    cdsItemNFSaidaVALOR_PIS: TBCDField;
    cdsItemNFSaidaVALOR_BC_COFINS: TBCDField;
    cdsItemNFSaidaP_ALIQUOTA_COFINS: TBCDField;
    cdsItemNFSaidaQUANTIDADE_BC_COFINS: TBCDField;
    cdsItemNFSaidaV_ALIQUOTA_COFINS: TBCDField;
    cdsItemNFSaidaVALOR_COFINS: TBCDField;
    cdsItemNFSaidaCOD_CONTA_ANALITICA: TStringField;
    cdsItemNFSaidaPERCENTUAL_ISS: TBCDField;
    cdsItemNFSaidaVALOR_ISS: TBCDField;
    cdsItemNFSaidaPERCENTUAL_IOF: TBCDField;
    cdsItemNFSaidaVALOR_IOF: TBCDField;
    cdsItemNFSaidaPERCENTUAL_CIDE: TBCDField;
    cdsItemNFSaidaVALOR_CIDE: TBCDField;
    cdsItemNFSaidaTOTAL_IMPOSTOS: TBCDField;
    cdsItemNFSaidaCARGA_TRIBUTARIA: TBCDField;
    cdsItemNFSaidaVALOR_FRETE: TBCDField;
    cdsItemNFSaidaCARGA_NAC_FEDERAL: TBCDField;
    cdsItemNFSaidaCARGA_IMP_FEDERAL: TBCDField;
    cdsItemNFSaidaCARGA_ESTADUAL: TBCDField;
    cdsItemNFSaidaCARGA_MUNICIPAL: TBCDField;
    cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL: TBCDField;
    cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL: TBCDField;
    cdsItemNFSaidaVALOR_CARGA_ESTADUAL: TBCDField;
    cdsItemNFSaidaVALOR_CARGA_MUNICIPAL: TBCDField;
    cdsItemNFSaidaASSINATURA_IBPT: TStringField;
    cdsItemNFSaidaORIGEM_MERCADORIA: TSmallintField;
    cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA: TStringField;
    cdsItemNFSaidaMERCADORIA_CONSUMO: TSmallintField;
    cdsItemNFSaidaOUTROS_VALORES: TBCDField;
    cdsItemNFSaidaCEST: TStringField;
    cdsItemNFSaidaORIGEM_CST_ICMS_PART: TSmallintField;
    cdsItemNFSaidaCST_ICMS_PART: TSmallintField;
    cdsItemNFSaidaMOD_BASE_CALC_ICMS_PART: TSmallintField;
    cdsItemNFSaidaBASE_CALC_ICMS_PART: TBCDField;
    cdsItemNFSaidaPERCENTUAL_ICMS_PART: TBCDField;
    cdsItemNFSaidaVALOR_ICMS_PART: TBCDField;
    cdsItemNFSaidaMOD_BASE_CALC_ICMS_ST_PART: TSmallintField;
    cdsItemNFSaidaBASE_CALC_ICMS_STR_PART: TBCDField;
    cdsItemNFSaidaPERCENTUAL_ICMS_ST_PART: TBCDField;
    cdsItemNFSaidaVALOR_ICMS_ST_PART: TBCDField;
    cdsItemNFSaidaBASE_CALC_OPERACAO_PART: TBCDField;
    cdsItemNFSaidaUF_ST_PART: TStringField;
    cdsItemNFSaidaEX_TIPI: TSmallintField;
    cdsItemNFSaidaUNIDADE_COMERCIAL: TStringField;
    cdsItemNFSaidaUNIDADE_TRIBUTAVEL: TStringField;
    cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL: TBCDField;
    cdsItemNFSaidaVALOR_SEGURO: TBCDField;
    cdsItemNFSaidaPEDIDO_DE_COMPRA: TStringField;
    cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA: TSmallintField;
    cdsItemNFSaidaNUMERO_FCI: TStringField;
    cdsItemNFSaidaALIQUOTA_CRED_SIMPLES: TBCDField;
    cdsItemNFSaidaVALOR_CRED_ICMS_SIMPLES: TBCDField;
    cdsItemNFSaidaCLASSE_EMQUADRAMENTO_IPI: TStringField;
    dspCFOP_NFSaida: TDataSetProvider;
    cdsCFOP_NFSaida: TClientDataSet;
    cdsCFOP_NFSaidaCFOP_NFSAIDA: TIntegerField;
    cdsCFOP_NFSaidaNFSAIDA: TIntegerField;
    cdsCFOP_NFSaidaCFOP: TStringField;
    cdsCFOP_NFSaidaMODELO: TStringField;
    dspParcelasNFS: TDataSetProvider;
    cdsParcelasNFS: TClientDataSet;
    cdsParcelasNFSPARCELASNFSAIDA: TIntegerField;
    cdsParcelasNFSNFSAIDA: TIntegerField;
    cdsParcelasNFSDOCUMENTO: TStringField;
    cdsParcelasNFSVENCIMENTO: TDateField;
    cdsParcelasNFSVALOR: TBCDField;
    cdsParcelasNFSMODELO: TStringField;
    dspTransportadoraNFS: TDataSetProvider;
    cdsTransportadoraNFS: TClientDataSet;
    cdsTransportadoraNFSNF_SAIDA: TIntegerField;
    cdsTransportadoraNFSSERIE: TStringField;
    cdsTransportadoraNFSMODELO: TStringField;
    cdsTransportadoraNFSCNPJ: TStringField;
    cdsTransportadoraNFSISENTO_ICMS: TSmallintField;
    cdsTransportadoraNFSUF: TStringField;
    cdsTransportadoraNFSPLACA: TStringField;
    cdsTransportadoraNFSRNTC: TStringField;
    cdsTransportadoraNFSBC_CALCULO_ICMS_RETENCAO: TBCDField;
    cdsTransportadoraNFSALIQUOTA_ICMS_RETENCAO: TBCDField;
    cdsTransportadoraNFSVALOR_DO_SERVICO: TBCDField;
    cdsTransportadoraNFSUF_RETENCAO: TStringField;
    cdsTransportadoraNFSMUNICIPIO_RETENCAO: TIntegerField;
    cdsTransportadoraNFSCFOP_RETENCAO: TStringField;
    cdsTransportadoraNFSVALOR_ICMS_RETENCAO: TBCDField;
    dspExportacaoNFS: TDataSetProvider;
    cdsExpoirtacaoNFS: TClientDataSet;
    cdsExpoirtacaoNFSNF_SAIDA: TIntegerField;
    cdsExpoirtacaoNFSMODELO_NF_SAIDA: TStringField;
    cdsExpoirtacaoNFSSERIE_NF_SAIDA: TStringField;
    cdsExpoirtacaoNFSUF_EMBARQUE: TStringField;
    cdsExpoirtacaoNFSLOCAL_EMBARQUE: TStringField;
    cdsExpoirtacaoNFSLOCAL_DESPACHO: TStringField;
    dspDocumentoRef_NFS: TDataSetProvider;
    cdsDocumentoRef_NFS: TClientDataSet;
    cdsNFSaidaS_STATUS: TStringField;
    cdsNFSaidaRS_DESTINATARIO: TStringField;
    cdsCFOP_NFSaidaDESCRICAO_CFOP: TStringField;
    cdsNFSaidaFILIAL: TIntegerField;
    cdsNFSaidaHORA_EMISSAO: TTimeField;
    cdsNFSaidaTIPO_ATENDIMENTO: TSmallintField;
    cdsItemNFSaidaEAN_TRIBUTAVEL: TStringField;
    cdsItemNFSaidaPERC_BC_OPER_PROPRIA: TBCDField;
    cdsItemNFSaidaBC_ICMS_OPERACAO_DIFERIMENTO: TBCDField;
    cdsItemNFSaidaPERC_ICMS_DIFERIMENTO: TBCDField;
    cdsItemNFSaidaVALOR_ICMS_DIFERIDO: TBCDField;
    cdsItemNFSaidaPERC_REDUCAO_BC_ICMS_ST: TBCDField;
    cdsItemNFSaidaMVA: TBCDField;
    cdsItemNFSaidaALIQUOTA_ICMS_ST: TBCDField;
    cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL: TBCDField;
    cdsItemNFSaidaPERC_DIFERENCIAL_ALIQUOTA: TBCDField;
    cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO: TBCDField;
    cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM: TBCDField;
    cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO: TBCDField;
    cdsItemNFSaidaPERC_FCP: TBCDField;
    cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM: TBCDField;
    cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO: TBCDField;
    cdsItemNFSaidaVALOR_FCP_DESTINO: TBCDField;
    cdsItemNFSaidaDESCRICAO_PRODUTO: TStringField;
    cdsItemNFSaidaUNIDADE: TStringField;
    cdsNFSaidaIE_DESTINATARIO: TStringField;
    cdsNFSaidaENDERECO_DEST: TStringField;
    cdsNFSaidaNUMERO_DEST: TIntegerField;
    cdsNFSaidaCEP_DEST: TStringField;
    cdsNFSaidaBAIRRO_DEST: TStringField;
    cdsNFSaidaUF_DEST: TStringField;
    cdsNFSaidaCOMPLEMENTO_DEST: TStringField;
    cdsClientesNOME_CIDADE_ENTREGA: TStringField;
    cdsNFSaidaCIDADE_DEST: TStringField;
    cdsNFSaidaI_SUFRAMA_DEST: TStringField;
    cdsNFSaidaEMAIL_DEST: TStringField;
    cdsConfiguracoesVERSAO_XML_NFE: TStringField;
    cdsTransportadoraNFSTRANSPORTADOR: TIntegerField;
    cdsTransportadoraNFSFILIAL: TIntegerField;
    cdsTransportadoraNFSINSCRICAO_EST: TStringField;
    cdsTransportadoraNFSRSOCIAL: TStringField;
    cdsTransportadoraNFSENDERECO: TStringField;
    cdsTransportadoraNFSNUMERO: TIntegerField;
    cdsTransportadoraNFSCEP: TStringField;
    cdsTransportadoraNFSBAIRRO: TStringField;
    cdsFornecedorNOME_CIDADE: TStringField;
    cdsTransportadoraNFSNOME_CIDADE_TRANSP: TStringField;
    cdsTransportadoraNFSESTADO: TStringField;
    cdsNFSaidaUF_EMBARQUE: TStringField;
    cdsNFSaidaLOCAL_DESPACHO: TStringField;
    cdsItemNFSaidaISENTAS_NTRIB_ICMS_ST: TBCDField;
    cdsItemNFSaidaPERCENTUAL_IPI_DEVOLVIDO: TBCDField;
    cdsItemNFSaidaVALOR_IPI_DEVOLVIDO: TBCDField;
    dspEndRetiradaNFS: TDataSetProvider;
    cdsEndRetiradaNFS: TClientDataSet;
    dspEndEntregaNFS: TDataSetProvider;
    cdsEndEntregaNFS: TClientDataSet;
    cdsEndRetiradaNFSNFSAIDA: TIntegerField;
    cdsEndRetiradaNFSSERIE: TStringField;
    cdsEndRetiradaNFSMODELO: TStringField;
    cdsEndRetiradaNFSFILIAL: TIntegerField;
    cdsEndRetiradaNFSCNPJ: TStringField;
    cdsEndRetiradaNFSENDERECO: TStringField;
    cdsEndRetiradaNFSNUMERO: TStringField;
    cdsEndRetiradaNFSBAIRRO: TStringField;
    cdsEndRetiradaNFSESTADO: TStringField;
    cdsEndRetiradaNFSCIDADE: TIntegerField;
    cdsEndEntregaNFSNFSAIDA: TIntegerField;
    cdsEndEntregaNFSSERIE: TStringField;
    cdsEndEntregaNFSMODELO: TStringField;
    cdsEndEntregaNFSFILIAL: TIntegerField;
    cdsEndEntregaNFSCNPJ: TStringField;
    cdsEndEntregaNFSENDERECO: TStringField;
    cdsEndEntregaNFSNUMERO: TStringField;
    cdsEndEntregaNFSCOMPLEMENTO: TStringField;
    cdsEndEntregaNFSBAIRRO: TStringField;
    cdsEndEntregaNFSESTADO: TStringField;
    cdsEndEntregaNFSCIDADE: TIntegerField;
    dspOrigemMercadoria: TDataSetProvider;
    cdsOrigemMercadoria: TClientDataSet;
    cdsOrigemMercadoriaCODIGO: TSmallintField;
    cdsOrigemMercadoriaDESCRICAO: TStringField;
    cdsCST_PIS: TClientDataSet;
    dspCST_PIS: TDataSetProvider;
    cdsCST_PISCST_PIS_PASEP: TIntegerField;
    cdsCST_PISDESCRICAO: TStringField;
    cdsCST_PISENTRADA_SAIDA: TSmallintField;
    cdsCST_PISGERA_CREDITO: TSmallintField;
    cdsCST_COFINS: TClientDataSet;
    dspCST_COFINS: TDataSetProvider;
    cdsCST_COFINSCST_COFINS: TIntegerField;
    cdsCST_COFINSDESCRICAO: TStringField;
    cdsCST_COFINSENTRADA_SAIDA: TSmallintField;
    cdsCST_COFINSGERA_CREDITO: TSmallintField;
    cdsItemNFSaidaCST_PIS: TIntegerField;
    cdsItemNFSaidaCST_COFINS: TIntegerField;
    cdsNFSaidaPAIS_DESTINATARIO: TIntegerField;
    dspSelItemNFS_LS: TDataSetProvider;
    cdsSelItemNFS_LS: TClientDataSet;
    cdsSelItemNFS_LSOP_CFOP: TStringField;
    cdsSelItemNFS_LSOP_ALIQUOTA: TCurrencyField;
    cdsSelItemNFS_LSOP_BASE_ICMS: TBCDField;
    cdsSelItemNFS_LSOP_VALOR_ICMS: TBCDField;
    cdsSelItemNFS_LSOP_SUB_TOTAL: TBCDField;
    cdsSelItemNFS_LSOP_ISENTAS_NT: TBCDField;
    cdsSelItemNFS_LSOP_DESCONTO_RATEADO: TBCDField;
    cdsSelItemNFS_LSOP_CST: TSmallintField;
    cdsSelItemNFS_LSOP_VALOR_IPI: TBCDField;
    cdsSelItemNFS_LSOP_VALOR_SUBSTITUICAO: TBCDField;
    cdsNFSaidaORDEM_SERVICO: TIntegerField;
    cdsConfig_iniUF_WEBSERVICE: TStringField;
    cdsConfig_iniAMBIENTE_NFE: TIntegerField;
    cdsConfig_iniPATH_NFE: TStringField;
    cdsConfig_iniPATH_NFE_INUTILIZADA: TStringField;
    cdsConfig_iniMODELO_DF_NFE: TIntegerField;
    cdsConfig_iniVERSAO_DF_NFE: TIntegerField;
    cdsConfig_iniPATH_SCHEMAS_NFE: TStringField;
    cdsCFOP_NFSaidaFILIAL: TIntegerField;
    cdsClientesGARANTIDOR_OS: TSmallintField;
    cdsClientesCONTRIBUINTE_ICMS: TSmallintField;
    cdsNFSaidaDEST_CONTRIBUINTE_ICMS: TSmallintField;
    cdsMVA: TClientDataSet;
    dspMVA: TDataSetProvider;
    cdsMVAMVA: TIntegerField;
    cdsMVAESTADO: TStringField;
    cdsMVAPRODUTO: TIntegerField;
    cdsMVAMARGEM_MVA: TCurrencyField;
    cdsMVAICMS_INTERESTADUAL: TCurrencyField;
    cdsMVAICMS_INTERNO: TCurrencyField;
    dspPesqClientes: TDataSetProvider;
    cdsPesqClientes: TClientDataSet;
    cdsPesqClientesCLIENTE: TIntegerField;
    cdsPesqClientesRAZAOSOCIAL: TStringField;
    cdsPesqClientesFANTASIA: TStringField;
    cdsPesqClientesCNPJ: TStringField;
    cdsPesqClientesINSCRICAO: TStringField;
    cdsPesqClientesCADASTRO: TDateField;
    cdsPesqClientesENDERECO: TStringField;
    cdsPesqClientesNUMERO: TIntegerField;
    cdsPesqClientesCEP: TStringField;
    cdsPesqClientesBAIRRO: TStringField;
    cdsPesqClientesESTADO: TStringField;
    cdsPesqClientesTIPO: TSmallintField;
    cdsPesqClientesCOMPLEMENTO: TStringField;
    cdsPesqClientesCONTATO: TStringField;
    cdsPesqClientesHTTP: TStringField;
    cdsPesqClientesEMAIL: TStringField;
    cdsPesqClientesOBSERVACAO: TMemoField;
    cdsPesqClientesDDD: TStringField;
    cdsPesqClientesTELEFONE1: TStringField;
    cdsPesqClientesTELEFONE2: TStringField;
    cdsPesqClientesCELULAR: TStringField;
    cdsPesqClientesFAX: TStringField;
    cdsPesqClientesNASCIMENTO: TDateField;
    cdsPesqClientesRENDA: TBCDField;
    cdsPesqClientesLIMITEDECREDITO: TBCDField;
    cdsPesqClientesSALDODEVEDOR: TBCDField;
    cdsPesqClientesSTATUS: TSmallintField;
    cdsPesqClientesBARRAS: TStringField;
    cdsPesqClientesENDERECOENTREGA: TStringField;
    cdsPesqClientesNUMEROENTREGA: TIntegerField;
    cdsPesqClientesCEPENTREGA: TStringField;
    cdsPesqClientesBAIRROENTREGA: TStringField;
    cdsPesqClientesESTADOENTREGA: TStringField;
    cdsPesqClientesENDERECOCOBRANCA: TStringField;
    cdsPesqClientesNUMEROCOBRANCA: TIntegerField;
    cdsPesqClientesCEPCOBRANCA: TStringField;
    cdsPesqClientesBAIRROCOBRANCA: TStringField;
    cdsPesqClientesESTADOCOBRANCA: TStringField;
    cdsPesqClientesPONTODEREFERENCIA: TStringField;
    cdsPesqClientesVALIDADEDOCREDITO: TDateField;
    cdsPesqClientesTIPODECREDITO: TSmallintField;
    cdsPesqClientesDATACONSULTASPC: TDateField;
    cdsPesqClientesFUNCIONARIO: TIntegerField;
    cdsPesqClientesULTIPOPEDIDO: TIntegerField;
    cdsPesqClientesDATAULTIMOPEDIDO: TDateField;
    cdsPesqClientesVALORULTIMOPEDIDO: TBCDField;
    cdsPesqClientesULTIMANF: TStringField;
    cdsPesqClientesDATAULTIMANF: TDateField;
    cdsPesqClientesVALORULTIMANF: TBCDField;
    cdsPesqClientesULTIMOCHQUEDEVOLVIDO: TStringField;
    cdsPesqClientesDATAULTIMOCHEQUEDEVOLVIDO: TDateField;
    cdsPesqClientesVALORULTIMOCHEQUEDEVOLVIDO: TBCDField;
    cdsPesqClientesMOTIVODEVOLUCAO: TStringField;
    cdsPesqClientesCIDADE: TIntegerField;
    cdsPesqClientesCIDADEENTREGA: TIntegerField;
    cdsPesqClientesCIDADECOBRANCA: TIntegerField;
    cdsPesqClientesATIVO: TSmallintField;
    cdsPesqClientesPAI: TStringField;
    cdsPesqClientesMAE: TStringField;
    cdsPesqClientesEMPRESA: TStringField;
    cdsPesqClientesTELEFONEEMPRESA1: TStringField;
    cdsPesqClientesTELEFONEEMPRESA2: TStringField;
    cdsPesqClientesRAMAL: TStringField;
    cdsPesqClientesCONTATOEMPRESA: TStringField;
    cdsPesqClientesREFERENCIAPESSOAL1: TStringField;
    cdsPesqClientesREFERENCIAPESSOAL2: TStringField;
    cdsPesqClientesREFERENCIAPESSOAL3: TStringField;
    cdsPesqClientesTELEFONEREFERENCIA1: TStringField;
    cdsPesqClientesTELEFONEREFERENCIA2: TStringField;
    cdsPesqClientesTELEFONEREFERENCIA3: TStringField;
    cdsPesqClientesSEXO: TSmallintField;
    cdsPesqClientesESTADOCIVIL: TSmallintField;
    cdsPesqClientesCONJUGE: TStringField;
    cdsPesqClientesPOSSUIDEPENDENTES: TSmallintField;
    cdsPesqClientesQUANTIDADEDEPENDENTES: TSmallintField;
    cdsPesqClientesDEPENDENTES: TMemoField;
    cdsPesqClientesTEMPODEEMPRESA: TBCDField;
    cdsPesqClientesTIPOTEMPOEMPRESA: TSmallintField;
    cdsPesqClientesREFERENCIACOMERCIAL1: TStringField;
    cdsPesqClientesREFERENCIACOMERCIAL2: TStringField;
    cdsPesqClientesREFERENCIACOMERCIAL3: TStringField;
    cdsPesqClientesTELEFONEREFCOMERCIAL1: TStringField;
    cdsPesqClientesTELEFONEREFCOMERCIAL2: TStringField;
    cdsPesqClientesTELEFONEREFCOMERCIAL3: TStringField;
    cdsPesqClientesCONTATOREFCOMERCIAL1: TStringField;
    cdsPesqClientesCONTATOREFCOMERCIAL2: TStringField;
    cdsPesqClientesCONTATOREFCOMERCIAL3: TStringField;
    cdsPesqClientesLIBERARVENDAACIMALIMITE: TSmallintField;
    cdsPesqClientesVENDEDOR: TIntegerField;
    cdsPesqClientesCLIENTE2: TIntegerField;
    cdsPesqClientesMODELO_TABELA_PRECOVENDA: TSmallintField;
    cdsPesqClientesSOCIO: TSmallintField;
    cdsPesqClientesCONTRIBUICAO: TBCDField;
    cdsPesqClientesNUMERO_CARTAO: TStringField;
    cdsPesqClientesEMISSAO_CARTAO: TDateField;
    cdsPesqClientesDATA_VALIDADE_CARTAO: TDateField;
    cdsPesqClientesDESCONTO_PERSONALIZADO: TBCDField;
    cdsPesqClientesFORMAPAGAMENTO: TIntegerField;
    cdsPesqClientesUSUARIO_NFE: TSmallintField;
    cdsPesqClientesPAIS: TIntegerField;
    cdsPesqClientesINSCRICAO_SUFRAMA: TStringField;
    cdsPesqClientesGARANTIDOR_OS: TSmallintField;
    cdsPesqClientesCONTRIBUINTE_ICMS: TSmallintField;
    dspPesqCFOP: TDataSetProvider;
    cdsPesqCFOP: TClientDataSet;
    cdsPesqCFOPCFOP: TStringField;
    cdsPesqCFOPDESCRICAO: TStringField;
    cdsPesqCFOPOPERACAO: TSmallintField;
    cdsPesqCFOPCFOP_ENTRADA_ESTADUAL: TStringField;
    cdsPesqCFOPCFOP_ENTRADA_INTERESTADUAL: TStringField;
    cdsPesqCFOPCFOP_ENTRADA_ESTRANGEIRA: TStringField;
    cdsPesqCFOPATUALIZAR_CUSTOS: TSmallintField;
    cdsPesqCFOPNATUREZA_CFOP: TSmallintField;
    cdsPesqCFOPGERA_CREDITO_PIS_COFINS: TSmallintField;
    cdsPesqCFOPTABELA_4_3_7: TStringField;
    cdsPesqCFOPOBSERVACAO_NFS: TMemoField;
    cdsPesqCFOPDESCONTO_PERSONALIZADO: TBCDField;
    cdsPesqCFOPGERA_DEBITO_CREDITO_ICMS: TSmallintField;
    cdsPesqCFOPSUBSTITUICAO_TRIBUTARIA: TSmallintField;
    cdsPesqCFOPGERA_DEBITO_CREDITO_IPI: TSmallintField;
    cdsPesqCFOPCST_PIS_ENTRADA: TIntegerField;
    cdsPesqCFOPALIQUOTA_PIS_ENTRADA: TBCDField;
    cdsPesqCFOPCST_COFINS_ENTRADA: TIntegerField;
    cdsPesqCFOPALIQUOTA_COFINS_ENTRADA: TBCDField;
    cdsPesqCFOPCST_PIS_SAIDA: TIntegerField;
    cdsPesqCFOPALIQUOTA_PIS_SAIDA: TBCDField;
    cdsPesqCFOPCST_COFINS_SAIDA: TIntegerField;
    cdsPesqCFOPALIQUOTA_COFINS_SAIDA: TBCDField;
    cdsPesqCFOPNATUREZA_RECEITA_PIS_COFINS: TIntegerField;
    cdsPesqCFOPCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsParcelasNFSFILIAL: TIntegerField;
    dspConsisteCFOP_ITNFS: TDataSetProvider;
    cdsConsisteCFOP_ITNFS: TClientDataSet;
    cdsConsisteCFOP_ITNFSOP_QTD_CFOP_IT: TIntegerField;
    cdsConfiguracoesSENHA_USUARIO_SMTP: TStringField;
    dspParametros_NFE: TDataSetProvider;
    cdsParametros_NFE: TClientDataSet;
    cdsParametros_NFEPARAMETROS_NFE: TIntegerField;
    cdsParametros_NFEORIENTACAO_IMPRESSAO: TSmallintField;
    cdsParametros_NFEREPOSITORIO_XML: TStringField;
    cdsParametros_NFEREPOSITORIO_PDF: TStringField;
    cdsParametros_NFELOGO_MARCA: TStringField;
    cdsParametros_NFEATUALIZAR_XML: TSmallintField;
    cdsParametros_NFEEXIBIR_ERRO_SCHEMA: TSmallintField;
    cdsParametros_NFERETIRAR_ACENTOS_XML_ENVIADO: TSmallintField;
    cdsParametros_NFESALVAR_ARQUIVOS_ENVIO_RESPOSTA: TSmallintField;
    cdsParametros_NFEFORMATO_ALERTA: TStringField;
    cdsParametros_NFEPASTA_LOGS: TStringField;
    cdsParametros_NFEPASTA_SCHEMAS: TStringField;
    cdsParametros_NFESALVAR_ARQS_EM_PASTAS_SEPARADAS: TSmallintField;
    cdsParametros_NFECRIAR_PASTAS_MENSALMENTE: TSmallintField;
    cdsParametros_NFEADICIONAR_LITERAL_NOME_PASTAS: TSmallintField;
    cdsParametros_NFESALVAR_NFE_PELA_EMISSAO: TSmallintField;
    cdsParametros_NFESALVAR_ARQUIVOS_EVENTOS: TSmallintField;
    cdsParametros_NFESEPARAR_ARQ_POR_CNPJ_CERTIF: TSmallintField;
    cdsParametros_NFESEPARAR_ARQ_POR_MODELO_DOC: TSmallintField;
    cdsParametros_NFEPASTA_ARQS_NFE: TStringField;
    cdsParametros_NFEPASTA_ARQS_CANCELAMENTO: TStringField;
    cdsParametros_NFEPASTA_ARQS_CCE: TStringField;
    cdsParametros_NFEPASTA_ARQS_INUTILIZACAO: TStringField;
    cdsParametros_NFEPASTA_ARQS_DEPEC: TStringField;
    cdsParametros_NFEPASTA_ARQS_EVENTO: TStringField;
    cdsParametros_NFESALVAR_ENVELOP_SOAP: TSmallintField;
    cdsParametros_NFEAJUSTAR_MSG_AGUARDE: TSmallintField;
    cdsParametros_NFETEMPO_AGUARDAR_ENVIO: TSmallintField;
    cdsParametros_NFETENTATIVAS_ENVIO: TSmallintField;
    cdsParametros_NFEINTERVALO_TENTATIVAS: TSmallintField;
    cdsFilialNOMECIDADE: TStringField;
    cdsFilialNOMEESTADO: TStringField;
    cdsFilialCODIGO_MUNICIPIO: TIntegerField;
    cdsFilialCODIGO_ESTADO_IBGE: TIntegerField;
    cdsFornecedorNOME_ESTADO: TStringField;
    cdsDetalhesCupomRefNFS_TEMP: TClientDataSet;
    cdsDetalhesCupomRefNFS_TEMPNUMERO_CUPOM: TIntegerField;
    cdsDetalhesCupomRefNFS_TEMPNUMERO_ECF: TIntegerField;
    cdsDetalhesCupomRefNFS_TEMPCODIGO_PRODUTO: TIntegerField;
    cdsDetalhesCupomRefNFS_TEMPDESCRICAO: TStringField;
    cdsDetalhesCupomRefNFS_TEMPQUANTIDADE: TCurrencyField;
    cdsDetalhesCupomRefNFS_TEMPVALOR_UNITARIO: TCurrencyField;
    cdsDetalhesCupomRefNFS_TEMPSUBTOTAL: TCurrencyField;
    cdsDetalhesCupomRefNFS_TEMPDESCONTO: TCurrencyField;
    cdsDetalhesCupomRefNFS_TEMPEMISSAO: TDateField;
    cdsDetalhesCupomRefNFS_TEMPGTIN: TStringField;
    cdsInventarioTRIBUTACAO: TIntegerField;
    cdsInventarioCODIGO_AJUSTE_APURACAO: TStringField;
    cdsInventarioDESCRICAO_COMPLEMENTAR_AJUSTE: TStringField;
    cdsCCe: TClientDataSet;
    dspCCe: TDataSetProvider;
    cdsCCeCCE: TIntegerField;
    cdsCCeNOTA_FISCAL: TStringField;
    cdsCCeEMISSAO_NOTA: TDateField;
    cdsCCeDATA_CCE: TDateField;
    cdsCCeCHAVE_NFE: TStringField;
    cdsCCeLOTE: TStringField;
    cdsCCeORGAO: TStringField;
    cdsCCeTIPO_EVENTO: TStringField;
    cdsCCeVERSAO_EVENTO: TStringField;
    cdsCCePROTOCOLO: TStringField;
    cdsCCeCORRECAO: TMemoField;
    cdsDocumentoRef_NFSS_TIPO_DOCUMENTO: TStringField;
    cdsDocumentoRef_NFSNF_SAIDA: TIntegerField;
    cdsDocumentoRef_NFSMODELO_NF_SAIDA: TStringField;
    cdsDocumentoRef_NFSSERIE_NF_SAIDA: TStringField;
    cdsDocumentoRef_NFSCNPJ_NF_SAIDA: TStringField;
    cdsDocumentoRef_NFSDOCUMENTO_REF: TStringField;
    cdsDocumentoRef_NFSMODELO_DOC_REF: TStringField;
    cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF: TStringField;
    cdsDocumentoRef_NFSCHAVE_DOCUMENTO_REF: TStringField;
    cdsDocumentoRef_NFSSERIE_DOC_REF: TIntegerField;
    cdsDocumentoRef_NFSANO_MES_EMISSAO: TStringField;
    cdsDocumentoRef_NFSUF_DOCUMENTO_REF: TIntegerField;
    cdsDocumentoRef_NFSEMISSAO_DOCUMENTO_REF: TDateField;
    cdsDocumentoRef_NFSINDICADOR_EMITENTE: TSmallintField;
    cdsDocumentoRef_NFSINDICADOR_OPERACAO: TSmallintField;
    cdsDocumentoRef_NFSFILIAL: TIntegerField;
    cdsDocumentoRef_NFSTIPO_DOCUMENTO: TSmallintField;
    cdsDocumentoRef_NFSINSCRICAO_ESTADUAL_EMITENTE: TStringField;
    cdsDocumentoRef_NFSSIGLA_UF_EMITENTE: TStringField;
    dspCupomFiscalRefNFS: TDataSetProvider;
    cdsCupomFiscalRefNFS: TClientDataSet;
    cdsCupomFiscalRefNFSNF_SAIDA: TIntegerField;
    cdsCupomFiscalRefNFSMODELO_NF_SAIDA: TStringField;
    cdsCupomFiscalRefNFSSERIE_NF_SAIDA: TStringField;
    cdsCupomFiscalRefNFSCNPJ_NF_SAIDA: TStringField;
    cdsCupomFiscalRefNFSDOCUMENTO_REF: TStringField;
    cdsCupomFiscalRefNFSMODELO_DOC_REF: TStringField;
    cdsCupomFiscalRefNFSCNPJ_FORNECEDOR_REF: TStringField;
    cdsCupomFiscalRefNFSCHAVE_DOCUMENTO_REF: TStringField;
    cdsCupomFiscalRefNFSSERIE_DOC_REF: TIntegerField;
    cdsCupomFiscalRefNFSANO_MES_EMISSAO: TStringField;
    cdsCupomFiscalRefNFSUF_DOCUMENTO_REF: TIntegerField;
    cdsCupomFiscalRefNFSEMISSAO_DOCUMENTO_REF: TDateField;
    cdsCupomFiscalRefNFSINDICADOR_EMITENTE: TSmallintField;
    cdsCupomFiscalRefNFSINDICADOR_OPERACAO: TSmallintField;
    cdsCupomFiscalRefNFSFILIAL: TIntegerField;
    cdsCupomFiscalRefNFSTIPO_DOCUMENTO: TSmallintField;
    cdsCupomFiscalRefNFSINSCRICAO_ESTADUAL_EMITENTE: TStringField;
    cdsCupomFiscalRefNFSSIGLA_UF_EMITENTE: TStringField;
    cdsClientesNOMECIDADE: TStringField;
    cdsClientesNOMEESTADO: TStringField;
    cdsClientesCODIGO_MUNICIPIO: TIntegerField;
    cdsClientesCODIGO_ESTADO_IBGE: TIntegerField;
    cdsNFSaidaFORMAPAGAMENTO: TIntegerField;
    cdsNFSaidaIMPRESSO: TSmallintField;
    cdsNFSaidaCUPOMFISCAL: TIntegerField;
    cdsNFSaidaECF: TIntegerField;
    cdsNFSaidaCFOP: TStringField;
    cdsNFSaidaCOMISSAO: TCurrencyField;
    cdsNFSaidaPEDIDOEXTERNO: TStringField;
    cdsNFSaidaFUNCIONARIO: TIntegerField;
    cdsNFSaidaVALORDOSPRODUTOSREAL: TBCDField;
    cdsNFSaidaDESCONTOCALCULADO: TCurrencyField;
    cdsNFSaidaDESCONTOCALCULADOREAL: TCurrencyField;
    cdsNFSaidaPERCENTUAL: TCurrencyField;
    cdsNFSaidaVALORCUPOMFISCAL: TBCDField;
    cdsNFSaidaDATACUPOMFISCAL: TDateField;
    cdsNFSaidaCFOP_: TStringField;
    cdsNFSaidaCANCELADA: TSmallintField;
    cdsNFSaidaC_M_C: TStringField;
    cdsNFSaidaTOTAL_DOS_SERVICOS: TBCDField;
    cdsNFSaidaPERCENTUAL_CSLL: TCurrencyField;
    cdsNFSaidaVALOR_CSLL: TBCDField;
    cdsNFSaidaPERCENTUAL_IRRF: TCurrencyField;
    cdsNFSaidaVALOR_IRRF: TBCDField;
    cdsNFSaidaPERCENTUAL_INSS: TCurrencyField;
    cdsNFSaidaVALOR_INSS: TBCDField;
    cdsNFSaidaBASE_ISSQN: TBCDField;
    cdsNFSaidaVALOR_ISSQN: TBCDField;
    cdsNFSaidaRETER_PIS: TSmallintField;
    cdsNFSaidaRETER_COFINS: TSmallintField;
    cdsNFSaidaRETER_CSLL: TSmallintField;
    cdsNFSaidaRETER_INSS: TSmallintField;
    cdsNFSaidaRETER_IRRF: TSmallintField;
    cdsNFSaidaRETER_ISSQN: TSmallintField;
    cdsNFSaidaVALOR_IOF: TBCDField;
    cdsNFSaidaVALOR_CIDE: TBCDField;
    cdsNFSaidaVALOR_ISS: TBCDField;
    cdsNFSaidaVALOR_ICMS_12741: TBCDField;
    cdsNFSaidaCARGA_TRIBUTARIA: TBCDField;
    cdsNFSaidaUF_REFERENCIA_DEVOL: TStringField;
    cdsNFSaidaANO_MES_REFERENCIA_DEVOL: TStringField;
    cdsNFSaidaCNPJ_REFERENCIA_DEVOL: TStringField;
    cdsNFSaidaMODELO_REFERENCIA_DEVOL: TStringField;
    cdsNFSaidaSERIE_REFERENCIA_DEVOL: TStringField;
    cdsNFSaidaNUMERO_NF_REFERENCIA_DEVOL: TStringField;
    dspFCP_Estados: TDataSetProvider;
    cdsFCP_Estados: TClientDataSet;
    cdsFCP_EstadosSIGLA: TStringField;
    cdsFCP_EstadosNCM: TStringField;
    cdsFCP_EstadosFCP: TBCDField;
    cdsFCP_EstadosNOME_NCM: TStringField;
    cdsEstadosFCP: TBCDField;
    cdsFCP_EstadosEXCECAO: TSmallintField;
    cdsFCP_EstadosS_EXCECAO: TStringField;
    dspCre: TDataSetProvider;
    cdsCre: TClientDataSet;
    cdsCreCRE: TIntegerField;
    cdsCreFILIAL: TIntegerField;
    cdsCreDOCUMENTO: TStringField;
    cdsCreSITUACAO: TSmallintField;
    cdsCreENTRADA: TDateField;
    cdsCreSACADO: TIntegerField;
    cdsCreTIPO: TSmallintField;
    cdsCreEMISSAO: TDateField;
    cdsCreVENCIMENTO: TDateField;
    cdsCreMOEDA: TSmallintField;
    cdsCreVALOR: TBCDField;
    cdsCreMORA: TBCDField;
    cdsCreDESCONTO: TBCDField;
    cdsCreDATADESCONTO: TDateField;
    cdsCreHISTORICO: TStringField;
    cdsCreNOSSONUMERO: TStringField;
    cdsCreVENCIMENTOPRORROGADO: TDateField;
    cdsCrePOSICAO: TSmallintField;
    cdsCreENTRADANOBANCO: TDateField;
    cdsCreBAIXA: TDateField;
    cdsCreDESCONTOCONCEDIDO: TBCDField;
    cdsCreABATIMENTOS: TBCDField;
    cdsCreOUTRASDESPESAS: TBCDField;
    cdsCreVALORPAGO: TBCDField;
    cdsCreTARIFASBANCARIAS: TBCDField;
    cdsCreJUROSRECEBIDOS: TBCDField;
    cdsCreOUTROSCREDITOS: TBCDField;
    cdsCreCONTA: TIntegerField;
    cdsCreSUBCONTA: TIntegerField;
    cdsCreTIPOOCORRENCIA: TSmallintField;
    cdsCreTIPOAVISO: TSmallintField;
    cdsCreOCORRENCIA: TStringField;
    cdsCreAVISOCOBRANCA: TStringField;
    cdsCreLANCAMENTO: TIntegerField;
    cdsCreTIPOCOBRANCA: TSmallintField;
    cdsCreCONTACORRENTE: TStringField;
    cdsCreCARTEIRA: TStringField;
    cdsCreTIPOPARCELA: TSmallintField;
    cdsCrePEDIDODEVENDA: TIntegerField;
    cdsCrePEDIDOEXTERNO: TStringField;
    cdsCreDATA: TDateField;
    cdsCrePERCENTUAL: TCurrencyField;
    cdsCreREDUCAO: TCurrencyField;
    cdsCreVALORCOMISSAO: TBCDField;
    cdsCreNFSAIDA: TIntegerField;
    cdsCreOBSERVACOES: TMemoField;
    cdsCreVALOR_CHQ_DEVOLVIDO: TBCDField;
    cdsCreSEQUENCIAL: TIntegerField;
    cdsCreOUTROS_DEBITOS: TBCDField;
    cdsCreCONTROLE_FECHAMENTO: TIntegerField;
    cdsCreMODELO: TStringField;
    cdsCreRAZAOSOCIAL: TStringField;
    cdsFCP_EstadosALIQUOTA_INTERNA_DESTINO: TBCDField;
    cdsNFSaidaVALOR_FCP_UF_DESTINO: TBCDField;
    cdsNFSaidaVALOR_ICMS_UF_DESTINO: TBCDField;
    cdsNFSaidaVALOR_ICMS_UF_REMETENTE: TBCDField;
    cdsDetalhesCupomRefNFS_TEMPSERIE_FAB: TStringField;
    cdsConhecimentoFreteCONHECIMENTO_FRETE: TIntegerField;
    cdsConhecimentoFreteNF_ENTRADA: TIntegerField;
    cdsConhecimentoFreteFORNECEDOR: TIntegerField;
    cdsConhecimentoFreteCNPJ: TStringField;
    cdsConhecimentoFreteINSCRICAO: TStringField;
    cdsConhecimentoFreteEMISSAO_ENTRADA: TDateField;
    cdsConhecimentoFreteESTADO: TStringField;
    cdsConhecimentoFreteMODELO: TSmallintField;
    cdsConhecimentoFreteSERIE: TStringField;
    cdsConhecimentoFreteSUBSERIE: TStringField;
    cdsConhecimentoFreteNUMERO: TIntegerField;
    cdsConhecimentoFreteCFOP: TStringField;
    cdsConhecimentoFreteVALOR_TOTAL: TBCDField;
    cdsConhecimentoFreteBASE_CALCULO: TBCDField;
    cdsConhecimentoFreteVALOR_ICMS: TBCDField;
    cdsConhecimentoFreteISENTA_NAO_TRIBUTADA: TBCDField;
    cdsConhecimentoFreteOUTRAS: TBCDField;
    cdsConhecimentoFreteCIF_FOB: TSmallintField;
    cdsConhecimentoFreteCANCELADO: TStringField;
    cdsConhecimentoFreteSTATUS: TSmallintField;
    cdsConhecimentoFreteTIPO_CTE: TSmallintField;
    cdsConhecimentoFreteVALOR_DESCONTO: TBCDField;
    cdsConhecimentoFreteCHAVE_CTE: TStringField;
    cdsConhecimentoFreteCHAVE_CTE_REF: TStringField;
    cdsConhecimentoFreteCST_ICMS: TIntegerField;
    cdsRegInventarioP7ANODEREFERENCIA: TIntegerField;
    cdsRegInventarioP7TIPOCUSTOINVENTARIO: TSmallintField;
    cdsRegInventarioP7VALORLIQUIDODOINVENTARIO: TBCDField;
    cdsRegInventarioP7NUMERO_ORDEM: TIntegerField;
    cdsRegInventarioP7QUANTIDADE: TBCDField;
    cdsRegInventarioP7PRECODECUSTO: TBCDField;
    cdsRegInventarioP7SUBTOTAL: TFMTBCDField;
    cdsRegInventarioP7DESCRICAO_PRODUTO: TStringField;
    cdsRegInventarioP7UNIDADE: TStringField;
    cdsRegInventarioP7TRIBUTACAO: TIntegerField;
    cdsRegInventarioP7DESCRICAO_TRIBUTACAO: TStringField;
    cdsRegInventarioP7PRODUTO: TIntegerField;
    cdsNFSaidaVALOR_ENTRADA: TBCDField;
    cdsNFSaidaTIPOFRETE: TSmallintField;
    cdsNFSaidaCONSUMIDOR_FINAL: TSmallintField;
    cdsConfiguracoesDESCRICAO_CF_CONV_25_2016: TSmallintField;
    dspNFSaidaRefer: TDataSetProvider;
    cdsNFSaidaRefer: TClientDataSet;
    cdsNFSaidaReferNFSAIDA: TIntegerField;
    cdsNFSaidaReferEMISSAO: TDateField;
    cdsNFSaidaReferVALORDANOTA: TBCDField;
    cdsNFSaidaReferNUMERO_DANFE: TStringField;
    cdsNFSaidaReferMODELO: TStringField;
    cdsNFSaidaReferSERIE: TStringField;
    cdsConfiguracoesHABILITA_CONTAB_DOWNLOAD_XML: TSmallintField;
    cdsVersaoBanco: TClientDataSet;
    dspVersaoBanco: TDataSetProvider;
    cdsVersaoBancoVERSAO: TStringField;
    cdsVersaoBancoDATA: TDateField;
    cdsVersaoBancoSTATUS: TSmallintField;
    cdsOrdemServicoCODIGO_PRODUCAO: TIntegerField;
    cdsOrdemServicoCNPJ_CPF: TStringField;
    cdsOrdemServicoIE_RG: TStringField;
    cdsOrdemServicoENDERECO_CLIENTE: TStringField;
    cdsOrdemServicoNUMERO_END_CLIENTE: TStringField;
    cdsOrdemServicoCEP_CLIENTE: TStringField;
    cdsOrdemServicoBAIRRO_CLIENTE: TStringField;
    cdsOrdemServicoCIDADE_CLIENTE: TStringField;
    cdsOrdemServicoDDD_CLIENTE: TStringField;
    cdsOrdemServicoTELEFONE_CLIENTE: TStringField;
    cdsOrdemServicoEMAIL_CLIENTE: TStringField;
    cdsOrdemServicoUF_CLIENTE: TStringField;
    cdsOrdemServicoCONTATO_CLIENTE: TStringField;
    cdsOrdemServicoNOME_CLIENTE: TStringField;
    cdsUsuariosAUTORIZA_FAT: TSmallintField;
    cdsFilialARQ_FAT: TStringField;
    cdsFilialSTATUS_FAT: TSmallintField;
    cdsItens_OS_PecasSTATUS_SALDO: TSmallintField;
    cdsPesqProdutosUNIDADE: TStringField;
    cdsLivroFiscalEntrada: TClientDataSet;
    dspLivroFiscalEntrada: TDataSetProvider;
    cdsLivroFiscalEntradaLIVRO_ENTRADA: TIntegerField;
    cdsLivroFiscalEntradaFILIAL: TIntegerField;
    cdsLivroFiscalEntradaMES_ANO: TStringField;
    cdsLivroFiscalEntradaDATA_ENTRADA: TDateField;
    cdsLivroFiscalEntradaNUMERO_DOCUMENTO: TStringField;
    cdsLivroFiscalEntradaTIPO_ESPECIE_DOCUMENTO: TStringField;
    cdsLivroFiscalEntradaSERIE_SUBSERIE: TStringField;
    cdsLivroFiscalEntradaDATA_DOCUMENTO: TDateField;
    cdsLivroFiscalEntradaCNPJ_EMITENTE: TStringField;
    cdsLivroFiscalEntradaUF_ORIGEM: TStringField;
    cdsLivroFiscalEntradaVALOR_CONTABIL: TBCDField;
    cdsLivroFiscalEntradaCODIGO_CONTABIL: TSmallintField;
    cdsLivroFiscalEntradaCFOP: TStringField;
    cdsLivroFiscalEntradaIDENTIFICACAO_ICMS_IPI: TSmallintField;
    cdsLivroFiscalEntradaCODIGO_VALORES_FISCAIS: TSmallintField;
    cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO: TBCDField;
    cdsLivroFiscalEntradaALIQUOTA: TBCDField;
    cdsLivroFiscalEntradaIMPOSTO_CREDITADO: TBCDField;
    cdsLivroFiscalEntradaOBSERVACAO: TStringField;
    cdsLivroFiscalSaida: TClientDataSet;
    dspLivroFiscalSaida: TDataSetProvider;
    cdsLivroFiscalSaidaLIVRO_SAIDA: TIntegerField;
    cdsLivroFiscalSaidaFILIAL: TIntegerField;
    cdsLivroFiscalSaidaMES_ANO: TStringField;
    cdsLivroFiscalSaidaTIPO_ESPECIE_DOCUMENTO: TStringField;
    cdsLivroFiscalSaidaSERIE_SUBSERIE: TStringField;
    cdsLivroFiscalSaidaNUMERO_DOCUMENTO: TStringField;
    cdsLivroFiscalSaidaDATA_DOCUMENTO: TDateField;
    cdsLivroFiscalSaidaUF_DESTINATARIO: TStringField;
    cdsLivroFiscalSaidaVALOR_CONTABIL: TBCDField;
    cdsLivroFiscalSaidaCODIGO_CONTABIL: TSmallintField;
    cdsLivroFiscalSaidaCFOP: TStringField;
    cdsLivroFiscalSaidaBASE_CALCULO: TBCDField;
    cdsLivroFiscalSaidaALIQUOTA: TCurrencyField;
    cdsLivroFiscalSaidaIMPOSTO_DEBITADO: TBCDField;
    cdsLivroFiscalSaidaISENTAS_NAO_TRIBUTADAS: TBCDField;
    cdsLivroFiscalSaidaOUTRAS: TBCDField;
    cdsLivroFiscalSaidaTOTALIZADOR_GERAL: TBCDField;
    cdsLivroFiscalSaidaCRZ: TIntegerField;
    cdsLivroFiscalSaidaIDENTIFICACAO_ICMS_IPI: TSmallintField;
    cdsLivroFiscalSaidaOBSERVACAO: TStringField;
    cdsPesqProdutosFRACAO: TSmallintField;
    cdsPrecoQuantidade: TClientDataSet;
    dspPrecoQuantidade: TDataSetProvider;
    cdsPrecoQuantidadePRODUTO: TIntegerField;
    cdsPrecoQuantidadeQUANTIDADE: TBCDField;
    cdsPrecoQuantidadePRECO_DESCONTO: TSmallintField;
    cdsPrecoQuantidadePRECO_UNITARIO: TBCDField;
    cdsPrecoQuantidadeDESCRICAO: TStringField;
    cdsPrecoQuantidadeFILIAL: TSmallintField;
    cdsPrecoQuantidadeBARRAS: TStringField;
    cdsPrecoQuantidadePERCENTUAL_DESCONTO: TCurrencyField;
    cdsSimilar: TClientDataSet;
    dspSimilar: TDataSetProvider;
    cdsSimilarPRODUTO: TIntegerField;
    cdsSimilarDESCRICAO: TStringField;
    cdsSimilarSIMILAR: TIntegerField;
    cdsSimilarUNIDADE: TStringField;
    cdsIOS_Produto: TClientDataSet;
    dspIOS_Produto: TDataSetProvider;
    cdsIOS_ProdutoITENS_OS_PECAS: TIntegerField;
    cdsIOS_ProdutoORDEM_SERVICO: TIntegerField;
    cdsIOS_ProdutoCODIGO_PECA: TIntegerField;
    cdsIOS_ProdutoDESCRICAO: TStringField;
    cdsIOS_ProdutoVALOR_UNITARIO: TBCDField;
    cdsIOS_ProdutoFUNCIONARIO: TIntegerField;
    cdsIOS_ProdutoQUANTIDADE: TBCDField;
    cdsIOS_ProdutoDIA: TSQLTimeStampField;
    cdsIOS_ProdutoVALOR_TOTAL: TBCDField;
    cdsIOS_ProdutoX_PED: TStringField;
    cdsIOS_ProdutoN_ITEM_PED: TStringField;
    cdsIOS_ProdutoNUMERO_SERIE: TMemoField;
    cdsIOS_ProdutoCODIGO_BAIXA: TIntegerField;
    cdsIOS_ProdutoTIPO: TSmallintField;
    cdsIOS_ProdutoUSUARIO: TIntegerField;
    cdsIOS_ProdutoSTATUS_SALDO: TSmallintField;
    cdsOS_Produto: TClientDataSet;
    dspOS_Produto: TDataSetProvider;
    cdsOS_ProdutoORDEM_DE_SERVICO: TIntegerField;
    cdsOS_ProdutoCODIGO_SITUACAO: TIntegerField;
    cdsOS_ProdutoCLIENTE: TIntegerField;
    cdsOS_ProdutoDATA_ENTRADA: TDateField;
    cdsOS_ProdutoHORA_ENTRADA: TTimeField;
    cdsOS_ProdutoDATA_TERMINO: TDateField;
    cdsOS_ProdutoHORA_TERMINO: TTimeField;
    cdsOS_ProdutoDATA_SAIDA: TDateField;
    cdsOS_ProdutoHORA_SAIDA: TTimeField;
    cdsOS_ProdutoDATA_GARANTIA: TDateField;
    cdsOS_ProdutoHORA_GARANTIA: TTimeField;
    cdsOS_ProdutoVALOR_MAO_DE_OBRA: TBCDField;
    cdsOS_ProdutoVALOR_PECAS: TBCDField;
    cdsOS_ProdutoVALOR_DESLOCAMENTO: TBCDField;
    cdsOS_ProdutoVALOR_TERCEIRO: TBCDField;
    cdsOS_ProdutoVALOR_OUTROS: TBCDField;
    cdsOS_ProdutoCODIGO_EQUIPAMENTO: TIntegerField;
    cdsOS_ProdutoAPARELHO: TStringField;
    cdsOS_ProdutoMARCA: TStringField;
    cdsOS_ProdutoMODELO: TStringField;
    cdsOS_ProdutoNUMERO_SERIE: TStringField;
    cdsOS_ProdutoETIQ_PATRIMONIO: TStringField;
    cdsOS_ProdutoACESSORIO: TStringField;
    cdsOS_ProdutoDEFEITO: TMemoField;
    cdsOS_ProdutoOBS_SERVICO: TMemoField;
    cdsOS_ProdutoLAUDO: TMemoField;
    cdsOS_ProdutoOBSERVACAO_APARELHO: TStringField;
    cdsOS_ProdutoKILOMETRO: TIntegerField;
    cdsOS_ProdutoNUMERO_NF_PEDIDO: TStringField;
    cdsOS_ProdutoEM_USO: TSmallintField;
    cdsOS_ProdutoNUMERO_NF: TStringField;
    cdsOS_ProdutoOS_REABERTA: TSmallintField;
    cdsOS_ProdutoOS_OUTROS: TBCDField;
    cdsOS_ProdutoOS_OUTROS_EMIT: TBCDField;
    cdsOS_ProdutoVALOR_SINAL: TBCDField;
    cdsOS_ProdutoPRIORIDADE: TSmallintField;
    cdsOS_ProdutoNF_REMESSA: TStringField;
    cdsOS_ProdutoVALOR_NF: TBCDField;
    cdsOS_ProdutoNF_EMITENTE: TStringField;
    cdsOS_ProdutoGARANTIDOR: TIntegerField;
    cdsOS_ProdutoNUMER_SERIE_GARANTIDOR: TStringField;
    cdsOS_ProdutoVALOR_FRETE: TBCDField;
    cdsOS_ProdutoVALOR_SEGURO: TBCDField;
    cdsOS_ProdutoUSUARIO_MICRO: TStringField;
    cdsOS_ProdutoORCA_FORMAS: TMemoField;
    cdsOS_ProdutoALERTA_ABANDONO: TDateField;
    cdsOS_ProdutoHORA_ABANDONO: TTimeField;
    cdsOS_ProdutoFUNCIONARIO: TIntegerField;
    cdsOS_ProdutoOS_FABRICANTE: TStringField;
    cdsOS_ProdutoNFC_NUMERO: TIntegerField;
    cdsOS_ProdutoDATA_PREVISTO: TDateField;
    cdsOS_ProdutoHORA_PREVISTO: TTimeField;
    cdsOS_ProdutoVALOR_TOTAL_OS: TBCDField;
    cdsOS_ProdutoTOTAL_HORAS: TBCDField;
    cdsOS_ProdutoCODIGO_PRODUCAO: TIntegerField;
    cdsOS_ProdutoNOME_CLIENTE: TStringField;
    cdsOS_ProdutoCNPJ_CPF: TStringField;
    cdsOS_ProdutoIE_RG: TStringField;
    cdsOS_ProdutoENDERECO_CLIENTE: TStringField;
    cdsOS_ProdutoNUMERO_END_CLIENTE: TStringField;
    cdsOS_ProdutoCEP_CLIENTE: TStringField;
    cdsOS_ProdutoBAIRRO_CLIENTE: TStringField;
    cdsOS_ProdutoCIDADE_CLIENTE: TStringField;
    cdsOS_ProdutoDDD_CLIENTE: TStringField;
    cdsOS_ProdutoTELEFONE_CLIENTE: TStringField;
    cdsOS_ProdutoEMAIL_CLIENTE: TStringField;
    cdsOS_ProdutoUF_CLIENTE: TStringField;
    cdsOS_ProdutoCONTATO_CLIENTE: TStringField;
    dspUltimaNFEntradaProduto: TDataSetProvider;
    cdsUltimaNFEntradaProduto: TClientDataSet;
    dspItemUltimaNF: TDataSetProvider;
    cdsItemUltimaNF: TClientDataSet;
    cdsFCP_NCM: TClientDataSet;
    dspFCP_NCM: TDataSetProvider;
    cdsFCP_NCMSIGLA: TStringField;
    cdsFCP_NCMNCM: TStringField;
    cdsFCP_NCMFCP: TBCDField;
    cdsFCP_NCMEXCECAO: TSmallintField;
    cdsFCP_NCMALIQUOTA_INTERNA_DESTINO: TBCDField;
    cdsInfoNutricional: TClientDataSet;
    dspInfoNutricional: TDataSetProvider;
    cdsInfoNutricionalINFNUTRICIONAL: TIntegerField;
    cdsInfoNutricionalPORCAO: TStringField;
    cdsInfoNutricionalQUANTIDADE: TLargeintField;
    cdsInfoNutricionalUNIDADEDEPORCAO: TStringField;
    cdsInfoNutricionalPARTEINTEIRAMEDIDACASEIRA: TLargeintField;
    cdsInfoNutricionalPARTEDECIMALMEDIDACASEIRA: TStringField;
    cdsInfoNutricionalMEDIDACASEIRAUTILIZADA: TStringField;
    cdsInfoNutricionalVALORCALORICO: TLargeintField;
    cdsInfoNutricionalVDVALORCALORICO: TLargeintField;
    cdsInfoNutricionalCARBOIDRATOS: TLargeintField;
    cdsInfoNutricionalMENOR1GCARBOIDRATOS: TSmallintField;
    cdsInfoNutricionalVDCARBOIDRATOS: TLargeintField;
    cdsInfoNutricionalPROTEINAS: TBCDField;
    cdsInfoNutricionalMENOR1GPROTEINA: TSmallintField;
    cdsInfoNutricionalVDPROTEINAS: TLargeintField;
    cdsInfoNutricionalGORDURASTOTAIS: TBCDField;
    cdsInfoNutricionalVDGORDURASTOTAIS: TLargeintField;
    cdsInfoNutricionalGORDURASSATURADAS: TBCDField;
    cdsInfoNutricionalVDGORDURASSATURADAS: TLargeintField;
    cdsInfoNutricionalCOLESTEROL: TLargeintField;
    cdsInfoNutricionalMENOR5GCOLESTEROL: TSmallintField;
    cdsInfoNutricionalVDCOLESTEROL: TLargeintField;
    cdsInfoNutricionalFIBRAALIMENTAR: TBCDField;
    cdsInfoNutricionalMENOR1GFIBRAALIMENTAR: TSmallintField;
    cdsInfoNutricionalVDFIBRAALIMENTAR: TLargeintField;
    cdsInfoNutricionalCALCIO: TLargeintField;
    cdsInfoNutricionalQTNAOSIGNIFICATIVACALCIO: TSmallintField;
    cdsInfoNutricionalVDCALCIO: TLargeintField;
    cdsInfoNutricionalFERRO: TBCDField;
    cdsInfoNutricionalQTNAODIGINIFICATIVAFERRO: TSmallintField;
    cdsInfoNutricionalVDFERRO: TLargeintField;
    cdsInfoNutricionalSODIO: TLargeintField;
    cdsInfoNutricionalVDSODIO: TLargeintField;
    cdsInfoNutricionalVALORENERGETICO_KC: TLargeintField;
    cdsInfoNutricionalVALORENERGETICO_KJ: TLargeintField;
    cdsInfoNutricionalVDENERGETICO: TLargeintField;
    cdsInfoNutricionalGORDURASTRANS: TBCDField;
    cdsReceitaProdutos: TClientDataSet;
    dspReceitaProdutos: TDataSetProvider;
    cdsReceitaProdutosRECEITA_PRODUTOS: TIntegerField;
    cdsReceitaProdutosFILIAL: TIntegerField;
    cdsReceitaProdutosPRODUTO: TIntegerField;
    cdsReceitaProdutosINGREDIENTE1: TStringField;
    cdsReceitaProdutosINGREDIENTE2: TStringField;
    cdsReceitaProdutosINGREDIENTE3: TStringField;
    cdsReceitaProdutosINGREDIENTE4: TStringField;
    cdsReceitaProdutosINGREDIENTE5: TStringField;
    cdsReceitaProdutosINGREDIENTE6: TStringField;
    cdsReceitaProdutosINGREDIENTE7: TStringField;
    cdsTeclado_Balanca: TClientDataSet;
    dspTeclado_Balanca: TDataSetProvider;
    cdsUltimaNFEntradaProdutoENTRADA: TDateField;
    cdsUltimaNFEntradaProdutoEMISSAO: TDateField;
    cdsUltimaNFEntradaProdutoNFENTRADA: TIntegerField;
    cdsUltimaNFEntradaProdutoNOTAFISCAL: TStringField;
    cdsItemUltimaNFITEMNFENTRADA: TIntegerField;
    cdsItemUltimaNFNFENTRADA: TIntegerField;
    cdsItemUltimaNFEAN: TStringField;
    cdsItemUltimaNFPRODUTO: TIntegerField;
    cdsItemUltimaNFCST: TSmallintField;
    cdsItemUltimaNFQUANTIDADE: TBCDField;
    cdsItemUltimaNFUNIDADEEMBALAGEM: TBCDField;
    cdsItemUltimaNFVALORUNITARIO: TBCDField;
    cdsItemUltimaNFDESCONTO: TCurrencyField;
    cdsItemUltimaNFIPI: TCurrencyField;
    cdsItemUltimaNFICMSENTRADA: TCurrencyField;
    cdsItemUltimaNFICMSSAIDA: TCurrencyField;
    cdsItemUltimaNFCFOP: TStringField;
    cdsItemUltimaNFBASE_ICMS: TBCDField;
    cdsItemUltimaNFBASE_SUBSTITUICAO: TBCDField;
    cdsItemUltimaNFVALOR_DESCONTO: TBCDField;
    cdsItemUltimaNFVALOR_ICMS: TBCDField;
    cdsItemUltimaNFVALOR_IPI: TBCDField;
    cdsItemUltimaNFVALOR_SUBSTITUICAO: TBCDField;
    cdsItemUltimaNFTIPO_DESCONTO: TSmallintField;
    cdsItemUltimaNFSUB_TOTAL: TBCDField;
    cdsItemUltimaNFISENTO_NAOTRIBUTADO: TBCDField;
    cdsItemUltimaNFENCARGOS: TBCDField;
    cdsItemUltimaNFNCM: TStringField;
    cdsItemUltimaNFREDUCAO_BASE: TFMTBCDField;
    cdsItemUltimaNFDESCONTO_RATEADO: TBCDField;
    cdsItemUltimaNFDESPESA_RATEADA: TBCDField;
    cdsItemUltimaNFFRETE_RATEADO: TBCDField;
    cdsItemUltimaNFBASE_ICMS_SIMPLES: TBCDField;
    cdsItemUltimaNFVALOR_ICMS_SIMPLES: TBCDField;
    cdsItemUltimaNFALIQUOTA_ST: TCurrencyField;
    cdsItemUltimaNFIND_APURACAO_IPI: TIntegerField;
    cdsItemUltimaNFCOD_ENQUADRAMENTO_IPI: TStringField;
    cdsItemUltimaNFBASE_CALCULO_IPI: TBCDField;
    cdsItemUltimaNFALIQUOTA_IPI: TCurrencyField;
    cdsItemUltimaNFCST_PIS: TStringField;
    cdsItemUltimaNFVALOR_BASE_PIS: TBCDField;
    cdsItemUltimaNFP_ALIQUOTA_PIS: TBCDField;
    cdsItemUltimaNFQUANT_BC_PIS: TBCDField;
    cdsItemUltimaNFV_ALIQUOTA_PIS: TBCDField;
    cdsItemUltimaNFVALOR_PIS: TBCDField;
    cdsItemUltimaNFCST_COFINS: TStringField;
    cdsItemUltimaNFVALOR_BC_COFINS: TBCDField;
    cdsItemUltimaNFP_ALIQUOTA_COFINS: TBCDField;
    cdsItemUltimaNFQUANTIDADE_BC_COFINS: TBCDField;
    cdsItemUltimaNFV_ALIQUOTA_COFINS: TBCDField;
    cdsItemUltimaNFVALOR_COFINS: TBCDField;
    cdsItemUltimaNFCST_IPI: TStringField;
    cdsItemUltimaNFNUMERO_ITEM: TIntegerField;
    cdsProdutoFilialV_ICMS_PAGAR: TCurrencyField;
    cdsProdutoFilialV_IMPOSTOS_FEDERAIS: TCurrencyField;
    cdsProdutoFilialV_CUSTO_OPERACIONAL: TCurrencyField;
    cdsProdutoFilialV_COMISSAO_VENDA: TCurrencyField;
    cdsProdutoFilialV_LUCRO_LIQUIDO: TCurrencyField;
    cdsProdutoFilialV_DESCONTO_VENDA: TCurrencyField;
    cdsProdutoFilialNOME_SETOR_BALANCA: TStringField;
    cdsTeclado_BalancaSETOR: TIntegerField;
    cdsTeclado_BalancaTECLA: TIntegerField;
    cdsTeclado_BalancaTECLADO: TIntegerField;
    cdsTeclado_BalancaPRODUTO: TIntegerField;
    cdsTeclado_BalancaDESCRICAO: TStringField;
    cdsTeclado_BalancaTEXTOBOTAO1: TStringField;
    cdsTeclado_BalancaTEXTOBOTAO2: TStringField;
    cdsTeclado_BalancaTEXTOBOTAO3: TStringField;
    cdsTeclado_BalancaTEXTOCONJUGADO1: TStringField;
    cdsTeclado_BalancaTEXTOCONJUGADO2: TStringField;
    cdsTeclado_BalancaTEXTOCONJUGADO3: TStringField;
    cdsTeclado_BalancaOPCAO: TSmallintField;
    cdsTeclado_BalancaCAMINHOIMAGEM: TStringField;
    cdsTeclado_BalancaOPCAOLOCAL: TSmallintField;
    cdsProdutos: TClientDataSet;
    cdsProdutosPRODUTO: TIntegerField;
    cdsProdutosDESCRICAO: TStringField;
    cdsProdutosGRUPO: TIntegerField;
    cdsProdutosSUBGRUPO: TIntegerField;
    cdsProdutosSECAO: TIntegerField;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosUNIDADEEMBALAGEM: TBCDField;
    cdsProdutosPESOLIQUIDO: TBCDField;
    cdsProdutosPESOBRUTO: TBCDField;
    cdsProdutosTRIBUTACAO: TIntegerField;
    cdsProdutosATIVO: TSmallintField;
    cdsProdutosREDBASECALCULO: TFMTBCDField;
    cdsProdutosCST: TStringField;
    cdsProdutosSTATUS: TSmallintField;
    cdsProdutosFORNECEDOR: TIntegerField;
    cdsProdutosNBM: TStringField;
    cdsProdutosNCM: TStringField;
    cdsProdutosDOLARVENDA: TBCDField;
    cdsProdutosINFNUTRICIONAL: TIntegerField;
    cdsProdutosCOMPLEMENTO: TStringField;
    cdsProdutosISENTOPISCOFINS: TSmallintField;
    cdsProdutosSIMILAR: TIntegerField;
    cdsProdutosFABRICANTE: TIntegerField;
    cdsProdutosALTERAR_PRECOVENDA_PDVI: TSmallintField;
    cdsProdutosLITRAGEM: TBCDField;
    cdsProdutosCF_IPI: TSmallintField;
    cdsProdutosCOMPOEM_CESTA_BASICA: TSmallintField;
    cdsProdutosAUTOR1: TIntegerField;
    cdsProdutosAUTOR2: TIntegerField;
    cdsProdutosPERMITE_VENDA_FRACIONADA: TSmallintField;
    cdsProdutosUNIDADE_ATACADO: TBCDField;
    cdsProdutosALIQUOTA_PIS: TBCDField;
    cdsProdutosALIQUOTA_COFINS: TBCDField;
    cdsProdutosVISIBILIDADE: TSmallintField;
    cdsProdutosCST_IPI: TIntegerField;
    cdsProdutosCST_PIS: TIntegerField;
    cdsProdutosCST_COFINS: TIntegerField;
    cdsProdutosTIPO_ITEM: TSmallintField;
    cdsProdutosMVA: TIntegerField;
    cdsProdutosPAUTA_FISCAL: TIntegerField;
    cdsProdutosLEI_PIS_COFINS: TIntegerField;
    cdsProdutosPRODUTO_ORIGEM: TIntegerField;
    cdsProdutosCST_PIS_ENTRADA: TIntegerField;
    cdsProdutosCST_COFINS_ENTRADA: TIntegerField;
    cdsProdutosNATUREZA_RECEITA: TIntegerField;
    cdsProdutosUND_ATACADO: TStringField;
    cdsProdutosALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    cdsProdutosALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    cdsProdutosCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    cdsProdutosCODIGO_ANP: TStringField;
    cdsProdutosCARGA_TRIBUTARIA_NAC: TBCDField;
    cdsProdutosCARGA_TRIBUTARIA_IMP: TBCDField;
    cdsProdutosDESCONTO_PERSONALIZADO: TSmallintField;
    cdsProdutosORIGEM_MERCADORIA: TSmallintField;
    cdsProdutosCEST: TStringField;
    cdsProdutosLOJA: TBCDField;
    cdsProdutosDEPOSITO: TBCDField;
    cdsProdutosSALDOMINIMO: TBCDField;
    cdsProdutosSALDOMAXIMO: TBCDField;
    cdsProdutosSALDOANTERIOR: TBCDField;
    cdsProdutosSALDO_RESERVADO: TBCDField;
    cdsProdutosSALDO_ALMOXARIFADO: TBCDField;
    cdsProdutosPROMOCAO: TSmallintField;
    cdsProdutosPRECODEVENDA: TBCDField;
    cdsProdutosDESCRICAO_CST: TStringField;
    cdsProdutosNOME_FORNECEDOR: TStringField;
    cdsProdutosNOME_GRUPO: TStringField;
    cdsProdutosNOME_SUBGRUPO: TStringField;
    cdsProdutosNOME_SECAO: TStringField;
    cdsProdutosNOME_TRIBUTACAO: TStringField;
    cdsProdutosS_ATIVO: TStringField;
    cdsProdutosS_PROMOCAO: TStringField;
    cdsProdutosSALDO_TOTAL: TCurrencyField;
    cdsProdutoFilialSALDO_ALMOXARIFADO: TBCDField;
    cdsProduto_Origem: TClientDataSet;
    dspProduto_Origem: TDataSetProvider;
    cdsProduto_OrigemDESCRICAO: TStringField;
    cdsProduto_OrigemPRODUTO: TIntegerField;
    cdsProdutosDESCRICAO_PRODUTO_ORIGEM: TStringField;
    dspSel_Prod_E_S_Promo: TDataSetProvider;
    cdsSel_Prod_E_S_Promo: TClientDataSet;
    cdsSel_Prod_E_S_PromoOP_PRODUTO: TIntegerField;
    cdsSel_Prod_E_S_PromoOP_DESCRICAO: TStringField;
    cdsSel_Prod_E_S_PromoOP_PRECO_VENDA: TBCDField;
    cdsSel_Prod_E_S_PromoOP_PRECO_PROMO: TBCDField;
    cdsSel_Prod_E_S_PromoOP_DATA_INI: TDateField;
    cdsSel_Prod_E_S_PromoOP_DATA_FIM: TDateField;
    cdsSel_Prod_E_S_PromoOP_STATUS: TIntegerField;
    cdsLiveUpdateARQUIVO: TStringField;
    cdsLiveUpdateNOME_ARQUIVO: TStringField;
    cdsVersaoAtualARQUIVO: TStringField;
    dspConsultaAgenda: TDataSetProvider;
    cdsConsultaAgenda: TClientDataSet;
    cdsConsultaAgendaAGENDA: TIntegerField;
    cdsConsultaAgendaCOMPROMISSO: TMemoField;
    cdsConsultaAgendaDATA_COMPROMISSO: TDateField;
    cdsConsultaAgendaHORA_COMPROMISSO: TTimeField;
    cdsConsultaAgendaALERTA: TSmallintField;
    cdsConsultaAgendaFUNCIONARIO: TIntegerField;
    cdsConsultaAgendaDATA_REALIZACAO: TDateField;
    cdsConsultaAgendaHORA_REALIZACAO: TTimeField;
    cdsConsultaAgendaREALIZADO: TSmallintField;
    cdsConsultaAgendaNOME_FUNCIONARIO: TStringField;
    cdsNcmNbsDATA_INICIO: TDateField;
    cdsNcmNbsDATA_TERMINO: TDateField;
    cdsFretePedidoVenda: TClientDataSet;
    dspFretePedidoVenda: TDataSetProvider;
    cdsFretePedidoVendaFRETE_PEDIDO_VENDA: TIntegerField;
    cdsFretePedidoVendaPEDIDO: TIntegerField;
    cdsFretePedidoVendaTIPO_LANCAMENTO: TIntegerField;
    cdsFretePedidoVendaPLANO_CONTAS: TIntegerField;
    cdsFretePedidoVendaITEM_PLANO_CONTAS: TIntegerField;
    cdsFretePedidoVendaTIPO_PAGAMENTO: TSmallintField;
    cdsFretePedidoVendaVENCIMENTO: TDateField;
    cdsFretePedidoVendaVALOR: TBCDField;
    cdsFretePedidoVendaS_LANCAMENTO: TStringField;
    cdsFretePedidoVendaS_PLANO_CONTAS: TStringField;
    cdsFretePedidoVendaS_ITEM_PLANO_CONTAS: TStringField;
    cdsCfgConexaoZeusRetailPATH_ORIGEM_ARQ_PAF: TStringField;
    cdsCfgConexaoZeusRetailPATH_DESTINO_ARQ_PAF: TStringField;
    cdsDeslocamentoOS: TClientDataSet;
    dspDeslocamentoOS: TDataSetProvider;
    cdsDeslocamentoOSDESLOCAMENTO_OS: TIntegerField;
    cdsDeslocamentoOSORDEM_SERVICO: TIntegerField;
    cdsDeslocamentoOSDATA_CADASTRO: TDateField;
    cdsDeslocamentoOSHORA_SAIDA_ORIGEM: TTimeField;
    cdsDeslocamentoOSKM_SAIDA_ORIGEM: TIntegerField;
    cdsDeslocamentoOSHORA_CHEGADA_DESTINO: TTimeField;
    cdsDeslocamentoOSKM_CHEGADA_DESTINO: TIntegerField;
    cdsDeslocamentoOSHORA_SAIDA_DESTINO: TTimeField;
    cdsDeslocamentoOSKM_SAIDA_DESTINO: TIntegerField;
    cdsDeslocamentoOSHORA_REGRESSO_ORIGEM: TTimeField;
    cdsDeslocamentoOSKM_REGRESSO_ORIGEM: TIntegerField;
    cdsDeslocamentoOSVALOR_ALIMENTACAO: TBCDField;
    cdsDeslocamentoOSVALOR_HOSPEDAGEM: TIntegerField;
    cdsDeslocamentoOSKM_TOTAL: TIntegerField;
    cdsDeslocamentoOSHORAS_TOTAL: TTimeField;
    dspConfig_financeiro: TDataSetProvider;
    cdsConfig_financeiro: TClientDataSet;
    cdsConfig_financeiroCONFIG_FINANCEIRO: TIntegerField;
    cdsConfig_financeiroEMITIR_RECIBO_RECEBIMENTO: TSmallintField;
    cdsRegInventarioP7DATA: TDateField;
    cdsRegInventarioP7INVENTARIO: TIntegerField;
    cdsTotalizaVContabilE: TClientDataSet;
    dspTotalizaVContabilE: TDataSetProvider;
    cdsTotalizaVContabilEOP_CFOP: TStringField;
    cdsTotalizaVContabilEOP_DESCRICAO_CFOP: TStringField;
    cdsTotalizaVContabilEOP_BASE_CALCULO: TBCDField;
    cdsTotalizaVContabilEOP_VALOR_CONTABIL: TBCDField;
    cdsTotalizaVContabilEOP_IMPOSTO_CREDITADO: TBCDField;
    cdsTotalizaVContabilEOP_ISENTAS_NT: TBCDField;
    cdsTotalizaVContabilEOP_OUTRAS: TBCDField;
    cdsTotalizaValoresEST: TClientDataSet;
    dspTotalizaValoresEST: TDataSetProvider;
    cdsTotalizaValoresESTOP_CFOP: TStringField;
    cdsTotalizaValoresESTOP_DESCRICAO_CFOP: TStringField;
    cdsTotalizaValoresESTOP_BASE_CALCULO: TBCDField;
    cdsTotalizaValoresESTOP_VALOR_CONTABIL: TBCDField;
    cdsTotalizaValoresESTOP_IMPOSTO_CREDITADO: TBCDField;
    cdsTotalizaValoresESTOP_ISENTAS_NT: TBCDField;
    cdsTotalizaValoresESTOP_OUTRAS: TBCDField;
    cdsTotalizaValoresINTER: TClientDataSet;
    dspTotalizaValoresINTER: TDataSetProvider;
    cdsTotalizaValoresINTEROP_CFOP: TStringField;
    cdsTotalizaValoresINTEROP_DESCRICAO_CFOP: TStringField;
    cdsTotalizaValoresINTEROP_BASE_CALCULO: TBCDField;
    cdsTotalizaValoresINTEROP_VALOR_CONTABIL: TBCDField;
    cdsTotalizaValoresINTEROP_IMPOSTO_CREDITADO: TBCDField;
    cdsTotalizaValoresINTEROP_ISENTAS_NT: TBCDField;
    cdsTotalizaValoresINTEROP_OUTRAS: TBCDField;
    cdsTotalizaVContabilS: TClientDataSet;
    dspTotalizaVContabilS: TDataSetProvider;
    cdsTotalizaVContabilSOP_CFOP: TStringField;
    cdsTotalizaVContabilSOP_DESCRICAO_CFOP: TStringField;
    cdsTotalizaVContabilSOP_VALOR_CONTABIL: TBCDField;
    cdsTotalizaVContabilSOP_BASE_CALCULO: TBCDField;
    cdsTotalizaVContabilSOP_IMPOSTO_DEBITADO: TBCDField;
    cdsTotalizaVContabilSOP_ISENTAS_NT: TBCDField;
    cdsTotalizaVContabilSOP_OUTRAS: TBCDField;
    cdsTotalizaValoresEST_S: TClientDataSet;
    dspTotalizaValoresEST_S: TDataSetProvider;
    cdsTotalizaValoresEST_SOP_CFOP: TStringField;
    cdsTotalizaValoresEST_SOP_DESCRICAO_CFOP: TStringField;
    cdsTotalizaValoresEST_SOP_VALOR_CONTABIL: TBCDField;
    cdsTotalizaValoresEST_SOP_BASE_CALCULO: TBCDField;
    cdsTotalizaValoresEST_SOP_IMPOSTO_DEBITADO: TBCDField;
    cdsTotalizaValoresEST_SOP_ISENTAS_NT: TBCDField;
    cdsTotalizaValoresEST_SOP_OUTRAS: TBCDField;
    cdsTotalizaValoresINTER_S: TClientDataSet;
    dspTotalizaValoresINTER_S: TDataSetProvider;
    cdsTotalizaValoresINTER_SOP_CFOP: TStringField;
    cdsTotalizaValoresINTER_SOP_DESCRICAO_CFOP: TStringField;
    cdsTotalizaValoresINTER_SOP_VALOR_CONTABIL: TBCDField;
    cdsTotalizaValoresINTER_SOP_BASE_CALCULO: TBCDField;
    cdsTotalizaValoresINTER_SOP_IMPOSTO_DEBITADO: TBCDField;
    cdsTotalizaValoresINTER_SOP_ISENTAS_NT: TBCDField;
    cdsTotalizaValoresINTER_SOP_OUTRAS: TBCDField;
    dspSelProdExpBalanca: TDataSetProvider;
    cdsSelProdExpBalanca: TClientDataSet;
    cdsSelProdExpBalancaOP_BARRAS: TStringField;
    cdsSelProdExpBalancaOP_PRODUTO: TIntegerField;
    cdsSelProdExpBalancaOP_PESADO: TIntegerField;
    cdsSelProdExpBalancaOP_QUANTIDADE: TIntegerField;
    cdsSelProdExpBalancaOP_DESCRICAO: TStringField;
    cdsSelProdExpBalancaOP_INF_NUTRICIONAL: TIntegerField;
    cdsSelProdExpBalancaOP_UNIDADE: TStringField;
    cdsSelProdExpBalancaOP_PRECO_VENDA: TBCDField;
    cdsSelProdExpBalancaOP_PROMOCAO: TIntegerField;
    cdsSelProdExpBalancaOP_PRECO_PROMOCAO: TBCDField;
    cdsSelProdExpBalancaOP_SETOR_BALANCA: TIntegerField;
    cdsSelProdExpBalancaOP_TECLA_ASSOCIADA: TIntegerField;
    cdsSelProdExpBalancaOP_VALIDADE: TIntegerField;
    cdsSelProdExpBalancaOP_DESCRICAO_BALANCA: TStringField;
    cdsSelProdExpBalancaOP_ETIQUETA: TIntegerField;
    cdsSelProdExpBalancaOP_INGREDIENTE_1: TStringField;
    cdsSelProdExpBalancaOP_INGREDIENTE_2: TStringField;
    cdsSelProdExpBalancaOP_INGREDIENTE_3: TStringField;
    cdsSelProdExpBalancaOP_INGREDIENTE_4: TStringField;
    cdsSelProdExpBalancaOP_INGREDIENTE_5: TStringField;
    cdsSelProdExpBalancaOP_TECLADO: TIntegerField;
    cdsSelProdExpBalancaOP_PRODUCAO: TIntegerField;
    cdsSelProdExpBalancaOP_NOME_SETOR: TStringField;
    cdsSelSetorExpBalanca: TClientDataSet;
    dspSelSetorExpBalanca: TDataSetProvider;
    cdsSelReceitaExpBalanca: TClientDataSet;
    dspSelReceitaExpBalanca: TDataSetProvider;
    cdsSelSetorExpBalancaOP_SETOR: TIntegerField;
    cdsSelSetorExpBalancaOP_NOME: TStringField;
    cdsSelSetorExpBalancaOP_PRODUTO: TIntegerField;
    cdsSelSetorExpBalancaOP_ETIQUETA: TIntegerField;
    cdsSelSetorExpBalancaOP_BARRAS: TStringField;
    cdsSelSetorExpBalancaOP_TECLA_ASSOCIADA: TIntegerField;
    cdsSelReceitaExpBalancaOP_PRODUTO: TIntegerField;
    cdsSelReceitaExpBalancaOP_PRODUCAO: TIntegerField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_1: TStringField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_2: TStringField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_3: TStringField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_4: TStringField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_5: TStringField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_6: TStringField;
    cdsSelReceitaExpBalancaOP_BARRAS: TStringField;
    cdsSelReceitaExpBalancaOP_NOME_SETOR: TStringField;
    cdsSelReceitaExpBalancaOP_SETOR: TIntegerField;
    cdsSelReceitaExpBalancaOP_INGREDIENTE_7: TStringField;
    cdsSelInfNutriExpBal: TClientDataSet;
    dspSelInfNutriExpBal: TDataSetProvider;
    cdsSelInfNutriExpBalOP_INF_NUTRICIONAL: TIntegerField;
    cdsSelInfNutriExpBalOP_PORCAO: TStringField;
    cdsSelInfNutriExpBalOP_QUANTIDADE: TLargeintField;
    cdsSelInfNutriExpBalOP_UND_PORCAO: TStringField;
    cdsSelInfNutriExpBalOP_PARTE_INT_MED_CAS: TBCDField;
    cdsSelInfNutriExpBalOP_PARTE_DEC_MED_CAS: TStringField;
    cdsSelInfNutriExpBalOP_MEDIDA_CAS_UTIL: TStringField;
    cdsSelInfNutriExpBalOP_VALOR_CALORICO: TLargeintField;
    cdsSelInfNutriExpBalOP_VD_VALOR_CALORICO: TLargeintField;
    cdsSelInfNutriExpBalOP_CARBOIDRATOS: TLargeintField;
    cdsSelInfNutriExpBalOP_MENOR_1G_CARBO: TSmallintField;
    cdsSelInfNutriExpBalOP_VD_CARBOIDRATOS: TLargeintField;
    cdsSelInfNutriExpBalOP_PROTEINAS: TBCDField;
    cdsSelInfNutriExpBalOP_MENOR_1G_PROTEINA: TSmallintField;
    cdsSelInfNutriExpBalOP_VD_PROTEINAS: TLargeintField;
    cdsSelInfNutriExpBalOP_GORDURAS_TOT: TBCDField;
    cdsSelInfNutriExpBalOP_VD_GORD_TOT: TLargeintField;
    cdsSelInfNutriExpBalOP_GORD_SATURADAS: TBCDField;
    cdsSelInfNutriExpBalOP_VD_GORD_SATURADAS: TLargeintField;
    cdsSelInfNutriExpBalOP_COLESTEROL: TLargeintField;
    cdsSelInfNutriExpBalOP_MENOR_5G_COLESTEROL: TSmallintField;
    cdsSelInfNutriExpBalOP_VD_COLESTEROL: TLargeintField;
    cdsSelInfNutriExpBalOP_FIBRA_ALIMENTAR: TBCDField;
    cdsSelInfNutriExpBalOP_MENOR_1G_FIBRA: TSmallintField;
    cdsSelInfNutriExpBalOP_VD_FIBRA_ALIMENTAR: TLargeintField;
    cdsSelInfNutriExpBalOP_CALCIO: TLargeintField;
    cdsSelInfNutriExpBalOP_QT_NAO_SIG_CALCIO: TSmallintField;
    cdsSelInfNutriExpBalOP_VD_CALCIO: TLargeintField;
    cdsSelInfNutriExpBalOP_FERRO: TBCDField;
    cdsSelInfNutriExpBalOP_QT_NAO_SIG_FERRO: TSmallintField;
    cdsSelInfNutriExpBalOP_VD_FERRO: TLargeintField;
    cdsSelInfNutriExpBalOP_SODIO: TLargeintField;
    cdsSelInfNutriExpBalOP_VD_SODIO: TLargeintField;
    cdsSelInfNutriExpBalOP_VALOR_ENERGETICO_KC: TLargeintField;
    cdsSelInfNutriExpBalOP_VALOR_ENERGETICO_KJ: TLargeintField;
    cdsSelInfNutriExpBalOP_VD_ENERGETICO: TLargeintField;
    cdsSelInfNutriExpBalOP_GORDURAS_TRANS: TBCDField;
    cdsSelTecladoExpBalanca: TClientDataSet;
    dspSelTecladoExpBalanca: TDataSetProvider;
    cdsSelProdExpPdv: TClientDataSet;
    dspSelProdExpPdv: TDataSetProvider;
    cdsSelProdExpPdvOP_BARRAS: TStringField;
    cdsSelProdExpPdvOP_DESCRICAO: TStringField;
    cdsSelProdExpPdvOP_UNIDADE: TStringField;
    cdsSelProdExpPdvOP_DESCRICAO_CUPOM: TStringField;
    cdsSelProdExpPdvOP_CODIGO_ECF: TStringField;
    cdsSelProdExpPdvOP_PRECO_VENDA: TBCDField;
    cdsSelProdExpPdvOP_SIMILAR: TIntegerField;
    cdsSelProdExpPdvOP_PROMOCAO: TSmallintField;
    cdsSelProdExpPdvOP_PRECO_PROMOCAO: TBCDField;
    cdsSelProdExpPdvOP_ENVIAR_PARA_BALANCA: TSmallintField;
    cdsSelProdExpPdvOP_QUANTIDADE: TIntegerField;
    cdsSelProdExpPdvOP_PESADO: TIntegerField;
    cdsSelProdExpPdvOP_GERADO: TIntegerField;
    cdsSelProdExpPdvOP_DATA_REMARCACAO: TDateField;
    cdsSelProdExpPdvOP_PRODUTO: TIntegerField;
    cdsSelProdExpPdvOP_SETOR_BALANCA: TIntegerField;
    cdsSelProdExpPdvOP_SALDO_ATUAL: TBCDField;
    cdsSelProdExpPdvOP_CST: TStringField;
    cdsSelProdExpPdvOP_GRUPO: TIntegerField;
    cdsSelProdExpPdvOP_STATUS: TIntegerField;
    cdsSelProdExpPdvOP_FORNECEDOR: TIntegerField;
    cdsSelProdExpPdvOP_CUSTO_LIQUIDO: TBCDField;
    cdsSelProdExpPdvOP_PRECO_ATACADO: TBCDField;
    cdsSelProdExpPdvOP_ATIVO: TSmallintField;
    cdsSelProdExpPdvOP_DESCRICAO_ATACADO: TStringField;
    cdsSelProdExpPdvOP_PERMITE_VENDA_FRAC: TSmallintField;
    cdsSelProdExpPdvOP_PERCENTUAL_ISS: TBCDField;
    cdsSelProdExpPdvOP_PERCENTUAL_IOF: TBCDField;
    cdsSelProdExpPdvOP_PERCENTUAL_CIDE: TBCDField;
    cdsSelProdExpPdvOP_ALIQUOTA_PIS: TBCDField;
    cdsSelProdExpPdvOP_ALIQUOTA_COFINS: TBCDField;
    cdsSelProdExpPdvOP_ALIQUOTA_ICMS: TBCDField;
    cdsSelProdExpPdvOP_ALIQUOTA_IPI: TBCDField;
    cdsSelProdExpPdvOP_NCM: TStringField;
    cdsSelProdExpPdvOP_ALIQ_MED_NAC: TBCDField;
    cdsSelProdExpPdvOP_ALIQ_MED_IMP: TBCDField;
    cdsSelProdExpPdvOP_DESCONTO_PER: TSmallintField;
    cdsSelProdExpPdvOP_EX_TIPI: TSmallintField;
    cdsSelProdExpPdvOP_NAT_REC: TIntegerField;
    cdsSelProdExpPdvOP_TIPO_ITEM: TSmallintField;
    cdsSelProdExpPdvOP_CHAVE: TStringField;
    cdsSelProdExpPdvOP_FONTE: TStringField;
    cdsSelProdExpPdvOP_CARGA_NAC_FEDERAL: TBCDField;
    cdsSelProdExpPdvOP_CARGA_IMP_FEDERAL: TBCDField;
    cdsSelProdExpPdvOP_CARGA_ESTADUAL: TBCDField;
    cdsSelProdExpPdvOP_CARGA_MUNICIPAL: TBCDField;
    cdsSelProdExpPdvOP_ORIGEM_MERCADORIA: TSmallintField;
    cdsSelProdExpPdvOP_CEST: TStringField;
    cdsSelCliExportacao: TClientDataSet;
    dspSelCliExportacao: TDataSetProvider;
    cdsSelCliExportacaoOP_BAIRRO: TStringField;
    cdsSelCliExportacaoOP_BARRAS: TStringField;
    cdsSelCliExportacaoOP_CLIENTE: TIntegerField;
    cdsSelCliExportacaoOP_CNPJ: TStringField;
    cdsSelCliExportacaoOP_RAZAO_SOCIAL: TStringField;
    cdsSelCliExportacaoOP_ENDERECO: TStringField;
    cdsSelCliExportacaoOP_PONTO_REFERENCIA: TStringField;
    cdsSelCliExportacaoOP_ESTADO: TStringField;
    cdsSelCliExportacaoOP_DDD: TStringField;
    cdsSelCliExportacaoOP_TELEFONE1: TStringField;
    cdsSelCliExportacaoOP_LIMITE_CREDITO: TBCDField;
    cdsSelCliExportacaoOP_SALDO_DEVEDOR: TBCDField;
    cdsSelCliExportacaoOP_STATUS: TIntegerField;
    cdsSelCliExportacaoOP_NOME_CIDADE: TStringField;
    cdsSelCliExportacaoOP_NUMERO: TIntegerField;
    cdsSelCliExportacaoOP_CEP: TStringField;
    cdsSelCliExportacaoOP_INSCRICAO: TStringField;
    cdsSelCliExportacaoOP_NASCIMENTO: TDateField;
    cdsSelCliExportacaoOP_ULTIMA_COMPRA: TDateField;
    cdsSelCliExportacaoOP_VALOR_ULTIMO_PEDIDO: TBCDField;
    cdsSelCliExportacaoOP_FANTASIA: TStringField;
    cdsSelCliExportacaoOP_CADASTRO: TDateField;
    cdsSelCliExportacaoOP_TIPO: TSmallintField;
    cdsSelCliExportacaoOP_ENDERECO_COBRANCA: TStringField;
    cdsSelCliExportacaoOP_BAIRRO_COBRANCA: TStringField;
    cdsSelCliExportacaoOP_CEP_COBRANCA: TStringField;
    cdsSelCliExportacaoOP_ESTADO_COBRANCA: TStringField;
    cdsSelCliExportacaoOP_CIDADE_COBRANCA: TStringField;
    cdsSelCliExportacaoOP_CONTATO: TStringField;
    cdsSelCliExportacaoOP_EMAIL: TStringField;
    cdsSelCliExportacaoOP_SEXO: TSmallintField;
    cdsSelCliExportacaoOP_RENDA: TBCDField;
    cdsSelCliExportacaoOP_ESTADO_CIVIL: TSmallintField;
    cdsSelCliExportacaoOP_NUMERO_COBR: TIntegerField;
    cdsSelCliExportacaoOP_COMPLEMENTO: TStringField;
    cdsSelCliExportacaoOP_COD_MUNICIPIO: TIntegerField;
    cdsSelPrecoQtdExp: TClientDataSet;
    dspSelPrecoQtdExp: TDataSetProvider;
    cdsSelPrecoQtdExpOP_BARRAS: TStringField;
    cdsSelPrecoQtdExpOP_QUANTIDADE: TBCDField;
    cdsSelPrecoQtdExpOP_PRECO_UNITARIO: TBCDField;
    cdsSelPrecoQtdExpOP_PERCENTUAL_DESCONTO: TCurrencyField;
    fdmImpCupom: TFDMemTable;
    fdmImpCupomSERIE_ECF: TStringField;
    fdmImpCupomNUMERO_CUPOM: TIntegerField;
    fdmImpCupomEMISSAO: TDateField;
    fdmImpCupomHORA_ABERTURA: TTimeField;
    fdmImpCupomVALOR_UNITARIO: TCurrencyField;
    fdmImpCupomQUANTIDADE: TCurrencyField;
    fdmImpCupomSUB_TOTAL: TCurrencyField;
    fdmImpCupomVALOR_DESCONTO: TCurrencyField;
    fdmImpCupomVALOR_ACRESCIMO: TCurrencyField;
    fdmImpCupomNUMERO_CAIXA: TIntegerField;
    fdmImpCupomNUMERO_ITEM: TIntegerField;
    fdmImpCupomSITUACAO: TSmallintField;
    fdmImpCupomQUANTIDADE_CANCELADA: TCurrencyField;
    fdmImpCupomVALOR_CANCELADO: TCurrencyField;
    fdmImpCupomCFOP: TStringField;
    fdmImpCupomBARRAS: TStringField;
    fdmImpCupomTRIBUTACAO: TIntegerField;
    fdmFinalizadoras: TFDMemTable;
    fdmFinalizadorasCOD_FINALIZADORA: TStringField;
    fdmFinalizadorasVALOR: TCurrencyField;
    fdmFinalizadorasCODIGO_PEDIDO: TIntegerField;
    cdsConfig_financeiroIMPORTAR_CHEQUES_PDV: TSmallintField;
    fdmImpCheque: TFDMemTable;
    fdmImpChequeCLIENTE: TIntegerField;
    fdmImpChequeDATA: TDateField;
    fdmImpChequeBANCO: TIntegerField;
    fdmImpChequeAGENCIA: TStringField;
    fdmImpChequeCONTA: TStringField;
    fdmImpChequeCHEQUE: TStringField;
    fdmImpChequeEMISSAO: TDateField;
    fdmImpChequeVENCIMENTO: TDateField;
    fdmImpChequeCUPOM: TIntegerField;
    fdmImpChequeVALOR: TCurrencyField;
    fdmImpChequePL_CONTAS: TIntegerField;
    fdmImpChequeITEM_PL_CONTAS: TIntegerField;
    fdmImpChequeLANCAMENTO: TIntegerField;
    fdmImpReg60M: TFDMemTable;
    fdmImpReg60MTIPO: TSmallintField;
    fdmImpReg60MSUBTIPO: TStringField;
    fdmImpReg60MDATA_EMISSAO: TDateField;
    fdmImpReg60MSERIE_ECF: TStringField;
    fdmImpReg60MNUMERO_CAIXA: TIntegerField;
    fdmImpReg60MCOO_INICIAL: TIntegerField;
    fdmImpReg60MCOO_FINAL: TIntegerField;
    fdmImpReg60MCRZ: TIntegerField;
    fdmImpReg60MCRO: TIntegerField;
    fdmImpReg60MVENDA_BRUTA: TCurrencyField;
    fdmImpReg60MVALOR_GT: TCurrencyField;
    fdmImpReg60A: TFDMemTable;
    fdmImpReg60ATIPO: TIntegerField;
    fdmImpReg60ASUBTIPO: TStringField;
    fdmImpReg60ADATA_EMISSAO: TDateField;
    fdmImpReg60AALIQUOTA: TStringField;
    fdmImpReg60AVALOR_ALIQUOTA: TCurrencyField;
    fdmImpReg60ASERIE_ECF: TStringField;
    fdmImpReg60ACRZ: TIntegerField;
    fdmImpReg60ANUMERO_CAIXA: TIntegerField;
    fdmImpReg60AGT: TCurrencyField;
    fdmImpReg60APOSICAO_ALIQUOTA: TStringField;
    fdmPedidoZeus: TFDMemTable;
    fdmPedidoZeusNUMERO_PEDIDO: TIntegerField;
    fdmPedidoZeusSTATUS_PEDIDO: TSmallintField;
    fdmFinalizadoraPedido: TFDMemTable;
    fdmFinalizadoraPedidoCOD_FINALIZADORA: TStringField;
    fdmFinalizadoraPedidoVALOR: TCurrencyField;
    fdmFinalizadoraPedidoCODIGO_PEDIDO: TIntegerField;
    fdmImpCupomALIQUOTA_ICMS: TStringField;
    fdmImpFinanceiro: TFDMemTable;
    fdmImpFinanceiroIP_CRE: TIntegerField;
    fdmImpFinanceiroIP_FILIAL: TIntegerField;
    fdmImpFinanceiroIP_DOCUMENTO: TStringField;
    fdmImpFinanceiroIP_SITUACAO: TSmallintField;
    fdmImpFinanceiroIP_DATA_ENTRADA: TDateField;
    fdmImpFinanceiroIP_SACADO: TIntegerField;
    fdmImpFinanceiroIP_TIPO: TSmallintField;
    fdmImpFinanceiroIP_DATA_EMISSAO: TDateField;
    fdmImpFinanceiroIP_DATA_VENCIMENTO: TDateField;
    fdmImpFinanceiroIP_MOEDA: TCurrencyField;
    fdmImpFinanceiroIP_MORA_DIARIA: TCurrencyField;
    fdmImpFinanceiroIP_DESCONTO: TCurrencyField;
    fdmImpFinanceiroIP_DATA_DESCONTO: TDateField;
    fdmImpFinanceiroIP_HISTORICO: TStringField;
    fdmImpFinanceiroIP_NOSSO_NUMERO: TStringField;
    fdmImpFinanceiroIP_VENCIMENTO_PRORROGADO: TDateField;
    fdmImpFinanceiroIP_POSICAO: TSmallintField;
    fdmImpFinanceiroIP_DATA_ENTRADA_NO_BANCO: TDateField;
    fdmImpFinanceiroIP_DATA_BAIXA: TDateField;
    fdmImpFinanceiroIP_DESCONTO_CONCEDIDO: TCurrencyField;
    fdmImpFinanceiroIP_ABATIMENTOS: TCurrencyField;
    fdmImpFinanceiroIP_OUTRAS_DESPESAS: TCurrencyField;
    fdmImpFinanceiroIP_VALOR_PAGO: TCurrencyField;
    fdmImpFinanceiroIP_TARIFAS_BANCARIAS: TCurrencyField;
    fdmImpFinanceiroIP_JUROS_RECEBIDOS: TCurrencyField;
    fdmImpFinanceiroIP_OUTROS_CREDITOS: TCurrencyField;
    fdmImpFinanceiroIP_PLANO_CONTAS: TIntegerField;
    fdmImpFinanceiroIP_SUB_CONTA: TIntegerField;
    fdmImpFinanceiroIP_TIPO_AVISO: TSmallintField;
    fdmImpFinanceiroIP_OCORRENCIA: TStringField;
    fdmImpFinanceiroIP_AVISO_COBRANCA: TStringField;
    fdmImpFinanceiroIP_LANCAMENTO: TIntegerField;
    fdmImpFinanceiroIP_TIPO_COBRANCA: TSmallintField;
    fdmImpFinanceiroIP_CONTA_CORRENTE: TStringField;
    fdmImpFinanceiroIP_CARTEIRA: TStringField;
    fdmImpFinanceiroIP_TIPO_PARCELA: TSmallintField;
    fdmImpFinanceiroIP_PEDIDO_DE_VENDA: TStringField;
    fdmImpFinanceiroIP_DATA: TDateField;
    fdmImpFinanceiroIP_PERCENTUAL: TCurrencyField;
    fdmImpFinanceiroIP_REDUCAO: TCurrencyField;
    fdmImpFinanceiroIP_VALOR_COMISSAO: TCurrencyField;
    fdmImpFinanceiroIP_NF_SAIDA: TIntegerField;
    fdmImpFinanceiroIP_OBSERVACOES: TStringField;
    fdmImpFinanceiroIP_VALOR_CHQ_DEVOLVIDO: TCurrencyField;
    fdmImpFinanceiroIP_SEQUENCIAL: TIntegerField;
    fdmImpFinanceiroIP_OUTROS_DEBITOS: TCurrencyField;
    fdmImpFinanceiroIP_MODELO_DOCUMENTO: TStringField;
    fdmImpFinanceiroIP_PEDIDO_EXTERNO: TStringField;
    fdmImpFinanceiroIP_TIPO_OCORRENCIA: TSmallintField;
    fdmImpFinanceiroIP_VALOR: TCurrencyField;
    dspRegistro60_Mestre: TDataSetProvider;
    cdsRegistro60_Mestre: TClientDataSet;
    cdsRegistro60_MestreREGISTRO60MESTRE: TIntegerField;
    cdsRegistro60_MestreNUMERODESERIEEQUIPAMENTO: TStringField;
    cdsRegistro60_MestreEMISSAO: TDateField;
    cdsRegistro60_MestreNUMEROECF: TSmallintField;
    cdsRegistro60_MestreCOOINICIAL: TIntegerField;
    cdsRegistro60_MestreCOOFINAL: TIntegerField;
    cdsRegistro60_MestreCONTADORREDUCAOZ: TSmallintField;
    cdsRegistro60_MestreVENDABRUTA: TBCDField;
    cdsRegistro60_MestreGTFINAL: TBCDField;
    cdsRegistro60_MestreCRO: TIntegerField;
    cdsRegistro60_MestreMODELO: TStringField;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    fdmImpReg60MMODELO_DOCUMENTO: TStringField;
    cdsDeslocamentoOSKM_CALC: TIntegerField;
    cdsDeslocamentoOSHORAS_CALC: TTimeField;
    dspCST_PIS_ENT: TDataSetProvider;
    cdsCST_PIS_ENT: TClientDataSet;
    cdsCST_PIS_ENTCST_PIS_PASEP: TIntegerField;
    cdsCST_PIS_ENTDESCRICAO: TStringField;
    cdsCST_PIS_ENTENTRADA_SAIDA: TSmallintField;
    cdsCST_PIS_ENTGERA_CREDITO: TSmallintField;
    dspCST_PIS_SAI: TDataSetProvider;
    cdsCST_PIS_SAI: TClientDataSet;
    cdsCST_PIS_SAICST_PIS_PASEP: TIntegerField;
    cdsCST_PIS_SAIDESCRICAO: TStringField;
    cdsCST_PIS_SAIENTRADA_SAIDA: TSmallintField;
    cdsCST_PIS_SAIGERA_CREDITO: TSmallintField;
    dspCST_COFINS_ENT: TDataSetProvider;
    cdsCST_COFINS_ENT: TClientDataSet;
    cdsCST_COFINS_ENTCST_COFINS: TIntegerField;
    cdsCST_COFINS_ENTDESCRICAO: TStringField;
    cdsCST_COFINS_ENTENTRADA_SAIDA: TSmallintField;
    cdsCST_COFINS_ENTGERA_CREDITO: TSmallintField;
    dspCST_COFINS_SAI: TDataSetProvider;
    cdsCST_COFINS_SAI: TClientDataSet;
    cdsCST_COFINS_SAICST_COFINS: TIntegerField;
    cdsCST_COFINS_SAIDESCRICAO: TStringField;
    cdsCST_COFINS_SAIENTRADA_SAIDA: TSmallintField;
    cdsCST_COFINS_SAIGERA_CREDITO: TSmallintField;
    cdsConfiguracoesATUALIZAR_NCM_PELA_ENTRADA: TSmallintField;
    cdsSelTecladoExpBalancaOP_SETOR: TIntegerField;
    cdsSelTecladoExpBalancaOP_TECLA: TIntegerField;
    cdsSelTecladoExpBalancaOP_TECLADO: TIntegerField;
    cdsSelTecladoExpBalancaOP_PRODUTO: TIntegerField;
    cdsSelTecladoExpBalancaOP_DESCRICAO: TStringField;
    cdsSelTecladoExpBalancaOP_TEXTOBOTAO1: TStringField;
    cdsSelTecladoExpBalancaOP_TEXTOBOTAO2: TStringField;
    cdsSelTecladoExpBalancaOP_TEXTOBOTAO3: TStringField;
    cdsSelTecladoExpBalancaOP_TEXTOCONJUGADO1: TStringField;
    cdsSelTecladoExpBalancaOP_TEXTOCONJUGADO2: TStringField;
    cdsSelTecladoExpBalancaOP_TEXTOCONJUGADO3: TStringField;
    cdsSelTecladoExpBalancaOP_OPCAO: TSmallintField;
    cdsSelTecladoExpBalancaOP_CAMINHOIMAGEM: TStringField;
    cdsSelTecladoExpBalancaOP_OPCAOLOCAL: TSmallintField;
    cdsSelTecladoExpBalancaOP_BARRAS: TStringField;
    cdsItens_OS_PecasFUNCIONARIO: TIntegerField;
    dspCtrlNotas: TDataSetProvider;
    cdsCtrlNotas: TClientDataSet;
    cdsCtrlNotasCTRL_NOTAS: TIntegerField;
    cdsCtrlNotasDATA_ENTRADA: TDateField;
    cdsCtrlNotasFILIAL: TIntegerField;
    cdsCtrlNotasFORNECEDOR: TIntegerField;
    cdsCtrlNotasNUMERO_DOCUMENTO: TStringField;
    cdsCtrlNotasVALOR_NOTA: TBCDField;
    cdsCtrlNotasVALOR_ICMS: TBCDField;
    cdsCtrlNotasVALOR_DEVOLUCAO: TBCDField;
    cdsCtrlNotasVALOR_BRINDE: TBCDField;
    cdsCtrlNotasVALOR_REMESSA: TBCDField;
    cdsCtrlNotasVALOR_IMOBILIZADO: TBCDField;
    cdsCtrlNotasTIPO_UTILIDADE: TIntegerField;
    cdsCtrlNotasDESCRICAO_TIPO_UTILIDADE: TStringField;
    cdsCtrlNotasSETOR: TIntegerField;
    cdsCtrlNotasDESCRICAO_SETOR: TStringField;
    cdsCtrlNotasOBSERVACAO: TStringField;
    cdsCtrlNotasRAZAO_SOCIAL: TStringField;
    dspTipoUtilCtrlNotas: TDataSetProvider;
    cdsTipoUtilCtrlNotas: TClientDataSet;
    cdsTipoUtilCtrlNotasTIPO_UTIL_CTRL_NOTAS: TIntegerField;
    cdsTipoUtilCtrlNotasDESCRICAO: TStringField;
    cdsSetorCtrlNotas: TClientDataSet;
    dspSetorCtrlNotas: TDataSetProvider;
    cdsSetorCtrlNotasSETOR_CTRL_NOTAS: TIntegerField;
    cdsSetorCtrlNotasDESCRICAO: TStringField;
    cdsReferenciaFornecedor: TClientDataSet;
    dspReferenciaFornecedor: TDataSetProvider;
    cdsReferenciaFornecedorREFERENCIAFORNECEDOR: TIntegerField;
    cdsReferenciaFornecedorFORNECEDOR: TIntegerField;
    cdsReferenciaFornecedorREFERENCIA: TStringField;
    cdsReferenciaFornecedorPRODUTO: TIntegerField;
    cdsReferenciaFornecedorNOME_FORNECEDOR: TStringField;
    cdsReferenciaFornecedorNOME_PRODUTO: TStringField;
    cdsCFOP_CFPSREMESSA: TSmallintField;
    dspCtrlModulos: TDataSetProvider;
    cdsCtrlModulos: TClientDataSet;
    cdsCtrlModulosNOME_MODULO: TStringField;
    cdsCtrlModulosCTRL_MODULOS: TIntegerField;
    cdsParametros_NFESSL_LIB: TSmallintField;
    cdsParametros_NFECRYPT_LIB: TSmallintField;
    cdsParametros_NFEHTTP_LIB: TSmallintField;
    cdsParametros_NFEXMLSIGN_LIB: TSmallintField;
    cdsParametros_NFEMODELO_CERTIFICADO: TSmallintField;
    cdsParametros_NFECAMINHO_CERTIFICADO: TStringField;
    cdsParametros_NFESSL_TYPE: TSmallintField;
    cdsParametros_NFESENHA_CERTIFICADO: TStringField;
    cdsParametros_NFEVERSAO_NFE: TSmallintField;
    cdsNFSaidaINDICADOR_IE_DESTINATARIO: TSmallintField;
    dspParamIntegraPDV: TDataSetProvider;
    cdsParamIntegraPDV: TClientDataSet;
    cdsParamIntegraPDVMODELO_PDV: TSmallintField;
    cdsParamIntegraPDVTIPO_INTEGRACAO_EXPORTACAO: TSmallintField;
    cdsParamIntegraPDVTIPO_INTEGRACAO_IMPORTACAO: TSmallintField;
    cdsParamIntegraPDVARREDONDA_TRUNCA: TSmallintField;
    cdsParamIntegraPDVPASTA_EXPORTACAO: TStringField;
    cdsParamIntegraPDVPASTA_IMPORTACAO: TStringField;
    cdsParamIntegraPDVARQUIVO_PRODUTOS: TStringField;
    cdsParamIntegraPDVARQUIVO_COD_BARRAS: TStringField;
    cdsParamIntegraPDVARQUIVO_MONTAGEM_KIT: TStringField;
    cdsParamIntegraPDVARQUIVO_CLIENTES: TStringField;
    cdsParamIntegraPDVARQUIVO_AUTORIZADOS_CLIENTE: TStringField;
    cdsParamIntegraPDVARQUIVO_LISTA_NEGRA: TStringField;
    cdsParamIntegraPDVARQUIVO_VENDEDOR: TStringField;
    cdsParamIntegraPDVARQUIVO_COFINS: TStringField;
    cdsParamIntegraPDVARQUIVO_COFINS_ST: TStringField;
    cdsParamIntegraPDVARQUIVO_ICMS: TStringField;
    cdsParamIntegraPDVARQUIVO_IMPOSTO_IMPORTACAO: TStringField;
    cdsParamIntegraPDVARQUIVO_IPI: TStringField;
    cdsParamIntegraPDVARQUIVO_ISSQN: TStringField;
    cdsParamIntegraPDVARQUIVO_PIS: TStringField;
    cdsParamIntegraPDVARQUIVO_PIS_ST: TStringField;
    cdsParamIntegraPDVARQUIVO_TRANSPORTADORAS: TStringField;
    cdsParamIntegraPDVARQUIVO_FORMA_PAGAMENTO: TStringField;
    cdsParamIntegraPDVARQUIVO_PLANO_PAGAMENTO: TStringField;
    cdsParamIntegraPDVARQUIVO_ADMINISTRADORAS_CARTAO: TStringField;
    cdsParamIntegraPDVARQUIVO_PERGUNTAS_LISTA_VEZ: TStringField;
    cdsParamIntegraPDVARQUIVO_MOTIVO_CANCELAMENTO: TStringField;
    cdsParamIntegraPDVARQUIVO_MOTIVO_DESCONTO: TStringField;
    cdsParamIntegraPDVARQUIVO_MOTIVO_DEVOLUCAO: TStringField;
    cdsParamIntegraPDVARQUIVO_OPERADORES: TStringField;
    cdsParamIntegraPDVARQUIVO_NCM: TStringField;
    cdsParamIntegraPDVARQUIVO_PRE_VENDA: TStringField;
    cdsParamIntegraPDVARQUIVO_RESPOSTA_PRE_VENDA: TStringField;
    cdsParamIntegraPDVARQUIVO_KARDEX: TStringField;
    cdsParamIntegraPDVARQUIVO_ATUALIZACAO_PRECO: TStringField;
    cdsParamIntegraPDVARQUIVO_CEST: TStringField;
    cdsParamIntegraPDVARQUIVO_ANP: TStringField;
    cdsParamIntegraPDVARQUIVO_TRANSPORTADORA_VEICULOS: TStringField;
    cdsSelProdExpPdvOP_COMPLEMENTO: TStringField;
    cdsSelProdExpPdvOP_DESCRICAO_GRUPO: TStringField;
    cdsSelProdExpPdvOP_CODIGO_ANP: TStringField;
    cdsSelCliExportacaoOP_ATIVO: TSmallintField;
    cdsCfgConexaoZeusRetailMODELO_PDV: TSmallintField;
    cdsCfgConexaoZeusRetailTIPO_SERVIDOR: TStringField;
    cdsPesqProdutosCEST: TStringField;
    cdsItemNFSaidaQUANTIDADE: TBCDField;
    cdsItemNFSaidaVALORUNITARIO: TFloatField;
    cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL: TFloatField;
    cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO: TSmallintField;
    cdsConfiguracoesPATH_LIVE_UPDATE: TStringField;
    cdsClientesEND_ENTR_COBR_IGUAL_END: TSmallintField;
    cdsCFOP_CFPSCOD_CTA: TStringField;
    dspSped_R0500: TDataSetProvider;
    cdsSped_R0500: TClientDataSet;
    cdsSped_R0500COD_CTA: TStringField;
    cdsSped_R0500NOME_CTA: TStringField;
    cdsSped_R0500DATA_CADASTRO: TDateField;
    cdsSped_R0500COD_NAT_CC: TStringField;
    cdsSped_R0500IND_CTA: TStringField;
    cdsSped_R0500NIVEL: TIntegerField;
    cdsSped_R0500COD_CTA_REFER: TStringField;
    cdsSped_R0500CNPJ_EST: TStringField;
    cdsCtrlNotasTIPO_LANCAMENTO: TSmallintField;
    cdsCtrlNotasUSUARIO_DUPLICADOR: TStringField;
    cdsCtrlNotasS_TIPO_LANCAMENTO: TStringField;
    dspParticipantes: TDataSetProvider;
    cdsParticipantes: TClientDataSet;
    cdsParticipantesPARTICIPANTE: TIntegerField;
    cdsParticipantesFILIAL: TIntegerField;
    cdsParticipantesATIVO: TSmallintField;
    cdsParticipantesSTATUS_CREDITO: TSmallintField;
    cdsParticipantesTIPO_EMPRESA: TStringField;
    cdsParticipantesSITUACAO_EMPRESA: TStringField;
    cdsParticipantesDATA_NASCIMENTO: TDateField;
    cdsParticipantesDATA_ABERTURA: TDateField;
    cdsParticipantesDATA_CADASTRO: TDateField;
    cdsParticipantesDATA_ENCERRAMENTO: TDateField;
    cdsParticipantesNOME_RAZAO_SOCIAL: TStringField;
    cdsParticipantesNOME_FANTASIA: TStringField;
    cdsParticipantesRG_IE: TStringField;
    cdsParticipantesPESSOA_FISICA_JURIDICA: TSmallintField;
    cdsParticipantesINSCRICAO_MUNICIPAL: TStringField;
    cdsParticipantesINSCRICAO_SUFRAMA: TStringField;
    cdsParticipantesCRT: TSmallintField;
    cdsParticipantesCNAE_PRINCIPAL: TStringField;
    cdsParticipantesCNAE_SECUNDARIOS: TMemoField;
    cdsParticipantesCODIGO_PAIS: TIntegerField;
    cdsParticipantesTIPO_LOGRADOURO: TSmallintField;
    cdsParticipantesENDERECO: TStringField;
    cdsParticipantesNUMERO: TStringField;
    cdsParticipantesCOMPLEMENTO: TStringField;
    cdsParticipantesBAIRRO: TStringField;
    cdsParticipantesCODIGO_MUNICIPIO: TIntegerField;
    cdsParticipantesCEP: TStringField;
    cdsParticipantesESTADO: TStringField;
    cdsParticipantesCONTATO: TStringField;
    cdsParticipantesDDD: TStringField;
    cdsParticipantesTELEFONE1: TStringField;
    cdsParticipantesTELEFONE2: TStringField;
    cdsParticipantesCELULAR: TStringField;
    cdsParticipantesUSAR_ENDERECOS_IGUAIS: TSmallintField;
    cdsParticipantesENDERECO_ENTREGA: TStringField;
    cdsParticipantesNUMERO_ENTREGA: TStringField;
    cdsParticipantesCOMPLEMENTO_ENTREGA: TStringField;
    cdsParticipantesBAIRRO_ENTREGA: TStringField;
    cdsParticipantesCODIGO_MUNICIPIO_ENTREGA: TIntegerField;
    cdsParticipantesCEP_ENTREGA: TStringField;
    cdsParticipantesESTADO_ENTREGA: TStringField;
    cdsParticipantesENDERECO_COBRANCA: TStringField;
    cdsParticipantesNUMERO_COBRANCA: TStringField;
    cdsParticipantesCOMPLEMENTO_COBRANCA: TStringField;
    cdsParticipantesBAIRRO_COBRANCA: TStringField;
    cdsParticipantesCODIGO_MUNICIPIO_COBRANCA: TIntegerField;
    cdsParticipantesCEP_COBRANCA: TStringField;
    cdsParticipantesESTADO_COBRANCA: TStringField;
    cdsParticipantesGARANTIDOR_OS: TSmallintField;
    cdsParticipantesPRODUTOR_RURAL: TSmallintField;
    cdsParticipantesTIPO_INSCRICAO_FEDERAL: TSmallintField;
    cdsParticipantesINSCRICAO_PRODUTOR: TIntegerField;
    cdsParticipantesCONTRIBUINTE_ICMS: TSmallintField;
    cdsParticipantesINSCR_ESTADUAL_SUBST_TRIB: TStringField;
    cdsParticipantesPIS_PASEP: TStringField;
    cdsParticipantesWEB_SITE: TStringField;
    cdsParticipantesEMAIL: TStringField;
    cdsParticipantesOBSERVACAO: TMemoField;
    cdsParticipantesRENDA: TBCDField;
    cdsParticipantesLIMITE_CREDITO: TBCDField;
    cdsParticipantesSALDO_DEVEDOR: TBCDField;
    cdsParticipantesCODIGO_ATIVIDADE_FEDERAL: TStringField;
    cdsParticipantesCODIGO_ATIVIDADE_ESTADUAL: TStringField;
    cdsParticipantesCODIGO_ATIVIDADE_MUNICIPAL: TStringField;
    cdsParticipantesCODIGO_UNIFICACAO: TIntegerField;
    cdsParticipantesPONTO_REFERENCIA: TStringField;
    cdsParticipantesPONTO_REFERENCIA_ENTREGA: TStringField;
    cdsParticipantesPONTO_REFERENCIA_COBRANCA: TStringField;
    cdsParticipantesNOMECIDADE: TStringField;
    cdsParticipantesNOMEESTADO: TStringField;
    cdsParticipantesMUNICIPIO_IBGE: TIntegerField;
    cdsParticipantesCODIGO_ESTADO_IBGE: TIntegerField;
    cdsParticipantesVENDEDOR: TIntegerField;
    cdsParticipantesCNPJ_CPF_CEI: TStringField;
    dspTipoLogradouro: TDataSetProvider;
    cdsTipoLogradouro: TClientDataSet;
    cdsTipoLogradouroTIPO_LOGRADOURO: TIntegerField;
    cdsTipoLogradouroSIGLA: TStringField;
    cdsTipoLogradouroDESCRICAO: TStringField;
    dspRegimeTributario: TDataSetProvider;
    cdsRegimeTributario: TClientDataSet;
    cdsRegimeTributarioREGIMETRIBUTARIO: TIntegerField;
    cdsRegimeTributarioDESCRICAO: TStringField;
    cdsFilialUTILIZA_NFCE: TSmallintField;
    cdsParticipantesCLIENTE_FORNECEDOR: TIntegerField;
    cdsParticipantesPERMITE_VENDA_STATUS_BLOQUEADO: TSmallintField;
    cdsParticipantesDESCONTO_PERSONALIZADO: TBCDField;
    cdsParticipantesLIMITE_DISPONIVEL: TCurrencyField;
    dspParametrosNFCe: TDataSetProvider;
    cdsParametrosNFCe: TClientDataSet;
    cdsParametrosNFCeLOJA: TIntegerField;
    cdsParametrosNFCeNOME_TERMINAL: TStringField;
    cdsParametrosNFCeULTIMA_NFCE_IMPRESSA: TIntegerField;
    cdsParametrosNFCeSERIE_NFCE: TSmallintField;
    cdsParametrosNFCeHOMOLOGACAO_PRODUCAO_CSC: TSmallintField;
    cdsParametrosNFCeCSC: TStringField;
    cdsParametrosNFCeMODELO_IMPRESSORA: TSmallintField;
    cdsParametrosNFCePORTA_IMPRESSORA: TStringField;
    cdsParametrosNFCeVELOCIDADE_PORTA_IMPRESSORA: TIntegerField;
    cdsParametrosNFCeIGNORAR_TAGS_FORMATACAO: TSmallintField;
    cdsParametrosNFCeIMPRIMIR_ITEM_UMA_LINHA: TSmallintField;
    cdsParametrosNFCeIMPR_DESCONTO_ACRESCIMO_ITEM: TSmallintField;
    cdsParametrosNFCeQTD_LINHAS_ENTRE_CUPOM: TSmallintField;
    cdsParametrosNFCeIMPRIMIR_CUPOM_RESUMIDO: TSmallintField;
    cdsConfiguracoesBUSCA_CEP: TIntegerField;
    cdsPesqFornecedor: TClientDataSet;
    cdsPesqFornecedorFORNECEDOR: TIntegerField;
    cdsPesqFornecedorRAZAOSOCIAL: TStringField;
    cdsPesqFornecedorFANTASIA: TStringField;
    cdsPesqFornecedorCNPJ: TStringField;
    cdsPesqFornecedorINSCRICAO: TStringField;
    cdsPesqFornecedorCADASTRO: TDateField;
    cdsPesqFornecedorENDERECO: TStringField;
    cdsPesqFornecedorNUMERO: TIntegerField;
    cdsPesqFornecedorCEP: TStringField;
    cdsPesqFornecedorBAIRRO: TStringField;
    cdsPesqFornecedorESTADO: TStringField;
    cdsPesqFornecedorDDD: TStringField;
    cdsPesqFornecedorTELEFONE1: TStringField;
    cdsPesqFornecedorTELEFONE2: TStringField;
    cdsPesqFornecedorFAX: TStringField;
    cdsPesqFornecedorCOMPLEMENTO: TStringField;
    cdsPesqFornecedorCONTATO: TStringField;
    cdsPesqFornecedorHTTP: TStringField;
    cdsPesqFornecedorEMAIL: TStringField;
    cdsPesqFornecedorTIPO: TSmallintField;
    cdsPesqFornecedorOBSERVACAO: TMemoField;
    cdsPesqFornecedorULTIMOPEDIDO: TIntegerField;
    cdsPesqFornecedorDATAULTIMOPEDIDO: TDateField;
    cdsPesqFornecedorVALORULTIMOPEDIDO: TBCDField;
    cdsPesqFornecedorULTIMANF: TStringField;
    cdsPesqFornecedorDATAULTIMANF: TDateField;
    cdsPesqFornecedorVALORULTIMANF: TBCDField;
    cdsPesqFornecedorRAMODEATIVIDADE: TSmallintField;
    cdsPesqFornecedorCIDADE: TIntegerField;
    cdsPesqFornecedorATACADISTAREGIMEESPECIAL: TSmallintField;
    cdsPesqFornecedorREPRESENTANTE: TStringField;
    cdsPesqFornecedorOPTANTE_SIMPLES: TSmallintField;
    cdsPesqFornecedorAPROVEITA_DESCONTO_ITEM_NF: TIntegerField;
    cdsPesqFornecedorPAIS: TIntegerField;
    cdsPesqFornecedorINSCRICAO_SUFRAMA: TStringField;
    dspPesqFornecedor: TDataSetProvider;
    cdsUltimaNFSaidaPart: TClientDataSet;
    cdsUltimaNFSaidaPartNFSAIDA: TIntegerField;
    cdsUltimaNFSaidaPartEMISSAO: TDateField;
    cdsUltimaNFSaidaPartSAIDA: TDateField;
    cdsUltimaNFSaidaPartVALORDOSPRODUTOS: TBCDField;
    cdsUltimaNFSaidaPartVALORDANOTA: TBCDField;
    dspUltimaNFSaidaPart: TDataSetProvider;
    cdsSelProdExpPdvOP_CST_PIS: TIntegerField;
    cdsSelProdExpPdvOP_CST_COFINS: TIntegerField;
    cdsConfiguracoesCONSULTAR_CNPJ_CPF_RFB_SEFAZ: TSmallintField;
    dspTabelaCEST: TDataSetProvider;
    cdsTabelaCEST: TClientDataSet;
    cdsTabelaCESTCEST: TStringField;
    cdsTabelaCESTNCM: TStringField;
    cdsTabelaCESTDESCRICAO: TStringField;
    dspSelecionaTabelaLOG: TDataSetProvider;
    cdsSelecionaTabelaLOG: TClientDataSet;
    cdsSelecionaTabelaLOGTABELA_MODULO: TStringField;
    cdsLogSys: TClientDataSet;
    dspLogSys: TDataSetProvider;
    cdsLogSysOP_DATA: TDateField;
    cdsLogSysOP_HORA: TTimeField;
    cdsLogSysOP_TABELA_MODULO: TStringField;
    cdsLogSysOP_OPERACAO: TSmallintField;
    cdsLogSysOP_COMPUTADOR: TStringField;
    cdsLogSysOP_NUMERO_IP: TStringField;
    cdsLogSysOP_LOG: TMemoField;
    cdsLogSysOP_FOTO: TBlobField;
    cdsLogSysOP_NOME_USUARIO: TStringField;
    cdsLogSysOP_LOG_ERRO: TMemoField;
    cdsLogSysS_OPERACAO: TStringField;
    procedure cdsEstadosAfterOpen(DataSet: TDataSet);
    procedure cdsCidadesAfterOpen(DataSet: TDataSet);
    procedure cdsEstadosNewRecord(DataSet: TDataSet);
    procedure cdsCidadesNewRecord(DataSet: TDataSet);
    procedure cdsFilialNewRecord(DataSet: TDataSet);
    procedure cdsUsuariosNewRecord(DataSet: TDataSet);
    procedure cdsCFOP_CFPSNewRecord(DataSet: TDataSet);
    procedure cdsCFOP_CFPSCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsAdministradorasNewRecord(DataSet: TDataSet);
    procedure cdsConfigECFNewRecord(DataSet: TDataSet);
    procedure cdsFuncionariosNewRecord(DataSet: TDataSet);
    procedure cdsCtrlCartoesNewRecord(DataSet: TDataSet);
    procedure cdsCtrlCartoesCalcFields(DataSet: TDataSet);
    procedure cdsNFEntradaCalcFields(DataSet: TDataSet);
    procedure cdsNFEntradaNewRecord(DataSet: TDataSet);
    procedure cdsNFEntradaEMISSAOSetText(Sender: TField; const Text: string);
    procedure cdsParcelasNFENewRecord(DataSet: TDataSet);
    procedure cdsConhecimentoFreteNewRecord(DataSet: TDataSet);
    procedure cdsProdutoFilialCalcFields(DataSet: TDataSet);
    procedure cdsDesdobRentabilCalcFields(DataSet: TDataSet);
    procedure cdsApoioInventarioCalcFields(DataSet: TDataSet);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure cdsSituacoes_OSNewRecord(DataSet: TDataSet);
    procedure cdsOrdemServicoNewRecord(DataSet: TDataSet);
    procedure cdsItens_OS_PecasNewRecord(DataSet: TDataSet);
    procedure cdsItens_OS_servicoNewRecord(DataSet: TDataSet);
    procedure cdsAgendaNewRecord(DataSet: TDataSet);
    procedure cdsServicosNewRecord(DataSet: TDataSet);
    procedure cdsItens_OS_servicoCalcFields(DataSet: TDataSet);
    procedure cdsHistorico_OSNewRecord(DataSet: TDataSet);
    procedure cdsItens_OS_PecasCalcFields(DataSet: TDataSet);
    procedure cdsPerdasNewRecord(DataSet: TDataSet);
    procedure cdsItensPerdasNewRecord(DataSet: TDataSet);
    procedure cdsNcmNbsNewRecord(DataSet: TDataSet);
    procedure cdsParcelasOSNewRecord(DataSet: TDataSet);
    procedure cdsProducaoNewRecord(DataSet: TDataSet);
    procedure cdsItemProducaoNewRecord(DataSet: TDataSet);
    procedure cdsItemProducaoCalcFields(DataSet: TDataSet);
    procedure cdsProducaoCalcFields(DataSet: TDataSet);
    procedure cdsPesqProdutosCalcFields(DataSet: TDataSet);
    procedure cdsFornecedorNewRecord(DataSet: TDataSet);
    procedure cdsAlmoxarifadoNewRecord(DataSet: TDataSet);
    procedure cdsItemAlmoxarifadoNewRecord(DataSet: TDataSet);
    procedure cdsAlmoxarifadoCalcFields(DataSet: TDataSet);
    procedure cdsPedidoZeusNewRecord(DataSet: TDataSet);
    procedure cdsItemPedZeusNewRecord(DataSet: TDataSet);
    procedure cdsItemPedZeusCalcFields(DataSet: TDataSet);
    procedure cdsEndEntregaPedZeusNewRecord(DataSet: TDataSet);
    procedure cdsFinalizadoraPedZeusNewRecord(DataSet: TDataSet);
    procedure cdsPedidoZeusCalcFields(DataSet: TDataSet);
    procedure cdsCaixaLojaCalcFields(DataSet: TDataSet);
    procedure cdsCaixaLojaNewRecord(DataSet: TDataSet);
    procedure cdsItemCaixaLojaCalcFields(DataSet: TDataSet);
    procedure cdsUndMedidaNewRecord(DataSet: TDataSet);
    procedure cdsOrdemServicoCalcFields(DataSet: TDataSet);
    procedure cdsConfigBuscaCEPNewRecord(DataSet: TDataSet);
    procedure cdsOrdemProducaoNewRecord(DataSet: TDataSet);
    procedure cdsOrdemProducaoCalcFields(DataSet: TDataSet);
    procedure cdsItemOrdemProducaoNewRecord(DataSet: TDataSet);
    procedure cdsNFSaidaNewRecord(DataSet: TDataSet);
    procedure cdsItemNFSaidaNewRecord(DataSet: TDataSet);
    procedure cdsCFOP_NFSaidaNewRecord(DataSet: TDataSet);
    procedure cdsParcelasNFSNewRecord(DataSet: TDataSet);
    procedure cdsTransportadoraNFSNewRecord(DataSet: TDataSet);
    procedure cdsExpoirtacaoNFSNewRecord(DataSet: TDataSet);
    procedure cdsDocumentoRef_NFSNewRecord(DataSet: TDataSet);
    procedure cdsNFSaidaCalcFields(DataSet: TDataSet);
    procedure cdsEndRetiradaNFSNewRecord(DataSet: TDataSet);
    procedure cdsEndEntregaNFSNewRecord(DataSet: TDataSet);
    procedure cdsMVANewRecord(DataSet: TDataSet);
    procedure cdsItemNFSaidaAfterPost(DataSet: TDataSet);
    procedure cdsDocumentoRef_NFSCalcFields(DataSet: TDataSet);
    procedure cdsCupomFiscalRefNFSNewRecord(DataSet: TDataSet);
    procedure cdsFCP_EstadosNewRecord(DataSet: TDataSet);
    procedure cdsFCP_EstadosCalcFields(DataSet: TDataSet);
    procedure cdsEquipamentosNewRecord(DataSet: TDataSet);
    procedure cdsLivroFiscalSaidaNewRecord(DataSet: TDataSet);
    procedure cdsProdutosNewRecord(DataSet: TDataSet);
    procedure cdsProdutoFilialNewRecord(DataSet: TDataSet);
    procedure cdsProdutosAfterEdit(DataSet: TDataSet);
    procedure cdsFretePedidoVendaNewRecord(DataSet: TDataSet);
    procedure cdsDeslocamentoOSNewRecord(DataSet: TDataSet);
    procedure cdsConfig_financeiroNewRecord(DataSet: TDataSet);
    procedure cdsDeslocamentoOSCalcFields(DataSet: TDataSet);
    procedure cdsCtrlNotasNewRecord(DataSet: TDataSet);
    procedure cdsTipoUtilCtrlNotasNewRecord(DataSet: TDataSet);
    procedure cdsReferenciaFornecedorNewRecord(DataSet: TDataSet);
    procedure cdsParamIntegraPDVNewRecord(DataSet: TDataSet);
    procedure cdsClientesNewRecord(DataSet: TDataSet);
    procedure cdsCtrlNotasCalcFields(DataSet: TDataSet);
    procedure cdsParticipantesNewRecord(DataSet: TDataSet);
    procedure cdsParticipantesCNPJ_CPF_CEIGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsParticipantesCalcFields(DataSet: TDataSet);
    procedure cdsTipoLogradouroNewRecord(DataSet: TDataSet);
    procedure cdsLogSysCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    iContaItem:integer;
    procedure CalcularNFE(cProdSemDesconto: Currency; bDescBaseIcms: Boolean; loja: smallint);
    procedure RelacionarOS_Equipamento(pEquipamento:integer);
    procedure AbrirTabelaFilial;
    procedure AbrirTabelaUsuarios;
    procedure AbrirTabelaEstados;
    procedure RelacionarItens_Perdas(pPerdas: integer);
    procedure CalcularTotaisProducao(pProducao:integer);
    procedure AbrirTabelaDiasFormaPagto;
    procedure AbrirTabelaParcelasPedidoZeus(pPedido, pParcelasPedZeus:integer);
    procedure RelacionarItem_OrdemProducao(pOrdemProducao, pFilial:integer);
    function ValidarUsuarioMaster:boolean;
    function CarregarConfigIni:boolean;

  end;

var
  dmMProvider: TdmMProvider;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dataDBEXMaster, uConstantes_Padrao, uFuncoes, dataMSProcedure, dataMRelatorios;


{$R *.dfm}

procedure TdmMProvider.AbrirTabelaDiasFormaPagto;
begin

  cdsDiasFormaPagto.Close;
  dmDBEXMaster.fdqDiasFormaPagto.SQL.Clear;
  dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('SELECT * FROM  DIASFORMAPAGAMENTO');
  dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('WHERE FORMAPAGAMENTO = ' + IntToStr(cdsFormasPagamento.FieldByName('FORMAPAGAMENTO').Value));
  dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('ORDER BY DIASFORMAPAGAMENTO');
  cdsDiasFormaPagto.Open;

end;

procedure TdmMProvider.AbrirTabelaEstados;
begin

  dmMProvider.cdsEstados.Close;
  dmMProvider.cdsEstados.ProviderName := 'dspEstados';

  dmDBEXMaster.fdqEstados.SQL.Clear;
  dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
  dmDBEXMaster.fdqEstados.SQL.Add('order by sigla');

  dmMProvider.cdsEstados.Open;
  dmMProvider.cdsEstados.ProviderName := '';

end;

procedure TdmMProvider.AbrirTabelaFilial;
begin

  cdsFilial.Close;
  cdsFilial.ProviderName := 'dspFilial';

  dmDBEXMaster.fdqFilial.SQL.Clear;
  dmDBEXMaster.fdqFilial.SQL.Add('SELECT FILIAL.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
  dmDBEXMaster.fdqFilial.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
  dmDBEXMaster.fdqFilial.SQL.Add('FROM FILIAL FILIAL');
  dmDBEXMaster.fdqFilial.SQL.Add('JOIN CIDADES CIDADES');
  dmDBEXMaster.fdqFilial.SQL.Add('ON(CIDADES.CIDADE = FILIAL.CIDADE)');
  dmDBEXMaster.fdqFilial.SQL.Add('JOIN ESTADOS ESTADOS');
  dmDBEXMaster.fdqFilial.SQL.Add('ON(ESTADOS.SIGLA = FILIAL.ESTADO)');
  dmDBEXMaster.fdqFilial.SQL.Add('where filial.filial = ' + IntToStr(dmDBEXMaster.iIdFilial));

  cdsFilial.Open;
  cdsFilial.ProviderName := '';

end;

procedure TdmMProvider.AbrirTabelaParcelasPedidoZeus(pPedido,  pParcelasPedZeus: integer);
begin

  dmMProvider.cdsParcelasPedZeus.Close;
  dmMProvider.cdsParcelasPedZeus.ProviderName := 'dspParcelasPedZeus';

  dmDBEXMaster.fdqParcelasPedZeus.SQL.Clear;
  dmDBEXMaster.fdqParcelasPedZeus.SQL.Add('select * from parcelas_pedido_zeus');
  dmDBEXMaster.fdqParcelasPedZeus.SQL.Add('where codigo_pedido = ' + IntToStr(pPedido));

  if pParcelasPedZeus > 0 then
    dmDBEXMaster.fdqParcelasPedZeus.SQL.Add('and parcelas_pedido_zeus = ' + IntToStr(pParcelasPedZeus));

  dmDBEXMaster.fdqParcelasPedZeus.SQL.Add('order by parcelas_pedido_zeus');
  dmMProvider.cdsParcelasPedZeus.Open;
  dmMProvider.cdsParcelasPedZeus.ProviderName := '';


end;

procedure TdmMProvider.AbrirTabelaUsuarios;
begin

  cdsUsuarios.Close;
  cdsUsuarios.ProviderName := 'dspUsuarios';

  dmDBEXMaster.fdqUsuarios.SQL.Clear;
  dmDBEXMaster.fdqUsuarios.SQL.Add('SELECT * FROM USUARIOS');
  dmDBEXMaster.fdqUsuarios.SQL.Add('where usuario = ' + IntToStr(dmDBEXMaster.iIdUsuario));

  cdsUsuarios.Open;
  cdsUsuarios.ProviderName := '';

end;

procedure TdmMProvider.CalcularNFE(cProdSemDesconto: Currency; bDescBaseIcms: Boolean; loja: smallint);
var
  cFrete, cSeguro, cSeguroProd, cDespAcess,
    cIPI, cIcms, cIcmsR, cTotalIcmsR, cDescontogeral,
    cBaseIcmsProd, cBaseIcms, LucroMaxIcmsRet, PercReducao: Currency;
  p_DataDoLancamento: TdateTime;
  p_custoBruto, p_valorDoDesconto, p_percentualDeDesconto,
    p_valorDoFrete, p_percentualDeFrete, p_valorDeOutrosCustos,
    p_PercentualDeOutrosCustos,
    p_percentualDeIPI, p_valorDoIpi, p_valorIcmsR, p_percentualDeCreditoIcms,
    p_valorDoCreditoDeIcms, cSubTotalItem, cBaseTotalIcms, cTotalIcms,
    cCustoB: currency;
begin
{
  cdsItem_NFEntrada.First;
  cdsItem_NFEntrada.DisableControls;

  //verificar necessidade
  //dmmaster.IBDFornecedores.Locate('fornecedor',  dmmaster.IBDNFEntradaFORNECEDOR.Value, []);

  case dmMProvider.cdsConfiguracoesTIPOCLD.Value of
    0:begin

        while not cdsItem_NFEntrada.EOF do
        begin

          // primeiro passo
          // posiciona a tabela de custos
          dmDBEXMaster.ValidarPesquisaProduto(cdsItem_NFEntradaPRODUTO.Value);
          if dmDBEXMaster.ValidarPesquisaProduto_Filial(cdsItem_NFEntradaPRODUTO.Value) then
          begin

            // Totais do Produto
            P_DataDoLancamento  := date;

            // alterar para valor unitario/quant embalagem
            cCustoB             := (cdsItem_NFEntradaQUANTIDADE.Value *  cdsItem_NFEntradaVALORUNITARIO.Value);

            P_CustoBruto        := ((cCustoB / cdsItem_NFEntradaQUANTIDADE.Value) / cdsItem_NFEntradaUNIDADEEMBALAGEM.Value);

            if cdsNFEntradaDESCONTOGERAL.Value > 0 then
            begin

              if cdsNFEntradaRATEAR_DESCONTO.Value = 1 then
                P_ValordoDesconto := cdsItem_NFEntradaSUB_TOTAL.Value * (cdsNFEntradaDESCONTOGERAL.Value / cProdSemDesconto)

              else
                P_ValordoDesconto := cdsItem_NFEntradaVALOR_DESCONTO.Value;

            end
            else
              P_ValordoDesconto := cdsItem_NFEntradaVALOR_DESCONTO.Value;

            //calcula o valor do frete por produto
            if cdsNFEntradaVALORDOFRETE.Value > 0 then
            begin

              if (cdsNFEntradaFRETEAGREGADO.Value = 1) and (cdsItem_NFEntradaFRETE_RATEADO.Value = 0) then
              begin

                P_PercentualdeFrete := (cdsNFEntradaVALORDOFRETE.Value / cProdSemDesconto);
                P_valorDoFrete      := cdsItem_NFEntradaSUB_TOTAL.AsCurrency * (P_PercentualdeFrete /100)

              end
              else
              begin

                P_PercentualdeFrete := 0;
                P_valorDoFrete      := 0;

              end;

            end;

            //calcula o valor de outros custos por produto
            if (cdsNFEntradaOUTRASDESPESAS.Value > 0) and (cdsItem_NFEntradaENCARGOS.Value = 0) then
            begin

              P_PercentualdeOutrosCustos  := (cdsNFEntradaOUTRASDESPESAS.Value /  cProdSemDesconto);
              p_valorDeOutrosCustos       :=  cdsItem_NFEntradaSUB_TOTAL.Value  * P_PercentualdeOutrosCustos;

            end
            else
              P_PercentualdeOutrosCustos := 0;

            //armazena percentual de ipi em vari�vel
            P_PercentualdeIpi         := cdsItem_NFEntradaIPI.Value;

            //calcula o valor do ipi por produto
            P_ValordoIpi              := cdsItem_NFEntradaVALOR_IPI.Value;
            P_ValorICMSR              := 0;
            cSeguroProd               := ((cdsItem_NFEntradaSUB_TOTAL.Value * cdsNFEntradaVALORDOSEGURO.Value) / cProdSemDesconto);
            cBaseIcmsProd             := cdsItem_NFEntradaBASE_ICMS.Value;

            P_PercentualdeCreditoICMS :=  cdsItem_NFEntradaICMSENTRADA.Value;

            if cdsItem_NFEntradaCST.Value = 40 then
            begin

              P_PercentualdeCreditoICMS := 0;
              cBaseIcmsProd             := 0;

            end;

            // Reducao base de calculo
            if (cdsFornecedorATACADISTAREGIMEESPECIAL.Value = 1) and (cdsItem_NFEntradaCST.Value = 0) and (cdsItem_NFEntradaICMSENTRADA.Value = 17) then
            begin

              percReducao               := 7;
              cBaseIcmsProd             := cBaseIcmsProd * (percReducao / cdsItem_NFEntradaICMSENTRADA.Value);
              P_PercentualdeCreditoICMS := percReducao;

            end;

            cBaseIcmsProd := cBaseIcmsProd + cdsItem_NFEntradaBASE_ICMS.Value;

            if (cdsItem_NFEntradaCST.Value in [20, 220, 70]) then
            begin

              percReducao := 7;
              // fornecedor atacadista do estado
              // produtos com aliquota de 17%

              if (cdsFornecedorATACADISTAREGIMEESPECIAL.Value = 1)  and(cdsItem_NFEntradaICMSENTRADA.Value = 17) then
                percReducao := 7
              else if (percReducao = cdsItem_NFEntradaICMSENTRADA.Value) or (cdsItem_NFEntradaCST.Value = 70) or (percReducao = 0) then
                percReducao := 7;
              if cdsFornecedorATACADISTAREGIMEESPECIAL.Value = 0 then
                P_PercentualdeCreditoICMS := percReducao;

            end;

            P_ValordoCreditodeIcms := 0;

            // calcula o valor do credito de icms
            if ( cdsItem_NFEntradaCST.Value in [10, 30, 60, 70, 110,  210]) then
              P_ValordoCreditodeIcms := 0
            else if cdsItem_NFEntradaVALOR_ICMS.Value > 0 then
              P_ValordoCreditodeIcms := ((cBaseIcmsProd * cdsItem_NFEntradaICMSENTRADA.Value) / 100);

            cTotalIcms := cTotalIcms + cdsItem_NFEntradaVALOR_ICMS.Value;//

            // Calcular o Icms Retido com base na aliquota interna icms do produto inf na nota fiscal
            if (cdsItem_NFEntradaCST.Value in [10, 30, 60, 70, 110,  210]) and (cdsNFEntradaVALORSUBSTITUICAO.Value > 0) and (cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value = 0) then
            begin

              // divide proporcional o icmr
              LucroMaxIcmsRet := 0;

              if cBaseIcmsProd > 0 then
                P_ValorICMSR := ((cBaseIcmsProd * (1 + (LucroMaxIcmsRet / 100)) * (1 + (17 / 100)) - P_ValordoCreditodeIcms))
              else if (cBaseIcmsProd = 0) and (cdsNFEntradaVALORSUBSTITUICAO.Value > 0) then
                P_ValorICMSR := ((cdsItem_NFEntradaSUB_TOTAL.Value * (1 + (LucroMaxIcmsRet / 100)) * (1 + (17 / 100)) - P_ValordoCreditodeIcms));

              cIcmsR := cIcmsr + P_ValorICMSR;

            end;

            // Totais da Nota
            cDescontoGeral := cDescontoGeral + P_ValordoDesconto;

            if cdsNFEntradaDESCONTOGERAL.Value > 0 then
              P_ValordoDesconto := (P_ValordoDesconto / cdsItem_NFEntradaQUANTIDADE.Value) / cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;

            cFrete                := cFrete + P_ValordoFrete;
            P_ValordoFrete        := (P_ValordoFrete / cdsItem_NFEntradaQUANTIDADE.Value) / cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;
            cSeguro               := cSeguro + cSeguroProd;
            cDespAcess            := cDespAcess + P_ValordeOutrosCustos;
            P_ValordeOutrosCustos := (P_ValordeOutrosCustos / cdsItem_NFEntradaQUANTIDADE.Value) / cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;
            cIPI                  := cIPI + P_ValordoIpi;
            P_ValordoIpi          := (P_ValordoIpi / cdsItem_NFEntradaQUANTIDADE.Value) / cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;

            { aplica credito de icms }

{aqui            if not (cdsItem_NFEntradaCST.Value in [30, 60, 70]) or (cdsItem_NFEntradaCST.Value in [30, 10, 70, 110, 210]) then
            begin

              cBaseIcms               := cBaseIcms + cBaseIcmsProd;
              cIcms                   := cIcms + P_ValordoCreditodeICMS;
              P_ValordoCreditodeICMS  := (P_ValordoCreditodeICMS / cdsItem_NFEntradaQUANTIDADE.Value) / cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;

            end
            else
              cBaseIcms := cBaseIcms + cBaseIcmsProd;


            dmMaster.IBTProdutoFilial.Edit;
            dmMaster.IBTProdutoFilialCUSTOBRUTO.Value               := P_CustoBruto;
            dmMaster.IBTProdutoFilialVALORDODESCONTONACOMPRA.Value  := P_ValordoDesconto;
            dmMaster.IBTProdutoFilialDESCONTONACOMPRA.Value         := p_percentualDeDesconto;
            dmMaster.IBTProdutoFilialVALORDOFRETE.Value             := p_valorDoFrete;
            dmMaster.IBTProdutoFilialFRETE.Value                    := p_PercentualDeFrete;
            dmMaster.IBTProdutoFilialVALORDEOUTROSCUSTOS.Value      := p_valorDeOutrosCustos;
            dmMaster.IBTProdutoFilialOUTROSCUSTOS.Value             := p_percentualDeOutrosCustos;
            dmMaster.IBTProdutoFilialIPI.Value                      := p_percentualDeIPI;
            dmMaster.IBTProdutoFilialVALORDOIPI.Value               := p_valorDoIPI;
            dmMaster.IBTProdutoFilialVALORDOICMSR.Value             := p_valorIcmsR;
            dmMaster.IBTProdutoFilialCREDITODEICMS.Value            := 0;

                 //S� O NOME EST� ERRADO
            dmMaster.IBTProdutoFilialVALORDOCREDITODEICMSR.Value    := 0;

            dmMaster.IBTProdutoFilial.Post;
            P_ValordoDesconto := 0;

          end;
          if dmMaster.IBDItemNFEntradaCST.Value <> 60 then
            cBaseTotalIcms := cBaseTotalIcms + cBaseIcmsProd;
          dmmaster.IBDItemNFEntrada.Next;
        end;
        // fim do primeiro passo
        // Aplicar o Icms Retido com base no icms do produto + marg lucro
        if dmmaster.IBDNFEntradaVALORSUBSTITUICAO.Value > 0 then
        begin
          dmmaster.IBDItemNFEntrada.First;
          while not dmmaster.IBDItemNFEntrada.Eof do
          begin
            if (dmmaster.IBDItemNFEntradaCST.Value in [10, 30, 60, 70, 110, 210]) then
            begin
              dmDBEXMaster.Pesquisar_Produto(dmMaster.IBDItemNFEntradaPRODUTO.Value);

              if (cIcmsR > 0) then
              begin
                dmMaster.IBTProdutoFilial.Edit;

                dmMaster.IBTProdutoFilialVALORDOICMSR.Value :=
                  ((dmMaster.IBTProdutoFilialVALORDOICMSR.Value *
                  dmmaster.IBDNFEntradaVALORSUBSTITUICAO.Value) / cIcmsR);

                cTotalIcmsR := cTotalIcmsR +
                  dmMaster.IBTProdutoFilialVALORDOICMSR.Value;

                DecimalSeparator := '.';
                dmDBEXMaster.sspMaster.StoredProcName := 'EXECUTA_SQL';
                dmDBEXMaster.sspMaster.ParamByName('I_SQL').Value :=
                  'UPDATE ITEMNFENTRADA SET VALOR_SUBSTITUICAO = ' + FloatToStr(dmMaster.IBTProdutoFilialVALORDOICMSR.Value)
                  + ' WHERE ITEMNFENTRADA = ' + IntToStr(dmMaster.IBDItemNFEntradaITEMNFENTRADA.Value)
                  + ' AND PRODUTO = ' + IntToStr(dmMaster.IBDItemNFEntradaPRODUTO.Value);
                dmDBEXMaster.sspMaster.ExecProc;
                DecimalSeparator := ',';

                dmMaster.IBTProdutoFilialVALORDOICMSR.Value :=

                (dmMaster.IBTProdutoFilialVALORDOICMSR.Value /
                  dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
                  dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;
                dmMaster.IBTProdutoFilialVALORDOCREDITODEICMSR.Value := 0;

                // icms pago anteriormente
                dmMaster.IBTProdutoFilialICMSAPAGAR.Value := 0;
                dmMaster.IBTProdutoFilial.Post;

              end;
            end;
            dmmaster.IBDItemNFEntrada.Next;
          end;
        end;
        dmmaster.IBDItemNFEntrada.Close;
        dmmaster.IBDItemNFEntrada.Open;

        if not dmmaster.bImportandoDANFE then
        begin
        dmmaster.IBDNFEntrada.Edit;
        if dmMaster.IBDNFEntradaDESCONTOGERAL.Value > 0 then
          dmmaster.IBDNFEntradaDESCONTOGERALCALCULADO.Value := cDescontoGeral
        else
          dmmaster.IBDNFEntradaDESCONTOGERALCALCULADO.Value := 0;
        dmmaster.IBDNFEntradaVALORDOFRETECALCULADO.Value := cFrete;
        dmmaster.IBDNFEntradaVALORDOSEGUROCALCULADO.Value := cSeguro;
        dmmaster.IBDNFEntradaOUTRASDESPESASCALCULADO.Value := cDespAcess;

        if dmmaster.IBDNFEntradaBASEICMS.Value > 0 then
          dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value := cBaseIcms
            //cBaseIcmsProd
        else
          dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value := 0;
        if dmMaster.IBDNFEntradaVALORICMS.Value > 0 then
          dmmaster.IBDNFEntradaVALORICMSCALCULADO.Value := Trunc(cTotalIcms * 100) / 100 //cIcms
        else
          dmmaster.IBDNFEntradaVALORICMSCALCULADO.Value := 0;

        dmmaster.IBDNFEntradaVALORSUBSTITUICAOCALCULADO.Value := cTotalIcmsr;
        dmmaster.IBDNFEntradaVALORDOIPICALCULADO.Value := cIPI;

        if dmmaster.IBDNFEntradaVALORDOSPRODUTOS.Value =
          dmmaster.IBDNFEntradaVALORDANOTA.Value then
          cTotalIcmsr := 0;

        if dmmaster.IBDNFEntradaFRETEAGREGADO.Value = 0 then
          cFrete := 0;
        if dmmaster.IBDNFEntradaRATEAR_DESCONTO.Value = 1 then
          dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value := (cProdSemDesconto
            - dmmaster.IBDNFEntradaDESCONTOGERAL.Value)
            + cTotalIcmsr + cFrete
            + dmmaster.IBDNFEntradaVALORDOSEGUROCALCULADO.Value
            + dmmaster.IBDNFEntradaOUTRASDESPESASCALCULADO.Value
            + dmmaster.IBDNFEntradaVALORDOIPICALCULADO.Value
        else
        begin
          dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value := cProdSemDesconto
            + cTotalIcmsr + cFrete
            + dmmaster.IBDNFEntradaVALORDOSEGUROCALCULADO.Value
            + dmmaster.IBDNFEntradaOUTRASDESPESASCALCULADO.Value
            + dmmaster.IBDNFEntradaVALORDOIPICALCULADO.Value;
        end;
        if dmMaster.IBDNFEntradaSOMAR_ICMSR_VALORNOTA.Value = 0 then
          dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value := dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value - cTotalIcmsr;

        // Arredonda
        dmmaster.IBDNFEntradaVALORDANOTACALCULADO.AsString := Format('%7.2f',
          [dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value]);
        end;
      end;
    1:
      begin
        while not dmmaster.IBDItemNFEntrada.EOF do
        begin
          // primeiro passo
          // posiciona a tabela de custos

          if dmDBEXMaster.Pesquisar_Produto(dmMaster.IBDItemNFEntradaPRODUTO.Value) then
          begin

            // Totais do Produto
            P_DataDoLancamento := date;
            // alterar para valor unitario/quant embalagem
            P_CustoBruto := ((dmmaster.IBDItemNFEntradaSUB_TOTAL.Value /
              dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
              dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value);

            if dmmaster.IBDNFEntradaDESCONTOGERAL.Ascurrency > 0 then
            begin
              if dmMaster.IBDNFEntradaRATEAR_DESCONTO.Value = 1 then
                //calcula o valor do desconto por produto
                P_ValordoDesconto := ((dmmaster.IBDItemNFEntradaSUB_TOTAL.Value
                  * dmmaster.IBDNFEntradaDESCONTOGERAL.Ascurrency) / cProdSemDesconto)
              else
              {
                P_ValordoDesconto := (((dmmaster.IBDItemNFEntradaSUB_TOTAL.Value - dmMaster.IBDItemNFEntradaVALOR_DESCONTO.Value)
                  * dmmaster.IBDNFEntradaDESCONTOGERAL.Ascurrency) / 100);
              }
{aqui                P_ValordoDesconto := dmmaster.IBDItemNFEntradaVALOR_DESCONTO.Value;

            end
            else
            begin
              if dmMaster.IBDItemNFEntradaDESCONTO.Value > 0 then
              begin

                case dmMaster.iTipoDesconto of
                  0: //percentual
                    P_ValordoDesconto :=
                      (cCustoB / dmMaster.IBDItemNFEntradaQUANTIDADE.Value) *
                      (dmMaster.IBDItemNFEntradaDESCONTO.Value / 100);
                  1:
                    P_ValordoDesconto :=
                      dmMaster.IBDItemNFEntradaDESCONTO.Value;
                end;

              end;
            end;

            if dmMaster.IBDNFEntradaDESCONTOGERAL.Value > 0 then
            begin
              if dmMaster.IBDItemNFEntradaSUB_TOTAL.Value > 0 then
              begin
                if dmMaster.IBDNFEntradaRATEAR_DESCONTO.Value = 1 then
                  P_PercentualdeDesconto := (dmMaster.IBDNFEntradaDESCONTOGERAL.Value * 100) /
                    dmMaster.IBDNFEntradaVALORDOSPRODUTOS.Value
                else
                  P_PercentualdeDesconto := (dmmaster.IBDNFEntradaDESCONTOGERAL.Ascurrency / dmmaster.IBDNFEntradaVALORDOSPRODUTOS.Ascurrency) * 100 ;
              end;
            end
            else
            begin
              if dmMaster.IBDItemNFEntradaDESCONTO.Value > 0 then
                P_PercentualdeDesconto :=
                  dmmaster.IBDItemNFEntradaDESCONTO.Value
              else if dmMaster.IBDItemNFEntradaVALOR_DESCONTO.Value > 0 then
              begin
                P_PercentualdeDesconto :=
                  (dmMaster.IBDItemNFEntradaVALOR_DESCONTO.Value / dmMaster.IBDItemNFEntradaSUB_TOTAL.Value) * 100;
                P_ValordoDesconto := dmMaster.IBDItemNFEntradaVALOR_DESCONTO.Value;
              end;
            end;

            //calcula o valor do frete por produto
            if dmMaster.IBDItemNFEntradaSUB_TOTAL.Value > 0 then
              P_ValordoFrete := ((dmmaster.IBDItemNFEntradaSUB_TOTAL.Value *
                dmmaster.IBDNFEntradaVALORDOFRETE.AsCurrency) / cProdSemDesconto);

            //calcula o percentual do frete por produto
            if dmMaster.IBDItemNFEntradaSUB_TOTAL.Value > 0 then
              P_PercentualdeFrete := (P_ValordoFrete * 100) /
                dmmaster.IBDItemNFEntradaSUB_TOTAL.AsCurrency;

            //calcula o valor de outros custos por produto
            if dmMaster.IBDItemNFEntradaSUB_TOTAL.Value > 0 then
              P_ValordeOutrosCustos := ((dmmaster.IBDItemNFEntradaSUB_TOTAL.Value
                * dmmaster.IBDNFEntradaOUTRASDESPESAS.AsCurrency) /
                cProdSemDesconto);

            //calcula percentual de outros custos por produto
            if dmMaster.IBDItemNFEntradaSUB_TOTAL.Value > 0 then
              P_PercentualdeOutrosCustos := (P_ValordeOutrosCustos * 100) /
                dmmaster.IBDItemNFEntradaSUB_TOTAL.AsCurrency;

            //armazena percentual de ipi em vari�vel
            P_PercentualdeIpi := dmmaster.IBDItemNFEntradaIPI.Value;

            //calcula o valor do ipi por produto
            P_ValordoIpi := dmMaster.IBDItemNFEntradaVALOR_IPI.Value;

            P_ValorICMSR := 0;

            cSeguroProd := ((dmmaster.IBDItemNFEntradaSUB_TOTAL.Value *
              dmmaster.IBDNFEntradaVALORDOSEGURO.AsCurrency) /
              cProdSemDesconto);

            if (dmmaster.IBDItemNFEntradaICMSENTRADA.Value = 0) then
              cBaseIcmsProd := 0
            else if dmmaster.IBDNFEntradaFRETEAGREGADO.Value = 1 then
              cBaseIcmsProd := (dmMaster.IBDItemNFEntradaBASE_ICMS.Value + P_ValordeOutrosCustos)
            else
              cBaseIcmsProd := dmMaster.IBDItemNFEntradaBASE_ICMS.Value;

            if (bDescBaseIcms) and (dmmaster.IBDItemNFEntradaICMSENTRADA.Value > 0) then
              if (dmMaster.IBDNFEntradaDESCONTOGERAL.Value > 0) and (dmMaster.IBDNFEntradaRATEAR_DESCONTO.Value = 1) then
                cbaseIcmsProd := cBaseIcmsProd; // - P_ValordoDesconto;

            P_PercentualdeCreditoICMS :=    dmmaster.IBDItemNFEntradaICMSENTRADA.Value;

            if dmmaster.IBDItemNFEntradaCST.Value = 40 then
            begin
              P_PercentualdeCreditoICMS := 0;
              cBaseIcmsProd := 0;
            end;
            // Reducao base de calculo
            if (dmmaster.IBDFornecedoresATACADISTAREGIMEESPECIAL.Value = 1) and
              (dmmaster.IBDItemNFEntradaCST.Value = 0)
              and (dmmaster.IBDItemNFEntradaICMSENTRADA.Value = 17) then
            begin
              percReducao := 7;
              cBaseIcmsProd := cBaseIcmsProd * (percReducao /
                dmmaster.IBDItemNFEntradaICMSENTRADA.Value);
              P_PercentualdeCreditoICMS := percReducao;
            end;
            if (dmmaster.IBDFornecedoresATACADISTAREGIMEESPECIAL.Value = 1) then
            begin
              percReducao := 7;
              cBaseIcmsProd := cBaseIcmsProd * (percReducao /
                dmmaster.IBDItemNFEntradaICMSENTRADA.Value);
              P_PercentualdeCreditoICMS := percReducao;
            end;
            cBaseIcmsProd := cBaseIcmsProd; //+ dmMaster.IBDItemNFEntradaENCARGOS.Value;
            if (dmmaster.IBDItemNFEntradaCST.Value in [20, 220, 70]) then
            begin
              if not dmmaster.IBDAliquotas.Active then
                dmmaster.IBDAliquotas.Open;
              dmmaster.IBDAliquotas.Locate('TRIBUTACAO',
                dmMaster.IBDProdutosTRIBUTACAO.Value, []);
              percReducao := 7;
              dmmaster.IBDAliquotas.Close;
              // fornecedor atacadista do estado
              // produtos com aliquota de 17%
              if (dmmaster.IBDFornecedoresATACADISTAREGIMEESPECIAL.Value = 1)
                and
                (dmmaster.IBDItemNFEntradaICMSENTRADA.Value = 17) then
                percReducao := 7
              else if (percReducao = dmmaster.IBDItemNFEntradaICMSENTRADA.Value)
                or
                (dmmaster.IBDItemNFEntradaCST.Value = 70) or (percReducao = 0) then
                percReducao := 7;
              if not (dmmaster.IBDFornecedoresATACADISTAREGIMEESPECIAL.Value = 1) then
              begin

                P_PercentualdeCreditoICMS := percReducao;
              end;
            end;

            P_ValordoCreditodeIcms := 0;

            // calcula o valor do credito de icms
            if (dmmaster.IBDItemNFEntradaCST.Value in [10, 30, 60, 70, 110, 210])   then
            begin
              P_ValordoCreditodeIcms := 0;
              p_percentualDeCreditoIcms := 0;
            end;
{            if (dmmaster.IBDItemNFEntradaCST.Value in [10, 30, 60, 70, 110, 210])  and    (dmmaster.IBDNFEntradaVALORSUBSTITUICAO.Value = 0) then
              P_ValordoCreditodeIcms := 0
            else if dmMaster.IBDNFEntradaVALORICMS.Value > 0 then
              P_ValordoCreditodeIcms := ((cBaseIcmsProd *
                dmmaster.IBDItemNFEntradaICMSENTRADA.Value) / 100);

}{aqui           cIcms      := cBaseIcmsProd *( dmmaster.IBDItemNFEntradaICMSENTRADA.Value/100);
            cTotalIcms := cTotalIcms + cIcms; //P_ValordoCreditodeICMS;

            // Calcular o Icms Retido com base na aliquota interna icms do produto inf na nota fiscal
            if (dmmaster.IBDItemNFEntradaCST.Value in [10, 30, 60, 70, 110, 210]) and (dmmaster.IBDNFEntradaVALORSUBSTITUICAO.AsCurrency > 0) then
            begin

{              // divide proporcional o icmr
              LucroMaxIcmsRet := 0;
              // erro
              if cBaseIcmsProd > 0 then
                P_ValorICMSR := ((cBaseIcmsProd * (1 + (LucroMaxIcmsRet / 100)) * (1
                  + (17 / 100)) - P_ValordoCreditodeIcms))
              else if (cBaseIcmsProd = 0) and (dmMaster.IBDNFEntradaVALORSUBSTITUICAO.Value > 0) then
                P_ValorICMSR := ((dmMaster.IBDItemNFEntradaSUB_TOTAL.Value * (1 + (LucroMaxIcmsRet / 100)) * (1
                  + (17 / 100)) - P_ValordoCreditodeIcms));

              cIcmsR := cIcmsr + P_ValorICMSR;
}

{aqui              P_ValorICMSR    :=  dmMaster.IBDItemNFEntradaVALOR_SUBSTITUICAO.Value;

              cIcmsR          := cIcmsr + P_ValorICMSR;


            end;

            // Totais da Nota
            cDescontoGeral := cDescontoGeral + P_ValordoDesconto;

            if dmMaster.IBDNFEntradaDESCONTOGERAL.Value > 0 then
              P_ValordoDesconto := (P_ValordoDesconto /
                dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
                dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;

            cFrete := cFrete + P_ValordoFrete;
            P_ValordoFrete := (P_ValordoFrete /
              dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
              dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;

            cSeguro := cSeguro + cSeguroProd;

            cDespAcess := cDespAcess + P_ValordeOutrosCustos;
            P_ValordeOutrosCustos := (P_ValordeOutrosCustos /
              dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
              dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;

            cIPI := cIPI + P_ValordoIpi;
            P_ValordoIpi := (P_ValordoIpi /
              dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
              dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;

            { aplica credito de icms }
{aqui            if not (dmmaster.IBDItemNFEntradaCST.Value in [30, 60, 70]) or
              (dmmaster.IBDItemNFEntradaCST.Value in [30, 10, 70, 110, 210]) then
            begin
              cBaseIcms := cBaseIcms + cBaseIcmsProd;
              cIcms := cIcms + P_ValordoCreditodeICMS;
              P_ValordoCreditodeICMS := (P_ValordoCreditodeICMS /
                dmmaster.IBDItemNFEntradaQUANTIDADE.Value) /
                dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;
            end
            else
              cBaseIcms := cBaseIcms + cBaseIcmsprod;

            dmmaster.IBTProdutoFilial.Locate('produto;filial', VarArrayOf([dmmaster.IBDItemNFEntradaPRODUTO.Value, loja]), []);

            dmMaster.IBTProdutoFilial.Edit;
            dmMaster.IBTProdutoFilialCUSTOBRUTO.Value               := P_CustoBruto;
            dmMaster.IBTProdutoFilialVALORDODESCONTONACOMPRA.Value  := P_ValordoDesconto; // dmMaster.IBDItemNFEntradaQUANTIDADE.Value);
            dmMaster.IBTProdutoFilialDESCONTONACOMPRA.Value         := p_percentualDeDesconto;
            dmMaster.IBTProdutoFilialVALORDOFRETE.Value             := p_valorDoFrete;
            dmMaster.IBTProdutoFilialFRETE.Value                    := p_PercentualDeFrete;
            dmMaster.IBTProdutoFilialVALORDEOUTROSCUSTOS.Value      := p_valorDeOutrosCustos;
            dmMaster.IBTProdutoFilialOUTROSCUSTOS.Value             := p_percentualDeOutrosCustos;
            dmMaster.IBTProdutoFilialIPI.Value                      := p_percentualDeIPI;
            dmMaster.IBTProdutoFilialVALORDOIPI.Value               := p_valorDoIPI;
            dmMaster.IBTProdutoFilialVALORDOICMSR.Value             := (p_valorIcmsR / dmmaster.IBDItemNFEntradaQUANTIDADE.Value) / dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;
            dmMaster.IBTProdutoFilialCREDITODEICMS.Value            := p_PercentualdeCreditoIcms;

                  //S� O NOME EST� ERRADO
            dmMaster.IBTProdutoFilialVALORDOCREDITODEICMSR.Value    := p_valorDoCreditodeIcms;
            //      cTotalIcms := cTotalIcms+cIcms;

            dmMaster.IBTProdutoFilial.Post;
            P_ValordoDesconto := 0;

          end;

          if dmMaster.IBDItemNFEntradaCST.Value <> 60 then
            cBaseTotalIcms := cBaseTotalIcms + cBaseIcmsProd;

          dmmaster.IBDItemNFEntrada.Next;

        end;
        // fim do primeiro passo
        // Aplicar o Icms Retido com base no icms do produto + marg lucro
        if dmmaster.IBDNFEntradaVALORSUBSTITUICAO.Value > 0 then
        begin

          dmmaster.IBDItemNFEntrada.First;

          while not dmmaster.IBDItemNFEntrada.Eof do
          begin

            if (dmmaster.IBDItemNFEntradaCST.Value in [10, 30, 60, 70, 110, 210]) then
            begin

              dmDBEXMaster.Pesquisar_Produto(dmmaster.IBDItemNFEntradaPRODUTO.Value);

              if (dmMaster.IBDItemNFEntradaVALOR_SUBSTITUICAO.Value > 0) then
              begin

                dmMaster.IBTProdutoFilial.Edit;
//                dmMaster.IBTProdutoFilialVALORDOICMSR.Value := ((dmMaster.IBTProdutoFilialVALORDOICMSR.Value * dmmaster.IBDNFEntradaVALORSUBSTITUICAO.Value) / cIcmsR);
                dmMaster.IBTProdutoFilialVALORDOICMSR.Value := dmMaster.IBDItemNFEntradaVALOR_SUBSTITUICAO.Value;

                cTotalIcmsR := cTotalIcmsR + dmMaster.IBTProdutoFilialVALORDOICMSR.Value;

                DecimalSeparator := '.';

                dmDBEXMaster.sspMaster.StoredProcName := 'EXECUTA_SQL';
                dmDBEXMaster.sspMaster.ParamByName('I_SQL').Value :=
                  'UPDATE ITEMNFENTRADA SET VALOR_SUBSTITUICAO = ' + FloatToStr(dmMaster.IBTProdutoFilialVALORDOICMSR.Value)
                  + ' WHERE ITEMNFENTRADA = ' + IntToStr(dmMaster.IBDItemNFEntradaITEMNFENTRADA.Value)
                  + ' AND PRODUTO = ' + IntToStr(dmMaster.IBDItemNFEntradaPRODUTO.Value);
                dmDBEXMaster.sspMaster.ExecProc;

                DecimalSeparator := ',';

//                dmMaster.IBTProdutoFilialVALORDOICMSR.Value           := (dmMaster.IBTProdutoFilialVALORDOICMSR.Value / dmmaster.IBDItemNFEntradaQUANTIDADE.Value) / dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;
                dmMaster.IBTProdutoFilialVALORDOICMSR.Value           := (dmMaster.IBDItemNFEntradaVALOR_SUBSTITUICAO.Value / dmmaster.IBDItemNFEntradaQUANTIDADE.Value) / dmmaster.IBDItemNFEntradaUNIDADEEMBALAGEM.Value;

                dmMaster.IBTProdutoFilialVALORDOCREDITODEICMSR.Value  := 0;
                // icms pago anteriormente
                dmMaster.IBTProdutoFilialICMSAPAGAR.Value             := 0;
                dmMaster.IBTProdutoFilial.Post;

              end;

            end;

            dmmaster.IBDItemNFEntrada.Next;

          end;

        end;

        dmMaster.IBDItemNFEntrada.Close;
        dmMaster.IBDItemNFEntrada.Open;

        dmmaster.IBDNFEntrada.Edit;
        if not dmMaster.bImportandoDANFE then
        begin

          if dmMaster.IBDNFEntradaDESCONTOGERAL.Value > 0 then
            dmmaster.IBDNFEntradaDESCONTOGERALCALCULADO.Value := cDescontoGeral
          else
            dmmaster.IBDNFEntradaDESCONTOGERALCALCULADO.Value := 0;

          dmmaster.IBDNFEntradaVALORDOFRETECALCULADO.Value := cFrete;
          dmmaster.IBDNFEntradaVALORDOSEGUROCALCULADO.Value := cSeguro;
          dmmaster.IBDNFEntradaOUTRASDESPESASCALCULADO.Value := cDespAcess;

          if dmmaster.IBDNFEntradaBASEICMS.Value > 0 then
          begin

            dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value := cBaseIcms;

            if dmmaster.IBDNFEntradaSOMAR_DESPACESS_BASEICMS.Value = 1 then
              dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value := dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value + cDespAcess;

            if dmMaster.IBDNFEntradaFRETEAGREGADO.Value = 1 then
              dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value := dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value + cFrete;
          end
          else
            dmmaster.IBDNFEntradaBASEICMSCALCULADO.Value := 0;
          if dmMaster.IBDNFEntradaVALORICMS.Value > 0 then
            dmmaster.IBDNFEntradaVALORICMSCALCULADO.Value := Trunc(cTotalIcms * 100) / 100 //cIcms
          else
            dmmaster.IBDNFEntradaVALORICMSCALCULADO.Value := 0;

          dmmaster.IBDNFEntradaVALORSUBSTITUICAOCALCULADO.Value := cTotalIcmsr;
          dmmaster.IBDNFEntradaVALORDOIPICALCULADO.Value := cIPI;

          if dmmaster.IBDNFEntradaVALORDOSPRODUTOS.Value =
            dmmaster.IBDNFEntradaVALORDANOTA.Value then
            cTotalIcmsr := 0;

          if dmmaster.IBDNFEntradaFRETEAGREGADO.Value = 0 then
            cFrete := 0;
          if dmmaster.IBDNFEntradaRATEAR_DESCONTO.Value = 1 then
            dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value := (cProdSemDesconto
              - dmmaster.IBDNFEntradaDESCONTOGERAL.Value)
              + cTotalIcmsr + cFrete
              + dmmaster.IBDNFEntradaVALORDOSEGUROCALCULADO.Value
              + dmmaster.IBDNFEntradaOUTRASDESPESASCALCULADO.Value
              + dmmaster.IBDNFEntradaVALORDOIPICALCULADO.Value
          else
          begin
            dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value := cProdSemDesconto
              + cTotalIcmsr + cFrete
              + dmmaster.IBDNFEntradaVALORDOSEGUROCALCULADO.Value
              + dmmaster.IBDNFEntradaOUTRASDESPESASCALCULADO.Value
              + dmmaster.IBDNFEntradaVALORDOIPICALCULADO.Value;
          end;
          if (dmMaster.IBDNFEntradaSOMAR_ICMSR_VALORNOTA.Value = 0) and (cTotalIcmsr > 0) then
            dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value := (dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value - cTotalIcmsr);
          // Arredonda
          dmmaster.IBDNFEntradaVALORDANOTACALCULADO.AsString := Format('%7.2f',
            [dmmaster.IBDNFEntradaVALORDANOTACALCULADO.Value]);
        end;

      end;
  end;
}
end;

procedure TdmMProvider.CalcularTotaisProducao(pProducao: integer);
begin

  dmDBEXMaster.fdqTotalizarItemProduc.Close;
  dmDBEXMaster.fdqTotalizarItemProduc.Params[0].Value := dmMProvider.cdsProducaoPRODUCAO.Value;
  dmDBEXMaster.fdqTotalizarItemProduc.Open;

end;

function TdmMProvider.CarregarConfigIni: boolean;
begin

  try

    cdsConfig_ini.Close;
    cdsConfig_ini.CreateDataSet;

    cdsConfig_ini.Append;

    cdsConfig_iniLOJA.Value                           := dmDBEXMaster.ifArqConfig.ReadInteger('LOJA','CODIGO',1);
    cdsConfig_iniNOME_LOJA.Value                      := dmDBEXMaster.ifArqConfig.ReadString('LOJA','RSOCIAL','');
    cdsConfig_iniULTIMO_USUARIO.Value                 := dmDBEXMaster.ifArqConfig.ReadString('LOGIN','ULTIMOLOGIN','');
    cdsConfig_iniSERV_TIPO.Value                      := dmDBEXMaster.ifArqConfig.ReadInteger('SERVIDOR','TIPO',0);
    cdsConfig_iniSERV_PROTOCOLO.Value                 := dmDBEXMaster.ifArqConfig.ReadInteger('SERVIDOR','PROTOCOLO',0);
    cdsConfig_iniSERV_VERSAO.Value                    := dmDBEXMaster.ifArqConfig.ReadInteger('SERVIDOR','VERSAO',0);
    cdsConfig_iniSERV_TCPIP.Value                     := dmDBEXMaster.ifArqConfig.ReadString('SERVIDOR','TCPIP','127.0.0.1');
    cdsConfig_iniMARCA_MODELO_IMP_TERMICA.Value       := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Tipo',0);
    cdsConfig_iniPORTA_IMP_TERMICA.Value              := dmDBEXMaster.ifArqConfig.ReadString('Impressora Termica','Porta','LPT1');
    cdsConfig_iniBPS_IMP_TERMICA.Value                := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Bps',9600);
    cdsConfig_iniBITS_DADOS_IMP_TERMICA.Value         := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Bdd',8);
    cdsConfig_iniBITS_PARADA_IMP_TERMCA.Value         := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Bdp',1);
    cdsConfig_iniPARIDADE_IMP_TERMICA.Value           := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Paridade',0);
    cdsConfig_iniCTRL_FLUXO_IMP_TERMICA.Value         := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Fluxo',0);
    cdsConfig_iniMODELO_ETQ_GONDOLA.Value             := dmDBEXMaster.ifArqConfig.ReadInteger('Impressora Termica','Modelo Etq_Gond',-1);
    cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Value      := dmDBEXMaster.ifArqConfig.ReadString('Certificado','NumSerie','');
    cdsConfig_iniVENCIMENTO_CERTIICADO_DIGITAL.Value  := StrTodate(dmDBEXMaster.ifArqConfig.ReadString('Certificado','Vencimento',FormatDateTime('dd/mm/yyyy',Date)));
    cdsConfig_iniPATH_TABELAS_AUX_SPED_F.Value        := dmDBEXMaster.ifArqConfig.ReadString('SPED Fiscal','Pasta_Tabelas_atualizacao','C:\');
    cdsConfig_iniPATH_ATUALIZACAO.Value               := dmDBEXMaster.ifArqConfig.ReadString('Atualizacao','Pasta','C:\');

    cdsConfig_ini.Post;

    //tabela de configura��es
    cdsConfiguracoes.Close;
    cdsConfiguracoes.ProviderName := 'dspConfiguracoes';

    cdsConfiguracoes.Open;
    cdsConfiguracoes.ProviderName := '';

    //parametros da nfe
    cdsParametros_NFE.Close;
    cdsParametros_NFE.ProviderName := 'dspParametros_NFE';

    cdsParametros_NFE.Open;
    cdsParametros_NFE.ProviderName := '';

    cdsFilial.Open;
    cdsFilial.ProviderName := '';

    Result                    := true;

  except
    on E: exception do
    begin

      Gravar_log_processo(e.Message,  ExtractFilePath(Application.ExeName)+'Log\' + 'Log_erro_conexao.log');
      Result := false;

    end;

  end;

end;

procedure TdmMProvider.cdsAdministradorasNewRecord(DataSet: TDataSet);
begin

  cdsAdministradorasDESCONTO.Value := 0;

end;

procedure TdmMProvider.cdsAgendaNewRecord(DataSet: TDataSet);
begin

  cdsAgendaAGENDA.Value                 := -1;
  cdsAgendaDATA_COMPROMISSO.Value       := Date;
  cdsAgendaHORA_COMPROMISSO.Value       := Time;
  cdsAgendaALERTA.Value                 := 1;
  cdsAgendaREALIZADO.Value              := 0;
  cdsAgendaFUNCIONARIO.Value            := dmMProvider.cdsFuncionariosFUNCIONARIO.Value;

end;

procedure TdmMProvider.cdsAlmoxarifadoCalcFields(DataSet: TDataSet);
begin

  case cdsAlmoxarifadoSTATUS.Value of
    0:cdsAlmoxarifadoDESCRICAO_STATUS.Value := 'A CONFIRMAR';
    1:cdsAlmoxarifadoDESCRICAO_STATUS.Value := 'CONFIRMADO';
  end;

end;

procedure TdmMProvider.cdsAlmoxarifadoNewRecord(DataSet: TDataSet);
begin

  cdsAlmoxarifadoALMOXARIFADO.Value := -1;
  cdsAlmoxarifadoEMISSAO.Value      := Date;
  cdsAlmoxarifadoHORA.Value         := Time;
  cdsAlmoxarifadoSTATUS.Value       := 0;
  cdsAlmoxarifadoUSUARIO.Value      := dmDBEXMaster.sNomeUsuario;

end;

procedure TdmMProvider.cdsApoioInventarioCalcFields(DataSet: TDataSet);
begin

  cdsApoioInventarioSALDO_TOTAL.AsCurrency     := cdsApoioInventarioDEPOSITO.AsCurrency +
                                                  cdsApoioInventarioLOJA.AsCurrency;
  cdsApoioInventarioVALOR_SALDO.AsCurrency     := (cdsApoioInventarioSALDO_TOTAL.AsCurrency * cdsApoioInventarioCUSTOLIQUIDO.AsCurrency);

end;

procedure TdmMProvider.cdsCaixaLojaCalcFields(DataSet: TDataSet);
begin

  case cdsCaixaLojaSTATUS.Value of
    1:cdsCaixaLojaSTATUS_CAIXA.Value := 'ABERTO';
    2:cdsCaixaLojaSTATUS_CAIXA.Value := 'FECHADO';
  end;

end;

procedure TdmMProvider.cdsCaixaLojaNewRecord(DataSet: TDataSet);
begin

  cdsCaixaLojaCAIXA_LOJA.Value        := -1;
  cdsCaixaLojaDATA_ABERTURA.Value     := Date;
  cdsCaixaLojaHORA_ABERTURA.Value     := Time;
  cdsCaixaLojaSTATUS.Value            := 1;
  cdsCaixaLojaVALOR_ABERTURA.Value    := 0;
  cdsCaixaLojaVALOR_MOVIMENTO.Value   := 0;
  cdsCaixaLojaFUNCIONARIO.Value       := dmMProvider.cdsFuncionariosFUNCIONARIO.Value;

end;

procedure TdmMProvider.cdsCFOP_CFPSCalcFields(DataSet: TDataSet);
begin

  case cdsCFOP_CFPSNATUREZA_CFOP.Value of
    0:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'VENDA';
    1:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'COMPRA';
    2:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'DEVOLU��O';
    3:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'FRETE';
    4:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'SERVI�O';
    5:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'OUTROS';
  else
    cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'N�O CONFIGURADA';
  end;

  case cdsCFOP_CFPSOPERACAO.Value of
    0:cdsCFOP_CFPSDESCRICAO_OPERACAO.Value := 'ENTRADA';
    1:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'SA�DA';
    2:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'IMPLAMTA��O';
    3:cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'SEM MOVIMENTA��O';
  else
    cdsCFOP_CFPSDESCRICAO_NATUREZA.Value := 'N�O CONFIGURADA';
  end;

  if cdsCFOP_CFPSATUALIZAR_CUSTOS.Value = 1 then
    cdsCFOP_CFPSS_ATUALIZA_CUSTOS.Value := 'ATUALIZA CUSTOS NA ENTRADA'
  else
    cdsCFOP_CFPSS_ATUALIZA_CUSTOS.Value := 'N�O ATUALIZA CUSTOS NA ENTRADA';

  if cdsCFOP_CFPSGERA_CREDITO_PIS_COFINS.Value = 1 then
    cdsCFOP_CFPSS_GERA_CR_PIS_COFINS.Value := 'GERA CR/DEB PIS/COFINS'
  else
    cdsCFOP_CFPSS_GERA_CR_PIS_COFINS.Value := 'N�O GERA CR/DEB PIS/COFINS';

  if cdsCFOP_CFPSGERA_DEBITO_CREDITO_ICMS.Value = 1 then
    cdsCFOP_CFPSS_GERA_CR_DEB_ICMS.Value := 'GERA CR/DEB ICMS'
  else
    cdsCFOP_CFPSS_GERA_CR_DEB_ICMS.Value := 'N�O GERA CR/DEB ICMS';

  if cdsCFOP_CFPSGERA_DEBITO_CREDITO_IPI.Value = 1 then
    cdsCFOP_CFPSS_GERA_CR_DEB_IPI.Value := 'GERA CR/DEB IPI'
  else
    cdsCFOP_CFPSS_GERA_CR_DEB_IPI.Value := 'N�O GERA CR/DEB IPI';

  if cdsCFOP_CFPSSUBSTITUICAO_TRIBUTARIA.Value = 1 then
    cdsCFOP_CFPSS_CFOP_ST.Value := 'SUBSTITUI��O TRIBUT�RIA'


end;

procedure TdmMProvider.cdsCFOP_CFPSNewRecord(DataSet: TDataSet);
begin

  cdsCFOP_CFPSOPERACAO.Value                  := 0;
  cdsCFOP_CFPSATUALIZAR_CUSTOS.Value          := 0;
  cdsCFOP_CFPSNATUREZA_CFOP.Value             := 0;
  cdsCFOP_CFPSGERA_CREDITO_PIS_COFINS.Value   := 0;
  cdsCFOP_CFPSGERA_DEBITO_CREDITO_ICMS.Value  := 0;
  cdsCFOP_CFPSSUBSTITUICAO_TRIBUTARIA.Value   := 0;
  cdsCFOP_CFPSGERA_DEBITO_CREDITO_IPI.Value   := 0;
  cdsCFOP_CFPSALIQUOTA_PIS_ENTRADA.Value      := 0;
  cdsCFOP_CFPSALIQUOTA_COFINS_ENTRADA.Value   := 0;
  cdsCFOP_CFPSALIQUOTA_PIS_SAIDA.Value        := 0;
  cdsCFOP_CFPSALIQUOTA_COFINS_SAIDA.Value     := 0;
  cdsCFOP_CFPSREMESSA.Value                   := 0;

end;

procedure TdmMProvider.cdsCFOP_NFSaidaNewRecord(DataSet: TDataSet);
begin

  dmDBEXMaster.fdqRetorna_Ngr_CFOPNFS.Close;
  dmDBEXMaster.fdqRetorna_Ngr_CFOPNFS.Open;

  cdsCFOP_NFSaidaCFOP_NFSAIDA.Value   := dmDBEXMaster.fdqRetorna_Ngr_CFOPNFSIDCFOP_NFSAIDA.Value;
  cdsCFOP_NFSaidaNFSAIDA.Value        := cdsNFSaidaNFSAIDA.Value;
  cdsCFOP_NFSaidaMODELO.Value         := cdsNFSaidaMODELO.Value;
  cdsCFOP_NFSaidaFILIAL.Value         := dmDBEXMaster.iIdFilial;

end;

procedure TdmMProvider.cdsCidadesAfterOpen(DataSet: TDataSet);
begin

  dmDBEXMaster.fdcMaster.Close;

end;

procedure TdmMProvider.cdsCidadesNewRecord(DataSet: TDataSet);
begin

  cdsCidadesCIDADE.Value := 0;

end;

procedure TdmMProvider.cdsClientesNewRecord(DataSet: TDataSet);
begin

  cdsClientesCLIENTE.Value                              := -1;
  cdsClientesCADASTRO.Value                             := Date;
  cdsClientesTIPO.Value                                 := 0;
  cdsClientesRENDA.Value                                := 0;
  cdsClientesLIMITEDECREDITO.Value                      := 0;
  cdsClientesSALDODEVEDOR.Value                         := 0;
  cdsClientesSTATUS.Value                               := 0;
  cdsClientesTIPODECREDITO.Value                        := 0;
  cdsClientesVALORULTIMOPEDIDO.Value                    := 0;
  cdsClientesVALORULTIMANF.Value                        := 0;
  cdsClientesVALORULTIMOCHEQUEDEVOLVIDO.Value           := 0;
  cdsClientesATIVO.Value                                := 1;
  cdsClientesSEXO.Value                                 := 0;
  cdsClientesESTADOCIVIL.Value                          := 0;
  cdsClientesPOSSUIDEPENDENTES.Value                    := 0;
  cdsClientesTIPOTEMPOEMPRESA.Value                     := 0;
  cdsClientesLIBERARVENDAACIMALIMITE.Value              := 0;
  cdsClientesMODELO_TABELA_PRECOVENDA.Value             := 0;
  cdsClientesSOCIO.Value                                := 0;
  cdsClientesCONTRIBUICAO.Value                         := 0;
  cdsClientesDESCONTO_PERSONALIZADO.Value               := 0;
  cdsClientesUSUARIO_NFE.Value                          := 0;
  cdsClientesPAIS.Value                                 := cdsFilialPAIS.Value;
  cdsClientesGARANTIDOR_OS.Value                        := 0;
  cdsClientesEND_ENTR_COBR_IGUAL_END.Value              := 0;

end;

procedure TdmMProvider.cdsConfigBuscaCEPNewRecord(DataSet: TDataSet);
begin

  cdsConfigBuscaCEPCHAVE_ACESSO.Value := '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.';

end;

procedure TdmMProvider.cdsConfigECFNewRecord(DataSet: TDataSet);
begin

  cdsConfigECFCODIGO_MODELO_DOCUMENTO.Value := '2D';

end;

procedure TdmMProvider.cdsConfig_financeiroNewRecord(DataSet: TDataSet);
begin

  cdsConfig_financeiroCONFIG_FINANCEIRO.Value         := -1;
  cdsConfig_financeiroEMITIR_RECIBO_RECEBIMENTO.Value := 0;
  cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.Value      := 0;

end;

procedure TdmMProvider.cdsConhecimentoFreteNewRecord(DataSet: TDataSet);
begin

  cdsConhecimentoFreteNF_ENTRADA.Value            := cdsNFEntradaNFENTRADA.Value;
  cdsConhecimentoFreteEMISSAO_ENTRADA.Value       := Date;
//  cdsConhecimentoFreteENTRADA.Value               := Date;

  cdsConhecimentoFreteVALOR_TOTAL.Value           := 0;
  cdsConhecimentoFreteBASE_CALCULO.Value          := 0;
  cdsConhecimentoFreteVALOR_ICMS.Value            := 0;
  cdsConhecimentoFreteISENTA_NAO_TRIBUTADA.Value  := 0;
  cdsConhecimentoFreteOUTRAS.Value                := 0;
  cdsConhecimentoFreteVALOR_DESCONTO.Value        := 0;
//  cdsConhecimentoFreteALIQUOTA_ICMS.Value         := 0;

end;

procedure TdmMProvider.cdsCtrlCartoesCalcFields(DataSet: TDataSet);
begin

  case cdsCtrlCartoesSTATUS.Value of
    0:cdsCtrlCartoesDESCR_STATUS.Value := 'ABERTO';
    1:cdsCtrlCartoesDESCR_STATUS.Value := 'BAIXADO';
  end;

  case cdsCtrlCartoesTIPO_OPERACAO.Value of
    0:cdsCtrlCartoesDESCR_TIPO_OPER.Value := 'CREDITO';
    1:cdsCtrlCartoesDESCR_TIPO_OPER.Value := 'DEBITO';
  end;

end;

procedure TdmMProvider.cdsCtrlCartoesNewRecord(DataSet: TDataSet);
begin

  cdsCtrlCartoesEMISSAO.Value         := Date;
  cdsCtrlCartoesVALORDACOMPRA.Value   := 0;
  cdsCtrlCartoesVALORDODESCONTO.Value := 0;
  cdsCtrlCartoesVALORARECEBER.Value   := 0;
  cdsCtrlCartoesSTATUS.Value          := 0;

end;

procedure TdmMProvider.cdsCtrlNotasCalcFields(DataSet: TDataSet);
begin

  case cdsCtrlNotasTIPO_LANCAMENTO.Value of
    0:cdsCtrlNotasS_TIPO_LANCAMENTO.Value := 'LAN�AMENTO NORMAL';
    1:cdsCtrlNotasS_TIPO_LANCAMENTO.Value := 'UTILIZADO FUN��O PARA DUPLICA��O';
  end;

end;

procedure TdmMProvider.cdsCtrlNotasNewRecord(DataSet: TDataSet);
begin

//  cdsCtrlNotasDATA_ENTRADA.Value      := Date;
  cdsCtrlNotasFILIAL.Value            := dmDBEXMaster.iIdFilial;
  cdsCtrlNotasVALOR_NOTA.Value        := 0;
  cdsCtrlNotasVALOR_ICMS.Value        := 0;
  cdsCtrlNotasVALOR_DEVOLUCAO.Value   := 0;
  cdsCtrlNotasVALOR_BRINDE.Value      := 0;
  cdsCtrlNotasVALOR_REMESSA.Value     := 0;
  cdsCtrlNotasVALOR_IMOBILIZADO.Value := 0;
  cdsCtrlNotasTIPO_LANCAMENTO.Value   := 0;

end;

procedure TdmMProvider.cdsCupomFiscalRefNFSNewRecord(DataSet: TDataSet);
begin

  cdsCupomFiscalRefNFSNF_SAIDA.Value             := cdsNFSaidaNFSAIDA.Value;
  cdsCupomFiscalRefNFSMODELO_NF_SAIDA.Value      := cdsNFSaidaMODELO.Value;
  cdsCupomFiscalRefNFSSERIE_NF_SAIDA.Value       := cdsNFSaidaSERIE.Value;
  cdsCupomFiscalRefNFSCNPJ_NF_SAIDA.Value        := cdsNFSaidaDESTINATARIO_.Value;
  cdsCupomFiscalRefNFSMODELO_DOC_REF.Value       := '2D';
  cdsCupomFiscalRefNFSINDICADOR_EMITENTE.Value   := 0;
  cdsCupomFiscalRefNFSINDICADOR_OPERACAO.Value   := 0;
  cdsCupomFiscalRefNFSFILIAL.Value               := dmDBEXMaster.iIdFilial;
  cdsCupomFiscalRefNFSTIPO_DOCUMENTO.Value       := 4;

end;

procedure TdmMProvider.cdsDesdobRentabilCalcFields(DataSet: TDataSet);
begin

  cdsDesdobRentabilSALDO_FUTURO.Value := (cdsDesdobRentabilSALDO_ATUAL.Value + cdsDesdobRentabilQUANTIDADE.Value);

end;

procedure TdmMProvider.cdsDeslocamentoOSCalcFields(DataSet: TDataSet);
begin

  if cdsDeslocamentoOSKM_REGRESSO_ORIGEM.Value > 0 then
    cdsDeslocamentoOSKM_CALC.Value    := (cdsDeslocamentoOSKM_REGRESSO_ORIGEM.Value - cdsDeslocamentoOSKM_SAIDA_ORIGEM.Value);

  if cdsDeslocamentoOSHORA_REGRESSO_ORIGEM.Value > cdsDeslocamentoOSHORA_SAIDA_ORIGEM.Value then
    cdsDeslocamentoOSHORAS_CALC.Value := Subtrai_Hora(cdsDeslocamentoOSHORA_SAIDA_ORIGEM.AsString, cdsDeslocamentoOSHORA_REGRESSO_ORIGEM.AsString);

end;

procedure TdmMProvider.cdsDeslocamentoOSNewRecord(DataSet: TDataSet);
begin

  cdsDeslocamentoOSDESLOCAMENTO_OS.Value    := -1;
  cdsDeslocamentoOSORDEM_SERVICO.Value      := cdsOrdemServicoORDEM_DE_SERVICO.Value;
  cdsDeslocamentoOSDATA_CADASTRO.Value      := Date;
  cdsDeslocamentoOSHORA_SAIDA_ORIGEM.Value  := Time;
  cdsDeslocamentoOSKM_SAIDA_ORIGEM.Value    := 0;
  cdsDeslocamentoOSKM_CHEGADA_DESTINO.Value := 0;
  cdsDeslocamentoOSKM_SAIDA_DESTINO.Value   := 0;
  cdsDeslocamentoOSKM_REGRESSO_ORIGEM.Value := 0;
  cdsDeslocamentoOSVALOR_ALIMENTACAO.Value  := 0;
  cdsDeslocamentoOSVALOR_HOSPEDAGEM.Value   := 0;
  cdsDeslocamentoOSKM_TOTAL.Value           := 0;
  cdsDeslocamentoOSHORAS_TOTAL.Value        := 0;

end;

procedure TdmMProvider.cdsDocumentoRef_NFSCalcFields(DataSet: TDataSet);
begin

  case cdsDocumentoRef_NFSTIPO_DOCUMENTO.Value of
    0:cdsDocumentoRef_NFSS_TIPO_DOCUMENTO.Value := 'NF-e';
    1:cdsDocumentoRef_NFSS_TIPO_DOCUMENTO.Value := 'CT-e';
    2:cdsDocumentoRef_NFSS_TIPO_DOCUMENTO.Value := 'NF';
    3:cdsDocumentoRef_NFSS_TIPO_DOCUMENTO.Value := 'PROD';
    4:cdsDocumentoRef_NFSS_TIPO_DOCUMENTO.Value := 'CF';
  end;

end;

procedure TdmMProvider.cdsDocumentoRef_NFSNewRecord(DataSet: TDataSet);
begin

  cdsDocumentoRef_NFSNF_SAIDA.Value           := cdsNFSaidaNFSAIDA.Value;
  cdsDocumentoRef_NFSMODELO_NF_SAIDA.Value    := cdsNFSaidaMODELO.Value;
  cdsDocumentoRef_NFSSERIE_NF_SAIDA.Value     := cdsNFSaidaSERIE.Value;
  cdsDocumentoRef_NFSCNPJ_NF_SAIDA.Value      := cdsNFSaidaDESTINATARIO_.Value;
  cdsDocumentoRef_NFSINDICADOR_EMITENTE.Value := 0;
  cdsDocumentoRef_NFSINDICADOR_OPERACAO.Value := 0;
  cdsDocumentoRef_NFSFILIAL.Value             := dmDBEXMaster.iIdFilial;
  cdsDocumentoRef_NFSTIPO_DOCUMENTO.Value     := 0;

end;

procedure TdmMProvider.cdsEndEntregaNFSNewRecord(DataSet: TDataSet);
begin

  cdsEndEntregaNFSNFSAIDA.Value     := cdsNFSaidaNFSAIDA.Value;
  cdsEndEntregaNFSSERIE.Value       := cdsNFSaidaSERIE.Value;
  cdsEndEntregaNFSMODELO.Value      := cdsNFSaidaMODELO.Value;
  cdsEndEntregaNFSFILIAL.Value      := dmDBEXMaster.iIdFilial;

end;

procedure TdmMProvider.cdsEndEntregaPedZeusNewRecord(DataSet: TDataSet);
begin

  cdsEndEntregaPedZeusFILIAL.Value          := dmDBEXMaster.iIdFilial;
  cdsEndEntregaPedZeusPEDIDO.Value          := cdsPedidoZeusPEDIDO.Value;
  cdsEndEntregaPedZeusHORA_TRANSACAO.Value  := time;

end;

procedure TdmMProvider.cdsEndRetiradaNFSNewRecord(DataSet: TDataSet);
begin

  cdsEndRetiradaNFSNFSAIDA.Value    := cdsNFSaidaNFSAIDA.Value;
  cdsEndRetiradaNFSSERIE.Value      := cdsNFSaidaSERIE.Value;
  cdsEndRetiradaNFSMODELO.Value     := cdsNFSaidaMODELO.Value;
  cdsEndRetiradaNFSFILIAL.Value     := dmDBEXMaster.iIdFilial;

end;

procedure TdmMProvider.cdsEquipamentosNewRecord(DataSet: TDataSet);
begin

  cdsEquipamentosDATA_COMPRA.Value := date;

end;

procedure TdmMProvider.cdsEstadosAfterOpen(DataSet: TDataSet);
begin

  dmDBEXMaster.fdcMaster.Close;

end;

procedure TdmMProvider.cdsEstadosNewRecord(DataSet: TDataSet);
begin

  cdsEstadosMVA.Value                         := 0;
  cdsEstadosICMS_INTERESTADUAL.Value          := 0;
  cdsEstadosICMS_INTERNO.Value                := 0;
  cdsEstadosFCP.Value                         := 0;
{  cdsEstadosESTADO_BRASILEIRO.Value           := 1;
  cdsEstadosCODIGO_PAIS.Value                 := 1058;
  cdsEstadosCODIGO_SINIEF.Value               := 0;
  cdsEstadosUTILIZA_ATIVIDADE_ESTADUAL.Value  := 0;
  cdsEstadosSIMPLES_FEDERAL.Value             := 0;
  cdsEstadosALIQUOTA_SIMPLES_FEDERAL.Value    := 0;
}
end;

procedure TdmMProvider.cdsExpoirtacaoNFSNewRecord(DataSet: TDataSet);
begin

  cdsExpoirtacaoNFSNF_SAIDA.Value         := cdsNFSaidaNFSAIDA.Value;
  cdsExpoirtacaoNFSMODELO_NF_SAIDA.Value  := cdsNFSaidaMODELO.Value;
  cdsExpoirtacaoNFSSERIE_NF_SAIDA.Value   := cdsNFSaidaSERIE.Value;

end;

procedure TdmMProvider.cdsFCP_EstadosCalcFields(DataSet: TDataSet);
begin

  case cdsFCP_EstadosEXCECAO.Value of
    0:cdsFCP_EstadosS_EXCECAO.Value := 'N�O';
    1:cdsFCP_EstadosS_EXCECAO.Value := 'SIM';
  end;

end;

procedure TdmMProvider.cdsFCP_EstadosNewRecord(DataSet: TDataSet);
begin

  cdsFCP_EstadosSIGLA.Value                     := cdsEstadosSIGLA.Value;
  cdsFCP_EstadosNCM.Value                       := cdsProdutosNCM.Value;
  cdsFCP_EstadosALIQUOTA_INTERNA_DESTINO.Value  := 0;
  cdsFCP_EstadosEXCECAO.Value                   := 0;

end;

procedure TdmMProvider.cdsFilialNewRecord(DataSet: TDataSet);
begin

  cdsFilialFILIAL.Value                       := 0;
  cdsFilialSUBSTITUTOTRIBUTARIO.Value         := 0;
  cdsFilialCONTRIBUINTEDOIPI.Value            := 0;
  cdsFilialTIPO_EMPRESA.Value                 := 0;
  cdsFilialMETRO_QUADRADO.Value               := 0;
  cdsFilialREGIME_TRIBUTARIO.Value            := 0;
  cdsFilialNATUREZA_PESSOA_JURIDICA.Value     := 0;
  cdsFilialPERFIL_SPED.Value                  := 0;
  cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC.Value  := 0;
  cdsFilialIMPOSTO_SIMPLES_NACIONAL.Value     := 0;
  cdsFilialSTATUS_FAT.Value                   := 0;
  cdsFilialUTILIZA_NFCE.Value                 := 0;

end;

procedure TdmMProvider.cdsFinalizadoraPedZeusNewRecord(DataSet: TDataSet);
begin

  cdsFinalizadoraPedZeusFILIAL.Value              := cdsPedidoZeusFILIAL.Value;
  cdsFinalizadoraPedZeusPEDIDO.Value              := cdsPedidoZeusPEDIDO.Value;
  cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value    := 0;
  cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS.Value := 1;
  cdsFinalizadoraPedZeusTIPO.Value                := 0;

end;

procedure TdmMProvider.cdsFornecedorNewRecord(DataSet: TDataSet);
begin

  cdsFornecedorCADASTRO.Value                   := Date;
  cdsFornecedorTIPO.Value                       := 0;
  cdsFornecedorVALORULTIMOPEDIDO.Value          := 0;
  cdsFornecedorVALORULTIMANF.Value              := 0;
  cdsFornecedorRAMODEATIVIDADE.Value            := 4;
  cdsFornecedorATACADISTAREGIMEESPECIAL.Value   := 0;
  cdsFornecedorOPTANTE_SIMPLES.Value            := 0;
  cdsFornecedorAPROVEITA_DESCONTO_ITEM_NF.Value := 0;
  cdsFornecedorPAIS.Value                       := dmMProvider.cdsFilialPAIS.Value;

end;

procedure TdmMProvider.cdsFretePedidoVendaNewRecord(DataSet: TDataSet);
begin

  cdsFretePedidoVendaFRETE_PEDIDO_VENDA.Value := -1;
  cdsFretePedidoVendaPEDIDO.Value             := cdsPedidoZeusPEDIDO.Value;
  cdsFretePedidoVendaTIPO_PAGAMENTO.Value     := 0;
  cdsFretePedidoVendaVENCIMENTO.Value         := Date;
  cdsFretePedidoVendaVALOR.Value              := 0;

end;

procedure TdmMProvider.cdsFuncionariosNewRecord(DataSet: TDataSet);
begin

  cdsFuncionariosATIVO.Value                      := 1;
  cdsFuncionariosPERCENTUAL_COMISSAO_VENDA.Value  := 0;

end;

procedure TdmMProvider.cdsHistorico_OSNewRecord(DataSet: TDataSet);
begin

  cdsHistorico_OSDATA_CADASTRO.Value  := Date;
  cdsHistorico_OSHORA_CADASTRO.Value  := Time;
  cdsHistorico_OSTIPO.Value           := 0;
  cdsHistorico_OSUSUARIO.Value        := dmDBEXMaster.sNomeUsuario;

end;

procedure TdmMProvider.cdsItemAlmoxarifadoNewRecord(DataSet: TDataSet);
begin

  cdsItemAlmoxarifadoITEM_ALMOXARIFADO.Value  := -1;
  cdsItemAlmoxarifadoQUANTIDADE.Value         := 1;
  cdsItemAlmoxarifadoUSUARIO.Value            := dmDBEXMaster.sNomeUsuario;
  cdsItemAlmoxarifadoALMOXARIFADO.Value       := cdsAlmoxarifadoALMOXARIFADO.Value;

end;

procedure TdmMProvider.cdsItemCaixaLojaCalcFields(DataSet: TDataSet);
begin

  cdsItemCaixaLojaDEBITO.Value  := 0;
  cdsItemCaixaLojaCREDITO.Value := 0;

  if cdsItemCaixaLojaCREDITO_DEBITO.Value = 'D' then
    cdsItemCaixaLojaDEBITO.Value := cdsItemCaixaLojaVALOR.Value
  else if cdsItemCaixaLojaCREDITO_DEBITO.Value = 'C' then
    cdsItemCaixaLojaCREDITO.Value := cdsItemCaixaLojaVALOR.Value;

  case cdsItemCaixaLojaTIPO_LANCAMENTO.Value of
    0,1:cdsItemCaixaLojaS_TIPO_LANCAMENTO.Value := 'CART�ES';
  2,3,4:cdsItemCaixaLojaS_TIPO_LANCAMENTO.Value := 'CHEQUES';
      7:cdsItemCaixaLojaS_TIPO_LANCAMENTO.Value := 'DINHEIRO';
     99:cdsItemCaixaLojaS_TIPO_LANCAMENTO.Value := 'ABERTURA CX';
  else
      cdsItemCaixaLojaS_TIPO_LANCAMENTO.Value := 'OUTROS';
  end;

end;

procedure TdmMProvider.cdsItemNFSaidaAfterPost(DataSet: TDataSet);
begin

  if not InserindoEditando(cdsNFSaida) then
    cdsNFSaida.Edit;

//  if not cdsItemNFSaida.IsEmpty then
//  begin

    cdsNFSaidaVALORDANOTA.Value           := (cdsNFSaidaVALORDOSPRODUTOS.Value - cdsNFSaidaDESCONTO_ST.Value)
                                            + cdsNFSaidaVALORSUBSTITUICAO.Value
                                            + cdsNFSaidaVALORDOFRETE.Value
                                            + cdsNFSaidaVALORDOIPI.Value
                                            + cdsNFSaidaVALORDOSEGURO.Value
                                            + cdsNFSaidaOUTRASDESPESAS.Value;


{  end
  else
  begin
    cdsNFSaidaVALORDANOTA.Value           := (cdsNFSaidaVALORDOSPRODUTOS.Value - cdsNFSaidaDESCONTO_ST.Value)
                                            + cdsNFSaidaVALORSUBSTITUICAO.Value
                                            + cdsNFSaidaVALORDOFRETE.Value
                                            + cdsNFSaidaVALORDOIPI.Value
                                            + cdsNFSaidaVALORDOSEGURO.Value
                                            + cdsNFSaidaOUTRASDESPESAS.Value;

    cdsNFSaidaBASECALCULOICMS.Value       := 0;
    cdsNFSaidaVALORICMS.Value             := 0;
    cdsNFSaidaBASESUBSTITUICAO.Value      := 0;
    cdsNFSaidaVALORSUBSTITUICAO.Value     := 0;
    cdsNFSaidaVALORDOSPRODUTOS.Value      := 0;
    cdsNFSaidaVALORDOFRETE.Value          := 0;
    cdsNFSaidaVALORDOSEGURO.Value         := 0;
    cdsNFSaidaDESCONTO_ST.Value           := 0;
    cdsNFSaidaVALORDOIPI.Value            := 0;
    cdsNFSaidaOUTRASDESPESAS.Value        := 0;
    cdsNFSaidaVALOR_PIS.Value             := 0;
    cdsNFSaidaVALOR_COFINS.Value          := 0;
    cdsNFSaidaTOTAL_ICMS_DESONERADO.Value := 0;
    cdsNFSaidaVALOR_TOTAL_IMPOSTOS.Value  := 0;
    cdsNFSaidaVALORDANOTA.Value           := 0;

  end;
}
end;


procedure TdmMProvider.cdsItemNFSaidaNewRecord(DataSet: TDataSet);
begin

//  cdsItemNFSaidaITEMNFSAIDA.Value                       := iContaItem;
  cdsItemNFSaidaITEMNFSAIDA.Value                       := -1;
  cdsItemNFSaidaNFSAIDA.Value                           := dmMProvider.cdsNFSaidaNFSAIDA.Value;
  cdsItemNFSaidaQUANTIDADE.Value                        := 1;
  cdsItemNFSaidaVALORUNITARIO.Value                     := 0;
  cdsItemNFSaidaDESCONTO.Value                          := 0;
  cdsItemNFSaidaICMS.Value                              := 0;
  cdsItemNFSaidaVALORUNITARIOREAL.Value                 := 0;
  cdsItemNFSaidaIPI.Value                               := 0;
  cdsItemNFSaidaBASE_ICMS.Value                         := 0;
  cdsItemNFSaidaBASE_SUBSTITUICAO.Value                 := 0;
  cdsItemNFSaidaVALOR_DESCONTO.Value                    := 0;
  cdsItemNFSaidaVALOR_ICMS.Value                        := 0;
  cdsItemNFSaidaVALOR_IPI.Value                         := 0;
  cdsItemNFSaidaVALOR_SUBSTITUICAO.Value                := 0;
  cdsItemNFSaidaSUB_TOTAL.Value                         := 0;
  cdsItemNFSaidaPERCENTUAL_REDUCAO.Value                := 0;
  cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value            := 0;
  cdsItemNFSaidaDESCONTO_RATEADO.Value                  := 0;
  cdsItemNFSaidaMODELO.Value                            := cdsConfiguracoesMODELO.Value;
  cdsItemNFSaidaBASE_IPI.Value                          := 0;
  cdsItemNFSaidaALIQUOTA_IPI.Value                      := 0;
  cdsItemNFSaidaBASE_PIS.Value                          := 0;
  cdsItemNFSaidaP_ALIQUOTA_PIS.Value                    := 0;
  cdsItemNFSaidaQUANTIDADE_BC_PIS.Value                 := 0;
  cdsItemNFSaidaV_ALIQUOTA_PIS.Value                    := 0;
  cdsItemNFSaidaVALOR_PIS.Value                         := 0;
  cdsItemNFSaidaVALOR_BC_COFINS.Value                   := 0;
  cdsItemNFSaidaP_ALIQUOTA_COFINS.Value                 := 0;
  cdsItemNFSaidaQUANTIDADE_BC_COFINS.Value              := 0;
  cdsItemNFSaidaV_ALIQUOTA_COFINS.Value                 := 0;
  cdsItemNFSaidaVALOR_COFINS.Value                      := 0;
  cdsItemNFSaidaPERCENTUAL_ISS.Value                    := 0;
  cdsItemNFSaidaVALOR_ISS.Value                         := 0;
  cdsItemNFSaidaPERCENTUAL_IOF.Value                    := 0;
  cdsItemNFSaidaVALOR_IOF.Value                         := 0;
  cdsItemNFSaidaPERCENTUAL_CIDE.Value                   := 0;
  cdsItemNFSaidaVALOR_CIDE.Value                        := 0;
  cdsItemNFSaidaTOTAL_IMPOSTOS.Value                    := 0;
  cdsItemNFSaidaCARGA_TRIBUTARIA.Value                  := 0;
  cdsItemNFSaidaVALOR_FRETE.Value                       := 0;
  cdsItemNFSaidaCARGA_NAC_FEDERAL.Value                 := 0;
  cdsItemNFSaidaCARGA_IMP_FEDERAL.Value                 := 0;
  cdsItemNFSaidaCARGA_ESTADUAL.Value                    := 0;
  cdsItemNFSaidaCARGA_MUNICIPAL.Value                   := 0;
  cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL.Value           := 0;
  cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL.Value           := 0;
  cdsItemNFSaidaVALOR_CARGA_ESTADUAL.Value              := 0;
  cdsItemNFSaidaVALOR_CARGA_MUNICIPAL.Value             := 0;
  cdsItemNFSaidaORIGEM_MERCADORIA.Value                 := 0;
  cdsItemNFSaidaMERCADORIA_CONSUMO.Value                := 0;
  cdsItemNFSaidaOUTROS_VALORES.Value                    := 0;
  cdsItemNFSaidaBASE_CALC_ICMS_PART.Value               := 0;
  cdsItemNFSaidaPERCENTUAL_ICMS_PART.Value              := 0;
  cdsItemNFSaidaVALOR_ICMS_PART.Value                   := 0;
  cdsItemNFSaidaBASE_CALC_ICMS_STR_PART.Value           := 0;
  cdsItemNFSaidaPERCENTUAL_ICMS_ST_PART.Value           := 0;
  cdsItemNFSaidaVALOR_ICMS_ST_PART.Value                := 0;
  cdsItemNFSaidaBASE_CALC_OPERACAO_PART.Value           := 0;
  cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL.Value             := 0;
  cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL.Value         := 0;
  cdsItemNFSaidaVALOR_SEGURO.Value                      := 0;
  cdsItemNFSaidaALIQUOTA_CRED_SIMPLES.Value             := 0;
  cdsItemNFSaidaVALOR_CRED_ICMS_SIMPLES.Value           := 0;
  cdsItemNFSaidaPERC_BC_OPER_PROPRIA.Value              := 0;
  cdsItemNFSaidaBC_ICMS_OPERACAO_DIFERIMENTO.Value      := 0;
  cdsItemNFSaidaPERC_ICMS_DIFERIMENTO.Value             := 0;
  cdsItemNFSaidaVALOR_ICMS_DIFERIDO.Value               := 0;
  cdsItemNFSaidaPERC_REDUCAO_BC_ICMS_ST.Value           := 0;
  cdsItemNFSaidaMVA.Value                               := 0;
  cdsItemNFSaidaALIQUOTA_ICMS_ST.Value                  := 0;
  cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value       := 0;
  cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value     := 0;
  cdsItemNFSaidaPERC_DIFERENCIAL_ALIQUOTA.Value         := 0;
  cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value         := 0;
  cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value        := 0;
  cdsItemNFSaidaPERC_FCP.Value                          := 0;
  cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM.Value        := 0;
  cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO.Value       := 0;
  cdsItemNFSaidaVALOR_FCP_DESTINO.Value                 := 0;
  cdsItemNFSaidaISENTAS_NTRIB_ICMS_ST.Value             := 0;
  cdsItemNFSaidaPERCENTUAL_IPI_DEVOLVIDO.Value          := 0;
  cdsItemNFSaidaVALOR_IPI_DEVOLVIDO.Value               := 0;

end;

procedure TdmMProvider.cdsItemOrdemProducaoNewRecord(DataSet: TDataSet);
begin

  cdsItemOrdemProducaoFILIAL.Value                := dmDBEXMaster.iIdFilial;
  cdsItemOrdemProducaoQUANTIDADE_PREVISTA.Value   := 0;
  cdsItemOrdemProducaoQUANTIDADE_UTILIZADA.Value  := 0;
  cdsItemOrdemProducaoPERDA.Value                 := 0;
  cdsItemOrdemProducaoESTOQUE_ATUAL.Value         := 0;
  cdsItemOrdemProducaoFLAG_SALDO.Value            := 0;

end;

procedure TdmMProvider.cdsItemPedZeusCalcFields(DataSet: TDataSet);
begin

  cdsItemPedZeusSUB_TOTAL.Value := (cdsItemPedZeusQUANTIDADE.Value * cdsItemPedZeusVALOR_UNITARIO.Value);// - cdsItemPedZeusVALOR_DESCONTO.Value;

  case cdsItemPedZeusENTREGA.Value of
    0:cdsItemPedZeusS_ENTREGA_RETIRADO.Value  := 'RETIRADO';
    1:cdsItemPedZeusS_ENTREGA_RETIRADO.Value  := 'ENTREGA';
  end;

  case cdsItemPedZeusRESERVADO.Value of
    0:cdsItemPedZeusS_RESERVADO.Value  := '---------';
    1:cdsItemPedZeusS_RESERVADO.Value  := 'RESERVADO';
  end;

end;

procedure TdmMProvider.cdsItemPedZeusNewRecord(DataSet: TDataSet);
begin

  cdsItemPedZeusFILIAL.Value              := dmDBEXMaster.iIdFilial;
  cdsItemPedZeusPEDIDO.Value              := cdsPedidoZeusPEDIDO.Value;
  cdsItemPedZeusITEM_PEDIDO.Value         := -1;
  cdsItemPedZeusALIQUOTA_ICMS.Value       := 0;
  cdsItemPedZeusQUANTIDADE.Value          := 1;
  cdsItemPedZeusVALOR_UNITARIO.Value      := 0;
  cdsItemPedZeusVALOR_DESCONTO.Value      := 0;
  cdsItemPedZeusUSUARIO.Value             := dmDBEXMaster.sNomeUsuario;
  cdsItemPedZeusCONTROLE_ALTERACAO.Value  := 0;
  cdsItemPedZeusVALOR_ACRESCIMO.Value     := 0;
  cdsItemPedZeusENTREGA.Value             := 0;
  cdsItemPedZeusRESERVADO.Value           := 0;

end;

procedure TdmMProvider.cdsItemProducaoCalcFields(DataSet: TDataSet);
begin

  cdsItemProducaoTOTAL_CUSTO.Value := cdsItemProducaoQUANTIDADE.Value * cdsItemProducaoCUSTO_LIQUIDO.Value;
  cdsItemProducaoTOTAL_VENDA.Value := cdsItemProducaoQUANTIDADE.Value * cdsItemProducaoPRECO_VENDA.Value;

end;

procedure TdmMProvider.cdsItemProducaoNewRecord(DataSet: TDataSet);
begin

  cdsItemProducaoQUANTIDADE.Value     := 0;
  cdsItemProducaoPRODUCAO.Value       := cdsProducaoPRODUCAO.Value;
  cdsItemProducaoITEMPRODUCAO.Value   := -1;
  cdsItemProducaoPERDA.Value          := 0;

end;

procedure TdmMProvider.cdsItensPerdasNewRecord(DataSet: TDataSet);
begin

  cdsItensPerdasPERDA.Value           := cdsPerdasPERDAS.Value;
  cdsItensPerdasQUANTIDADE.Value      := 1;
  cdsItensPerdasVALOR_UNITARIO.Value  := 1;
  cdsItensPerdasVALOR_TOTAL.Value     := 1;

end;

procedure TdmMProvider.cdsItens_OS_PecasCalcFields(DataSet: TDataSet);
begin

  case cdsItens_OS_PecasTIPO.Value of
    0:cdsItens_OS_PecasDESCRICAO_TIPO.Value := 'INSUMOS';
    1:cdsItens_OS_PecasDESCRICAO_TIPO.Value := 'CONSUMO';
    2:cdsItens_OS_PecasDESCRICAO_TIPO.Value := 'REVENDA';
    3:cdsItens_OS_PecasDESCRICAO_TIPO.Value := 'AVULSA';
    4:cdsItens_OS_PecasDESCRICAO_TIPO.Value := 'PRODU��O';
    5:cdsItens_OS_PecasDESCRICAO_TIPO.Value := 'CAD SHO';
  end;

{
0 = INSUMOS
1 = CONSUMO
2 = REVENDA
3 = AVULSA
4 = PRODUCAO
5 = CAD SHO
}

end;

procedure TdmMProvider.cdsItens_OS_PecasNewRecord(DataSet: TDataSet);
begin

  cdsItens_OS_PecasITENS_OS_PECAS.Value := -1;
  cdsItens_OS_PecasORDEM_SERVICO.Value  := dmMProvider.cdsOrdemServicoORDEM_DE_SERVICO.Value;
  cdsItens_OS_PecasVALOR_UNITARIO.Value := 1;
  cdsItens_OS_PecasQUANTIDADE.Value     := 1;
  cdsItens_OS_PecasVALOR_TOTAL.Value    := 1;
  cdsItens_OS_PecasDIA.AsDateTime       := now;
  cdsItens_OS_PecasX_PED.Value          := '';
  cdsItens_OS_PecasN_ITEM_PED.Value     := '';
  cdsItens_OS_PecasNUMERO_SERIE.Value   := '';
  cdsItens_OS_PecasTIPO.Value           := 0;
  cdsItens_OS_PecasUSUARIO.Value        := dmDBEXMaster.iIdUsuario;
  cdsItens_OS_PecasSTATUS_SALDO.Value   := 0;

end;

procedure TdmMProvider.cdsItens_OS_servicoCalcFields(DataSet: TDataSet);
begin

  case cdsItens_OS_servicoTIPO.Value of
    0:cdsItens_OS_servicoDESCRICAO_TIPO.Value := 'Padr�o';
    1:cdsItens_OS_servicoDESCRICAO_TIPO.Value := 'Avulso';
    2:cdsItens_OS_servicoDESCRICAO_TIPO.Value := 'CAD SHO';
  end;

end;

procedure TdmMProvider.cdsItens_OS_servicoNewRecord(DataSet: TDataSet);
begin

  dmMSProcedure.fdspMaster.StoredProcName     := 'RETORNAR_GNR_ITEM_OS_SERVICO';
  dmMSProcedure.fdspMaster.Prepare;
  dmMSProcedure.fdspMaster.ExecProc;

  cdsItens_OS_servicoITENS_OS_SERVICOS.Value  := dmMSProcedure.fdspMaster.Params[0].Value + 1;
  cdsItens_OS_servicoORDEM_SERVICO.Value      := dmMProvider.cdsOrdemServicoORDEM_DE_SERVICO.Value;
  cdsItens_OS_servicoVALOR_CUSTO.Value        := 1;
  cdsItens_OS_servicoTIPO.Value               := 0;
  cdsItens_OS_servicoQUANTIDADE.Value         := 1;
  cdsItens_OS_servicoCUSTO_TOTAL.Value        := 1;
  cdsItens_OS_servicoCUSTO_TOTAL.Value        := 1;
  cdsItens_OS_servicoDATA_INICIO.Value        := date;
  cdsItens_OS_servicoHORA_INICIO.Value        := time;
  cdsItens_OS_servicoDATA_FIM.Value           := date;
  cdsItens_OS_servicoHORA_FIM.Value           := time;
  cdsItens_OS_servicoTIPO_COBRANCA.Value      := 0;
  cdsItens_OS_servicoUSUARIO.Value            := dmDBEXMaster.iIdUsuario;

end;

procedure TdmMProvider.cdsLivroFiscalSaidaNewRecord(DataSet: TDataSet);
begin

  cdsLivroFiscalSaidaLIVRO_SAIDA.Value                := -1;
  cdsLivroFiscalSaidaFILIAL.Value                     := dmDBEXMaster.iIdFilial;
  cdsLivroFiscalSaidaMES_ANO.Value                    := FormatDateTime('mmyyyy',Date);
  cdsLivroFiscalSaidaDATA_DOCUMENTO.Value             := Date;
  cdsLivroFiscalSaidaVALOR_CONTABIL.Value             := 0;
  cdsLivroFiscalSaidaCODIGO_CONTABIL.Value            := 0;
  cdsLivroFiscalSaidaBASE_CALCULO.Value               := 0;
  cdsLivroFiscalSaidaALIQUOTA.Value                   := 0;
  cdsLivroFiscalSaidaIMPOSTO_DEBITADO.Value           := 0;
  cdsLivroFiscalSaidaISENTAS_NAO_TRIBUTADAS.Value     := 0;
  cdsLivroFiscalSaidaOUTRAS.Value                     := 0;
  cdsLivroFiscalSaidaCRZ.Value                        := 0;
  cdsLivroFiscalSaidaTOTALIZADOR_GERAL.Value          := 0;
  cdsLivroFiscalSaidaIDENTIFICACAO_ICMS_IPI.Value     := 0;

end;

procedure TdmMProvider.cdsLogSysCalcFields(DataSet: TDataSet);
begin

  case cdsLogSysOP_OPERACAO.Value of
    0:cdsLogSysS_OPERACAO.Value := 'INCLUS�O';
    1:cdsLogSysS_OPERACAO.Value := 'ALTERA��O';
    2:cdsLogSysS_OPERACAO.Value := 'EXCLUS�O';
    3:cdsLogSysS_OPERACAO.Value := 'A��O';
    4:cdsLogSysS_OPERACAO.Value := 'ERRO';
  end;

end;

procedure TdmMProvider.cdsMVANewRecord(DataSet: TDataSet);
begin

  cdsMVAPRODUTO.Value             := dmMProvider.cdsProdutosPRODUTO.Value;
  cdsMVAMARGEM_MVA.Value          := 0;
  cdsMVAICMS_INTERESTADUAL.Value  := 0;
  cdsMVAICMS_INTERNO.Value        := 0;

end;

procedure TdmMProvider.cdsNcmNbsNewRecord(DataSet: TDataSet);
begin

  cdsNcmNbsNCM_NBS.Value              := 0;
  cdsNcmNbsCARGA_NAC_FEDERAL.Value    := 0;
  cdsNcmNbsCARGA_IMP_FEDERAL.Value    := 0;
  cdsNcmNbsCARGA_ESTADUAL.Value       := 0;
  cdsNcmNbsCARGA_MUNICIPAL.Value      := 0;
  cdsNcmNbsALIQUOTA_NACIONAL.Value    := 0;
  cdsNcmNbsALIQUOTA_IMPORTACAO.Value  := 0;
  cdsNcmNbsALIQ_EX_NAC_TIPI.Value     := 0;
  cdsNcmNbsALIQ_EX_IMP_TIPI.Value     := 0;
  cdsNcmNbsDATA_INICIO.Value          := date;
  cdsNcmNbsDATA_TERMINO.Value         := date + 180;

end;

procedure TdmMProvider.cdsNFEntradaCalcFields(DataSet: TDataSet);
begin

  dmDBEXMaster.fdqConhecimentoFrete.Close;
  dmDBEXMaster.fdqConhecimentoFrete.SQL.Clear;
  dmDBEXMaster.fdqConhecimentoFrete.SQL.Add('SELECT CNPJ FROM CONHECIMENTO_FRETE');
  dmDBEXMaster.fdqConhecimentoFrete.SQL.Add('WHERE NF_ENTRADA = ' + IntToStr(cdsNFEntradaNFENTRADA.Value));
  dmDBEXMaster.fdqConhecimentoFrete.Open;

  if dmDBEXMaster.fdqConhecimentoFrete.IsEmpty then
    cdsNFEntradaCOM_FRETE.Value := '---'
  else
    cdsNFEntradaCOM_FRETE.Value := 'SIM';

  dmDBEXMaster.fdqConhecimentoFrete.Close;

  if cdsNFEntradaCANCELADA.Value = 0 then
  begin

    case cdsNFEntradaSTATUS.Value of
      0:cdsNFEntradaDESCRICAO_STATUS.Value := 'A CONFIRMAR';
      1:cdsNFEntradaDESCRICAO_STATUS.Value := 'CONFIRMADA';
    end;

  end
  else
    cdsNFEntradaDESCRICAO_STATUS.Value := 'CANCELADA';


end;

procedure TdmMProvider.cdsNFEntradaEMISSAOSetText(Sender: TField;
  const Text: string);
begin

  try

    Sender.Value := StrToDate(Text);

  except

    dmDBEXMaster.sMSG_Erro  := MSG_DATA_INVALIDA + ' - ' + Text ;
    TocarSomAlerta(ord(SystemHand));

  end;

end;

procedure TdmMProvider.cdsNFEntradaNewRecord(DataSet: TDataSet);
begin

  cdsNFEntradaENTRADA.Value                       := Date;
  cdsNFEntradaEMISSAO.Value                       := Date;
  cdsNFEntradaSAIDA.Value                         := Date;
  cdsNFEntradaTIPOFRETE.Value                     := 0;
  cdsNFEntradaFRETEAGREGADO.Value                 := 0;
  cdsNFEntradaBASEICMS.Value                      := 0;
  cdsNFEntradaVALORICMS.Value                     := 0;
  cdsNFEntradaBASESUBSTITUICAO.Value              := 0;
  cdsNFEntradaVALORSUBSTITUICAO.Value             := 0;
  cdsNFEntradaVALORDOFRETE.Value                  := 0;
  cdsNFEntradaVALORDOSEGURO.Value                 := 0;
  cdsNFEntradaVALORDOIPI.Value                    := 0;
  cdsNFEntradaVALORDOSPRODUTOS.Value              := 0;
  cdsNFEntradaVALORDANOTA.Value                   := 0;
  cdsNFEntradaDESCONTOGERAL.Value                 := 0;
  cdsNFEntradaPESOBRUTO.Value                     := 0;
  cdsNFEntradaPESOLIQUIDO.Value                   := 0;
  cdsNFEntradaQUANTIDADEVOLUME.Value              := 0;
  cdsNFEntradaNUMEROVOLUME.Value                  := 0;
  cdsNFEntradaSTATUS.Value                        := 0;
  cdsNFEntradaCANCELADA.Value                     := 0;
  cdsNFEntradaRATEAR_DESCONTO.Value               := 0;
  cdsNFEntradaTIPO_CONTABIL.Value                 := 0;
  cdsNFEntradaCODIGO_VALOR_FISCAL.Value           := 0;
  cdsNFEntradaSOMAR_DESPACESS_BASEICMS.Value      := 0;
  cdsNFEntradaSOMAR_IPI_BASEICMS.Value            := 0;
  cdsNFEntradaSOMAR_ICMSR_VALORNOTA.Value         := 0;
  cdsNFEntradaREDUCAO_PIS_COFINS.Value            := 0;
  cdsNFEntradaALIQUOTA_CREDITO_SIMPLES.Value      := 0;
  cdsNFEntradaVALOR_PIS.Value                     := 0;
  cdsNFEntradaVALOR_COFINS.Value                  := 0;
  cdsNFEntradaVALOR_PIS_ST.Value                  := 0;
  cdsNFEntradaVALOR_COFINS_ST.Value               := 0;
  cdsNFEntradaOUTRASDESPESAS.Value                := 0;
  cdsNFEntradaSITUACAO_DOCUMENTO.Value            := '0';


end;

procedure TdmMProvider.cdsNFSaidaCalcFields(DataSet: TDataSet);
begin

  case cdsNFSaidaSTATUS.Value  of
    0:cdsNFSaidaS_STATUS.Value := 'A CONFIRMAR';
    1:cdsNFSaidaS_STATUS.Value := 'CONFIRMADA';
    2:cdsNFSaidaS_STATUS.Value := 'CANCELADA';
    3:cdsNFSaidaS_STATUS.Value := 'DENEGADA';
  end;

end;

procedure TdmMProvider.cdsNFSaidaNewRecord(DataSet: TDataSet);
begin

  cdsNFSaidaEMISSAO.Value                         := Date;
  cdsNFSaidaHORA_EMISSAO.Value                    := Time;
  cdsNFSaidaSAIDA.Value                           := Date;
  cdsNFSaidaHORASAIDA.Value                       := Time;
  cdsNFSaidaBASECALCULOICMS.Value                 := 0;
  cdsNFSaidaVALORICMS.Value                       := 0;
  cdsNFSaidaBASESUBSTITUICAO.Value                := 0;
  cdsNFSaidaVALORSUBSTITUICAO.Value               := 0;
  cdsNFSaidaVALORDOSPRODUTOS.Value                := 0;
  cdsNFSaidaVALORDOFRETE.Value                    := 0;
  cdsNFSaidaVALORDOSEGURO.Value                   := 0;
  cdsNFSaidaOUTRASDESPESAS.Value                  := 0;
  cdsNFSaidaVALORDOIPI.Value                      := 0;
  cdsNFSaidaVALORDANOTA.Value                     := 0;
  {OBRIGAR O USU�RIO A ESCOLHER O TIPO DE FRETE}
  //  cdsNFSaidaTIPOFRETE.Value                       := 0;
  cdsNFSaidaQUANTIDADEVOLUME.Value                := 0;
  cdsNFSaidaFILIAL.Value                          := dmDBEXMaster.iIdFilial;
  cdsNFSaidaTIPO_ATENDIMENTO.Value                := 0;

{

  ****** campos n�o s�o obrigat�rios  *******

  cdsNFSaidaESPECIEVOLUME: TStringField
  cdsNFSaidaMARCAVOLUME: TStringField
  cdsNFSaidaNUMEROVOLUME: TIntegerField

}

  cdsNFSaidaPESOBRUTO.Value                       := 0;
  cdsNFSaidaPESOLIQUIDO.Value                     := 0;

{

  criar status

  0 - normal
  1 - confirmada
  2 - cancelada
  3 - denegada

}

  cdsNFSaidaSTATUS.Value                          := 0;

{
  ***** campo obsoleto IMPRESSO  *******
}

  cdsNFSaidaIMPRESSO.Value                        := 0;
  cdsNFSaidaMODELO.Value                          := cdsConfiguracoesMODELO.Value;


{

  ***** campo obsoleto   *******

  cdsNFSaidaFORMAPAGAMENTO: TIntegerField

  cdsNFSaidaPEDIDOEXTERNO: TStringField
  cdsNFSaidaFUNCIONARIO: TIntegerField

}

  cdsNFSaidaCOMISSAO.Value                        := 0;
  cdsNFSaidaTIPOCOBRANCA.Value                    := 0;


  //verificar a necessidade desse campos - inicio
  cdsNFSaidaVALORDOSPRODUTOSREAL.Value            := 0;
  cdsNFSaidaDESCONTOCALCULADO.Value               := 0;
  cdsNFSaidaDESCONTOCALCULADOREAL.Value           := 0;
  cdsNFSaidaPERCENTUAL.Value                      := 0;
  cdsNFSaidaVALORCUPOMFISCAL.Value                := 0;
  //  cdsNFSaidaDATACUPOMFISCAL: TDateField
  // fim - verificar a necessidade desse campos

  cdsNFSaidaDESCONTO_ST.Value                     := 0;

  //desvincluar campos obsoleto
  cdsNFSaidaCANCELADA.Value                       := 0;

  cdsNFSaidaTIPO_CONTABIL.Value                   := 0;

  //campo tipo do documento nfe
  cdsNFSaidaENTRADA_SAIDA.Value                   := 0; { 0-saida / 1-entrada }

  cdsNFSaidaBASE_ISSQN_R.Value                    := 0;
  cdsNFSaidaVALOR_ISSQN_R.Value                   := 0;

  // verificar o que � esse campo
//  cdsNFSaidaC_M_C: TStringField

  cdsNFSaidaTOTAL_DOS_SERVICOS.Value              := 0;
  cdsNFSaidaPERCENTUAL_PIS.Value                  := 0;
  cdsNFSaidaVALOR_PIS.Value                       := 0;
  cdsNFSaidaPERCENTUAL_COFINS.Value               := 0;
  cdsNFSaidaVALOR_COFINS.Value                    := 0;

  cdsNFSaidaPERCENTUAL_CSLL.Value                 := 0;
  cdsNFSaidaVALOR_CSLL.Value                      := 0;
  cdsNFSaidaPERCENTUAL_IRRF.Value                 := 0;
  cdsNFSaidaVALOR_IRRF.Value                      := 0;
  cdsNFSaidaPERCENTUAL_INSS.Value                 := 0;
  cdsNFSaidaVALOR_INSS.Value                      := 0;
  cdsNFSaidaBASE_ISSQN.Value                      := 0;
  cdsNFSaidaVALOR_ISSQN.Value                     := 0;
  cdsNFSaidaRETER_PIS.Value                       := 0;
  cdsNFSaidaRETER_COFINS.Value                    := 0;
  cdsNFSaidaRETER_CSLL.Value                      := 0;
  cdsNFSaidaRETER_INSS.Value                      := 0;
  cdsNFSaidaRETER_IRRF.Value                      := 0;
  cdsNFSaidaRETER_ISSQN.Value                     := 0;

  cdsNFSaidaDANFE_CANCELADA.Value                 := 0;
  cdsNFSaidaDANFE_INUTILIZADA.Value               := 0;
  cdsNFSaidaDANFE_CONTINGENCIA.Value              := 0;
  cdsNFSaidaSERIE.Value                           := cdsConfiguracoesSERIE.Value;

  cdsNFSaidaVALOR_IOF.Value                       := 0;
  cdsNFSaidaVALOR_CIDE.Value                      := 0;
  cdsNFSaidaVALOR_ISS.Value                       := 0;

  cdsNFSaidaVALOR_TOTAL_IMPOSTOS.Value            := 0;

  cdsNFSaidaVALOR_ICMS_12741.Value                := 0;
  cdsNFSaidaCARGA_TRIBUTARIA.Value                := 0;

  cdsNFSaidaFINALIDADE_NF.Value                   := 0; { 0-Normal, 1-Complementar, 2-Ajuste, 3-Devolu��o}
  cdsNFSaidaCANCELAMENTO_ESTEMPORANEO.Value       := 0; {0-N�o / 1-Sim}
  cdsNFSaidaCARGA_NAC_FEDERAL.Value               := 0;
  cdsNFSaidaCARGA_IMP_FEDERAL.Value               := 0;
  cdsNFSaidaCARGA_ESTADUAL.Value                  := 0;
  cdsNFSaidaCARGA_MUNICIPAL.Value                 := 0;
  cdsNFSaidaVALOR_CARGA_NAC_FEDERAL.Value         := 0;
  cdsNFSaidaVALOR_CARGA_IMP_FEDERAL.Value         := 0;
  cdsNFSaidaVALOR_CARGA_ESTADUAL.Value            := 0;
  cdsNFSaidaVALOR_CARGA_MUNICIPAL.Value           := 0;

//  cdsNFSaidaCONSUMIDOR_FINAL.Value                := 0; {0-N�O / 1-SIM}
  cdsNFSaidaDESTINO_OPERACAO.Value                := 0; { 1-Interna / 2-Interestadual / 3-Exterior }
  cdsNFSaidaLOCAL_RETIRADA.Value                  := 0; {0-n�o � diferete do emitene / 1-� diferente do emitente}
  cdsNFSaidaLOCAL_ENTREGA.Value                   := 0; {0-n�o � diferete do destinat�rio / 1-� diferente do destinat�rio}
  cdsNFSaidaTOTAL_ICMS_DESONERADO.Value           := 0;
  cdsNFSaidaTRANSPORTADOR_ISENTO_ICMS.Value       := 0; {0-N�O / 1-SIM}

  cdsNFSaidaVALOR_FCP_UF_DESTINO.Value            := 0;
  cdsNFSaidaVALOR_ICMS_UF_DESTINO.Value           := 0;
  cdsNFSaidaVALOR_ICMS_UF_REMETENTE.Value         := 0;
  cdsNFSaidaVALOR_ENTRADA.Value                   := 0;

  if (UpperCase(dmMProvider.cdsPesqClientesINSCRICAO.AsString) = 'ISENTO') and (dmMProvider.cdsPesqClientesESTADOENTREGA.Value <> dmMProvider.cdsFilialESTADO.Value)then
    dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value := 9  { n�o contribuinte}
  else if (UpperCase(dmMProvider.cdsPesqClientesINSCRICAO.AsString) = 'ISENTO')then
    dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value := 2 { isento }
  else
    dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value := 1; { contribuinte }

  if Length(Trim(dmMProvider.cdsPesqClientesCNPJ.Value)) <= 11 then
    dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value := 9; { n�o contribuinte}

end;

procedure TdmMProvider.cdsOrdemProducaoCalcFields(DataSet: TDataSet);
begin

  cdsOrdemProducaoQUANT_PRODUZIDA.Value := (dmMProvider.cdsOrdemProducaoRENDIMENTO.Value * dmMProvider.cdsOrdemProducaoQUANTIDADE.Value );

  case cdsOrdemProducaoSITUACAO.Value of
    0:cdsOrdemProducaoS_SITUACAO.Value      := 'PENDENTE';
    1:cdsOrdemProducaoS_SITUACAO.Value      := 'FINALIZADA'
  end;

  case cdsOrdemProducaoTIPO_PRODUCAO.Value of
    0:cdsOrdemProducaoS_TIPO_PRODUCAO.Value := 'IMEDIATA';
  end;

end;

procedure TdmMProvider.cdsOrdemProducaoNewRecord(DataSet: TDataSet);
begin

  dmMSProcedure.fdspMaster.StoredProcName := 'PROXORDEM_DE_PRODUCAO';
  dmMSProcedure.fdspMaster.Prepare;
  dmMSProcedure.fdspMaster.ExecProc;

  cdsOrdemProducaoORDEM_DE_PRODUCAO.Value   := dmMSProcedure.fdspMaster.Params[0].Value;
  cdsOrdemProducaoFILIAL.Value              := dmDBEXMaster.iIdFilial;
  cdsOrdemProducaoSITUACAO.Value            := 0;
  cdsOrdemProducaoDATA_INICIO.Value         := Date;
  cdsOrdemProducaoDATA_PREVISTA.Value       := Date;
  cdsOrdemProducaoDATA_TERMINO.Value        := Date;
  cdsOrdemProducaoQUANTIDADE.Value          := 1;
  cdsOrdemProducaoTIPO_PRODUCAO.Value       := 0;
  cdsOrdemProducaoRENDIMENTO.Value          := 0;
  cdsOrdemProducaoESTOQUE_ATUAL.Value       := 0;

  dmMSProcedure.fdspMaster.Unprepare;

end;

procedure TdmMProvider.cdsOrdemServicoCalcFields(DataSet: TDataSet);
begin

  if cdsOrdemServicoDATA_TERMINO.Value <= 0 then
     cdsOrdemServicoDESCRICAO_STATUS.Value := 'ABERTA'
  else
     cdsOrdemServicoDESCRICAO_STATUS.Value := 'ENCERRADA';

end;

procedure TdmMProvider.cdsOrdemServicoNewRecord(DataSet: TDataSet);
begin

  cdsOrdemServicoORDEM_DE_SERVICO.Value             := -1;
  cdsOrdemServicoDATA_ENTRADA.AsDateTime            := Date;
  cdsOrdemServicoHORA_ENTRADA.AsDateTime            := Time;
  cdsOrdemServicoVALOR_MAO_DE_OBRA.Value            := 0;
  cdsOrdemServicoVALOR_PECAS.Value                  := 0;
  cdsOrdemServicoVALOR_DESLOCAMENTO.Value           := 0;
  cdsOrdemServicoVALOR_TERCEIRO.Value               := 0;
  cdsOrdemServicoVALOR_OUTROS.Value                 := 0;
  cdsOrdemServicoEM_USO.Value                       := 0;
  cdsOrdemServicoOS_OUTROS.Value                    := 0;
  cdsOrdemServicoOS_OUTROS_EMIT.Value               := 0;
  cdsOrdemServicoVALOR_SINAL.Value                  := 0;
  cdsOrdemServicoPRIORIDADE.Value                   := 1;
  cdsOrdemServicoVALOR_NF.Value                     := 0;
  cdsOrdemServicoVALOR_FRETE.Value                  := 0;
  cdsOrdemServicoVALOR_SEGURO.Value                 := 0;
  cdsOrdemServicoUSUARIO_MICRO.Value                := dmDBEXMaster.sNomeUsuario + '-' + pubNomeComputador;
  cdsOrdemServicoVALOR_TOTAL_OS.Value               := 0;
  cdsOrdemServicoCODIGO_SITUACAO.Value              := dmMProvider.cdsSituacoes_OSCODIGO_SITUACAO.Value;
  cdsOrdemServicoFUNCIONARIO.Value                  := dmMProvider.cdsFuncionariosFUNCIONARIO.Value;
  cdsOrdemServicoOS_REABERTA.Value                  := 0;
  cdsOrdemServicoTOTAL_HORAS.Value                  := 0;

end;

procedure TdmMProvider.cdsParamIntegraPDVNewRecord(DataSet: TDataSet);
begin

  cdsParamIntegraPDVMODELO_PDV.Value                        := cdsConfiguracoesMODELOPDV.Value;

  case cdsParamIntegraPDVMODELO_PDV.Value of
    4:begin

        cdsParamIntegraPDVTIPO_INTEGRACAO_EXPORTACAO.Value        := 0;
        cdsParamIntegraPDVTIPO_INTEGRACAO_IMPORTACAO.Value        := 0;
        cdsParamIntegraPDVARREDONDA_TRUNCA.Value                  := 0;
        cdsParamIntegraPDVPASTA_EXPORTACAO.Value                  := 'C:\DJSYSTEM\MONITOR\Exportar\'; //verificar instala��o dj pdv
        cdsParamIntegraPDVPASTA_IMPORTACAO.Value                  := 'C:\DJSYSTEM\MONITOR\Importar\'; //verificar instala��o dj pdv
        cdsParamIntegraPDVARQUIVO_PRODUTOS.Value                  := 'PRODUTO.TXT';
        cdsParamIntegraPDVARQUIVO_COD_BARRAS.Value                := 'BARRAS.TXT';
        cdsParamIntegraPDVARQUIVO_MONTAGEM_KIT.Value              := 'KIT.TXT';
        cdsParamIntegraPDVARQUIVO_CLIENTES.Value                  := 'CLIENTES.TXT';
        cdsParamIntegraPDVARQUIVO_AUTORIZADOS_CLIENTE.Value       := 'AUTORIZA.TXT';
        cdsParamIntegraPDVARQUIVO_LISTA_NEGRA.Value               := 'LISTANEG.TXT';
        cdsParamIntegraPDVARQUIVO_VENDEDOR.Value                  := 'VENDEDOR.TXT';
        cdsParamIntegraPDVARQUIVO_COFINS.Value                    := 'COFINS.TXT';
        cdsParamIntegraPDVARQUIVO_COFINS_ST.Value                 := 'COFINSST.TXT';
        cdsParamIntegraPDVARQUIVO_ICMS.Value                      := 'ICMS.TXT';
        cdsParamIntegraPDVARQUIVO_IMPOSTO_IMPORTACAO.Value        := 'II.TXT';
        cdsParamIntegraPDVARQUIVO_IPI.Value                       := 'IPI.TXT';
        cdsParamIntegraPDVARQUIVO_ISSQN.Value                     := 'ISSQN.TXT';
        cdsParamIntegraPDVARQUIVO_PIS.Value                       := 'PIS.TXT';
        cdsParamIntegraPDVARQUIVO_PIS_ST.Value                    := 'PISST.TXT';
        cdsParamIntegraPDVARQUIVO_TRANSPORTADORAS.Value           := 'TRANSPOR.TXT';
        cdsParamIntegraPDVARQUIVO_TRANSPORTADORA_VEICULOS.Value   := 'VEICULO.TXT';
        cdsParamIntegraPDVARQUIVO_FORMA_PAGAMENTO.Value           := 'FPAGTO.TXT';
        cdsParamIntegraPDVARQUIVO_PLANO_PAGAMENTO.Value           := 'PLAPAGTO.TXT';
        cdsParamIntegraPDVARQUIVO_ADMINISTRADORAS_CARTAO.Value    := 'ADMIN.TXT';
        cdsParamIntegraPDVARQUIVO_PERGUNTAS_LISTA_VEZ.Value       := 'PERGUNTA.TXT';
        cdsParamIntegraPDVARQUIVO_MOTIVO_CANCELAMENTO.Value       := 'MOTIVOCA.TXT';
        cdsParamIntegraPDVARQUIVO_MOTIVO_DESCONTO.Value           := 'MOTIVODC.TXT';
        cdsParamIntegraPDVARQUIVO_MOTIVO_DEVOLUCAO.Value          := 'MOTIVOVC.TXT';
        cdsParamIntegraPDVARQUIVO_OPERADORES.Value                := 'OPERADOR.TXT';
        cdsParamIntegraPDVARQUIVO_NCM.Value                       := 'IBPTTAX.CSV';
        cdsParamIntegraPDVARQUIVO_PRE_VENDA.Value                 := '99999999.DJP';
        cdsParamIntegraPDVARQUIVO_RESPOSTA_PRE_VENDA.Value        := '99999999.DJR';
        cdsParamIntegraPDVARQUIVO_KARDEX.Value                    := '99999999.KDX';
        cdsParamIntegraPDVARQUIVO_ATUALIZACAO_PRECO.Value         := 'PRECO.TXT';
        cdsParamIntegraPDVARQUIVO_CEST.Value                      := 'CEST.CSV';
        cdsParamIntegraPDVARQUIVO_ANP.Value                       := 'CODIGOANP.CSV';
        cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value            := 0;

      end;

  end;

end;

procedure TdmMProvider.cdsParcelasNFENewRecord(DataSet: TDataSet);
begin

  cdsParcelasNFEVALOR.Value       := 0;
  cdsParcelasNFEVENCIMENTO.Value  := Date + 30;

end;

procedure TdmMProvider.cdsParcelasNFSNewRecord(DataSet: TDataSet);
begin

  cdsParcelasNFSPARCELASNFSAIDA.Value := cdsParcelasNFS.RecordCount + 1;
  cdsParcelasNFSNFSAIDA.Value         := cdsNFSaidaNFSAIDA.Value;
  cdsParcelasNFSVALOR.Value           := 0;
  cdsParcelasNFSMODELO.Value          := cdsNFSaidaMODELO.Value;
  cdsParcelasNFSFILIAL.Value          := dmDBEXMaster.iIdFilial;

end;

procedure TdmMProvider.cdsParcelasOSNewRecord(DataSet: TDataSet);
begin

  cdsParcelasOSORDEM_SERVICO.Value          := cdsOrdemServicoORDEM_DE_SERVICO.Value;
  cdsParcelasOSVALOR.Value                  := 0;

end;

procedure TdmMProvider.cdsParticipantesCalcFields(DataSet: TDataSet);
begin

  cdsParticipantesLIMITE_DISPONIVEL.Value := (cdsParticipantesLIMITE_CREDITO.Value  - cdsParticipantesSALDO_DEVEDOR.Value);

end;

procedure TdmMProvider.cdsParticipantesCNPJ_CPF_CEIGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  fMask: string;
begin

  if DisplayText then // n�o formatar na edi��o
  begin

    case Length(Sender.AsString) of
      11: fMask := MASCARA_CPF;
      12: fMask := MASCARA_CEI;
      14: fMask := MASCARA_CNPJ;
    else
      fMask := '';
    end;

    //declarar no uses MaskUtils
    Text := FormatMaskText(fMask, Sender.AsString);

  end;

end;

procedure TdmMProvider.cdsParticipantesNewRecord(DataSet: TDataSet);
begin

  cdsParticipantesPARTICIPANTE.Value                            := 0;
  cdsParticipantesFILIAL.Value                                  := dmDBEXMaster.iIdFilial;
  cdsParticipantesATIVO.Value                                   := 1;
  cdsParticipantesSTATUS_CREDITO.Value                          := 0;
  cdsParticipantesDATA_CADASTRO.Value                           := Date;
  cdsParticipantesPESSOA_FISICA_JURIDICA.Value                  := 0;
  cdsParticipantesCODIGO_PAIS.Value                             := cdsFilialPAIS.Value;
  cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value                   := 0;
  cdsParticipantesGARANTIDOR_OS.Value                           := 0;
  cdsParticipantesPRODUTOR_RURAL.Value                          := 0;
  cdsParticipantesTIPO_INSCRICAO_FEDERAL.Value                  := 0;
  cdsParticipantesRENDA.Value                                   := 0;
  cdsParticipantesLIMITE_CREDITO.Value                          := 0;
  cdsParticipantesSALDO_DEVEDOR.Value                           := 0;
  cdsParticipantesCLIENTE_FORNECEDOR.Value                      := 0;
  cdsParticipantesPERMITE_VENDA_STATUS_BLOQUEADO.Value          := 0;
  cdsParticipantesDESCONTO_PERSONALIZADO.Value                  := 0;
  cdsParticipantesTIPO_LOGRADOURO.Value                         := 0;

end;

procedure TdmMProvider.cdsPedidoZeusCalcFields(DataSet: TDataSet);
begin

  case cdsPedidoZeusPEDIDO_ORCAMENTO.Value of
    0:cdsPedidoZeusS_ORCAMENTO_PEDIDO.Value := 'OR�AMENTO';
    1:cdsPedidoZeusS_ORCAMENTO_PEDIDO.Value := 'PEDIDO';
  end;

end;

procedure TdmMProvider.cdsPedidoZeusNewRecord(DataSet: TDataSet);
begin

  cdsPedidoZeusPEDIDO.Value               := -1;
  cdsPedidoZeusFILIAL.Value               := dmDBEXMaster.iIdFilial;
  cdsPedidoZeusEMISSAO.Value              := Date;
  cdsPedidoZeusLOJA_SAI_MERCADORIA.Value  := dmDBEXMaster.iIdFilial;
  cdsPedidoZeusENTREGA.Value              := 0;
  cdsPedidoZeusSITUACAO.Value             := 0;
  cdsPedidoZeusNUMERO_ITENS_PEDIDO.Value  := 0;
  cdsPedidoZeusVALIDADE_PEDIDO.Value      := Date + cdsConfiguracoesVALIDADE_ORCAMENTO.Value;
  cdsPedidoZeusDATA_ENTREGA.Value         := Date;
  cdsPedidoZeusVALOR_DESCONTO.Value       := 0;
  cdsPedidoZeusHORARIO_PEDIDO.Value       := Time;
  cdsPedidoZeusUSUARIO.Value              := dmDBEXMaster.sNomeUsuario;
  cdsPedidoZeusCONTROLE_ALTERACAO.Value   := 0;
  cdsPedidoZeusSITUACAO_ERP.Value         := 0;
  cdsPedidoZeusVALOR_DO_PEDIDO.Value      := 0;
  cdsPedidoZeusSITUACAO_DAV.Value         := 0;
  cdsPedidoZeusVALOR_ACRESCIMO.Value      := 0;
  cdsPedidoZeusPEDIDO_ORCAMENTO.Value     := 0;
  cdsPedidoZeusTOTAL_MERCADORIAS.Value    := 0;

end;

procedure TdmMProvider.cdsPerdasNewRecord(DataSet: TDataSet);
begin

  cdsPerdasDATA_LANCAMENTO.Value  := date;
  cdsPerdasTOTAL_QUANTIDADE.Value := 1;
  cdsPerdasVALOR_TOTAL.Value      := 1;

end;

procedure TdmMProvider.cdsPesqProdutosCalcFields(DataSet: TDataSet);
begin

  cdsPesqProdutosSALDO_ATUAL.Value := cdsPesqProdutosLOJA.Value + cdsPesqProdutosDEPOSITO.Value + cdsPesqProdutosSALDO_ALMOXARIFADO.Value+ cdsPesqProdutosSALDO_RESERVADO.Value;

end;

procedure TdmMProvider.cdsProducaoCalcFields(DataSet: TDataSet);
begin

  CalcularTotaisProducao(cdsProducaoPRODUCAO.Value);

  if not dmDBEXMaster.fdqTotalizarItemProduc.IsEmpty then
  begin

    cdsProducaoCUSTO_TOTAL.Value := dmDBEXMaster.fdqTotalizarItemProduc.FieldByName('OP_TOTAL_CUSTO').Value;
    cdsProducaoVENDA_TOTAL.Value := dmDBEXMaster.fdqTotalizarItemProduc.FieldByName('OP_TOTAL_VENDA').Value;
    cdsProducaoVALOR_TOTAL.Value := cdsProducaoVENDA_TOTAL.Value - cdsProducaoVALOR_DESCONTO.Value;

  end;

end;

procedure TdmMProvider.cdsProducaoNewRecord(DataSet: TDataSet);
begin

  cdsProducaoRENDIMENTO.Value     := 0;
  cdsProducaoVALOR_DESCONTO.Value := 0;
  cdsProducaoCUSTO_TOTAL.Value    := 0;
  cdsProducaoVENDA_TOTAL.Value    := 0;
  cdsProducaoVALOR_TOTAL.Value    := 0;

end;

procedure TdmMProvider.cdsProdutoFilialCalcFields(DataSet: TDataSet);
begin

  cdsProdutoFilialSALDO_TOTAL.Value := (cdsProdutoFilialLOJA.Value + cdsProdutoFilialDEPOSITO.Value + cdsProdutoFilialSALDO_RESERVADO.Value + cdsProdutoFilialSALDO_ALMOXARIFADO.Value);

  case cdsProdutoFilialPROMOCAO.Value of
    0:begin

        cdsProdutoFilialV_ICMS_PAGAR.Value         := cdsProdutoFilialPRECODEVENDA.Value  * (cdsProdutoFilialICMSAPAGAR.Value /100);
        cdsProdutoFilialV_IMPOSTOS_FEDERAIS.Value  := cdsProdutoFilialPRECODEVENDA.Value  * (cdsProdutoFilialIMPOSTOSFEDERAIS.Value /100);
        cdsProdutoFilialV_CUSTO_OPERACIONAL.Value  := cdsProdutoFilialPRECODEVENDA.Value  * (cdsProdutoFilialCUSTOOPERACIONAL.Value /100);
        cdsProdutoFilialV_COMISSAO_VENDA.Value     := cdsProdutoFilialPRECODEVENDA.Value  * (cdsProdutoFilialCOMISSAOVENDA.Value /100);
        cdsProdutoFilialV_LUCRO_LIQUIDO.Value      := cdsProdutoFilialPRECODEVENDA.Value  * (cdsProdutoFilialLUCROLIQUIDO.Value /100);
        cdsProdutoFilialV_DESCONTO_VENDA.Value     := cdsProdutoFilialPRECODEVENDA.Value  * (cdsProdutoFilialDESCONTONAVENDA.Value /100);

      end;
    1:begin

        cdsProdutoFilialV_ICMS_PAGAR.Value         := cdsProdutoFilialPRECOPROMOCAO.Value  * (cdsProdutoFilialICMSAPAGAR.Value /100);
        cdsProdutoFilialV_IMPOSTOS_FEDERAIS.Value  := cdsProdutoFilialPRECOPROMOCAO.Value  * (cdsProdutoFilialIMPOSTOSFEDERAIS.Value /100);
        cdsProdutoFilialV_CUSTO_OPERACIONAL.Value  := cdsProdutoFilialPRECOPROMOCAO.Value  * (cdsProdutoFilialCUSTOOPERACIONAL.Value /100);
        cdsProdutoFilialV_COMISSAO_VENDA.Value     := cdsProdutoFilialPRECOPROMOCAO.Value  * (cdsProdutoFilialCOMISSAOVENDA.Value /100);
        cdsProdutoFilialV_LUCRO_LIQUIDO.Value      := cdsProdutoFilialPRECOPROMOCAO.Value  * (cdsProdutoFilialLUCROLIQUIDO.Value /100);
        cdsProdutoFilialV_DESCONTO_VENDA.Value     := cdsProdutoFilialPRECOPROMOCAO.Value  * (cdsProdutoFilialDESCONTONAVENDA.Value /100);

    end;

  end;

end;

procedure TdmMProvider.cdsProdutoFilialNewRecord(DataSet: TDataSet);
begin

  cdsProdutoFilialPRODUTO.Value                               := dmMProvider.cdsProdutosPRODUTO.Value;
  cdsProdutoFilialFILIAL.Value                                := dmDBEXMaster.iIdFilial;
  cdsProdutoFilialCUSTOBRUTO.Value                            := 0;
  cdsProdutoFilialCUSTOBRUTOANTERIOR.Value                    := 0;
  cdsProdutoFilialCUSTOLIQUIDO.Value                          := 0;
  cdsProdutoFilialCUSTOLIQUIDOANTERIOR.Value                  := 0;
  cdsProdutoFilialMENORPRECO.Value                            := 0;
  cdsProdutoFilialPRECOCALCULADO.Value                        := 0;
  cdsProdutoFilialPRECOPROVISORIO.Value                       := 0;
  cdsProdutoFilialPRECODEVENDA.Value                          := 1;
  cdsProdutoFilialPRECODEVENDAANTERIOR.Value                  := 0;
  cdsProdutoFilialCADASTRO.Value                              := date;
  cdsProdutoFilialALTERACAO.Value                             := date;
  cdsProdutoFilialREMARCACAO.Value                            := date;
  cdsProdutoFilialLUCROICMSR.Value                            := 0;
  cdsProdutoFilialIMPOSTOSFEDERAIS.Value                      := 0;
  cdsProdutoFilialCUSTOOPERACIONAL.Value                      := dmMProvider.cdsConfiguracoesCUSTOOPERACIONAL.Value;
  cdsProdutoFilialCOMISSAOVENDA.Value                         := 0;
  cdsProdutoFilialLUCROLIQUIDO.Value                          := 0;
  cdsProdutoFilialDEPOSITO.Value                              := 0;
  cdsProdutoFilialDEPOSITO1.Value                             := 0;
  cdsProdutoFilialLOJA.Value                                  := 0;
  cdsProdutoFilialLOJA1.Value                                 := 0;
  cdsProdutoFilialSALDOANTERIOR.Value                         := 0;
  cdsProdutoFilialSALDOMINIMO.Value                           := 0;
  cdsProdutoFilialSALDOMAXIMO.Value                           := 0;
  cdsProdutoFilialPRODUTOATIVO.Value                          := 1;
  cdsProdutoFilialPROMOCAO.Value                              := 0;
  cdsProdutoFilialREDUCAOBASEDECALCULO.Value                  := 0;
  cdsProdutoFilialDESCONTOPROGRAMADO.Value                    := 0;
  cdsProdutoFilialENVIARPARABALANCA.Value                     := 0;
  cdsProdutoFilialDESCONTONACOMPRA.Value                      := 0;
  cdsProdutoFilialCREDITODEICMS.Value                         := 0;
  cdsProdutoFilialIPI.Value                                   := 0;
  cdsProdutoFilialOUTROSCUSTOS.Value                          := 0;
  cdsProdutoFilialFRETE.Value                                 := 0;
  cdsProdutoFilialICMSAPAGAR.Value                            := 0;
  cdsProdutoFilialDESCONTONAVENDA.Value                       := 0;
  cdsProdutoFilialVALORDODESCONTONACOMPRA.Value               := 0;
  cdsProdutoFilialVALORDOCREDITODEICMSR.Value                 := 0;
  cdsProdutoFilialVALORDOIPI.Value                            := 0;
  cdsProdutoFilialVALORDEOUTROSCUSTOS.Value                   := 0;
  cdsProdutoFilialVALORDOFRETE.Value                          := 0;
  cdsProdutoFilialVALORDOICMSR.Value                          := 0;
  cdsProdutoFilialPRECOPROMOCAO.Value                         := 0;
  cdsProdutoFilialDESCONTOTABELA1.Value                       := 0;
  cdsProdutoFilialDESCONTOTABELA2.Value                       := 0;
  cdsProdutoFilialDESCONTOTABELA3.Value                       := 0;
  cdsProdutoFilialVALORUNITARIO.Value                         := 0;
  cdsProdutoFilialSUBSTITUICAOTRIBUTARIA.Value                := 0;
  cdsProdutoFilialSALDO_RESERVADO.Value                       := 0;
  cdsProdutoFilialCUSTO_MEDIO.Value                           := 0;
  cdsProdutoFilialCUSTO_MEDIO_ANTERIOR.Value                  := 0;
  cdsProdutoFilialPRECO_ATACADO.Value                         := 0;
  cdsProdutoFilialPERCENTUAL_ISS.Value                        := 0;
  cdsProdutoFilialPERCENTUAL_IOF.Value                        := 0;
  cdsProdutoFilialPERCENTUAL_CIDE.Value                       := 0;
  cdsProdutoFilialSALDO_ALMOXARIFADO.Value                    := 0;

end;

procedure TdmMProvider.cdsProdutosAfterEdit(DataSet: TDataSet);
begin

  if cdsProdutoFilial.Active then
    cdsProdutoFilial.Edit;

end;

procedure TdmMProvider.cdsProdutosCalcFields(DataSet: TDataSet);
begin

  case cdsProdutosATIVO.Value of
    0:cdsProdutosS_ATIVO.Value := 'N�O';
    1:cdsProdutosS_ATIVO.Value := 'SIM';
  end;

  case cdsProdutosPROMOCAO.Value of
    0:cdsProdutosS_PROMOCAO.Value := 'N�O';
    1:cdsProdutosS_PROMOCAO.Value := 'SIM';
  end;

  cdsProdutosSALDO_TOTAL.Value    := cdsProdutosLOJA.Value + cdsProdutosDEPOSITO.Value + cdsProdutosSALDO_ALMOXARIFADO.Value+ cdsProdutosSALDO_RESERVADO.Value;

end;

procedure TdmMProvider.cdsProdutosNewRecord(DataSet: TDataSet);
begin

  cdsProdutosPRODUTO.Value                              := -1;
  cdsProdutosUNIDADEEMBALAGEM.Value                     := 1;
  cdsProdutosATIVO.Value                                := 1;
  cdsProdutosREDBASECALCULO.Value                       := 0;
  cdsProdutosSTATUS.Value                               := 1;
  cdsProdutosDOLARVENDA.Value                           := 0;
  cdsProdutosISENTOPISCOFINS.Value                      := 0;
  cdsProdutosALTERAR_PRECOVENDA_PDVI.Value              := 0;
  cdsProdutosLITRAGEM.Value                             := 0;
  cdsProdutosCF_IPI.Value                               := 0;
  cdsProdutosCOMPOEM_CESTA_BASICA.Value                 := 0;
  cdsProdutosPERMITE_VENDA_FRACIONADA.Value             := 0;
  cdsProdutosUNIDADE_ATACADO.Value                      := 0;
  cdsProdutosALIQUOTA_PIS.Value                         := 0;
  cdsProdutosALIQUOTA_COFINS.Value                      := 0;
  cdsProdutosVISIBILIDADE.Value                         := 1;
  cdsProdutosALIQUOTA_PIS_ENTRADA.Value                 := 0;
  cdsProdutosALIQUOTA_COFINS_ENTRADA.Value              := 0;
  cdsProdutosCARGA_TRIBUTARIA_NAC.Value                 := 0;
  cdsProdutosCARGA_TRIBUTARIA_IMP.Value                 := 0;
  cdsProdutosDESCONTO_PERSONALIZADO.Value               := 0;
  cdsProdutosPESOBRUTO.Value                            := 1;
  cdsProdutosPESOLIQUIDO.Value                          := 1;

end;

procedure TdmMProvider.cdsReferenciaFornecedorNewRecord(DataSet: TDataSet);
begin

  cdsReferenciaFornecedorREFERENCIAFORNECEDOR.Value := -1

end;

procedure TdmMProvider.cdsServicosNewRecord(DataSet: TDataSet);
begin

  cdsServicosVALOR.Value            := 0;
  cdsServicosALIQUOTA_PIS.Value     := 0;
  cdsServicosALIQUOTA_COFINS.Value  := 0;
  cdsServicosCODIGO_ITEM.Value      := '0';

end;

procedure TdmMProvider.cdsSituacoes_OSNewRecord(DataSet: TDataSet);
begin

  cdsSituacoes_OSABERTURA_OS.Value            := 0;
  cdsSituacoes_OSOFICINA.Value                := 0;
  cdsSituacoes_OSFECHAMENTO_OS.Value          := 0;
  cdsSituacoes_OSCONDICAO_FECHAMENTO_OS.Value := 0;
  cdsSituacoes_OSPRONTO.Value                 := 0;

end;

procedure TdmMProvider.cdsTipoLogradouroNewRecord(DataSet: TDataSet);
begin

  cdsTipoLogradouroTIPO_LOGRADOURO.Value := 0;

end;

procedure TdmMProvider.cdsTipoUtilCtrlNotasNewRecord(DataSet: TDataSet);
begin

  cdsTipoUtilCtrlNotasTIPO_UTIL_CTRL_NOTAS.Value := -1;

end;

procedure TdmMProvider.cdsTransportadoraNFSNewRecord(DataSet: TDataSet);
begin

  cdsTransportadoraNFSNF_SAIDA.Value                  := cdsNFSaidaNFSAIDA.Value;
  cdsTransportadoraNFSSERIE.Value                     := cdsNFSaidaSERIE.Value;
  cdsTransportadoraNFSMODELO.Value                    := cdsNFSaidaMODELO.Value;
  cdsTransportadoraNFSCNPJ.Value                      := cdsFornecedorCNPJ.Value;
  cdsTransportadoraNFSISENTO_ICMS.Value               := 0;
  cdsTransportadoraNFSBC_CALCULO_ICMS_RETENCAO.Value  := 0;
  cdsTransportadoraNFSALIQUOTA_ICMS_RETENCAO.Value    := 0;
  cdsTransportadoraNFSVALOR_DO_SERVICO.Value          := 0;
  cdsTransportadoraNFSVALOR_ICMS_RETENCAO.Value       := 0;
  cdsTransportadoraNFSFILIAL.Value                    := dmDBEXMaster.iIdFilial;

end;

procedure TdmMProvider.cdsUndMedidaNewRecord(DataSet: TDataSet);
begin

  cdsUndMedidaPERMITE_VENDA_FRACIONADA.Value := 0;

end;

procedure TdmMProvider.cdsUsuariosNewRecord(DataSet: TDataSet);
begin

  cdsUsuariosDATA.Value           := Date;
  cdsUsuariosSUPER_USUARIO.Value  := 0;
  cdsUsuariosATIVO.Value          := 1;
  cdsUsuariosAUTORIZA_FAT.Value   := 0;

end;

procedure TdmMProvider.DataModuleCreate(Sender: TObject);
begin

  CarregarConfigIni;

end;

procedure TdmMProvider.RelacionarItem_OrdemProducao(pOrdemProducao,  pFilial: integer);
begin

  cdsItemOrdemProducao.Close;
  cdsItemOrdemProducao.ProviderName := 'dspItemOrdemProducao';

  dmDBEXMaster.fdqItemOrdemProducao.SQL.Clear;
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('select it_op.*, pro.descricao, pro.unidade, pf.loja, pf.saldo_almoxarifado from item_ordem_de_producao it_op');
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('join produto pro');
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('on(pro.produto = it_op.produto_insumo)');
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('join produtofilial pf');
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('on(pf.produto = it_op.produto_insumo)');
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('where pf.filial = ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('and it_op.ordem_de_producao = ' + IntToStr(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value));

  dmDBEXMaster.fdqItemOrdemProducao.SQL.Add('order by pro.descricao');

  cdsItemOrdemProducao.Open;
  cdsItemOrdemProducao.ProviderName := '';

end;

procedure TdmMProvider.RelacionarItens_Perdas(pPerdas: integer);
begin

  cdsItensPerdas.Close;
  cdsItensPerdas.ProviderName := 'dspItensPerdas';

  dmDBEXMaster.fdqItensPerdas.SQL.Clear;
  dmDBEXMaster.fdqItensPerdas.SQL.Add('select iperdas.*, pro.descricao,pro.unidade from itens_perdas iperdas');
  dmDBEXMaster.fdqItensPerdas.SQL.Add('join produto pro');
  dmDBEXMaster.fdqItensPerdas.SQL.Add('on(pro.produto = iperdas.produto)');
  dmDBEXMaster.fdqItensPerdas.SQL.Add('where iperdas.perda = ' + InttoStr(pPerdas));
  dmDBEXMaster.fdqItensPerdas.SQL.Add('order by iperdas.itens_perdas');

  cdsItensPerdas.Open;
  cdsItensPerdas.ProviderName := '';

end;

procedure TdmMProvider.RelacionarOS_Equipamento(pEquipamento: integer);
begin

  cdsOrdemServico.Close;
  cdsOrdemServico.ProviderName := 'dspOrdemServico';

  dmDBEXMaster.fdqOrdemServico.SQL.Clear;
  dmDBEXMaster.fdqOrdemServico.SQL.Add('select * from ordem_de_servico');
  dmDBEXMaster.fdqOrdemServico.SQL.Add('where codigo_equipamento = ' + InttoStr(pEquipamento));
  dmDBEXMaster.fdqOrdemServico.SQL.Add('order by ordem_de_servico');

  cdsOrdemServico.Open;
  cdsOrdemServico.ProviderName := '';

end;

function TdmMProvider.ValidarUsuarioMaster: boolean;
begin

  Result := false;

  cdsUsuarios.Close;
  cdsUsuarios.ProviderName := 'dspUsuarios';

  dmDBEXMaster.fdqUsuarios.SQL.Clear;
  dmDBEXMaster.fdqUsuarios.SQL.Add('select * from usuarios');
  dmDBEXMaster.fdqUsuarios.SQL.Add('where login = ' + QuotedStr(dmDBEXMaster.sNomeUsuario));

  cdsUsuarios.Open;
  cdsUsuarios.ProviderName := '';

  if not cdsUsuarios.IsEmpty then
    Result := (cdsUsuariosSUPER_USUARIO.AsInteger = 1);

end;

end.
