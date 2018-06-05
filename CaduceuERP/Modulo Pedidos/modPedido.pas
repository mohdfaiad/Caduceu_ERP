unit modPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.Actions, Vcl.ActnList,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.jpeg, db, JvExComCtrls, JvDateTimePicker,
  JvDBDateTimePicker, Vcl.Menus;

const

 InputBoxMsg = WM_USER + 123;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmPedido = class(TForm)
    pgcPedido: TPageControl;
    tbsTabela: TTabSheet;
    tdsCadastro: TTabSheet;
    grdTabela: TDBGrid;
    imgImprimir: TImage;
    imgConfirmar: TImage;
    imgNovo: TImage;
    imgDesfazer: TImage;
    lblF3: TLabel;
    imgSalvar: TImage;
    imgSair: TImage;
    lblF2: TLabel;
    lblF4: TLabel;
    imgEditar: TImage;
    lblF6: TLabel;
    imgExcluir: TImage;
    lblF5: TLabel;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    rdgOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    edtConteudoPesquisa: TEdit;
    imgPesqAtendente: TImage;
    actPedido: TActionList;
    actIncluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actEditar: TAction;
    actSair: TAction;
    actImprimir: TAction;
    grpDadosPedido: TGroupBox;
    gpItensPedido: TGroupBox;
    grpEnderecoEntrega: TGroupBox;
    grpFinalizadoras: TGroupBox;
    lblNumeroPedido: TLabel;
    edtNumeroPedido: TDBEdit;
    lblEmissao: TLabel;
    lblLocalSaiMercadoria: TLabel;
    lblDataEntrega: TLabel;
    lblHorarioPedido: TLabel;
    lblVendedor: TLabel;
    lblCliente: TLabel;
    rdgEntrega: TDBRadioGroup;
    edtEmissao: TDBEdit;
    edtVendedor: TDBEdit;
    edtCliente: TDBEdit;
    edtNomeVendedor: TDBEdit;
    edtNomeCliente: TDBEdit;
    edtHorarioPedido: TDBEdit;
    cboOramentoPedido: TComboBox;
    grpObservacoes: TGroupBox;
    memObservacoes: TDBMemo;
    grpTotalizacaoPedido: TGroupBox;
    lblTotalMercadorias: TLabel;
    lblValorPedido: TLabel;
    lblValorAcrescimoST: TLabel;
    lblValorDescontoST: TLabel;
    lblValidadePedido: TLabel;
    edtValoMercadorias: TDBEdit;
    edtValorDesconto: TDBEdit;
    edtValorAcrescimo: TDBEdit;
    edtValorPedido: TDBEdit;
    grpDigitacaoItens: TGroupBox;
    grdItens: TDBGrid;
    grpCodigoItem: TGroupBox;
    groQuantidaItem: TGroupBox;
    grpValorUnitItem: TGroupBox;
    grpValorDescontoItem: TGroupBox;
    groValorAcrescimoItem: TGroupBox;
    grpValorTotalItem: TGroupBox;
    grpDescricaoUnidade: TGroupBox;
    edtCodigoItem: TEdit;
    edtDescricaoItem: TEdit;
    edtQuantidadeItem: TEdit;
    edtValorUnitarioItem: TEdit;
    edtValorDescontoItem: TEdit;
    edtValorAcrescimoItem: TEdit;
    edtSubTotalItem: TEdit;
    edtUnidadeItem: TEdit;
    cboLocalSaidaMercadoria: TDBLookupComboBox;
    lblEnderecoEntrega: TLabel;
    lblNumeroEntrega: TLabel;
    lblCep: TLabel;
    lblBairroEntrega: TLabel;
    lblCidadeEntrega: TLabel;
    lblEstadoEntrega: TLabel;
    lblComplementoEntega: TLabel;
    lblTelefone: TLabel;
    edtEnderecoEntrega: TDBEdit;
    edtNumeroEntrega: TDBEdit;
    edtCepEntrega: TDBEdit;
    edtBairroEntrega: TDBEdit;
    edtCidadeEntrega: TDBEdit;
    edtEstadoEntrega: TDBEdit;
    edtComplementoEntrega: TDBEdit;
    edtTelefoneEntrega: TDBEdit;
    grdFinaliuzadora: TDBGrid;
    lblFpagto: TLabel;
    lblValorFinalizadora: TLabel;
    edtValorFinaliz: TEdit;
    imgPesqVendedor: TImage;
    imgPesqCliente: TImage;
    cboFormaPagamento: TDBLookupComboBox;
    lblTotalRecebimentos: TLabel;
    edtTotalRecebido: TDBEdit;
    actExluirFinalizPedido: TAction;
    actExcluirItemPedidoZeus: TAction;
    actConfirmarLanRT: TAction;
    imgAConfirmar: TImage;
    imgConfirmado: TImage;
    imgStatus: TImage;
    actIntegracaoPedidoZeus: TAction;
    grpSaldoAtual: TGroupBox;
    edtSaldoAtual: TEdit;
    imgPesquisaItem: TImage;
    dtpDataEntrega: TJvDBDateTimePicker;
    imgAguardando: TImage;
    mnuItemPedido: TPopupMenu;
    mnuMarcarEntrega: TMenuItem;
    mnuMarcarComoReservadoMARCARCOMORESERVADO1: TMenuItem;
    txtEntregaRetirado: TDBText;
    txtReservadoi: TDBText;
    lblCadastroItem: TLabel;
    lblAutorizaDesconto: TLabel;
    imgPesquisaProduto: TImage;
    imgHistoricoCliente: TImage;
    edtValidadePedido: TDBEdit;
    edtNomeClienteEntrega: TDBEdit;
    lblNomeClienteEntrega: TLabel;
    grpPercDescontoIten: TGroupBox;
    edtpercentualDescItem: TEdit;
    edtPercDescontoST: TEdit;
    Label1: TLabel;
    imgAlertaPAF: TImage;
    actFrete: TAction;
    imgFrete: TImage;
    procedure FormCreate(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure rdgOpcoesPesquisaClick(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure edtNumeroPedidoChange(Sender: TObject);
    procedure imgPesqVendedorClick(Sender: TObject);
    procedure imgPesqClienteClick(Sender: TObject);
    procedure edtQuantidadeItemExit(Sender: TObject);
    procedure edtValorUnitarioItemExit(Sender: TObject);
    procedure edtValorDescontoItemExit(Sender: TObject);
    procedure edtValorAcrescimoItemExit(Sender: TObject);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure edtValidadePedidoExit(Sender: TObject);
    procedure edtVendedorExit(Sender: TObject);
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure rdgEntregaClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtCodigoItemExit(Sender: TObject);
    procedure edtValorFinalizExit(Sender: TObject);
    procedure grdItensDblClick(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeItemKeyPress(Sender: TObject; var Key: Char);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cboFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure grdFinaliuzadoraDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cboFormaPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actCancelarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure grdFinaliuzadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExluirFinalizPedidoExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExcluirItemPedidoZeusExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure memObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure actConfirmarLanRTExecute(Sender: TObject);
    procedure tdsCadastroShow(Sender: TObject);
    procedure cboOramentoPedidoCloseUp(Sender: TObject);
    procedure actIntegracaoPedidoZeusExecute(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure imgImprimirClick(Sender: TObject);
    procedure imgPesquisaItemClick(Sender: TObject);
    procedure grdFinaliuzadoraDblClick(Sender: TObject);
    procedure mnuItemPedidoPopup(Sender: TObject);
    procedure mnuMarcarEntregaClick(Sender: TObject);
    procedure mnuMarcarComoReservadoMARCARCOMORESERVADO1Click(Sender: TObject);
    procedure ResetaUsuario_Autorizou;
    procedure imgPesquisaProdutoClick(Sender: TObject);
    procedure edtVendedorEnter(Sender: TObject);
    procedure edtNomeClienteEntregaEnter(Sender: TObject);
    procedure edtNomeClienteEntregaExit(Sender: TObject);
    procedure edtpercentualDescItemExit(Sender: TObject);
    procedure edtPercDescontoSTExit(Sender: TObject);
    procedure edtCodigoItemKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure actFreteExecute(Sender: TObject);
    procedure rdgEntregaChange(Sender: TObject);
    procedure cboFormaPagamentoExit(Sender: TObject);
  private
    { Private declarations }
    cValorUnitario, cPercentual, cDiferenca:currency;
    iProduto:integer;
    sBarras, sBarrasZeus, sUsuario_autorizou, sSenha:string;
    bAutorizaDesconto, bAutorizouEstorno:boolean;
    procedure InputBoxSet(var Msg: TMessage); message InputBoxMsg;
    procedure LimparMsgErro;
    procedure CalcularSubTotal;
    procedure HabilitarDesabilitarControles(pOpcao:boolean);
    procedure RelacionarItemsPedido(pPedido,pFilial:integer);
    procedure RelacionarEndEntregaPedido(pPedido,pFilial:integer);
    procedure RelacionarFinalizadoraPedido(pPedido,pFilial:integer);
    procedure RelacionarFretePedido(pPedido, pFilial:integer);
    procedure RelacionarAliquotaICMS(pTributacao:integer);
    function Man_Tab_Pedido_Zeus(pOpcao:smallint):boolean;
    function Man_Tab_ItemPedido(pOpcao:smallint):boolean;
    function Man_Tab_ItemPedido_RD(pOpcao:smallint):boolean;
    function Man_Tab_ItemPedido_RA(pOpcao:smallint):boolean;
    function Man_Tab_EndEntregaPedido(pOpcao:smallint):boolean;
    function Man_Tab_ClienteEntrega:boolean;
    function Man_Tab_finalizadorasPedido(pOpcao:smallint):boolean;
    procedure CarregarInfItens;
    function Man_Tab_Frete(pOpcao:smallint):boolean;
    procedure LimparControlesItem;
    function AbrirTabelaPedidoZeus(pOpcao:smallint; pConteudo:string):boolean;
    procedure AbrirTabelas;
    procedure IncluirEndEntrega;
    procedure CalcularTotalPedido;
    function pesquisa_pedido_zeus(pLoja, pPedido:integer):boolean;
    function pesquisa_item_pedido_zeus(pLoja, pPedido, pItemPedido:integer):boolean;
    function pesquisa_end_entrega(pLoja, pPedido:integer):boolean;
    function pesquisa_Finaliz_pedido(pLoja, pPedido:integer; pFinaliz:string): boolean;
    procedure CalcularParcelasPedido;
    procedure CorrigeValorDocumento(pValor: currency; pDocumento: integer; pVencimento: TDateTime);
    function Lancar_CRE(pOpcao:smallint):boolean;
    function ConsisteValorRecebido_TotalPedido:boolean;
    function ConsisteCliente_FPG_Prazo:boolean;
    function ValidarUsuario(pUsuario, pSenha:string):boolean;
    procedure HabilitaDesabilitaInfoEntrega(pOpcao:boolean; pCor: TColor);
    procedure RatearDesconto(pDesconto, cValorDesconto:currency);
    procedure RatearAcrescimo(pAcrescimo, cValorAcrescimo:currency);
    function PesquisarMercadoriaZes(pMerdadoria:string):boolean;
    function PesquisarMercadoriaDJPdv(pMerdadoria:string):boolean;
    function ValidarFreteClientePedido:boolean;
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes, modPesquisaFuncionario,
  modPesqCliente, modPesquisaProduto, modParcelasPedido, datamZeus,
  modSelecionaClienteEntrega, modFreteBalcao, modPreVenda_DJPDV, dataMDJPdv;

function TfrmPedido.AbrirTabelaPedidoZeus(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;
begin

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_PedidoZeus(pOpcao,pConteudo);

  dmMProvider.cdsPedidoZeus.Close;
  dmMProvider.cdsPedidoZeus.ProviderName := 'dspPedidoZeus';

  dmDBEXMaster.fdqPedidoZeus.SQL.Clear;
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('select ped.*, cli.razaosocial, cli.enderecoentrega, cli.numeroentrega, cli.cepentrega,');
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('cli.complemento, cli.estadoentrega, cli.ddd, cli.telefone1, cli.bairroentrega, cli.cnpj,');
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('cid.nome as cidade_entrega from pedido_venda_zeus ped');
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('left join clientes cli');
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('on(cli.cliente = ped.cliente)');
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('left join cidades cid');
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('on(cid.cidade =  cli.cidadeentrega)');

  dmDBEXMaster.fdqPedidoZeus.SQL.Add(sWhere);
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('order by ped.pedido');

  try


    dmMProvider.cdsPedidoZeus.Open;
    dmMProvider.cdsPedidoZeus.ProviderName := '';

    if (dmMProvider.cdsPedidoZeus.IsEmpty) and (pConteudo <> '-1') and (pOpcao < 3) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - Pedido: ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsPedidoZeus.IsEmpty;

   except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmPedido.AbrirTabelas;
begin

  dmMProvider.cdsFuncionarios.Close;
  dmMProvider.cdsFuncionarios.ProviderName := 'dspFuncionarios';

  dmDBEXMaster.fdqFuncionarios.SQL.Clear;
  dmDBEXMaster.fdqFuncionarios.SQL.Add('select * from funcionario');

  dmMProvider.cdsFuncionarios.Open;
  dmMProvider.cdsFuncionarios.ProviderName := '';

  dmMProvider.cdsFormasPagamento.Close;
  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where tipooperacao = 1');
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('and codigoecf <> ' + QuotedStr('00'));
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('order by nome');

  dmMProvider.cdsFormasPagamento.Open;
  dmMProvider.cdsFormasPagamento.ProviderName := '';

  dmMProvider.cdsParamIntegraPDV.Close;
  dmMProvider.cdsParamIntegraPDV.ProviderName := 'dspParamIntegraPDV';

  dmDBEXMaster.fdqParamIntegraPDV.SQL.Clear;
  dmDBEXMaster.fdqParamIntegraPDV.SQL.Add('select * from parametro_integra_pdv');
  dmDBEXMaster.fdqParamIntegraPDV.SQL.Add('where modelo_pdv = ' + IntToStr(dmMProvider.cdsConfiguracoesMODELOPDV.Value));

  dmMProvider.cdsParamIntegraPDV.Open;
  dmMProvider.cdsParamIntegraPDV.ProviderName := '';

end;

procedure TfrmPedido.actCancelarExecute(Sender: TObject);
begin

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
    dmMProvider.cdsPedidoZeus.cancel;

  if dmMProvider.cdsItemPedZeus.State in [dsEdit, dsInsert] then
    dmMProvider.cdsItemPedZeus.cancel;

  if dmMProvider.cdsEndEntregaPedZeus.State in [dsEdit, dsInsert] then
    dmMProvider.cdsEndEntregaPedZeus.cancel;

  if dmMProvider.cdsFinalizadoraPedZeus.State in [dsEdit, dsInsert] then
    dmMProvider.cdsFinalizadoraPedZeus.cancel;

  LimparControlesItem;

  HabilitarDesabilitarControles(False);

  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmPedido.actConfirmarLanRTExecute(Sender: TObject);
begin

{  LimparMsgErro;

  dmDBEXMaster.fdcMaster.StartTransaction();
  FormatSettings.DecimalSeparator := '.';

  try

    dmDBEXMaster.fdcMaster.StartTransaction;

    dmMProvider.cdsItemPedZeus.First;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;

    if dmMProvider.cdsPedidoZeusSITUACAO.Value = 0 then
    begin

      CalcularParcelasPedido;

      frmParcelasPedido := TfrmParcelasPedido.Create(self);
      if frmParcelasPedido.ShowModal = mrOk then
      begin

        if Lancar_CRE(0) then
        begin

          while not dmMProvider.cdsItemPedZeus.Eof do
          begin


            dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTOFILIAL SET SALDO_ALMOXARIFADO =  SALDO_ALMOXARIFADO - ' + FloatToStr(dmMProvider.cdsItemPedZeusQUANTIDADE.Value)
                                                              + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItemPedZeusPRODUTO.Value)
                                                              + ' AND FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

            dmMSProcedure.fdspMaster.ExecProc;
            dmMProvider.cdsItemPedZeus.Next;

          end;

          dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 1 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
          dmMSProcedure.fdspMaster.ExecProc;

          dmMProvider.cdsPedidoZeus.Edit;
          dmMProvider.cdsPedidoZeusSITUACAO.Value := 1;
          dmMProvider.cdsPedidoZeus.Post;

          imgStatus.Picture := imgAguardando.Picture;

        end;

      end;

      FreeAndNil(frmParcelasPedido);


    end
    else
    begin

      dmMProvider.AbrirTabelaParcelasPedidoZeus(dmMProvider.cdsPedidoZeusPEDIDO.Value, 0);

      if Lancar_CRE(1) then
      begin

        while not dmMProvider.cdsItemPedZeus.Eof do
        begin

          dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTOFILIAL SET SALDO_ALMOXARIFADO =  SALDO_ALMOXARIFADO + ' + FloatToStr(dmMProvider.cdsItemPedZeusQUANTIDADE.Value)
                                                            + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItemPedZeusPRODUTO.Value)
                                                            + ' AND FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

          dmMSProcedure.fdspMaster.ExecProc;
          dmMProvider.cdsItemPedZeus.Next;

        end;

        dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 0 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
        dmMSProcedure.fdspMaster.ExecProc;

        dmMProvider.cdsPedidoZeus.Edit;
        dmMProvider.cdsPedidoZeusSITUACAO.Value := 0;
        dmMProvider.cdsPedidoZeus.Post;

        // elimina todas as parcelas que possam existir na tabela
        // parcelas
        dmMSProcedure.fdspParcelasPedidoZeus.Params[0].Value    := 1;
        dmMSProcedure.fdspParcelasPedidoZeus.Params[1].Value    := dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value;
        dmMSProcedure.fdspParcelasPedidoZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
        dmMSProcedure.fdspParcelasPedidoZeus.Params[3].Value    := dmMProvider.cdsParcelasPedZeusFORMA_PAGAMENTO.Value;
        dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value    := dmMProvider.cdsParcelasPedZeusVENCIMENTO.Value;
        dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value    := dmMProvider.cdsParcelasPedZeusVALOR.Value;
        dmMSProcedure.fdspParcelasPedidoZeus.ExecProc;

        imgStatus.Picture := imgAConfirmar.Picture;

      end;

    end;

    dmDBEXMaster.fdcMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;
    dmDBEXMaster.fdcMaster.Open;

    FormatSettings.DecimalSeparator := ',';

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario+ ', ' + Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

  HabilitarDesabilitarControles(False);

  edtConteudoPesquisa.SetFocus;
 }
end;

procedure TfrmPedido.actEditarExecute(Sender: TObject);
begin

  LimparMsgErro;

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    if dmMProvider.cdsPedidoZeusSITUACAO.Value = 0 then

    begin

      pgcPedido.Pages[1].TabVisible := True;
      pgcPedido.ActivePageIndex     := 1;
      HabilitarDesabilitarControles(True);
      dmMProvider.cdsPedidoZeus.Edit;
      edtVendedor.SetFocus;

//      if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
//        grdItens.PopupMenu := mnuItemPedido;

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmPedido.actExcluirExecute(Sender: TObject);
var
  iPedido:integer;
  sUsuario, sSenha:string;
begin

  LimparMsgErro;

  iPedido := dmMProvider.cdsPedidoZeusPEDIDO.Value;

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    sUsuario := '';
    sSenha   := sUsuario;

    sUsuario := InputBox('Seguran�a','INFORME O NOME DO USU�RIO: ','');

    if Length(Trim(sUsuario)) > 0 then
    begin

      PostMessage(Handle, InputBoxMsg, 0, 0);

      sSenha := InputBox('Seguran�a','INFORME A SENHA DO USUARIO: ','');

      if length(Trim(sSenha)) > 0 then
      begin

        if not ValidarUsuario(UpperCase(sUsuario), sSenha) then
          exit;

      end;

    end;

    //exclui finalizadora no banco do zeus
    dmMProvider.cdsFinalizadoraPedZeus.First;

    while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
    begin

      if pesquisa_Finaliz_pedido(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value) then
        dmMZeus.cdsIntFinalizPedZeus.Delete;

      dmMProvider.cdsFinalizadoraPedZeus.Next;

    end;

    if Man_Tab_finalizadorasPedido(1) then
    begin

      RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

      //excluir informa��es de entrega no banco do zeus
      dmMProvider.cdsEndEntregaPedZeus.First;
      while not dmMProvider.cdsEndEntregaPedZeus.Eof do
      begin

        if pesquisa_end_entrega(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
          dmMZeus.cdsIntEndEntregaZeus.Delete;

        dmMProvider.cdsEndEntregaPedZeus.Next;

      end;

      if Man_Tab_EndEntregaPedido(1) then
      begin

        RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

        //excluir item pedido banco zeus
        dmMProvider.cdsItemPedZeus.First;
        while not dmMProvider.cdsItemPedZeus.Eof do
        begin

          if pesquisa_item_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value) then
            dmMZeus.cdsIntItemPedidoZeus.Delete;

          dmMProvider.cdsItemPedZeus.Next;

        end;

        if Man_Tab_ItemPedido(2) then
        begin

          RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

          if pesquisa_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
            dmMZeus.cdsIntPedZeus.Delete;

          if Man_Tab_Pedido_Zeus(1) then
            dmMProvider.cdsPedidoZeus.Delete;

        end;

      end;
    end;

  end;


end;

procedure TfrmPedido.actExcluirItemPedidoZeusExecute(Sender: TObject);
var
  iItemPedido:integer;
begin

  LimparMsgErro;

  iItemPedido := dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value;

  if Man_Tab_ItemPedido(1) then
  begin

    RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1 then
    begin

      if pesquisa_item_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, iItemPedido) then
      begin

        dmMZeus.cdsIntItemPedidoZeus.Delete;
        dmMZeus.cdsIntItemPedidoZeus.ApplyUpdates(0);

      end;

    end;

    RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

    edtCodigoItem.SetFocus;

  end;

end;

procedure TfrmPedido.actExluirFinalizPedidoExecute(Sender: TObject);
begin

  LimparMsgErro;

  if Man_Tab_finalizadorasPedido(1) then
    RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

end;

procedure TfrmPedido.actFreteExecute(Sender: TObject);
var
  cPAcrescimo_calculado, cPercentual, cValorAcrescimo:currency;

begin

  cPercentual := 0;

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsPedidoZeus) then
  begin

    frmFreteBalcao := TfrmFreteBalcao.Create(self);
    if frmFreteBalcao.ShowModal = mrOk then
    begin

      Man_Tab_Frete(0);

      dmMProvider.cdsPedidoZeusOBSERVACOES.Value := 'VALOR REFERENTE A TAXA DE ENTREGA: R$ ' + FormatFloat('#,##0.00',dmMProvider.cdsFretePedidoVendaVALOR.Value)+#13;
      if dmMProvider.cdsFretePedidoVendaTIPO_PAGAMENTO.Value > 0 then
      begin

        dmMProvider.cdsPedidoZeusOBSERVACOES.Value      := dmMProvider.cdsPedidoZeusOBSERVACOES.Value + 'COM VENCIMENTO EM:' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsFretePedidoVendaVENCIMENTO.Value);
        dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value  := 0;

        if dmMProvider.cdsPedidoZeusCLIENTE.Value <= 0 then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
          edtCliente.SetFocus;

        end;

      end
      else
      begin

        dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value  := dmMProvider.cdsFretePedidoVendaVALOR.Value;
        dmMProvider.cdsPedidoZeusCLIENTE.Clear;
        dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Clear;

      end;

    end
    else if dmMProvider.cdsFretePedidoVendaVALOR.Value <= 0 then
    begin

      Man_Tab_Frete(1);
      dmMProvider.cdsPedidoZeusOBSERVACOES.Value      := '';
      dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value  := 0;

    end;

    if dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value > 0 then
    begin

      cPercentual := (dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value / dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value) * 100;

      cPercentual := TruncVal(cPercentual,2);

    end;

  end;

  cPAcrescimo_calculado := cPercentual;

  RatearAcrescimo(cPAcrescimo_calculado,dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value);

  CalcularTotalPedido;

