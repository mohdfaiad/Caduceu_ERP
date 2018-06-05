unit modProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Data.DB, CPort, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmProdutos = class(TForm)
    grpConteudoPesquisa: TGroupBox;
    edtConteudoPesquisa: TEdit;
    imgEtiqueta: TImage;
    ActionList1: TActionList;
    actSair: TAction;
    imgPesquisar: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    rdpOpcaoPesquisa: TRadioGroup;
    actEditar: TAction;
    pgcProduto: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tbsCadastro: TTabSheet;
    grpBarras: TGroupBox;
    imgEan: TImage;
    ptbEAN: TPaintBox;
    lblEan: TLabel;
    lblEanQtd: TLabel;
    grdEan: TDBGrid;
    chkPesado: TDBCheckBox;
    chkGerado: TDBCheckBox;
    edtEan: TEdit;
    edtEanQtd: TEdit;
    grpCadastro: TGroupBox;
    lblCodigo: TLabel;
    lblFornecedor: TLabel;
    lblCadastro: TLabel;
    lblFabricante: TLabel;
    lblGrupo: TLabel;
    lblSubGrupo: TLabel;
    lblSecao: TLabel;
    lblDescricao: TLabel;
    lblComplemento: TLabel;
    lblUnidade: TLabel;
    lblUnidadeEmbalagem: TLabel;
    lblUnidadeAtacado: TLabel;
    edtFornecedor: TDBEdit;
    edtCadastro: TDBEdit;
    edtCodigo: TDBEdit;
    edtFabricante: TDBEdit;
    edtGrupo: TDBEdit;
    edtSubGrupo: TDBEdit;
    edtSecao: TDBEdit;
    edtNome_Fornecedor: TDBEdit;
    edtNome_Fabricante: TDBEdit;
    edtNome_Grupo: TDBEdit;
    edtNome_SubGrupo: TDBEdit;
    edtNome_Secao: TDBEdit;
    edtDescricao: TDBEdit;
    edtUnidadeEmbalagem: TDBEdit;
    edtUnidadeAtacado: TDBEdit;
    edtComplemento: TDBEdit;
    pnlQtdLetrasDescricao: TPanel;
    grpPDV: TGroupBox;
    lblDescricaoCupom: TLabel;
    lblDescricaoGond1: TLabel;
    lblDescricaoGond2: TLabel;
    lblSetordeBalanca: TLabel;
    lblDescricaoBalanca: TLabel;
    lblDescricaoTiraTeima: TLabel;
    lblTecladoBalanca: TLabel;
    lblTeclaAssociada: TLabel;
    imqTeclado: TImage;
    lblValidade: TLabel;
    lblInfoNutricional: TLabel;
    edtDescricaoCupom: TDBEdit;
    pnlQtdLetrasCupom: TPanel;
    edtDescricaoGond1: TDBEdit;
    edtDescricaoGond2: TDBEdit;
    edtSetordeBalanca: TDBEdit;
    edtNome_SetordeBalanca: TDBEdit;
    edtDescricaoBalanca: TDBEdit;
    edtDescricaoTiraTeima: TDBEdit;
    edtCodTeclado: TDBEdit;
    edtTeclaAssociada: TDBEdit;
    edtValidade: TDBEdit;
    edtInfoNutricional: TDBEdit;
    edtDescricao_info_Nutricional: TDBEdit;
    grpFiscal: TGroupBox;
    lblCst: TLabel;
    lblNCM_TIPI: TLabel;
    lblRedBC: TLabel;
    edtCST: TDBEdit;
    edtNCM_TIPI: TDBEdit;
    edtRed_BC: TDBEdit;
    grpGramatura: TGroupBox;
    lblPesoBruto: TLabel;
    lblPesoLiquido: TLabel;
    edtPesoBruto: TDBEdit;
    edtPesoLiquido: TDBEdit;
    grpSimilar: TGroupBox;
    edtCodigoSimilar: TDBEdit;
    imgCodigoSimilar: TImage;
    lblGerarSimilar: TLabel;
    comImpressoraTermica: TComport;
    grpEstoque: TGroupBox;
    lblSaldoLoja: TLabel;
    lblSaldoTotal: TLabel;
    lblAlmoxarifado: TLabel;
    edtSaldoLoja: TDBEdit;
    edtSaldoTotal: TDBEdit;
    edtSaldoAlmoxarifado: TDBEdit;
    grpFormacaodePreco: TGroupBox;
    lblValorUnitarioCX: TLabel;
    lblTributa��o: TLabel;
    edtTributacao: TDBEdit;
    edtNome_Tributacao: TDBEdit;
    edtCustoBruto: TDBEdit;
    lblDescontoCompra: TLabel;
    edtP_DescontoCompra: TDBEdit;
    lblSimboloDescCompra: TLabel;
    lblCreditoICMS: TLabel;
    edtP_CreditoICMS: TDBEdit;
    lblSimboloCreditoICMS: TLabel;
    edtValorDescontoCompra: TDBEdit;
    edtValorCreditoICMS: TDBEdit;
    lblIpi: TLabel;
    edtP_IPI: TDBEdit;
    lblSimboloIPI: TLabel;
    edtValorIPI: TDBEdit;
    lblOutroCustos: TLabel;
    edtP_OutrosCustos: TDBEdit;
    edtValorOutrosCustos: TDBEdit;
    lblSimboloOutrosCustos: TLabel;
    lblFrete: TLabel;
    edtP_Frete: TDBEdit;
    lblSimboloFrete: TLabel;
    edtValorFrete: TDBEdit;
    lblValorICMSR: TLabel;
    edtValorICMSR: TDBEdit;
    lblCustoLiquido: TLabel;
    edtCustoLiquido: TDBEdit;
    lblIcmsPagar: TLabel;
    edtP_IcmsPagar: TDBEdit;
    lblSimboloICMSPAGAR: TLabel;
    edtValorIcmsPagar: TDBEdit;
    lblPercentualPisCofins: TLabel;
    edtP_PisCofins: TDBEdit;
    lblSimboloPisCofins: TLabel;
    edtvalorPisCofins: TDBEdit;
    lblCustoOperacional: TLabel;
    edtP_CustoOperacional: TDBEdit;
    lblSimboloCustoOperacional: TLabel;
    edtValorCustoOperacional: TDBEdit;
    lblComissao: TLabel;
    edtP_Comissao: TDBEdit;
    lblSimboloComissao: TLabel;
    edtValorComissao: TDBEdit;
    lblLucroLiquido: TLabel;
    edtP_LucroLiquido: TDBEdit;
    lblSimboloLucroLiquido: TLabel;
    edtValorLucroLiquido: TDBEdit;
    lblDescontoVenda: TLabel;
    edtP_DescontoVenda: TDBEdit;
    lblSimboloDescontoVenda: TLabel;
    edtValorDescontoVenda: TDBEdit;
    grpResultadosFormacaoPreco: TGroupBox;
    lblMenorPreco: TLabel;
    edtMenorPreco: TDBEdit;
    edtPrecoCalculado: TDBEdit;
    lblPrecoCalculado: TLabel;
    edtPrecoProvisorio: TDBEdit;
    lblPrecoProvisorio: TLabel;
    grpPrecos: TGroupBox;
    lblPrecoVenda: TLabel;
    lblPrecoPromocao: TLabel;
    lblPrecoVendaAnterior: TLabel;
    edtPrecoVenda: TDBEdit;
    edtPrecoPromocao: TDBEdit;
    edtPrecoVendaAnterior: TDBEdit;
    lblSaldoMinimo: TLabel;
    lblSaldoMaximo: TLabel;
    edtSaldoMinimo: TDBEdit;
    edtSaldoMaximo: TDBEdit;
    actIncluir: TAction;
    actGerarSimilar: TAction;
    actSelecionarSimilar: TAction;
    imgGreraBarras: TImage;
    actGerarEan: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actExcluir: TAction;
    actEmitirEtiqueta: TAction;
    lblCst_IPI: TLabel;
    edtCST_IPI: TDBEdit;
    lblTipoItem: TLabel;
    edtTipoItem: TDBEdit;
    grpProduto_Origem: TGroupBox;
    edtProdutoOriginador: TDBEdit;
    edtDescricaoProduto_origem: TDBEdit;
    tvsInfoAdicionais: TTabSheet;
    grpCustoMedio: TGroupBox;
    frpCustoMedioAnterior: TGroupBox;
    grpCustoMedioAtual: TGroupBox;
    lblDataCustomedioAnterior: TLabel;
    lblCustoMedioAnterior: TLabel;
    lblDataCustoMedio: TLabel;
    lblCustoMedio: TLabel;
    edtDataCustoMedioAnterior: TDBEdit;
    edtCustoMedioAnterior: TDBEdit;
    edtDataCustoMedio: TDBEdit;
    edtCustoMedio: TDBEdit;
    btnMVA: TSpeedButton;
    grpPisCofins: TGroupBox;
    grpPisCofinsEntrada: TGroupBox;
    grpPisCofinsSaida: TGroupBox;
    lblCst_PIS_Saida: TLabel;
    lblCst_COFINS_Saida: TLabel;
    lblCst_PIS_Entrada: TLabel;
    lblCst_COFINS_Entrada: TLabel;
    cboCST_PIS_ENTRADA: TDBLookupComboBox;
    cboCST_COFINS_ENTRADA: TDBLookupComboBox;
    cboCST_PIS_SAIDA: TDBLookupComboBox;
    cboCST_COFINS_SAIDA: TDBLookupComboBox;
    edtPrecoAtacado: TDBEdit;
    lblPrecoAtacado: TLabel;
    grpPrecoQuantidade: TGroupBox;
    lblValorunitario: TLabel;
    lblPercentualDesconto: TLabel;
    lblQuantidade: TLabel;
    rdgTipRegra: TDBRadioGroup;
    edtValorUnitario: TDBEdit;
    edtPercentualDesconto: TDBEdit;
    edtQuantidade: TDBEdit;
    grpPrecoVenda: TGroupBox;
    edtPrecoReal: TDBEdit;
    lblQtdItens: TLabel;
    lblDescricaoAtacado: TLabel;
    edtDescricao_Atacado: TDBEdit;
    lblUndAtacado: TLabel;
    grpInfoFilial: TGroupBox;
    cboControleLojas: TDBLookupComboBox;
    grpDetalhesLoja: TGroupBox;
    lblSelecionarLoja: TLabel;
    lblAguarde: TLabel;
    grpLojaAtiva: TGroupBox;
    grpPrecoLojaAtiva: TGroupBox;
    lblPvendaLJAtual: TLabel;
    lblPPromocaoLJAtual: TLabel;
    lblPVendaAnteriorLJAtual: TLabel;
    lblPAtacadoLJAtual: TLabel;
    edtPVendaLJAtiva: TDBEdit;
    edtPPromoLJAtiva: TDBEdit;
    edtPVendaALJAtiva: TDBEdit;
    edtPAtacadoLJAtiva: TDBEdit;
    grpEstoqueLojaAtiva: TGroupBox;
    lblSaldoLojaLJAtual: TLabel;
    lblsaldoDepositoLJAtual: TLabel;
    lblSaldoTotalLJAtual: TLabel;
    lblSaldoReservadoLJAtual: TLabel;
    lblSMinimoLJAtual: TLabel;
    lblSMaximoLJAtual: TLabel;
    edtSLojaLJAtiva: TDBEdit;
    edtSDepositoLJAtiva: TDBEdit;
    edtSTotalLJAtiva: TDBEdit;
    edtSReservadoLJAtiva: TDBEdit;
    edtSMinimoLJAtiva: TDBEdit;
    edtSMaximoLJAtiva: TDBEdit;
    grpUltimaNFLojaAtiva: TGroupBox;
    lblDataUELJAtual: TLabel;
    lblUltimaNFLJAtual: TLabel;
    edtDataUltimaNFLJAtiva: TDBEdit;
    edtUltimaNFLJAtiva: TDBEdit;
    grpFormacaoPrecoOLoja: TGroupBox;
    grpEstoqueOLoja: TGroupBox;
    lblSaldoLojaOLoja: TLabel;
    lblSaldoDepositoOLoja: TLabel;
    lblSaldoTotalOLoja: TLabel;
    lblSaldoreservadoOLoja: TLabel;
    lblSaldoMinimoOLoja: TLabel;
    lblSaldoMaximoOLoja: TLabel;
    edtSaldoLojaOLoja: TDBEdit;
    edtSaldodepositoOLoja: TDBEdit;
    edtSaldoTotalOLoja: TDBEdit;
    edtSaldoreservadoOLoja: TDBEdit;
    edtSaldoMinimoOLoja: TDBEdit;
    edtSaldoMaximoOLoja: TDBEdit;
    grpUltimaNFOLoja: TGroupBox;
    lblDataUltimaEntradaOLoja: TLabel;
    lblUltimaNFOLoja: TLabel;
    edtDataUEOLoja: TDBEdit;
    edtUltimaNFOLoja: TDBEdit;
    grpPrecosOLoja: TGroupBox;
    lblPvendaOLoja: TLabel;
    lblPPromocaoOLoja: TLabel;
    lblPVendaAnteriorOLoja: TLabel;
    lblPAtacadoOLoja: TLabel;
    edtPrecoVendaOLoja: TDBEdit;
    edtPrecoPromocaoOLoja: TDBEdit;
    edtPVendaAnteriorOLoja: TDBEdit;
    edtPrecoAtacadoOLoja: TDBEdit;
    lblCustoBrutoOLoja: TLabel;
    lblPDescontoCompraOLoja: TLabel;
    lblSimboloDescontoOLoja: TLabel;
    lblPCredICMSOLoja: TLabel;
    lblSimboloCreditoICMSOLoja: TLabel;
    lblPIpiOLoja: TLabel;
    lblSimboloPIpiOLoja: TLabel;
    lblPOutrosCustosOLoja: TLabel;
    lblSimboloPOutrosCustosOLoja: TLabel;
    lblPFreteOLoja: TLabel;
    lblSimboloPFreteOLoja: TLabel;
    lblValorICMSROLoja: TLabel;
    edtCustoBrutoOLoja: TDBEdit;
    edtPDescontoCompraOLoja: TDBEdit;
    edtPCreditoICMSOLoja: TDBEdit;
    edtVDescomtoCompraOLoja: TDBEdit;
    edtVCredICMSOLoja: TDBEdit;
    edtPIPIOLoja: TDBEdit;
    edtVIpOLoja: TDBEdit;
    edtPOutrosOLoja: TDBEdit;
    edtVOutrosCustosOLoja: TDBEdit;
    edtPFreteOLoja: TDBEdit;
    edtVFreteOLoja: TDBEdit;
    edtVICMSROLoja: TDBEdit;
    lblCustoLiquidoOLoja: TLabel;
    edtCustoLiquidoOLoja: TDBEdit;
    edtPICMSPagarOLoja: TDBEdit;
    edtVDescontoVendaOLoja: TDBEdit;
    edtPDescontoVendaOLoja: TDBEdit;
    edtVLucroLiquidoOLoja: TDBEdit;
    edtPLucroLiquidoOLoja: TDBEdit;
    edtVComissaoOLoja: TDBEdit;
    edtPComissaoOLoja: TDBEdit;
    edtVCustoOperacionalOLoja: TDBEdit;
    edtPCustoOperacionalOLoja: TDBEdit;
    edtVPisCofinsOLoja: TDBEdit;
    edtPPisCofinsOLoja: TDBEdit;
    edtVIcmsPagarOLoja: TDBEdit;
    lblSimboloPDescontoVendaOLoja: TLabel;
    lblPDescontoVendaOLoja: TLabel;
    lblSimboloLucroLiquidoOLoja: TLabel;
    lblPLucroLiquidoOLoja: TLabel;
    lblSimboloComissaoOLoja: TLabel;
    lblComissaoOLoja: TLabel;
    lblSimboloCOOLoja: TLabel;
    lblCustoOperacionalOLoja: TLabel;
    lblSimboloPPisCofinsOLoja: TLabel;
    lblPisCofinsOLoja: TLabel;
    lblSimboloPICMSPagarOLoja: TLabel;
    lblIcmsPagarOLoja: TLabel;
    Splitter1: TSplitter;
    edtPIS: TDBEdit;
    lblPis_Saida: TLabel;
    lblCofins_saida: TLabel;
    edtCOFINS: TDBEdit;
    lblPis_Entrada: TLabel;
    lblCofins_entrada: TLabel;
    edtPIS_Entrada: TDBEdit;
    edtCOFINS_Entrada: TDBEdit;
    edtNatReceita: TDBEdit;
    lblNatureza_Receita: TLabel;
    lblCodigo_Credito: TLabel;
    edtCodigoCredito: TDBEdit;
    grpCodigoANP: TGroupBox;
    edtCodigoANP: TDBEdit;
    lblEX_TIPI: TLabel;
    edtEX_TIPI: TDBEdit;
    chkDescontoPersonalizado: TDBCheckBox;
    cboOrigemMercadoria: TDBLookupComboBox;
    lblOrigemMercadoria: TLabel;
    edtDescricaoCST: TDBEdit;
    tbsMovimento: TTabSheet;
    grpUltimaNFEntrada: TGroupBox;
    grdUltimaNFEProduto: TDBGrid;
    grdItemUltimaNF: TDBGrid;
    txtDescricaoProduto: TDBText;
    cboUnidadeMedida: TDBLookupComboBox;
    cboUnidadeAtacado: TDBLookupComboBox;
    lblDeposito: TLabel;
    edtSaldoDeposito: TDBEdit;
    grpFlags: TGroupBox;
    chkAtivo: TDBCheckBox;
    chkVisivel: TDBCheckBox;
    chkEnviarParaBalanca: TDBCheckBox;
    chkCestaBasica: TDBCheckBox;
    chkPromocao: TDBCheckBox;
    imgIngredientes: TImage;
    grpOrdemServico: TGroupBox;
    grdOrdemServico: TDBGrid;
    grdItemOrdemServico: TDBGrid;
    lblCest: TLabel;
    edtCest: TDBEdit;
    grpFCP: TGroupBox;
    grdFCP: TDBGrid;
    lblSaldoReservado: TLabel;
    edtSaldoReservado: TDBEdit;
    imgIncluir: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    lblF3: TLabel;
    imgSalvar: TImage;
    Label1: TLabel;
    imgExcluir: TImage;
    lblF5: TLabel;
    imgEditar: TImage;
    lblF6: TLabel;
    imgSair: TImage;
    procedure FormCreate(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure rdpOpcaoPesquisaClick(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure grdTabelaTitleClick(Column: TColumn);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEanKeyPress(Sender: TObject; var Key: Char);
    procedure grdEanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtDescricaoChange(Sender: TObject);
    procedure edtDescricaoCupomChange(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtFabricanteExit(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure edtSecaoExit(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure actEditarExecute(Sender: TObject);
    procedure edtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure edtFabricanteKeyPress(Sender: TObject; var Key: Char);
    procedure edtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSubGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSecaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnidadeEmbalagemKeyPress(Sender: TObject; var Key: Char);
    procedure edtSetordeBalancaExit(Sender: TObject);
    procedure edtSetordeBalancaKeyPress(Sender: TObject; var Key: Char);
    procedure imqTecladoClick(Sender: TObject);
    procedure edtInfoNutricionalKeyPress(Sender: TObject; var Key: Char);
    procedure edtInfoNutricionalExit(Sender: TObject);
    procedure edtCSTExit(Sender: TObject);
    procedure edtNCM_TIPIExit(Sender: TObject);
    procedure edtTributacaoExit(Sender: TObject);
    procedure edtRed_BCExit(Sender: TObject);
    procedure edtTributacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustoBrutoExit(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure imgIncluirClick(Sender: TObject);
    procedure edtFornecedorEnter(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure chkPromocaoClick(Sender: TObject);
    procedure actGerarSimilarExecute(Sender: TObject);
    procedure actSelecionarSimilarExecute(Sender: TObject);
    procedure imgCodigoSimilarClick(Sender: TObject);
    procedure edtPISExit(Sender: TObject);
    procedure edtEanExit(Sender: TObject);
    procedure edtEanQtdExit(Sender: TObject);
    procedure grdEanExit(Sender: TObject);
    procedure grdEanCellClick(Column: TColumn);
    procedure grdEanKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actGerarEanExecute(Sender: TObject);
    procedure imgGreraBarrasClick(Sender: TObject);
    procedure edtPrecoVendaExit(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure edtDescricaoCupomExit(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actEmitirEtiquetaExecute(Sender: TObject);
    procedure edtNCM_TIPIKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoVendaEnter(Sender: TObject);
    procedure edtP_DescontoCompraExit(Sender: TObject);
    procedure edtTipoItemKeyPress(Sender: TObject; var Key: Char);
    procedure edtTipoItemExit(Sender: TObject);
    procedure edtEanQtdEnter(Sender: TObject);
    procedure edtUnidadeAtacadoExit(Sender: TObject);
    procedure imgUltimo_RegClick(Sender: TObject);
    procedure imgProximo_RegClick(Sender: TObject);
    procedure imgRegisto_AntClick(Sender: TObject);
    procedure imgPrimeiro_RegClick(Sender: TObject);
    procedure edtCSTChange(Sender: TObject);
    procedure edtProdutoOriginadorKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoOriginadorExit(Sender: TObject);
    procedure btnMVAClick(Sender: TObject);
    procedure edtUnidadeEmbalagemExit(Sender: TObject);
    procedure tvsInfoAdicionaisShow(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtValorUnitarioEnter(Sender: TObject);
    procedure edtPercentualDescontoEnter(Sender: TObject);
    procedure edtPercentualDescontoExit(Sender: TObject);
    procedure rdgTipRegraChange(Sender: TObject);
    procedure cboCST_PIS_ENTRADAExit(Sender: TObject);
    procedure cboCST_COFINS_ENTRADAExit(Sender: TObject);
    procedure cboCST_PIS_SAIDAExit(Sender: TObject);
    procedure cboCST_COFINS_SAIDAExit(Sender: TObject);
    procedure chkEnviarParaBalancaClick(Sender: TObject);
    procedure cboControleLojasCloseUp(Sender: TObject);
    procedure edtCSTKeyPress(Sender: TObject; var Key: Char);
    procedure edtCOFINS_EntradaExit(Sender: TObject);
    procedure edtPIS_EntradaExit(Sender: TObject);
    procedure cboUnidadeMedidaExit(Sender: TObject);
    procedure edtSetordeBalancaChange(Sender: TObject);
    procedure imgIngredientesClick(Sender: TObject);
    procedure grdOrdemServicoDblClick(Sender: TObject);
    procedure grdOrdemServicoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    sBarras, sBarrasP: string;
    cPrecoCalculado, cPrecoVendaAnterior: Currency;
    bPesquisouGTIN14: boolean;
    vP_Tributos: Currency;
    procedure LimparMsgErro;
    procedure Codifica(num: string);
    procedure EANCorrecto(var num: string);
    procedure Dibujar(matrix: string);
    procedure DesabilitarControles;
    procedure HabilitarControles;
    procedure HabilitaDesabilitarControlesBalanca(pEnviarBalanca: smallint);
    procedure PreencherInfomacoesGenericasGrupo;
    procedure PreencherInfomacoesGenericasSubGrupo;
    procedure PreencherInfomacoesGenericasSecao;
    procedure CalcularPrecoVenda;
    procedure RemarcarSimilares;
    procedure ConfigurarImpressoraTermica;
    procedure EmitirEtiquetaGondolaSerial;
    procedure EmitirEtiquetaGondolaParalela;
    procedure RelacionarBarras;
    procedure RelacionarPrecoQuantidade;
    function ValidarCamposObrigatorios(pRegimeTributario: smallint): boolean;
    procedure RelacionarUltimaNFEntrada;
    procedure RelacionarFCPNCM;
    procedure RelacionarTabProdFilial(pProduto, pFilial:integer);
    procedure RelacionarSubGrupo;
    procedure RelacionarOSPendente;
    procedure RelacionarIOS_produto;
    function Validar_NCM:boolean;
    function ValidarUsuarioMaster:boolean;
    function Man_Tab_Produtos(pOpcao:smallint):boolean;
    function Man_Tab_ProdutoFilial(pOpcao:smallint):boolean;
    function Man_Tab_Barras(pOpcao:smallint;pBarras,pCodigoBarrasGerado:string;pProduto:integer):boolean;
    function Man_Tab_PrecoQuantidade(pOpcao:smallint):boolean;
    procedure AbrirTabelaFilial(pProduto:integer);
  public

    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation


{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, modPesquisaFornecedorCNPJRSocial, uConstantes_Padrao, uFuncoes, modPesquisaBarras, modMVA,
      modPesquisaGrupo, modPesquisaInfoNutricional, modPesquisaProduto, modPesquisaSecao, modPesquisaSetorBalanca, modPesquisaSubGrupo, modPesqTipoItem,
      modPesquisaTributacao, modIngredientes, modTeclado_Balanca, modMostrarSimilares, modSelecionarSimilar;

procedure TfrmProdutos.AbrirTabelaFilial(pProduto: integer);
begin

  dmMProvider.cdsProdutoFilial.Close;
  dmMProvider.cdsProdutoFilial.ProviderName := 'dspProdutoFilial';

  dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(pProduto));

  dmMProvider.cdsProdutoFilial.Open;
  dmMProvider.cdsProdutoFilial.ProviderName := '';

end;

procedure TfrmProdutos.actCancelarExecute(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutos.Cancel;

  if InserindoEditando(dmMProvider.cdsProdutoFilial) then
    dmMProvider.cdsProdutoFilial.Cancel;

  DesabilitarControles;

end;

function TfrmProdutos.Man_Tab_PrecoQuantidade(pOpcao:smallint):boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if (dmMProvider.cdsPrecoQuantidadePRECO_DESCONTO.Value = 0) and (dmMProvider.cdsPrecoQuantidadePRECO_UNITARIO.Value > 0) then
      dmMSProcedure.fdspPrecoQuantidade.Params[0].Value := 0
    else if (dmMProvider.cdsPrecoQuantidadePRECO_DESCONTO.Value = 1) and(dmMProvider.cdsPrecoQuantidadePERCENTUAL_DESCONTO.Value > 0) then
      dmMSProcedure.fdspPrecoQuantidade.Params[0].Value := 0
    else
      dmMSProcedure.fdspPrecoQuantidade.Params[0].Value := 1;

    dmMSProcedure.fdspPrecoQuantidade.Params[1].Value := dmMProvider.cdsProdutosPRODUTO.AsInteger;
    dmMSProcedure.fdspPrecoQuantidade.Params[2].Value := dmMProvider.cdsPrecoQuantidadeQUANTIDADE.AsCurrency;
    dmMSProcedure.fdspPrecoQuantidade.Params[3].Value := dmMProvider.cdsPrecoQuantidadePRECO_DESCONTO.AsCurrency;
    dmMSProcedure.fdspPrecoQuantidade.Params[4].Value := dmMProvider.cdsPrecoQuantidadePRECO_UNITARIO.AsCurrency;
    dmMSProcedure.fdspPrecoQuantidade.Params[5].Value := dmMProvider.cdsPrecoQuantidadeDESCRICAO.AsString;
    dmMSProcedure.fdspPrecoQuantidade.Params[6].Value := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspPrecoQuantidade.Params[7].Value := dmMProvider.cdsBarrasBARRAS.AsString;
    dmMSProcedure.fdspPrecoQuantidade.Params[8].Value := dmMProvider.cdsPrecoQuantidadePERCENTUAL_DESCONTO.AsCurrency;
    dmMSProcedure.fdspPrecoQuantidade.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    result := True;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;


procedure TfrmProdutos.actEditarExecute(Sender: TObject);
begin

  LimparMsgErro;

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    if dmDBEXMaster.sFlag_Permissao <> '' then
    begin

      if pos('A', dmDBEXMaster.sFlag_Permissao) > 0 then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_N_PERMISSAO_USUARIO;
        Application.ProcessMessages;
        exit;

      end;

    end;

    HabilitarControles;

    pgcProduto.ActivePageIndex := 1;

    edtFornecedor.SetFocus;
    dmMProvider.cdsProdutos.Edit;

  end;

end;

procedure TfrmProdutos.actEmitirEtiquetaExecute(Sender: TObject);
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    if (dmMProvider.cdsConfig_iniMARCA_MODELO_IMP_TERMICA.AsString <> '4') then
    begin

      if Copy(dmMProvider.cdsConfig_iniPORTA_IMP_TERMICA.AsString, 1, 3)  = 'COM' then
        EmitirEtiquetaGondolaSerial
      else
        EmitirEtiquetaGondolaParalela;

    end;

  end;

end;

procedure TfrmProdutos.actExcluirExecute(Sender: TObject);
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    if not InserindoEditando(dmMProvider.cdsProdutos) then
    begin

      LimparMsgErro;

      if dmDBEXMaster.sFlag_Permissao <> '' then
      begin

        if pos('E', dmDBEXMaster.sFlag_Permissao) > 0 then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_N_PERMISSAO_USUARIO;
          Application.ProcessMessages;
          exit;

        end;

      end;

      if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', confirma exclus�o deste registro!'), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
      begin

        if Man_Tab_Produtos(1) then
        begin

          dmMProvider.cdsProdutos.Delete;
          dmMProvider.cdsBarras.Delete;
          dmMProvider.cdsProdutoFilial.Delete;

          imgEan.Visible := False;
          ptbEAN.Visible := False;

          DesabilitarControles;

        end;

      end;

    end;

  end;

end;

procedure TfrmProdutos.actGerarEanExecute(Sender: TObject);
var
  iContador: Integer;
  sBarras: string;
begin

  iContador := 0;

  if dmDBEXMaster.iIdFilial > 1 then
  begin

    Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + #13 + #13 +
          'Produto sem c�digo de barras da ind�stria, bem como' + #13 +
          'com peso vari�vel, deve ser cadastrado pela matriz!'), 'Aten��o!', mb_IconQuestion + mb_ok);

  end
  else
  begin

    if dmMProvider.cdsBarras.IsEmpty then
    begin

      dmDBEXMaster.fdqBarras.Close;
      dmDBEXMaster.fdqBarras.SQL.Clear;
      dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
      dmDBEXMaster.fdqBarras.SQL.Add('WHERE GERADO = 1');
      dmDBEXMaster.fdqBarras.SQL.Add('ORDER BY BARRAS');
      dmDBEXMaster.fdqBarras.Open;

      while not dmDBEXMaster.fdqBarras.Eof do
      begin

        Inc(iContador);

        if iContador < StrToFloat(Copy(dmDBEXMaster.fdqBarras.FieldByName('BARRAS').AsString, 1, 12)) then
        begin

          sBarras := GerarCodigodeBarras(FormatFloat('000000000000', iContador));
          break;

        end;

        dmDBEXMaster.fdqBarras.Next;

      end;

      if sBarras = '' then
      begin

        Inc(iContador);
        sBarras := GerarCodigodeBarras(FormatFloat('000000000000', iContador));

      end;

      dmMProvider.cdsBarras.Append;
      dmMProvider.cdsBarrasPRODUTO.Value  := dmMProvider.cdsProdutosPRODUTO.Value;
      dmMProvider.cdsBarrasBARRAS.Value   := sBarras;
      dmMProvider.cdsBarrasGERADO.Value   := 1;

      if dmMProvider.cdsProdutosUNIDADE.Value = 'KG' then
        dmMProvider.cdsBarrasPESADO.Value := 1
      else
        dmMProvider.cdsBarrasPESADO.Value := 0;

      dmMProvider.cdsBarrasQUANTIDADE.Value := 1;
      dmMProvider.cdsBarras.Post;

      if Man_Tab_Barras(0,dmMProvider.cdsBarrasBARRAS.Value, dmMProvider.cdsBarrasBARRAS.Value,dmMProvider.cdsProdutosPRODUTO.AsInteger) then
      begin

        Codifica(dmMProvider.cdsBarrasBARRAS.AsString);

        // Repassa Imagem para o Image
        imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect(0, 0, 500, 500));
        imgEan.Visible := true;
        ptbEAN.Visible := False;

      end;

      dmDBEXMaster.fdqBarras.Close;

    end;

  end;

end;

procedure TfrmProdutos.actGerarSimilarExecute(Sender: TObject);
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', deseja gerar um novo c�digo similar para este produto?'), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
    begin

      dmDBEXMaster.fdqMasterPesquisa.Close;
      dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
      dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT PRODUTO, DESCRICAO, "SIMILAR" FROM PRODUTO');
      dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE "SIMILAR" > 0');
      dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ORDER BY "SIMILAR" DESCENDING');
      dmDBEXMaster.fdqMasterPesquisa.Open;

      if not InserindoEditando(dmMProvider.cdsProdutos) then
        dmMProvider.cdsProdutos.Edit;

      if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        dmMProvider.cdsProdutosSIMILAR.Value := 1
      else
        dmMProvider.cdsProdutosSIMILAR.Value := dmDBEXMaster.fdqMasterPesquisa.FieldByName('SIMILAR').Value + 1;

    end;

    dmDBEXMaster.fdqMasterPesquisa.Close;

  end;

end;

procedure TfrmProdutos.actIncluirExecute(Sender: TObject);
begin

  LimparMsgErro;

  if dmDBEXMaster.sFlag_Permissao <> '' then
  begin

    if pos('I', dmDBEXMaster.sFlag_Permissao) > 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_N_PERMISSAO_USUARIO;
      Application.ProcessMessages;
      exit;

    end;

  end;

  if not InserindoEditando(dmMProvider.cdsProdutos)then
  begin

    dmDBEXMaster.bCodigoGerado := False;

    LimparMsgErro;

    frmPesquisaBarras := TfrmPesquisaBarras.Create(self);

    if frmPesquisaBarras.ShowModal = mrOk then
    begin

      HabilitarControles;

      grpBarras.Enabled           := False;
      grpFormacaodePreco.Enabled  := False;

      AbrirTabelaFilial(-1);

      dmMProvider.cdsProdutosFORNECEDOR.Value := 1;
      dmMProvider.cdsProdutos.Append;
      dmMProvider.cdsProdutoFilial.Append;

      pgcProduto.ActivePageIndex  := 1;

      edtFornecedor.SetFocus;

      imgEan.Visible := False;
      ptbEAN.Visible := False;

      if Length(Trim(frmPesquisaBarras.edtCodigoBarras.Text)) > 0 then

        sBarras := FormatFloat('0000000000000', StrToFloat(frmPesquisaBarras.edtCodigoBarras.Text));

    end;

    FreeAndNil(frmPesquisaBarras);

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_SALVE_ALTERACOES;
    Application.ProcessMessages;

  end;

end;

procedure TfrmProdutos.actSairExecute(Sender: TObject);
begin

  Close

end;

procedure TfrmProdutos.actSalvarExecute(Sender: TObject);
begin

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
  begin

    if Validar_NCM then
    begin

      if Length(Trim(edtTipoItem.Text)) <= 0 then
      begin

        lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
        Application.ProcessMessages;
        edtTipoItem.SetFocus;
        exit;

      end;

      if Length(Trim(edtDescricao.Text)) <= 0 then
      begin

        lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
        Application.ProcessMessages;
        edtDescricao.SetFocus;
        exit;

      end;

      if chkPromocao.Checked then
      begin

        if dmMProvider.cdsProdutoFilialPRECOPROMOCAO.AsCurrency <= 0 then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', item em promo��o! Informe o pre�o de promo��o!';
          Application.ProcessMessages;
          edtPrecoPromocao.SetFocus;

        end;

      end;

      if cPrecoVendaAnterior <> dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency then
      begin

        dmMProvider.cdsProdutoFilialPRECODEVENDAANTERIOR.Value := cPrecoVendaAnterior;
        dmMProvider.cdsProdutoFilialREMARCACAO.Value           := Date;

      end;

      dmMProvider.cdsProdutosSTATUS.Value := 1;

      LimparMsgErro;

      if ValidarCamposObrigatorios(dmMProvider.cdsFilialREGIME_TRIBUTARIO.AsInteger) then
      begin

        dmMProvider.cdsProdutos.Post;

        Man_Tab_Produtos(0);

      end
      else
        exit;

    end
    else
      exit;

  end;

  if InserindoEditando(dmMProvider.cdsBarras) then
  begin

    if Man_Tab_Barras(0,dmMProvider.cdsBarrasBARRAS.AsString, dmMProvider.cdsBarrasBARRAS.AsString,dmMProvider.cdsProdutosPRODUTO.AsInteger) then
    begin

      if InserindoEditando(dmMProvider.cdsPrecoQuantidade) then
      begin

        if Man_Tab_PrecoQuantidade(0) then
          RelacionarPrecoQuantidade;
      end;

    end;


  end;

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT COUNT(*) AS T_ITENS FROM PRODUTO');
  dmDBEXMaster.fdqMasterPesquisa.Open;

  lblQtdItens.Caption := 'Itens: ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('T_ITENS').AsInteger);

  DesabilitarControles;

  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmProdutos.actSelecionarSimilarExecute(Sender: TObject);
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    frmSelecionarSimilar := TfrmSelecionarSimilar.Create(self);

    if frmSelecionarSimilar.ShowModal = mrOk then
    begin

      if not InserindoEditando(dmMProvider.cdsProdutos) then
        dmMProvider.cdsProdutos.Edit;

      dmMProvider.cdsProdutosSIMILAR.Value := dmMProvider.cdsSimilarSIMILAR.Value;

    end;

    FreeAndNil(frmSelecionarSimilar);

  end;


end;

procedure TfrmProdutos.btnMVAClick(Sender: TObject);
begin

  frmMva := TfrmMva.Create(self);
  frmMva.ShowModal;

  freeandnil(frmMva);

end;

procedure TfrmProdutos.CalcularPrecoVenda;
var
  cDespesasVariaveis, cDespesasFixas, cMarkup: Currency;

begin

  case dmMProvider.cdsConfiguracoesTIPOCLD.Value of
    0:begin

        dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency  := dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency +(dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency *(dmMProvider.cdsProdutoFilialLUCROLIQUIDO.AsCurrency / 100));
        dmMProvider.cdsProdutoFilialPRECOPROVISORIO.AsCurrency := dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency;

      end;
    1:begin

        dmMProvider.cdsProdutoFilialVALORDODESCONTONACOMPRA.AsCurrency := dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency * (dmMProvider.cdsProdutoFilialDESCONTONACOMPRA.AsCurrency / 100);
        dmMProvider.cdsProdutoFilialVALORDOFRETE.AsCurrency            := dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency * (dmMProvider.cdsProdutoFilialFRETE.AsCurrency / 100);
        dmMProvider.cdsProdutoFilialVALORDEOUTROSCUSTOS.AsCurrency     := dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency * (dmMProvider.cdsProdutoFilialOUTROSCUSTOS.AsCurrency / 100);
        dmMProvider.cdsProdutoFilialVALORDOCREDITODEICMSR.AsCurrency   := ((dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency - dmMProvider.cdsProdutoFilialVALORDODESCONTONACOMPRA.AsCurrency) + dmMProvider.cdsProdutoFilialVALORDOFRETE.AsCurrency) *(dmMProvider.cdsProdutoFilialCREDITODEICMS.AsCurrency / 100);
        dmMProvider.cdsProdutoFilialVALORDOIPI.AsCurrency              := (dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency - dmMProvider.cdsProdutoFilialVALORDODESCONTONACOMPRA.AsCurrency) * (dmMProvider.cdsProdutoFilialIPI.AsCurrency / 100);
        {dmMProvider.cdsProdutosVALOR_ISSQN.AsCurrency :=
          (dmMProvider.cdsProdutosCUSTO_BRUTO.AsCurrency -
            dmMProvider.cdsProdutosV_DESCONTO_NA_COMPRA.AsCurrency) *
          (dmMProvider.cdsProdutosPERCENTUAL_ISSQN.AsCurrency / 100);

        dmMProvider.cdsProdutosVALOR_IOF.AsCurrency :=
          (dmMProvider.cdsProdutosCUSTO_BRUTO.AsCurrency -
            dmMProvider.cdsProdutosV_DESCONTO_NA_COMPRA.AsCurrency) *
          (dmMProvider.cdsProdutosPERCENTUAL_IOF.AsCurrency / 100);

        dmMProvider.cdsProdutosVALOR_CIDE.AsCurrency :=
          (dmMProvider.cdsProdutosCUSTO_BRUTO.AsCurrency -
            dmMProvider.cdsProdutosV_DESCONTO_NA_COMPRA.AsCurrency) *
          (dmMProvider.cdsProdutosPERCENTUAL_CIDE.AsCurrency / 100);
        }
        if dmMProvider.cdsProdutoFilialVALORDOICMSR.AsCurrency > 0 then
          dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency  := (dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency - dmMProvider.cdsProdutoFilialVALORDODESCONTONACOMPRA.AsCurrency)
                                                                    + (dmMProvider.cdsProdutoFilialVALORDOICMSR.AsCurrency + dmMProvider.cdsProdutoFilialVALORDOIPI.AsCurrency
                                                                    + dmMProvider.cdsProdutoFilialVALORDEOUTROSCUSTOS.AsCurrency + dmMProvider.cdsProdutoFilialVALORDOFRETE.AsCurrency)
        else
          dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency  := dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency -  (dmMProvider.cdsProdutoFilialVALORDODESCONTONACOMPRA.AsCurrency + dmMProvider.cdsProdutoFilialVALORDOCREDITODEICMSR.AsCurrency)
                                                                  + (dmMProvider.cdsProdutoFilialVALORDOIPI.AsCurrency + dmMProvider.cdsProdutoFilialVALORDEOUTROSCUSTOS.AsCurrency +  dmMProvider.cdsProdutoFilialVALORDOFRETE.AsCurrency);

        cDespesasVariaveis  := dmMProvider.cdsProdutoFilialICMSAPAGAR.AsCurrency + dmMProvider.cdsProdutoFilialCOMISSAOVENDA.AsCurrency + dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.AsCurrency
                                + dmMProvider.cdsProdutoFilialPERCENTUAL_ISS.AsCurrency + dmMProvider.cdsProdutoFilialPERCENTUAL_IOF.AsCurrency + dmMProvider.cdsProdutoFilialPERCENTUAL_CIDE.AsCurrency;

        // custooperacional = despesas Fixas = folha/pro-labore/tarifas/aluguel/seguros/desp gerais
        cMarkup             := (100 - (cDespesasVariaveis + dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.AsCurrency + dmMProvider.cdsProdutoFilialLUCROLIQUIDO.AsCurrency)) / 100;

        if cMarkup > 0 then
        begin

          dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency   := (dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency / cMarkup);
          cMarkup                                                 := (100 - (cDespesasVariaveis + dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.AsCurrency)) / 100;
          dmMProvider.cdsProdutoFilialMENORPRECO.AsCurrency       := (dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency / cMarkup);

        end;

        if dmMProvider.cdsProdutoFilialDESCONTONAVENDA.AsCurrency > 0 then
          dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency  := (100 * dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency) / (100 - dmMProvider.cdsProdutoFilialDESCONTONAVENDA.AsCurrency);

        dmMProvider.cdsProdutoFilialPRECOPROVISORIO.AsCurrency   := dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency;

      end;

  end;

end;

procedure TfrmProdutos.chkEnviarParaBalancaClick(Sender: TObject);
begin

  if chkEnviarParaBalanca.Checked then
    HabilitaDesabilitarControlesBalanca(1)
  else
    HabilitaDesabilitarControlesBalanca(0);

end;

procedure TfrmProdutos.chkPromocaoClick(Sender: TObject);
begin

  if (InserindoEditando(dmMProvider.cdsProdutoFilial))and (pgcProduto.ActivePageIndex = 1) then
  begin

    edtPrecoVenda.ReadOnly    := chkPromocao.Checked;
    edtPrecoPromocao.ReadOnly := not chkPromocao.Checked;

    if not chkPromocao.Checked then
      dmMProvider.cdsProdutoFilialPRECOPROMOCAO.Value := 0
    else
      edtPrecoPromocao.SetFocus;

  end;

end;

procedure TfrmProdutos.cboControleLojasCloseUp(Sender: TObject);
begin

  LimparMsgErro;

  if cboControleLojas.Text <> '' then
  begin

    lblAguarde.Visible := true;

    dmMProvider.cdsProdutoFilial.Close;
    dmMProvider.cdsProdutoFilial.ProviderName := 'dspProdutoFilial';

    dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
    dmDBEXMaster.fdqProdutoFilial.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
    dmDBEXMaster.fdqProdutoFilial.SQL.Add('JOIN PRODUTOFILIAL PF');
    dmDBEXMaster.fdqProdutoFilial.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
    dmDBEXMaster.fdqProdutoFilial.SQL.Add('WHERE PF.PRODUTO = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));
    dmDBEXMaster.fdqProdutoFilial.SQL.Add(' AND PF.FILIAL = ' + IntToStr(cboControleLojas.KeyValue));

    dmMProvider.cdsProdutoFilial.Open;
    dmMProvider.cdsProdutoFilial.ProviderName := '';

    if dmMProvider.cdsProdutoFilial.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PRODUTO_RELACIONADO;
      Application.ProcessMessages;

    end;

    lblAguarde.Visible := False;

  end;

end;

procedure TfrmProdutos.cboCST_COFINS_ENTRADAExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutosCST_PIS_ENTRADA.Value := dmMProvider.cdsProdutosCST_COFINS_ENTRADA.Value;

end;

procedure TfrmProdutos.cboCST_COFINS_SAIDAExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutosCST_PIS.Value := dmMProvider.cdsProdutosCST_COFINS.Value;

end;

procedure TfrmProdutos.cboCST_PIS_ENTRADAExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutosCST_COFINS_ENTRADA.Value := dmMProvider.cdsProdutosCST_PIS_ENTRADA.Value;

end;

procedure TfrmProdutos.cboCST_PIS_SAIDAExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutosCST_COFINS.Value := dmMProvider.cdsProdutosCST_PIS.Value;

end;

procedure TfrmProdutos.cboUnidadeMedidaExit(Sender: TObject);
begin

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
  begin

    if Trim(dmMProvider.cdsProdutosUNIDADE.Value) = 'KG' then
    begin

      dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value     := 1;
      dmMProvider.cdsProdutoFilialDESCRICAOBALANCA.Value   := AbreviaNome(dmMProvider.cdsProdutosDESCRICAO.Value);
      dmMProvider.cdsProdutoFilialENVIARPARABALANCA.Value  := 1;
      LimparMsgErro;

    end;

    HabilitaDesabilitarControlesBalanca(dmMProvider.cdsProdutoFilialENVIARPARABALANCA.Value);

  end;

end;

procedure TfrmProdutos.grdEanCellClick(Column: TColumn);
begin

  Codifica(dmMProvider.cdsBarrasBARRAS.AsString);

  // Repassa Imagem para o Image
  imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect(0, 0, 500, 500));
  ptbEAN.Visible := False;

end;

procedure TfrmProdutos.grdEanDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not odd(dmMProvider.cdsBarras.RecNo) then
  begin

    grdEan.Canvas.Font.Color := clBlack;
    grdEan.Canvas.Brush.Color := COR_ZEBRA_GRADE;

  end
  else
  begin

    grdEan.Canvas.Font.Color := clBlack;
    grdEan.Canvas.Brush.Color := clWhite;

  end;

  grdEan.Canvas.FillRect(Rect);
  grdEan.DefaultDrawDataCell(Rect, Column.Field, State);

end;

procedure TfrmProdutos.grdEanExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsBarras) then
    dmMProvider.cdsBarras.Post;

end;

procedure TfrmProdutos.grdEanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Shift = [ssctrl]) and (Key = 46) then
  begin

    Key := 0;
    exit;

  end;

  if Key = 46 then
  begin

    if not(dmMProvider.cdsBarras.IsEmpty) then
    begin

      if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_EXCLUIR), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
      begin

        if Man_Tab_Barras(1,dmMProvider.cdsBarrasBARRAS.Value, dmMProvider.cdsBarrasBARRAS.Value,0) then
          dmMProvider.cdsBarras.Delete;

      end;

      if dmMProvider.cdsBarras.IsEmpty then
      begin

        imgEan.Visible := False;
        ptbEAN.Visible := False;

      end
      else
      begin

        Codifica(dmMProvider.cdsBarrasBARRAS.AsString);

        // Repassa Imagem para o Image
        imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect(0, 0, 500, 500));
        ptbEAN.Visible := False;

      end;

      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmProdutos.grdOrdemServicoDblClick(Sender: TObject);
begin

  if not( dmMProvider.cdsProdutos.IsEmpty) and (not dmMProvider.cdsOS_Produto.IsEmpty) then
    RelacionarIOS_produto;

end;

procedure TfrmProdutos.grdOrdemServicoKeyPress(Sender: TObject; var Key: Char);
begin

  if KEY = #13 then
    grdOrdemServicoDblClick(Self);

end;

procedure TfrmProdutos.grdTabelaDblClick(Sender: TObject);
begin

  if dmMProvider.cdsProdutos.Active then

    if not dmMProvider.cdsProdutos.IsEmpty then
    begin

      RelacionarUltimaNFEntrada;
      RelacionarTabProdFilial(dmMProvider.cdsProdutosPRODUTO.Value, dmDBEXMaster.iIdFilial);
      RelacionarOSPendente;
      RelacionarFCPNCM;
      RelacionarSubGrupo;

      pgcProduto.ActivePageIndex := 1;

      dmMProvider.cdsBarras.Close;
      dmMProvider.cdsBarras.ProviderName := 'dspBarras';

      dmDBEXMaster.fdqBarras.SQL.Clear;
      dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
      dmDBEXMaster.fdqBarras.SQL.Add('WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));

      dmMProvider.cdsBarras.Open;
      dmMProvider.cdsBarras.ProviderName := '';

      if bPesquisouGTIN14 then
      begin

        while not dmMProvider.cdsBarras.Eof do
        begin

          if Length(Trim(dmMProvider.cdsBarrasBARRAS.Value)) < 14 then
            dmMProvider.cdsBarras.Next
          else
            break;

        end;

      end;

      if Length(dmMProvider.cdsBarrasBARRAS.Value) > 8 then
      begin

        Codifica(dmMProvider.cdsBarrasBARRAS.AsString);
        // Repassa Imagem para o Image
        imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect(0, 0, 500, 500));
        ptbEAN.Visible := False;

      end;

      dmMProvider.cdsBarras.Locate('BARRAS', sBarras, []);

    end;

end;

procedure TfrmProdutos.grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    if not odd(dmMProvider.cdsProdutos.RecNo) then
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := clWhite;

    end;

    if Column.Index = 4 then
      grdTabela.Canvas.Font.Color := clBlue;

    if Column.Index = 5 then
      grdTabela.Canvas.Font.Color := clGreen;

    if Column.Index = 8 then
      if dmMProvider.cdsProdutosATIVO.Value = 0 then
        grdTabela.Canvas.Font.Color := clRed
      else
        grdTabela.Canvas.Font.Color := clBlack;

    grdTabela.Canvas.FillRect(Rect);
    grdTabela.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmProdutos.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
    grdTabelaDblClick(Sender);

end;

procedure TfrmProdutos.grdTabelaTitleClick(Column: TColumn);
var
  i: Integer;
begin

  if dmMProvider.cdsProdutos.Active then
  begin

    if not dmMProvider.cdsProdutos.IsEmpty then
    begin

      for i := 0 to grdTabela.Columns.Count - 1 do
        grdTabela.Columns[i].Title.Color := clRed;

      if not(Column.Field.DataType in [ftBlob, ftMemo]) then
        if Column.Field.FieldKind = fkData then
          dmMProvider.cdsProdutos.IndexFieldNames := Column.FieldName
        else if Column.FieldName = 'S_ATIVO' then
          dmMProvider.cdsProdutos.IndexFieldNames := 'ATIVO'
        else if Column.FieldName = 'S_PROMOCAO' then
          dmMProvider.cdsProdutos.IndexFieldNames := 'PROMOCAO';
      grdTabela.Columns[Column.Index].Title.Color := COR_TITULO_GRADE;

    end;

  end;

end;

procedure TfrmProdutos.HabilitaDesabilitarControlesBalanca(pEnviarBalanca: smallint);
begin

  edtSetordeBalanca.Enabled             := (pEnviarBalanca = 1);
  edtNome_SetordeBalanca.Enabled        := edtSetordeBalanca.Enabled;
  edtDescricaoBalanca.Enabled           := edtSetordeBalanca.Enabled;
  edtCodTeclado.Enabled                 := edtSetordeBalanca.Enabled;
  edtTeclaAssociada.Enabled             := edtSetordeBalanca.Enabled;
  edtValidade.Enabled                   := edtSetordeBalanca.Enabled;
  edtInfoNutricional.Enabled            := edtSetordeBalanca.Enabled;
  edtDescricao_info_Nutricional.Enabled := edtSetordeBalanca.Enabled;

end;

procedure TfrmProdutos.HabilitarControles;
begin

  grpCadastro.Enabled         := true;
  grpPDV.Enabled              := grpCadastro.Enabled;
  grpBarras.Enabled           := grpCadastro.Enabled;
  grpFiscal.Enabled           := grpCadastro.Enabled;
  grpSimilar.Enabled          := grpCadastro.Enabled;
  grpFormacaodePreco.Enabled  := grpCadastro.Enabled;
  grpGramatura.Enabled        := grpCadastro.Enabled;
  grpPrecos.Enabled           := grpCadastro.Enabled;
  grpEstoque.Enabled          := grpCadastro.Enabled;
  grpFlags.Enabled            := grpCadastro.Enabled;
  grpProduto_Origem.Enabled   := grpCadastro.Enabled;
  grpPisCofins.Enabled        := grpCadastro.Enabled;
  grpPrecoQuantidade.Enabled  := grpCadastro.Enabled;
  grpCodigoANP.Enabled        := grpCadastro.Enabled;

  if chkDescontoPersonalizado.Visible then
    chkDescontoPersonalizado.Enabled := grpCadastro.Enabled;

end;

procedure TfrmProdutos.Codifica(num: string);
// Desenho das barras
const
  EAN_izqA: array [0 .. 9] of pchar = ('0001101', '0011001', '0010011',
    '0111101', '0100011', '0110001', '0101111', '0111011', '0110111',
    '0001011');
  EAN_izqB: array [0 .. 9] of pchar = ('0100111', '0110011', '0011011',
    '0100001', '0011101', '0111001', '0000101', '0010001', '0001001',
    '0010111');
  EAN_dcha: array [0 .. 9] of pchar = ('1110010', '1100110', '1101100',
    '1000010', '1011100', '1001110', '1010000', '1000100', '1001000',
    '1110100');
  CodificaIzq: array [0 .. 9] of pchar = ('AAAAA', 'ABABB', 'ABBAB', 'ABBBA',
    'BAABB', 'BBAAB', 'BBBAA', 'BABAB', 'BABBA', 'BBABA');
var
  matrix: string;
  i: Integer;
begin

  num := '0' + Copy(dmMProvider.cdsBarrasBARRAS.AsString, 1, 12);

  matrix := '';

  case Length(num) of
    13:
      begin

        matrix := matrix + 'x0x'; // barra inicio
        matrix := matrix + EAN_izqA[StrToInt(num[2])];

        for i := 3 to 7 do
          if CodificaIzq[StrToInt(num[1])][i - 3] = 'A' then
            matrix := matrix + EAN_izqA[StrToInt(num[i])]
          else
            matrix := matrix + EAN_izqB[StrToInt(num[i])];

        matrix := matrix + '0x0x0'; // barra central
        matrix := matrix + EAN_dcha[StrToInt(num[8])];
        matrix := matrix + EAN_dcha[StrToInt(num[9])];
        matrix := matrix + EAN_dcha[StrToInt(num[10])];
        matrix := matrix + EAN_dcha[StrToInt(num[11])];
        matrix := matrix + EAN_dcha[StrToInt(num[12])];
        matrix := matrix + EAN_dcha[StrToInt(num[13])];
        matrix := matrix + 'x0x'; // barra final
        Dibujar(matrix);

      end;
    8:
      begin

        matrix := matrix + 'x0x';
        matrix := matrix + EAN_izqA[StrToInt(num[1])];
        matrix := matrix + EAN_izqA[StrToInt(num[2])];
        matrix := matrix + EAN_izqA[StrToInt(num[3])];
        matrix := matrix + EAN_izqA[StrToInt(num[4])];
        matrix := matrix + '0x0x0';
        matrix := matrix + EAN_dcha[StrToInt(num[5])];
        matrix := matrix + EAN_dcha[StrToInt(num[6])];
        matrix := matrix + EAN_dcha[StrToInt(num[7])];
        matrix := matrix + EAN_dcha[StrToInt(num[8])];
        matrix := matrix + 'x0x';
        Dibujar(matrix);

      end
    else
      ShowMessage('Tamanho do c�digo inv�lido deve usar 8 ou 13 digios');
  end;
end;

procedure TfrmProdutos.ConfigurarImpressoraTermica;
begin

  comImpressoraTermica.Port                     := dmMProvider.cdsConfig_iniPORTA_IMP_TERMICA.AsString;
  comImpressoraTermica.BaudRate                 := StrToBaudRate(dmMProvider.cdsConfig_iniBPS_IMP_TERMICA.AsString);
  comImpressoraTermica.Parity.Bits              := StrToParity(dmMProvider.cdsConfig_iniPARIDADE_IMP_TERMICA.AsString);
  comImpressoraTermica.StopBits                 := StrToStopBits(dmMProvider.cdsConfig_iniBITS_PARADA_IMP_TERMCA.AsString);
  comImpressoraTermica.DataBits                 := StrToDataBits(dmMProvider.cdsConfig_iniBITS_DADOS_IMP_TERMICA.AsString);
  comImpressoraTermica.FlowControl.FlowControl  := StrToFlowControl(dmMProvider.cdsConfig_iniCTRL_FLUXO_IMP_TERMICA.AsString);

end;

procedure TfrmProdutos.DesabilitarControles;
begin

  grpCadastro.Enabled         := False;
  grpPDV.Enabled              := grpCadastro.Enabled;
  grpBarras.Enabled           := grpCadastro.Enabled;
  grpFiscal.Enabled           := grpCadastro.Enabled;
  grpSimilar.Enabled          := grpCadastro.Enabled;
  grpFormacaodePreco.Enabled  := grpCadastro.Enabled;
  grpGramatura.Enabled        := grpCadastro.Enabled;
  grpPrecos.Enabled           := grpCadastro.Enabled;
  grpEstoque.Enabled          := grpCadastro.Enabled;
  grpFlags.Enabled            := grpCadastro.Enabled;
  grpProduto_Origem.Enabled   := grpCadastro.Enabled;
  grpPisCofins.Enabled        := grpCadastro.Enabled;
  grpPrecoQuantidade.Enabled  := grpCadastro.Enabled;
  grpCodigoANP.Enabled        := grpCadastro.Enabled;

  if chkDescontoPersonalizado.Visible then
    chkDescontoPersonalizado.Enabled := grpCadastro.Enabled;

end;

procedure TfrmProdutos.Dibujar(matrix: string);
var
  i: Integer;
begin

  ptbEAN.Canvas.Brush.Color := clWhite;
  ptbEAN.Canvas.FillRect(Rect(0, 0, ptbEAN.Width, ptbEAN.Height));
  ptbEAN.Canvas.Pen.Color := clBlack;

  for i := 1 to Length(matrix) do
    if matrix[i] = '1' then
      ptbEAN.Canvas.PolyLine([Point(10 + i, 10), Point(10 + i, 50)])
    else if matrix[i] = 'x' then
      ptbEAN.Canvas.PolyLine([Point(10 + i, 10), Point(10 + i, 55)]);

  if Length(dmMProvider.cdsBarrasBARRAS.AsString) = 13 then
  begin

    ptbEAN.Canvas.TextOut(3, 50, dmMProvider.cdsBarrasBARRAS.AsString[1]);
    ptbEAN.Canvas.TextOut(17, 50, Copy(dmMProvider.cdsBarrasBARRAS.AsString, 2,
        6));
    ptbEAN.Canvas.TextOut(63, 50, Copy(dmMProvider.cdsBarrasBARRAS.AsString, 8,
        6));

  end
  else if Length(dmMProvider.cdsBarrasBARRAS.AsString) = 8 then
  begin

    ptbEAN.Canvas.TextOut(16, 50, Copy(dmMProvider.cdsBarrasBARRAS.AsString, 1,
        4));
    ptbEAN.Canvas.TextOut(48, 50, Copy(dmMProvider.cdsBarrasBARRAS.AsString, 5,
        4));

  end;

  // PaintBox1.Picture.SaveToFile('c:\windows\escritorio\BarCode\'+Edit1.Text+'.bmp');
end;

procedure TfrmProdutos.EANCorrecto(var num: string);
var
  i, N: byte;
  sum: Integer;
  flag: byte;
begin
  sum := 0;

  N := Length(num) - 1;

  for i := 1 to N do
  begin

    if (i mod 2) = 0 then
    begin

      if N = 12 then
        sum := sum + StrToInt(num[i]) * 3
      else
        sum := sum + StrToInt(num[i]);

    end
    else
    begin

      if N = 12 then
        sum := sum + StrToInt(num[i])
      else
        sum := sum + StrToInt(num[i]) * 3;

    end;

  end;

  if sum > 99 then
    flag := 10 - (sum mod 100)
  else
    flag := 10 - (sum mod 10);

  if flag = 10 then
    flag := 0;

  if not(StrToInt(num[N + 1]) = flag) then
    num := Copy(num, 1, Length(num) - 1) + IntToStr(flag);

end;

procedure TfrmProdutos.edtCOFINS_EntradaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if chkPromocao.Checked then
  begin

    if dmMProvider.cdsProdutoFilialPRECOPROMOCAO.Value <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', item em promo��o! Informe o pre�o de promo��o!';
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmProdutos.edtConteudoPesquisaExit(Sender: TObject);
var
  sWhere, sBarras, sDigitoVerificador: string;
begin

  bPesquisouGTIN14  := Length(Trim(edtConteudoPesquisa.Text)) = 14;
  sBarras           := '';

  MudarCorEdit(Sender);

  LimparMsgErro;

  try

    if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
    begin

      pgcProduto.ActivePageIndex := 0;

      case rdpOpcaoPesquisa.ItemIndex of

        0:sWhere := 'WHERE PRO.PRODUTO = ' + edtConteudoPesquisa.Text;
        1:begin

            if Length(edtConteudoPesquisa.Text) < 8 then
            begin

              sBarras := GerarCodigodeBarras(FormatFloat('000000000000', StrToFloat(edtConteudoPesquisa.Text)));

              sWhere  := 'WHERE BARRAS = ' + QuotedStr(sBarras);

              dmDBEXMaster.fdqBarras.Close;
              dmDBEXMaster.fdqBarras.SQL.Clear;
              dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
              dmDBEXMaster.fdqBarras.SQL.Add(sWhere);
              dmDBEXMaster.fdqBarras.Open;

            end
            else
            begin

              sDigitoVerificador := ValidarCodigoBarras(edtConteudoPesquisa.Text);

              if ValidaEAN(edtConteudoPesquisa.Text) then
              begin

                sBarras   := edtConteudoPesquisa.Text;
                sBarrasP  := sBarras;

                if Length(sBarras) = 14 then
                  sWhere := 'WHERE BARRAS = ' + QuotedStr(sBarras)
                else
                  sWhere := 'WHERE BARRAS  = ' + QuotedStr(FormatFloat('0000000000000', StrToFloat(sBarras)));

                dmDBEXMaster.fdqBarras.Close;
                dmDBEXMaster.fdqBarras.SQL.Clear;
                dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
                dmDBEXMaster.fdqBarras.SQL.Add(sWhere);
                dmDBEXMaster.fdqBarras.Open;

              end
              else
              begin

                if Length(edtConteudoPesquisa.Text) > 12 then
                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_BARRAS_INVALIDO + ' / ' + edtConteudoPesquisa.Text
                                    + ' * Correto: ' + Copy(edtConteudoPesquisa.Text, 1, Length (edtConteudoPesquisa.Text) - 1) + sDigitoVerificador
                else
                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_BARRAS_INVALIDO + ' / ' + edtConteudoPesquisa.Text
                                    + ' * Correto: ' + edtConteudoPesquisa.Text +  sDigitoVerificador;
                Application.ProcessMessages;

                edtConteudoPesquisa.SetFocus;
                edtConteudoPesquisa.SelectAll;
                exit;

              end;

            end;

          end;
        2:sWhere := 'WHERE PRO.COMPLEMENTO  = ' + QuotedStr(edtConteudoPesquisa.Text);
        3:sWhere := 'WHERE PRO.DESCRICAO LIKE ' + QuotedStr('%' + edtConteudoPesquisa.Text + '%');
        4:sWhere := 'WHERE PRO.FORNECEDOR =   ' + edtConteudoPesquisa.Text;

      end;

      if dmDBEXMaster.fdqBarras.Active then
      begin

        if not dmDBEXMaster.fdqBarras.IsEmpty then
        begin

          sWhere := 'WHERE PRO.PRODUTO = ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value);

          dmMProvider.cdsProdutos.Close;
          dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

          dmDBEXMaster.fdqProdutos.SQL.Clear;
          dmDBEXMaster.fdqProdutos.SQL.Add('SELECT * FROM PRODUTO PRO');
          dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
          dmDBEXMaster.fdqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
          dmDBEXMaster.fdqProdutos.SQL.Add(' AND PRO.VISIBILIDADE = 1');
          dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');

          dmMProvider.cdsProdutos.Open;
          dmMProvider.cdsProdutos.ProviderName := '';

        end;

      end;

      if rdpOpcaoPesquisa.ItemIndex <> 1 then
      begin

        dmMProvider.cdsProdutos.Close;
        dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

        dmDBEXMaster.fdqProdutos.SQL.Clear;
        dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
        dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
        dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
        dmDBEXMaster.fdqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
        dmDBEXMaster.fdqProdutos.SQL.Add(' AND PRO.VISIBILIDADE = 1');
        dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');

        dmMProvider.cdsProdutos.Open;
        dmMProvider.cdsProdutos.ProviderName := '';

      end;

      dmDBEXMaster.fdqBarras.Close;

      if not dmMProvider.cdsProdutos.IsEmpty then
      begin

        RelacionarTabProdFilial(dmMProvider.cdsProdutosPRODUTO.Value, dmDBEXMaster.iIdFilial);
        RelacionarSubGrupo;

        edtConteudoPesquisa.Clear;
        grdTabela.SetFocus;

        HabilitaDesabilitarControlesBalanca(dmMProvider.cdsProdutoFilialENVIARPARABALANCA.Value);

      end
      else
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
        edtConteudoPesquisa.SetFocus;

      end;

    end;

  except
    on E: Exception do
    begin

      lblMsg.Caption := E.ClassName + ', ' + E.Message;
      edtConteudoPesquisa.SetFocus;

    end;

  end;

end;

procedure TfrmProdutos.edtConteudoPesquisaKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
var
  iDirecao: Integer;
begin

  // habilita movimenta��o dos campos com as setas acima/abaixo
  iDirecao := -1;

  case Key of

    VK_DOWN:iDirecao := 0; { Pr�ximo }
    VK_UP: iDirecao := 1; { Anterior }

  end;

  if key = 40 then
    Key := 0;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;

end;

procedure TfrmProdutos.edtConteudoPesquisaKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmProdutos.edtCSTChange(Sender: TObject);
begin

  if Length(Trim(edtCST.Text)) > 0 then
    btnMVA.Enabled := StrToInt(edtCST.Text) in [10, 60, 70];

end;

procedure TfrmProdutos.edtCSTExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if Length(Trim(dmMProvider.cdsProdutosCST.Value)) > 0 then
    begin

      dmMProvider.cdsCst.Close;
      dmMProvider.cdsCst.ProviderName := 'dspCst';

      dmDBEXMaster.fdqCST.SQL.Clear;
      dmDBEXMaster.fdqCST.SQL.Add('SELECT * FROM CST');
      dmDBEXMaster.fdqCST.SQL.Add('WHERE CST = ' + QuotedStr(FormatFloat('000', StrToFloat(dmMProvider.cdsProdutosCST.Value))));

      dmMProvider.cdsCst.Open;
      dmMProvider.cdsCst.ProviderName := '';

      if dmMProvider.cdsCst.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        edtCST.SetFocus;

      end
      else
        dmMProvider.cdsProdutosDESCRICAO_CST.Value :=  dmMProvider.cdsCstDESCRICAO.Value;


    end
    else
    begin

      lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtCST.SetFocus;

    end;

  end;

end;

procedure TfrmProdutos.edtCSTKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmProdutos.edtCustoBrutoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
  begin

    if (dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value > 0) and (dmMProvider.cdsProdutosUNIDADE_ATACADO.Value > 0) then
    begin

      dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value           := dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value / dmMProvider.cdsProdutosUNIDADE_ATACADO.Value;
      dmMProvider.cdsProdutoFilialCUSTOLIQUIDOANTERIOR.Value := dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.Value;
      dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.Value         := dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value;

      CalcularPrecoVenda;

    end;

  end;

end;

procedure TfrmProdutos.edtDescricaoChange(Sender: TObject);
begin

  pnlQtdLetrasDescricao.Caption := IntToStr(Length(edtDescricao.Text));

end;

procedure TfrmProdutos.edtDescricaoCupomChange(Sender: TObject);
begin

  pnlQtdLetrasCupom.Caption := IntToStr(Length(edtDescricaoCupom.Text));

end;

procedure TfrmProdutos.edtDescricaoCupomExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtDescricaoCupom.Text)) <= 0 then
  begin

    lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    edtDescricaoCupom.SetFocus;

  end
  else
    LimparMsgErro;

