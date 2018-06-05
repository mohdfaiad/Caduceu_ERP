unit modConfiguracoes;

interface
{$WARN UNIT_PLATFORM OFF}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, midaslib, Vcl.ComCtrls, Vcl.CheckLst, Vcl.DBCtrls,
  Vcl.Samples.Spin, Vcl.Mask, System.Actions, Vcl.ActnList,
  Data.db, Vcl.FileCtrl, Vcl.Imaging.jpeg, ACBrNFe, Vcl.Grids, Vcl.DBGrids,shellapi,
  Vcl.ExtDlgs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, ACBrBase, ACBrSocket, ACBrCEP, System.TypInfo, FireDac.Stan.Param,
  ACBrDFe, ACBrDFeSSL, blcksock, pcnConversaoNFe;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmConfiguracoes = class(TForm)
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    imgEditar: TImage;
    lblF6: TLabel;
    imgSalvar: TImage;
    lblF4: TLabel;
    imgDesfazer: TImage;
    pgcConfig: TPageControl;
    lblF3: TLabel;
    tbsGeral: TTabSheet;
    tbsFrenteDeLoja: TTabSheet;
    tbsBalanca: TTabSheet;
    tbsFinanceiro: TTabSheet;
    tbsEquipamentos: TTabSheet;
    grpGeral: TGroupBox;
    grpOpcosSistema: TGroupBox;
    chkUtilizarPrecoAtacado: TDBCheckBox;
    chkCalculoPrecoCLD: TDBCheckBox;
    chkUnificarPrecoVenda: TDBCheckBox;
    chkUtilizarSimilarPreco: TDBCheckBox;
    chkAtualizarCustosSimilar: TDBCheckBox;
    chkVisualizarSimilarAtualizacao: TDBCheckBox;
    chkTotalizaCFOPNFE: TDBCheckBox;
    grpOpcoesBackup: TGroupBox;
    grpIntervaloBackup: TGroupBox;
    lblMinutos: TLabel;
    grpLocais: TGroupBox;
    lblLocal1: TLabel;
    lblLocal2: TLabel;
    edtBackup_Pasta1: TDBEdit;
    edtBackup_Pasta2: TDBEdit;
    imgPastaBackup: TImage;
    grpFrenteDeLoja: TGroupBox;
    rdgSistemaFrenteLoja: TDBRadioGroup;
    rdgTratamentoDeValores: TDBRadioGroup;
    edtIntervalobackup: TDBEdit;
    ActionList1: TActionList;
    actAbrirPasta: TAction;
    FileOpenDialog1: TFileOpenDialog;
    grpBalanca: TGroupBox;
    rdgSistemaBalanca: TDBRadioGroup;
    rdgQuantideTeclasBalanca: TDBRadioGroup;
    grpExportacaoBalanca: TGroupBox;
    grpPathExportacaoBalanca: TGroupBox;
    imgPathExportacaoBalanca: TImage;
    edtPathExportacaoBalanaca: TDBEdit;
    grpArquivosExportacaoBalanca: TGroupBox;
    lblArquivoDEProdutos: TLabel;
    lblArquivoDeSetor: TLabel;
    lblArquivoDeReceitas: TLabel;
    lblArquivoDeTeclado: TLabel;
    lblArquivoDeMensagens: TLabel;
    lblArquivoDeTextoGen: TLabel;
    lblArquivoInfoNutricional: TLabel;
    edtArquivoDeProdutos: TDBEdit;
    edtArquivoDeSetor: TDBEdit;
    edtArquivoDeReceitas: TDBEdit;
    edtArquivoDeTeclado: TDBEdit;
    edtArquivoDeMensagens: TDBEdit;
    edtArquivoDeTextoGen: TDBEdit;
    edtArquivoInfoNutricional: TDBEdit;
    grpFinanceiro: TGroupBox;
    grpInstrucaoCobranca: TGroupBox;
    grpMulta: TGroupBox;
    lblIndiceMulta: TLabel;
    edtMulta: TDBEdit;
    rdgTipoMulta: TDBRadioGroup;
    grpMoradiaria: TGroupBox;
    lblMoradiaria: TLabel;
    edtMoradiaria: TDBEdit;
    rdgTipoIndiceMuoraDiaria: TDBRadioGroup;
    chkUsarCobrRegistrada: TDBCheckBox;
    chkCobrImpBanco: TDBCheckBox;
    chkUtilizaCobrNagnetica: TDBCheckBox;
    rdgTipoImpressaoCobranca: TDBRadioGroup;
    grpParametroConexao: TGroupBox;
    lblEnderecoServidor: TLabel;
    cboTipoServidor: TComboBox;
    lblTipoServidor: TLabel;
    edtEnderecoServidor: TEdit;
    lblProtocoloServidor: TLabel;
    cboProtocoServidor: TComboBox;
    lblVersaoServidor: TLabel;
    cboVersaoServidor: TComboBox;
    actSalvar: TAction;
    lblBancoDeDados: TLabel;
    edtPath_BancoDeDados: TDBEdit;
    imgPathBancoDeDados: TImage;
    grpEquipamentos: TGroupBox;
    actEditar: TAction;
    actCorrige_UltimaNF: TAction;
    actDesfazer: TAction;
    grpWS_Licenca: TGroupBox;
    lblServidorWS: TLabel;
    lblPorta: TLabel;
    edtServidorWS: TDBEdit;
    edtPortaWS: TDBEdit;
    lstItens: TListView;
    tbsNotasFiscais: TTabSheet;
    grpImpresoraTermica: TGroupBox;
    grpParametrosImpTermica: TGroupBox;
    lblPortaImpTermica: TLabel;
    lblBpsImpTermica: TLabel;
    lblBitsDados: TLabel;
    lblBitsParada: TLabel;
    lblParidade: TLabel;
    lblCtrlFluxo: TLabel;
    lblModEtiqGondola: TLabel;
    cboPortaImpTermica: TComboBox;
    cboBpsImpTermica: TComboBox;
    cboBddImpTermica: TComboBox;
    cboBdpImpTermica: TComboBox;
    cboParidadeImpTermica: TComboBox;
    cboCtrlFluxo: TComboBox;
    cboModEtqGondola: TDBLookupComboBox;
    rdgMarcaModImpTermica: TRadioGroup;
    grpTerminalConsulta: TGroupBox;
    rdgModeloTerminalConsulta: TDBRadioGroup;
    grpPath_TerminalConsulta: TGroupBox;
    imgPathterminalConsulta: TImage;
    edtPath_TerminalConsulta: TDBEdit;
    grpColetorDados: TGroupBox;
    actGravarCertificado: TAction;
    tbsArquivosFiscais: TTabSheet;
    grpArquivosFiscais: TGroupBox;
    grpSpedFiscal: TGroupBox;
    grpPastaTabelasAuxiliares: TGroupBox;
    imgLocalTabAtualizaSPED: TImage;
    edtPath_TabelasSPED_F: TEdit;
    chkImportarParcelasNFE: TDBCheckBox;
    chkCopiarXML_Reposit�rio: TDBCheckBox;
    grpRepositorioXML_NFE: TGroupBox;
    edtRepositorioXML_Entrada: TDBEdit;
    imgRepositorioXMLEntrada: TImage;
    chkUsarRentabilidadeBovina: TDBCheckBox;
    chkUsarCampoComplPesqNFEntrada: TDBCheckBox;
    tbsContabilista: TTabSheet;
    grpInfoContabilista: TGroupBox;
    lblNomeContabilista: TLabel;
    lblCpf: TLabel;
    lblCRC: TLabel;
    lblCNPJ: TLabel;
    lblEndereco: TLabel;
    lnlNumero_End_Contador: TLabel;
    edtNome_Contador: TDBEdit;
    edtCPF_Contador: TDBEdit;
    edtCRC_Contador: TDBEdit;
    edtCNPJ_Contador: TDBEdit;
    edtEndereco_Contador: TDBEdit;
    edtNumer_End_Contador: TDBEdit;
    lblCEP_Contador: TLabel;
    lblBairro_Contador: TLabel;
    lblCidade_Contador: TLabel;
    lblComplemento_Contador: TLabel;
    lblDDD_Contador: TLabel;
    lblTelefone: TLabel;
    lblFAX_Contador: TLabel;
    lblEmail_contador: TLabel;
    edtCEP_Contador: TDBEdit;
    edtBairo_Contador: TDBEdit;
    edtComplemento_Contador: TDBEdit;
    edtDDD_Contador: TDBEdit;
    edtTelefone_Contador: TDBEdit;
    edtFAX_Contador: TDBEdit;
    edtEmail_Contador: TDBEdit;
    cboCidade_Contador: TDBLookupComboBox;
    tbsAtalhosTelaPrincipal: TTabSheet;
    grpAtalhoTelaPrincipal: TGroupBox;
    lblTituloAtalho: TLabel;
    lblEnderecoAtalho: TLabel;
    edtTituloAtalho: TEdit;
    edtEnderecoAtalho: TEdit;
    imgCapturaUrl: TImage;
    actAbreBrouserpadraoNavegador: TAction;
    grpAtalhosTelaPrincipal: TGroupBox;
    tbsFormacaoPrecodeVenda: TTabSheet;
    actAplicarCustoOperacional: TAction;
    grpFormacaoPrecodeVenda: TGroupBox;
    lblPercentualCustoOperacional: TLabel;
    edtCustoOperacional: TDBEdit;
    imgAplicarCustoOperacional: TImage;
    dlgImagem: TOpenPictureDialog;
    grdMenuAtalhos: TDBGrid;
    imIncluirMenuAtalho: TImage;
    actIncluirMenuAtalho: TAction;
    lblImagemAtalho: TLabel;
    pnlImagemAtalhos: TPanel;
    imgItemMenuAtalho: TImage;
    actExclurAtalhoMenu: TAction;
    grpPastaAtualizacao: TGroupBox;
    imgPath_Atualizacao: TImage;
    tbsEstoqueInvetario: TTabSheet;
    grpEstoque: TGroupBox;
    grpEstoqueSaldo: TGroupBox;
    rdgLocalMovNFEntradas: TDBRadioGroup;
    rdgLocalMovNFSaidas: TDBRadioGroup;
    chkAtualizaAlmoxarifadoOC: TDBCheckBox;
    actTesteConexaoZeus: TAction;
    chkIntegrarImpVendaCRE: TDBCheckBox;
    grpLimiteCreditoCliente: TGroupBox;
    lblPorcentagemRenda: TLabel;
    edtLimiteCreditoCliente: TDBEdit;
    tbsOrdemServico: TTabSheet;
    grpOrdemServico: TGroupBox;
    grpModeloFormCS: TGroupBox;
    imgModeloFormCS: TImage;
    edtModeloFormCS: TDBEdit;
    FileOpenDialog2: TFileOpenDialog;
    chkAtualizaFornProdNFE: TDBCheckBox;
    tbsIntegracoesOnline: TTabSheet;
    grpConfigBuscaCEP: TGroupBox;
    ACBrCEP1: TACBrCEP;
    grpWebService_CEP: TGroupBox;
    lblChaveWSBuscaCEP: TLabel;
    edtChaveAcessoWS_CEP: TDBEdit;
    grpProxyHost: TGroupBox;
    lblHostCEP: TLabel;
    lblUsuarioHostCEP: TLabel;
    lblPortaHostCEP: TLabel;
    lblSenhaHostCEP: TLabel;
    edtHostCEP: TDBEdit;
    edtHostPortaCEP: TDBEdit;
    edtUsuarioHostCEP: TDBEdit;
    edtSenhaHostSenha: TDBEdit;
    tbsPreVenda_balcao: TTabSheet;
    grpPreVendaBalcao: TGroupBox;
    grpOr�amentoPV: TGroupBox;
    lblNumCopiaOrcamento: TLabel;
    edtNumCopiaOrcamento: TDBEdit;
    chkIntegrarBalcaoZeus: TDBCheckBox;
    chkPermiteVendaAbaixoCusto: TDBCheckBox;
    grpDescontoMaxVenda: TGroupBox;
    edtDescontoMaxVenda: TDBEdit;
    grpMsgPadraoPromissoriaFatura: TGroupBox;
    memMsgPadraoFinanceira: TDBMemo;
    grpPrazoValidadeOrcamento: TGroupBox;
    edtValidadeOrcamento: TDBEdit;
    grpMensagemPadraoPV: TGroupBox;
    edtMensagemPadraoPV: TDBEdit;
    pgcConfiguracoesNFE: TPageControl;
    tbsControleNFE: TTabSheet;
    tbsCertficado: TTabSheet;
    grpCertificado: TGroupBox;
    lblInfoCertificado: TLabel;
    lblSerieCertificado: TLabel;
    lblVencimentoCertificado: TLabel;
    imgCertificado: TImage;
    edtNumeroCertificado: TEdit;
    edtVencimentoCertificado: TEdit;
    tbsWebServiceNFE: TTabSheet;
    tbsDanfe: TTabSheet;
    tbsEmail: TTabSheet;
    grpEmailEnvioNFE: TGroupBox;
    lblServidorSMTPEnvioNFE: TLabel;
    lblPortaSMTPEnvioNFE: TLabel;
    lblUsuarioSMTPEnvioNFE: TLabel;
    lblSenhaUsuarioSMTPERnvioNFE: TLabel;
    edtServidorSMTPEnvioNFE: TDBEdit;
    edtPortaServidorSMTPEnvioNFE: TDBEdit;
    edtUsuarioSMTPEnvioNFE: TDBEdit;
    edtSenhaSMTPEnvioNFE: TDBEdit;
    chkConexaoSeguraSMTP: TDBCheckBox;
    chkExigeAutenticacaoSMTP: TDBCheckBox;
    tbsArquivos: TTabSheet;
    tbsGeralNFE: TTabSheet;
    grpControleConfigNFE: TGroupBox;
    lblModeloNF: TLabel;
    cboModeloNF: TDBLookupComboBox;
    edtSerieNFE: TDBEdit;
    lblSerieNFE: TLabel;
    lblUltimaNFEImpressa: TLabel;
    edtUltimaNFE: TDBEdit;
    imgUltimaNFE: TImage;
    grpWebServiceNFE: TGroupBox;
    lblUFDestinoNF: TLabel;
    cboSefazDestinoNFE: TDBLookupComboBox;
    chkAmbienteNFE: TDBCheckBox;
    chkVerMensagensEnvNFE: TDBCheckBox;
    chkSalvarMsgSOAP: TDBCheckBox;
    grpRetornoEnvio: TGroupBox;
    lblAguardarEnvioNFE: TLabel;
    lblTentativasEnvioNFE: TLabel;
    lblIntervaloTentativas: TLabel;
    chkAjustarMsgAguarde: TDBCheckBox;
    edtAguardarSegundos: TDBEdit;
    edtTentativasEnvio: TDBEdit;
    edtIntervaloTentativas: TDBEdit;
    grpDanfe: TGroupBox;
    grpArquivosNFE: TGroupBox;
    grpGeralNFE: TGroupBox;
    chkSalvarArqPastaSeparadas: TDBCheckBox;
    chkCriasPastasMensalmente: TDBCheckBox;
    chkAdcionarLiteralNomePastas: TDBCheckBox;
    chkSalvarNFEDataEmissao: TDBCheckBox;
    chkSalvarArqsEvento: TDBCheckBox;
    chkSepararPorCNPJ: TDBCheckBox;
    chkSepararArqModDoc: TDBCheckBox;
    grpPastaArqNFE: TGroupBox;
    imgPastaArqNFE: TImage;
    edtPastaArqNFE: TDBEdit;
    grpPastaArqCancelamento: TGroupBox;
    imgPastaArqcancelamento: TImage;
    edtPastaArqcancelamento: TDBEdit;
    grpPastaArqCCE: TGroupBox;
    imgPastaArqCCE: TImage;
    edtPastaArqCCE: TDBEdit;
    grpPastaArqInutilizacao: TGroupBox;
    imgPastaArqInutilizacao: TImage;
    edtPastaArqInutilizacao: TDBEdit;
    grpPastaArqDPEC: TGroupBox;
    imgPastaArqDEPEC: TImage;
    edtPastaArqDEPEC: TDBEdit;
    grpPastaArqEvento: TGroupBox;
    imgPastaArqEvento: TImage;
    edtPOastaArqEvento: TDBEdit;
    grpRepositorioXML_NFS: TGroupBox;
    imgRepositorioXML_NFS: TImage;
    edtRepositorioXML_NFS: TDBEdit;
    grpRepositorioPDF_NFS: TGroupBox;
    imgRepositorioPDF_NFS: TImage;
    edtRepositorioPDF_NFS: TDBEdit;
    lblFormatAlerta: TLabel;
    rdgFormaEmissaoNFE: TDBRadioGroup;
    chkAtualizarXML: TDBCheckBox;
    chkExibirErroSchema: TDBCheckBox;
    edtFormatoAlerta: TDBEdit;
    chkRetirarAcentoXML: TDBCheckBox;
    chkSalvarArqEnvioResp: TDBCheckBox;
    grpPastaLogsNFE: TGroupBox;
    imgPastaLogsNFE: TImage;
    edtPastaLogsNFE: TDBEdit;
    grpPastaSchemas: TGroupBox;
    imgPastaSchemas: TImage;
    edtPastaSchemas: TDBEdit;
    imgLogoMarca: TImage;
    rdgImpressaoOrientacao: TDBRadioGroup;
    grpLogoMarcaNFE: TGroupBox;
    imgLogoMarcaNFE: TImage;
    edtLogomarcaNFE: TDBEdit;
    chkEnviarXMLSaidaContabilidade: TDBCheckBox;
    grpPastaArqPDF: TGroupBox;
    imgPastaArqPDF: TImage;
    edtPastaArqPDF: TDBEdit;
    chkHabilitaDownloadXmlNFE: TDBCheckBox;
    grpRepositorioArqPafEcfZeus: TGroupBox;
    lblRepoOrigemArqPAF: TLabel;
    edtRepoOrigemArqPAF: TDBEdit;
    imgRepoOrigemArqPAF: TImage;
    lblRepoDestinoArqPAF: TLabel;
    edtRepoDestinoArqPAF: TDBEdit;
    imgDestinoArqPaf: TImage;
    grpOpcoesgeraisFinanceiro: TGroupBox;
    chkEmiteReciborecebimento: TDBCheckBox;
    chkImportarChqPDV: TDBCheckBox;
    chkAtualizarNCMpelaEntrada: TDBCheckBox;
    rdgModeloCertificado: TDBRadioGroup;
    grpCaminhoCertificado: TGroupBox;
    edtCaminhoCertificado: TDBEdit;
    imgCaminhoCertificado: TImage;
    grpSenhaCertificado: TGroupBox;
    edtSenhaCertificado: TDBEdit;
    grpSSLLib: TGroupBox;
    cboSSLLib: TComboBox;
    grpCryptLib: TGroupBox;
    cboCryptLib: TComboBox;
    grpHttpLib: TGroupBox;
    cboHttpLib: TComboBox;
    grpSignLib: TGroupBox;
    cboXMLSignLib: TComboBox;
    grpSSLType: TGroupBox;
    cboSSLType: TComboBox;
    grpVersaoNFe: TGroupBox;
    cboVersaoNFE: TComboBox;
    pgcConfigPDV: TPageControl;
    tbsZeus: TTabSheet;
    grpExportacaoPDV: TGroupBox;
    grpPastaExportaPDV: TGroupBox;
    imgPathExportacao: TImage;
    edtPath_Exporta_PDV: TDBEdit;
    grpArquivosExportacaoPDV: TGroupBox;
    lblArqProdutoGeral: TLabel;
    lblArqProdutoAlterado: TLabel;
    lblArqProdutoImediato: TLabel;
    lblArqVendedores: TLabel;
    lblArquivoCliente: TLabel;
    lblArqFormaPagamento: TLabel;
    lblArqDepartamento: TLabel;
    lblArqFornecedor: TLabel;
    lblArqAliquotas: TLabel;
    lblArqBancos: TLabel;
    lblArqMensagens: TLabel;
    lblArqCestaBasica: TLabel;
    lblArqListanegra: TLabel;
    edtArqProdutoGeral: TDBEdit;
    edtArqProdutoAlterado: TDBEdit;
    edtArqProdutoImediato: TDBEdit;
    edtArqVendedores: TDBEdit;
    edtArqClientes: TDBEdit;
    edtArqFormapagto: TDBEdit;
    edtArqDepartamento: TDBEdit;
    edtArqFornecedor: TDBEdit;
    edtArqAliquotas: TDBEdit;
    edtArqBancos: TDBEdit;
    edtArqMensagens: TDBEdit;
    edtArqCestaBasica: TDBEdit;
    edtArqListaNegra: TDBEdit;
    grpImportacao: TGroupBox;
    grpPathImportacao: TGroupBox;
    imgPathImportacaoPDV: TImage;
    edtPath_Importa_PDV: TDBEdit;
    grpArquivoImportacaoPDV: TGroupBox;
    lblArqMovimentoVnda: TLabel;
    lblArqRecebimentos: TLabel;
    lblArqVendaCliente: TLabel;
    lblArqDeCheques: TLabel;
    lblArqNotaFiscal: TLabel;
    lblArqCupomDiario: TLabel;
    lblArqItensCupom: TLabel;
    lblArqEstoqueInventario: TLabel;
    lblArqTef: TLabel;
    lblArqPedido: TLabel;
    edtArqMovimentoVenda: TDBEdit;
    edtArqRecebimentos: TDBEdit;
    edtArqVendaCliente: TDBEdit;
    edtArqCheques: TDBEdit;
    edtArqNotaFiscal: TDBEdit;
    edtArqCupomDiario: TDBEdit;
    edtArqItensCupom: TDBEdit;
    edtArqEstoqueInventario: TDBEdit;
    edtArqTEF: TDBEdit;
    edtArqPedido: TDBEdit;
    chkUsarNomePastaImpCF_NFS: TDBCheckBox;
    tbsDJPdv: TTabSheet;
    grpPastaExportacaoPDV: TGroupBox;
    imgPastaExportacaoPDV: TImage;
    edtPastaExportacaoPDV: TDBEdit;
    grpPastaImportacaoPDV: TGroupBox;
    imgPastaImportacaoPDV: TImage;
    edtPastaImportacaoPDV: TDBEdit;
    grpArquivos_PDV: TGroupBox;
    lblProdutos_PDV: TLabel;
    lblCodBarras_PDV: TLabel;
    lblMontagemKit_PDV: TLabel;
    lblClientes_PDV: TLabel;
    lblAutorizaClientes_PDV: TLabel;
    lblListaNegra_PDV: TLabel;
    lblVendedor_PDV: TLabel;
    lblTabelaCOFINS_PDV: TLabel;
    lblTabelaCOFINSST_PDV: TLabel;
    lblTabelaICMS_PDV: TLabel;
    lblTabelaImpostoImport_PDV: TLabel;
    lblTabelaIPI_PDV: TLabel;
    lblTabelaISSQN_PDV: TLabel;
    edtProdutos_PDV: TDBEdit;
    edtCodigoBarras_PDV: TDBEdit;
    edrMontagemKit_PDV: TDBEdit;
    edtClientes_PDV: TDBEdit;
    edtAutorizadosCliente_PDV: TDBEdit;
    edtListaNegra_PDV: TDBEdit;
    edtVendedores_PDV: TDBEdit;
    edtTabelaCOFINS_PDV: TDBEdit;
    edtTabelaCOFINS_ST: TDBEdit;
    edtBatelaICMS: TDBEdit;
    edtTabelaICMS_PDV: TDBEdit;
    edtTabelaIPI_PDV: TDBEdit;
    edtTabelaISSQN_PDV: TDBEdit;
    lblTabelaPIS_PDV: TLabel;
    lblTabelaPISST_PDV: TLabel;
    blTabelaTransportadoras_PDV: TLabel;
    lblTabTransportadoraVeiculos_PDV: TLabel;
    lblTabelaFormaPagamento_PDV: TLabel;
    lblTabelaPlanoPagamento_PDV: TLabel;
    lblTabelaAdmcart�es_PDV: TLabel;
    lblPerguntasListaVez_PDV: TLabel;
    lblMotivCancelamento_PDV: TLabel;
    lblMotivoDesconto_PDV: TLabel;
    lblTabMotivoDevolucao_PDV: TLabel;
    lblTabNCM_PDV: TLabel;
    lblTabAlteracaoPreco_PDV: TLabel;
    edtTabelaPIS_PDV: TDBEdit;
    edtTabelaPISST_PDV: TDBEdit;
    edtTabelaTransportadoras_PDV: TDBEdit;
    edtTabelaTranspVeiculos_PDV: TDBEdit;
    edtTabelaFormaPagamento_PDV: TDBEdit;
    edtTabelaPlanoPagamento_PDV: TDBEdit;
    edtTabAdminCartoes_PDV: TDBEdit;
    edtTabPerguntaVez_PDV: TDBEdit;
    edtMotivoCancelamento_PDV: TDBEdit;
    edtMotivoDesconto_PDV: TDBEdit;
    edtMotivoDevolucao_PDV: TDBEdit;
    edtTabelaNCM_PDV: TDBEdit;
    edtTabelaAtualizacaoPreco_PDV: TDBEdit;
    lblArqPreVendas_PDV: TLabel;
    lblTabCEST_PDV: TLabel;
    lblTabelaANP_PDV: TLabel;
    lblArqMovimento_PDV: TLabel;
    edtArquivoPreVenda_PDV: TDBEdit;
    edtArquivoCEST_PDV: TDBEdit;
    edtTabelaANP_PDV: TDBEdit;
    edtArquivoMovimentacao_PDV: TDBEdit;
    pgcConexaoBancoFrenteLoja: TPageControl;
    tbsConexaoZeus: TTabSheet;
    tbsConexaoDJPDV: TTabSheet;
    grpConexaoZeusRetail: TGroupBox;
    lblIPServidorZeus: TLabel;
    lblNomeBancoZeus: TLabel;
    lblUsuarioZeus: TLabel;
    lblSenhaZeus: TLabel;
    imgTesteConex�o: TImage;
    edtIPServidorZeus: TDBEdit;
    edtNomeBancoZeus: TDBEdit;
    edtUsuarioZeus: TDBEdit;
    edtSenhaUsuarioZeus: TDBEdit;
    chkUsarAutentWindows: TDBCheckBox;
    lblTipoServidorDJPdv: TLabel;
    cboTipoServidorDJPdv: TComboBox;
    lblEnderecoServidorDJPdv: TLabel;
    lblBancoDeDadosDJPdv: TLabel;
    edtBancoDeDadosDJPdv: TDBEdit;
    imgPathBancoDeDadosDJPdv: TImage;
    imgTesteConex�oDJPdv: TImage;
    edtIPServidorDJPdv: TDBEdit;
    rdgTipoCodigoIntegracaoPDV: TDBRadioGroup;
    chkUsarDV_Exportacao: TDBCheckBox;
    grpQtdPDV: TGroupBox;
    lblQtdPDV: TLabel;
    edtQtdPDV: TDBEdit;
    imgConfigCaixas: TImage;
    grpPastaLiveUpdate: TGroupBox;
    imgPath_: TImage;
    edtPathAtualizacao_LAN: TDBEdit;
    edtPathLocalLiveUpdate: TDBEdit;
    cboWSBuscaCEP: TComboBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure edtBackup_Pasta1Enter(Sender: TObject);
    procedure edtBackup_Pasta2Enter(Sender: TObject);
    procedure actAbrirPastaExecute(Sender: TObject);
    procedure imgPastaBackupClick(Sender: TObject);
    procedure imgPathExportacaoClick(Sender: TObject);
    procedure imgPathExportacaoBalancaClick(Sender: TObject);
    procedure imgPathImportacaoPDVClick(Sender: TObject);
    procedure cboTipoServidorChange(Sender: TObject);
    procedure edtEnderecoServidorEnter(Sender: TObject);
    procedure edtEnderecoServidorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEnderecoServidorKeyPress(Sender: TObject; var Key: Char);
    procedure edtEnderecoServidorExit(Sender: TObject);
    procedure imgPathBancoDeDadosClick(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure actEditarExecute(Sender: TObject);
    procedure actCorrige_UltimaNFExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblF3Click(Sender: TObject);
    procedure OcultarAbas;
    procedure lstItensClick(Sender: TObject);
    procedure imgConfigCaixasClick(Sender: TObject);
    procedure rdgSistemaBalancaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtMultaKeyPress(Sender: TObject; var Key: Char);
    procedure edtMultaExit(Sender: TObject);
    procedure imgPathterminalConsultaClick(Sender: TObject);
    procedure actGravarCertificadoExecute(Sender: TObject);
    procedure imgLocalTabAtualizaSPEDClick(Sender: TObject);
    procedure imgRepositorioXMLEntradaClick(Sender: TObject);
    procedure edtCPF_ContadorKeyPress(Sender: TObject; var Key: Char);
    procedure edtCPF_ContadorExit(Sender: TObject);
    procedure edtCNPJ_ContadorExit(Sender: TObject);
    procedure edtEmail_ContadorExit(Sender: TObject);
    procedure edtNome_ContadorExit(Sender: TObject);
    procedure actAbreBrouserpadraoNavegadorExecute(Sender: TObject);
    procedure actAplicarCustoOperacionalExecute(Sender: TObject);
    procedure actIncluirMenuAtalhoExecute(Sender: TObject);
    procedure imgItemMenuAtalhoDblClick(Sender: TObject);
    procedure grdMenuAtalhosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdMenuAtalhosDblClick(Sender: TObject);
    procedure grdMenuAtalhosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExclurAtalhoMenuExecute(Sender: TObject);
    procedure imgPath_AtualizacaoClick(Sender: TObject);
    procedure edtPath_AtualizacaoEnter(Sender: TObject);
    procedure chkAtualizaAlmoxarifadoOCClick(Sender: TObject);
    procedure rdgLocalMovNFEntradasClick(Sender: TObject);
    procedure rdgLocalMovNFSaidasClick(Sender: TObject);
    procedure edtIPServidorZeusExit(Sender: TObject);
    procedure chkUsarAutentWindowsClick(Sender: TObject);
    procedure actTesteConexaoZeusExecute(Sender: TObject);
    procedure chkUsarNomePastaImpCF_NFSClick(Sender: TObject);
    procedure imgModeloFormCSClick(Sender: TObject);
    procedure cboWSBuscaCEPChange(Sender: TObject);
    procedure memMsgPadraoFinanceiraKeyPress(Sender: TObject; var Key: Char);
    procedure edtUsuarioSMTPEnvioNFEExit(Sender: TObject);
    procedure imgRepositorioXML_NFSClick(Sender: TObject);
    procedure imgRepositorioPDF_NFSClick(Sender: TObject);
    procedure imgLogoMarcaNFEClick(Sender: TObject);
    procedure imgPastaArqNFEClick(Sender: TObject);
    procedure imgPastaArqcancelamentoClick(Sender: TObject);
    procedure imgPastaArqCCEClick(Sender: TObject);
    procedure imgPastaArqInutilizacaoClick(Sender: TObject);
    procedure imgPastaArqDEPECClick(Sender: TObject);
    procedure imgPastaArqEventoClick(Sender: TObject);
    procedure imgPastaLogsNFEClick(Sender: TObject);
    procedure imgPastaSchemasClick(Sender: TObject);
    procedure imgPastaArqPDFClick(Sender: TObject);
    procedure imgRepoOrigemArqPAFClick(Sender: TObject);
    procedure imgDestinoArqPafClick(Sender: TObject);
    procedure rdgModeloCertificadoChange(Sender: TObject);
    procedure imgCaminhoCertificadoClick(Sender: TObject);
    procedure PreencherCamposCertificado;
    procedure AtualizaSSLLibsCombo;
    procedure cboSSLLibChange(Sender: TObject);
    procedure cboCryptLibChange(Sender: TObject);
    procedure cboHttpLibChange(Sender: TObject);
    procedure cboXMLSignLibChange(Sender: TObject);
    procedure edtSenhaCertificadoExit(Sender: TObject);
    procedure tbsFrenteDeLojaShow(Sender: TObject);
    procedure rdgSistemaFrenteLojaClick(Sender: TObject);
    procedure rdgSistemaFrenteLojaChange(Sender: TObject);
    procedure rdgTipoCodigoIntegracaoPDVClick(Sender: TObject);
    procedure rdgTipoCodigoIntegracaoPDVChange(Sender: TObject);
    procedure imgPath_Click(Sender: TObject);
  private
    { Private declarations }
    ACBrNFe1: TACBrNFe;
    procedure LimparMSG_ERRO;
    procedure CarregarConfiguracoes_ini;
    procedure CarregarTabelas;
    procedure ResetarCamposAtalhoMenu;
    procedure MostrarOcultarAbasConfigPDV;
    procedure MostrarOcultarAbasConfigConexaoPDV;
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, modConfigECF, datamZeus, uFuncoes_BD,
  dataMDJPdv;

procedure TfrmConfiguracoes.actAbreBrouserpadraoNavegadorExecute(
  Sender: TObject);
var
  sBrowserPadrao, URL, Text: string;
  slChromeUrl      : TStringList;
begin

  LimparMSG_ERRO;

  slChromeUrl     := TStringList.Create;
  sBrowserPadrao  := BuscarBrowserPadrao;

  GetURL(sBrowserPadrao, URL,Text);

  if Length(Trim(URL)) <= 0 then
    GetURL('IExplore', URL,Text);

  if Length(Trim(URL)) <= 0 then
    GetURL('Firefox', URL,Text);

  if Length(Trim(URL)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_FALHA_COPIA_URL;
    Application.ProcessMessages;

  end
  else
    edtEnderecoAtalho.Text := URL;

  FreeAndNil(slChromeUrl);

end;

procedure TfrmConfiguracoes.actAbrirPastaExecute(Sender: TObject);
var
  sPath: string;
begin

  with FileOpenDialog1 do
  begin

    OkButtonLabel := 'Selecionar';
    DefaultFolder := ExtractFilePath(paramstr(0));

    if  frmConfiguracoes.Tag = ord(path_local_liveupdate) then
    begin

      Title         := 'Selecione uma pasta';
      Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      FileName      := sPath;

    end
    else if frmConfiguracoes.Tag = ord(path_banco_frente_loja) then
    begin

      Title                   := 'Selecione o banco de dados';
      Options                 := [];
      FileTypes.Add.FileMask  := '*.FDB';

    end
    else if frmConfiguracoes.Tag < 10 then
    begin

      Title         := 'Selecione uma pasta';
      Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      FileName      := sPath;

    end
    else if frmConfiguracoes.Tag = 10 then
    begin

      Title             := 'Selecione o modelo';
      Options           := [];
      FileTypes.Add.FileMask := '*.rav';

    end
    else if (frmConfiguracoes.Tag > 10) and (frmConfiguracoes.Tag < 13) then
    begin

      Title         := 'Selecione uma pasta';
      Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      FileName      := sPath;

    end
    else if (frmConfiguracoes.Tag = ord(PastaLogsNFE)) then
    begin

      Title         := 'Selecione uma pasta';
      Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      FileName      := sPath;

    end
    else if (frmConfiguracoes.Tag = ord(PathCertificadoNFE)) then
    begin

      Title                   := 'Selecione o certificado';
      Options                 := [];

      if Length(Trim(dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value)) > 0 then
        DefaultFolder := ExtractFilePath(Trim(dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value));

      FileTypes.Add.FileMask  := '*.pfx';

    end
    else if frmConfiguracoes.Tag = ord(PastaArqNFE) then
    begin

      Title         := 'Selecione uma pasta';
      Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      FileName      := sPath;

    end
    else if frmConfiguracoes.Tag = ord(PastaArqPDF) then
    begin

      Title         := 'Selecione uma pasta';
      Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
      FileName      := sPath;

    end
    else if frmConfiguracoes.Tag = 13 then
    begin

      Title             := 'Selecione uma imagem';
      Options           := [];
      FileTypes.Add.FileMask := '*.jpg';

    end;

    if Execute then
    begin

      if not InserindoEditando(dmMProvider.cdsConfiguracoes) then
        dmMProvider.cdsConfiguracoes.Edit;

      if not InserindoEditando(dmMProvider.cdsParametros_NFE) then
        dmMProvider.cdsParametros_NFE.Edit;

      if not dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty then
      begin

        if not InserindoEditando(dmMProvider.cdsCfgConexaoZeusRetail) then
          dmMProvider.cdsCfgConexaoZeusRetail.Edit;

      end;

      if (frmConfiguracoes.Tag < 10) or (frmConfiguracoes.Tag > 10) and (frmConfiguracoes.Tag <> 13) and (frmConfiguracoes.Tag <> ord(PastaLogsNFE)) and (frmConfiguracoes.Tag <> ord(PathCertificadoNFE))
        and (frmConfiguracoes.Tag <> ord(path_banco_frente_loja)) then
        FileName := FileName + '\';

      case frmConfiguracoes.Tag of
        0:begin

            dmMProvider.cdsConfiguracoesPATH_BACKUP_1.Value             := FileName;
            edtBackup_Pasta2.SetFocus;

          end;
       ord(path_local_liveupdate) :dmMProvider.cdsConfiguracoesPATH_LIVE_UPDATE.Value               := FileName;
        1:dmMProvider.cdsConfiguracoesPATH_BACKUP_2.Value                                           := FileName;
       ord(Exportacao_pdv)        :begin

                                    case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
                                      3:dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.Value       := FileName;
                                      4:dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value        := FileName;
                                    end;

                                   end;
       ord(Importacao_pdv)        :begin

                                    case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
                                      3:dmMProvider.cdsConfiguracoesPATH_IMPORTACAO_PDV.Value       := FileName;
                                      4:dmMProvider.cdsParamIntegraPDVPASTA_IMPORTACAO.Value        := FileName;
                                    end;

                                   end;
     ord(path_banco_frente_loja)  :begin

                                    if not InserindoEditando(dmMProvider.cdsCfgConexaoZeusRetail) then
                                      dmMProvider.cdsCfgConexaoZeusRetail.Edit;

                                    dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value := Filename;

                                   end;
        4:dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.Value                                 := FileName;
        5:dmMProvider.cdsConfiguracoesPATH_BANCO_DE_DADOS.Value                                     := FileName + 'GENESIS.FDB';
        6:dmMProvider.cdsConfiguracoesPATH_TERMINAL_CONSULTA.Value                                  := FileName;
        7:edtPath_TabelasSPED_F.Text                                                                := FileName;
        8:dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value                                 := FileName;
        ord(path_atualizacao)     :dmMProvider.cdsConfiguracoesPATH_ATUALIZACAO.Value               := FileName;
       10:dmMProvider.cdsConfiguracoesMODELO_COMUNICACAO_SERVICO.Value                              := ExtractFileName(FileName);
       ord(RepositorioXML_NFS)    :dmMProvider.cdsParametros_NFEREPOSITORIO_XML.Value               := FileName;
       ord(RepositorioPDF_NFS)    :dmMProvider.cdsParametros_NFEREPOSITORIO_PDF.Value               := FileName;
       ord(LogoMarcaNFE)          :begin

                                    dmMProvider.cdsParametros_NFELOGO_MARCA.Value                   := FileName;
                                    imgLogoMarca.Picture.LoadFromFile(dmMProvider.cdsParametros_NFELOGO_MARCA.Value);

                                   end;
       ord(PathCertificadoNFE)    :begin

                                    dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value  := FileName;
                                    if Length(Trim(dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value)) > 0 then
                                    begin

                                      ACBrNFe1.Configuracoes.Certificados.ArquivoPFX  := dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value;
                                      ACBrNFe1.Configuracoes.Certificados.Senha       := dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value;
                                      ACBrNFe1.SSL.DescarregarCertificado;
                                      edtVencimentoCertificado.Text                   := FormatDateTime('dd/mm/yyyy', ACBrNFe1.SSL.CertDataVenc);
                                      edtNumeroCertificado.Text                       := ACBrNFe1.SSL.CertNumeroSerie;

                                    end;

                                   end;
       ord(PastaArqNFE)           :dmMProvider.cdsParametros_NFEPASTA_ARQS_NFE.Value                := FileName;
       ord(PastaArqCancelNFE)     :dmMProvider.cdsParametros_NFEPASTA_ARQS_CANCELAMENTO.Value       := FileName;
       ord(PastaArqCCE)           :dmMProvider.cdsParametros_NFEPASTA_ARQS_CCE.Value                := FileName;
       ord(PastaArqInutilizacao)  :dmMProvider.cdsParametros_NFEPASTA_ARQS_INUTILIZACAO.Value       := FileName;
       ord(PastaArqDEPEC)         :dmMProvider.cdsParametros_NFEPASTA_ARQS_DEPEC.Value              := FileName;
       ord(PastaArqEvento)        :dmMProvider.cdsParametros_NFEPASTA_ARQS_EVENTO.Value             := FileName;
       ord(PastaLogsNFE)          :dmMProvider.cdsParametros_NFEPASTA_LOGS.Value                    := FileName;
       ord(PastaSchemas)          :dmMProvider.cdsParametros_NFEPASTA_SCHEMAS.Value                 := FileName;
       ord(PastaArqPDF)           :dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value                := FileName;
       ord(PathRepoOrigemArqPAF)  :dmMProvider.cdsCfgConexaoZeusRetailPATH_ORIGEM_ARQ_PAF.Value     := FileName;
       ord(PathRepoDestinoArqPAF) :dmMProvider.cdsCfgConexaoZeusRetailPATH_DESTINO_ARQ_PAF.Value    := FileName;

      end;

    end;

  end;

end;

procedure TfrmConfiguracoes.actAplicarCustoOperacionalExecute(Sender: TObject);
begin

  lblMsg.Caption                  := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages ;

  try

    dmDBEXMaster.fdcMaster.StartTransaction;

    dmMSProcedure.fdspMaster.StoredProcName   := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;

    dmDBEXMaster.fdcMaster.StartTransaction;
    FormatSettings.DecimalSeparator := '.';

    dmMSProcedure.fdspMaster.Params[0].Value  := 'UPDATE PRODUTOFILIAL SET CUSTOOPERACIONAL = ' + FloatToStr(dmMProvider.cdsConfiguracoesCUSTOOPERACIONAL.Value);
    dmMSProcedure.fdspMaster.ExecProc;

    actSalvarExecute(self);

    FormatSettings.DecimalSeparator := ',';

    lblMsg.Caption                  := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_CONCLUIDA;
    Application.ProcessMessages ;

    dmDBEXMaster.fdcMaster.CommitRetaining;


  except
    on E:exception do
    begin

      dmDBEXMaster.fdcMaster.RollbackRetaining;
      FormatSettings.DecimalSeparator := ',';

      lblMsg.Caption := Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmConfiguracoes.actCorrige_UltimaNFExecute(Sender: TObject);
begin

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select max(nfsaida) as ultima_nf from nfsaida where modelo = ' + QuotedStr(dmMProvider.cdsConfiguracoesMODELO.Value));
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and cfop = ' + QuotedStr(''));
  dmDBEXMaster.fdqMasterPesquisa.Open;

  if not dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
  begin

    dmMProvider.cdsConfiguracoes.Edit;
    if dmDBEXMaster.fdqMasterPesquisa.FieldByName('ULTIMA_NF').Value < 0 then
      dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value := 0
    else
      dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ULTIMA_NF').Value;

  end;

end;

procedure TfrmConfiguracoes.actDesfazerExecute(Sender: TObject);
begin

  CarregarConfiguracoes_ini;

  if (dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert]) then
    dmMProvider.cdsConfiguracoes.Cancel;

  HabilitaDesabilitaControles(false);

end;

procedure TfrmConfiguracoes.actEditarExecute(Sender: TObject);
begin

  HabilitaDesabilitaControles(True);

  if not dmMProvider.cdsParamIntegraPDV.IsEmpty then
    dmMProvider.cdsParamIntegraPDV.Edit;

  dmMProvider.cdsConfiguracoes.Edit;
  dmMProvider.cdsParametros_NFE.Edit;

end;

procedure TfrmConfiguracoes.actExclurAtalhoMenuExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  try

    dmDBEXMaster.fdcMaster.StartTransaction;

    dmMSProcedure.fdspMenuAtalhos.Params[0].Value := 1;
    dmMSProcedure.fdspMenuAtalhos.Params[1].Value := dmMProvider.cdsMenuAtalhosTITULO.Value;
    dmMSProcedure.fdspMenuAtalhos.Params[2].Value := dmMProvider.cdsMenuAtalhosENDERECO.Value;
    dmMSProcedure.fdspMenuAtalhos.Params[3].Value := dmMProvider.cdsMenuAtalhosIMAGEM_ATALHO.Value;
    dmMSProcedure.fdspMenuAtalhos.Params[4].Value := 0;

    dmMSProcedure.fdspMenuAtalhos.ExecProc;

    dmDBEXMaster.fdcMaster.CommitRetaining;

    CarregarTabelas;

  except

    on E: exception do
    begin

      dmDBEXMaster.fdcMaster.RollbackRetaining;
      lblMsg.Caption := Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmConfiguracoes.actGravarCertificadoExecute(Sender: TObject);
begin

  try

    if ACBrNFe1.SSL.SelecionarCertificado <> '' then
    begin

      edtNumeroCertificado.Text     := ACBrNFe1.SSL.NumeroSerie;
      edtVencimentoCertificado.Text := FormatDateTime('dd/mm/yyyy',ACBrNFe1.SSL.CertDataVenc);

    end;

  finally

  end;

end;

procedure TfrmConfiguracoes.actIncluirMenuAtalhoExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  try

    if Length(Trim(edtTituloAtalho.Text)) < 0  then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      edtTituloAtalho.SetFocus;
      exit;

    end
    else if Length(Trim(edtEnderecoAtalho.Text)) < 0  then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      edtEnderecoAtalho.SetFocus;
      exit;

    end;

    dmDBEXMaster.fdcMaster.StartTransaction;


    LimparMSG_ERRO;

    dmMSProcedure.fdspMenuAtalhos.Params[0].Value     := 0;
    dmMSProcedure.fdspMenuAtalhos.Params[1].Value     := edtTituloAtalho.Text;
    dmMSProcedure.fdspMenuAtalhos.Params[2].Value     := edtEnderecoAtalho.Text;

    if Length(Trim(dlgImagem.FileName)) > 0 then
      dmMSProcedure.fdspMenuAtalhos.Params[3].LoadFromFile(dlgImagem.FileName, ftBlob, 0)
    else
      dmMSProcedure.fdspMenuAtalhos.Params[3].Value   := dmMProvider.cdsMenuAtalhosIMAGEM_ATALHO.Value;

    dmMSProcedure.fdspMenuAtalhos.Params[4].Value     := 0;

    dmMSProcedure.fdspMenuAtalhos.ExecProc;

    dmDBEXMaster.fdcMaster.CommitRetaining;

    CarregarTabelas;

    ResetarCamposAtalhoMenu;

  except

    on E: exception do
    begin

      dmDBEXMaster.fdcMaster.RollbackRetaining;
      lblMsg.Caption := Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmConfiguracoes.actSalvarExecute(Sender: TObject);
begin

  try

    ActiveControl := nil;

    if Length(Trim(dmMProvider.cdsConfiguracoesUSUARIO_SMTP.Value)) > 0 then
    begin

      if not ValidarEmail(Trim(dmMProvider.cdsConfiguracoesUSUARIO_SMTP.Value)) then
      begin

        edtUsuarioSMTPEnvioNFE.SetFocus;
        exit;

      end;

    end;

    cboSSLLibChange(sender);

    AtualizaSSLLibsCombo;

    //configura��es conex�o com o banco
    dmDBEXMaster.ifArqConfig.WriteInteger('Servidor', 'Tipo', cboTipoServidor.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Servidor', 'Protocolo', cboProtocoServidor.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteString('Servidor', 'TCPIP', Trim(edtEnderecoServidor.Text));
    dmDBEXMaster.ifArqConfig.WriteInteger('Servidor', 'Versao', cboVersaoServidor.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Tipo', rdgMarcaModImpTermica.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteString('Impressora Termica', 'Porta', cboPortaImpTermica.Text);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Bps', cboBpsImpTermica.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Bdd', cboBddImpTermica.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Bdp', cboBdpImpTermica.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Paridade', cboParidadeImpTermica.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Fluxo', cboCtrlFluxo.ItemIndex);
    dmDBEXMaster.ifArqConfig.WriteInteger('Impressora Termica', 'Modelo Etq_Gond', cboModEtqGondola.KeyValue);
    dmDBEXMaster.ifArqConfig.WriteString('Certificado', 'NumSerie', edtNumeroCertificado.Text);
    dmDBEXMaster.ifArqConfig.WriteString('Certificado', 'Vencimento', edtVencimentoCertificado.Text);
    dmDBEXMaster.ifArqConfig.WriteString('SPED Fiscal', 'Pasta_Tabelas_atualizacao', edtPath_TabelasSPED_F.Text);

    //configura��es de backup
    dmDBEXMaster.ifArqConfig.WriteInteger('Backup', 'Intervalo', dmMProvider.cdsConfiguracoesINTERVALO_ENTRE_BACKUP.Value);

    if InserindoEditando(dmMProvider.cdsConfig_financeiro) then
      Man_Tab_Config_Financeiro(0);

    if InserindoEditando(dmMProvider.cdsConfiguracoes) then
    begin

      if (chkEnviarXMLSaidaContabilidade.Checked) and (Length(Trim(edtEmail_Contador.Text)) <= 0) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
        pgcConfig.ActivePageIndex := 7;
        edtEmail_Contador.SetFocus;
        exit;

      end;

      if not ValidarIP(Trim(edtEnderecoServidor.Text)) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_NUMERO_IP_INVALIDO;
        edtEnderecoServidor.SetFocus;

      end
      else
      begin

        LimparMSG_ERRO;

        Man_Tab_Configuracoes(0);

        case dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value of
          2:  Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + #13 + #13
              + 'Em cumprimento a  Nota T�cnica 02/2011, modificou a forma de' + #13
              + 'emiss�o da Nota Fiscal Eletr�nica (NF-e) em teste.' + #13
              + 'Agora, � necess�rio informar:' + #13 + #13
              + 'CNPJ: 99.999.999/0001-91 e ' + #13
              + 'raz�o social: ' + #13
              + 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO � SEM VALOR FISCAL.' + #13 +#13
              + 'A palavra �homologa��o� deve ser sem o cedilha (�) e o til (~).' +#13
              + 'J� o campo de Inscri��o Estadual (IE) dever� ficar vazio, ou seja, sem informa��o.'), 'Aten��o!', mb_IconInformation
            +  mb_Ok);
        end;

        dmMProvider.cdsConfiguracoes.Post;

      end;

    end;

    //se tornar� obsoleto em janeiro de 2019
    if InserindoEditando(dmMProvider.cdsCfgConexaoZeusRetail) then
    begin

      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[0].Value    := dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[1].Value    := dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[2].Value    := dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[3].Value    := dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[4].Value    := dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[5].Value    := dmMProvider.cdsCfgConexaoZeusRetailPATH_ORIGEM_ARQ_PAF.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[6].Value    := dmMProvider.cdsCfgConexaoZeusRetailPATH_DESTINO_ARQ_PAF.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[7].Value    := dmMProvider.cdsCfgConexaoZeusRetailMODELO_PDV.Value;
      dmMSProcedure.fdspCfgConexaoZeusRetail.Params[8].Value    := dmMProvider.cdsCfgConexaoZeusRetailTIPO_SERVIDOR.Value;

      dmMSProcedure.fdspCfgConexaoZeusRetail.ExecProc;

    end;

    if InserindoEditando(dmMProvider.cdsConfigBuscaCEP) then
    begin

      Man_Tab_Config_CEP(cboWSBuscaCEP.ItemIndex);
      dmMProvider.cdsConfigBuscaCEP.Post;

    end;

    if InserindoEditando(dmMProvider.cdsParametros_NFE) then
    begin

      Man_Tab_Parametro_NFE;
      dmMProvider.cdsParametros_NFE.Post;

    end;

    if InserindoEditando(dmMProvider.cdsParamIntegraPDV) then
    begin

      Man_Tab_ParametroIntegraPDV;
      dmMProvider.cdsParamIntegraPDV.Post;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

  HabilitaDesabilitaControles(false);