end;

procedure TfrmPedido.actIncluirExecute(Sender: TObject);
begin

  if not (dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]) then
  begin

    pgcPedido.Pages[1].Visible  := True;
    pgcPedido.ActivePageIndex   := 1;
    HabilitarDesabilitarControles(True);

    AbrirTabelaPedidoZeus(0,'-1');

    dmMProvider.cdsPedidoZeus.Append;

    grpFinalizadoras.Enabled := (dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1);

    RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarFretePedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

    edtVendedor.SetFocus;

  end;

end;

procedure TfrmPedido.actIntegracaoPedidoZeusExecute(Sender: TObject);
var
  sArquivoPrevenda:string;
begin

  LimparMsgErro;

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    //verifica se a tabela depedido n�o est� vazia
    if not dmMProvider.cdsPedidoZeus.IsEmpty then
    begin

      //verifica se o pedido n�o est� confirmado
      if dmMProvider.cdsPedidoZeusSITUACAO.Value = 0 then
      begin

        case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
          3:begin

              if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1 then
              begin

                //verifica se o pedido n�o existe na tabela do zeus
                if not pesquisa_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                  dmMZeus.cdsIntPedZeus.Append
                else
                  dmMZeus.cdsIntPedZeus.Edit;

                dmMZeus.cdsIntPedZeuscod_loja.Value                               := dmMProvider.cdsPedidoZeusFILIAL.Value;
                dmMZeus.cdsIntPedZeuscod_pedido.Value                             := dmMProvider.cdsPedidoZeusPEDIDO.Value;
                dmMZeus.cdsIntPedZeuscod_loja_saida_mercadoria.Value              := dmMProvider.cdsPedidoZeusLOJA_SAI_MERCADORIA.Value;
                dmMZeus.cdsIntPedZeusdata_pedido.AsDateTime                       := dmMProvider.cdsPedidoZeusEMISSAO.AsDateTime;
                dmMZeus.cdsIntPedZeusentrega.Value                                := '0';
                dmMZeus.cdsIntPedZeusdata_entrega.AsDateTime                      := dmMProvider.cdsPedidoZeusDATA_ENTREGA.AsDateTime;
                dmMZeus.cdsIntPedZeuscodigo_cliente.Value                         := '0';
                dmMZeus.cdsIntPedZeuspresente.Value                               := '0';
                dmMZeus.cdsIntPedZeusnumero_ajuste_roupa.Value                    := '0';
                dmMZeus.cdsIntPedZeuscod_lista_noiva.Value                        := '0';
                dmMZeus.cdsIntPedZeusforma_geracao_pedido.Value                   := '0';
                dmMZeus.cdsIntPedZeusvalor_desconto.Value                         := 0;
                dmMZeus.cdsIntPedZeustermo_encomenda.Value                        := '0';

                //dados do cliente
                if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                begin

                  if dmMProvider.cdsClientes.Locate('CLIENTE', dmMProvider.cdsPedidoZeusCLIENTE.Value, []) then
                  begin

                    dmMZeus.cdsIntPedZeusnome_cliente.Value                         := dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value;
                    dmMZeus.cdsIntPedZeuscnpj.Value                                 := dmMProvider.cdsClientesCNPJ.Value;
                    dmMZeus.cdsIntPedZeusinscricao_estadual.Value                   := dmMProvider.cdsClientesINSCRICAO.Value;
                    dmMZeus.cdsIntPedZeuscodigo_cliente.Value                       := IntToStr(dmMProvider.cdsPedidoZeusCLIENTE.Value);
                    dmMZeus.cdsIntPedZeuscnpj.Value                                 := dmMProvider.cdsClientesCNPJ.Value;

                  end;

                end;

                dmMZeus.cdsIntPedZeusobservacoes.Value                            := dmMProvider.cdsPedidoZeusOBSERVACOES.Value;
                dmMZeus.cdsIntPedZeussituacao.Value                               := '2';//IntToStr(dmMProvider.cdsPedidoZeusSITUACAO.Value);
                dmMZeus.cdsIntPedZeususuario.Value                                := dmMProvider.cdsPedidoZeusUSUARIO.Value;
                dmMZeus.cdsIntPedZeusdata_cadastro.AsDateTime                     := dmMProvider.cdsPedidoZeusEMISSAO.AsDateTime;
                dmMZeus.cdsIntPedZeuscod_vendedor.Value                           := dmMProvider.cdsPedidoZeusVENDEDOR.Value;
                dmMZeus.cdsIntPedZeuscod_funcionario_liberador.Value              := dmMProvider.cdsPedidoZeusVENDEDOR.Value;
                dmMZeus.cdsIntPedZeusdata_ultima_alteracao.AsDateTime             := dmMProvider.cdsPedidoZeusEMISSAO.AsDateTime;
                dmMZeus.cdsIntPedZeusnum_itens_pedido.Value                       := dmMProvider.cdsItemPedZeus.RecordCount;
                dmMZeus.cdsIntPedZeusvalor_pedido.Value                           := dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value;
                dmMZeus.cdsIntPedZeusvalor_desconto_adicional.Value               := dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value;
                dmMZeus.cdsIntPedZeusvalor_acrescimo_adicional.Value              := dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;
                dmMZeus.cdsIntPedZeusnum_prevenda.AsInteger                       := dmMProvider.cdsPedidoZeusPEDIDO.Value;
                dmMZeus.cdsIntPedZeusnum_linhas_item.Value                        := 0;//dmMProvider.cdsItemPedZeus.RecordCount;
                dmMZeus.cdsIntPedZeuspreco_tipo_venda_usado.Value                 := '1';
                dmMZeus.cdsIntPedZeusproibicao_venda_tipo_1.Value                 := '0';
                dmMZeus.cdsIntPedZeusproibicao_venda_tipo_2.Value                 := '1';
                dmMZeus.cdsIntPedZeusproibicao_venda_tipo_3.Value                 := '1';
                dmMZeus.cdsIntPedZeusproibicao_venda_tipo_4.Value                 := '1';
                dmMZeus.cdsIntPedZeusproibicao_venda_tipo_5.Value                 := '1';
                dmMZeus.cdsIntPedZeusopcao_mensagem.Value                         := 0;//0;
                dmMZeus.cdsIntPedZeuspedido_ja_conferido.Value                    := '0';
                dmMZeus.cdsIntPedZeusflg_pedido_exclusivo.Value                   := '0';
                dmMZeus.cdsIntPedZeusflg_integracao_01.Value                      := 0;
                dmMZeus.cdsIntPedZeusflg_tipo_cobranca_frete.Value                := '9';
                dmMZeus.cdsIntPedZeusflg_venda_para_exterior.Value                := '0';

                dmMZeus.cdsIntPedZeus.ApplyUpdates(0);

                //dados da entrega
                if not dmMProvider.cdsEndEntregaPedZeus.IsEmpty then
                begin

                  if not pesquisa_end_entrega(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                    dmMZeus.cdsIntEndEntregaZeus.Append
                  else
                    dmMZeus.cdsIntEndEntregaZeus.Edit;

                  dmMZeus.cdsIntEndEntregaZeuscod_loja.Value                      := dmMProvider.cdsPedidoZeusFILIAL.Value;
                  dmMZeus.cdsIntEndEntregaZeuscod_pedido.Value                    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
                  dmMZeus.cdsIntEndEntregaZeustelefone_entrega.Value              := dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value;
                  dmMZeus.cdsIntEndEntregaZeusrua.Value                           := dmMProvider.cdsEndEntregaPedZeusENDERECO.Value;
                  if dmMProvider.cdsEndEntregaPedZeusNUMERO.Value > 0 then
                    dmMZeus.cdsIntEndEntregaZeusnumero.Value                      := IntToStr(dmMProvider.cdsEndEntregaPedZeusNUMERO.Value)
                  else
                    dmMZeus.cdsIntEndEntregaZeusnumero.Value                      := 'S/N';
                  dmMZeus.cdsIntEndEntregaZeuscomplemento.Value                   := dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value;
                  dmMZeus.cdsIntEndEntregaZeusbairro.Value                        := dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value;
                  dmMZeus.cdsIntEndEntregaZeuscidade.Value                        := dmMProvider.cdsEndEntregaPedZeusCIDADE.Value;
                  dmMZeus.cdsIntEndEntregaZeusuf.Value                            := dmMProvider.cdsEndEntregaPedZeusESTADO.Value;
                  dmMZeus.cdsIntEndEntregaZeuscep.Value                           := dmMProvider.cdsEndEntregaPedZeusCEP.Value;
                  dmMZeus.cdsIntEndEntregaZeushorario_transacao.Value             := FormatDateTime('hhmm',dmMProvider.cdsEndEntregaPedZeusHORA_TRANSACAO.Value);

                  dmMZeus.cdsIntEndEntregaZeus.ApplyUpdates(0);

                end
                else
                begin

                  if pesquisa_end_entrega(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                    dmMZeus.cdsIntEndEntregaZeus.Delete;

                  dmMZeus.cdsIntEndEntregaZeus.ApplyUpdates(0);

                end;

                //dados da finalizadora
                if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
                begin

                  dmMProvider.cdsFinalizadoraPedZeus.First;

                  while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
                  begin

                    if not pesquisa_Finaliz_pedido(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value) then
                      dmMZeus.cdsIntFinalizPedZeus.Append
                    else
                      dmMZeus.cdsIntFinalizPedZeus.Edit;

                    dmMZeus.cdsIntFinalizPedZeuscod_loja.Value                    := dmMProvider.cdsFinalizadoraPedZeusFILIAL.Value;
                    dmMZeus.cdsIntFinalizPedZeuscod_pedido.Value                  := dmMProvider.cdsFinalizadoraPedZeusPEDIDO.Value;

                    dmMZeus.cdsIntFinalizPedZeuscod_finalizadora.Value            := StrToInt(dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value);
                    dmMZeus.cdsIntFinalizPedZeusval_finalizado.Value              := dmMZeus.cdsIntFinalizPedZeusval_finalizado.Value + dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value;

                    if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                      dmMZeus.cdsIntFinalizPedZeuscod_cliente.Value               := dmMProvider.cdsPedidoZeusCLIENTE.Value;

                    dmMZeus.cdsIntFinalizPedZeusqtd_parcelas.Value                := dmMProvider.cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS.Value;
                    dmMZeus.cdsIntFinalizPedZeuscod_pedido_ordem_finaliz.Value    := dmMProvider.cdsFinalizadoraPedZeus.RecNo;

                    dmMZeus.cdsIntFinalizPedZeus.ApplyUpdates(0);

                    dmMProvider.cdsFinalizadoraPedZeus.Next;

                  end;

                  dmMProvider.cdsFinalizadoraPedZeus.First;

                end;


                while not dmMProvider.cdsItemPedZeus.Eof do
                begin

                  if not pesquisa_item_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value) then
                    dmMZeus.cdsIntItemPedidoZeus.Append
                  else
                    dmMZeus.cdsIntItemPedidoZeus.Edit;

                  dmMZeus.cdsIntItemPedidoZeuscod_loja.Value                      := dmMProvider.cdsItemPedZeusFILIAL.Value;
                  dmMZeus.cdsIntItemPedidoZeuscod_pedido.Value                    := dmMProvider.cdsItemPedZeusPEDIDO.Value;
                  dmMZeus.cdsIntItemPedidoZeuscod_pedido_item.Value               := dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value;
                  dmMZeus.cdsIntItemPedidoZeuscod_mercadoria.Value                := FormatFloat('00000000000000000', StrToFloat(dmMProvider.cdsItemPedZeusGTIN.Value));
                  dmMZeus.cdsIntItemPedidoZeuscod_vendedor.Value                  := dmMProvider.cdsPedidoZeusVENDEDOR.Value;
      //            dmMZeus.cdsIntItemPedidoZeususuario.Value                       := '';//null;//dmMProvider.cdsPedidoZeusUSUARIO.Value;
      //            dmMZeus.cdsIntItemPedidoZeusdata_cadastro.AsDateTime            := dmMProvider.cdsItemPedZeusDATA_CADASTRO.AsDateTime;
      //            dmMZeus.cdsIntItemPedidoZeusdata_ultima_alteracao.AsDateTime    := dmMProvider.cdsItemPedZeusDATA_ALTERACAO.AsDateTime;
                  dmMZeus.cdsIntItemPedidoZeusquantidade.Value                    := dmMProvider.cdsItemPedZeusQUANTIDADE.Value;

                  dmMZeus.cdsIntItemPedidoZeuspreco_unitario.Value                := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
                  dmMZeus.cdsIntItemPedidoZeusvalor_desconto.Value                := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value;
                  dmMZeus.cdsIntItemPedidoZeusvalor_acrescimo.Value               := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value;
                  dmMZeus.cdsIntItemPedidoZeusgarantia_fabricante.Value           := 0;
                  dmMZeus.cdsIntItemPedidoZeusentrega.Value                       := '0';
                  dmMZeus.cdsIntItemPedidoZeusencomenda.Value                     := '0';
        //          dmMZeus.cdsIntItemPedidoZeusdata_entrega_prod.AsDateTime        := dmMProvider.cdsPedidoZeusDATA_ENTREGA.AsDateTime;
      //            dmMZeus.cdsIntItemPedidoZeuscod_local.Value                     := dmMProvider.cdsItemPedZeusFILIAL.Value;
                  dmMZeus.cdsIntItemPedidoZeussituacao.Value                      := IntToStr(dmMProvider.cdsPedidoZeusSITUACAO.Value);
      //            dmMZeus.cdsIntItemPedidoZeusdocumento_registro.Value            := 0;
                  dmMZeus.cdsIntItemPedidoZeusitem_ja_conferido.Value             := '0';
                  dmMZeus.cdsIntItemPedidoZeusflags.Value                         := 1;

                  dmMZeus.cdsIntItemPedidoZeus.ApplyUpdates(0);

                  dmMZeus.cdsProdutos_Zeus.Close;
                  dmMZeus.fdqProdutos_Zeus.SQL.Clear;
                  dmMZeus.fdqProdutos_Zeus.SQL.Add('select * from tab_mercadoria_tipo_venda');
                  dmMZeus.fdqProdutos_Zeus.SQL.Add('where cod_mercadoria = ' + QuotedStr(dmMZeus.cdsIntItemPedidoZeuscod_mercadoria.Value));
                  dmMZeus.cdsProdutos_Zeus.Open;

                  while not dmMZeus.cdsProdutos_Zeus.Eof do
                  begin

                    dmMZeus.cdsProdutos_Zeus.Edit;
                    dmMZeus.cdsProdutos_Zeusdata_ultima_alteracao.AsDateTime  := Date;
                    dmMZeus.cdsProdutos_Zeuspreco_unitario.Value              := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
                    dmMZeus.cdsProdutos_Zeus.ApplyUpdates(0);
                    dmMZeus.cdsProdutos_Zeus.Next

                  end;

                  dmMProvider.cdsItemPedZeus.Next;

                end;

                imgStatus.Picture := imgConfirmado.Picture;


              end
              else
              begin

                if not ConsisteCliente_FPG_Prazo then
                begin

                  HabilitarDesabilitarControles(True);
                  lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + MSG_CLIENTE_APRAZO_OBRIGATORIO;
                  Application.ProcessMessages;
                  dmMProvider.cdsPedidoZeus.Edit;
                  edtCliente.SetFocus;
                  exit;

                end
                else
                begin

                  if dmMProvider.cdsConfiguracoesMODELOPDV.Value >= 3 then
                    imgStatus.Picture := imgAguardando.Picture
                  else
                    imgStatus.Picture := imgConfirmado.Picture;

                end;

              end;

            end;
          4:begin

              if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1 then
              begin

                sArquivoPrevenda := FormatFloat('00000000',dmMProvider.cdsPedidoZeusPEDIDO.Value)
                                      +Trim(Copy(dmMProvider.cdsParamIntegraPDVARQUIVO_PRE_VENDA.Value,Pos('.',dmMProvider.cdsParamIntegraPDVARQUIVO_PRE_VENDA.Value),length(dmMProvider.cdsParamIntegraPDVARQUIVO_PRE_VENDA.Value)));

                if GerarPreVendaDJPDV(sArquivoPrevenda , dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value, dmDBEXMaster.iIdFilial) then
                  imgStatus.Picture := imgConfirmado.Picture;

              end
              else
              begin

                if not ConsisteCliente_FPG_Prazo then
                begin

                  HabilitarDesabilitarControles(True);
                  lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + MSG_CLIENTE_APRAZO_OBRIGATORIO;
                  Application.ProcessMessages;
                  dmMProvider.cdsPedidoZeus.Edit;
                  edtCliente.SetFocus;
                  exit;

                end
                else
                begin

                  if dmMProvider.cdsConfiguracoesMODELOPDV.Value >= 3 then
                    imgStatus.Picture := imgAguardando.Picture
                  else
                    imgStatus.Picture := imgConfirmado.Picture;

                end;

              end;

            end;

        end;

        dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;

        dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 1 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
        dmMSProcedure.fdspMaster.ExecProc;

        dmMProvider.cdsPedidoZeus.Edit;
        dmMProvider.cdsPedidoZeusSITUACAO.Value := 1;
        dmMProvider.cdsPedidoZeus.Post;

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PEDIDO_GRAVADO;
        Application.ProcessMessages;

        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Commit;

      end
      else if (dmMProvider.cdsPedidoZeusSITUACAO.Value = 1) and (dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0) then
      begin

        dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;

        dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 0 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
        dmMSProcedure.fdspMaster.ExecProc;

        dmMProvider.cdsPedidoZeus.Edit;
        dmMProvider.cdsPedidoZeusSITUACAO.Value := 0;
        dmMProvider.cdsPedidoZeus.Post;

        imgStatus.Picture := imgAConfirmar.Picture;

      end
      else
      begin

        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1 then
        begin

          case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
            3:begin

                if pesquisa_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                begin

                  //verifica se o pedido n�o est� confirmado
                  if dmMZeus.cdsIntPedZeussituacao.Value = '0' then
                  begin

                    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                    dmMSProcedure.fdspMaster.Prepare;

                    dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 0 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
                    dmMSProcedure.fdspMaster.ExecProc;

                    dmMProvider.cdsPedidoZeus.Edit;
                    dmMProvider.cdsPedidoZeusSITUACAO.Value := 0;
                    dmMProvider.cdsPedidoZeus.Post;

                    imgStatus.Picture := imgAConfirmar.Picture;

                    //dados da finalizadora
                    if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
                    begin

                      dmMProvider.cdsFinalizadoraPedZeus.First;

                      while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
                      begin

                        if pesquisa_Finaliz_pedido(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value) then
                          dmMZeus.cdsIntFinalizPedZeus.Delete;

                        dmMZeus.cdsIntFinalizPedZeus.ApplyUpdates(0);

                        dmMProvider.cdsFinalizadoraPedZeus.Next;

                      end;

                      dmMProvider.cdsFinalizadoraPedZeus.First;

                    end;


                    //excluir informa��es de entrega no banco do zeus
                    dmMProvider.cdsEndEntregaPedZeus.First;
                    while not dmMProvider.cdsEndEntregaPedZeus.Eof do
                    begin

                      if pesquisa_end_entrega(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                        dmMZeus.cdsIntEndEntregaZeus.Delete;

                      dmMZeus.cdsIntEndEntregaZeus.ApplyUpdates(0);

                      dmMProvider.cdsEndEntregaPedZeus.Next;

                    end;
                    dmMProvider.cdsEndEntregaPedZeus.First;

                    //excluir item pedido banco zeus
                    dmMProvider.cdsItemPedZeus.First;
                    while not dmMProvider.cdsItemPedZeus.Eof do
                    begin

                      if pesquisa_item_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value, dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value) then
                        dmMZeus.cdsIntItemPedidoZeus.Delete;

                      dmMZeus.cdsIntItemPedidoZeus.ApplyUpdates(0);

                      dmMProvider.cdsItemPedZeus.Next;

                    end;
                    dmMProvider.cdsItemPedZeus.First;

                    if pesquisa_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                    begin

                      dmMZeus.cdsIntPedZeus.Delete;
                      dmMZeus.cdsIntPedZeus.ApplyUpdates(0);

                    end;

                    LimparMsgErro;

                  end
                  else  if dmMZeus.cdsIntPedZeussituacao.Value = '2' then
                  begin

                    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                    dmMSProcedure.fdspMaster.Prepare;

                    dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 0 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
                    dmMSProcedure.fdspMaster.ExecProc;

                    dmMProvider.cdsPedidoZeus.Edit;
                    dmMProvider.cdsPedidoZeusSITUACAO.Value := 0;
                    dmMProvider.cdsPedidoZeus.Post;

                    imgStatus.Picture := imgAConfirmar.Picture;

                    LimparMsgErro;

                  end
                  else if dmMZeus.cdsIntPedZeussituacao.Value  = '3' then
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PEDIDO_CONFIRMADO_CX;
                    Application.ProcessMessages;

                  end;

                end;

              end;
            4:begin

                dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                dmMSProcedure.fdspMaster.Prepare;

                dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 0 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
                dmMSProcedure.fdspMaster.ExecProc;

                dmMProvider.cdsPedidoZeus.Edit;
                dmMProvider.cdsPedidoZeusSITUACAO.Value := 0;
                dmMProvider.cdsPedidoZeus.Post;

                imgStatus.Picture := imgAConfirmar.Picture;

                LimparMsgErro;

              end;

          end;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PEDIDO_CONFIRMADO_CX;
          Application.ProcessMessages;

        end;

      end;

    end;

{    if dmDBEXMaster.fdcMaster.InTransaction then
      dmDBEXMaster.fdtMaster.Commit;}
    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmPedido.actSairExecute(Sender: TObject);
begin

  halt;
  //Application.Terminate;
//  Close;

end;

procedure TfrmPedido.actSalvarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgAlertaPAF);

  ActiveControl := nil;

  if ConsisteValorRecebido_TotalPedido then
  begin

    if not ValidarFreteClientePedido then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' em pedidos com frete com pagamento a prazo � preciso informar o cliente';
      edtCliente.SetFocus;
      exit;

    end;

    if not ValidarFreteClientePedido then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' em pedidos com frete com pagamento a prazo � preciso informar o cliente';
      edtCliente.SetFocus;
      exit;

    end;

    if Man_Tab_Pedido_Zeus(0) then
    begin

      if Man_Tab_EndEntregaPedido(0) then
        Man_Tab_ClienteEntrega;

      if Man_Tab_ItemPedido(0) then
      begin

        RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

        HabilitarDesabilitarControles(False);
        LimparControlesItem;

        edtConteudoPesquisa.SetFocus;
        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
          grdItens.PopupMenu := nil;

      end;

    end;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLR_REC_VLR_PED;
    Application.ProcessMessages;

  end;