end;

procedure TfrmProdutos.edtDescricaoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
  begin

    if Length(Trim(dmMProvider.cdsProdutosDESCRICAO.Value)) > 0 then
    begin

      dmMProvider.cdsProdutoFilialDESCRICAOCUPOMFISCAL.Value   := dmMProvider.cdsProdutosDESCRICAO.Value;
      dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value      := dmMProvider.cdsProdutosDESCRICAO.Value;
      dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value      := dmMProvider.cdsProdutosDESCRICAO.Value;
      dmMProvider.cdsProdutoFilialDESCRICAOTIRATEIMA.Value     := dmMProvider.cdsProdutosDESCRICAO.Value;

      if dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value = '' then
        dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value := dmMProvider.cdsProdutosDESCRICAO.Value;

      LimparMsgErro;

    end
    else
    begin

      lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtDescricao.SetFocus;

    end;

  end;

end;

procedure TfrmProdutos.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (Key <> #8) and (Key <> '-') and (Key <> ' ') then
      if not(Key in ['0' .. '9', 'a' .. 'z', 'A' .. 'Z', #8, #13, '.', ',',
        '+', '/']) then
        abort;
  end;

end;

procedure TfrmProdutos.edtEanExit(Sender: TObject);
var
  sDigitoVerificador: string;
begin

  MudarCorEdit(Sender);

  edtEan.Text := SomenteNumeros(RetirarPonto(Trim(edtEan.Text)));

  if Length(Trim(edtEan.Text)) > 0 then
  begin

    if Length(edtEan.Text) <= 13 then
    begin

      sBarras := FormatFloat('0000000000000', StrToFloat(edtEan.Text));

      sDigitoVerificador := ValidarCodigoBarras(edtEan.Text);

      if ValidarBarras(sBarras) then
      begin

        LimparMsgErro;

        dmDBEXMaster.fdqBarras.Close;
        dmDBEXMaster.fdqBarras.SQL.Clear;
        dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
        dmDBEXMaster.fdqBarras.SQL.Add('where barras = ' + QuotedStr(sBarras));
        dmDBEXMaster.fdqBarras.Open;

        if not dmDBEXMaster.fdqBarras.IsEmpty then
        begin

          dmDBEXMaster.fdqPesqProdutos.Close;
          dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('select descricao from produto');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value));
          dmDBEXMaster.fdqPesqProdutos.Open;

          if not dmDBEXMaster.fdqPesqProdutos.IsEmpty then
          begin

            Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + #13 +
                  #13 + 'C�digo de barras j� cadastrado no produto: ' + #13 +
                  #13 + '     C�digo: ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value)
                  + #13 + #13 + 'Descri��o: ' + dmDBEXMaster.fdqPesqProdutos.FieldByName('DESCRICAO').AsString), 'Aten��o!', mb_IconInformation + mb_ok);

            edtEan.Clear;
            edtEan.SetFocus;

          end;

        end;

      end
      else
      begin

        if Length(Trim(edtEan.Text)) > 12 then
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_BARRAS_INVALIDO + ' / ' + edtEan.Text + ' * Correto: '
                            + Copy(edtEan.Text, 1, Length(edtEan.Text) - 1) + sDigitoVerificador
        else
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_BARRAS_INVALIDO + ' / ' + edtEan.Text + ' * Correto: '
                            + edtEan.Text + sDigitoVerificador;
        Application.ProcessMessages;

        edtEan.SetFocus;
        edtEan.SelectAll;

      end;
    end
    else if Length(edtEan.Text) = 14 then
    begin

      sBarras             := edtEan.Text;
      sDigitoVerificador  := ValidarCodigoBarras(edtEan.Text);

      if ValidaEAN(sBarras) then
      begin

        dmDBEXMaster.fdqBarras.Close;
        dmDBEXMaster.fdqBarras.SQL.Clear;
        dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
        dmDBEXMaster.fdqBarras.SQL.Add('where barras = ' + QuotedStr(sBarras));
        dmDBEXMaster.fdqBarras.Open;

        if not dmDBEXMaster.fdqBarras.IsEmpty then
        begin

          dmDBEXMaster.fdqPesqProdutos.Close;
          dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('select descricao from produto');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value));
          dmDBEXMaster.fdqPesqProdutos.Open;

          if not dmDBEXMaster.fdqPesqProdutos.IsEmpty then
          begin

            Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'C�digo de barras j� cadastrado no produto: '
                                    + #13 + #13 + '     C�digo: ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value)
                                    + #13 + #13 + 'Descri��o: ' + dmDBEXMaster.fdqPesqProdutos.FieldByName('DESCRICAO').AsString), 'Aten��o!', mb_IconInformation + mb_ok);

            edtEan.Clear;
            edtEan.SetFocus;

          end;

        end;
      end
      else
      begin

        if Length(edtEan.Text) > 12 then
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_BARRAS_INVALIDO + ' / ' + edtEan.Text + ' * Correto: '
                            + Copy(edtEan.Text, 1, Length(edtEan.Text) - 1) + sDigitoVerificador
        else
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_BARRAS_INVALIDO + ' / ' + edtEan.Text + ' * Correto: '
                            + edtEan.Text + sDigitoVerificador;
        Application.ProcessMessages;
        edtEan.SetFocus;
        edtEan.SelectAll;

      end;

    end;

  end;

  dmDBEXMaster.fdqPesqProdutos.Close;
  dmDBEXMaster.fdqbarras.Close;