end;

procedure TfrmConfiguracoes.actTesteConexaoZeusExecute(Sender: TObject);
begin

  try

    if not (dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty) then
    begin

      case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
        3:begin

            dmMZeus.fdcZeusRetail.Close;

            dmMZeus.fdcZeusRetail.Params.Clear;
            dmMZeus.fdcZeusRetail.Params.Values['DRIVERID'    ]   := 'MSSQL';

            case dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value of
              0:dmMZeus.fdcZeusRetail.Params.Values['OSAUTHENT'   ]   := 'NO';
              1:dmMZeus.fdcZeusRetail.Params.Values['OSAUTHENT'   ]   := 'YES';
            end;

            dmMZeus.fdcZeusRetail.Params.Values['SERVER'      ]   := dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value;
            dmMZeus.fdcZeusRetail.Params.Values['DATABASE'    ]   := dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value;
            dmMZeus.fdcZeusRetail.Params.Values['USER_NAME'   ]   := dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value;
            dmMZeus.fdcZeusRetail.Params.Values['PASSWORD'    ]   := dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value;

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
            Application.ProcessMessages;
            dmMZeus.fdcZeusRetail.open;

            dmMZeus.fdcZeusRetail.Close;

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONEXAO_BANCO_OK;
            Application.ProcessMessages;

          end;
        4:begin

            dmMDJPdv.fdcDJPdv.Close;

            dmMDJPdv.fdcDJPdv.Params.Clear;
            dmMDJPdv.fdcDJPdv.Params.Values['SERVER'       ]   := dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['DATABASE'     ]   := dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['USER_NAME'    ]   := dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['PASSWORD'     ]   := dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['CHARACTERSET' ]   := 'ISO8859_1';

            if  UpperCase(cboTipoServidorDJPdv.Text) <> 'LOCAL'then
              dmMDJPdv.fdcDJPdv.Params.Values['PROTOCOL'  ]   := 'TCPIP'
            else
              dmMDJPdv.fdcDJPdv.Params.Values['PROTOCOL'  ]   := cboTipoServidorDJPdv.Text;

            dmMDJPdv.fdcDJPdv.Params.Values['PROTOCOL'     ]   := 'LOCAL';
            dmMDJPdv.fdcDJPdv.Params.Values['PAGESIZE'     ]   := '16384';
            dmMDJPdv.fdcDJPdv.Params.Values['DRIVERID'     ]   := 'FB';

            dmMDJPdv.fdcDJPdv.Open;

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONEXAO_BANCO_OK;
            Application.ProcessMessages;

          end;

      end;

    end;

  except

    on E: EFDException do