end;

procedure TfrmPedido.CalcularParcelasPedido;
var
  cResto, cValorCalculado, cValorDescontado: currency;
  dVencimento: TDateTime;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    cResto            := 0;
    cValorCalculado   := 0;
    cValorDescontado  := dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value;

    if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
      dmMProvider.cdsFinalizadoraPedZeus.First;

    while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
    begin

      dmMProvider.cdsFormasPagamento.Locate('FORMAPAGAMENTO',dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value, []);

      //conv�nio / a prazo
      if (dmMProvider.cdsFormasPagamentoTIPO.Value = 6) or (dmMProvider.cdsFormasPagamentoTIPO.Value = 10) then
      begin

        if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
        begin

          dmMProvider.AbrirtabelaDiasFormaPagto;

          // consiste o valor do pedido  e a forma de pagamento
          if (dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value > 0) and (dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value > 0) then
          begin

            // posiciona o ponteiro no primeir registro da tabela
            dmMProvider.cdsDiasFormaPagto.First;

            // elimina todas as parcelas que possam existir na tabela
            // parcelas
            dmMSProcedure.fdspParcelasPedidoZeus.Params[0].Value    := 1;
            dmMSProcedure.fdspParcelasPedidoZeus.Params[1].Value    := dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value;
            dmMSProcedure.fdspParcelasPedidoZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
            dmMSProcedure.fdspParcelasPedidoZeus.Params[3].Value    := dmMProvider.cdsParcelasPedZeusFORMA_PAGAMENTO.Value;
            dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value    := dmMProvider.cdsParcelasPedZeusVENCIMENTO.Value;
            dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value    := dmMProvider.cdsParcelasPedZeusVALOR.Value;
            dmMSProcedure.fdspParcelasPedidoZeus.ExecProc;

            dVencimento := Date;

            dmMProvider.AbrirTabelaParcelasPedidoZeus(dmMProvider.cdsPedidoZeusPEDIDO.Value, 0);

            while not dmMProvider.cdsDiasFormaPagto.Eof do
            begin

              dmMSProcedure.fdspParcelasPedidoZeus.Params[0].Value    := 0;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[1].Value    := dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[3].Value    := dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value    := dVencimento + dmMProvider.cdsDiasFormapagtoDIAS.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value    := Trunc((cValorDescontado / dmMProvider.cdsDiasFormaPagto.RecordCount) * 100) / 100;

              cValorCalculado := cValorCalculado + dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value;

              dVencimento     := dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value;

              dmMSProcedure.fdspParcelasPedidoZeus.ExecProc;

              dmMProvider.cdsDiasFormaPagto.Next;

            end;

            cResto := (cValorCalculado - cValorDescontado);

            if cResto < 0 then
              cResto := cResto * (-1);

            if cValorCalculado > cValorDescontado then
              CorrigeValorDocumento((dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value - cResto), dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value, dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value)
            else if (cValorCalculado < cValorDescontado) and not (dmMProvider.cdsDiasFormaPagto.IsEmpty) then
              CorrigeValorDocumento((dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value + cResto), dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value, dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value)
            else if (cValorCalculado < cValorDescontado) and (dmMProvider.cdsDiasFormaPagto.IsEmpty) then
            begin

              dmMSProcedure.fdspParcelasPedidoZeus.Params[0].Value    := 0;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[1].Value    := dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[3].Value    := dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value    := dmMProvider.cdsPedidoZeusEMISSAO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value    := cValorDescontado;
              dmMSProcedure.fdspParcelasPedidoZeus.ExecProc;

            end
            else if (cValorCalculado <> cValorDescontado) then
            begin

              dmMSProcedure.fdspParcelasPedidoZeus.Params[0].Value    := 0;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[1].Value    := dmMProvider.cdsParcelasPedZeusPARCELAS_PEDIDO_ZEUS.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[3].Value    := dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value    := dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value;
              dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value    := cValorDescontado;
              dmMSProcedure.fdspParcelasPedidoZeus.ExecProc;

            end;

          end;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CLI_CRE;
          Application.ProcessMessages;
          Close;

        end;

      end;

      dmMProvider.cdsFinalizadoraPedZeus.Next;

    end;

//    if  dmDBEXMaster.fdcMaster.InTransaction then
    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    dmMProvider.AbrirTabelaParcelasPedidoZeus(dmMProvider.cdsPedidoZeusPEDIDO.Value, 0);


  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;



end;

procedure TfrmPedido.CalcularSubTotal;
begin

  edtSubTotalItem.Text := FormatFloat('#,##0.00', (StrToFloat(RetirarPonto(edtQuantidadeItem.Text)) * StrToFloat(RetirarPonto(edtValorUnitarioItem.Text))));// -StrToFloat(RetirarPonto(edtValorDescontoItem.Text)));

end;

procedure TfrmPedido.CalcularTotalPedido;
begin

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]then
  begin

    dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value := (dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value) - dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value
                                                      + dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;

  end;

end;

procedure TfrmPedido.CarregarInfItens;
begin

  dmMProvider.cdsPesqProdutos.Close;
  dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

  dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.*, UND.PERMITE_VENDA_FRACIONADA  as FRACAO FROM PRODUTO PRO');
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = ' + IntToStr(dmMProvider.cdsItemPedZeusPRODUTO.Value));
  dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial= '+ InttoStr(dmDBEXMaster.iIdFilial));

  dmMProvider.cdsPesqProdutos.Open;
  dmMProvider.cdsPesqProdutos.ProviderName := '';

  if dmMProvider.cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO.Value = 1 then { RT }
    edtSaldoAtual.Text        := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosSALDO_ATUAL.Value)
  else
    edtSaldoAtual.Text        := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosSALDO_ATUAL.Value - dmMProvider.cdsPesqProdutosSALDO_ALMOXARIFADO.Value);

  edtCodigoItem.Text          := IntToStr(dmMProvider.cdsItemPedZeusPRODUTO.Value);
  edtDescricaoItem.Text       := dmMProvider.cdsItemPedZeusDESCRICAO.Value;
  edtUnidadeItem.Text         := dmMProvider.cdsItemPedZeusUNIDADE.Value;
  edtQuantidadeItem.Text      := FormatFloat('#,##0.000',dmMProvider.cdsItemPedZeusQUANTIDADE.Value);
  edtValorUnitarioItem.Text   := FormatFloat('#,##0.00',dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value);
  edtValorDescontoItem.Text   := FormatFloat('#,##0.00',dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value);
  edtValorAcrescimoItem.Text  := FormatFloat('#,##0.00',dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value);
  edtSubTotalItem.Text        := FormatFloat('#,##0.00',dmMProvider.cdsItemPedZeusSUB_TOTAL.Value);

  grdItens.Tag                := 1;

end;

procedure TfrmPedido.cboFormaPagamentoExit(Sender: TObject);
begin

  if Length(Trim(cboFormaPagamento.Text)) > 0 then
    edtValorFinaliz.Text := FormatFloat('#,##0.00',dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value);

end;

procedure TfrmPedido.cboFormaPagamentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = 46 then
    cboFormaPagamento.KeyValue := -1;

end;

procedure TfrmPedido.cboFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmPedido.cboOramentoPedidoCloseUp(Sender: TObject);
begin

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    dmMProvider.cdsPedidoZeus.Edit;
    dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value := cboOramentoPedido.ItemIndex;

    grpFinalizadoras.Enabled := (dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1);

  end;

end;

function TfrmPedido.ConsisteCliente_FPG_Prazo: boolean;
var
  bResult:boolean;
  i:integer;
begin

  bResult :=  False;

  if dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
    bResult := dmMProvider.cdsFinalizadoraPedZeus.IsEmpty
  else
  begin

    dmMProvider.cdsFinalizadoraPedZeus.First;

    while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
    begin

      if (dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 10) or (dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 6) and (dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1) then
      begin

        if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
        begin

          bResult := true;
          break;

        end
        else
          bResult := false;

      end
      else
        bResult := true;

      dmMProvider.cdsFinalizadoraPedZeus.Next;

    end;

  end;

  Result := bResult;

end;

function TfrmPedido.ConsisteValorRecebido_TotalPedido: boolean;
begin

  LimparMsgErro;

  Result := True;

  if dmMProvider.cdsFinalizadoraPedZeusTOTAL_RECEBIDO.Value > 0 then
    Result := dmMProvider.cdsFinalizadoraPedZeusTOTAL_RECEBIDO.Value >= dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value

end;

procedure TfrmPedido.CorrigeValorDocumento(pValor: currency;
  pDocumento: integer; pVencimento: TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    dmMSProcedure.fdspParcelasPedidoZeus.Params[0].Value := 0;
    dmMSProcedure.fdspParcelasPedidoZeus.Params[1].Value := pDocumento;
    dmMSProcedure.fdspParcelasPedidoZeus.Params[2].Value := dmMProvider.cdsParcelasPedZeusCODIGO_PEDIDO.Value;
    dmMSProcedure.fdspParcelasPedidoZeus.Params[3].Value := dmMProvider.cdsParcelasPedZeusFORMA_PAGAMENTO.Value;
    dmMSProcedure.fdspParcelasPedidoZeus.Params[4].Value := pVencimento;
    dmMSProcedure.fdspParcelasPedidoZeus.Params[5].Value := pValor;
    dmMSProcedure.fdspParcelasPedidoZeus.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure TfrmPedido.HabilitaDesabilitaInfoEntrega(pOpcao: boolean;  pCor: TColor);
begin

  edtNomeClienteEntrega.ReadOnly  := pOpcao;
  edtNomeClienteEntrega.Color     := pCor;
  edtEnderecoEntrega.ReadOnly     := edtNomeClienteEntrega.ReadOnly;
  edtEnderecoEntrega.Color        := edtNomeClienteEntrega.Color;
  edtNumeroEntrega.ReadOnly       := edtNomeClienteEntrega.ReadOnly;
  edtNumeroEntrega.Color          := edtNomeClienteEntrega.Color;
  edtCepEntrega.ReadOnly          := edtNomeClienteEntrega.ReadOnly;
  edtCepEntrega.Color             := edtNomeClienteEntrega.Color;
  edtBairroEntrega.ReadOnly       := edtNomeClienteEntrega.ReadOnly;
  edtBairroEntrega.Color          := edtNomeClienteEntrega.Color;
  edtCidadeEntrega.ReadOnly       := edtNomeClienteEntrega.ReadOnly;
  edtCidadeEntrega.Color          := edtNomeClienteEntrega.Color;
  edtEstadoEntrega.ReadOnly       := edtNomeClienteEntrega.ReadOnly;
  edtEstadoEntrega.Color          := edtNomeClienteEntrega.Color;
  edtComplementoEntrega.ReadOnly  := edtNomeClienteEntrega.ReadOnly;
  edtComplementoEntrega.Color     := edtNomeClienteEntrega.Color;
  edtTelefoneEntrega.ReadOnly     := edtNomeClienteEntrega.ReadOnly;
  edtTelefoneEntrega.Color        := edtNomeClienteEntrega.Color;

end;

procedure TfrmPedido.HabilitarDesabilitarControles(pOpcao:boolean);
begin

  grpDadosPedido.Enabled      := pOpcao;
  grpDigitacaoItens.Enabled   := grpDadosPedido.Enabled;
  grpEnderecoEntrega.Enabled  := grpDadosPedido.Enabled;
  grpFinalizadoras.Enabled    := grpDadosPedido.Enabled;

  grpFinalizadoras.Enabled := (dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1);

end;

procedure TfrmPedido.edtClienteExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  LimparMSG_ERRO(lblMsg, imgAlertaPAF);

  if InserindoEditando(dmMProvider.cdsPedidoZeus) then
  begin

{    if not ValidarFreteClientePedido then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' em pedidos com frete com pagamento a prazo � preciso informar o cliente';
      edtCliente.SetFocus;
      exit;

    end;
}
    if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
    begin

      LimparMsgErro;

      dmMProvider.cdsClientes.Close;
      dmMProvider.cdsClientes.ProviderName := 'dspClientes';

      dmDBEXMaster.fdqClientes.SQL.Clear;
      dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
      dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
      dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('where cliente = ' + IntToStr(dmMProvider.cdsPedidoZeusCLIENTE.Value));

      dmMProvider.cdsClientes.Open;
      dmMProvider.cdsClientes.ProviderName := '';

      if dmMProvider.cdsClientes.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        dmMProvider.cdsClientes.Close;
        dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value := '';
        edtCliente.SetFocus;

      end
      else
      begin

        edtCodigoItem.SetFocus;
        dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value := dmMProvider.cdsClientesRAZAOSOCIAL.Value;

        if dmMProvider.cdsPedidoZeusENTREGA.Value = 1 then
          IncluirEndEntrega
        else
          Man_Tab_EndEntregaPedido(1);

      end;

    end
    else
    begin

      dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value := '';
      Man_Tab_EndEntregaPedido(1);

    end;

  end;

end;

procedure TfrmPedido.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    edtCodigoItem.SetFocus;
//    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmPedido.edtCodigoItemExit(Sender: TObject);

begin

  sBarras     := '';
  sBarrasZeus := sBarras;
  iProduto    := 0;
  LimparMsgErro;

  imgAlertaPAF.Visible := False;

  MudarCorEdit(sender);

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtCodigoItem.Text)) > 0 then
    begin

      if Length(Trim(edtCodigoItem.Text)) > 6 then
      begin

        if Length(Trim(edtCodigoItem.Text)) <= 13 then
          sBarras := FormatFloat('0000000000000', StrToFloat(edtCodigoItem.Text))
        else
          sBarras := edtCodigoItem.Text;

        dmDBEXMaster.fdqBarras.Close;
        dmDBEXMaster.fdqBarras.SQL.Clear;
        dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
        dmDBEXMaster.fdqBarras.SQL.Add('where barras  = ' + QuotedStr(sBarras));
        dmDBEXMaster.fdqBarras.Open;

        if dmDBEXMaster.fdqBarras.IsEmpty then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' ' + edtConteudoPesquisa.Text;
          Application.ProcessMessages;
          dmDBEXMaster.fdqBarras.Close;
          edtCodigoItem.SetFocus;
          exit;

        end
        else
        begin

          iProduto := dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value;

          if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value = 0 then
          begin

            if (dmDBEXMaster.fdqBarras.FieldByName('GERADO').Value = 1) then
              sBarras := '0' + Copy(sBarras,1, Length(sBarras) - 1);

          end
          else
            sBarras := sBarras;

        end;

        sBarrasZeus := FormatFloat('00000000000000000',StrToFloat(sBarras));

      end
      else
        iProduto := StrToInt(edtCodigoItem.Text);

      dmMProvider.cdsPesqProdutos.Close;
      dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

      dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.*, UND.PERMITE_VENDA_FRACIONADA  as FRACAO FROM PRODUTO PRO');
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = ' + IntToStr(iProduto));
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial= '+ InttoStr(dmDBEXMaster.iIdFilial));

      dmMProvider.cdsPesqProdutos.Open;
      dmMProvider.cdsPesqProdutos.ProviderName := '';

      if dmMProvider.cdsPesqProdutos.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' ' + edtConteudoPesquisa.Text;
        Application.ProcessMessages;
        edtCodigoItem.SetFocus;

      end
      else
      begin

        if length(Trim(sBarras)) <= 0 then
        begin

          dmDBEXMaster.fdqBarras.Close;
          dmDBEXMaster.fdqBarras.SQL.Clear;
          dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
          dmDBEXMaster.fdqBarras.SQL.Add('where produto  = ' + IntToStr(iProduto));
          dmDBEXMaster.fdqBarras.Open;

          if not (dmDBEXMaster.fdqBarras.IsEmpty) then
          begin

            sBarras := dmDBEXMaster.fdqBarras.FieldByName('BARRAS').Value;

            if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value = 0 then
            begin

              if (dmDBEXMaster.fdqBarras.FieldByName('GERADO').Value = 1) then
                sBarras := '0' + Copy(sBarras,1, Length(sBarras) - 1);

            end
            else
              sBarras := sBarras;

          end;

          sBarrasZeus := FormatFloat('00000000000000000',StrToFloat(sBarras));

        end;

        case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
          3:begin

              if not (dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty) then
              begin

                if not PesquisarMercadoriaZes(sBarrasZeus) then
                begin

                  lblMsg.Caption        := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_MERC_ZEUS + ' ' + dmMProvider.cdsPesqProdutosDESCRICAO.Value;
                  imgAlertaPAF.Visible  := true;
                  Application.ProcessMessages;

                  TocarSomAlerta(ord(SystemHand));

                  edtCodigoItem.SetFocus;

                  Exit;

                end
                else
                begin

                  imgAlertaPAF.Visible  := true;
                  Application.ProcessMessages;

                end;

              end;

            end;
          4:begin

              if not (dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty) then
              begin

                case dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value of
                  0:begin

                      if not PesquisarMercadoriaDJPdv(FormatFloat('00000000000000000000', dmMProvider.cdsPesqProdutosPRODUTO.Value)) then
                      begin

                        lblMsg.Caption        := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_MERC_ZEUS + ' ' + dmMProvider.cdsPesqProdutosDESCRICAO.Value;
                        imgAlertaPAF.Visible  := true;
                        Application.ProcessMessages;

                        TocarSomAlerta(ord(SystemHand));

                        edtCodigoItem.SetFocus;

                        Exit;

                      end
                      else
                      begin

                        imgAlertaPAF.Visible  := true;
                        Application.ProcessMessages;

                      end;

                    end;
                  1:begin

                      if not PesquisarMercadoriaDJPdv(IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value)) then
                      begin

                        lblMsg.Caption        := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_MERC_ZEUS + ' ' + dmMProvider.cdsPesqProdutosDESCRICAO.Value;
                        imgAlertaPAF.Visible  := true;
                        Application.ProcessMessages;

                        TocarSomAlerta(ord(SystemHand));

                        edtCodigoItem.SetFocus;

                        Exit;