end;

procedure TfrmProdutos.edtEanKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmProdutos.edtEanQtdEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

  edtEanQtd.Text := '1';

end;

procedure TfrmProdutos.edtEanQtdExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if (Length(Trim(sBarras)) > 0) then
  begin

    if dmMProvider.cdsProdutosPRODUTO.Value > 0 then
    begin

      if (edtEanQtd.Text <> '') then
      begin

        if StrToInt(edtEanQtd.Text) > 0 then
        begin

          dmDBEXMaster.fdqBarras.Close;
          dmDBEXMaster.fdqBarras.SQL.Clear;
          dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
          dmDBEXMaster.fdqBarras.SQL.Add('where barras = ' + QuotedStr(sBarras));
          dmDBEXMaster.fdqBarras.Open;

          if dmDBEXMaster.fdqBarras.IsEmpty then
          begin

            dmMProvider.cdsBarras.Append;
            dmMProvider.cdsBarrasPRODUTO.Value  := dmMProvider.cdsProdutosPRODUTO.Value;
            dmMProvider.cdsBarrasBARRAS.Value   := sBarras;

            if Length(Trim(sBarras)) < 8 then
              dmMProvider.cdsBarrasGERADO.Value := 1
            else
              dmMProvider.cdsBarrasGERADO.Value := 0;

            dmMProvider.cdsBarrasPESADO.Value     := 0;
            dmMProvider.cdsBarrasQUANTIDADE.Value := StrToInt(edtEanQtd.Text);
            dmMProvider.cdsBarras.Post;

            if Man_Tab_Barras(0,dmMProvider.cdsBarrasBARRAS.Value, dmMProvider.cdsBarrasBARRAS.Value,dmMProvider.cdsBarrasPRODUTO.Value) then
            begin

              edtEan.Clear;
              edtEanQtd.Clear;

            end;

          end
          else
          begin

            dmDBEXMaster.fdqPesqProdutos.Close;
            dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
            dmDBEXMaster.fdqPesqProdutos.SQL.Add('select descricao from produto');
            dmDBEXMaster.fdqPesqProdutos.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value));
            dmDBEXMaster.fdqPesqProdutos.Open;

            if not dmDBEXMaster.fdqPesqProdutos.IsEmpty then
            begin

              Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'C�digo de barras j� cadastrado no produto: ' + #13 + #13
                                      + '     C�digo: ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value) + #13 + #13 + 'Descri��o: '
                                      + dmDBEXMaster.fdqPesqProdutos.FieldByName('DESCRICAO').AsString) , 'Aten��o!', mb_IconInformation + mb_ok);
              edtEan.Clear;
              edtEan.SetFocus;

            end;

          end;

          Codifica(dmMProvider.cdsBarrasBARRAS.AsString);

          // Repassa Imagem para o Image
          imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect(0, 0, 500, 500));
          ptbEAN.Visible := False;

        end;

      end;

    end;

  end;