//    on E: EFDDBEngineException do
    begin

      lblMsg.Caption := Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;


  end;

end;

procedure TfrmConfiguracoes.AtualizaSSLLibsCombo;
begin

 cboSSLLib.ItemIndex      := Integer(ACBrNFe1.Configuracoes.Geral.SSLLib);
 cboCryptLib.ItemIndex    := Integer(ACBrNFe1.Configuracoes.Geral.SSLCryptLib);
 cboHttpLib.ItemIndex     := Integer(ACBrNFe1.Configuracoes.Geral.SSLHttpLib);
 cboXmlSignLib.ItemIndex  := Integer(ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib);

 cboSSLType.Enabled       := (ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);

 if not InserindoEditando(dmMProvider.cdsParametros_NFE) then
  dmMProvider.cdsParametros_NFE.Edit;

 dmMProvider.cdsParametros_NFESSL_LIB.Value     := cboSSLLib.ItemIndex;
 dmMProvider.cdsParametros_NFECRYPT_LIB.Value   := cboCryptLib.ItemIndex;
 dmMProvider.cdsParametros_NFEHTTP_LIB.Value    := cboHttpLib.ItemIndex;
 dmMProvider.cdsParametros_NFEXMLSIGN_LIB.Value := cboXMLSignLib.ItemIndex;
 dmMProvider.cdsParametros_NFESSL_TYPE.Value    := cboSSLType.ItemIndex;
 dmMProvider.cdsParametros_NFEVERSAO_NFE.Value  := cboVersaoNFE.ItemIndex;