;                      end

                    end;
                end;

              end;

            end;
        end;

        edtDescricaoItem.Text     := dmMProvider.cdsPesqProdutosDESCRICAO.Value;
        edtUnidadeItem.Text       := dmMProvider.cdsPesqProdutosUNIDADE.Value;

        if dmMProvider.cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO.Value = 1 then { RT }
          edtSaldoAtual.Text        := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosSALDO_ATUAL.Value)
        else
          edtSaldoAtual.Text        := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosSALDO_ATUAL.Value - dmMProvider.cdsPesqProdutosSALDO_ALMOXARIFADO.Value);

        if dmMProvider.cdsPesqProdutosPROMOCAO.Value = 0 then
          edtValorUnitarioItem.Text := FormatFloat('#,##0.00', dmMProvider.cdsPesqProdutosPRECODEVENDA.Value)
        else
          edtValorUnitarioItem.Text := FormatFloat('#,##0.00', dmMProvider.cdsPesqProdutosPRECOPROMOCAO.Value);

        RelacionarAliquotaICMS(dmMProvider.cdsPesqProdutosTRIBUTACAO.Value);

      end;

    end;

  end;

end;

procedure TfrmPedido.edtCodigoItemKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key) = 'P' then
  begin

    key := #0;
    imgPesquisaItemClick(self);

  end;


end;

procedure TfrmPedido.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmPedido.edtConteudoPesquisaExit(Sender: TObject);
var
  iProduto:integer;
begin

  MudarCorEdit(sender);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    LimparMsgErro;

    lblMsg.Caption := 'Aguarde.....';
    Application.ProcessMessages;

    pgcPedido.ActivePageIndex := 0;

    case rdgOpcoesPesquisa.ItemIndex of
      0:begin

          if not AbrirTabelaPedidoZeus(0,edtConteudoPesquisa.Text) then
            edtConteudoPesquisa.SetFocus
          else
          begin

//            edtDataValidade.DateTime := dmMProvider.cdsPedidoZeusVALIDADE_PEDIDO.Value;
            edtConteudoPesquisa.Clear;
            grdTabela.SetFocus;
            LimparMsgErro;

          end;

        end;

    end;

    case dmMProvider.cdsPedidoZeusSITUACAO.Value of
      0:imgStatus.Picture := imgAConfirmar.Picture;
      1:begin

          if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1 then
            imgStatus.Picture := imgConfirmado.Picture
          else
            imgStatus.Picture := imgAguardando.Picture;

      end
    else
      imgStatus.Picture := imgConfirmado.Picture;
    end;

    imgStatus.Visible := not (dmMProvider.cdsPedidoZeus.IsEmpty);

  end;

end;

procedure TfrmPedido.edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iDirecao: Integer;
begin

  //habilita movimenta��o dos campos com as setas acima/abaixo
  iDirecao := -1;
  case Key of

    VK_DOWN: iDirecao := 0; {Pr�ximo}
    VK_UP: iDirecao := 1;   {Anterior}

  end;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;

end;

procedure TfrmPedido.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

    if rdgOpcoesPesquisa.ItemIndex = 0 then
    begin

      if Length(Trim(edtConteudoPesquisa.Text)) <= 0 then
      begin

{        frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
        frmPesquisaProduto.Tag  := 1;
        if frmPesquisaProduto.ShowModal = mrOK then
        begin

          edtConteudoPesquisa.Text := IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value);
          edtConteudoPesquisaExit(self);

        end;

        FreeAndNil(frmPesquisaProduto);
}

      end;

    end;

  end;

end;

procedure TfrmPedido.edtNomeClienteEntregaEnter(Sender: TObject);
begin

  if not edtNomeClienteEntrega.ReadOnly then
    MudarCorEdit(sender);

end;

procedure TfrmPedido.edtNomeClienteEntregaExit(Sender: TObject);
begin

  if dmMProvider.cdsEndEntregaPedZeus.State in [dsEdit, dsInsert] then
  begin

    if not edtNomeClienteEntrega.ReadOnly then
    begin

      MudarCorEdit(sender);

      if Length(Trim(edtNomeClienteEntrega.Text)) > 0 then
      begin

        dmMProvider.cdsCliente_Entrega.Close;
        dmMProvider.cdsCliente_Entrega.ProviderName := 'dspCliente_Entrega';

        dmDBEXMaster.fdqCliente_Entrega.SQL.Clear;
        dmDBEXMaster.fdqCliente_Entrega.SQL.Add('select * from cliente_entrega');
        dmDBEXMaster.fdqCliente_Entrega.SQL.Add('where nome_cliente like '+ QuotedStr('%' + Trim(edtNomeClienteEntrega.Text) + '%'));

        dmMProvider.cdsCliente_Entrega.Open;
        dmMProvider.cdsCliente_Entrega.ProviderName := '';

        if not dmMProvider.cdsCliente_Entrega.IsEmpty then
        begin

          frmInformacaoEntrega := TfrmInformacaoEntrega.Create(self);
          if frmInformacaoEntrega.ShowModal = mrOk then
          begin

            dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value        := dmMProvider.cdsCliente_EntregaNOME_CLIENTE.Value;
            dmMProvider.cdsEndEntregaPedZeusENDERECO.Value            := dmMProvider.cdsCliente_EntregaENDERECO.Value;
            if Length(Trim(dmMProvider.cdsCliente_EntregaNUMERO.Value)) > 0 then
              dmMProvider.cdsEndEntregaPedZeusNUMERO.Value            := StrToInt(dmMProvider.cdsCliente_EntregaNUMERO.Value)
            else
              dmMProvider.cdsEndEntregaPedZeusNUMERO.Value            := 0;
            dmMProvider.cdsEndEntregaPedZeusCEP.Value                 := dmMProvider.cdsCliente_EntregaCEP.Value;
            dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value              := dmMProvider.cdsCliente_EntregaBAIRRO.Value;
            dmMProvider.cdsEndEntregaPedZeusCIDADE.Value              := dmMProvider.cdsCliente_EntregaCIDADE.Value;
            dmMProvider.cdsEndEntregaPedZeusESTADO.Value              := dmMProvider.cdsCliente_EntregaESTADO.Value;
            dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value         := dmMProvider.cdsCliente_EntregaCOMPLEMENTO.Value;
            dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value    := dmMProvider.cdsCliente_EntregaTELEFONE.Value;

          end;

          FreeAndNil(frmInformacaoEntrega);

        end
        else
        begin

          lblMsg.Caption := dmMProvider.cdsPedidoZeusNOME.Value + ', favor preencher os campos referentes a entrega';
          Application.ProcessMessages;

          edtEnderecoEntrega.SetFocus;

        end;

      end;

    end;

  end
  else if not edtNomeClienteEntrega.ReadOnly then
    MudarCorEdit(sender);


end;

procedure TfrmPedido.edtNumeroPedidoChange(Sender: TObject);
begin

  cboOramentoPedido.ItemIndex := dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value;

  case dmMProvider.cdsPedidoZeusSITUACAO.Value of
    0:imgStatus.Picture := imgAConfirmar.Picture;
    1:begin

        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1 then
          imgStatus.Picture := imgConfirmado.Picture
        else
          imgStatus.Picture := imgAguardando.Picture;

      end
  else
    imgStatus.Picture := imgConfirmado.Picture;
  end;

  imgStatus.Visible := not (dmMProvider.cdsPedidoZeus.IsEmpty);


end;

procedure TfrmPedido.edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmPedido.edtPercDescontoSTExit(Sender: TObject);
var
  cPercentual:currency;

begin

  cPercentual := 0;

  MudarCorEdit(sender);

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtPercDescontoST.Text))<= 0 then
      edtPercDescontoST.Text := '0,000'
    else if StrToFloat(RetirarPonto(edtPercDescontoST.Text)) = 0 then
      edtPercDescontoST.Text := '0,000';

    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
    begin

      if StrToFloat(RetirarPonto(edtPercDescontoST.Text)) > 0 then
      begin

        cPercentual := StrToFloat(RetirarPonto(edtPercDescontoST.Text));

        cPercentual := TruncVal(cPercentual,2);

        if (dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value > 0) and (cPercentual > dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value) and (not bAutorizaDesconto) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DESCONTO_MAIOR_MAXIMO;
          Application.ProcessMessages;
          edtPercDescontoST.SetFocus;

          exit;

        end;

      end;

    end;

    dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value := TruncVal((dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value *  (cPercentual /100)),2);

    if StrToFloat(RetirarPonto(edtValorDesconto.Text)) > dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VDESCONTO_MAIOR_SUBTOTAL;
      Application.ProcessMessages;
      edtPercDescontoST.SetFocus;
      exit;

    end;

    edtPercDescontoST.Text := '0,00';

  end;

end;

procedure TfrmPedido.edtpercentualDescItemExit(Sender: TObject);
var
  cPercentual:currency;

begin

  cPercentual := 0;

  MudarCorEdit(sender);

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtPercentualDescItem.Text))<= 0 then
      edtPercentualDescItem.Text := '0,000'
    else if StrToFloat(RetirarPonto(edtPercentualDescItem.Text)) = 0 then
      edtPercentualDescItem.Text := '0,000';

    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
    begin

      if StrToFloat(RetirarPonto(edtPercentualDescItem.Text)) > 0 then
      begin

        cPercentual := StrToFloat(RetirarPonto(edtpercentualDescItem.Text));

        cPercentual := TruncVal(cPercentual,2);

        if (dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value > 0) and (cPercentual > dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value) and (not bAutorizaDesconto) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DESCONTO_MAIOR_MAXIMO;
          Application.ProcessMessages;
          edtpercentualDescItem.SetFocus;

          exit;

        end;

        edtValorDescontoItem.Text := FormatFloat('#,##0.00',  TruncVal((cValorUnitario *  (cPercentual /100)),2));

      end;

    end;

    cValorUnitario            := StrToFloat(RetirarPonto(edtValorUnitarioItem.Text));

    CalcularSubTotal;

    if StrToFloat(RetirarPonto(edtValorDescontoItem.Text)) > StrToFloat(RetirarPonto(edtSubTotalItem.Text)) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VDESCONTO_MAIOR_SUBTOTAL;
      Application.ProcessMessages;
      edtValorDescontoItem.SetFocus;
      exit;

    end;

    edtpercentualDescItem.Text := '0,00';

  end;

end;

procedure TfrmPedido.edtQuantidadeItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMsgErro;

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtQuantidadeItem.Text))<= 0 then
      edtQuantidadeItem.Text := '1,000'
    else if StrToFloat(RetirarPonto(edtQuantidadeItem.Text)) = 0 then
      edtQuantidadeItem.Text := '1,000';

    edtQuantidadeItem.Text := FormatFloat('#,##0.000',StrToFloat(RetirarPonto(edtQuantidadeItem.Text)));

    if not Validar_Venda_Fracionada(dmMProvider.cdsPesqProdutosFRACAO.Value, StrToFloat(RetirarPonto(edtQuantidadeItem.Text))) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VENDA_FRACIONADA_NP + edtDescricaoItem.Text;
      Application.ProcessMessages;
      edtQuantidadeItem.SetFocus;

    end
    else
      CalcularSubTotal;

  end;

end;

procedure TfrmPedido.edtQuantidadeItemKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmPedido.edtValidadePedidoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmPedido.edtValorAcrescimoItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if (dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]) and (Length(Trim(edtCodigoItem.Text)) > 0) then
  begin

    if Length(Trim(edtValorAcrescimoItem.Text))<= 0 then
      edtValorAcrescimoItem.Text := '0,000'
    else if StrToFloat(RetirarPonto(edtValorAcrescimoItem.Text)) = 0 then
      edtValorAcrescimoItem.Text := '0,000';

    edtValorAcrescimoItem.Text := FormatFloat('#,##0.00',StrToFloat(RetirarPonto(edtValorAcrescimoItem.Text)));

    CalcularSubTotal;

    if Man_Tab_Pedido_Zeus(0) then
    begin

      dmMProvider.cdsPedidoZeus.Edit;

      if grdItens.Tag <= 0 then
        dmMProvider.cdsItemPedZeus.Append
      else
        dmMProvider.cdsItemPedZeus.Edit;

      grdItens.Tag := 0;

      dmMProvider.cdsItemPedZeusPRODUTO.Value               := iProduto;
      dmMProvider.cdsItemPedZeusGTIN.Value                  := sBarras;
      dmMProvider.cdsItemPedZeusQUANTIDADE.Value            := StrToFloat(RetirarPonto(edtQuantidadeItem.Text));
      dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value        := StrToFloat(RetirarPonto(edtValorUnitarioItem.Text));
      dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value        := StrToFloat(RetirarPonto(edtValorDescontoItem.Text));
      dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value       := StrToFloat(RetirarPonto(edtValorAcrescimoItem.Text));
      dmMProvider.cdsItemPedZeusALIQUOTA_ICMS.Value         := dmMProvider.cdsTributacaoALIQUOTA.Value;
      dmMProvider.cdsItemPedZeusCOD_TRIBUTACAO.Value        := dmMProvider.cdsTributacaoCODIGOECF.Value;
      dmMProvider.cdsItemPedZeusOBSERVACOES.Value           := '';
      dmMProvider.cdsItemPedZeusENTREGA.Value               := dmMProvider.cdsPedidoZeusENTREGA.Value;

      if bAutorizaDesconto then
        dmMProvider.cdsItemPedZeusAUTORIZACAO_DESCONTO.Value:= sUsuario_autorizou;


      if dmMProvider.cdsPesqProdutosGRUPO.Value > 0 then
        dmMProvider.cdsItemPedZeusGRUPO.Value             := dmMProvider.cdsPesqProdutosGRUPO.Value
      else
        dmMProvider.cdsItemPedZeusGRUPO.Value             := 999;

      if dmMProvider.cdsItemPedZeusQUANTIDADE.Value > 0 then
      begin

        if Man_Tab_ItemPedido(0) then
        begin

          RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

          if dmMProvider.cdsPedidoZeusENTREGA.Value = 1 then
            IncluirEndEntrega
          else if not dmMProvider.cdsEndEntregaPedZeus.IsEmpty then
            Man_Tab_EndEntregaPedido(1);

          ResetaUsuario_Autorizou;
          LimparControlesItem;

        end;

      end;

    end;

  end;

  LimparControlesItem;
  edtCodigoItem.SetFocus;
  bAutorizaDesconto := False;

end;

procedure TfrmPedido.edtValorDescontoExit(Sender: TObject);
var
  cPDesconto_calculado, cPercentual, cValorDesconto:currency;

begin

  cPercentual := 0;

  MudarCorEdit(sender);

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtValorDesconto.Text))  <= 0 then
      edtValorDesconto.Text := '0,00'
    else
    begin

      if StrToFloat(RetirarPonto(edtValorDesconto.Text)) > 0 then
      begin

        cPercentual := (StrToFloat(RetirarPonto(edtValorDesconto.Text)) / dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value) * 100;

        cPercentual := TruncVal(cPercentual,2);

        if (dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value > 0) and (cPercentual > dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value) and (not bAutorizaDesconto) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DESCONTO_MAIOR_MAXIMO;
          Application.ProcessMessages;
          edtValorDesconto.SetFocus;

          exit;

        end;

      end;

    end;

    edtValorDesconto.Text := FormatFloat('#,##0.00',StrToFloat(RetirarPonto(edtValorDesconto.Text)));

    if StrToFloat(RetirarPonto(edtValorDesconto.Text)) > StrToFloat(RetirarPonto(edtValoMercadorias.Text)) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VDESCONTO_MAIOR_TOTMERC;
      Application.ProcessMessages;
      edtValorDesconto.SetFocus;
      exit;

    end;

    cPDesconto_calculado := cPercentual;

    RatearDesconto(cPDesconto_calculado, dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value);

  end;

  CalcularTotalPedido;

end;

procedure TfrmPedido.edtValorDescontoItemExit(Sender: TObject);
var
  cPercentual:currency;

begin

  cPercentual := 0;

  MudarCorEdit(sender);

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtValorDescontoItem.Text))<= 0 then
      edtValorDescontoItem.Text := '0,000'
    else if StrToFloat(RetirarPonto(edtValorDescontoItem.Text)) = 0 then
      edtValorDescontoItem.Text := '0,000';

    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
    begin

      cValorUnitario            := StrToFloat(RetirarPonto(edtValorUnitarioItem.Text));

      if StrToFloat(RetirarPonto(edtValorDescontoItem.Text)) > 0 then
      begin

        cPercentual := (StrToFloat(RetirarPonto(edtValorDescontoItem.Text)) / (cValorUnitario * StrToFloat(RetirarPonto(edtQuantidadeItem.Text))) * 100);

        cPercentual := TruncVal(cPercentual,2);

        if (dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value > 0) and (cPercentual > dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value) and (not bAutorizaDesconto) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DESCONTO_MAIOR_MAXIMO;
          Application.ProcessMessages;
          edtValorDescontoItem.SetFocus;

          if cDiferenca > 0 then
            edtValorDescontoItem.Text := FormatFloat('#,##0.00',cDiferenca);

          exit;

        end;

      end;

    end;

    edtValorDescontoItem.Text := FormatFloat('#,##0.00',StrToFloat(RetirarPonto(edtValorDescontoItem.Text)));

    CalcularSubTotal;

    if StrToFloat(RetirarPonto(edtValorDescontoItem.Text)) > StrToFloat(RetirarPonto(edtSubTotalItem.Text)) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VDESCONTO_MAIOR_SUBTOTAL;
      Application.ProcessMessages;
      edtValorDescontoItem.SetFocus;
      exit;

    end;

  end;

end;

procedure TfrmPedido.edtValorFinalizExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if  not dmMProvider.cdsItemPedZeus.IsEmpty then
    begin

      if Length(Trim(edtValorFinaliz.Text))  > 0 then
      begin

        if not ConsisteCliente_FPG_Prazo then
        begin

          lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + MSG_CLIENTE_APRAZO_OBRIGATORIO;
          Application.ProcessMessages;

          cboFormaPagamento.KeyValue  := -1;
          edtCliente.SetFocus;

        end
        else
        begin

          if (cboFormaPagamento.KeyValue >= 0) and (StrToFloat(RetirarPonto(edtValorFinaliz.Text)) > 0) then
          begin

            RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

            if not dmMProvider.cdsFinalizadoraPedZeus.Locate('FORMA_PAGAMENTO',cboFormaPagamento.KeyValue, [])  then
              dmMProvider.cdsFinalizadoraPedZeus.Append
            else
              dmMProvider.cdsFinalizadoraPedZeus.Edit;

            dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value       := cboFormaPagamento.KeyValue;
            dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value      := dmMProvider.cdsFormasPagamentoCODIGOECF.Value;
            dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value      := StrToFloat(RetirarPonto(edtValorFinaliz.Text));
            dmMProvider.cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS.Value   := dmMProvider.cdsFormasPagamentoPARCELAS.Value;
            dmMProvider.cdsFinalizadoraPedZeusCLASSE_FINALIZADORA.Value   := 0;
            dmMProvider.cdsFinalizadoraPedZeusTIPO.Value                  := dmMProvider.cdsFormasPagamentoTIPO.Value;

            dmMProvider.cdsFinalizadoraPedZeus.Post;

            Man_Tab_finalizadorasPedido(0);

            cboFormaPagamento.KeyValue  := -1;
            edtValorFinaliz.Text        := '0,00';
            cboFormaPagamento.SetFocus;

          end;

        end;

      end;

    end
    else
    begin

      lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + MSG_ITEM_PEDIDO_VAZIO;
      edtCodigoItem.SetFocus;

    end;

  end;

end;