end;

procedure TfrmProdutos.edtFabricanteExit(Sender: TObject);
begin

{  MudarCorEdit(Sender);

  if dmMProvider.cdsProdutos.State in [dsEdit, dsInsert] then
  begin

    if dmMProvider.cdsProdutosFABRICANTE.Value > 0 then
    begin

      dmDBEXMaster.sqqFornecedor.Close;
      dmDBEXMaster.sqqFornecedor.SQL.Clear;
      dmDBEXMaster.sqqFornecedor.SQL.Add('SELECT * FROM FORNECEDOR');
      dmDBEXMaster.sqqFornecedor.SQL.Add('WHERE FORNECEDOR = ' + IntToStr
          (dmMProvider.cdsProdutosFABRICANTE.Value));
      dmDBEXMaster.sqqFornecedor.Open;

      if dmDBEXMaster.sqqFornecedor.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtFabricante.SetFocus;
        edtFabricante.SelectAll;

      end
      else
      begin

        LimparMsgErro;
        dmMProvider.cdsProdutosNOME_FABRICANTE.Value :=
          dmDBEXMaster.sqqFornecedor.FieldByName('RAZAOSOCIAL').Value;
        dmDBEXMaster.sqqFornecedor.Close;

      end;

    end;

  end;
}
end;

procedure TfrmProdutos.edtFabricanteKeyPress(Sender: TObject; var Key: Char);
begin

{  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaFornecedor := TfrmPesquisaFornecedor.Create(self);
    frmPesquisaFornecedor.edtNomeRSocial.ReadOnly := False;

    if Length(Trim(edtFabricante.Text)) = 0 then
      edtNome_Fabricante.Clear;

    if frmPesquisaFornecedor.ShowModal = mrOk then
    begin

      LimparMsgErro;
      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosNOME_FABRICANTE.Value :=
        dmMProvider.cdsFornecedor.FieldByName('RAZAOSOCIAL').Value;
      dmMProvider.cdsProdutosFABRICANTE.Value :=
        dmMProvider.cdsFornecedor.FieldByName('FORNECEDOR').Value;
      dmMProvider.cdsFornecedor.Close;

    end;

  end;
 }
end;

procedure TfrmProdutos.edtFornecedorEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtFornecedorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosFORNECEDOR.Value > 0 then
    begin

      dmMProvider.cdsFornecedor.Close;
      dmMProvider.cdsFornecedor.ProviderName := 'dspFornecedor';

      dmDBEXMaster.fdqFornecedor.SQL.Clear;
      dmDBEXMaster.fdqFornecedor.SQL.Add('SELECT * FROM FORNECEDOR');
      dmDBEXMaster.fdqFornecedor.SQL.Add('WHERE FORNECEDOR = ' + IntToStr(dmMProvider.cdsProdutosFORNECEDOR.Value));

      dmMProvider.cdsFornecedor.Open;
      dmMProvider.cdsFornecedor.ProviderName := '';

      if dmMProvider.cdsFornecedor.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtFornecedor.SetFocus;
        edtFornecedor.SelectAll;

      end
      else
      begin

        LimparMsgErro;
        dmMProvider.cdsProdutosNOME_FORNECEDOR.Value := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;

      end;

    end;

  end;

end;

procedure TfrmProdutos.edtFornecedorKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaFornecedor := TfrmPesquisaFornecedor.Create(self);
    frmPesquisaFornecedor.edtNomeRSocial.ReadOnly := False;

    if Length(Trim(edtFornecedor.Text)) = 0 then
      edtNome_Fornecedor.Clear;

    if frmPesquisaFornecedor.ShowModal = mrOk then
    begin

      LimparMsgErro;
      dmMProvider.cdsProdutos.Edit;
//      dmMProvider.cdsProdutosNOME_FORNECEDOR.Value  := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;
      dmMProvider.cdsProdutosFORNECEDOR.Value       := dmMProvider.cdsFornecedorFORNECEDOR.Value;

    end;

    FreeAndNil(frmPesquisaFornecedor);

  end;

end;

procedure TfrmProdutos.edtGrupoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosGRUPO.Value > 0 then
    begin

      dmMProvider.cdsGrupo.Close;
      dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';

      dmDBEXMaster.fdqGrupo.SQL.Clear;
      dmDBEXMaster.fdqGrupo.SQL.Add('SELECT * FROM GRUPO');
      dmDBEXMaster.fdqGrupo.SQL.Add('WHERE GRUPO = ' + IntToStr(dmMProvider.cdsProdutosGRUPO.Value));

      dmMProvider.cdsGrupo.Open;
      dmMProvider.cdsGrupo.ProviderName := '';

      if dmMProvider.cdsGrupo.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtGrupo.SetFocus;
        edtGrupo.SelectAll;

      end
      else
      begin

        LimparMsgErro;
        dmMProvider.cdsProdutosNOME_GRUPO.Value :=  dmMProvider.cdsGrupoNOME.Value;

        PreencherInfomacoesGenericasGrupo;

      end;

    end;

  end;

end;

procedure TfrmProdutos.edtGrupoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaGrupo := TfrmPesquisaGrupo.Create(self);

    if Length(Trim(edtGrupo.Text)) = 0 then
      edtNome_Grupo.Clear;

    if frmPesquisaGrupo.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosNOME_GRUPO.Value := dmMProvider.cdsGrupoNOME.Value;
      dmMProvider.cdsProdutosGRUPO.Value      := dmMProvider.cdsGrupoGRUPO.Value;

      PreencherInfomacoesGenericasGrupo;

    end;

    FreeAndNil(frmPesquisaGrupo);

  end;

end;

procedure TfrmProdutos.edtInfoNutricionalExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosINFNUTRICIONAL.Value > 0 then
    begin

      dmMProvider.cdsInfoNutricional.Close;
      dmMProvider.cdsInfoNutricional.ProviderName := 'dspInfoNutricional';

      dmDBEXMaster.fdqInfoNutricional.SQL.Clear;
      dmDBEXMaster.fdqInfoNutricional.SQL.Add('SELECT * FROM INFORMACAONUTRICIONAL');
      dmDBEXMaster.fdqInfoNutricional.SQL.Add('WHERE INFNUTRICIONAL = ' + IntToStr(dmMProvider.cdsProdutosINFNUTRICIONAL.Value));

      dmMProvider.cdsInfoNutricional.Open;
      dmMProvider.cdsInfoNutricional.ProviderName := 'dspInfoNutricional';

      if dmMProvider.cdsInfoNutricional.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtInfoNutricional.SetFocus;
        edtInfoNutricional.SelectAll;

      end
      else
        LimparMsgErro;

    end;

  end;

end;

procedure TfrmProdutos.edtInfoNutricionalKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaInfoNutricional := TfrmPesquisaInfoNutricional.Create(self);

    if Length(Trim(edtInfoNutricional.Text)) = 0 then
      edtDescricao_info_Nutricional.Clear;

    if frmPesquisaInfoNutricional.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosINFNUTRICIONAL.Value             := dmMProvider.cdsInfoNutricionalINFNUTRICIONAL.Value;

    end;

    FreeAndNil(frmPesquisaInfoNutricional);

  end;

end;

procedure TfrmProdutos.edtNCM_TIPIExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if grpFiscal.Enabled then
  begin

    if Length(Trim(dmMProvider.cdsProdutosNCM.Value)) <= 0 then
    begin

      lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtNCM_TIPI.SetFocus;

    end
    else if Length(Trim(dmMProvider.cdsProdutosNCM.Value)) <> 8 then
    begin

      lblMsg.Caption := MSG_TAMANHO_MINIMO;
      Application.ProcessMessages;
      edtNCM_TIPI.SetFocus;

    end
    else
    begin

      dmMProvider.cdsNcmNbs.Close;
      dmMProvider.cdsNcmNbs.ProviderName := 'dspNcmNbs';

      dmDBEXMaster.fdqNcmNbs.Close;
      dmDBEXMaster.fdqNcmNbs.SQL.Clear;
      dmDBEXMaster.fdqNcmNbs.SQL.Add('SELECT * FROM NBM_NCM');
      dmDBEXMaster.fdqNcmNbs.SQL.Add('WHERE COD_NCM = ' + QuotedStr(edtNCM_TIPI.Text));

      if dmMProvider.cdsProdutosCF_IPI.Value > 0 then
        dmDBEXMaster.fdqNcmNbs.SQL.Add(' AND EX_TIPI = ' + QuotedStr(FormatFloat('00', dmMProvider.cdsProdutosCF_IPI.Value)));

      dmMProvider.cdsNcmNbs.Open;
      dmMProvider.cdsNcmNbs.ProviderName := '';

      if dmMProvider.cdsNcmNbs.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        edtNCM_TIPI.SetFocus;

      end
      else
      begin

        LimparMsgErro;
        Application.MessageBox(pchar('Descri��o NCM' + #13 + #13 + dmMProvider.cdsNcmNbsNOME_NCM.AsString),'Inroma��o!', mb_IconInformation + mb_ok);

        {if dmMProvider.cdsProdutosCF_IPI.Value > 0 then
        begin

          dmMProvider.cdsProdutosALIQ_MED_NAC.Value := dmDBEXMaster.sqqNBM_NCM.FieldByName('ALIQ_EX_NAC_TIPI').AsCurrency;
          dmMProvider.cdsProdutosALIQ_MED_IMP.Value := dmDBEXMaster.sqqNBM_NCM.FieldByName('ALIQ_EX_IMP_TIPI').AsCurrency;

        end
        else
        begin

          dmMProvider.cdsProdutosALIQ_MED_NAC.Value := dmDBEXMaster.sqqNBM_NCM.FieldByName('ALIQUOTA_NACIONAL').AsCurrency;
          dmMProvider.cdsProdutosALIQ_MED_IMP.Value := dmDBEXMaster.sqqNBM_NCM.FieldByName('ALIQUOTA_IMPORTACAO').AsCurrency;

        end;
        }
        if Length(Trim(dmMProvider.cdsProdutosCEST.AsString)) <= 0 then
          dmMProvider.cdsProdutosCEST.Value := dmMProvider.cdsNcmNbsTABELA_CEST.AsString;

      end;

    end;
  end;

end;

procedure TfrmProdutos.edtNCM_TIPIKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;
end;

procedure TfrmProdutos.edtPercentualDescontoEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtPercentualDescontoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtPISExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
    dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.Value := dmMProvider.cdsProdutosALIQUOTA_PIS.Value + dmMProvider.cdsProdutosALIQUOTA_COFINS.Value;

end;

procedure TfrmProdutos.edtPIS_EntradaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtPrecoVendaEnter(Sender: TObject);
begin

  cPrecoVendaAnterior := dmMProvider.cdsProdutoFilialPRECODEVENDA.Value;

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtPrecoVendaExit(Sender: TObject);
var
  cDiferenca, cBase, cFator, cCustoLiquido, cCalculado: Currency;
begin

  MudarCorEdit(Sender);

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
  begin

    if Length(Trim(edtPrecoVenda.Text)) > 0 then
    begin

      LimparMsgErro;

      case dmMProvider.cdsFilialREGIME_TRIBUTARIO.AsInteger of
        0:begin

            if dmMProvider.cdsProdutoFilialPRECODEVENDA.Value > 0 then

              cDiferenca := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency - cPrecoCalculado

            else

              cDiferenca := cPrecoCalculado - dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;

            // verifica se o preco calculad foi alterado
            if cDiferenca > 0.0001 then
            begin

              // caso tenha sido alterado calcular %Lucro
              cCustoLiquido := dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency;
              cCalculado    := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;
              cFator        := (cCalculado - cCustoLiquido);

              if cCustoLiquido > 0 then
                cBase := (cFator / cCustoLiquido) * 100
              else
                cBase := 0;

              // aplica nova margem
              dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency := cBase;

              // recalcula preco de venda
              CalcularPrecoVenda;

            end;

          end;
     1, 2:begin

            if dmMProvider.cdsProdutoFilialPRECODEVENDA.Value > 0 then

              cDiferenca := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency - cPrecoCalculado

            else

              cDiferenca := cPrecoCalculado - dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;

            // verifica se o preco calculad foi alterado
            if cDiferenca > 0.0001 then
            begin

              // caso tenha sido alterado calcular %Lucro
              cCustoLiquido := dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency;
              cCalculado    := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;
              cFator        := (cCustoLiquido / cCalculado);

              cBase         := dmMProvider.cdsProdutoFilialICMSAPAGAR.AsCurrency + dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.AsCurrency
                              + +dmMProvider.cdsProdutoFilialCOMISSAOVENDA.AsCurrency + dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.AsCurrency;

              // aplica nova margem
              dmMProvider.cdsProdutoFilialLUCROLIQUIDO.AsCurrency := 100 - (cFator * 100) - cBase;

              // recalcula preco de venda
              CalcularPrecoVenda;

            end;

          end;

      end;

    end
    else
    begin

      lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtPrecoVenda.SetFocus;

    end;

    dmMProvider.cdsProdutos.Edit;

  end;

end;

procedure TfrmProdutos.edtProdutoOriginadorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosPRODUTO_ORIGEM.Value > 0 then
    begin

      dmDBEXMaster.fdqPesqProdutos.Close;
      dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT DESCRICAO FROM PRODUTO');
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO_ORIGEM.Value));
      dmDBEXMaster.fdqPesqProdutos.Open;

      if dmDBEXMaster.fdqPesqProdutos.IsEmpty then
      begin

        lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
        Application.ProcessMessages;
        edtProdutoOriginador.SetFocus;

      end
      else
      begin

        LimparMsgErro;
        dmDBEXMaster.fdqPesqProdutos.Close;

      end;

    end
    else
      LimparMsgErro;

  end;