end;

procedure TfrmConfiguracoes.CarregarConfiguracoes_ini;
begin

  cboTipoServidor.ItemIndex               := dmMProvider.cdsConfig_iniSERV_TIPO.Value;
  cboProtocoServidor.ItemIndex            := dmMProvider.cdsConfig_iniSERV_PROTOCOLO.Value;
  cboVersaoServidor.ItemIndex             := dmMProvider.cdsConfig_iniSERV_VERSAO.Value;
  edtEnderecoServidor.Text                := dmMProvider.cdsConfig_iniSERV_TCPIP.Value;
  rdgMarcaModImpTermica.ItemIndex         := dmMProvider.cdsConfig_iniMARCA_MODELO_IMP_TERMICA.Value;
  cboPortaImpTermica.Text                 := dmMProvider.cdsConfig_iniPORTA_IMP_TERMICA.Value;
  cboBpsImpTermica.ItemIndex              := dmMProvider.cdsConfig_iniBPS_IMP_TERMICA.Value;
  cboBddImpTermica.ItemIndex              := dmMProvider.cdsConfig_iniBITS_DADOS_IMP_TERMICA.Value;
  cboBdpImpTermica.ItemIndex              := dmMProvider.cdsConfig_iniBITS_PARADA_IMP_TERMCA.Value;
  cboParidadeImpTermica.ItemIndex         := dmMProvider.cdsConfig_iniPARIDADE_IMP_TERMICA.Value;
  cboCtrlFluxo.ItemIndex                  := dmMProvider.cdsConfig_iniCTRL_FLUXO_IMP_TERMICA.Value;
  cboModEtqGondola.KeyValue               := dmMProvider.cdsConfig_iniMODELO_ETQ_GONDOLA.Value;
