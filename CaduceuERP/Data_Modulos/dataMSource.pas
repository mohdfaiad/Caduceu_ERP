unit dataMSource;

interface

uses
  System.SysUtils, System.Classes, Data.DB;

type
  TdmMSource = class(TDataModule)
    dtsEstados: TDataSource;
    dtsCidades: TDataSource;
    dtsFilial: TDataSource;
    dtsUsuarios: TDataSource;
    dtsConfiguracoes: TDataSource;
    dtsAltGAC: TDataSource;
    dtsCFOP_CFPS: TDataSource;
    dtsFuncionarios: TDataSource;
    dtsModelo_Doc: TDataSource;
    dtsConfigECF: TDataSource;
    dtsModEtqGond: TDataSource;
    dtsAdministradoras: TDataSource;
    dtsContaCorente: TDataSource;
    dtsCtrlCartoes: TDataSource;
    dtsTotaisCtrlCartaoes: TDataSource;
    dtsSelBaixaCartao: TDataSource;
    dtsTabelasSped: TDataSource;
    dtsNFEntrada: TDataSource;
    dtsFornecedor: TDataSource;
    dtsParcelasNFE: TDataSource;
    dtsCFOP_NFEntrada: TDataSource;
    dtsSituacao_Doc: TDataSource;
    dtsItem_NFEntrada: TDataSource;
    dtsConhecimentoFrete: TDataSource;
    dtsTipoCTE: TDataSource;
    dtsPlanoContas: TDataSource;
    dtsItemPlContas: TDataSource;
    dtsLancamentos: TDataSource;
    dtsDesdobRentabil: TDataSource;
    dtsProdutoFilial: TDataSource;
    dtsSubGrupo: TDataSource;
    dtsGrupo: TDataSource;
    dtsSecao: TDataSource;
    dtsTipoItem: TDataSource;
    dtsTributacao: TDataSource;
    dtsRegistro50: TDataSource;
    dtsRegistro54: TDataSource;
    dtsCLD_NFE: TDataSource;
    dtsRegInventarioP7: TDataSource;
    dtsSituacoes_OS: TDataSource;
    dtsEquipamentos: TDataSource;
    dtsClientes: TDataSource;
    dtsOrdemServico: TDataSource;
    dtsGarantidor: TDataSource;
    dtsFSituacaoPesq_OS: TDataSource;
    dtsItens_OS_Servico: TDataSource;
    dtsItens_OS_Peca: TDataSource;
    dtsAgenda: TDataSource;
    dtsServicos: TDataSource;
    dtsHistorico_OS: TDataSource;
    dtsSituacoesOS_ENC: TDataSource;
    dtsFormasPagamento: TDataSource;
    dtsPerdas: TDataSource;
    dtsItensPerdas: TDataSource;
    dtsParcelasOS: TDataSource;
    dtsDiasFormaPagto: TDataSource;
    dtsProducao: TDataSource;
    dtsItemProducao: TDataSource;
    dtsPesqProdutos: TDataSource;
    dtsOrdemCompra: TDataSource;
    dtsPaises: TDataSource;
    dtsMenuAtalhos: TDataSource;
    dtsAlmoxarifado: TDataSource;
    dtsItemAlmoxarifado: TDataSource;
    dtsCfgConexaoZeusRetail: TDataSource;
    dtsEnderecoEntPedZeus: TDataSource;
    dtsItemPedidoZeus: TDataSource;
    dtsFinalizadoraPedZeus: TDataSource;
    dtsPedidoZeus: TDataSource;
    dtsUnidadeMedida: TDataSource;
    dtsParcelasPedZeus: TDataSource;
    dtsCaixaLoja: TDataSource;
    dtsItemCaixaLoja: TDataSource;
    dtsValorPrazoPedido: TDataSource;
    dtsParcelamentoCX: TDataSource;
    dtsParcelasCRE_TEMP_CX: TDataSource;
    dtsNCM_NBS: TDataSource;
    dtsConfigBuscaCEP: TDataSource;
    dtsOrdemProducao: TDataSource;
    dtsItemOrdemProducao: TDataSource;
    dtsCliente_Entrega: TDataSource;
    dtsNFSaida: TDataSource;
    dtsItemNFSaida: TDataSource;
    dtsCFOP_NFSaida: TDataSource;
    dtsParcelasNFS: TDataSource;
    dtsTransportadoraNFS: TDataSource;
    dtsExportacaoNFS: TDataSource;
    dtsDocumentoRef_NFS: TDataSource;
    dtsEndRetiradaNFS: TDataSource;
    dtsEndEntregaNFS: TDataSource;
    dtsOrigemMercadoria: TDataSource;
    dtsCST_PIS: TDataSource;
    dtsCST_COFINS: TDataSource;
    dtsPesqClientes: TDataSource;
    dtsParametros_NFE: TDataSource;
    dtsDetalhesCupomRefNFS_TEMP: TDataSource;
    dtsInventario: TDataSource;
    dtsCCe: TDataSource;
    dtsCupomFiscalRefNFS: TDataSource;
    dtsFCP_Estados: TDataSource;
    dtsNFSaidaRefer: TDataSource;
    dtsLivroFiscalEntrada: TDataSource;
    dtsLivroFiscalSaida: TDataSource;
    dtsPrecoQuantidade: TDataSource;
    dtsUltimaNFEntradaProduto: TDataSource;
    dtsIOS_Produto: TDataSource;
    dtsOS_Produto: TDataSource;
    dtsItemUltimaNF: TDataSource;
    dtsBarras: TDataSource;
    dtsTeclado_Balanca: TDataSource;
    dtsSetordeBalanca: TDataSource;
    dtsReceitaProduto: TDataSource;
    dtsProdutos: TDataSource;
    dtsConsultaAgenda: TDataSource;
    dtsFretePedidovenda: TDataSource;
    dtsConfig_financeiro: TDataSource;
    dtsDeslocamentoOS: TDataSource;
    dtsCST_PIS_ENT: TDataSource;
    dtsCST_PIS_SAI: TDataSource;
    dtsCST_COFINS_ENT: TDataSource;
    dtsCST_COFINS_SAI: TDataSource;
    dtsCtrlNotas: TDataSource;
    dtsTipoUtilCtrlNotas: TDataSource;
    dtsSetorCtrlNotas: TDataSource;
    dtsRefFornecedor: TDataSource;
    dtsCtrlModulos: TDataSource;
    dtsParamIntegraPDV: TDataSource;
    dtsSped_R0500: TDataSource;
    dtsParticipantes: TDataSource;
    dtsRegimeTributario: TDataSource;
    dtsTipoLogradouro: TDataSource;
    dtsUltimaNFForn: TDataSource;
    dtsUltimaNFSaidaPart: TDataSource;
    dtsUltimaOCPart: TDataSource;
    dtsSelecionaTabelaLOG: TDataSource;
    dtsLogSys: TDataSource;
    procedure dtsCLD_NFEStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMSource: TdmMSource;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dataMProvider, dataDBEXMaster;

{$R *.dfm}

procedure TdmMSource.dtsCLD_NFEStateChange(Sender: TObject);
begin

  if dtsCLD_NFE.DataSet.State in [dsInsert] then
    dtsCLD_NFE.DataSet.Cancel;

end;

end.