end;

procedure TfrmProdutos.edtProdutoOriginadorKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaProduto := TfrmPesquisaProduto.Create(self);

    if frmPesquisaProduto.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosPRODUTO_ORIGEM.Value := dmMProvider.cdsPesqProdutosPRODUTO.Value;

    end;

    FreeAndNil(frmPesquisaProduto);

  end;

end;

procedure TfrmProdutos.edtP_DescontoCompraExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if (InserindoEditando(dmMProvider.cdsProdutos)) or (InserindoEditando(dmMProvider.cdsProdutoFilial)) then
  begin

    if (dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value > 0) and(dmMProvider.cdsProdutosUNIDADE_ATACADO.Value > 0) then
    begin

      dmMProvider.cdsProdutoFilialCUSTOLIQUIDOANTERIOR.Value := dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.Value;
      dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.Value         := dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value;

      CalcularPrecoVenda;

    end;

  end;

end;

procedure TfrmProdutos.edtQuantidadeEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtQuantidadeExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtRed_BCExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtSecaoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosSECAO.Value > 0 then
    begin

      dmMProvider.cdsSecao.Close;
      dmMProvider.cdsSecao.ProviderName := 'dspSecao';

      dmDBEXMaster.fdqSecao.Close;
      dmDBEXMaster.fdqSecao.SQL.Clear;
      dmDBEXMaster.fdqSecao.SQL.Add('SELECT * FROM SECAO');
      dmDBEXMaster.fdqSecao.SQL.Add('WHERE SECAO = ' + IntToStr(dmMProvider.cdsProdutosSECAO.Value));

      dmMProvider.cdsSecao.Open;
      dmMProvider.cdsSecao.ProviderName := '';

      if dmMProvider.cdsSecao.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtSecao.SetFocus;
        edtSecao.SelectAll;

      end
      else
      begin

        LimparMsgErro;
        PreencherInfomacoesGenericasSecao;

      end;

    end;

  end;

end;

procedure TfrmProdutos.edtSecaoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaSecao := TfrmPesquisaSecao.Create(self);

    if Length(Trim(edtSecao.Text)) = 0 then
      edtNome_Secao.Clear;

    if frmPesquisaSecao.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosSECAO.Value := dmMProvider.cdsSecaoSECAO.Value;
      PreencherInfomacoesGenericasSecao;

    end;

    FreeAndNil(frmPesquisaSecao);

  end;

end;

procedure TfrmProdutos.edtSetordeBalancaChange(Sender: TObject);
begin

  imgIngredientes.Visible := (dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value > 0);

end;

procedure TfrmProdutos.edtSetordeBalancaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value > 0 then
    begin

      dmMProvider.cdsSetorBalanca.Close;
      dmMProvider.cdsSetorBalanca.ProviderName := 'dspSetorBalanca';

      dmDBEXMaster.fdqSetorBalanca.SQL.Clear;
      dmDBEXMaster.fdqSetorBalanca.SQL.Add('SELECT * FROM SETORDEBALANCA');
      dmDBEXMaster.fdqSetorBalanca.SQL.Add('WHERE SETOR = ' + IntToStr(dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value));

      dmMProvider.cdsSetorBalanca.Open;
      dmMProvider.cdsSetorBalanca.ProviderName := '';

      if dmMProvider.cdsSetorBalanca.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtSetordeBalanca.SetFocus;
        edtSetordeBalanca.SelectAll;

      end
      else
        LimparMsgErro;

    end;

  end;

end;

procedure TfrmProdutos.edtSetordeBalancaKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaSetorBalanca := TfrmPesquisaSetorBalanca.Create(self);

    if Length(Trim(edtSetordeBalanca.Text)) = 0 then
      edtNome_SetordeBalanca.Clear;

    if frmPesquisaSetorBalanca.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value := dmMProvider.cdsSetorBalancaSETOR.Value;

    end;

    FreeAndNil(frmPesquisaSetorBalanca);

  end;

end;

procedure TfrmProdutos.edtSubGrupoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosSUBGRUPO.Value > 0 then
    begin

      dmMProvider.cdsSubGrupo.Close;
      dmMProvider.cdsSubGrupo.ProviderName := 'dspSubGrupo';

      dmDBEXMaster.fdqSubGrupo.SQL.Clear;
      dmDBEXMaster.fdqSubGrupo.SQL.Add('SELECT * FROM SUBGRUPO');
      dmDBEXMaster.fdqSubGrupo.SQL.Add('WHERE SUBGRUPO = ' + IntToStr(dmMProvider.cdsProdutosSUBGRUPO.Value));
      dmDBEXMaster.fdqSubGrupo.SQL.Add('AND GRUPO = ' + IntToStr(dmMProvider.cdsProdutosGRUPO.Value));

      dmMProvider.cdsSubGrupo.Open;
      dmMProvider.cdsSubGrupo.ProviderName := '';

      if dmMProvider.cdsSubGrupo.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtSubGrupo.SetFocus;
        edtSubGrupo.SelectAll;

      end
      else
      begin

        LimparMsgErro;
        PreencherInfomacoesGenericasSubGrupo;

      end;

    end;

  end;

end;

procedure TfrmProdutos.edtSubGrupoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaSubGrupo     := TfrmPesquisaSubGrupo.Create(self);
    frmPesquisaSubGrupo.Tag := dmMProvider.cdsProdutosGRUPO.Value;

    if Length(Trim(edtSubGrupo.Text)) = 0 then
      edtNome_SubGrupo.Clear;

    if frmPesquisaSubGrupo.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosSUBGRUPO.Value := dmMProvider.cdsSubGrupoSUBGRUPO.Value;
      PreencherInfomacoesGenericasSubGrupo;

    end;

    FreeAndNil(frmPesquisaSubGrupo);

  end;

end;

procedure TfrmProdutos.edtTipoItemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if Trim(dmMProvider.cdsProdutosTIPO_ITEM.AsString) <> '' then
    begin

      dmMProvider.cdsTipoItem.Close;
      dmMProvider.cdsTipoItem.ProviderName := 'dspTipoItem';

      dmDBEXMaster.fdqTipoItem.SQL.Clear;
      dmDBEXMaster.fdqTipoItem.SQL.Add('SELECT * FROM TIPO_DO_ITEM');
      dmDBEXMaster.fdqTipoItem.SQL.Add('WHERE CODIGO = ' + IntToStr(dmMProvider.cdsProdutosTIPO_ITEM.Value));

      dmMProvider.cdsTipoItem.Open;
      dmMProvider.cdsTipoItem.ProviderName := '';

      if dmMProvider.cdsTipoItem.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtTipoItem.SetFocus;
        edtTipoItem.SelectAll;

      end
      else
        LimparMsgErro;

    end
    else
    begin

      lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtTipoItem.SetFocus;

    end;

  end;

end;

procedure TfrmProdutos.edtTipoItemKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaTipoItem := TfrmPesquisaTipoItem.Create(self);
    if frmPesquisaTipoItem.ShowModal = mrOk then
    begin

      LimparMsgErro;
      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosTIPO_ITEM.Value := dmMProvider.cdsTipoItemCODIGO.Value;

    end;

    FreeAndNil(frmPesquisaTipoItem);

  end;

end;

procedure TfrmProdutos.edtTributacaoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProdutos) then
  begin

    if dmMProvider.cdsProdutosTRIBUTACAO.Value > 0 then
    begin

      dmMProvider.cdsTributacao.Close;
      dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

      dmDBEXMaster.fdqTributacao.SQL.Clear;
      dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
      dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.cdsProdutosTRIBUTACAO.Value));

      dmMProvider.cdsTributacao.Open;
      dmMProvider.cdsTributacao.ProviderName := '';

      if dmMProvider.cdsTributacao.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtTributacao.SetFocus;
        edtTributacao.SelectAll;

      end
      else
      begin

        LimparMsgErro;
        dmMProvider.cdsProdutoFilialICMSAPAGAR.AsCurrency := dmMProvider.cdsTributacaoALIQUOTA.Value;

      end;

    end
    else
    begin

      lblMsg.Caption := MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtTributacao.SetFocus;

    end

  end;

end;

procedure TfrmProdutos.edtTributacaoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'C' then
  begin

    frmPesquisaTributacao := TfrmPesquisaTributacao.Create(self);

    if Length(Trim(edtTributacao.Text)) = 0 then
      edtNome_Tributacao.Clear;

    if frmPesquisaTributacao.ShowModal = mrOk then
    begin

      LimparMsgErro;

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutosTRIBUTACAO.Value := dmMProvider.cdsTributacaoTRIBUTACAO.Value;

    end;

    FreeAndNil(frmPesquisaTributacao);

  end;

end;

procedure TfrmProdutos.edtUnidadeAtacadoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtUnidadeEmbalagemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtUnidadeEmbalagemKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmProdutos.edtValorUnitarioEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmProdutos.edtValorUnitarioExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  LimparMsgErro;

  if dmMProvider.cdsPrecoQuantidadePRECO_UNITARIO.Value > dmMProvider.cdsProdutoFilialPRECODEVENDA.Value then
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VLR_UNIT_PQ_MAIOR;

  Application.ProcessMessages;

end;

procedure TfrmProdutos.EmitirEtiquetaGondolaParalela;
var
  txtArqimp: textfile;
  i: Integer;
  sPreco, sBarras: string;
  vTotal_Tributos, cValor_ICMS, cValor_IPI, cValor_PIS, cValor_COFINS, cValor_ISS, cValor_IOF, cValor_CIDE: Currency;
  bProduto_importado: boolean;