procedure TfrmPedido.edtValorUnitarioItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  cValorUnitario  := 0;
  cPercentual     := 0;
  cDiferenca      := 0;

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtValorUnitarioItem.Text))<= 0 then
      edtValorUnitarioItem.Text := '1,000'
    else if StrToFloat(RetirarPonto(edtValorUnitarioItem.Text)) = 0 then
      edtValorUnitarioItem.Text := '1,000';

    cValorUnitario := StrToFloat(RetirarPonto(edtValorUnitarioItem.Text));

    //verifica se o usuario digitou o valor menor que o pre�o de custo e se o sistema n�o permite
    if (cValorUnitario < dmmProvider.cdsPesqProdutosCUSTOLIQUIDO.Value) and (dmMProvider.cdsConfiguracoesPERMITE_VENDA_ABAIXO_CUSTOLIQ.Value = 0) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PVENDA_MENOR_PCUSTO;
      Application.ProcessMessages;
      edtValorUnitarioItem.SetFocus;
      exit;

    end
    else
    begin

      if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
      begin

        if dmMProvider.cdsPesqProdutosPROMOCAO.Value = 0 then
        begin

          if cValorUnitario < dmMProvider.cdsPesqProdutosPRECODEVENDA.Value then
          begin

            cDiferenca  := dmMProvider.cdsPesqProdutosPRECODEVENDA.Value - StrToFloat(RetirarPonto(edtValorUnitarioItem.Text));

            cPercentual := (cDiferenca / dmMProvider.cdsPesqProdutosPRECODEVENDA.Value) * 100;

            cPercentual := TruncVal(cPercentual,2);

            if (dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value > 0) and (cPercentual > dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value) and (not bAutorizaDesconto) then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DESCONTO_MAIOR_MAXIMO;
              Application.ProcessMessages;
              edtValorUnitarioItem.SetFocus;
              exit;

            end
            else
            begin

              edtValorDescontoItem.Text := FormatFloat('#,##0.00',cDiferenca * StrToFloat(RetirarPonto(edtQuantidadeItem.Text)));
              cValorUnitario            := dmMProvider.cdsPesqProdutosPRECODEVENDA.Value;
              edtValorUnitarioItem.Text := FormatFloat('#,##0.00',cValorUnitario);

            end;

          end;

        end
        else
        begin

          if cValorUnitario < dmMProvider.cdsPesqProdutosPRECOPROMOCAO.Value then
          begin

            cValorUnitario            := dmMProvider.cdsPesqProdutosPRECOPROMOCAO.Value;
            edtValorUnitarioItem.Text := FormatFloat('#,##0.00',cValorUnitario);

          end;

        end;

      end;

    end;

    edtValorUnitarioItem.Text := FormatFloat('#,##0.00',StrToFloat(RetirarPonto(edtValorUnitarioItem.Text)));

    CalcularSubTotal;

  end;

end;

procedure TfrmPedido.edtVendedorEnter(Sender: TObject);
begin

  MudarCorEdit(sender);
  sSenha := '';

end;

procedure TfrmPedido.edtVendedorExit(Sender: TObject);
begin

  MudarCorEdit(sender);


  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if (dmMProvider.cdsPedidoZeusVENDEDOR.Value > 0) then
    begin

      LimparMsgErro;

      if not dmMProvider.cdsFuncionarios.Locate('FUNCIONARIO', dmMProvider.cdsPedidoZeusVENDEDOR.Value, []) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtVendedor.SetFocus;

      end
      else
      begin

        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
        begin

          PostMessage(Handle, InputBoxMsg, 0, 0);

          sSenha := InputBox('Valida��o','INFORME SUA SENHA: ','');

          if length(Trim(sSenha)) > 0 then
          begin

            if dmMProvider.cdsFuncionariosSENHA.Value <> sSenha then
            begin

              lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
              Application.ProcessMessages;
              edtVendedor.SetFocus;

            end;

          end
          else
            edtVendedor.SetFocus;

        end;

      end;

    end
    else if dmMProvider.cdsPedidoZeusVENDEDOR.Value <= 0 then
    begin

      edtVendedor.SetFocus;
      dmMProvider.cdsPedidoZeusNOME.Value := '';

    end
    else if dmMProvider.cdsPedidoZeusVENDEDOR.Value > 0 then
    begin

      if not dmMProvider.cdsFuncionarios.Locate('FUNCIONARIO', dmMProvider.cdsPedidoZeusVENDEDOR.Value, []) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtVendedor.SetFocus;

      end
      else
      begin

        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
        begin

          PostMessage(Handle, InputBoxMsg, 0, 0);

          sSenha := InputBox('Valida��o','INFORME SUA SENHA: ','');

          if length(Trim(sSenha)) > 0 then
          begin

            if dmMProvider.cdsFuncionariosSENHA.Value <> sSenha then
            begin

              lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
              Application.ProcessMessages;
              edtVendedor.SetFocus;

            end;

          end
          else
            edtVendedor.SetFocus;

        end;

      end;

    end

    else
      edtCliente.SetFocus;

  end;



{
  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if (dmMProvider.cdsPedidoZeusVENDEDOR.Value > 0) and (Length(Trim(sSenha)) <= 0) then
    begin

      LimparMsgErro;

      if not dmMProvider.cdsFuncionarios.Locate('FUNCIONARIO', dmMProvider.cdsPedidoZeusVENDEDOR.Value, []) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtVendedor.SetFocus;

      end;

      if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
      begin

        PostMessage(Handle, InputBoxMsg, 0, 0);

        sSenha := InputBox('Valida��o','Informe sua senha: ','');

        if length(Trim(sSenha)) > 0 then
        begin

          if dmMProvider.cdsFuncionariosSENHA.Value <> sSenha then
          begin

            lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
            Application.ProcessMessages;
            edtVendedor.SetFocus;

          end;

        end
        else
          edtVendedor.SetFocus;

      end;

    end
    else if dmMProvider.cdsPedidoZeusVENDEDOR.Value <= 0 then
    begin

      edtVendedor.SetFocus;
      dmMProvider.cdsPedidoZeusNOME.Value := '';

    end
    else if dmMProvider.cdsPedidoZeusVENDEDOR.Value > 0 then
    begin

      if not dmMProvider.cdsFuncionarios.Locate('FUNCIONARIO', dmMProvider.cdsPedidoZeusVENDEDOR.Value, []) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtVendedor.SetFocus;

      end;

    end

    else
      edtCliente.SetFocus;

  end;
}
end;

procedure TfrmPedido.edtVendedorKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmPedido.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(handle);

  pgcPedido.Pages[1].TabVisible := False;

  Caption                       := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdItens.Columns.Count - 1 do
    grdItens.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdFinaliuzadora.Columns.Count - 1 do
    grdFinaliuzadora.Columns[i].Title.Color := COR_TITULO_GRADE;

  AbrirTabelas;

  lblCadastroItem.Visible                         := (dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0);
  imgFrete.Visible                                := lblCadastroItem.Visible;
  lblAutorizaDesconto.Visible                     := lblCadastroItem.Visible;
  dmRelatorios.rvsGenesisAC.SystemPrinter.Copies  := dmMProvider.cdsConfiguracoesQUANTIDADEDECOPIASDEPEDIDO.Value;
  imgPesquisaProduto.Visible                      := lblCadastroItem.Visible;
  imgHistoricoCliente.Visible                     := lblCadastroItem.Visible;
//  txtEntregaRetirado.Visible                      := (dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0);
//  txtReservadoi.Visible                           := txtEntregaRetirado.Visible;

//  dmRelatorios.rvpGenesisAC.DLLFile := ExtractFilePath(Application.ExeName) + 'Rav\RaveSolo.dll';

end;

procedure TfrmPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sUsuario, sSenha, sLinha:string;
begin

  case key of
    VK_F5:lblF5Click(self);
    VK_F7:begin //visualiza cadastro de produtos

            if Length(Trim(edtCodigoItem.Text)) > 0 then
            begin

              sUsuario := InputBox('Seguran�a','INFORME O NOME DO USU�RIO: ','');

              if Length(Trim(sUsuario)) > 0 then
              begin

                PostMessage(Handle, InputBoxMsg, 0, 0);

                sSenha := InputBox('Seguran�a','INFORME A SENHA: ','');

                if length(Trim(sSenha)) > 0 then
                begin

                  if ValidarUsuario(UpperCase(sUsuario), sSenha) then
                  begin

                    sLinha := ExtractFilePath(Application.ExeName)
                      + 'Produtos.exe '
                      + 'SYSDBA '
                      + 'masterkey '
                      + '999999 '
                      + IntToStr(dmDBEXMaster.iIdFilial) + ' P'
                      + Trim(edtCodigoItem.Text);

                    {
                      cria um processo para chamaar a tela
                      de manuten��o de estados
                    }

                    CriarProcessoSimples(sLinha);

                  end;

                end;

              end;

            end;

          end;
    VK_F8:begin //autoriza desconto

            bAutorizaDesconto := False;

            if (not dmMProvider.cdsPedidoZeus.IsEmpty) or (not dmMProvider.cdsItemPedZeus.IsEmpty) then
            begin

              sUsuario_autorizou := InputBox('Seguran�a','INFORME O NOME DO USU�RIO: ','');

              if Length(Trim(sUsuario_autorizou)) > 0 then
              begin

                PostMessage(Handle, InputBoxMsg, 0, 0);

                sSenha := InputBox('Seguran�a','INFORME A SENHA: ','');

                if length(Trim(sSenha)) > 0 then
                  bAutorizaDesconto := ValidarUsuario(UpperCase(sUsuario_autorizou), sSenha);

              end;

            end;

          end;
  end;

end;

procedure TfrmPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin

  try

    if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirFinalizPedidoZeus)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExluirFinalizPedidoExecute(self);

    end

    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ConfirmarLancPedidoZEUS)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actIntegracaoPedidoZeusExecute(self);

    end

    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirItemPedidoZeus))  then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExcluirItemPedidoZeusExecute(self);

    end
    else if (UpperCase(key) = 'S') and (lblMsg.Tag = ord(ConfirmarLancPedidoRT)) then
    begin

      Key         := #0;
      lblMsg.Tag  := 0;
      actConfirmarLanRTExecute(self);

    end
    else if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
    begin

      Key         := #0;
      lblMsg.Tag  := 0;
      actExcluirExecute(self);

    end
    else if (UpperCase(Key) = 'N') AND (lblMsg.Tag <> ord(nulo)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      LimparMsgErro;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

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

procedure TfrmPedido.grdFinaliuzadoraDblClick(Sender: TObject);
begin

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    if not  dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
    begin

      cboFormaPagamento.KeyValue  := dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value;
      edtValorFinaliz.Text        := FormatFloat('#,##0.00',dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value);
      edtValorFinaliz.SetFocus;

    end;

  end;

end;

procedure TfrmPedido.grdFinaliuzadoraDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
  begin

    if not odd(dmMProvider.cdsFinalizadoraPedZeus.RecNo) then
    begin

      grdFinaliuzadora.Canvas.Font.Color   := clBlack;
      grdFinaliuzadora.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdFinaliuzadora.Canvas.Font.Color   := clBlack;
      grdFinaliuzadora.Canvas.Brush.Color  := clWhite;

    end;

    grdFinaliuzadora.Canvas.FillRect(Rect);
    grdFinaliuzadora.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmPedido.grdFinaliuzadoraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        LimparMsgErro;

        if dmMProvider.cdsFinalizadoraPedZeus.Active then
        begin

          if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
          begin

            lblMsg.Tag      := ord(ExcluirFinalizPedidoZeus);
            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

          end;

        end;

      end;

  end;

end;

procedure TfrmPedido.grdItensDblClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsPedidoZeus) then
  begin

    dmMProvider.cdsPesqProdutos.Close;
    dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

    dmDBEXMaster.fdqPesqProdutos.Close;
    dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.*, UND.PERMITE_VENDA_FRACIONADA  as FRACAO FROM PRODUTO PRO');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = '+ InttoStr(dmMProvider.cdsItemPedZeusPRODUTO.Value));
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial= '+ InttoStr(dmDBEXMaster.iIdFilial));
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pro.visibilidade = 1');

    dmMProvider.cdsPesqProdutos.Open;
    dmMProvider.cdsPesqProdutos.ProviderName := '';

    CarregarInfItens;
    edtQuantidadeItem.SetFocus;

  end;

end;

procedure TfrmPedido.grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsItemPedZeus.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItemPedZeus.RecNo) then
    begin

      grdItens.Canvas.Font.Color   := clBlack;
      grdItens.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdItens.Canvas.Font.Color   := clBlack;
      grdItens.Canvas.Brush.Color  := clWhite;

    end;

    grdItens.Canvas.FillRect(Rect);
    grdItens.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmPedido.grdItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if InserindoEditando(dmMProvider.cdsPedidoZeus) then
  begin

    case Key of

      VK_DELETE:
        begin

          LimparMsgErro;

          if dmMProvider.cdsItemPedZeus.Active then
          begin

            if not dmMProvider.cdsItemPedZeus.IsEmpty then
            begin

              lblMsg.Tag      := ord(ExcluirItemPedidoZeus);
              lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

            end;

          end;

        end;

    end;

  end;

end;

procedure TfrmPedido.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    pgcPedido.Pages[1].TabVisible := True;
    pgcPedido.ActivePageIndex     := 1;

  end;

end;

procedure TfrmPedido.grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    if not odd(dmMProvider.cdsPedidoZeus.RecNo) then
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := clWhite;

    end;

    grdTabela.Canvas.FillRect(Rect);
    grdTabela.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmPedido.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(self);

end;

procedure TfrmPedido.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgAlertaPAF);

  try

    case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
      3:begin //zeus

          if dmMProvider.cdsPedidoZeus.Active then
          begin

            if not ValidarFreteClientePedido then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' em pedidos com frete com pagamento a prazo � preciso informar o cliente';
              edtCliente.SetFocus;
              exit;

            end;

            actSalvarExecute(Self);

            if ConsisteValorRecebido_TotalPedido then
            begin

              AbrirTabelaPedidoZeus(0,IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

              if not (dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]) then
              begin

                LimparMsgErro;

                if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1 then
                begin

                  case dmMProvider.cdsPedidoZeusSITUACAO.Value of
                    0:begin

                        lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO;

                      end;
                    1:begin

                        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
                        begin

                          bAutorizouEstorno := False;

                          if (not dmMProvider.cdsPedidoZeus.IsEmpty) or (not dmMProvider.cdsItemPedZeus.IsEmpty) then
                          begin

                            sUsuario_autorizou := InputBox('Seguran�a','INFORME O NOME DO USU�RIO: ','');

                            if Length(Trim(sUsuario_autorizou)) > 0 then
                            begin

                              PostMessage(Handle, InputBoxMsg, 0, 0);

                              sSenha := InputBox('Seguran�a','INFORME A SENHA: ','');

                              if length(Trim(sSenha)) > 0 then
                                bAutorizouEstorno := ValidarUsuario(UpperCase(sUsuario_autorizou), sSenha);

                            end;

                          end;

                          if bAutorizouEstorno then
                          begin

                            lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

                          end;

                        end
                        else
                        begin

                          lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

                        end;

                    end

                  else

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DOCUMENTO_CONFIRMADO;

                  end;

                end
                else
                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_STATUS_PED_ORCAMENTO;

                Application.ProcessMessages;

              end;
            end
            else
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLR_REC_VLR_PED;
              Application.ProcessMessages;

            end;

          end;

        end;
      4:begin //djpdv

          if dmMProvider.cdsPedidoZeus.Active then
          begin

            if not ValidarFreteClientePedido then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' em pedidos com frete com pagamento a prazo � preciso informar o cliente';
              edtCliente.SetFocus;
              exit;

            end;

            actSalvarExecute(Self);

            if ConsisteValorRecebido_TotalPedido then
            begin

              AbrirTabelaPedidoZeus(0,IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

              if not (dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]) then
              begin

                LimparMsgErro;

                if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1 then
                begin

                  case dmMProvider.cdsPedidoZeusSITUACAO.Value of
                    0:begin

                        lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO;

                      end;
                    1:begin

                        if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
                        begin

                          bAutorizouEstorno := False;

                          if (not dmMProvider.cdsPedidoZeus.IsEmpty) or (not dmMProvider.cdsItemPedZeus.IsEmpty) then
                          begin

                            sUsuario_autorizou := InputBox('Seguran�a','INFORME O NOME DO USU�RIO: ','');

                            if Length(Trim(sUsuario_autorizou)) > 0 then
                            begin

                              PostMessage(Handle, InputBoxMsg, 0, 0);

                              sSenha := InputBox('Seguran�a','INFORME A SENHA: ','');

                              if length(Trim(sSenha)) > 0 then
                                bAutorizouEstorno := ValidarUsuario(UpperCase(sUsuario_autorizou), sSenha);

                            end;

                          end;

                          if bAutorizouEstorno then
                          begin

                            lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

                          end;

                        end
                        else
                        begin

                          lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

                        end;

                    end

                  else

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DOCUMENTO_CONFIRMADO;

                  end;

                end
                else
                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_STATUS_PED_ORCAMENTO;

                Application.ProcessMessages;

              end;
            end
            else
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLR_REC_VLR_PED;
              Application.ProcessMessages;

            end;

          end;

        end;

      else
      begin

        if not ValidarFreteClientePedido then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' em pedidos com frete com pagamento a prazo � preciso informar o cliente';
          edtCliente.SetFocus;
          exit;

        end;

        actSalvarExecute(Self);

        if ConsisteValorRecebido_TotalPedido then
        begin

          AbrirTabelaPedidoZeus(0,IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

          if not (dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]) then
          begin

            LimparMsgErro;

            if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1 then
            begin

              case dmMProvider.cdsPedidoZeusSITUACAO.Value of
                0:begin

                    lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO;

                  end;
                1:begin

                    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
                    begin

                      bAutorizouEstorno := False;

                      if (not dmMProvider.cdsPedidoZeus.IsEmpty) or (not dmMProvider.cdsItemPedZeus.IsEmpty) then
                      begin

                        sUsuario_autorizou := InputBox('Seguran�a','INFORME O NOME DO USU�RIO: ','');

                        if Length(Trim(sUsuario_autorizou)) > 0 then
                        begin

                          PostMessage(Handle, InputBoxMsg, 0, 0);

                          sSenha := InputBox('Seguran�a','INFORME A SENHA: ','');

                          if length(Trim(sSenha)) > 0 then
                            bAutorizouEstorno := ValidarUsuario(UpperCase(sUsuario_autorizou), sSenha);

                        end;

                      end;

                      if bAutorizouEstorno then
                      begin

                        lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

                      end;

                    end
                    else
                    begin

                      lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
                      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

                    end;

                end

              else

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DOCUMENTO_CONFIRMADO;

              end;

            end
            else
              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_STATUS_PED_ORCAMENTO;

            Application.ProcessMessages;

          end;
        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLR_REC_VLR_PED;
          Application.ProcessMessages;

        end;

      end;

    end;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;


  end;

end;

procedure TfrmPedido.imgImprimirClick(Sender: TObject);
var
  sOrcamento_Controle:string;