//  speQauntidadeGTC.Value                  := dmMProvider.cdsConfiguracoesQUANTIDADE_TERMINAL_CONSULTA.Value;
  edtNumeroCertificado.Text               := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Value;
  edtVencimentoCertificado.Text           := FormatDateTime('dd/mm/yyyy',dmMProvider.cdsConfig_iniVENCIMENTO_CERTIICADO_DIGITAL.Value);
  edtPath_TabelasSPED_F.Text              := dmMProvider.cdsConfig_iniPATH_TABELAS_AUX_SPED_F.Value;
  edtNumeroCertificado.Text               := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Value;
  edtVencimentoCertificado.Text           := FormatDateTime('dd/mm/yyyy',dmMProvider.cdsConfig_iniVENCIMENTO_CERTIICADO_DIGITAL.Value);
//  edtPath_Atualizacao.Text                := dmMProvider.cdsConfig_iniPATH_ATUALIZACAO.Value;

end;

procedure TfrmConfiguracoes.CarregarTabelas;
begin

  dmMProvider.cdsMenuAtalhos.Close;
  dmMProvider.cdsMenuAtalhos.ProviderName := 'dspMenuAtalhos';

  dmMProvider.cdsMenuAtalhos.Open;
  dmMProvider.cdsMenuAtalhos.ProviderName := '';

  dmMProvider.cdsConfigBuscaCEP.Close;
  dmMProvider.cdsConfigBuscaCEP.ProviderName := 'dspConfigBuscaCEP';

  dmMProvider.cdsConfigBuscaCEP.Open;
  dmMProvider.cdsConfigBuscaCEP.ProviderName := '';