begin

  vTotal_Tributos     := 0;
  vP_Tributos         := 0;
  bProduto_importado  := Copy(dmMProvider.cdsProdutosCST.Value, 1, 1) <> '0';

  { vP_Tributos := dmMProvider.cdsProdutos.FieldByName('P_IPI').Value
    + dmMProvider.cdsProdutos.FieldByName('P_ICMS_PAGAR').Value
    + dmMProvider.cdsProdutos.FieldByName('ALIQUOTA_PIS').Value
    + dmMProvider.cdsProdutos.FieldByName('ALIQUOTA_COFINS').Value
    + dmMProvider.cdsProdutos.FieldByName('PERCENTUAL_IOF').Value
    + dmMProvider.cdsProdutos.FieldByName('PERCENTUAL_ISSQN').Value
    + dmMProvider.cdsProdutos.FieldByName('PERCENTUAL_CIDE').Value;
  }
  AssignFile(txtArqimp, ExtractFilePath(Application.ExeName) + 'Etq.txt');
  ReWrite(txtArqimp);

  if (dmMProvider.cdsConfig_iniMARCA_MODELO_IMP_TERMICA.Value = 0) or (dmMProvider.cdsConfig_iniMARCA_MODELO_IMP_TERMICA.Value = 1) then
  begin

    case dmMProvider.cdsConfig_iniMODELO_ETQ_GONDOLA.Value of
      0:begin

          case dmMProvider.cdsProdutosPROMOCAO.Value of
            0:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
            1:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
          end;

          Writeln(txtArqimp, #02 + 'L' + #13);
          Writeln(txtArqimp, #02 + 'm' + #13);
          Writeln(txtArqimp, #02 + 'e' + #13);
          Writeln(txtArqimp, 'PC' + #13);
          Writeln(txtArqimp, 'D11' + #13);
          Writeln(txtArqimp, 'H15' + #13);
          Writeln(txtArqimp, #02 + 'f320' + #13);
          Writeln(txtArqimp, 'z' + #13);

          sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

          if dmMProvider.cdsBarrasQUANTIDADE.Value > 1 then
          begin

            Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);

            if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
            begin

              sBarras := dmMProvider.cdsBarrasBARRAS.AsString;
              sPreco  := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

            end;

          end
          else
          begin

            if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
            begin

              if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
              begin

                if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario +  ', deseja utilizar pre�o de atacado?'), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
                begin

                  sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                  Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);
                  sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

                end
                else
                begin

                  Writeln(txtArqimp,'131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                  Writeln(txtArqimp,'121100001600090' + dmMProvider.cdsProdutosUND_ATACADO.Value + ' C/' + FloatToStr(dmMProvider.cdsProdutosUNIDADE_ATACADO.Value) + ' - R$ ' + FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency) + #13);

                end;

              end
              else
              begin

                sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                Writeln(txtArqimp, '121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

              end;

            end

            else
            begin

              Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
              Writeln(txtArqimp, '121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

            end;

          end;

          Writeln(txtArqimp, '211100001500050' + DateToStr(Date) + #13);
          Writeln(txtArqimp, '211100001500080' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + #13);

          if Length(sBarras) > 13 then
            Writeln(txtArqimp, '1D0000000300110' + sBarras + #13)
          else
            Writeln(txtArqimp, '1F1208000300110' + dmMProvider.cdsBarrasBARRAS.Value + #13);

          Writeln(txtArqimp, '141100000200400' + 'R$' + #13);
          Writeln(txtArqimp, '161100000200500' + sPreco + #13);
          Writeln(txtArqimp, 'Q' + FormatFloat('0000', 1) + #13);
          Writeln(txtArqimp, #02 + 'E' + #13);

        end;

      1:begin

          case dmMProvider.cdsProdutosPROMOCAO.Value of
            0:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
            1:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
          end;

          Writeln(txtArqimp, #02 + 'L' + #13);
          Writeln(txtArqimp, #02 + 'm' + #13);
          Writeln(txtArqimp, #02 + 'e' + #13);
          Writeln(txtArqimp, 'PC' + #13);
          Writeln(txtArqimp, 'D11' + #13);
          Writeln(txtArqimp, 'H15' + #13);
          Writeln(txtArqimp, #02 + 'f320' + #13);
          Writeln(txtArqimp, 'z' + #13);

          sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

          if dmMProvider.cdsBarrasQUANTIDADE.Value > 1 then
          begin

            Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);

            if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
            begin

              sBarras := dmMProvider.cdsBarrasBARRAS.AsString;
              sPreco  := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency)

            end;

          end
          else
          begin

            if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
            begin

              if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
              begin

                if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', deseja utilizar pre�o de atacado?'), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
                begin

                  sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                  Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);
                  sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency)

                end
                else
                begin

                  Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                  Writeln(txtArqimp, '121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

                end;

              end
              else
              begin

                sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                Writeln(txtArqimp, '121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

              end;

            end
            else
            begin

              Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
              Writeln(txtArqimp, '121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

            end;

          end;

          Writeln(txtArqimp, '211100001500050' + DateToStr(Date) + #13);
          Writeln(txtArqimp, '211100001500080' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + #13);

          if Length(sBarras) > 13 then
            Writeln(txtArqimp, '1D0000000300110' + sBarras + #13)
          else
            Writeln(txtArqimp, '1F1208000300110' + sBarras + #13);

          Writeln(txtArqimp, '161100000200480' + 'R$' + #13);
          Writeln(txtArqimp, '161200000200600' + sPreco + #13);
          Writeln(txtArqimp, 'Q' + FormatFloat('0000', 1) + #13);
          Writeln(txtArqimp, #02 + 'E' + #13);

        end;
      2:begin

          case dmMProvider.cdsProdutosPROMOCAO.Value of
            0:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
            1:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECOPROMOCAO.AsCurrency);
          end;

          Writeln(txtArqimp, #02 + 'L' + #13);
          Writeln(txtArqimp, #02 + 'm' + #13);
          Writeln(txtArqimp, #02 + 'e' + #13);
          Writeln(txtArqimp, 'PC' + #13);
          Writeln(txtArqimp, 'D11' + #13);
          Writeln(txtArqimp, 'H15' + #13);
          Writeln(txtArqimp, #02 + 'f320' + #13);
          Writeln(txtArqimp, 'z' + #13);

          sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

          if dmMProvider.cdsBarrasQUANTIDADE.Value > 1 then
          begin

            Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);

            if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
            begin

              sBarras := dmMProvider.cdsBarrasBARRAS.AsString;
              sPreco  := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

            end;

          end
          else
          begin

            if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
            begin

              if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
              begin

                if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', deseja utilizar pre�o de atacado?'), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
                begin

                  sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                  Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);
                  sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

                end
                else
                begin

                  Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                  Writeln(txtArqimp,'121100001600090' + dmMProvider.cdsProdutosUND_ATACADO.Value + ' C/' + FloatToStr(dmMProvider.cdsProdutosUNIDADE_ATACADO.Value) + ' - R$ ' + FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency) + #13);

                end;

              end
              else
              begin

                sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                Writeln(txtArqimp, '111200001600090' + 'VAL APROX. TRIBUTOS ' + 'R$ ' + FormatFloat('##,##0.00', vTotal_Tributos) + ' (' + FormatFloat('#0.00', vP_Tributos) + '%) FONTE: IBPT' + #13);

              end;

            end

            else
            begin

              Writeln(txtArqimp, '131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
              Writeln(txtArqimp, '111200001600090' + 'VAL APROX. TRIBUTOS ' + 'R$ ' + FormatFloat('##,##0.00', vTotal_Tributos) + ' (' + FormatFloat('#0.00', vP_Tributos) + '%) FONTE: IBPT' + #13);

            end;

          end;

          Writeln(txtArqimp, '211100001500050' + DateToStr(Date) + #13);
          Writeln(txtArqimp, '211100001500080' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + #13);

          if Length(sBarras) > 13 then
            Writeln(txtArqimp, '1D0000000300110' + sBarras + #13)
          else
            Writeln(txtArqimp, '1F1208000300110' + dmMProvider.cdsBarrasBARRAS.Value + #13);

          Writeln(txtArqimp, '141100000200400' + 'R$' + #13);
          Writeln(txtArqimp, '161100000200500' + sPreco + #13);
          Writeln(txtArqimp, 'Q' + FormatFloat('0000', 1) + #13);
          Writeln(txtArqimp, #02 + 'E' + #13);

        end;
      3:begin

          case dmMProvider.cdsProdutosPROMOCAO.Value of
            0:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
            1:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
          end;

          Writeln(txtArqimp, #02 + 'L' + #13);
          Writeln(txtArqimp, #02 + 'm' + #13);
          Writeln(txtArqimp, #02 + 'e' + #13);
          Writeln(txtArqimp, 'PC' + #13);
          Writeln(txtArqimp, 'D11' + #13);
          Writeln(txtArqimp, 'H15' + #13);
          Writeln(txtArqimp, #02 + 'f320' + #13);
          Writeln(txtArqimp, 'z' + #13);

          sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

          if dmMProvider.cdsBarrasQUANTIDADE.Value > 1 then
          begin

            Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);

            if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
            begin

              sBarras := dmMProvider.cdsBarrasBARRAS.AsString;
              sPreco  := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

            end;

          end
          else
          begin

            if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
            begin

              if dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency > 0 then
              begin

                if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', deseja utilizar pre�o de atacado?'), 'Aten��o!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
                begin

                  sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                  Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);
                  sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

                end
                else
                begin

                  Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                  Writeln(txtArqimp, '121100001600090' + 'VAL APROX. TRIBUTOS ' + 'R$ ' + FormatFloat('##,##0.00', vTotal_Tributos) + ' (' + FormatFloat('#0.00', vP_Tributos) + '%) FONTE: IBPT' + #13);

                end;

              end
              else
              begin

                sBarras := dmMProvider.cdsBarrasBARRAS.AsString;

                Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
                Writeln(txtArqimp, '121100001600090' + 'VAL APROX. TRIBUTOS ' + 'R$ ' + FormatFloat('##,##0.00', vTotal_Tributos) + ' (' + FormatFloat('#0.00', vP_Tributos) + '%) FONTE: IBPT' + #13);

              end;

            end
            else
            begin

              Writeln(txtArqimp, '151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + #13);
              Writeln(txtArqimp, '121100001600090' + 'VAL APROX. TRIBUTOS ' + 'R$ ' + FormatFloat('##,##0.00', vTotal_Tributos) + ' (' + FormatFloat('#0.00', vP_Tributos) + '%) FONTE: IBPT' + #13);

            end;

          end;

          Writeln(txtArqimp, '211100001500050' + DateToStr(Date) + #13);
          Writeln(txtArqimp, '211100001500080' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + #13);

          if Length(sBarras) > 13 then
            Writeln(txtArqimp, '1D0000000300110' + sBarras + #13)
          else
            Writeln(txtArqimp, '1F1208000300110' + sBarras + #13);

          Writeln(txtArqimp, '161100000200480' + 'R$' + #13);
          Writeln(txtArqimp, '161100000200600' + sPreco + #13);
          Writeln(txtArqimp, 'Q' + FormatFloat('0000', 1) + #13);
          Writeln(txtArqimp, #02 + 'E' + #13);

        end;

    end;

  end
  else if dmMProvider.cdsConfig_iniMARCA_MODELO_IMP_TERMICA.Value = 3 then
  begin

    Writeln(txtArqimp, '^XA'); // inicio
    Writeln(txtArqimp, '^PRD'); // 6 inches p/s
    Writeln(txtArqimp, '^MMR'); // modo imprissao  mmr
    Writeln(txtArqimp, '^PQ1,,,N');

    if dmMProvider.cdsProdutosPROMOCAO.Value = 1 then
    begin

      Writeln(txtArqimp, '^FO0,15^GB800,68,68,B^FS');
      Writeln(txtArqimp, '^FO10,30^ARN,70,62^FR^FD' + dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value + '^FS');

    end
    else
      Writeln(txtArqimp, '^FO10,30^ASN,90,12^FD' + dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value + '^FS');

    Writeln(txtArqimp,'^FO05,90^ARN,10,12^FD' + dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value + '^FS');
    Writeln(txtArqimp, '^FO05,145^APR,10,01^FD' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + '^FS');
    Writeln(txtArqimp, '^FO30,145^APR,20,01^FD' + DateToStr(Date) + '^FS');

    case dmMProvider.cdsProdutosPROMOCAO.Value of
      0: sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
      1: sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
    end;

    Writeln(txtArqimp, '^FO355,160^ATN,40,60^FDR$^FS^FO450,90^AVN,150,142^FD' + sPreco + '^FS');
    Writeln(txtArqimp, '^FO80,140,^BY2^BEN,60,Y,N^FD' + dmMProvider.cdsBarrasBARRAS.Value + '^FS');
    Writeln(txtArqimp, '^XZ');

  end;

  CloseFile(txtArqimp);
  CopyFile(pchar(ExtractFilePath(Application.ExeName) + 'Etq.txt'), pchar (dmMProvider.cdsConfig_iniPORTA_IMP_TERMICA.Value), true);

end;

procedure TfrmProdutos.EmitirEtiquetaGondolaSerial;
var
  iQtd, i: Integer;
  sCodigo, sPreco: string;
begin

  comImpressoraTermica.Open;

  case dmMProvider.cdsConfig_iniMARCA_MODELO_IMP_TERMICA.Value of
    0,1:begin

          case dmMProvider.cdsConfig_iniMODELO_ETQ_GONDOLA.Value of
            0:begin

                case dmMProvider.cdsProdutosPROMOCAO.Value of
                  0:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
                  1:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECOPROMOCAO.AsCurrency);
                end;

                comImpressoraTermica.WriteStr(#02 + 'L' + #13);
                comImpressoraTermica.WriteStr(#02 + 'm' + #13);
                comImpressoraTermica.WriteStr(#02 + 'e' + #13);
                comImpressoraTermica.WriteStr('PC' + #13);
                comImpressoraTermica.WriteStr('D11' + #13);
                comImpressoraTermica.WriteStr('H14' + #13);
                comImpressoraTermica.WriteStr('z' + #13);

                if dmMProvider.cdsBarrasQUANTIDADE.Value > 1 then
                begin

                  comImpressoraTermica.WriteStr('151100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);
                  sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

                end
                else
                begin

                  comImpressoraTermica.WriteStr('121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);
                  comImpressoraTermica.WriteStr('121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

                end;

                comImpressoraTermica.WriteStr('211100001300050' + DateToStr(Date) + #13);
                comImpressoraTermica.WriteStr('211100001300080' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + #13);
                comImpressoraTermica.WriteStr('1F2210000250110' + dmMProvider.cdsBarrasBARRAS.Value + #13);
                comImpressoraTermica.WriteStr('161100000200480' + 'R$' + #13);
                comImpressoraTermica.WriteStr('161200000200600' + sPreco + #13);
                comImpressoraTermica.WriteStr('Q' + FormatFloat('0000', 1) + #13);
                comImpressoraTermica.WriteStr(#02 + 'E' + #13);

              end;
            1:begin

                case dmMProvider.cdsProdutosPROMOCAO.Value of
                  0:sPreco := FormatFloat('#,###,##0.00',dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
                  1:sPreco := FormatFloat('#,###,##0.00',dmMProvider.cdsProdutoFilialPRECOPROMOCAO.AsCurrency);
                end;

                comImpressoraTermica.WriteStr(#02 + 'L' + #13);
                comImpressoraTermica.WriteStr(#02 + 'm' + #13);
                comImpressoraTermica.WriteStr(#02 + 'e' + #13);
                comImpressoraTermica.WriteStr('PC' + #13);
                comImpressoraTermica.WriteStr('D11' + #13);
                comImpressoraTermica.WriteStr('H14' + #13);
                comImpressoraTermica.WriteStr(#02 + 'f320' + #13);
                comImpressoraTermica.WriteStr('z' + #13);

                if dmMProvider.cdsBarrasQUANTIDADE.Value > 1 then
                begin

                  comImpressoraTermica.WriteStr('131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.Value) + #13);
                  sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency);

                end
                else
                begin

                  comImpressoraTermica.WriteStr('131100002000090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);
                  comImpressoraTermica.WriteStr('121100001600090' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value) + #13);

                end;

                comImpressoraTermica.WriteStr('211100001300050' + DateToStr(Date)+ #13);
                comImpressoraTermica.WriteStr('211100001300080' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + #13);
                comImpressoraTermica.WriteStr('1F1208000300110' + dmMProvider.cdsBarrasBARRAS.Value + #13);
                comImpressoraTermica.WriteStr('141100000200400' + 'R$' + #13);
                comImpressoraTermica.WriteStr('161100000200500' + sPreco + #13);
                comImpressoraTermica.WriteStr('Q' + FormatFloat('0000', 1) + #13);
                comImpressoraTermica.WriteStr(#02 + 'E' + #13);

              end;

          end;

        end;
      3:begin

          comImpressoraTermica.WriteStr('^XA'); // inicio)
          comImpressoraTermica.WriteStr('^PQ1,,,N');

          if dmMProvider.cdsProdutosPROMOCAO.Value = 1 then
          begin

            comImpressoraTermica.WriteStr('^FO0,15^GB850,68,68,B^FS');
            comImpressoraTermica.WriteStr('^FO05,20^ARN,70,62^FR^FD' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + '^FS');

          end
          else
            comImpressoraTermica.WriteStr('^FO05,20^ASN,90,12^FD' + Trim(dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.Value) + '^FS');

          comImpressoraTermica.WriteStr('^FO05,90^ARN,10,12^FD' + dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.Value + '^FS');
          comImpressoraTermica.WriteStr('^FO05,145^APR,10,01^FD' + FormatFloat('000000', dmMProvider.cdsProdutosPRODUTO.Value) + '^FS');

          case dmMProvider.cdsProdutosPROMOCAO.Value of
            0:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency);
            1:sPreco := FormatFloat('#,###,##0.00', dmMProvider.cdsProdutoFilialPRECOPROMOCAO.AsCurrency);
          end;

          comImpressoraTermica.WriteStr('^FO30,145^APR,20,01^FD' + DateToStr(Date) + '^FS');
          comImpressoraTermica.WriteStr('^FO355,160^ATN,40,60^FDR$^FS^FO450,90^AVN,150,142^FD' + sPreco + '^FS');
          comImpressoraTermica.WriteStr('^FO80,140,^BY2^BEN,60,Y,N^FD' + dmMProvider.cdsBarrasBARRAS.Value + '^FS');
          comImpressoraTermica.WriteStr('^XZ');

        end;

  end;

  comImpressoraTermica.Close;

end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
var
  sWhere :string;
  i:integer;
begin

  DesabilitarBotaoFecharForm(handle);

  Caption                           := Application.Title + ' - ' + RetornarVersao(Application.ExeName, 1);
  FormatSettings.ShortDateFormat    := 'dd/mm/yyyy';

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdEan.Columns.Count - 1 do
    grdEan.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdFCP.Columns.Count - 1 do
    grdFCP.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdUltimaNFEProduto.Columns.Count - 1 do
    grdUltimaNFEProduto.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdItemUltimaNF.Columns.Count - 1 do
    grdItemUltimaNF.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdOrdemServico.Columns.Count - 1 do
    grdOrdemServico.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdOrdemServico.Columns.Count - 1 do
    grdOrdemServico.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdItemOrdemServico.Columns.Count - 1 do
    grdItemOrdemServico.Columns[i].Title.Color := COR_TITULO_GRADE;

  dmDBEXMaster.sNomeUsuario         := ParamStr(1);
  dmDBEXMaster.sSenha               := ParamStr(2);
  dmDBEXMaster.iIdUsuario           := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial            := StrToInt(ParamStr(4));

  chkDescontoPersonalizado.Visible  := dmMProvider.cdsConfiguracoesDESCONTO_PERSONALIZADO.Value > 0;

  ConfigurarImpressoraTermica;

  dmDBEXMaster.fdqMasterPesquisa .Close;
  dmDBEXMaster.fdqMasterPesquisa .SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa .SQL.Add('select count(*) as total_reg from ordem_de_servico');
  dmDBEXMaster.fdqMasterPesquisa .Open;

  grpOrdemServico.Visible           := dmDBEXMaster.fdqMasterPesquisa.FieldByName('TOTAL_REG').AsInteger > 0;

  dmDBEXMaster.fdqMasterPesquisa .Close;

  if dmDBEXMaster.sNomeUsuario <> 'SYSDBA' then
  begin

    dmDBEXMaster.fdqPermissao.Close;
    dmDBEXMaster.fdqPermissao.SQL.Clear;
    dmDBEXMaster.fdqPermissao.SQL.Add('SELECT PRODUTOS FROM PERMISSOES WHERE ' + ' USUARIO = ' + IntToStr(dmDBEXMaster.iIdUsuario));
    dmDBEXMaster.fdqPermissao.Open;

    if not dmDBEXMaster.fdqPermissao.IsEmpty then
      dmDBEXMaster.sFlag_Permissao := dmDBEXMaster.fdqPermissao.FieldByName('PRODUTOS').AsString;

  end;

  // verifica se existe mais de uma loja cadastrada
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT COUNT(*) AS T_REC FROM FILIAL');
  dmDBEXMaster.fdqMasterPesquisa.Open;

  grpInfoFilial.Visible := dmDBEXMaster.fdqMasterPesquisa.FieldByName('T_REC').Value > 1;

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT COUNT(*) AS T_ITENS FROM PRODUTO');
  dmDBEXMaster.fdqMasterPesquisa.Open;

  lblQtdItens.Caption := 'Itens: ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('T_ITENS').AsInteger);
  Caption             := Caption + ' / Total de itens : ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('T_ITENS').AsInteger);

  pgcProduto.ActivePageIndex := 0;

  if dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value > 0 then
  begin

    lblCst_PIS_Saida.Font.Color       := clRed;
    lblCst_PIS_Entrada.Font.Color     := lblCst_PIS_Saida.Font.Color;
    lblCst_COFINS_Saida.Font.Color    := lblCst_PIS_Saida.Font.Color;
    lblCst_COFINS_Entrada.Font.Color  := lblCst_PIS_Saida.Font.Color;

  end;

  dmMProvider.cdsOrigemMercadoria.Close;
  dmMProvider.cdsOrigemMercadoria.ProviderName := 'dspOrigemMercadoria';

  dmMProvider.cdsOrigemMercadoria.Open;
  dmMProvider.cdsOrigemMercadoria.ProviderName := '';

  dmMProvider.cdsUndMedida.Close;
  dmMProvider.cdsUndMedida.ProviderName := 'dspUndMedida';

  dmMProvider.cdsUndMedida.Open;
  dmMProvider.cdsUndMedida.ProviderName := '';

  //verifica se foi passado codigo interno como prametro
  if Length(Trim(ParamStr(5))) > 0 then
  begin

    if UpperCase(ParamStr(5)[1]) = 'P' then
    begin

      sWhere := 'WHERE PRO.PRODUTO = ' + Trim(Copy(ParamStr(5),2,Length(ParamStr(5))));

      dmMProvider.cdsProdutos.Close;
      dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

      dmDBEXMaster.fdqProdutos.SQL.Clear;
      dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
      dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
      dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
      dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
      dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
      dmDBEXMaster.fdqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
      dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');
      dmDBEXMaster.fdqProdutos.Open;

      dmMProvider.cdsProdutos.Open;
      dmMProvider.cdsProdutos.ProviderName := '';

      HabilitaDesabilitarControlesBalanca(dmMProvider.cdsProdutoFilialENVIARPARABALANCA.Value);

    end;

  end;

end;

procedure TfrmProdutos.imgCodigoSimilarClick(Sender: TObject);
begin

  actSelecionarSimilarExecute(self);

end;

procedure TfrmProdutos.imgGreraBarrasClick(Sender: TObject);
begin

  actGerarEanExecute(self);

end;

procedure TfrmProdutos.imgIncluirClick(Sender: TObject);
begin

  actIncluirExecute(self);
  grpBarras.Enabled := False;

end;

procedure TfrmProdutos.imgIngredientesClick(Sender: TObject);
begin

  frmIngredientes := TfrmIngredientes.Create(self);
  frmIngredientes.ShowModal;
  FreeAndNil(frmIngredientes);

end;

procedure TfrmProdutos.imgPesquisarClick(Sender: TObject);
begin

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
    edtConteudoPesquisaExit(Sender)
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INFORMAR_CONTEUDO;

  Application.ProcessMessages;

end;

procedure TfrmProdutos.imgPrimeiro_RegClick(Sender: TObject);
begin

  if dmMProvider.cdsProdutos.Active then
    if not dmMProvider.cdsProdutos.IsEmpty then
    begin

      dmMProvider.cdsProdutos.First;
      RelacionarBarras;

    end;

end;

procedure TfrmProdutos.imgProximo_RegClick(Sender: TObject);
begin

  if dmMProvider.cdsProdutos.Active then
    if not dmMProvider.cdsProdutos.IsEmpty then
    begin

      dmMProvider.cdsProdutos.Next;
      RelacionarBarras;

    end;

end;

procedure TfrmProdutos.imgRegisto_AntClick(Sender: TObject);
begin

  if dmMProvider.cdsProdutos.Active then
    if not dmMProvider.cdsProdutos.IsEmpty then
    begin

      dmMProvider.cdsProdutos.Prior;
      RelacionarBarras;

    end;

end;

procedure TfrmProdutos.imgSalvarClick(Sender: TObject);
begin

  actSalvarExecute(self);

end;

procedure TfrmProdutos.imgUltimo_RegClick(Sender: TObject);
begin

  if dmMProvider.cdsProdutos.Active then
    if not dmMProvider.cdsProdutos.IsEmpty then
    begin

      dmMProvider.cdsProdutos.Last;
      RelacionarBarras;

    end;

end;

procedure TfrmProdutos.imqTecladoClick(Sender: TObject);
begin

  if (dmMProvider.cdsProdutoFilialENVIARPARABALANCA.Value = 1) or (dmMProvider.cdsProdutosUNIDADE.Value = 'KG') and (dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value > 0) then
  begin

    frmTeclado_Balanca := TfrmTeclado_Balanca.Create(self);

    dmMProvider.cdsSetorBalanca.Close;
    dmMProvider.cdsSetorBalanca.ProviderName := 'dspSetorBalanca';

    dmDBEXMaster.fdqSetorBalanca.SQL.Clear;
    dmDBEXMaster.fdqSetorBalanca.SQL.Add('SELECT * FROM SETORDEBALANCA');
    dmDBEXMaster.fdqSetorBalanca.SQL.Add('WHERE SETOR = ' + IntToStr(dmMProvider.cdsProdutoFilialSETORDEBALANCA.Value));

    dmMProvider.cdsSetorBalanca.Open;
    dmMProvider.cdsSetorBalanca.ProviderName := '';

    if frmTeclado_Balanca.ShowModal = mrOk then
    begin

      dmMProvider.cdsProdutos.Edit;
      dmMProvider.cdsProdutoFilialTECLADO.Value        := dmMProvider.cdsTeclado_BalancaTECLADO.Value;
      dmMProvider.cdsProdutoFilialTECLAASSOCIADA.Value := dmMProvider.cdsTeclado_BalancaTECLA.Value;

    end;

    FreeAndNil(frmTeclado_Balanca);

  end;

end;

procedure TfrmProdutos.LimparMsgErro;
begin

  lblMsg.Caption := '';
//  Application.ProcessMessages;

end;

function TfrmProdutos.Man_Tab_Barras(pOpcao:smallint;pBarras,pCodigoBarrasGerado:string;pProduto:integer):boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if dmMProvider.cdsBarras.IsEmpty then
    begin

      dmMSProcedure.fdspBarras.Params[0].Value      := pOpcao;
      dmMSProcedure.fdspBarras.Params[2].Value      := pProduto;

      if dmMProvider.cdsProdutosUNIDADE.AsString = 'KG' then
        dmMSProcedure.fdspBarras.Params[3].Value      := 1
      else
        dmMSProcedure.fdspBarras.Params[3].Value      := 0;

      if dmDBEXMaster.bCodigoGerado then
      begin

        dmMSProcedure.fdspBarras.Params[1].Value    := pCodigoBarrasGerado;
        dmMSProcedure.fdspBarras.Params[4].Value    := 1;

      end
      else
      begin

        if sBarras <> '' then
          dmMSProcedure.fdspBarras.Params[1].Value  := pBarras
        else
          dmMSProcedure.fdspBarras.Params[1].Value  := dmMProvider.cdsBarrasBARRAS.AsString;

        dmMSProcedure.fdspBarras.Params[4].Value    := 0;

      end;

      if dmMProvider.cdsBarrasQUANTIDADE.AsInteger > 0 then
        dmMSProcedure.fdspBarras.Params[5].Value    := dmMProvider.cdsBarrasQUANTIDADE.AsInteger
      else
        dmMSProcedure.fdspBarras.Params[5].Value    := 1;

      // informa��es para o log
      dmMSProcedure.fdspBarras.Params[6].Value     := date;
      dmMSProcedure.fdspBarras.Params[7].Value     := time;
      dmMSProcedure.fdspBarras.Params[8].Value     := dmDBEXMaster.iIdUsuario;
      dmMSProcedure.fdspBarras.Params[9].Value     := pubNomeComputador;
      dmMSProcedure.fdspBarras.Params[10].Value    := RetornarIP;
      dmMSProcedure.fdspBarras.Params[11].Value    := 0;
      dmMSProcedure.fdspBarras.ExecProc;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    result := true;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmProdutos.Man_Tab_ProdutoFilial(pOpcao: smallint): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspProdutoFilial.Params[0].Value       := pOpcao;
    dmMSProcedure.fdspProdutoFilial.Params[1].Value       := dmMProvider.cdsProdutosPRODUTO.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[2].Value       := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspProdutoFilial.Params[3].Value       := dmMProvider.cdsProdutoFilialCUSTOBRUTO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[4].Value       := dmMProvider.cdsProdutoFilialCUSTOBRUTOANTERIOR.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[5].Value       := dmMProvider.cdsProdutoFilialCUSTOLIQUIDO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[6].Value       := dmMProvider.cdsProdutoFilialCUSTOLIQUIDOANTERIOR.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[7].Value       := dmMProvider.cdsProdutoFilialMENORPRECO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[8].Value       := dmMProvider.cdsProdutoFilialPRECOCALCULADO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[9].Value       := dmMProvider.cdsProdutoFilialPRECOPROVISORIO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[10].Value      := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[11].Value      := dmMProvider.cdsProdutoFilialPRECODEVENDAANTERIOR.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[12].Value      := dmMProvider.cdsProdutoFilialCADASTRO.AsDateTime;
    dmMSProcedure.fdspProdutoFilial.Params[13].Value      := dmMProvider.cdsProdutoFilialALTERACAO.AsDateTime;
    dmMSProcedure.fdspProdutoFilial.Params[14].Value      := dmMProvider.cdsProdutoFilialREMARCACAO.AsDateTime;
    dmMSProcedure.fdspProdutoFilial.Params[15].Value      := dmMProvider.cdsProdutoFilialLUCROICMSR.Value;
    dmMSProcedure.fdspProdutoFilial.Params[16].Value      := dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[17].Value      := dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[18].Value      := dmMProvider.cdsProdutoFilialCOMISSAOVENDA.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[19].Value      := dmMProvider.cdsProdutoFilialLUCROLIQUIDO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[20].Value      := dmMProvider.cdsProdutoFilialDEPOSITO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[21].Value      := dmMProvider.cdsProdutoFilialLOJA.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[22].Value      := dmMProvider.cdsProdutoFilialSALDOANTERIOR.Value;
    dmMSProcedure.fdspProdutoFilial.Params[23].Value      := dmMProvider.cdsProdutoFilialSALDOMAXIMO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[24].Value      := dmMProvider.cdsProdutoFilialSALDOMINIMO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[25].Value      := dmMProvider.cdsProdutoFilialSETORDEBALANCA.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[26].Value      := dmMProvider.cdsProdutoFilialPROMOCAO.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[27].Value      := dmMProvider.cdsProdutoFilialTECLAASSOCIADA.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[28].Value      := dmMProvider.cdsProdutoFilialVALIDADE.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[29].Value      := dmMProvider.cdsProdutoFilialTECLADO.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[30].Value      := dmMProvider.cdsProdutoFilialREDUCAOBASEDECALCULO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[31].Value      := dmMProvider.cdsProdutoFilialDESCONTOPROGRAMADO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[32].Value      := dmMProvider.cdsProdutoFilialDESCRICAOCUPOMFISCAL.AsString;
    dmMSProcedure.fdspProdutoFilial.Params[33].Value      := dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA1.AsString;
    dmMSProcedure.fdspProdutoFilial.Params[34].Value      := dmMProvider.cdsProdutoFilialDESCRICAOGONDOLA2.AsString;
    dmMSProcedure.fdspProdutoFilial.Params[35].Value      := dmMProvider.cdsProdutoFilialDESCRICAOBALANCA.AsString;
    dmMSProcedure.fdspProdutoFilial.Params[36].Value      := dmMProvider.cdsProdutoFilialDESCRICAOTIRATEIMA.AsString;
    dmMSProcedure.fdspProdutoFilial.Params[37].Value      := dmMProvider.cdsProdutoFilialENVIARPARABALANCA.AsInteger;
    dmMSProcedure.fdspProdutoFilial.Params[38].Value      := dmMProvider.cdsProdutoFilialDESCONTONACOMPRA.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[39].Value      := dmMProvider.cdsProdutoFilialCREDITODEICMS.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[40].Value      := dmMProvider.cdsProdutoFilialIPI.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[41].Value      := dmMProvider.cdsProdutoFilialOUTROSCUSTOS.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[42].Value      := dmMProvider.cdsProdutoFilialFRETE.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[43].Value      := dmMProvider.cdsProdutoFilialICMSAPAGAR.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[44].Value      := dmMProvider.cdsProdutoFilialDESCONTONAVENDA.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[45].Value      := dmMProvider.cdsProdutoFilialVALORDODESCONTONACOMPRA.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[46].Value      := dmMProvider.cdsProdutoFilialVALORDOCREDITODEICMSR.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[47].Value      := dmMProvider.cdsProdutoFilialVALORDOIPI.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[48].Value      := dmMProvider.cdsProdutoFilialVALORDEOUTROSCUSTOS.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[49].Value      := dmMProvider.cdsProdutoFilialVALORDOFRETE.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[50].Value      := dmMProvider.cdsProdutoFilialVALORDOICMSR.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[51].Value      := dmMProvider.cdsProdutoFilialPRECOPROMOCAO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[52].Value      := dmMProvider.cdsProdutoFilialULTIMA_ENTRADA.AsDateTime;
    dmMSProcedure.fdspProdutoFilial.Params[53].Value      := dmMProvider.cdsProdutoFilialSALDO_RESERVADO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[54].Value      := dmMProvider.cdsProdutoFilialPRECO_ATACADO.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[55].Value      := dmMProvider.cdsProdutoFilialDESCRICAO_ATACADO.AsString;

    // informa��es para o log
    dmMSProcedure.fdspProdutoFilial.Params[56].Value      := date;
    dmMSProcedure.fdspProdutoFilial.Params[57].Value      := time;
    dmMSProcedure.fdspProdutoFilial.Params[58].Value      := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspProdutoFilial.Params[59].Value      := pubNomeComputador;
    dmMSProcedure.fdspProdutoFilial.Params[60].Value      := RetornarIP;
    dmMSProcedure.fdspProdutoFilial.Params[61].Value      := 0;

    dmMSProcedure.fdspProdutoFilial.Params[62].Value      := dmMProvider.cdsProdutoFilialPERCENTUAL_ISS.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[63].Value      := dmMProvider.cdsProdutoFilialPERCENTUAL_IOF.AsCurrency;
    dmMSProcedure.fdspProdutoFilial.Params[64].Value      := dmMProvider.cdsProdutoFilialPERCENTUAL_CIDE.AsCurrency;

    dmMSProcedure.fdspProdutoFilial.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    result := true;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Result          := False;
      Application.ProcessMessages;

    end;
  end;

end;

function TfrmProdutos.Man_Tab_Produtos(pOpcao: smallint): boolean;
var
  iContaBarras, iIdProduto: Integer;
  sCodigoBarrasGerado: string;
  cPVenda, cVendaAnterior: Currency;
begin

  cVendaAnterior      := 0;
  cPVenda             := 0;
  iContaBarras        := 0;
  iIdProduto          := 0;
  sCodigoBarrasGerado := '';

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if dmMProvider.cdsBarras.IsEmpty then
    begin

      if dmDBEXMaster.bCodigoGerado then
      begin

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT * FROM BARRAS');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE GERADO = 1');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ORDER BY BARRAS');
        dmDBEXMaster.fdqMasterPesquisa.Open;

        while not dmDBEXMaster.fdqMasterPesquisa.Eof do
        begin

          Inc(iContaBarras);

          if iContaBarras < StrToFloat(Copy(dmDBEXMaster.fdqMasterPesquisa.FieldByName('BARRAS').AsString, 1, 12)) then
          begin

            sCodigoBarrasGerado := GerarCodigodeBarras(FormatFloat('000000000000', iContaBarras));
            break;

          end;

          dmDBEXMaster.fdqMasterPesquisa.Next;

        end;

        if sCodigoBarrasGerado = '' then
        begin

          iContaBarras        := iContaBarras + 1;
          sCodigoBarrasGerado := GerarCodigodeBarras(FormatFloat('000000000000', iContaBarras));

        end;

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT * FROM BARRAS');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE BARRAS = ' + QuotedStr(sCodigoBarrasGerado));
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if not dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  ', verifique o c�digo de barras do produto: ' + FormatFloat('000000', dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value);
          Application.ProcessMessages;
          dmDBEXMaster.fdqMasterPesquisa.Close;
          exit;

        end;

      end;

    end;

    dmMSProcedure.fdspProdutos.Params[0].Value      :=  pOpcao;
    dmMSProcedure.fdspProdutos.Params[1].Value      :=  dmMProvider.cdsProdutosPRODUTO.AsInteger;
    dmMSProcedure.fdspProdutos.Params[2].Value      :=  dmMProvider.cdsProdutosDESCRICAO.AsString;

    if dmMProvider.cdsProdutosGRUPO.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[3].Value    := dmMProvider.cdsProdutosGRUPO.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[3].Value    := null;

    if dmMProvider.cdsProdutosSUBGRUPO.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[4].Value    := dmMProvider.cdsProdutosSUBGRUPO.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[4].Value    := null;

    if dmMProvider.cdsProdutosSECAO.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[5].Value    := dmMProvider.cdsProdutosSECAO.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[5].Value    := null;

    dmMSProcedure.fdspProdutos.Params[6].Value      := dmMProvider.cdsProdutosUNIDADE.AsString;
    dmMSProcedure.fdspProdutos.Params[7].Value      := dmMProvider.cdsProdutosUNIDADEEMBALAGEM.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[8].Value      := dmMProvider.cdsProdutosPESOLIQUIDO.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[9].Value      := dmMProvider.cdsProdutosPESOBRUTO.AsCurrency;

    if dmMProvider.cdsProdutosTRIBUTACAO.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[10].Value   := dmMProvider.cdsProdutosTRIBUTACAO.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[10].Value   := null;

    dmMSProcedure.fdspProdutos.Params[11].Value     := dmMProvider.cdsProdutosATIVO.AsInteger;
    dmMSProcedure.fdspProdutos.Params[12].Value     := dmMProvider.cdsProdutosREDBASECALCULO.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[13].Value     := dmMProvider.cdsProdutosCST.AsString;
    dmMSProcedure.fdspProdutos.Params[14].Value     := dmMProvider.cdsProdutosSTATUS.AsInteger;

    if dmMProvider.cdsProdutosFORNECEDOR.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[15].Value   := dmMProvider.cdsProdutosFORNECEDOR.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[15].Value   := null;

    dmMSProcedure.fdspProdutos.Params[16].Value     := dmMProvider.cdsProdutosNCM.AsString;

    if dmMProvider.cdsProdutosINFNUTRICIONAL.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[17].Value   := dmMProvider.cdsProdutosINFNUTRICIONAL.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[17].Value   := null;

    dmMSProcedure.fdspProdutos.Params[18].Value     := dmMProvider.cdsProdutosCOMPLEMENTO.AsString;
    dmMSProcedure.fdspProdutos.Params[19].Value     := 0; //isento de pis confins -obsoleto
    dmMSProcedure.fdspProdutos.Params[20].Value     := dmMProvider.cdsProdutosSIMILAR.AsInteger;

    if dmMProvider.cdsProdutosFABRICANTE.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[21].Value   := dmMProvider.cdsProdutosFABRICANTE.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[21].Value   := null;

    dmMSProcedure.fdspProdutos.Params[22].Value     := dmMProvider.cdsProdutosCOMPOEM_CESTA_BASICA.AsInteger;
    dmMSProcedure.fdspProdutos.Params[23].Value     := 0;//permite venda fracionada - obsoleto - agora� tratado pelo cad de unidade
    dmMSProcedure.fdspProdutos.Params[24].Value     := dmMProvider.cdsProdutosUNIDADE_ATACADO.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[25].Value     := dmMProvider.cdsProdutosALIQUOTA_PIS.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[26].Value     := dmMProvider.cdsProdutosALIQUOTA_COFINS.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[27].Value     := dmMProvider.cdsProdutosVISIBILIDADE.AsInteger;
    dmMSProcedure.fdspProdutos.Params[28].Value     := dmMProvider.cdsProdutosCST_IPI.AsInteger;
    dmMSProcedure.fdspProdutos.Params[29].Value     := dmMProvider.cdsProdutosCST_PIS.AsInteger;
    dmMSProcedure.fdspProdutos.Params[30].Value     := dmMProvider.cdsProdutosCST_COFINS.AsInteger;
    dmMSProcedure.fdspProdutos.Params[31].Value     := dmMProvider.cdsProdutosTIPO_ITEM.AsInteger;
    dmMSProcedure.fdspProdutos.Params[32].Value     := null;//lei pisa cofins - obsoleto

    if dmMProvider.cdsProdutosPRODUTO_ORIGEM.AsInteger > 0 then
      dmMSProcedure.fdspProdutos.Params[33].Value   := dmMProvider.cdsProdutosPRODUTO_ORIGEM.AsInteger
    else
      dmMSProcedure.fdspProdutos.Params[33].Value   := null;

    dmMSProcedure.fdspProdutos.Params[34].Value     := dmMProvider.cdsProdutosCST_PIS_ENTRADA.AsInteger;
    dmMSProcedure.fdspProdutos.Params[35].Value     := dmMProvider.cdsProdutosCST_COFINS_ENTRADA.AsInteger;
    dmMSProcedure.fdspProdutos.Params[36].Value     := dmMProvider.cdsProdutosNATUREZA_RECEITA.AsInteger;
    dmMSProcedure.fdspProdutos.Params[37].Value     := dmMProvider.cdsProdutosUNIDADE_ATACADO.AsCurrency;

    // informa��es para o log
    dmMSProcedure.fdspProdutos.Params[38].Value     := date;
    dmMSProcedure.fdspProdutos.Params[39].Value     := time;
    dmMSProcedure.fdspProdutos.Params[40].Value     := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspProdutos.Params[41].Value     := pubNomeComputador;
    dmMSProcedure.fdspProdutos.Params[42].Value     := RetornarIP;

    dmMSProcedure.fdspProdutos.Params[43].Value     := dmMProvider.cdsProdutosSTATUS.AsInteger;
    dmMSProcedure.fdspProdutos.Params[44].Value     := dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[45].Value     := dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[46].Value     := dmMProvider.cdsProdutosCODIGO_CREDITO_PIS_COFINS.AsInteger;
    dmMSProcedure.fdspProdutos.Params[47].Value     := dmMProvider.cdsProdutosCODIGO_ANP.Value;
    dmMSProcedure.fdspProdutos.Params[48].Value     := 0; //carga trib nac - obsoleto
    dmMSProcedure.fdspProdutos.Params[49].Value     := 0; //carga trib imp - obsoleto
    dmMSProcedure.fdspProdutos.Params[50].Value     := dmMProvider.cdsProdutosCF_IPI.AsInteger;
    dmMSProcedure.fdspProdutos.Params[51].Value     := dmMProvider.cdsProdutosDESCONTO_PERSONALIZADO.AsCurrency;
    dmMSProcedure.fdspProdutos.Params[52].Value     := dmMProvider.cdsProdutosORIGEM_MERCADORIA.AsInteger;
    dmMSProcedure.fdspProdutos.Params[53].Value     := dmMProvider.cdsProdutosCEST.AsString;
    dmMSProcedure.fdspProdutos.ExecProc;

    if not InserindoEditando(dmMProvider.cdsProdutos) then
      dmMProvider.cdsProdutos.Edit;

    if dmMSProcedure.fdspProdutos.Params[92].AsInteger > 0 then
      dmMProvider.cdsProdutosPRODUTO.Value          := dmMSProcedure.fdspProdutos.Params[92].Value;

    if Man_Tab_Barras(pOpcao,sbarras,sCodigoBarrasGerado,iIdProduto) then
    begin

      Codifica(dmMProvider.cdsBarrasBARRAS.AsString);
      // Repassa Imagem para o Image
      imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect (0, 0, 500, 500));
      ptbEAN.Visible := False;

      if Man_Tab_ProdutoFilial(pOpcao) then
      begin

        if grpInfoFilial.Visible then
        begin

          dmDBEXMaster.fdqMasterPesquisa.Close;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT FILIAL FROM FILIAL');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE FILIAL <> ' + IntToStr(dmDBEXMaster.iIdFilial));
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ORDER BY FILIAL');
          dmDBEXMaster.fdqMasterPesquisa.Open;

          while not dmDBEXMaster.fdqMasterPesquisa.Eof do
          begin

            if dmMProvider.cdsConfiguracoesUNIFICARPRECODEVENDA.Value = 0 then
            begin

              dmDBEXMaster.fdqPesqProdutos.Close;
              dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT * FROM PRODUTOFILIAL');
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('WHERE PRODUTO = ' + IntToStr(iIdProduto));
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('AND FILIAL = ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('FILIAL').Value));
              dmDBEXMaster.fdqPesqProdutos.Open;

              if not dmDBEXMaster.fdqPesqProdutos.IsEmpty then
              begin

                cPVenda         := dmDBEXMaster.fdqPesqProdutos.FieldByName('PRECODEVENDA').Value;
                cVendaAnterior  := dmDBEXMaster.fdqPesqProdutos.FieldByName('PRECODEVENDAANTERIOR').Value;

              end
              else
              begin

                cPVenda         := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;
                cVendaAnterior  := dmMProvider.cdsProdutoFilialPRECODEVENDAANTERIOR.AsCurrency;

              end;

            end
            else
            begin

              cPVenda         := dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency;
              cVendaAnterior  := dmMProvider.cdsProdutoFilialPRECODEVENDAANTERIOR.AsCurrency;

            end;

            Man_Tab_ProdutoFilial(pOpcao);

            dmDBEXMaster.fdqMasterPesquisa.Next;

          end;

        end;

      end;

    end;

    RemarcarSimilares;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    result := true;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmProdutos.PreencherInfomacoesGenericasGrupo;
begin

  if dmMProvider.cdsGrupoTRIBUTACAO.Value > 0 then
    dmMProvider.cdsProdutosTRIBUTACAO.Value := dmMProvider.cdsGrupoTRIBUTACAO.Value;

  if not InserindoEditando(dmMProvider.cdsProdutoFilial) then
    dmMProvider.cdsProdutoFilial.Edit;

  dmMProvider.cdsProdutoFilialLUCROLIQUIDO.Value      := dmMProvider.cdsGrupoLUCROLIQUIDO.Value;
  dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.Value  := dmMProvider.cdsGrupoALIQUOTA_PIS.AsCurrency + dmMProvider.cdsGrupoALIQUOTA_COFINS.AsCurrency;
  dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.Value  := dmMProvider.cdsGrupoCUSTOOPERACIONAL.Value;

  if not InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutos.Edit;

  if dmMProvider.cdsProdutosALIQUOTA_PIS.Value <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_PIS.Value := dmMProvider.cdsGrupoALIQUOTA_PIS.AsCurrency;

  if dmMProvider.cdsProdutosALIQUOTA_COFINS.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_COFINS.AsCurrency := dmMProvider.cdsGrupoALIQUOTA_COFINS.AsCurrency;

  if dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency := dmMProvider.cdsGrupoALIQUOTA_PIS_ENTRADA.AsCurrency;

  if dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency := dmMProvider.cdsGrupoALIQUOTA_COFINS_ENTRADA.AsCurrency;

  if dmMProvider.cdsGrupoCST_IPI.Value > 0 then
    dmMProvider.cdsProdutosCST_IPI.Value := dmMProvider.cdsGrupoCST_IPI.Value;

  if dmMProvider.cdsGrupoCST_PIS_ENTRADA.Value > 0 then
    dmMProvider.cdsProdutosCST_PIS_ENTRADA.Value := dmMProvider.cdsGrupoCST_PIS_ENTRADA.Value;

  if dmMProvider.cdsGrupoCST_PIS_SAIDA.Value > 0 then
    dmMProvider.cdsProdutosCST_PIS.Value := dmMProvider.cdsGrupoCST_PIS_SAIDA.Value;

  if dmMProvider.cdsGrupoCST_ICMS.Value > 0 then
    dmMProvider.cdsProdutosCST.Value := FormatFloat('000', dmMProvider.cdsSubGrupoCST_ICMS.Value);

  if dmMProvider.cdsGrupoCST_COFINS_ENTRADA.Value > 0 then
    dmMProvider.cdsProdutosCST_COFINS_ENTRADA.Value := dmMProvider.cdsGrupoCST_COFINS_ENTRADA.Value;

  if dmMProvider.cdsGrupoCST_COFINS_SAIDA.Value > 0 then
    dmMProvider.cdsProdutosCST_COFINS.Value := dmMProvider.cdsGrupoCST_COFINS_SAIDA.Value;

  if dmMProvider.cdsGrupoNATUREZA_RECEITA.Value > 0 then
    dmMProvider.cdsProdutosNATUREZA_RECEITA.Value := dmMProvider.cdsGrupoNATUREZA_RECEITA.Value;

  if dmMProvider.cdsGrupoCODIGO_CREDITO_PIS_COFINS.Value > 0 then
    dmMProvider.cdsProdutosCODIGO_CREDITO_PIS_COFINS.Value := dmMProvider.cdsGrupoCODIGO_CREDITO_PIS_COFINS.Value;

end;

procedure TfrmProdutos.PreencherInfomacoesGenericasSecao;
begin

  if dmMProvider.cdsSecaoTRIBUTACAO.Value > 0 then
    dmMProvider.cdsProdutosTRIBUTACAO.Value := dmMProvider.cdsSecaoTRIBUTACAO.Value;

  if not InserindoEditando(dmMProvider.cdsProdutoFilial) then
    dmMProvider.cdsProdutoFilial.Edit;

  if dmMProvider.cdsSecaoLUCRO_LIQUIDO.Value > 0 then
    dmMProvider.cdsProdutoFilialLUCROLIQUIDO.AsCurrency := dmMProvider.cdsSecaoLUCRO_LIQUIDO.AsCurrency;

  if (dmMProvider.cdsProdutosALIQUOTA_PIS.Value > 0) AND (dmMProvider.cdsProdutosALIQUOTA_COFINS.Value > 0)then
    dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.AsCurrency := dmMProvider.cdsProdutosALIQUOTA_PIS.AsCurrency + dmMProvider.cdsProdutosALIQUOTA_COFINS.AsCurrency;

  if dmMProvider.cdsSecaoCUSTO_OPERACIONAL.Value > 0 then
    dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.Value  := dmMProvider.cdsSecaoCUSTO_OPERACIONAL.Value;

  if dmMProvider.cdsSecaoALIQUOTA_PIS.AsCurrency > 0 then
    dmMProvider.cdsProdutosALIQUOTA_PIS.AsCurrency := dmMProvider.cdsSecaoALIQUOTA_PIS.AsCurrency;

  if dmMProvider.cdsSecaoALIQUOTA_COFINS.AsCurrency > 0 then
    dmMProvider.cdsProdutosALIQUOTA_COFINS.AsCurrency := dmMProvider.cdsSecaoALIQUOTA_COFINS.AsCurrency;

  if dmMProvider.cdsSecaoCST_IPI.Value > 0 then
    dmMProvider.cdsProdutosCST_IPI.Value := dmMProvider.cdsSecaoCST_IPI.Value;

  if dmMProvider.cdsSecaoCST_PIS_ENTRADA.Value > 0 then
    dmMProvider.cdsProdutosCST_PIS_ENTRADA.Value := dmMProvider.cdsSecaoCST_PIS_ENTRADA.Value;

  if dmMProvider.cdsSecaoCST_PIS_SAIDA.Value > 0 then
    dmMProvider.cdsProdutosCST_PIS.Value := dmMProvider.cdsSecaoCST_PIS_SAIDA.Value;

  if dmMProvider.cdsSecaoCST_ICMS.Value > 0 then
    dmMProvider.cdsProdutosCST.Value := FormatFloat('000', dmMProvider.cdsSecaoCST_ICMS.Value);

  if dmMProvider.cdsSecaoCST_COFINS_ENTRADA.Value > 0 then
    dmMProvider.cdsProdutosCST_COFINS_ENTRADA.Value := dmMProvider.cdsSecaoCST_COFINS_ENTRADA.Value;

  if dmMProvider.cdsSecaoCST_COFINS_SAIDA.Value > 0 then
    dmMProvider.cdsProdutosCST_COFINS.Value := dmMProvider.cdsSecaoCST_COFINS_SAIDA.Value;

  if dmMProvider.cdsSecaoNATUREZA_RECEITA.Value > 0 then
    dmMProvider.cdsProdutosNATUREZA_RECEITA.Value := dmMProvider.cdsSecaoNATUREZA_RECEITA.Value;

  if dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency := dmMProvider.cdsSecaoALIQUOTA_PIS_ENTRADA.AsCurrency;

  if dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency := dmMProvider.cdsSecaoALIQUOTA_COFINS_ENTRADA.AsCurrency;

  if dmMProvider.cdsSecaoCODIGO_CREDITO_PIS_COFINS.Value > 0 then
    dmMProvider.cdsProdutosCODIGO_CREDITO_PIS_COFINS.Value := dmMProvider.cdsSecaoCODIGO_CREDITO_PIS_COFINS.Value;

  if dmMProvider.cdsSecaoPERCENTUAL_ISS.Value > 0 then
    dmMProvider.cdsProdutoFilialPERCENTUAL_ISS.Value := dmMProvider.cdsSecaoPERCENTUAL_ISS.Value;

  if dmMProvider.cdsSecaoPERCENTUAL_IOF.Value > 0 then
    dmMProvider.cdsProdutoFilialPERCENTUAL_IOF.Value := dmMProvider.cdsSecaoPERCENTUAL_IOF.Value;

  if dmMProvider.cdsSecaoPERCENTUAL_CIDE.Value > 0 then
    dmMProvider.cdsProdutoFilialPERCENTUAL_CIDE.Value := dmMProvider.cdsSecaoPERCENTUAL_CIDE.Value;

end;

procedure TfrmProdutos.PreencherInfomacoesGenericasSubGrupo;
begin

  if dmMProvider.cdsSubGrupoTRIBUTACAO.Value > 0 then
    dmMProvider.cdsProdutosTRIBUTACAO.Value := dmMProvider.cdsSubGrupoTRIBUTACAO.Value;

  if not InserindoEditando(dmMProvider.cdsProdutoFilial) then
    dmMProvider.cdsProdutoFilial.Edit;

  if dmMProvider.cdsSubGrupoLUCRO_LIQUIDO.Value > 0 then
    dmMProvider.cdsProdutoFilialLUCROLIQUIDO.AsCurrency     := dmMProvider.cdsSubGrupoLUCRO_LIQUIDO.AsCurrency;

  if (dmMProvider.cdsSubGrupoALIQUOTA_PIS.Value > 0) and (dmMProvider.cdsSubGrupoALIQUOTA_COFINS.AsCurrency > 0) then
    dmMProvider.cdsProdutoFilialIMPOSTOSFEDERAIS.AsCurrency := dmMProvider.cdsSubGrupoALIQUOTA_PIS.AsCurrency + dmMProvider.cdsSubGrupoALIQUOTA_COFINS.AsCurrency;

  if dmMProvider.cdsSubGrupoCUSTO_OPERACIONAL.Value > 0 then
    dmMProvider.cdsProdutoFilialCUSTOOPERACIONAL.Value      := dmMProvider.cdsSubGrupoCUSTO_OPERACIONAL.Value;

  if dmMProvider.cdsSubGrupoALIQUOTA_PIS.Value > 0 then
    dmMProvider.cdsProdutosALIQUOTA_PIS.AsCurrency  := dmMProvider.cdsSubGrupoALIQUOTA_PIS.AsCurrency;

  if dmMProvider.cdsSubGrupoALIQUOTA_COFINS.Value  > 0 then
    dmMProvider.cdsProdutosALIQUOTA_COFINS.AsCurrency  := dmMProvider.cdsSubGrupoALIQUOTA_COFINS.AsCurrency;

  if dmMProvider.cdsSubGrupoCST_IPI.Value > 0 then
    dmMProvider.cdsProdutosCST_IPI.Value := dmMProvider.cdsSubGrupoCST_IPI.Value;

  if dmMProvider.cdsSubGrupoCST_PIS_ENTRADA.Value > 0 then
    dmMProvider.cdsProdutosCST_PIS_ENTRADA.Value := dmMProvider.cdsSubGrupoCST_PIS_ENTRADA.Value;

  if dmMProvider.cdsSubGrupoCST_PIS_SAIDA.Value > 0 then
    dmMProvider.cdsProdutosCST_PIS.Value := dmMProvider.cdsSubGrupoCST_PIS_SAIDA.Value;

  if dmMProvider.cdsSubGrupoCST_ICMS.Value > 0 then
    dmMProvider.cdsProdutosCST.Value := FormatFloat('000', dmMProvider.cdsSubGrupoCST_ICMS.Value);

  if dmMProvider.cdsSubGrupoCST_COFINS_ENTRADA.Value > 0 then
    dmMProvider.cdsProdutosCST_COFINS_ENTRADA.Value :=  dmMProvider.cdsSubGrupoCST_COFINS_ENTRADA.Value;

  if dmMProvider.cdsSubGrupoCST_COFINS_SAIDA.Value > 0 then
    dmMProvider.cdsProdutosCST_COFINS.Value := dmMProvider.cdsSubGrupoCST_COFINS_SAIDA.Value;

  if dmMProvider.cdsSubGrupoNATUREZA_RECEITA.Value > 0 then
    dmMProvider.cdsProdutosNATUREZA_RECEITA.Value := dmMProvider.cdsSubGrupoNATUREZA_RECEITA.Value;

  if dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_PIS_ENTRADA.AsCurrency := dmMProvider.cdsSubGrupoALIQUOTA_PIS_ENTRADA.AsCurrency;

  if dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency <= 0 then
    dmMProvider.cdsProdutosALIQUOTA_COFINS_ENTRADA.AsCurrency := dmMProvider.cdsSubGrupoALIQUOTA_COFINS_ENTRADA.AsCurrency;

  if dmMProvider.cdsSubGrupoCODIGO_CREDITO_PIS_COFINS.Value > 0 then
    dmMProvider.cdsProdutosCODIGO_CREDITO_PIS_COFINS.Value := dmMProvider.cdsSubGrupoCODIGO_CREDITO_PIS_COFINS.Value;

end;

procedure TfrmProdutos.rdgTipRegraChange(Sender: TObject);
begin

  edtValorUnitario.Enabled := (rdgTipRegra.ItemIndex = 0);
  edtPercentualDesconto.Enabled := (rdgTipRegra.ItemIndex = 1);

  if InserindoEditando(dmMProvider.cdsPrecoQuantidade) then
  begin

    if rdgTipRegra.ItemIndex = 0 then
      dmMProvider.cdsPrecoQuantidadePERCENTUAL_DESCONTO.Value := 0
    else
      dmMProvider.cdsPrecoQuantidadePRECO_UNITARIO.Value := 0;

    edtQuantidade.SetFocus;

  end;

end;

procedure TfrmProdutos.rdpOpcaoPesquisaClick(Sender: TObject);
var
  sWhere: string;
begin

  case rdpOpcaoPesquisa.ItemIndex of
    4:begin

        pgcProduto.ActivePageIndex := 0;

        frmPesquisaFornecedor                         := TfrmPesquisaFornecedor.Create(self);
        frmPesquisaFornecedor.edtNomeRSocial.ReadOnly := False;

        if frmPesquisaFornecedor.ShowModal = mrOk then
        begin

          if not dmMProvider.cdsFornecedor.IsEmpty then
          begin

            sWhere := 'WHERE PRO.FORNECEDOR = ' + IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value);

            dmMProvider.cdsProdutos.Close;
            dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

            dmDBEXMaster.fdqProdutos.SQL.Clear;
            dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
            dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
            dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
            dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
            dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
            dmDBEXMaster.fdqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
            dmDBEXMaster.fdqProdutos.SQL.Add(' AND PRO.VISIBILIDADE = 1');
            dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');

            dmMProvider.cdsProdutos.Open;
            dmMProvider.cdsProdutos.ProviderName := '';

          end;

        end;

        if not dmMProvider.cdsProdutos.IsEmpty then
        begin

          pgcProduto.ActivePageIndex := 0;
          edtConteudoPesquisa.Clear;
          grdTabela.SetFocus;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
          edtConteudoPesquisa.SetFocus;

        end;

      end;
    5:begin

        if dmDBEXMaster.sNomeUsuario <> 'SYSDBA' then
        begin

          if ValidarUsuarioMaster  then
          begin

            dmMProvider.cdsProdutos.Close;
            dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

            dmDBEXMaster.fdqProdutos.SQL.Clear;
            dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
            dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
            dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
            dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
            dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
            dmDBEXMaster.fdqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
            dmDBEXMaster.fdqProdutos.SQL.Add(' AND PRO.VISIBILIDADE = 0');
            dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');

            dmMProvider.cdsProdutos.Open;
            dmMProvider.cdsProdutos.ProviderName := '';

            if not dmMProvider.cdsProdutos.IsEmpty then
            begin

              edtConteudoPesquisa.Clear;
              grdTabela.SetFocus;

            end
            else
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONSULTA_VAZIA;
              edtConteudoPesquisa.SetFocus;

            end;

          end
          else
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_N_PERMISSAO_USUARIO;
            Application.ProcessMessages;

          end;

        end
        else
        begin

          dmMProvider.cdsProdutos.Close;
          dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

          dmDBEXMaster.fdqProdutos.SQL.Clear;
          dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
          dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
          dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
          dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
          dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
          dmDBEXMaster.fdqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
          dmDBEXMaster.fdqProdutos.SQL.Add(' AND PRO.VISIBILIDADE = 0');
          dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');

          dmMProvider.cdsProdutos.Open;
          dmMProvider.cdsProdutos.ProviderName := '';

          if not dmMProvider.cdsProdutos.IsEmpty then
          begin

            edtConteudoPesquisa.Clear;
            grdTabela.SetFocus;

          end
          else
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONSULTA_VAZIA;
            edtConteudoPesquisa.SetFocus;

          end;

        end;

      end;
    else
    begin

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end;

  end;

end;

procedure TfrmProdutos.RelacionarBarras;
begin

  dmMProvider.cdsBarras.Close;
  dmMProvider.cdsBarras.ProviderName := 'dspBarras';

  dmDBEXMaster.fdqBarras.SQL.Clear;
  dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
  dmDBEXMaster.fdqBarras.SQL.Add('WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));

  dmMProvider.cdsBarras.Open;
  dmMProvider.cdsBarras.ProviderName := '';

  if Length(dmMProvider.cdsBarrasBARRAS.Value) > 8 then
  begin

    Codifica(dmMProvider.cdsBarrasBARRAS.AsString);
    // Repassa Imagem para o Image
    imgEan.Canvas.CopyRect(Rect(0, 0, 500, 500), ptbEAN.Canvas, Rect(0, 0, 500, 500));
    ptbEAN.Visible := False;

  end;

end;

procedure TfrmProdutos.RelacionarFCPNCM;
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    dmMProvider.cdsFCP_NCM.Close;
    dmMProvider.cdsFCP_NCM.ProviderName := 'dspFCP_NCM';

    dmDBEXMaster.fdqFCP_NCM.SQL.Clear;
    dmDBEXMaster.fdqFCP_NCM.SQL.Add('select * from fcp_estados');
    dmDBEXMaster.fdqFCP_NCM.SQL.Add('where ncm = ' + QuotedStr(dmMProvider.cdsProdutosNCM.AsString));
    dmDBEXMaster.fdqFCP_NCM.SQL.Add('order by sigla');

    dmMProvider.cdsFCP_NCM.Open;
    dmMProvider.cdsFCP_NCM.ProviderName := '';

  end;

end;

procedure TfrmProdutos.RelacionarIOS_produto;
begin

  dmMProvider.cdsIOS_Produto.Close;
  dmMProvider.cdsIOS_Produto.ProviderName := 'dspIOS_Produto';

  dmDBEXMaster.fdqIOS_Produto.SQL.Clear;
  dmDBEXMaster.fdqIOS_Produto.SQL.Add('select * from itens_os_pecas');
  dmDBEXMaster.fdqIOS_Produto.SQL.Add('where ordem_servico = ' + IntToStr(dmMProvider.cdsOS_ProdutoORDEM_DE_SERVICO.Value));
  dmDBEXMaster.fdqIOS_Produto.SQL.Add('and codigo_peca = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));

  dmMProvider.cdsIOS_Produto.Open;
  dmMProvider.cdsIOS_Produto.ProviderName := '';

end;

procedure TfrmProdutos.RelacionarOSPendente;
begin

  dmMProvider.cdsOS_Produto.Close;
  dmMProvider.cdsOS_Produto.ProviderName := 'dspOS_Produto';

  dmDBEXMaster.fdqOS_Produto.SQL.Clear;
  dmDBEXMaster.fdqOS_Produto.SQL.Add('select * from ordem_de_servico');
  dmDBEXMaster.fdqOS_Produto.SQL.Add('where ordem_de_servico in (select ordem_servico from itens_os_pecas where codigo_peca = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value) + ')');
  dmDBEXMaster.fdqOS_Produto.SQL.Add('and data_termino is null');
  dmDBEXMaster.fdqOS_Produto.SQL.Add('order by ordem_de_servico');

  dmMProvider.cdsOS_Produto.Open;
  dmMProvider.cdsOS_Produto.ProviderName := '';

  RelacionarIOS_produto;

end;

procedure TfrmProdutos.RelacionarPrecoQuantidade;
begin

  dmMProvider.cdsPrecoQuantidade.Close;
  dmMProvider.cdsPrecoQuantidade.ProviderName := 'dspPrecoQuantidade';

  dmDBEXMaster.fdqPrecoQuantidade.Close;
  dmDBEXMaster.fdqPrecoQuantidade.SQL.Clear;
  dmDBEXMaster.fdqPrecoQuantidade.SQL.Add('SELECT * FROM PRECO_QUANTIDADE');
  dmDBEXMaster.fdqPrecoQuantidade.SQL.Add('WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.AsInteger));
  dmDBEXMaster.fdqPrecoQuantidade.Open;

  dmMProvider.cdsPrecoQuantidade.Open;
  dmMProvider.cdsPrecoQuantidade.ProviderName := '';

end;

procedure TfrmProdutos.RelacionarSubGrupo;
begin

  dmMProvider.cdsSubGrupo.Close;
  dmMProvider.cdsSubGrupo.ProviderName := 'dspSubGrupo';

  dmDBEXMaster.fdqSubGrupo.SQL.Clear;
  dmDBEXMaster.fdqSubGrupo.SQL.Add('SELECT * FROM SUBGRUPO');
  dmDBEXMaster.fdqSubGrupo.SQL.Add('WHERE SUBGRUPO = ' + IntToStr(dmMProvider.cdsProdutosSUBGRUPO.Value));
  dmDBEXMaster.fdqSubGrupo.SQL.Add('AND GRUPO = ' + IntToStr(dmMProvider.cdsProdutosGRUPO.Value));

  dmMProvider.cdsSubGrupo.Open;
  dmMProvider.cdsSubGrupo.ProviderName := '';

  if not InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutos.Edit;

//  dmMProvider.cdsProdutosNOME_SUBGRUPO.Value := dmMProvider.cdsSubGrupoNOME.Value;

  if InserindoEditando(dmMProvider.cdsProdutos) then
    dmMProvider.cdsProdutos.Post;

end;

procedure TfrmProdutos.RelacionarTabProdFilial(pProduto, pFilial:integer);
begin

  dmMProvider.cdsProdutoFilial.Close;
  dmMProvider.cdsProdutoFilial.ProviderName := 'dspProdutoFilial';

  dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(pProduto));
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('and filial = ' + IntToStr(pFilial));

  dmMProvider.cdsProdutoFilial.Open;
  dmMProvider.cdsProdutoFilial.ProviderName := '';
end;

procedure TfrmProdutos.RelacionarUltimaNFEntrada;
begin

  dmMProvider.cdsUltimaNFEntradaProduto.Close;
  dmMProvider.cdsUltimaNFEntradaProduto.ProviderName := 'dspUltimaNFEntradaProduto';

  dmDBEXMaster.fdqUltimaNFEntradaProduto.SQL.Clear;
  dmDBEXMaster.fdqUltimaNFEntradaProduto.SQL.Add('select first 1 max(entrada) as entrada, emissao , nfentrada, notafiscal');
  dmDBEXMaster.fdqUltimaNFEntradaProduto.SQL.Add('from nfentrada');
  dmDBEXMaster.fdqUltimaNFEntradaProduto.SQL.Add('where nfentrada in (select nfentrada from itemnfentrada where itemnfentrada.produto = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value) + ')');
  dmDBEXMaster.fdqUltimaNFEntradaProduto.SQL.Add('group by emissao, nfentrada, notafiscal');
  dmDBEXMaster.fdqUltimaNFEntradaProduto.SQL.Add('ORDER BY entrada DESC');

  dmMProvider.cdsUltimaNFEntradaProduto.Open;
  dmMProvider.cdsUltimaNFEntradaProduto.ProviderName := '';

  dmMProvider.cdsItemUltimaNF.Close;
  dmMProvider.cdsItemUltimaNF.ProviderName := 'dspItemUltimaNF';

  dmDBEXMaster.fdqItemUltimaNF.SQL.Clear;
  dmDBEXMaster.fdqItemUltimaNF.SQL.Add('select * from itemnfentrada');
  dmDBEXMaster.fdqItemUltimaNF.SQL.Add('where nfentrada = ' + IntToStr(dmMProvider.cdsUltimaNFEntradaProdutoNFENTRADA.Value));
  dmDBEXMaster.fdqItemUltimaNF.SQL.Add('and produto = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));

  dmMProvider.cdsItemUltimaNF.Open;
  dmMProvider.cdsItemUltimaNF.ProviderName := '';

end;

procedure TfrmProdutos.RemarcarSimilares;
begin

  if dmMProvider.cdsProdutosSIMILAR.Value > 0 then
  begin

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT COUNT(*) AS TOTAL FROM PRODUTO WHERE "SIMILAR" = ' + IntToStr(dmMProvider.cdsProdutosSIMILAR.Value));
    dmDBEXMaster.fdqMasterPesquisa.Open;

    if not dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
    begin

      if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', confirma a remarca��o de: ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('TOTAL').AsInteger)
                                  + ' produtos similares em pre�o'), 'Aten��o!',  mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
      begin

        if dmMProvider.cdsConfiguracoesVER_SIMILAR_PARA_ALTERAR.Value = 1 then
        begin

          dmMProvider.cdsSimilar.Close;
          dmMProvider.cdsSimilar.ProviderName := 'dspSimilar';

          dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT PRODUTO.PRODUTO, PRODUTO."SIMILAR", PRODUTO.UNIDADE,PRODUTO.DESCRICAO,PRODUTOFILIAL.PRECODEVENDA FROM PRODUTO PRODUTO');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('JOIN PRODUTOFILIAL PRODUTOFILIAL');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ON (PRODUTOFILIAL.PRODUTO = PRODUTO.PRODUTO)');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE PRODUTO."SIMILAR" = ' + IntToStr(dmMProvider.cdsProdutosSIMILAR.Value));
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ORDER BY PRODUTO.DESCRICAO');

          dmMProvider.cdsSimilar.Open;
          dmMProvider.cdsSimilar.ProviderName := '';

          frmMostrarSimilar := TfrmMostrarSimilar.Create(self); ;

          frmMostrarSimilar.ShowModal;
          FreeAndNil(frmMostrarSimilar);

        end;

        FormatSettings.DecimalSeparator           := '.';

        dmMSProcedure.fdspMaster.StoredProcName   := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;

        dmMSProcedure.fdspMaster.Params[0].Value  := 'UPDATE PRODUTOFILIAL SET PRECODEVENDAANTERIOR = PRECODEVENDA WHERE PRODUTO IN (SELECT PRODUTO FROM PRODUTO WHERE "SIMILAR" = ' + IntToStr(dmMProvider.cdsProdutosSIMILAR.AsInteger) + ')';
        dmMSProcedure.fdspMaster.ExecProc;

        dmMSProcedure.fdspMaster.Params[0].Value  := 'UPDATE PRODUTOFILIAL SET PRECODEVENDA = ' + FloatToStr(dmMProvider.cdsProdutoFilialPRECODEVENDA.AsCurrency) + 'WHERE PRODUTO IN (SELECT PRODUTO FROM PRODUTO WHERE "SIMILAR" = ' + IntToStr(dmMProvider.cdsProdutosSIMILAR.AsInteger) + ')';
        dmMSProcedure.fdspMaster.ExecProc;

        FormatSettings.DecimalSeparator           := ',';

        MessageBox(Application.handle, pchar(dmDBEXMaster.sNomeUsuario + #13 + 'Atualiza��o efetuada com sucesso!'), 'Informa��o', mb_ok + mb_IconInformation);

      end;

    end;

  end;

end;

procedure TfrmProdutos.tvsInfoAdicionaisShow(Sender: TObject);
begin

  if dmMProvider.cdsProdutos.Active then
  begin

    if not dmMProvider.cdsProdutos.IsEmpty then
      RelacionarPrecoQuantidade;

    grpInfoFilial.Enabled := not dmMProvider.cdsProdutos.IsEmpty;

  end;

end;

function TfrmProdutos.ValidarCamposObrigatorios(pRegimeTributario: smallint)
  : boolean;
begin

  if pRegimeTributario > 0 then
  begin

    Result := true;

    if dmMProvider.cdsProdutoFilialPRECODEVENDA.Value = 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 1;
      edtPrecoVenda.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosCST.Value = '' then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 1;
      edtCST.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosNCM.Value = '' then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 1;
      edtNCM_TIPI.SetFocus;
      Result                      := False;

    end
    else if Length(Trim(dmMProvider.cdsProdutosNCM.Value)) <> 8 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_TAMANHO_MINIMO;
      pgcProduto.ActivePageIndex  := 1;
      edtNCM_TIPI.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosTRIBUTACAO.Value <= 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 1;
      edtTributacao.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosCST_PIS_ENTRADA.Value <= 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 2;
      cboCST_PIS_ENTRADA.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosCST_PIS.Value <= 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 2;
      cboCST_PIS_SAIDA.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosCST_COFINS_ENTRADA.Value <= 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 2;
      cboCST_COFINS_ENTRADA.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosCST_COFINS.Value <= 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 2;
      cboCST_COFINS_SAIDA.SetFocus;
      Result                      := False;

    end
    else if dmMProvider.cdsProdutosORIGEM_MERCADORIA.Value < 0 then
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      pgcProduto.ActivePageIndex  := 2;
      cboOrigemMercadoria.SetFocus;
      Result                      := False;

    end
    else
      LimparMsgErro;

  end;

end;

function TfrmProdutos.ValidarUsuarioMaster: boolean;
begin

  Result := false;

  dmMProvider.cdsUsuarios.Close;
  dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';

  dmDBEXMaster.fdqUsuarios.SQL.Clear;
  dmDBEXMaster.fdqUsuarios.SQL.Add('select * from usuarios');
  dmDBEXMaster.fdqUsuarios.SQL.Add('where login = ' + QuotedStr(dmDBEXMaster.sNomeUsuario));

  dmMProvider.cdsUsuarios.Open;
  dmMProvider.cdsUsuarios.ProviderName := '';

  if not dmMProvider.cdsUsuarios.IsEmpty then
    Result := (dmMProvider.cdsUsuariosSUPER_USUARIO.AsInteger = 1);

end;

function TfrmProdutos.Validar_NCM: boolean;
begin

  Result := (Length(Trim(dmMProvider.cdsProdutosNCM.Value)) = 8);

  if Length(Trim(dmMProvider.cdsProdutosNCM.Value)) <= 0 then
  begin

    lblMsg.Caption  := MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    edtNCM_TIPI.SetFocus;
    Result          :=  False;

  end
  else if Length(Trim(dmMProvider.cdsProdutosNCM.Value)) <> 8 then
  begin

    lblMsg.Caption  := MSG_TAMANHO_MINIMO;
    Application.ProcessMessages;
    edtNCM_TIPI.SetFocus;
    Result          :=  False;

  end
  else
  begin

    dmMProvider.cdsNcmNbs.Close;
    dmMProvider.cdsNcmNbs.ProviderName := 'dspNcmNbs';

    dmDBEXMaster.fdqNcmNbs.SQL.Clear;
    dmDBEXMaster.fdqNcmNbs.SQL.Add('SELECT * FROM NBM_NCM');
    dmDBEXMaster.fdqNcmNbs.SQL.Add('WHERE COD_NCM = ' + QuotedStr(edtNCM_TIPI.Text));

    if dmMProvider.cdsProdutosCF_IPI.Value > 0 then
      dmDBEXMaster.fdqNcmNbs.SQL.Add(' AND EX_TIPI = ' + QuotedStr(FormatFloat('00', dmMProvider.cdsProdutosCF_IPI.Value)));

    dmMProvider.cdsNcmNbs.Open;
    dmMProvider.cdsNcmNbs.ProviderName := '';

    if dmMProvider.cdsNcmNbs.IsEmpty then
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_NCM_NVIGENTE;
      edtNCM_TIPI.SetFocus;
      Result          :=  False;

    end
    else
      Result := True;

  end;

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor; AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState,
      ACol, ARow)

end;

end.