begin

  case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
    3:begin

        if not dmMProvider.cdsPedidoZeus.IsEmpty then
        begin

          if dmMProvider.cdsPedidoZeus.RecordCount > 1 then
          begin

            AbrirTabelaPedidoZeus(0,IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

            RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
            RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
            RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,  dmDBEXMaster.iIdFilial);

          end;

          if (dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 0) and (dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 1) then
          begin

            dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
            dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemPedZeus;

            LimparMsgErro;

            sOrcamento_Controle := '';

            if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
            begin

              dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
              dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamento',true);
              dmRelatorios.rvpGenesisAC.SetParam('pIDSistema',ID_SISTEMA);
              dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
              dmRelatorios.rvpGenesisAC.SetParam('pID_Sistema',ID_SISTEMA);
              dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsClientesCNPJ.Value));
              dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

              if dmMProvider.cdsFilialNUMERO.Value > 0 then
                dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
              else
                dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

              dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value +' / ' + dmMProvider.cdsFilialTELEFONE2.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);

              if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 0 then
                sOrcamento_Controle := 'OR�AMENTO'
              else
                sOrcamento_Controle := 'CONTROLE';

              dmRelatorios.rvpGenesisAC.SetParam('pOrcamento_Controle',sOrcamento_Controle);

              dmRelatorios.rvpGenesisAC.Execute;
              dmRelatorios.rvpGenesisAC.Close;

            end
            else
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
              Application.ProcessMessages;

            end;

          end
          else if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
          begin

            dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
            dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemPedZeus;

            LimparMsgErro;

            sOrcamento_Controle := '';

            if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
            begin

              dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';

              if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 0 then
              begin

                dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamentoPV',true);
                sOrcamento_Controle := 'OR�AMENTO';

                if dmMProvider.cdsPedidoZeusCLIENTE.Value = 0 then
                begin

                  dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsEndEntregaPedZeusENDERECO.Value);

                  if dmMProvider.cdsEndEntregaPedZeusNUMERO.Value > 0 then
                    dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',IntToStr(dmMProvider.cdsEndEntregaPedZeusNUMERO.Value))
                  else
                    dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente','S/N');

                  dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsEndEntregaPedZeusCEP.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsEndEntregaPedZeusCIDADE.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsEndEntregaPedZeusESTADO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pMensagemEntrega',dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value);

                end
                else
                begin

                  if Length(trim(dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value)) <= 0 then
                  begin

                    dmMProvider.cdsClientes.Close;
                    dmMProvider.cdsClientes.ProviderName := 'dspClientes';

                    dmDBEXMaster.fdqClientes.SQL.Clear;
                    dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
                    dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
                    dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
                    dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
                    dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
                    dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
                    dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
                    dmDBEXMaster.fdqClientes.SQL.Add('where cliente = ' + IntToStr(dmMProvider.cdsPedidoZeusCLIENTE.Value));

                    dmMProvider.cdsClientes.Open;
                    dmMProvider.cdsClientes.ProviderName := '';

                    dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsClientesRAZAOSOCIAL.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsClientesENDERECO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',dmMProvider.cdsClientesNUMERO.AsString);
                    dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsClientesCEP.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsClientesBAIRRO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsClientesNOME_CIDADE.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsClientesESTADO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsClientesCOMPLEMENTO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsClientesDDD.Value + dmMProvider.cdsClientesTELEFONE1.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente',dmMProvider.cdsPedidoZeusCLIENTE.AsString);

                  end
                  else
                  begin

                    dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsEndEntregaPedZeusENDERECO.Value);

                    if dmMProvider.cdsEndEntregaPedZeusNUMERO.Value > 0 then
                      dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',IntToStr(dmMProvider.cdsEndEntregaPedZeusNUMERO.Value))
                    else
                      dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente','S/N');

                    dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsEndEntregaPedZeusCEP.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsEndEntregaPedZeusCIDADE.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsEndEntregaPedZeusESTADO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value);
                    dmRelatorios.rvpGenesisAC.SetParam('pMensagemEntrega',dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value);

                  end;

                end;

              end
              else
              begin

                if dmMProvider.cdsPedidoZeusENTREGA.Value = 1 then
                begin

                  dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsEndEntregaPedZeusENDERECO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',dmMProvider.cdsEndEntregaPedZeusNUMERO.AsString);
                  dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsEndEntregaPedZeusCEP.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsEndEntregaPedZeusCIDADE.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsEndEntregaPedZeusESTADO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pMensagemEntrega',dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value);

                  if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                    dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente',dmMProvider.cdsPedidoZeusCLIENTE.AsString)
                  else
                    dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente','');

                end
                else if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                begin

                  dmMProvider.cdsClientes.Close;
                  dmMProvider.cdsClientes.ProviderName := 'dspClientes';

                  dmDBEXMaster.fdqClientes.SQL.Clear;
                  dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
                  dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
                  dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
                  dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
                  dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
                  dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
                  dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
                  dmDBEXMaster.fdqClientes.SQL.Add('where cliente = ' + IntToStr(dmMProvider.cdsPedidoZeusCLIENTE.Value));

                  dmMProvider.cdsClientes.Open;
                  dmMProvider.cdsClientes.ProviderName := '';

                  dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsClientesRAZAOSOCIAL.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsClientesENDERECO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',dmMProvider.cdsClientesNUMERO.AsString);
                  dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsClientesCEP.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsClientesBAIRRO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsClientesNOME_CIDADE.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsClientesESTADO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsClientesCOMPLEMENTO.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsClientesDDD.Value + dmMProvider.cdsClientesTELEFONE1.Value);
                  dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente',dmMProvider.cdsPedidoZeusCLIENTE.AsString);

                end;

                dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamentoPV',true);
                sOrcamento_Controle := 'CONTROLE';

              end;

              dmRelatorios.rvpGenesisAC.SetParam('pIDSistema',ID_SISTEMA);
              dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
              dmRelatorios.rvpGenesisAC.SetParam('pID_Sistema',ID_SISTEMA);
              dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsClientesCNPJ.Value));
              dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

              if dmMProvider.cdsFilialNUMERO.Value > 0 then
                dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
              else
                dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

              dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value +' / ' + dmMProvider.cdsFilialTELEFONE2.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pOrcamento_Controle',sOrcamento_Controle);

              dmRelatorios.rvpGenesisAC.Execute;
              dmRelatorios.rvpGenesisAC.Close;

            end;

          end
          else
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_IMPRIMIR_APENAS_ORCAMENTO;
            Application.ProcessMessages;

          end;


        end;

      end;
    4:begin

      end;
    else
    begin

      if not dmMProvider.cdsPedidoZeus.IsEmpty then
      begin

        if dmMProvider.cdsPedidoZeus.RecordCount > 1 then
        begin

          AbrirTabelaPedidoZeus(0,IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

          RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
          RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
          RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,  dmDBEXMaster.iIdFilial);

        end;

        dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
        dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemPedZeus;

        LimparMsgErro;

        sOrcamento_Controle := '';

        if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
        begin

          dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';

          if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 0 then
          begin

            dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamentoPV',true);
            sOrcamento_Controle := 'OR�AMENTO';

            if dmMProvider.cdsPedidoZeusCLIENTE.Value = 0 then
            begin

              dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsEndEntregaPedZeusENDERECO.Value);

              if dmMProvider.cdsEndEntregaPedZeusNUMERO.Value > 0 then
                dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',IntToStr(dmMProvider.cdsEndEntregaPedZeusNUMERO.Value))
              else
                dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente','S/N');

              dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsEndEntregaPedZeusCEP.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsEndEntregaPedZeusCIDADE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsEndEntregaPedZeusESTADO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pMensagemEntrega',dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value);

            end
            else
            begin

              if Length(trim(dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value)) <= 0 then
              begin

                dmMProvider.cdsClientes.Close;
                dmMProvider.cdsClientes.ProviderName := 'dspClientes';

                dmDBEXMaster.fdqClientes.SQL.Clear;
                dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
                dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
                dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
                dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
                dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
                dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
                dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
                dmDBEXMaster.fdqClientes.SQL.Add('where cliente = ' + IntToStr(dmMProvider.cdsPedidoZeusCLIENTE.Value));

                dmMProvider.cdsClientes.Open;
                dmMProvider.cdsClientes.ProviderName := '';

                dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsClientesRAZAOSOCIAL.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsClientesENDERECO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',dmMProvider.cdsClientesNUMERO.AsString);
                dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsClientesCEP.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsClientesBAIRRO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsClientesNOME_CIDADE.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsClientesESTADO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsClientesCOMPLEMENTO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsClientesDDD.Value + dmMProvider.cdsClientesTELEFONE1.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente',dmMProvider.cdsPedidoZeusCLIENTE.AsString);

              end
              else
              begin

                dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsEndEntregaPedZeusENDERECO.Value);

                if dmMProvider.cdsEndEntregaPedZeusNUMERO.Value > 0 then
                  dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',IntToStr(dmMProvider.cdsEndEntregaPedZeusNUMERO.Value))
                else
                  dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente','S/N');

                dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsEndEntregaPedZeusCEP.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsEndEntregaPedZeusCIDADE.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsEndEntregaPedZeusESTADO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value);
                dmRelatorios.rvpGenesisAC.SetParam('pMensagemEntrega',dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value);

              end;

            end;

          end
          else
          begin

            if dmMProvider.cdsPedidoZeusENTREGA.Value = 1 then
            begin

              dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsEndEntregaPedZeusENDERECO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',dmMProvider.cdsEndEntregaPedZeusNUMERO.AsString);
              dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsEndEntregaPedZeusCEP.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsEndEntregaPedZeusCIDADE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsEndEntregaPedZeusESTADO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pMensagemEntrega',dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value);

              if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente',dmMProvider.cdsPedidoZeusCLIENTE.AsString)
              else
                dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente','');

            end
            else if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
            begin

              dmMProvider.cdsClientes.Close;
              dmMProvider.cdsClientes.ProviderName := 'dspClientes';

              dmDBEXMaster.fdqClientes.SQL.Clear;
              dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
              dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
              dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
              dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
              dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
              dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
              dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
              dmDBEXMaster.fdqClientes.SQL.Add('where cliente = ' + IntToStr(dmMProvider.cdsPedidoZeusCLIENTE.Value));

              dmMProvider.cdsClientes.Open;
              dmMProvider.cdsClientes.ProviderName := '';

              dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',dmMProvider.cdsClientesRAZAOSOCIAL.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pEnderecoCliente',dmMProvider.cdsClientesENDERECO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pNumeroCliente',dmMProvider.cdsClientesNUMERO.AsString);
              dmRelatorios.rvpGenesisAC.SetParam('pCepCliente',dmMProvider.cdsClientesCEP.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pBairroCliente',dmMProvider.cdsClientesBAIRRO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pCidadeCliente',dmMProvider.cdsClientesNOME_CIDADE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pUFCliente',dmMProvider.cdsClientesESTADO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pComplementoCliente',dmMProvider.cdsClientesCOMPLEMENTO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTelefoneCliente',dmMProvider.cdsClientesDDD.Value + dmMProvider.cdsClientesTELEFONE1.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTipoCliente',dmMProvider.cdsPedidoZeusCLIENTE.AsString);

            end;

            dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamentoPV',true);
            sOrcamento_Controle := 'CONTROLE';

          end;

          dmRelatorios.rvpGenesisAC.SetParam('pIDSistema',ID_SISTEMA);
          dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
          dmRelatorios.rvpGenesisAC.SetParam('pID_Sistema',ID_SISTEMA);
          dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsClientesCNPJ.Value));
          dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

          if dmMProvider.cdsFilialNUMERO.Value > 0 then
            dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
          else
            dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

          dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value +' / ' + dmMProvider.cdsFilialTELEFONE2.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pOrcamento_Controle',sOrcamento_Controle);

          dmRelatorios.rvpGenesisAC.Execute;
          dmRelatorios.rvpGenesisAC.Close;

        end;

      end;

    end;
  end;


end;

procedure TfrmPedido.imgPesqClienteClick(Sender: TObject);
begin

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    frmPesquisaCliente      := TfrmPesquisaCliente.Create(self);
    frmPesquisaCliente.Tag  := 1;

    if frmPesquisaCliente.ShowModal = mrOK then
    begin

      dmMProvider.cdsPedidoZeusCLIENTE.Value := dmMProvider.cdsClientesCLIENTE.Value;
      edtCodigoItem.SetFocus;

    end
    else
      edtCliente.SetFocus;

    FreeAndNil(frmPesquisaCliente);

  end;

end;

procedure TfrmPedido.imgPesquisaItemClick(Sender: TObject);
begin

  sBarrasZeus             := '';

  frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
  frmPesquisaProduto.Tag  := 1;

  if frmPesquisaProduto.ShowModal = mrOK then
  begin

    iProduto                  := dmMProvider.cdsPesqProdutosPRODUTO.Value;
    edtCodigoItem.Text        := InttoStr(iProduto);
    edtDescricaoItem.Text     := dmMProvider.cdsPesqProdutosDESCRICAO.Value;
    edtUnidadeItem.Text       := dmMProvider.cdsPesqProdutosUNIDADE.Value;

    if dmMProvider.cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO.Value = 1 then { RT }
      edtSaldoAtual.Text        := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosSALDO_ATUAL.Value)
    else
      edtSaldoAtual.Text        := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosSALDO_ATUAL.Value - dmMProvider.cdsPesqProdutosSALDO_ALMOXARIFADO.Value);

    dmDBEXMaster.fdqBarras.Close;
    dmDBEXMaster.fdqBarras.SQL.Clear;
    dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
    dmDBEXMaster.fdqBarras.SQL.Add('where produto  = ' + IntToStr(iProduto));
    dmDBEXMaster.fdqBarras.Open;

    sBarras := dmDBEXMaster.fdqBarras.FieldByName('BARRAS').Value;

    if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value = 0 then
    begin

      if (dmDBEXMaster.fdqBarras.FieldByName('GERADO').Value = 1) then
        sBarras := '0' + Copy(sBarras,1, Length(sBarras) - 1);

    end
    else
      sBarras := sBarras;

    sBarrasZeus := FormatFloat('00000000000000000',StrToFloat(sBarras));

    case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
      3:begin

          if not PesquisarMercadoriaZes(sBarrasZeus) then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_MERC_ZEUS + ' ' + dmMProvider.cdsPesqProdutosDESCRICAO.Value;
            imgAlertaPAF.Visible := true;
            Application.ProcessMessages;
            TocarSomAlerta(ord(SystemHand));
            edtCodigoItem.SetFocus;

            Exit;

          end
          else
          begin

            imgAlertaPAF.Visible := False;
            Application.ProcessMessages;

          end;

        end;
      4:begin

          case dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value of
            0:begin

                if not PesquisarMercadoriaDJPdv(FormatFloat('00000000000000000000',dmMProvider.cdsPesqProdutosPRODUTO.Value)) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_MERC_ZEUS + ' ' + dmMProvider.cdsPesqProdutosDESCRICAO.Value;
                  imgAlertaPAF.Visible := true;
                  Application.ProcessMessages;
                  TocarSomAlerta(ord(SystemHand));
                  edtCodigoItem.SetFocus;

                  Exit;

                end
                else
                begin

                  imgAlertaPAF.Visible := False;
                  Application.ProcessMessages;

                end;

            end;
          1:begin

              if not PesquisarMercadoriaDJPdv(IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value)) then
              begin

                lblMsg.Caption        := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_MERC_ZEUS + ' ' + dmMProvider.cdsPesqProdutosDESCRICAO.Value;
                imgAlertaPAF.Visible  := true;
                Application.ProcessMessages;

                TocarSomAlerta(ord(SystemHand));

                edtCodigoItem.SetFocus;

                Exit;

              end;

            end;

          end;

        end;

    end;

    if dmMProvider.cdsPesqProdutosPROMOCAO.Value = 0 then
      edtValorUnitarioItem.Text := FormatFloat('#,##0.00', dmMProvider.cdsPesqProdutosPRECODEVENDA.Value)
    else
      edtValorUnitarioItem.Text := FormatFloat('#,##0.00', dmMProvider.cdsPesqProdutosPRECOPROMOCAO.Value);

      edtQuantidadeItem.SetFocus;

    RelacionarAliquotaICMS(dmMProvider.cdsPesqProdutosTRIBUTACAO.Value);

  end;

  FreeAndNil(frmPesquisaProduto);

end;

procedure TfrmPedido.imgPesquisaProdutoClick(Sender: TObject);
begin

  frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
  frmPesquisaProduto.Tag  := 1;

  frmPesquisaProduto.ShowModal;
  FreeAndNil(frmPesquisaProduto);

end;

procedure TfrmPedido.imgPesqVendedorClick(Sender: TObject);
begin

  if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
  begin

    frmPesquisaFuncionario      := TfrmPesquisaFuncionario.Create(self);
    frmPesquisaFuncionario.Tag  := 1;

    if frmPesquisaFuncionario.ShowModal = mrOK then
    begin

      PostMessage(Handle, InputBoxMsg, 0, 0);

      sSenha := InputBox('Valida��o','INFORME SUA SENHA: ','');

      if length(Trim(sSenha)) > 0 then
      begin

        if dmMProvider.cdsFuncionariosSENHA.Value <> sSenha then
        begin

          lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
          Application.ProcessMessages;
          edtVendedor.SetFocus;
          sSenha := '';

        end
        else
        begin

          dmMProvider.cdsPedidoZeusVENDEDOR.Value := dmMProvider.cdsFuncionariosFUNCIONARIO.Value;
          edtCliente.SetFocus;

        end;

      end
      else
        edtVendedor.SetFocus;

    end
    else
      edtVendedor.SetFocus;

    FreeAndNil(frmPesquisaFuncionario);

  end;

end;

procedure TfrmPedido.IncluirEndEntrega;
begin

  RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

  if dmMProvider.cdsEndEntregaPedZeus.IsEmpty then
    dmMProvider.cdsEndEntregaPedZeus.Append
  else
    dmMProvider.cdsEndEntregaPedZeus.Edit;

  if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
  begin

    dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value      := dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value;
    dmMProvider.cdsEndEntregaPedZeusENDERECO.Value          := dmMProvider.cdsClientesENDERECOENTREGA.Value;
    dmMProvider.cdsEndEntregaPedZeusNUMERO.Value            := dmMProvider.cdsClientesNUMEROENTREGA.Value;
    dmMProvider.cdsEndEntregaPedZeusCEP.Value               := dmMProvider.cdsClientesCEPENTREGA.Value;
    dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value            := dmMProvider.cdsClientesBAIRROENTREGA.Value;
    dmMProvider.cdsEndEntregaPedZeusCIDADE.Value            := dmMProvider.cdsClientesNOME_CIDADE.Value;
    dmMProvider.cdsEndEntregaPedZeusESTADO.Value            := dmMProvider.cdsClientesESTADOENTREGA.Value;
    dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value       := dmMProvider.cdsClientesCOMPLEMENTO.Value;
    dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value  := dmMProvider.cdsClientesDDD.Value + dmMProvider.cdsClientesTELEFONE1.Value

  end
  else
  begin

    dmMProvider.cdsEndEntregaPedZeusCIDADE.Value            := dmMProvider.cdsFilialNOMECIDADE.Value;
    dmMProvider.cdsEndEntregaPedZeusESTADO.Value            := dmMProvider.cdsFilialESTADO.Value;
    dmMProvider.cdsEndEntregaPedZeusHORA_TRANSACAO.Value    := Time;

  end;

end;

procedure TfrmPedido.InputBoxSet(var Msg: TMessage);
var
  i: integer;
begin

  for i:=0 to Screen.Forms[0].ComponentCount-1 do
  begin

    if Screen.Forms[0].Components[i] is TEdit then
    begin

      with TEdit( Screen.Forms[0].Components[i] ) do
      begin

        PasswordChar := '*'; //Aqui est� o caractere q ir� aparecer na inputbox
        Clear;               //Limpamos a caixa de digita��o da senha.

      end;

    end;

  end;

end;

function TfrmPedido.Lancar_CRE(pOpcao:smallint):boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMProvider.cdsParcelasPedZeus.First;

    while not dmMProvider.cdsParcelasPedZeus.Eof do
    begin

      dmMProvider.cdsFormasPagamento.Locate('FORMAPAGAMENTO',dmMProvider.cdsParcelasPedZeusFORMA_PAGAMENTO.Value, []);

      dmMSProcedure.fdspCre.Params[0].Value     := pOpcao;
      dmMSProcedure.fdspCre.Params[1].Value     := -1;
      dmMSProcedure.fdspCre.Params[2].Value     := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspCre.Params[3].Value     := 'PV' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-'+ IntToStr(dmMProvider.cdsParcelasPedZeus.RecNo) + '/' + IntToStr(dmMProvider.cdsParcelasPedZeus.RecordCount);
      dmMSProcedure.fdspCre.Params[4].Value     := 0;                                       {situa��o}
      dmMSProcedure.fdspCre.Params[5].Value     := dmMProvider.cdsPedidoZeusEMISSAO.Value;  {data da entrada}
      dmMSProcedure.fdspCre.Params[6].Value     := dmMProvider.cdsPedidoZeusCLIENTE.Value;
      dmMSProcedure.fdspCre.Params[7].Value     := 0;                                       {ver o que � tipo}
      dmMSProcedure.fdspCre.Params[8].Value     := dmMProvider.cdsPedidoZeusEMISSAO.Value;
      dmMSProcedure.fdspCre.Params[9].Value     := dmMProvider.cdsParcelasPedZeusVENCIMENTO.Value;
      dmMSProcedure.fdspCre.Params[10].Value    := 0;                                       {tipo moeda}
      dmMSProcedure.fdspCre.Params[11].Value    := dmMProvider.cdsParcelasPedZeusVALOR.Value;

      case dmMProvider.cdsConfiguracoesTIPOMORADIARIA.Value of
        0:dmMSProcedure.fdspCre.Params[12].Value    := dmMProvider.cdsConfiguracoesMORADIARIA.Value;
        1:dmMSProcedure.fdspCre.Params[12].Value    := Trunc(dmMProvider.cdsParcelasPedZeusVALOR.Value * (dmMProvider.cdsConfiguracoesMORADIARIA.Value / 100));
      end;

      dmMSProcedure.fdspCre.Params[13].Value    := 0;                                       {desconto}
      dmMSProcedure.fdspCre.Params[14].Value    := null;                                    {data do desconto}
      dmMSProcedure.fdspCre.Params[15].Value    := 'LANCAMENTO EFETUADO POR PEDIDO DE VENDA N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
      dmMSProcedure.fdspCre.Params[16].Value    := 0;                                       {posicao}
      dmMSProcedure.fdspCre.Params[17].Value    := 0;                                       {desconto concedito}
      dmMSProcedure.fdspCre.Params[18].Value    := 0;                                       {abatimentos}
      dmMSProcedure.fdspCre.Params[19].Value    := 0;                                       {outras despesas}
      dmMSProcedure.fdspCre.Params[20].Value    := dmMProvider.cdsFormasPagamentoPLANODECONTAS.Value;
      dmMSProcedure.fdspCre.Params[21].Value    := dmMProvider.cdsFormasPagamentoITEMPLANODECONTAS.Value;
      dmMSProcedure.fdspCre.Params[22].Value    := dmMProvider.cdsFormasPagamentoLANCAMENTO.Value;
      dmMSProcedure.fdspCre.Params[23].Value    := 0;                                       {tipo cobran�a}
      dmMSProcedure.fdspCre.Params[24].Value    := null;                                    {conta corrente}
      dmMSProcedure.fdspCre.Params[25].Value    := null;                                    {carteira}
      dmMSProcedure.fdspCre.Params[26].Value    := 0;                                       {tipo parcela}
      dmMSProcedure.fdspCre.Params[27].Value    := null;                                    {pedido de venda}
      dmMSProcedure.fdspCre.Params[28].Value    := Date;                                    {data}
      dmMSProcedure.fdspCre.Params[29].Value    := 0;                                       {percentual}
      dmMSProcedure.fdspCre.Params[30].Value    := 0;                                       {redu��o}
      dmMSProcedure.fdspCre.Params[31].Value    := 0;                                       {valor comiss�o}
      dmMSProcedure.fdspCre.Params[32].Value    := null;                                    {nf saida}
      dmMSProcedure.fdspCre.Params[33].Value    := null;                                    {observa��es}
      dmMSProcedure.fdspCre.Params[34].Value    := 0;                                       {valor chq devolvido}
      dmMSProcedure.fdspCre.Params[35].Value    := 0;                                       {sequencial}
      dmMSProcedure.fdspCre.Params[36].Value    := 0;                                       {outros d�bitos}

      dmMSProcedure.fdspCre.ExecProc;

      if dmMProvider.cdsClientes.Locate('CLIENTE', dmMProvider.cdsPedidoZeusCLIENTE.Value, []) then
      begin

        dmMSProcedure.fdspAtlzSaldoCliente.Params[0].Value := pOpcao;
        dmMSProcedure.fdspAtlzSaldoCliente.Params[1].Value := dmMProvider.cdsClientesCNPJ.Value;
        dmMSProcedure.fdspAtlzSaldoCliente.Params[2].Value := dmMProvider.cdsParcelasPedZeusVALOR.Value;
        dmMSProcedure.fdspAtlzSaldoCliente.ExecProc;

      end;

      dmMProvider.cdsParcelasPedZeus.Next;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;
    Result := true;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;
    Result := False;

  end;