end;

procedure TfrmConfiguracoes.cboCryptLibChange(Sender: TObject);
begin

  try

    if cboCryptLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cboCryptLib.ItemIndex);

  finally

    AtualizaSSLLibsCombo;

  end;

end;

procedure TfrmConfiguracoes.cboHttpLibChange(Sender: TObject);
begin

  try

    if cboHttpLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cboHttpLib.ItemIndex);

  finally

    AtualizaSSLLibsCombo;

  end;

end;

procedure TfrmConfiguracoes.cboSSLLibChange(Sender: TObject);
begin

  try

    if cboSSLLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLLib         := TSSLLib(cboSSLLib.ItemIndex);

  finally

    AtualizaSSLLibsCombo;

  end;

end;

procedure TfrmConfiguracoes.cboTipoServidorChange(Sender: TObject);
begin

  if cboTipoServidor.ItemIndex = 0 then

    edtEnderecoServidor.Text := '127.0.0.1'

  else
  begin

    edtEnderecoServidor.Clear;
    edtEnderecoServidor.SetFocus;

  end;

end;

procedure TfrmConfiguracoes.cboWSBuscaCEPChange(Sender: TObject);
begin

  if not (dmMProvider.cdsConfigBuscaCEP.State in [dsEdit, dsInsert]) then
    dmMProvider.cdsConfigBuscaCEP.Edit;

  if InserindoEditando(dmMProvider.cdsConfiguracoes) then
    dmMProvider.cdsConfiguracoesBUSCA_CEP.Value := cboWSBuscaCEP.ItemIndex;

end;

procedure TfrmConfiguracoes.cboXMLSignLibChange(Sender: TObject);
begin

  try

    if cboXMLSignLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cboXMLSignLib.ItemIndex);

  finally

    AtualizaSSLLibsCombo;

  end;

end;

procedure TfrmConfiguracoes.chkAtualizaAlmoxarifadoOCClick(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    if chkAtualizaAlmoxarifadoOC.Checked then
      dmMProvider.cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO.Value := 1
    else
      dmMProvider.cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO.Value := 0;

  end;

end;

procedure TfrmConfiguracoes.chkUsarAutentWindowsClick(Sender: TObject);
begin

  if dmMProvider.cdsCfgConexaoZeusRetail.State in [dsEdit,dsInsert] then
  begin

    if chkUsarAutentWindows.Checked then
      dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value := 1
    else
      dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value := 0;

  end;

end;

procedure TfrmConfiguracoes.chkUsarNomePastaImpCF_NFSClick(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    if chkUsarNomePastaImpCF_NFS.Checked then
      dmMProvider.cdsConfiguracoesUSAR_NOME_PASTA_IMP_CUPOM_NFS.Value := 1
    else
      dmMProvider.cdsConfiguracoesUSAR_NOME_PASTA_IMP_CUPOM_NFS.Value := 0

  end;

end;


procedure TfrmConfiguracoes.edtBackup_Pasta2Enter(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Backup2);

end;

procedure TfrmConfiguracoes.edtCNPJ_ContadorExit(Sender: TObject);
begin
  MudarCorEdit(Sender);

  LimparMSG_ERRO;

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    if not ValidarCnpjCpf(edtCNPJ_Contador.Text) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO + edtCNPJ_Contador.Text;
      Application.ProcessMessages;

      TocarSomAlerta(ord(SystemHand));

      edtCNPJ_Contador.SetFocus;
      edtCNPJ_Contador.SelectAll;

    end;

  end;

end;

procedure TfrmConfiguracoes.edtCPF_ContadorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  LimparMSG_ERRO;

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    if not ValidarCnpjCpf(edtCPF_Contador.Text) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CPF_INVALIDO + edtCPF_Contador.Text;
      Application.ProcessMessages;

      TocarSomAlerta(ord(SystemHand));

      edtCPF_Contador.SetFocus;
      edtCPF_Contador.SelectAll;

    end;

  end;

end;

procedure TfrmConfiguracoes.edtCPF_ContadorKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;

end;

procedure TfrmConfiguracoes.edtBackup_Pasta1Enter(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Backup1);

end;

procedure TfrmConfiguracoes.edtEmail_ContadorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  LimparMSG_ERRO;

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    if length(trim(edtEmail_Contador.Text)) > 0 then
    begin

      if not ValidarEmail(edtEmail_Contador.Text) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VALIDAR_EMAIL + ': ' + edtEmail_Contador.Text;
        Application.ProcessMessages;

        TocarSomAlerta(ord(SystemHand));

        edtEmail_Contador.SetFocus;
        edtEmail_Contador.SelectAll;

      end;

    end;

  end;

end;

procedure TfrmConfiguracoes.edtEnderecoServidorEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmConfiguracoes.edtEnderecoServidorExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(edtEnderecoServidor.Text)) > 0 then
  begin

    if not ValidarIP(Trim(edtEnderecoServidor.Text)) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_NUMERO_IP_INVALIDO;
      edtEnderecoServidor.SetFocus;

    end;

  end;

  MudarCorEdit(sender);

end;

procedure TfrmConfiguracoes.edtEnderecoServidorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iDirecao: Integer;
begin

  // habilita movimenta��o dos campos com as setas acima/abaixo
  iDirecao := -1;

  case Key of

    VK_DOWN:
      iDirecao := 0; { Pr�ximo }
    VK_UP:
      iDirecao := 1; { Anterior }

  end;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;


end;

procedure TfrmConfiguracoes.edtEnderecoServidorKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmConfiguracoes.edtIPServidorZeusExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(edtIPServidorZeus.Text)) > 0 then
  begin

    if not ValidarIP(Trim(edtIPServidorZeus.Text)) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_NUMERO_IP_INVALIDO;
      edtIPServidorZeus.SetFocus;

    end;

  end;

  MudarCorEdit(sender);

end;

procedure TfrmConfiguracoes.edtMultaExit(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
    dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency := (dmMProvider.cdsConfiguracoesMULTA.AsCurrency / 30);

end;

procedure TfrmConfiguracoes.edtMultaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmConfiguracoes.edtNome_ContadorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
    RetirarAcentuacao(sender);

end;

procedure TfrmConfiguracoes.edtPath_AtualizacaoEnter(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(path_atualizacao);

end;

procedure TfrmConfiguracoes.edtSenhaCertificadoExit(Sender: TObject);
begin

  try

    MudarCorEdit(Sender);

    if (Length(Trim(dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value)) > 0) and (Length(Trim(dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value)) > 0) then
    begin

      ACBrNFe1.Configuracoes.Certificados.ArquivoPFX  := dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value;
      ACBrNFe1.Configuracoes.Certificados.Senha       := dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value;
      ACBrNFe1.SSL.DescarregarCertificado;
      edtVencimentoCertificado.Text                   := FormatDateTime('dd/mm/yyyy', ACBrNFe1.SSL.CertDataVenc);
      edtNumeroCertificado.Text                       := ACBrNFe1.SSL.CertNumeroSerie;

    end;

  except
    on E:exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;
      edtSenhaCertificado.SetFocus;

    end;

  end;

end;

procedure TfrmConfiguracoes.edtUsuarioSMTPEnvioNFEExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsConfiguracoes) then
  begin

    if Length(Trim(dmMProvider.cdsConfiguracoesUSUARIO_SMTP.Value)) > 0 then
    begin

      if not ValidarEmail(Trim(dmMProvider.cdsConfiguracoesUSUARIO_SMTP.Value)) then
        edtUsuarioSMTPEnvioNFE.SetFocus;

    end;

  end;

end;

procedure TfrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   FreeAndNil(ACBrNFe1);


  try

    CriarPasta(dmMProvider.cdsConfiguracoesPATH_ATUALIZACAO.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_SALVAR_DANFE.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_SCHEMAS_NFE.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_SALVAR_XML.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_BACKUP_1.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_BACKUP_2.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_IMPORTACAO_PDV.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_TERMINAL_CONSULTA.Value);
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_BACKUP_2.Value);
    CriarPasta(edtPath_TabelasSPED_F.Text);

  except

    on E: exception do
    begin

      lblMsg.Caption := Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
var
  i:integer;
  WS : TACBrCEPWebService ;

begin

  UseLatestCommonDialogs    := True;

  DesabilitarBotaoFecharForm(self.Handle);

  Color                     := COR_PADRAO_TELAS;

  Caption                   := ' ' + Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(ParamStr(0),1);

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := paramstr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

  pgcConfig.ActivePageIndex := 0;

  dmMProvider.cdsFilial.Open;
  dmMProvider.cdsFilial.ProviderName        := '';

  dmMProvider.cdsModelo_Doc.Open;
  dmMProvider.cdsModelo_Doc.ProviderName    := '';

  dmMProvider.cdsModEtqGond.Open;
  dmMProvider.cdsModEtqGond.ProviderName    := '';

  dmMProvider.cdsEstados.Open;
  dmMProvider.cdsEstados.ProviderName       := '';

  dmMProvider.cdsParcelasNFE.Open;
  dmMProvider.cdsParcelasNFE.ProviderName        := '';

  dmMProvider.cdsCidades.Close;
  dmMProvider.cdsCidades.ProviderName := 'dspCidades';

  dmDBEXMaster.fdqCidades.SQL.Clear;
  dmDBEXMaster.fdqCidades.SQL.Add('select * from cidades');
  dmDBEXMaster.fdqCidades.SQL.Add('where estado = ' + QuotedStr(dmMProvider.cdsFilialESTADO.Value));
  dmDBEXMaster.fdqCidades.SQL.Add('and codigo_municipio> 0');

  dmMProvider.cdsCidades.Open;
  dmMProvider.cdsCidades.ProviderName := '';

  for i := 0 to lstItens.Groups.Count - 1 do
    lstItens.Groups[i].State := [lgsCollapsible, lgsCollapsed];

  for i := 0 to grdMenuAtalhos.Columns.Count - 1 do
    grdMenuAtalhos.Columns[i].Title.Color := COR_TITULO_GRADE;

  OcultarAbas;

  CarregarConfiguracoes_ini;

  lblInfoCertificado.Caption := 'Informe o n�mero de s�rie do certificadodispon�vel no Internet Explorer' + #13
                                + 'no menu Ferramentas - Op��es da Internet - Conte�do - Certificados ' + #13
                                + 'Exibir - Detalhes - N�mero do certificado';

  ACBrNFe1 := TACBrNFe.Create(self);
  ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(2); //capicom

  cboWSBuscaCEP.Items.Clear ;

  CarregarTabelas;

  for WS := Low(TACBrCEPWebService) to High(TACBrCEPWebService) do
     cboWSBuscaCEP.Items.Add( GetEnumName(TypeInfo(TACBrCEPWebService), integer(WS) ) ) ;

  cboWSBuscaCEP.ItemIndex := dmMProvider.cdsConfiguracoesBUSCA_CEP.Value;

  pgcConfiguracoesNFE.ActivePageIndex := 0;

  if FileExists(dmMProvider.cdsParametros_NFELOGO_MARCA.Value) then
//  if Length(trim(dmMProvider.cdsParametros_NFELOGO_MARCA.Value)) > 0 then
    imgLogoMarca.Picture.LoadFromFile(dmMProvider.cdsParametros_NFELOGO_MARCA.Value);

  PreencherCamposCertificado