end;

procedure TfrmPedido.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsPedidoZeus.Active then
  begin

    if not (dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert]) then
    begin

      LimparMsgErro;

      AbrirTabelaPedidoZeus(0,IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

      if dmMProvider.cdsPedidoZeusSITUACAO.Value = 0 then
      begin

        lblMsg.Tag      := -1;
        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

      end
      else
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE;
        Application.ProcessMessages;

      end;

    end;

  end;


end;

procedure TfrmPedido.LimparControlesItem;
begin

  edtCodigoItem.Clear;
  edtDescricaoItem.Clear;
  edtUnidadeItem.Clear;
  edtSaldoAtual.Text            := '0,000';
  edtQuantidadeItem.Text        := '1,000';
  edtValorUnitarioItem.Text     := '0,00';
  edtValorDescontoItem.Text     := '0,00';
  edtValorAcrescimoItem.Text    := '0,00';
  edtSubTotalItem.Text          := '0,00';

end;

procedure TfrmPedido.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

function TfrmPedido.Man_Tab_ClienteEntrega:boolean;
begin

  if dmMProvider.cdsPedidoZeusCLIENTE.Value <= 0 then
  begin

    if not dmMProvider.cdsEndEntregaPedZeus.IsEmpty then
    begin

      try

//        if not dmDBEXMaster.fdcMaster.InTransaction then
        if not dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.StartTransaction;

        dmMSProcedure.fdspClienteEntrega.Params[0].Value    := dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value;
        dmMSProcedure.fdspClienteEntrega.Params[1].Value    := dmMProvider.cdsEndEntregaPedZeusENDERECO.Value;
        dmMSProcedure.fdspClienteEntrega.Params[2].Value    := dmMProvider.cdsEndEntregaPedZeusNUMERO.AsString;
        dmMSProcedure.fdspClienteEntrega.Params[3].Value    := dmMProvider.cdsEndEntregaPedZeusCEP.Value;
        dmMSProcedure.fdspClienteEntrega.Params[4].Value    := dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value;
        dmMSProcedure.fdspClienteEntrega.Params[5].Value    := dmMProvider.cdsEndEntregaPedZeusCIDADE.Value;
        dmMSProcedure.fdspClienteEntrega.Params[6].Value    := dmMProvider.cdsEndEntregaPedZeusESTADO.Value;
        dmMSProcedure.fdspClienteEntrega.Params[7].Value    := dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value;
        dmMSProcedure.fdspClienteEntrega.Params[8].Value    := dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value;

        dmMSProcedure.fdspClienteEntrega.ExecProc;

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Commit;

        RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

        Result := True;

      except
        on E: exception do
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);

//          if dmDBEXMaster.fdcMaster.InTransaction then
          if dmDBEXMaster.fdtMaster.Active then
            dmDBEXMaster.fdtMaster.Rollback;

          Result := False;

        end;

      end;

    end
    else
      Result := dmMProvider.cdsEndEntregaPedZeus.IsEmpty;

  end
  else
    Result := true;

end;

function TfrmPedido.Man_Tab_EndEntregaPedido(pOpcao: smallint): boolean;
begin

  if not dmMProvider.cdsEndEntregaPedZeus.IsEmpty then
  begin

//    if not dmDBEXMaster.fdcMaster.InTransaction then
    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    try

      dmMSProcedure.fdspEndEntregaPedZeus.Params[0].Value    := pOpcao;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[1].Value    := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[3].Value    := dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[4].Value    := dmMProvider.cdsEndEntregaPedZeusENDERECO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[5].Value    := dmMProvider.cdsEndEntregaPedZeusNUMERO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[6].Value    := dmMProvider.cdsEndEntregaPedZeusCEP.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[7].Value    := dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[8].Value    := dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[9].Value    := dmMProvider.cdsEndEntregaPedZeusCIDADE.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[10].Value   := dmMProvider.cdsEndEntregaPedZeusESTADO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[11].Value   := dmMProvider.cdsEndEntregaPedZeusHORA_TRANSACAO.Value;
      dmMSProcedure.fdspEndEntregaPedZeus.Params[12].Value   := dmMProvider.cdsEndEntregaPedZeusNOME_CLIENTE.Value;

      dmMSProcedure.fdspEndEntregaPedZeus.ExecProc;

      RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

      Result := True;

    except
      on E: exception do
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        Result := False;

      end;

    end;

  end
  else
    Result := dmMProvider.cdsEndEntregaPedZeus.IsEmpty;

end;

function TfrmPedido.Man_Tab_finalizadorasPedido(pOpcao: smallint): boolean;
begin

  if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
  begin

    try

//      if not dmDBEXMaster.fdcMaster.InTransaction then
      if not dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.StartTransaction;

      dmMSProcedure.fdspFinalizadoraPedZeus.Params[0].Value    := pOpcao;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[1].Value    := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[3].Value    := dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[4].Value    := dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[5].Value    := dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[6].Value    := dmMProvider.cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS.Value;
      dmMSProcedure.fdspFinalizadoraPedZeus.Params[7].Value    := dmMProvider.cdsFinalizadoraPedZeusTIPO.Value;

      dmMSProcedure.fdspFinalizadoraPedZeus.ExecProc;

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

      RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

      Result := True;

    except
      on E: exception do
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        Result := False;;

      end;

    end;

  end
  else
    Result := dmMProvider.cdsFinalizadoraPedZeus.IsEmpty;

end;

function TfrmPedido.Man_Tab_Frete(pOpcao: smallint): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspFretePedidoVenda.Params[0].Value    := pOpcao;
    dmMSProcedure.fdspFretePedidoVenda.Params[1].Value    := dmMProvider.cdsFretePedidoVendaFRETE_PEDIDO_VENDA.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[2].Value    := dmMProvider.cdsFretePedidoVendaPEDIDO.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[3].Value    := dmMProvider.cdsFretePedidoVendaTIPO_LANCAMENTO.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[4].Value    := dmMProvider.cdsFretePedidoVendaPLANO_CONTAS.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[5].Value    := dmMProvider.cdsFretePedidoVendaITEM_PLANO_CONTAS.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[6].Value    := dmMProvider.cdsFretePedidoVendaTIPO_PAGAMENTO.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[7].Value    := dmMProvider.cdsFretePedidoVendaVENCIMENTO.Value;
    dmMSProcedure.fdspFretePedidoVenda.Params[8].Value    := dmMProvider.cdsFretePedidoVendaVALOR.Value;

    dmMSProcedure.fdspFretePedidoVenda.ExecProc;

    if dmMSProcedure.fdspFretePedidoVenda.Params[9].Value > 0 then
    begin

      if not InserindoEditando(dmMProvider.cdsFretePedidoVenda) then
        dmMProvider.cdsFretePedidoVenda.Edit;

      dmMProvider.cdsFretePedidoVendaFRETE_PEDIDO_VENDA.Value := dmMSProcedure.fdspFretePedidoVenda.Params[9].Value;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      Result := False;

    end;
  end;

end;

function TfrmPedido.Man_Tab_ItemPedido(pOpcao: smallint): boolean;
begin

  if not dmMProvider.cdsItemPedZeus.IsEmpty then
  begin

//    if not dmDBEXMaster.fdcMaster.InTransaction then
    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    try

      dmMSProcedure.fdspItemPedZeus.Params[0].Value    := pOpcao;
      dmMSProcedure.fdspItemPedZeus.Params[1].Value    := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspItemPedZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[3].Value    := dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[4].Value    := dmMProvider.cdsItemPedZeusPRODUTO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[5].Value    := dmMProvider.cdsItemPedZeusOBSERVACOES.Value;
      dmMSProcedure.fdspItemPedZeus.Params[6].Value    := dmMProvider.cdsItemPedZeusGRUPO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[7].Value    := dmMProvider.cdsItemPedZeusCOD_TRIBUTACAO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[8].Value    := dmMProvider.cdsItemPedZeusALIQUOTA_ICMS.Value;
      dmMSProcedure.fdspItemPedZeus.Params[9].Value    := dmMProvider.cdsItemPedZeusQUANTIDADE.Value;
      dmMSProcedure.fdspItemPedZeus.Params[10].Value   := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[11].Value   := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[12].Value   := dmMProvider.cdsItemPedZeusUSUARIO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[13].Value   := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[14].Value   := dmMProvider.cdsItemPedZeusGTIN.Value;
      dmMSProcedure.fdspItemPedZeus.Params[15].Value   := dmMProvider.cdsItemPedZeusENTREGA.Value;
      dmMSProcedure.fdspItemPedZeus.Params[16].Value   := dmMProvider.cdsItemPedZeusRESERVADO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[17].Value   := dmMProvider.cdsItemPedZeusAUTORIZACAO_DESCONTO.Value;

      dmMSProcedure.fdspItemPedZeus.ExecProc;

      if (dmMSProcedure.fdspItemPedZeus.Params[18].Value > 0) and (dmMProvider.cdsItemPedZeus.State in [dsEdit, dsInsert]) then
        dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value := dmMSProcedure.fdspItemPedZeus.Params[18].Value;

      RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);
      if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
      begin

        if not dmMProvider.cdsItemPedZeus.IsEmpty then
        begin

          dmMProvider.cdsPedidoZeusNUMERO_ITENS_PEDIDO.Value  := dmMProvider.cdsItemPedZeus.RecordCount;
          dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value    := dmMProvider.cdsItemPedZeusTOTAL_MERCADORIAS.Value;
          dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value       := dmMProvider.cdsItemPedZeusTOT_DESCONTO.Value;
          dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value      := dmMProvider.cdsItemPedZeusTOT_ACRESCIMO.Value;
          dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value      := (dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value - dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value) + dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;

        end
        else
        begin

          dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value  := 0;
          dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value    := 0;
          dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value     := 0;
          dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value    := 0;

        end;

      end;

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

      Result := True;

    except
      on E: exception do
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;
        Result := False;

      end;

    end;

  end
  else
    Result := dmMProvider.cdsItemPedZeus.IsEmpty;


end;

function TfrmPedido.Man_Tab_ItemPedido_RA(pOpcao: smallint): boolean;
begin

  if not dmMProvider.cdsItemPedZeus.IsEmpty then
  begin

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    try

      dmMSProcedure.fdspItemPedZeus.Params[0].Value    := pOpcao;
      dmMSProcedure.fdspItemPedZeus.Params[1].Value    := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspItemPedZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[3].Value    := dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[4].Value    := dmMProvider.cdsItemPedZeusPRODUTO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[5].Value    := dmMProvider.cdsItemPedZeusOBSERVACOES.Value;
      dmMSProcedure.fdspItemPedZeus.Params[6].Value    := dmMProvider.cdsItemPedZeusGRUPO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[7].Value    := dmMProvider.cdsItemPedZeusCOD_TRIBUTACAO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[8].Value    := dmMProvider.cdsItemPedZeusALIQUOTA_ICMS.Value;
      dmMSProcedure.fdspItemPedZeus.Params[9].Value    := dmMProvider.cdsItemPedZeusQUANTIDADE.Value;
      dmMSProcedure.fdspItemPedZeus.Params[10].Value   := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[11].Value   := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[12].Value   := dmMProvider.cdsItemPedZeusUSUARIO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[13].Value   := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[14].Value   := dmMProvider.cdsItemPedZeusGTIN.Value;
      dmMSProcedure.fdspItemPedZeus.Params[15].Value   := dmMProvider.cdsItemPedZeusENTREGA.Value;
      dmMSProcedure.fdspItemPedZeus.Params[16].Value   := dmMProvider.cdsItemPedZeusRESERVADO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[17].Value   := dmMProvider.cdsItemPedZeusAUTORIZACAO_DESCONTO.Value;

      dmMSProcedure.fdspItemPedZeus.ExecProc;

      if (dmMSProcedure.fdspItemPedZeus.Params[18].Value > 0) and (dmMProvider.cdsItemPedZeus.State in [dsEdit, dsInsert]) then
        dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value := dmMSProcedure.fdspItemPedZeus.Params[18].Value;

      if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
      begin

        if not dmMProvider.cdsItemPedZeus.IsEmpty then
        begin

          dmMProvider.cdsPedidoZeusNUMERO_ITENS_PEDIDO.Value  := dmMProvider.cdsItemPedZeus.RecordCount;
          dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value    := dmMProvider.cdsItemPedZeusTOTAL_MERCADORIAS.Value;
          dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value       := dmMProvider.cdsItemPedZeusTOT_DESCONTO.Value;
          dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value      := dmMProvider.cdsItemPedZeusTOT_ACRESCIMO.Value;
          dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value      := (dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value - dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value) + dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;

        end
        else
        begin

          dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value  := 0;
          dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value    := 0;
          dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value     := 0;
          dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value    := 0;

        end;

      end;

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

      Result := True;

    except
      on E: exception do
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        Result := False;

      end;

    end;

  end
  else
    Result := dmMProvider.cdsItemPedZeus.IsEmpty;

end;

function TfrmPedido.Man_Tab_ItemPedido_RD(pOpcao: smallint): boolean;
begin

  if not dmMProvider.cdsItemPedZeus.IsEmpty then
  begin

//    if not dmDBEXMaster.fdcMaster.InTransaction then
    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    try

      dmMSProcedure.fdspItemPedZeus.Params[0].Value    := pOpcao;
      dmMSProcedure.fdspItemPedZeus.Params[1].Value    := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspItemPedZeus.Params[2].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[3].Value    := dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[4].Value    := dmMProvider.cdsItemPedZeusPRODUTO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[5].Value    := dmMProvider.cdsItemPedZeusOBSERVACOES.Value;
      dmMSProcedure.fdspItemPedZeus.Params[6].Value    := dmMProvider.cdsItemPedZeusGRUPO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[7].Value    := dmMProvider.cdsItemPedZeusCOD_TRIBUTACAO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[8].Value    := dmMProvider.cdsItemPedZeusALIQUOTA_ICMS.Value;
      dmMSProcedure.fdspItemPedZeus.Params[9].Value    := dmMProvider.cdsItemPedZeusQUANTIDADE.Value;
      dmMSProcedure.fdspItemPedZeus.Params[10].Value   := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[11].Value   := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[12].Value   := dmMProvider.cdsItemPedZeusUSUARIO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[13].Value   := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[14].Value   := dmMProvider.cdsItemPedZeusGTIN.Value;
      dmMSProcedure.fdspItemPedZeus.Params[15].Value   := dmMProvider.cdsItemPedZeusENTREGA.Value;
      dmMSProcedure.fdspItemPedZeus.Params[16].Value   := dmMProvider.cdsItemPedZeusRESERVADO.Value;
      dmMSProcedure.fdspItemPedZeus.Params[17].Value   := dmMProvider.cdsItemPedZeusAUTORIZACAO_DESCONTO.Value;

      dmMSProcedure.fdspItemPedZeus.ExecProc;

      if (dmMSProcedure.fdspItemPedZeus.Params[18].Value > 0) and (dmMProvider.cdsItemPedZeus.State in [dsEdit, dsInsert]) then
        dmMProvider.cdsItemPedZeusITEM_PEDIDO.Value := dmMSProcedure.fdspItemPedZeus.Params[18].Value;

      if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
      begin

        if not dmMProvider.cdsItemPedZeus.IsEmpty then
        begin

          dmMProvider.cdsPedidoZeusNUMERO_ITENS_PEDIDO.Value  := dmMProvider.cdsItemPedZeus.RecordCount;
          dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value    := dmMProvider.cdsItemPedZeusTOTAL_MERCADORIAS.Value;
          dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value       := dmMProvider.cdsItemPedZeusTOT_DESCONTO.Value;
          dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value      := dmMProvider.cdsItemPedZeusTOT_ACRESCIMO.Value;
          dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value      := (dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value - dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value) + dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;

        end
        else
        begin

          dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value  := 0;
          dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value    := 0;
          dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value     := 0;
          dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value    := 0;

        end;

      end;

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

      Result := True;

    except
      on E: exception do
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        Result := False;

      end;

    end;

  end
  else
    Result := dmMProvider.cdsItemPedZeus.IsEmpty;

end;

function TfrmPedido.Man_Tab_Pedido_Zeus(pOpcao: smallint): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspPedidoZeus.Params[0].Value    := pOpcao;
    dmMSProcedure.fdspPedidoZeus.Params[1].Value    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[2].Value    := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspPedidoZeus.Params[3].Value    := dmMProvider.cdsPedidoZeusEMISSAO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[4].Value    := dmMProvider.cdsPedidoZeusLOJA_SAI_MERCADORIA.Value;
    dmMSProcedure.fdspPedidoZeus.Params[5].Value    := dmMProvider.cdsPedidoZeusENTREGA.Value;
    dmMSProcedure.fdspPedidoZeus.Params[6].Value    := dmMProvider.cdsItemPedZeus.RecordCount;
    dmMSProcedure.fdspPedidoZeus.Params[7].Value    := dmMProvider.cdsPedidoZeusVENDEDOR.Value;
    dmMSProcedure.fdspPedidoZeus.Params[8].Value    := dmMProvider.cdsPedidoZeusCLIENTE.Value;
    dmMSProcedure.fdspPedidoZeus.Params[9].Value    := dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[10].Value   := dmMProvider.cdsPedidoZeusOBSERVACOES.Value;
    dmMSProcedure.fdspPedidoZeus.Params[11].Value   := dmMProvider.cdsPedidoZeusHORARIO_PEDIDO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[12].Value   := dmDBEXMaster.sNomeUsuario;
    dmMSProcedure.fdspPedidoZeus.Params[13].Value   := dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[14].Value   := dmMProvider.cdsPedidoZeusVALIDADE_PEDIDO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[15].Value   := dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[16].Value   := dmMProvider.cdsPedidoZeusDATA_ENTREGA.Value;
    dmMSProcedure.fdspPedidoZeus.Params[17].Value   := dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value;
    dmMSProcedure.fdspPedidoZeus.Params[18].Value   := dmMProvider.cdsPedidoZeusTOTAL_MERCADORIAS.Value;
    dmMSProcedure.fdspPedidoZeus.ExecProc;

    if dmMSProcedure.fdspPedidoZeus.Params[19].Value > 0 then
      dmMProvider.cdsPedidoZeusPEDIDO.Value := dmMSProcedure.fdspPedidoZeus.Params[19].Value;

    if dmMProvider.cdsPedidoZeus.State in [dsEdit, dsInsert] then
      dmMProvider.cdsPedidoZeus.Post;

//    if dmDBEXMaster.fdcMaster.InTransaction then
    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := True;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      Result := False;

    end;

  end;

end;

procedure TfrmPedido.memObservacoesKeyPress(Sender: TObject; var Key: Char);
begin

  key := UpCase(key);

end;

procedure TfrmPedido.mnuItemPedidoPopup(Sender: TObject);
begin

  if dmMProvider.cdsItemPedZeusENTREGA.Value = 0 then
    mnuItemPedido.Items[0].Caption := 'MARCAR PARA ENTREGA'
  else
    mnuItemPedido.Items[0].Caption := 'MARCAR COMO RETIRADO';

  if dmMProvider.cdsItemPedZeusRESERVADO.Value = 0 then
    mnuItemPedido.Items[1].Caption := 'MARCAR COMO RESERVADO'
  else
    mnuItemPedido.Items[1].Caption := 'DESMARCAR RESERVA';

end;

procedure TfrmPedido.mnuMarcarComoReservadoMARCARCOMORESERVADO1Click(
  Sender: TObject);
begin

  if (dmMProvider.cdsItemPedZeus.Active) and (not dmMProvider.cdsItemPedZeus.IsEmpty) then
  begin

    if not (dmMProvider.cdsItemPedZeus.State in [dsEdit, dsInsert]) then
      dmMProvider.cdsItemPedZeus.Edit;

    if dmMProvider.cdsItemPedZeusRESERVADO.Value = 0 then
      dmMProvider.cdsItemPedZeusRESERVADO.Value := 1
    else
      dmMProvider.cdsItemPedZeusRESERVADO.Value := 0;

    dmMProvider.cdsItemPedZeus.Post;

  end;

end;

procedure TfrmPedido.mnuMarcarEntregaClick(Sender: TObject);
begin

  if (dmMProvider.cdsItemPedZeus.Active) and (not dmMProvider.cdsItemPedZeus.IsEmpty) then
  begin

    if not (dmMProvider.cdsItemPedZeus.State in [dsEdit, dsInsert]) then
      dmMProvider.cdsItemPedZeus.Edit;

    if dmMProvider.cdsItemPedZeusENTREGA.Value = 0 then
      dmMProvider.cdsItemPedZeusENTREGA.Value := 1
    else
      dmMProvider.cdsItemPedZeusENTREGA.Value := 0;

    dmMProvider.cdsItemPedZeus.Post;

  end;
end;

function TfrmPedido.PesquisarMercadoriaDJPdv(pMerdadoria: string): boolean;
begin

  lblMsg.Caption        := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE_PADRAO + 'consultando PAF-ECF';
  imgAlertaPAF.Visible  := true;
  Application.ProcessMessages;

  dmMDJPdv.fdqPesqProdutoDJPdv.Close;
  dmMDJPdv.fdqPesqProdutoDJPdv.SQL.Clear;
  dmMDJPdv.fdqPesqProdutoDJPdv.SQL.Add('select * from produto');
  dmMDJPdv.fdqPesqProdutoDJPdv.SQL.Add('where codbarras = ' + QuotedStr(pMerdadoria));

  dmMDJPdv.fdqPesqProdutoDJPdv.Open;

  Result := not dmMDJPdv.fdqPesqProdutoDJPdv.IsEmpty;

  LimparMSG_ERRO(lblMsg, imgAlertaPAF);

end;

function TfrmPedido.PesquisarMercadoriaZes(pMerdadoria: string): boolean;
begin

  lblMsg.Caption        := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE_PADRAO + 'consultando PAF-ECF';
//  imgAlertaPAF.Visible  := true;
  Application.ProcessMessages;

  dmMZeus.cdsMercadorias_Zeus.Close;
  dmMZeus.cdsMercadorias_Zeus.ProviderName := 'dspMercadoras_Zeus';

  dmMZeus.fdqMercadorias_Zeus.SQL.Clear;
  dmMZeus.fdqMercadorias_Zeus.SQL.Add('select * from  tab_mercadoria');
  dmMZeus.fdqMercadorias_Zeus.SQL.Add('where cod_mercadoria = ' + QuotedStr(pMerdadoria));

  dmMZeus.cdsMercadorias_Zeus.Open;

  Result := not dmMZeus.cdsMercadorias_Zeus.IsEmpty;

  LimparMSG_ERRO(lblMsg, imgAlertaPAF);

end;

function TfrmPedido.pesquisa_end_entrega(pLoja, pPedido: integer): boolean;
begin

  dmMZeus.cdsIntEndEntregaZeus.Close;
  dmMZeus.cdsIntEndEntregaZeus.ProviderName := 'dspIntEndEntregaZeus';

  dmMZeus.fdqEndEntIntPedZeus.SQL.Clear;
  dmMZeus.fdqEndEntIntPedZeus.SQL.Add('select * from  zan_endereco_pedido');
  dmMZeus.fdqEndEntIntPedZeus.SQL.Add('where cod_pedido = ' + IntToStr(pPedido));
  dmMZeus.fdqEndEntIntPedZeus.SQL.Add('and cod_loja = ' + IntToStr(pLoja));

  dmMZeus.cdsIntEndEntregaZeus.Open;

  Result := not dmMZeus.cdsIntEndEntregaZeus.IsEmpty;

end;

function TfrmPedido.pesquisa_Finaliz_pedido(pLoja, pPedido:integer; pFinaliz:string): boolean;
begin

  dmMZeus.cdsIntFinalizPedZeus.Close;
  dmMZeus.cdsIntFinalizPedZeus.ProviderName := 'dspIntFinalizPedZeus';

  dmMZeus.fdqFinalizIntPedZeus.SQL.Clear;
  dmMZeus.fdqFinalizIntPedZeus.SQL.Add('select * from zan_pedido_finaliz');
  dmMZeus.fdqFinalizIntPedZeus.SQL.Add('where cod_pedido = ' + IntToStr(pPedido));
  dmMZeus.fdqFinalizIntPedZeus.SQL.Add('and cod_loja = ' + IntToStr(pLoja));

  if Length(Trim(pFinaliz)) > 0  then
    dmMZeus.fdqFinalizIntPedZeus.SQL.Add('and cod_finalizadora = ' + pFinaliz);

  dmMZeus.cdsIntFinalizPedZeus.Open;

  Result := not dmMZeus.cdsIntFinalizPedZeus.IsEmpty;

end;

function TfrmPedido.pesquisa_item_pedido_zeus(pLoja, pPedido, pItemPedido: integer): boolean;
begin

  dmMZeus.cdsIntItemPedidoZeus.Close;
  dmMZeus.cdsIntItemPedidoZeus.ProviderName := 'dspIntItemPedidoZeus';

  dmMZeus.fdqItemIntPedZeus.SQL.Clear;
  dmMZeus.fdqItemIntPedZeus.SQL.Add('select * from zan_pedido_item');
  dmMZeus.fdqItemIntPedZeus.SQL.Add('where cod_pedido = ' + IntToStr(pPedido));
  dmMZeus.fdqItemIntPedZeus.SQL.Add('and cod_loja = ' + IntToStr(pLoja));
  dmMZeus.fdqItemIntPedZeus.SQL.Add('and cod_pedido_item = ' + IntToStr(pItemPedido));

  dmMZeus.cdsIntItemPedidoZeus.Open;

  Result := not dmMZeus.cdsIntItemPedidoZeus.IsEmpty;

end;

function TfrmPedido.pesquisa_pedido_zeus(pLoja, pPedido: integer): boolean;
begin

  dmMZeus.cdsIntPedZeus.Close;
  dmMZeus.cdsIntPedZeus.ProviderName := 'dspIntPedZeus';

  dmMZeus.fdqIntPedidoZeus.SQL.Clear;
  dmMZeus.fdqIntPedidoZeus.SQL.Add('select * from zan_pedido');
  dmMZeus.fdqIntPedidoZeus.SQL.Add('where cod_pedido = ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
  dmMZeus.fdqIntPedidoZeus.SQL.Add('and cod_loja = ' + IntToStr(dmMProvider.cdsPedidoZeusFILIAL.Value));

  dmMZeus.cdsIntPedZeus.Open;

  Result := not dmMZeus.cdsIntPedZeus.IsEmpty;

end;

procedure TfrmPedido.RatearAcrescimo(pAcrescimo, cValorAcrescimo: currency);
var
  cDiferenca:currency;
begin

  cDiferenca := 0;

  dmMProvider.cdsItemPedZeus.First;

//  while not dmMProvider.cdsItemPedZeus.eof do
  //begin

    dmMProvider.cdsItemPedZeus.Edit;
//    dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value := ((dmMProvider.cdsItemPedZeusSUB_TOTAL.AsCurrency  + cValorAcrescimo));// * (pAcrescimo / 100));
    dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value := cValorAcrescimo;
    dmMProvider.cdsItemPedZeus.Post;
    Man_Tab_ItemPedido_RA(0);
//    dmMProvider.cdsItemPedZeus.Next;

//  end;

  RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

{  dmDBEXMaster.fdqSomaAcresItemPedZeus.Close;
  dmDBEXMaster.fdqSomaAcresItemPedZeus.Params[0].Value := dmMProvider.cdsPedidoZeusPEDIDO.Value;
  dmDBEXMaster.fdqSomaAcresItemPedZeus.Params[1].Value := dmMProvider.cdsPedidoZeusFILIAL.Value;
  dmDBEXMaster.fdqSomaAcresItemPedZeus.Open;

  if dmDBEXMaster.fdqSomaAcresItemPedZeus.FieldByName('OP_TOTAL_ACRESCIMO').AsCurrency <> cValorAcrescimo then
  begin

    cDiferenca := cValorAcrescimo - dmDBEXMaster.fdqSomaAcresItemPedZeus.FieldByName('OP_TOTAL_ACRESCIMO').AsCurrency;

    dmMProvider.cdsItemPedZeus.Edit;
    dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.AsCurrency := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.AsCurrency + cDiferenca;
    dmMProvider.cdsItemPedZeus.Post;

    Man_Tab_ItemPedido_RA(0)

  end;

}  RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

end;

procedure TfrmPedido.RatearDesconto(pDesconto, cValorDesconto:currency);
var
  cDiferenca:currency;
begin

  cDiferenca := 0;

  dmMProvider.cdsItemPedZeus.First;

  while not dmMProvider.cdsItemPedZeus.eof do
  begin

    dmMProvider.cdsItemPedZeus.Edit;
    dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value := (dmMProvider.cdsItemPedZeusSUB_TOTAL.AsCurrency * (pDesconto / 100));
    dmMProvider.cdsItemPedZeus.Post;
    Man_Tab_ItemPedido_RD(0);
    dmMProvider.cdsItemPedZeus.Next;

  end;

  RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

  dmDBEXMaster.fdqSomaDesItemPedZeus.Close;
  dmDBEXMaster.fdqSomaDesItemPedZeus.Params[0].Value := dmMProvider.cdsPedidoZeusPEDIDO.Value;
  dmDBEXMaster.fdqSomaDesItemPedZeus.Params[1].Value := dmMProvider.cdsPedidoZeusFILIAL.Value;
  dmDBEXMaster.fdqSomaDesItemPedZeus.Open;

  if dmDBEXMaster.fdqSomaDesItemPedZeus.FieldByName('OP_TOTAL_DESCONTO').AsCurrency <> cValorDesconto then
  begin

    cDiferenca := cValorDesconto - dmDBEXMaster.fdqSomaDesItemPedZeus.FieldByName('OP_TOTAL_DESCONTO').AsCurrency;

    dmMProvider.cdsItemPedZeus.Edit;
    dmMProvider.cdsItemPedZeusVALOR_DESCONTO.AsCurrency := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.AsCurrency + cDiferenca;
    dmMProvider.cdsItemPedZeus.Post;

    Man_Tab_ItemPedido_rd(0)

  end;

  RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

end;

procedure TfrmPedido.rdgEntregaChange(Sender: TObject);
begin

  imgFrete.Enabled := (dmMProvider.cdsPedidoZeusENTREGA.Value = 1) and (dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0);

  if InserindoEditando(dmMProvider.cdsPedidoZeus) then
  begin

    if (dmMProvider.cdsPedidoZeusENTREGA.Value = 1) and (dmMProvider.cdsPedidoZeusCLIENTE.Value > 0) then
    begin

      HabilitaDesabilitaInfoEntrega(True,$00D3D3D3);
      dmMProvider.cdsClientes.Locate('CLIENTE', dmMProvider.cdsPedidoZeusCLIENTE.Value, []);
      IncluirEndEntrega;

    end
    else if (dmMProvider.cdsPedidoZeusENTREGA.Value = 1) and (dmMProvider.cdsPedidoZeusCLIENTE.Value <= 0) then
    begin

      HabilitaDesabilitaInfoEntrega(False,clWindow);
      IncluirEndEntrega;
      edtNomeClienteEntrega.SetFocus;

    end
    else if dmMProvider.cdsPedidoZeusENTREGA.Value = 0 then
    begin

      HabilitaDesabilitaInfoEntrega(True,$00D3D3D3);
      Man_Tab_EndEntregaPedido(1);

    end;

  end;

end;

procedure TfrmPedido.rdgEntregaClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsPedidoZeus) then
  begin

    dmMProvider.cdsPedidoZeusENTREGA.Value  := rdgEntrega.ItemIndex;
    imgFrete.Enabled                        := (dmMProvider.cdsPedidoZeusENTREGA.Value = 1) and (dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0);

    if (dmMProvider.cdsPedidoZeusENTREGA.Value = 1) and (dmMProvider.cdsPedidoZeusCLIENTE.Value > 0) then
    begin

      HabilitaDesabilitaInfoEntrega(True,$00D3D3D3);
      dmMProvider.cdsClientes.Locate('CLIENTE', dmMProvider.cdsPedidoZeusCLIENTE.Value, []);
      IncluirEndEntrega;

    end
    else if (dmMProvider.cdsPedidoZeusENTREGA.Value = 1) and (dmMProvider.cdsPedidoZeusCLIENTE.Value <= 0) then
    begin

      HabilitaDesabilitaInfoEntrega(False,clWindow);
      IncluirEndEntrega;

    end
    else if dmMProvider.cdsPedidoZeusENTREGA.Value = 0 then
    begin

      HabilitaDesabilitaInfoEntrega(True,$00D3D3D3);
      Man_Tab_EndEntregaPedido(1);

    end;

  end;

end;

procedure TfrmPedido.rdgOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.SetFocus;
  edtConteudoPesquisa.Clear;

  if rdgOpcoesPesquisa.ItemIndex = 3 then
  begin

    frmPesquisaCliente      := TfrmPesquisaCliente.Create(self);
    frmPesquisaCliente.Tag  := 1;

    if frmPesquisaCliente.ShowModal = mrOK then
      AbrirTabelaPedidoZeus(dmMProvider.cdsClientesCLIENTE.Value,'-1');

    FreeAndNil(frmPesquisaFuncionario);

  end
  else
  begin

    if not AbrirTabelaPedidoZeus(rdgOpcoesPesquisa.ItemIndex,'-1') then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end
    else
    begin

      pgcPedido.ActivePageIndex := 0;
      grdTabela.SetFocus;

    end;

  end;

end;

procedure TfrmPedido.RelacionarAliquotaICMS(pTributacao: integer);
begin

  dmMProvider.cdsTributacao.Close;
  dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

  dmDBEXMaster.fdqTributacao.SQL.Clear;
  dmDBEXMaster.fdqTributacao.SQL.Add('select * from aliquotas');
  dmDBEXMaster.fdqTributacao.SQL.Add('where tributacao = ' + IntToStr(pTributacao));

  dmMProvider.cdsTributacao.Open;
  dmMProvider.cdsTributacao.ProviderName := '';

end;

procedure TfrmPedido.RelacionarEndEntregaPedido(pPedido, pFilial: integer);
begin

  dmMProvider.cdsEndEntregaPedZeus.Close;
  dmMProvider.cdsEndEntregaPedZeus.ProviderName := 'dspEndEntregaPedZeus';

  dmDBEXMaster.fdqEndEntregaPedZeus.SQL.Clear;
  dmDBEXMaster.fdqEndEntregaPedZeus.SQL.Add('select * from endereco_entrega_pedido_zeus');

  dmDBEXMaster.fdqEndEntregaPedZeus.SQL.Add('where pedido = ' + IntToStr(pPedido));
  dmDBEXMaster.fdqEndEntregaPedZeus.SQL.Add('and filial = ' + IntToStr(pFilial));

  dmMProvider.cdsEndEntregaPedZeus.Open;
  dmMProvider.cdsEndEntregaPedZeus.ProviderName := '';

end;

procedure TfrmPedido.RelacionarFinalizadoraPedido(pPedido, pFilial: integer);
begin

  dmMProvider.cdsFinalizadoraPedZeus.Close;
  dmMProvider.cdsFinalizadoraPedZeus.ProviderName := 'dspFinalizadoraPedZeus';

  dmDBEXMaster.fdqFinalizPedZeus.SQL.Clear;
  dmDBEXMaster.fdqFinalizPedZeus.SQL.Add('select fin_z.*, fpg.nome from finalizadora_pedido_zeus fin_z');
  dmDBEXMaster.fdqFinalizPedZeus.SQL.Add('join formapagamento fpg');
  dmDBEXMaster.fdqFinalizPedZeus.SQL.Add('on(fpg.formapagamento = fin_z.forma_pagamento)');
  dmDBEXMaster.fdqFinalizPedZeus.SQL.Add('where fin_z.pedido = ' + IntToStr(pPedido));
  dmDBEXMaster.fdqFinalizPedZeus.SQL.Add('and fin_z.filial = ' + IntToStr(pFilial));

  dmDBEXMaster.fdqFinalizPedZeus.SQL.Add('order by fpg.nome');

  dmMProvider.cdsFinalizadoraPedZeus.Open;
  dmMProvider.cdsFinalizadoraPedZeus.ProviderName := '';

end;

procedure TfrmPedido.RelacionarFretePedido(pPedido, pFilial: integer);
begin

  dmMProvider.cdsFretePedidoVenda.Close;
  dmMProvider.cdsFretePedidoVenda.ProviderName := 'dspFretePedidoVenda';

  dmDBEXMaster.fdqFretePedidoVenda.SQL.Clear;
  dmDBEXMaster.fdqFretePedidoVenda.SQL.Add('select * from frete_pedido_venda');
  dmDBEXMaster.fdqFretePedidoVenda.SQL.Add('where pedido = ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));

  dmMProvider.cdsFretePedidoVenda.Open;
  dmMProvider.cdsFretePedidoVenda.ProviderName := '';

end;

procedure TfrmPedido.RelacionarItemsPedido(pPedido,pFilial:integer);
begin

  dmMProvider.cdsItemPedZeus.Close;
  dmMProvider.cdsItemPedZeus.ProviderName := 'dspItemPedZeus';

  dmDBEXMaster.fdqItemPedZeus.SQL.Clear;
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('select itemped.*, pro.descricao,pro.unidade from item_pedido_zeus itemped');
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('join produto pro');
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('on(pro.produto = itemped.produto)');

  dmDBEXMaster.fdqItemPedZeus.SQL.Add('where itemped.pedido = ' + IntToStr(pPedido));
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('and itemped.filial = ' + IntToStr(pFilial));

  dmDBEXMaster.fdqItemPedZeus.SQL.Add('order by itemped.item_pedido');

  dmMProvider.cdsItemPedZeus. Open;
  dmMProvider.cdsItemPedZeus.ProviderName := '';

end;

procedure TfrmPedido.ResetaUsuario_Autorizou;
begin

  sUsuario_autorizou := '';

end;

procedure TfrmPedido.tdsCadastroShow(Sender: TObject);
begin

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarFretePedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

  end;

end;

function TfrmPedido.ValidarFreteClientePedido: boolean;
begin

  if (dmMProvider.cdsFretePedidoVendaTIPO_PAGAMENTO.Value > 0) then
    Result := dmMProvider.cdsPedidoZeusCLIENTE.Value > 0
  else
    Result := True;

end;

function TfrmPedido.ValidarUsuario(pUsuario, pSenha: string): boolean;
begin

  LimparMsgErro;

  if UpperCase(pUsuario)  <> 'SYSDBA' then
  begin

    Result := False;

    dmMProvider.cdsUsuarios.Close;
    dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';

    dmDBEXMaster.fdqUsuarios.SQL.Clear;
    dmDBEXMaster.fdqUsuarios.SQL.Add('select * from usuarios');
    dmDBEXMaster.fdqUsuarios.SQL.Add('where login = ' + QuotedStr(pUsuario));

    dmMProvider.cdsUsuarios.Open;
    dmMProvider.cdsUsuarios.ProviderName := '';

    if dmMProvider.cdsUsuarios.IsEmpty then
      lblMsg.Caption := 'Usu�rio n�o habilitado no sistema! = ' + pUsuario
    else if dmMProvider.cdsUsuariosSENHA.Text <> EnDecryptString(string(pSenha), 236) then
      lblMsg.Caption := 'Senha informada n�o confere com o cadastro!'
    else if dmMProvider.cdsUsuariosSUPER_USUARIO.Value = 0 then
      lblMsg.Caption := 'Usu�rio n�o possui privil�gio para esta opera��o!'
    else if dmMProvider.cdsUsuariosSUPER_USUARIO.Value = 1 then
      Result := True;

  end
  else
    Result := true;

  Application.ProcessMessages;

end;

end.



codigo rave

  if Value = '0' then

    Value            := 'CONSUMIDOR FINAL';
    self.Text        := Value;
    self.width       := 160;
    self.FontJustify := pjLeft;

  end if;