end;

procedure TfrmConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F3 then
    lblF3Click(self);

end;

procedure TfrmConfiguracoes.FormKeyPress(Sender: TObject; var Key: Char);
begin

  try

    if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
    begin

      Key         := #0;
      lblMsg.Tag  := 0;
      actDesfazerExecute(self);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirAtalhoMenu)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExclurAtalhoMenuExecute(self);

    end
    else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
    begin

      Key         := #0;
      lblMsg.Tag  := 0;
      LimparMSG_ERRO;

    end;

  except
    on E: exception do
    begin

      dmDBEXMaster.fdcMaster.Rollback;
      lblMsg.Caption := Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmConfiguracoes.grdMenuAtalhosDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsMenuAtalhos.IsEmpty then
  begin

    edtTituloAtalho.Text    := dmMProvider.cdsMenuAtalhosTITULO.Value;
    edtEnderecoAtalho.Text  := dmMProvider.cdsMenuAtalhosENDERECO.Value;

  end;

end;

procedure TfrmConfiguracoes.grdMenuAtalhosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsMenuAtalhos.IsEmpty then
  begin

    if not odd(dmMProvider.cdsMenuAtalhos.RecNo) then
    begin

      grdMenuAtalhos.Canvas.Font.Color   := clBlack;
      grdMenuAtalhos.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdMenuAtalhos.Canvas.Font.Color   := clBlack;
      grdMenuAtalhos.Canvas.Brush.Color  := clWhite;

    end;

    grdMenuAtalhos.Canvas.FillRect(Rect);
    grdMenuAtalhos.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

  if Column.Field = dmMProvider.cdsMenuAtalhosIMAGEM_ATALHO then
  begin

    if not (gdselected in state) then
    begin

      grdMenuAtalhos.Canvas.FillRect(rect);

      with TPicture.Create do
      begin

        Assign(dmMProvider.cdsMenuAtalhosIMAGEM_ATALHO);
        grdMenuAtalhos.Canvas.StretchDraw(rect,Bitmap);

      end;

    end;

  end;

end;

procedure TfrmConfiguracoes.grdMenuAtalhosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        if not dmMProvider.cdsMenuAtalhos.IsEmpty then
        begin

          lblMsg.Tag := ord(ExcluirAtalhoMenu);
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

        end;

      end;

  end;

end;

procedure TfrmConfiguracoes.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpGeral.Enabled                    := pOpcao;
  grpFrenteDeLoja.Enabled             := grpGeral.Enabled;
  grpBalanca.Enabled                  := grpGeral.Enabled;
  grpFinanceiro.Enabled               := grpGeral.Enabled;
  grpEquipamentos.Enabled             := grpGeral.Enabled;
  grpArquivosFiscais.Enabled          := grpGeral.Enabled;
  grpInfoContabilista.Enabled         := grpGeral.Enabled;
  grpAtalhoTelaPrincipal.Enabled      := grpGeral.Enabled;
  grpFormacaoPrecodeVenda.Enabled     := grpGeral.Enabled;
  grpEstoque.Enabled                  := grpGeral.Enabled;
  grpOrdemServico.Enabled             := grpGeral.Enabled;
  grpConfigBuscaCEP.Enabled           := grpGeral.Enabled;
  grpPreVendaBalcao.Enabled           := grpGeral.Enabled;
  grpControleConfigNFE.Enabled        := grpGeral.Enabled;
  grpCertificado.Enabled              := grpGeral.Enabled;
  grpWebServiceNFE.Enabled            := grpGeral.Enabled;
  grpDanfe.Enabled                    := grpGeral.Enabled;
  grpEmailEnvioNFE.Enabled            := grpGeral.Enabled;
  grpArquivosNFE.Enabled              := grpGeral.Enabled;
  grpGeralNFE.Enabled                 := grpGeral.Enabled;

  if dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty then
    grpRepositorioArqPafEcfZeus.Enabled := False
  else
    grpRepositorioArqPafEcfZeus.Enabled := grpGeral.Enabled;

end;

procedure TfrmConfiguracoes.imgPath_Click(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(path_local_liveupdate);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgDestinoArqPafClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PathRepoDestinoArqPAF);
  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgCaminhoCertificadoClick(Sender: TObject);
begin

  try

    frmConfiguracoes.Tag := ord(PathCertificadoNFE);
    actAbrirPastaExecute(self);

    ACBrNFe1.Configuracoes.Certificados.ArquivoPFX  := dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value;
    ACBrNFe1.Configuracoes.Certificados.Senha       := dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value;
    ACBrNFe1.SSL.DescarregarCertificado;
    edtVencimentoCertificado.Text                   := FormatDateTime('dd/mm/yyyy', ACBrNFe1.SSL.CertDataVenc);
    edtNumeroCertificado.Text                       := ACBrNFe1.SSL.CertNumeroSerie;

  except
    on E:exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;
      edtSenhaCertificado.SetFocus;

    end;

  end;

end;

procedure TfrmConfiguracoes.imgLocalTabAtualizaSPEDClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(path_tabelas_sped_f);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgLogoMarcaNFEClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(LogoMarcaNFE);
  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgModeloFormCSClick(Sender: TObject);
begin

  frmConfiguracoes.Tag    := ord(modelo_form_cs);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathterminalConsultaClick(Sender: TObject);
begin

  Tag := ord(path_terminal_consulta);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPath_AtualizacaoClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(path_atualizacao);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgRepoOrigemArqPAFClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PathRepoOrigemArqPAF);
//  , PathRepoDestinoArqPAF);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgRepositorioPDF_NFSClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(RepositorioPDF_NFS);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgRepositorioXMLEntradaClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(path_repositorio_xml_entrada);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgRepositorioXML_NFSClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(RepositorioXML_NFS);
  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathBancoDeDadosClick(Sender: TObject);
begin

  Tag := ord(path_banco_frente_loja);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathImportacaoPDVClick(Sender: TObject);
begin

  Tag := ord(Importacao_pdv);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgConfigCaixasClick(Sender: TObject);
begin

  frmConfigECF := TfrmConfigECF.Create(Self);
  frmConfigECF.ShowModal;
  FreeAndNil(frmConfigECF);

end;

procedure TfrmConfiguracoes.imgItemMenuAtalhoDblClick(Sender: TObject);
begin

  if dlgImagem.Execute then
    imgItemMenuAtalho.Picture.LoadFromFile(dlgImagem.FileName);

end;

procedure TfrmConfiguracoes.imgPastaArqcancelamentoClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqCancelNFE);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaArqCCEClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqCCE);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaArqDEPECClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqDEPEC);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaArqEventoClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqEvento);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaArqInutilizacaoClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqInutilizacao);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaArqNFEClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqNFE);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaArqPDFClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaArqPDF);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaBackupClick(Sender: TObject);
begin

  if length(Trim(edtBackup_Pasta1.Text)) <= 0 then
    edtBackup_Pasta1.SetFocus;

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaLogsNFEClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaLogsNFE);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaSchemasClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(PastaSchemas);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathExportacaoBalancaClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Exportacao_balanca);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathExportacaoClick(Sender: TObject);
begin

  Tag := ord(Exportacao_pdv);
  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgSairClick(Sender: TObject);
begin

  close;

end;

procedure TfrmConfiguracoes.lblF3Click(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.Active then
  begin

    if (dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO;

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_DESFAZER;

    end;

  end;

  Application.ProcessMessages;

end;

procedure TfrmConfiguracoes.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmConfiguracoes.lstItensClick(Sender: TObject);
begin

  OcultarAbas;

  if lstItens.ItemIndex > -1 then
    pgcConfig.Pages[lstItens.ItemIndex].TabVisible := true;

end;

procedure TfrmConfiguracoes.memMsgPadraoFinanceiraKeyPress(Sender: TObject;
  var Key: Char);
begin

  Key := UpCase(Key);

end;

procedure TfrmConfiguracoes.MostrarOcultarAbasConfigConexaoPDV;
var
  i: integer;
begin

  pgcConexaoBancoFrenteLoja.Visible := rdgSistemaFrenteLoja.ItemIndex > 0;

  for i := 0 to pgcConexaoBancoFrenteLoja.PageCount - 1 do
    pgcConexaoBancoFrenteLoja.Pages[i].TabVisible := False;

  case rdgSistemaFrenteLoja.ItemIndex of
    1:pgcConexaoBancoFrenteLoja.Pages[0].TabVisible := True;
    2:pgcConexaoBancoFrenteLoja.Pages[1].TabVisible := True;
  end;

end;

procedure TfrmConfiguracoes.MostrarOcultarAbasConfigPDV;
var
  i: integer;
begin

  pgcConfigPDV.Visible := rdgSistemaFrenteLoja.ItemIndex > 0;

  for i := 0 to pgcConfigPDV.PageCount - 1 do
    pgcConfigPDV.Pages[i].TabVisible := False;

  case rdgSistemaFrenteLoja.ItemIndex of
    0:pgcConfigPDV.Visible := False;
    1:pgcConfigPDV.Pages[0].TabVisible := True;
    2:pgcConfigPDV.Pages[1].TabVisible := True;
  end;

end;

procedure TfrmConfiguracoes.OcultarAbas;
var
  i : integer;
begin

  for i := 0 to pgcConfig.PageCount - 1 do
    pgcConfig.Pages[i].TabVisible  := False;

end;

procedure TfrmConfiguracoes.PreencherCamposCertificado;
var
 t : TSSLLib;
 u: TSSLCryptLib;
 v: TSSLHttpLib;
 x: TSSLXmlSignLib;
 k : TpcnVersaoDF;
 y: TSSLType;
begin

  cboSSLLib.Items.Clear;
  for t := Low(TSSLLib) to High(TSSLLib) do
    cboSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(t) ) ) ;

  cboSSLLib.ItemIndex := dmMProvider.cdsParametros_NFESSL_LIB.Value;

  cboCryptLib.Items.Clear;
  for u := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cboCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(u) ) ) ;

  cboCryptLib.ItemIndex := dmMProvider.cdsParametros_NFECRYPT_LIB.Value;

  cboHttpLib.Items.Clear;
  for v := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cboHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(v) ) ) ;

  cboHttpLib.ItemIndex := dmMProvider.cdsParametros_NFEHTTP_LIB.Value;;

  cboXMLSignLib.Items.Clear;
  for x := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cboXMLSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(x) ) ) ;

  cboXMLSignLib.ItemIndex := dmMProvider.cdsParametros_NFEXMLSIGN_LIB.Value;;

  cboSSLType.Items.Clear;
  for y := Low(TSSLType) to High(TSSLType) do
    cboSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(y) ) ) ;

  cboSSLType.ItemIndex := dmMProvider.cdsParametros_NFESSL_TYPE.Value;;

  cboVersaoNFE.Items.Clear ;
  for k := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cboVersaoNFE.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(k) ) ) ;

  cboVersaoNFE.ItemIndex := dmMProvider.cdsParametros_NFEVERSAO_NFE.Value;

end;

procedure TfrmConfiguracoes.rdgLocalMovNFEntradasClick(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit,dsInsert] then
    dmMProvider.cdsConfiguracoesTIPO_ESTOQUE_NF_ENTREDA.Value := rdgLocalMovNFEntradas.ItemIndex;

end;

procedure TfrmConfiguracoes.rdgLocalMovNFSaidasClick(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit,dsInsert] then
    dmMProvider.cdsConfiguracoesTIPO_ESTOQUE_NF_SAIDA.Value := rdgLocalMovNFSaidas.ItemIndex;

end;

procedure TfrmConfiguracoes.rdgModeloCertificadoChange(Sender: TObject);
begin

  grpCaminhoCertificado.Enabled := (rdgModeloCertificado.ItemIndex = 0);
  imgCertificado.Enabled        := not grpCaminhoCertificado.Enabled;

end;

procedure TfrmConfiguracoes.rdgSistemaBalancaChange(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    case rdgSistemaBalanca.ItemIndex of
      1:begin //TOLEDO MVG5

          dmMProvider.cdsConfiguracoes.Edit;
          dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.Value           := 'C:\Arquivos de programas\TOLEDO\MGV5\';
          dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSPARABALANCA.Value      := 'ITENSMGV.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODESETORPARABALANCA.Value         := 'N�O UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODERECEITASPARABALANCA.Value      := 'TXINFO.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODETECLADOPARABALANCA.Value       := 'TXTECLAS.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODEMENSAGENSPARABALANCA.Value     := 'TXMENS.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODETEXTOGENPARABALANCA.Value      := 'TXTGEN.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODEINFORMACAONUTRICIONAL.Value    := 'INFNUTRI.TXT';

        end;
      2:begin //BCSAR/PLATINA SMART

          dmMProvider.cdsConfiguracoes.Edit;

          dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.Value           := 'C:\FILIZOLA\';
          dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSPARABALANCA.Value      := 'CADTXT.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODESETORPARABALANCA.Value         := 'SETORTXT.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODERECEITASPARABALANCA.Value      := 'REC_ASS.TXT';
          dmMProvider.cdsConfiguracoesARQUIVODETECLADOPARABALANCA.Value       := 'N�O UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEMENSAGENSPARABALANCA.Value     := 'N�O UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODETEXTOGENPARABALANCA.Value      := 'N�O UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEINFORMACAONUTRICIONAL.Value    := 'NUTRI.TXT';

        end;

    end;

  end;

end;

procedure TfrmConfiguracoes.rdgSistemaFrenteLojaChange(Sender: TObject);
begin

  MostrarOcultarAbasConfigPDV;
  MostrarOcultarAbasConfigConexaoPDV;

  grpQtdPDV.Enabled := rdgSistemaFrenteLoja.ItemIndex > 0;

end;

procedure TfrmConfiguracoes.rdgSistemaFrenteLojaClick(Sender: TObject);
begin

  dmMProvider.cdsConfiguracoesMODELOPDV.Value := StrToInt(rdgSistemaFrenteLoja.Values[rdgSistemaFrenteLoja.ItemIndex]);

  MostrarOcultarAbasConfigPDV;

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin

    case rdgSistemaFrenteLoja.ItemIndex of
      1:begin//Zeus Frente de Loja

          dmMProvider.cdsConfiguracoes.Edit;
          dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.Value             := 'C:\Zanthus\Zeus\Apache2\htdocs\manager\Arquivos\1\';
          dmMProvider.cdsConfiguracoesPATH_IMPORTACAO_PDV.Value             := 'C:\Zanthus\Zeus\Movi\';
          dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSGERAL.Value          := '6.SDF';
          dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSALTERADOS.Value      := 'ALTERA6.SDF';
          dmMProvider.cdsConfiguracoesARQUIVOIMEDITOPRODUTOS.Value          := 'N�O UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODECAIXA.Value                  := '2.SDF';
          dmMProvider.cdsConfiguracoesARQUIVODECLIENTES.Value               := '10.SDF';
          dmMProvider.cdsConfiguracoesARQUIVODEFORMAPAGAMENTO.Value         := '9.SDF';
          dmMProvider.cdsConfiguracoesARQUIVODESECOES.Value                 := '5.SDF';
          dmMProvider.cdsConfiguracoesARQUIVODEVENDA.Value                  := 'MVDDMMAA.ZAN';
          dmMProvider.cdsConfiguracoesARQUIVODERECEBIMENTOS.Value           := 'MVDDMMAA.ZAN';
          dmMProvider.cdsConfiguracoesARQUIVODEVENDADECLIENTE.Value         := 'MVDDMMAA.ZAN';
          dmMProvider.cdsConfiguracoesARQUIVODECHEQUES.Value                := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODENOTAFISCAL.Value             := 'N�O UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEFORNECEDOR.Value             := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEMAPARESUMO.Value             := dmMProvider.cdsConfiguracoesARQUIVODEVENDA.Value;
          dmMProvider.cdsConfiguracoesARQUIVODECUPOMDIA.Value               := 'MCCCCCC.PDV';
          dmMProvider.cdsConfiguracoesARQUIVODEALIQUOTAS.Value              := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEBANCOS.Value                 := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEMENSAGENS.Value              := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVOPRODUTOCESTABASICA.AsString    := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVOLISTANEGRA.AsString            := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEINVENTARIO.AsString          := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODETEF.AsString                 := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVODEPEDIDO.AsString              := 'NAO UTILIZA';
          dmMProvider.cdsConfiguracoesARQUIVOITEMCUPOM.AsString             := 'NAO UTILIZA';

          dmMProvider.cdsCfgConexaoZeusRetail.Close;
          dmMProvider.cdsCfgConexaoZeusRetail.ProviderName := 'dspCfgConexaoZeusRetail';

          dmDBEXMaster.fdqCfgConexaoZeusRetail.SQL.Clear;
          dmDBEXMaster.fdqCfgConexaoZeusRetail.SQL.Add('select * from CONEXAO_ZEUSRETAIL where modelo_pdv = ' + IntToStr(dmMProvider.cdsConfiguracoesMODELOPDV.Value));

          dmMProvider.cdsCfgConexaoZeusRetail.Open;
          dmMProvider.cdsCfgConexaoZeusRetail.ProviderName := '';

          if dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty then
          begin

            dmMProvider.cdsCfgConexaoZeusRetail.Append;
            dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value          := '127.0.0.1';
            dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value           := 'ZeusRetail';
            dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value              := 'sa';
            dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value                := 'zanthus';
            dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value    := 0;
            dmMProvider.cdsCfgConexaoZeusRetailTIPO_SERVIDOR.Value        := 'TCPIP';
            dmMProvider.cdsCfgConexaoZeusRetailMODELO_PDV.Value           := dmMProvider.cdsConfiguracoesMODELOPDV.Value;

          end
          else
            dmMProvider.cdsCfgConexaoZeusRetail.Edit;

        end;
      2:begin//DJPdv

          Abrir_Tabela_ParamIntegracaoPDV;

          if dmMProvider.cdsParamIntegraPDV.IsEmpty then
            dmMProvider.cdsParamIntegraPDV.Append
          else
            dmMProvider.cdsParamIntegraPDV.Edit;

          dmMProvider.cdsParamIntegraPDVTIPO_INTEGRACAO_EXPORTACAO.Value        := 0;
          dmMProvider.cdsParamIntegraPDVTIPO_INTEGRACAO_IMPORTACAO.Value        := 0;
          dmMProvider.cdsParamIntegraPDVARREDONDA_TRUNCA.Value                  := 0;
          dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value                  := 'C:\DJSYSTEM\MONITOR\Importar\';
          dmMProvider.cdsParamIntegraPDVPASTA_IMPORTACAO.Value                  := 'C:\DJSYSTEM\MONITOR\Exportar\';
          dmMProvider.cdsParamIntegraPDVARQUIVO_PRODUTOS.Value                  := 'PRODUTO.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_COD_BARRAS.Value                := 'BARRAS.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_MONTAGEM_KIT.Value              := 'KIT.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_CLIENTES.Value                  := 'CLIENTES.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_AUTORIZADOS_CLIENTE.Value       := 'AUTORIZA.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_LISTA_NEGRA.Value               := 'LISTANEG.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_VENDEDOR.Value                  := 'VENDEDOR.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_COFINS.Value                    := 'COFINS.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_COFINS_ST.Value                 := 'COFINSST.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_ICMS.Value                      := 'ICMS.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_IMPOSTO_IMPORTACAO.Value        := 'II.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_IPI.Value                       := 'IPI.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_ISSQN.Value                     := 'ISSQN.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_PIS.Value                       := 'PIS.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_PIS_ST.Value                    := 'PISST.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_TRANSPORTADORAS.Value           := 'TRANSPOR.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_TRANSPORTADORA_VEICULOS.Value   := 'VEICULO.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_FORMA_PAGAMENTO.Value           := 'FPAGTO.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_PLANO_PAGAMENTO.Value           := 'PLAPAGTO.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_ADMINISTRADORAS_CARTAO.Value    := 'ADMIN.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_PERGUNTAS_LISTA_VEZ.Value       := 'PERGUNTA.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_MOTIVO_CANCELAMENTO.Value       := 'MOTIVOCA.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_MOTIVO_DESCONTO.Value           := 'MOTIVODC.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_MOTIVO_DEVOLUCAO.Value          := 'MOTIVOVC.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_OPERADORES.Value                := 'OPERADOR.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_NCM.Value                       := 'IBPTTAX.CSV';
          dmMProvider.cdsParamIntegraPDVARQUIVO_PRE_VENDA.Value                 := '99999999.DJP';
          dmMProvider.cdsParamIntegraPDVARQUIVO_RESPOSTA_PRE_VENDA.Value        := '99999999.DJR';
          dmMProvider.cdsParamIntegraPDVARQUIVO_KARDEX.Value                    := '99999999.KDX';
          dmMProvider.cdsParamIntegraPDVARQUIVO_ATUALIZACAO_PRECO.Value         := 'PRECO.TXT';
          dmMProvider.cdsParamIntegraPDVARQUIVO_CEST.Value                      := 'CEST.CSV';
          dmMProvider.cdsParamIntegraPDVARQUIVO_ANP.Value                       := 'CODIGOANP.CSV';
          dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value            := 0;
          dmMProvider.cdsCfgConexaoZeusRetail.Close;
          dmMProvider.cdsCfgConexaoZeusRetail.ProviderName := 'dspCfgConexaoZeusRetail';

          dmDBEXMaster.fdqCfgConexaoZeusRetail.SQL.Clear;
          dmDBEXMaster.fdqCfgConexaoZeusRetail.SQL.Add('select * from CONEXAO_ZEUSRETAIL where modelo_pdv = ' + IntToStr(dmMProvider.cdsConfiguracoesMODELOPDV.Value));

          dmMProvider.cdsCfgConexaoZeusRetail.Open;
          dmMProvider.cdsCfgConexaoZeusRetail.ProviderName := '';

          if dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty then
          begin

            dmMProvider.cdsCfgConexaoZeusRetail.Append;
            dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value          := '127.0.0.1';
            dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value           := 'C:\DJSYSTEM\MONITOR\DJPDV.FDB';
            dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value              := 'SYSDBA';
            dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value                := 'masterkey';
            dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value    := 0;
            dmMProvider.cdsCfgConexaoZeusRetailTIPO_SERVIDOR.Value        := 'TCPIP';
            dmMProvider.cdsCfgConexaoZeusRetailMODELO_PDV.Value           := dmMProvider.cdsConfiguracoesMODELOPDV.Value;

          end
          else
            dmMProvider.cdsCfgConexaoZeusRetail.Edit;

        end;

      end;

  end;


end;

procedure TfrmConfiguracoes.rdgTipoCodigoIntegracaoPDVChange(Sender: TObject);
begin

  chkUsarDV_Exportacao.Enabled := (dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value = 0);

end;

procedure TfrmConfiguracoes.rdgTipoCodigoIntegracaoPDVClick(Sender: TObject);
begin

  if not InserindoEditando(dmMProvider.cdsParamIntegraPDV) then
    dmMProvider.cdsParamIntegraPDV.Edit;

  dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value := rdgTipoCodigoIntegracaoPDV.ItemIndex;

  chkUsarDV_Exportacao.Enabled := (dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value = 0);

end;

procedure TfrmConfiguracoes.ResetarCamposAtalhoMenu;
begin

  edtTituloAtalho.Clear;
  edtEnderecoAtalho.Clear;
  dlgImagem.FileName        := '';
  imgItemMenuAtalho.Picture := nil;

end;


procedure TfrmConfiguracoes.tbsFrenteDeLojaShow(Sender: TObject);
begin

  Abrir_Tabela_ParamIntegracaoPDV;

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor;
  AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState,
      ACol, ARow)

end;

end.
