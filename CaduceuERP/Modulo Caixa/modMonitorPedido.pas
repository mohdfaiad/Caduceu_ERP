unit modMonitorPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, ACBrBase, ACBrExtenso, ACBrDFe, ACBrNFe,
  ACBrNFeDANFEClass, ACBrDANFCeFortesFr, pcnConversaoNFe;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmMonitorPedido = class(TForm)
    imgCancelar: TImage;
    grpPedidos: TGroupBox;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grdPedidos: TDBGrid;
    tmrRecarrega: TTimer;
    grpFormasPagamento: TGroupBox;
    grdFormasPagamento: TDBGrid;
    imgConfirmar: TImage;
    imgAtualizar: TImage;
    actPedido: TActionList;
    actConfirmarLanRT: TAction;
    actIntegracaoPedidoZeus: TAction;
    cboFormaPagamento: TDBLookupComboBox;
    edtValorFinaliz: TEdit;
    lvlValorFPagto: TLabel;
    lblFpagto: TLabel;
    actExluirFinalizPedido: TAction;
    edtTotalRecebido: TDBEdit;
    lblTotalRecebimento: TLabel;
    ACBrExtenso1: TACBrExtenso;
    ACBrNFe1: TACBrNFe;
    actGerarEnviarNFCe: TAction;
    procedure FormCreate(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure AbrirTabelaPedido(pPedido:integer);
    procedure grdPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tmrRecarregaTimer(Sender: TObject);
    procedure grdFormasPagamentoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure RelacionarFinalizadoraPedido(pPedido,pFilial:integer);
    procedure RelacionarFretePedido(pPedido,pFilial:integer);
    procedure grdPedidosDblClick(Sender: TObject);
    procedure grdPedidosKeyPress(Sender: TObject; var Key: Char);
    procedure imgAtualizarClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure actConfirmarLanRTExecute(Sender: TObject);
    procedure actIntegracaoPedidoZeusExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdFormasPagamentoDblClick(Sender: TObject);
    procedure edtValorFinalizExit(Sender: TObject);
    procedure edtValorFinalizEnter(Sender: TObject);
    procedure edtValorFinalizKeyPress(Sender: TObject; var Key: Char);
    procedure grdFormasPagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExluirFinalizPedidoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cboFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure actGerarEnviarNFCeExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LimparMsgErro;
    function pesquisa_pedido_zeus(pLoja, pPedido:integer):boolean;
    function pesquisa_end_entrega(pLoja, pPedido:integer):boolean;
    function pesquisa_Finaliz_pedido(pLoja, pPedido:integer; pFinaliz:string): boolean;
    function pesquisa_item_pedido_zeus(pLoja, pPedido, pItemPedido:integer):boolean;
    procedure RelacionarItemsPedido(pPedido,pFilial:integer);
    procedure RelacionarEndEntregaPedido(pPedido,pFilial:integer);
    procedure FecharTabelas;
    function Man_Tab_finalizadorasPedido(pOpcao:smallint):boolean;
    function ConsisteCliente_FPG_Prazo:boolean;
    function ConsisteValorPedidoValorRecebido:boolean;
    function Atualializar_saldo_Produto(pOpcao, pOperacao ,pLocal_movimento: smallint): Boolean;
    procedure Imprimir_Parcelas_CRE;
    procedure Imprimir_Parcelas_Frete;
    function Validar_Cartao_Credito:boolean;
    function Validar_A_Prazo:boolean;
    function Validar_A_Prazo_Cheque:boolean;
    procedure GerarEnviarNFCe(pOpcao: smallint);
  public
    { Public declarations }
  end;

var
  frmMonitorPedido: TfrmMonitorPedido;

implementation

{$R *.dfm}

uses uFuncoes, uConstantes_Padrao, dataDBEXMaster, dataMProvider, dataMSource,
  dataMSProcedure, dataMRelatorios, datamZeus, modFormaPagtoCX, modFreteCaixa,
  uFuncoes_BD;

procedure TfrmMonitorPedido.AbrirTabelaPedido(pPedido:integer);
begin

  dmMProvider.cdsFinalizadoraPedZeus.Close;
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
  dmDBEXMaster.fdqPedidoZeus.SQL.Add('where ped.situacao = 1 and ped.pedido_orcamento = 1');
//  dmDBEXMaster.fdqPedidoZeus.SQL.Add('where ped.pedido_orcamento = 1');

  if pPedido > 0 then
    dmDBEXMaster.fdqPedidoZeus.SQL.Add('and ped.pedido = '+ IntToStr(pPedido));

  dmDBEXMaster.fdqPedidoZeus.SQL.Add('order by ped.pedido desc');

  dmMProvider.cdsPedidoZeus.Open;
  dmMProvider.cdsPedidoZeus.ProviderName := '';

end;

procedure TfrmMonitorPedido.actConfirmarLanRTExecute(Sender: TObject);
var
  sOrcamento_Controle:string;
begin

  LimparMsgErro;

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  if ConsisteValorPedidoValorRecebido then
  begin

    try

//    if not dmDBEXMaster.fdcMaster.InTransaction then
      if not dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.StartTransaction;

      //verifica se a tabela depedido n�o est� vazia
      if not dmMProvider.cdsPedidoZeus.IsEmpty then
      begin

        //verifica se o pedido n�o est� confirmado
        if dmMProvider.cdsPedidoZeusSITUACAO.Value = 1 then
        begin

          if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
          begin

            //dados da finalizadora
            if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
            begin

              dmMProvider.cdsFinalizadoraPedZeus.First;

              while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
              begin

                if (dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 10) and (dmMProvider.cdsPedidoZeusCLIENTE.Value = 0) then
                begin

                  lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + MSG_CLIENTE_APRAZO_OBRIGATORIO;
                  Application.ProcessMessages;
                  exit;

                end;

                if dmMProvider.cdsFretePedidoVendaTIPO_PAGAMENTO.Value > 0 then
                begin

                  if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                  begin

                    frmFreteCaixa := TfrmFreteCaixa.Create(self);
                    if frmFreteCaixa.ShowModal = mrOk then
                    begin

                      dmMSProcedure.fdspCre.Params[0].Value       := 0;
                      dmMSProcedure.fdspCre.Params[1].Value       := -1;
                      dmMSProcedure.fdspCre.Params[2].Value       := dmDBEXMaster.iIdFilial;
                      dmMSProcedure.fdspCre.Params[3].Value       := 'FRT' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-1';
                      dmMSProcedure.fdspCre.Params[4].Value       := 0;
                      dmMSProcedure.fdspCre.Params[5].Value       := Date;
                      dmMSProcedure.fdspCre.Params[6].Value       := dmMProvider.cdsPedidoZeusCLIENTE.Value;
                      dmMSProcedure.fdspCre.Params[7].Value       := 0;
                      dmMSProcedure.fdspCre.Params[8].Value       := dmMProvider.cdsPedidoZeusEMISSAO.Value;
                      dmMSProcedure.fdspCre.Params[9].Value       := dmMProvider.cdsFretePedidoVendaVENCIMENTO.Value;
                      dmMSProcedure.fdspCre.Params[10].Value      := 0;
                      dmMSProcedure.fdspCre.Params[11].Value      := dmMProvider.cdsFretePedidoVendaVALOR.Value;
                      //calcular mora
                      dmMSProcedure.fdspCre.Params[12].Value      := (dmMProvider.cdsFretePedidoVendaVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100 ;
                      dmMSProcedure.fdspCre.Params[13].Value      := 0;
                      dmMSProcedure.fdspCre.Params[14].Value      := null;
                      dmMSProcedure.fdspCre.Params[15].Value      := 'LANCAMENTO REFER FRETE PED N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                      dmMSProcedure.fdspCre.Params[16].Value      := 0;
                      dmMSProcedure.fdspCre.Params[17].Value      := 0;
                      dmMSProcedure.fdspCre.Params[18].Value      := 0;
                      dmMSProcedure.fdspCre.Params[19].Value      := 0;
                      dmMSProcedure.fdspCre.Params[20].Value      := dmMProvider.cdsFretePedidoVendaPLANO_CONTAS.Value;
                      dmMSProcedure.fdspCre.Params[21].Value      := dmMProvider.cdsFretePedidoVendaITEM_PLANO_CONTAS.Value;
                      dmMSProcedure.fdspCre.Params[22].Value      := dmMProvider.cdsFretePedidoVendaTIPO_LANCAMENTO.Value;
                      dmMSProcedure.fdspCre.Params[23].Value      := 0;
                      dmMSProcedure.fdspCre.Params[24].Value      := null;
                      dmMSProcedure.fdspCre.Params[25].Value      := '11';
                      dmMSProcedure.fdspCre.Params[26].Value      := 0;
                      dmMSProcedure.fdspCre.Params[27].Value      := null;
                      dmMSProcedure.fdspCre.Params[28].Value      := null;
                      dmMSProcedure.fdspCre.Params[29].Value      := 0;
                      dmMSProcedure.fdspCre.Params[30].Value      := 0;
                      dmMSProcedure.fdspCre.Params[31].Value      := 0;
                      dmMSProcedure.fdspCre.Params[32].Value      := null;
                      dmMSProcedure.fdspCre.Params[33].Value      := '';
                      dmMSProcedure.fdspCre.Params[34].Value      := 0;
                      dmMSProcedure.fdspCre.Params[35].Value      := 0;
                      dmMSProcedure.fdspCre.Params[36].Value      := 0;
                      dmMSProcedure.fdspCre.ExecProc;

                      Imprimir_Parcelas_Frete;

                    end
                    else
                    begin

                      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_NAO_REALIZADA;
                      Application.ProcessMessages;
                      exit;

                    end;

                  end
                  else
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', necess�rio informar o Cliente!';
                    Application.ProcessMessages;
                    exit;

                  end;

                end;

                if dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 10 then
                begin

                  frmFormaPgamentoCRE := TfrmFormaPgamentoCRE.Create(self);
                  if frmFormaPgamentoCRE.ShowModal = mrOk then
                  begin

                    dmMProvider.cdsParcelasCRE_TEMP_CX.First;

                    while not dmMProvider.cdsParcelasCRE_TEMP_CX.Eof do
                    begin

                      dmMSProcedure.fdspCre.Params[0].Value       := 0;
                      dmMSProcedure.fdspCre.Params[1].Value       := -1;
                      dmMSProcedure.fdspCre.Params[2].Value       := dmDBEXMaster.iIdFilial;
                      dmMSProcedure.fdspCre.Params[3].Value       := 'PV' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-' + InttoStr(dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value) + '/' + IntToStr(dmMProvider.cdsParcelasCRE_TEMP_CX.RecordCount);
                      dmMSProcedure.fdspCre.Params[4].Value       := 0;
                      dmMSProcedure.fdspCre.Params[5].Value       := Date;
                      dmMSProcedure.fdspCre.Params[6].Value       := dmMProvider.cdsPedidoZeusCLIENTE.Value;
                      dmMSProcedure.fdspCre.Params[7].Value       := 0;
                      dmMSProcedure.fdspCre.Params[8].Value       := dmMProvider.cdsPedidoZeusEMISSAO.Value;
                      dmMSProcedure.fdspCre.Params[9].Value       := dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value;
                      dmMSProcedure.fdspCre.Params[10].Value      := 0;
                      dmMSProcedure.fdspCre.Params[11].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value;
                      //calcular mora
                      dmMSProcedure.fdspCre.Params[12].Value      := (dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100 ;
                      dmMSProcedure.fdspCre.Params[13].Value      := 0;
                      dmMSProcedure.fdspCre.Params[14].Value      := null;
                      dmMSProcedure.fdspCre.Params[15].Value      := 'LANCAMENTO EFTUADO PELO CX. PED N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                      dmMSProcedure.fdspCre.Params[16].Value      := 0;
                      dmMSProcedure.fdspCre.Params[17].Value      := 0;
                      dmMSProcedure.fdspCre.Params[18].Value      := 0;
                      dmMSProcedure.fdspCre.Params[19].Value      := 0;
                      dmMSProcedure.fdspCre.Params[20].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXPLANO_CONTA.Value;
                      dmMSProcedure.fdspCre.Params[21].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXITEM_PLANO_CONTA.Value;
                      dmMSProcedure.fdspCre.Params[22].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXLANCAMENTO.Value;
                      dmMSProcedure.fdspCre.Params[23].Value      := 0;
                      dmMSProcedure.fdspCre.Params[24].Value      := null;
                      dmMSProcedure.fdspCre.Params[25].Value      := '11';
                      dmMSProcedure.fdspCre.Params[26].Value      := 0;
                      dmMSProcedure.fdspCre.Params[27].Value      := null;
                      dmMSProcedure.fdspCre.Params[28].Value      := null;
                      dmMSProcedure.fdspCre.Params[29].Value      := 0;
                      dmMSProcedure.fdspCre.Params[30].Value      := 0;
                      dmMSProcedure.fdspCre.Params[31].Value      := 0;
                      dmMSProcedure.fdspCre.Params[32].Value      := null;
                      dmMSProcedure.fdspCre.Params[33].Value      := '';
                      dmMSProcedure.fdspCre.Params[34].Value      := 0;
                      dmMSProcedure.fdspCre.Params[35].Value      := 0;
                      dmMSProcedure.fdspCre.Params[36].Value      := 0;

                      dmMSProcedure.fdspCre.ExecProc;

                      dmMProvider.cdsParcelasCRE_TEMP_CX.Next;

                    end;

                    dmMProvider.cdsParcelasCRE_TEMP_CX.First;

                    Imprimir_Parcelas_CRE;

                  end
                  else
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_NAO_REALIZADA;
                    Application.ProcessMessages;
                    exit;

                  end;

                end;

                dmMProvider.cdsFinalizadoraPedZeus.Next;

              end;

              dmMProvider.cdsFinalizadoraPedZeus.First;

            end;


          end;

          //ATUALIZAR SALDO DE PRODUTOS

          if Atualializar_saldo_Produto(7, 0 ,1) then
          begin

            dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
            dmMSProcedure.fdspMaster.Prepare;

            dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 2 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
            dmMSProcedure.fdspMaster.ExecProc;

          end;

          dmMProvider.cdsPedidoZeus.Edit;
          dmMProvider.cdsPedidoZeusSITUACAO.Value := 2;
          dmMProvider.cdsPedidoZeus.Post;

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PEDIDO_GRAVADO + ', pedido: ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
          Application.ProcessMessages;

          dmMProvider.cdsFinalizadoraPedZeus.First;

          while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
          begin

            dmMProvider.cdsFormasPagamento.Close;
            dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

            dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
            dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
            dmDBEXMaster.fdqFormasPagamento.SQL.Add('where FORMAPAGAMENTO = ' + IntToStr(dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value));

            dmMProvider.cdsFormasPagamento.Open;
            dmMProvider.cdsFormasPagamento.ProviderName := '';

//            if (dmMProvider.cdsFormasPagamentoTIPO.Value = 2) or (dmMProvider.cdsFormasPagamentoTIPO.Value = 7) then
//            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_EFETUANDO_LANC_CAIXA;
              Application.ProcessMessages;

              dmMProvider.cdsItemCaixaLoja.Close;
              dmMProvider.cdsItemCaixaLoja.ProviderName := 'dspItemCaixaLoja';

              dmDBEXMaster.fdqItemCaixaLoja.SQL.Clear;
              dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('select * from item_caixa_loja');
              dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where caixa_loja = ' + IntToStr(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value));

              dmMProvider.cdsItemCaixaLoja.Open;
              dmMProvider.cdsItemCaixaLoja.ProviderName := '';
              dmMProvider.cdsItemCaixaLoja.Last;

              dmMSProcedure.fdspItem_caixa_loja.Params[0].Value   :=  dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value;
              if  Length(Trim(dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value)) > 0 then
                dmMSProcedure.fdspItem_caixa_loja.Params[1].Value :=  dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value
              else
                dmMSProcedure.fdspItem_caixa_loja.Params[1].Value :=  'CONSUMIDOR FINAL';

              dmMSProcedure.fdspItem_caixa_loja.Params[2].Value   :=  'P' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
              dmMSProcedure.fdspItem_caixa_loja.Params[3].Value   :=  Date;
              dmMSProcedure.fdspItem_caixa_loja.Params[4].Value   :=  dmMProvider.cdsFormasPagamentoTIPO.Value;
              dmMSProcedure.fdspItem_caixa_loja.Params[5].Value   :=  dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value;
              dmMSProcedure.fdspItem_caixa_loja.Params[6].Value   :=  'C';
              dmMSProcedure.fdspItem_caixa_loja.Params[7].Value   :=  dmMProvider.cdsItemCaixaLojaSALDO.Value;
              dmMSProcedure.fdspItem_caixa_loja.Params[8].Value   :=  'LANCAMENTO EFETUADO POR VENDA P' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
              dmMSProcedure.fdspItem_caixa_loja.Params[9].Value   :=  '';
              dmMSProcedure.fdspItem_caixa_loja.Params[10].Value  :=  null;
              dmMSProcedure.fdspItem_caixa_loja.Params[11].Value  :=  null;
              dmMSProcedure.fdspItem_caixa_loja.ExecProc;

              dmDBEXMaster.fdcMaster.Commit;

//            end;

            dmMProvider.cdsFinalizadoraPedZeus.Next;

          end;


          AbrirTabelaPedido(0);
          FecharTabelas;
          LimparMsgErro;

        end;

      end;

//    if dmDBEXMaster.fdcMaster.InTransaction then
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

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLR_REC_VLR_PED;
    Application.ProcessMessages;

  end;


end;

procedure TfrmMonitorPedido.actExluirFinalizPedidoExecute(Sender: TObject);
begin

  LimparMsgErro;

  if Man_Tab_finalizadorasPedido(1) then
    RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);

end;

procedure TfrmMonitorPedido.actGerarEnviarNFCeExecute(Sender: TObject);
var
  ok, bDevolucao, bNContribuinte: boolean;
  pPerc_Desc_Rat, pFrete, v_Frete, cPercentualTribFederal,cTributosFederais,
  vlBCUFDest, percFCPUFDest,  percICMSUFDest, percICMSInter, percICMSInterPart,
  vlFCPUFDest, vlICMSUFDest, vlICMSUFRemet:currency;
  sArquivo, sAno_Mes, sPastaOrigemXML,sPastaOrigemPDF, sPastaDestinoXML, sPastaDestinoPDF, sMSG_Val_Regras :string;

begin

  bNContribuinte := False;

  try

    if not dmDBEXMaster.fdcMaster.InTransaction then
      dmDBEXMaster.fdtMaster.StartTransaction;

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
    Application.ProcessMessages;

    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.Configuracoes.Geral.ModeloDF := moNFCe;
    ACBrNFe1.Configuracoes.Geral.VersaoDF := ve310;

    with ACBrNFe1.NotasFiscais.Add.NFe do
    begin

       Ide.cNF       := StrToInt(NumNFe); //Caso n�o seja preenchido ser� gerado um n�mero aleat�rio pelo componente
       Ide.natOp     := 'VENDA';
       Ide.indPag    := ipVista;
       Ide.modelo    := 65;
       Ide.serie     := 1;
       Ide.nNF       := StrToInt(NumNFe);
       Ide.dEmi      := now;
       Ide.dSaiEnt   := now;
       Ide.hSaiEnt   := now;
       Ide.tpNF      := tnSaida;
       Ide.tpEmis    := TpcnTipoEmissao(cbFormaEmissao.ItemIndex); ;
       Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção
       Ide.cUF       := UFtoCUF(edtEmitUF.Text);
       Ide.cMunFG    := StrToInt(edtEmitCodCidade.Text);
       Ide.finNFe    := fnNormal;
       Ide.tpImp     := tiNFCe;
       Ide.indFinal  := cfConsumidorFinal;
       Ide.indPres   := pcPresencial;






        while not dmMProvider.cdsParcelasNFS.Eof do
        begin

          with Cobr.Dup.Add do
          begin

            nDup  := dmMProvider.cdsParcelasNFSDOCUMENTO.Value;
            dVenc := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
            vDup  := dmMProvider.cdsParcelasNFSVALOR.AsCurrency;

          end;

          dmMProvider.cdsParcelasNFS.Next;

        end;

      end;

      infNFe.ID     := InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);

      if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 1 then
        Ide.natOp     := 'NFe - Complementar'
      else if (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 2) and (dmMProvider.cdsNFSaidaCANCELAMENTO_ESTEMPORANEO.Value = 1) then
        Ide.natOp     := '999 - Estorno de NF-e n�o cancelada no prazo legal'
      else
        Ide.natOp     := Format('%-60.60s', [dmMProvider.cdsCFOP_NFSaidaDESCRICAO_CFOP.Value]);

      Ide.nNF       := StrToInt(infNFe.ID);
      Ide.cNF       := StrToInt(infNFe.ID);
      Ide.Modelo    := StrToInt(dmMProvider.cdsNFSaidaMODELO.AsString);
      Ide.serie     := StrToIntDef(Trim(dmMProvider.cdsNFSaidaSERIE.AsString),1);
      Ide.dEmi      := dmMProvider.cdsNFSaidaEMISSAO.Value;
      Ide.dSaiEnt   := now;

      sAno_Mes    := FormatDateTime('yyyymm',Date{Ide.dEmi});

      bDevolucao  := (dmmProvider.cdsCFOP_CFPSNATUREZA_CFOP.Value = 1);

      ide.finNFe  := StrToFinNFe(ok, FormatFloat('0', dmMProvider.cdsNFSaidaFINALIDADE_NF.Value + 1));

      if dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1 then
        ide.indFinal        := cfConsumidorFinaL
      else
        ide.indFinal        := cfNao;

      while not dmMProvider.cdsDocumentoRef_NFS.Eof do
      begin

        with ide.NFref.Add do
        begin

          if dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.Value = '55' then
            refNFe := dmMProvider.cdsDocumentoRef_NFSCHAVE_DOCUMENTO_REF.Value
          else if dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.Value = '04' then
          begin

            RefNFP.cUF          := dmMProvider.cdsDocumentoRef_NFSUF_DOCUMENTO_REF.Value;
            RefNFP.AAMM         := dmMProvider.cdsDocumentoRef_NFSANO_MES_EMISSAO.Value;
            RefNFP.CNPJCPF      := dmMProvider.cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF.Value;
            RefNFP.IE           := dmMProvider.cdsClientesINSCRICAO.AsString;
            RefNFP.modelo       := dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.Value;

            if dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value > 0 then
              RefNFP.serie      := dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value
            else
              RefNFP.serie      := 0;

            RefNFP.nNF          := StrToInt(dmMProvider.cdsDocumentoRef_NFSDOCUMENTO_REF.Value);

          end
          else
          begin

            RefNF.cUF          := dmMProvider.cdsDocumentoRef_NFSUF_DOCUMENTO_REF.Value;
            RefNF.AAMM         := dmMProvider.cdsDocumentoRef_NFSANO_MES_EMISSAO.Value;
            RefNF.CNPJ         := dmMProvider.cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF.Value;
            RefNF.modelo       := StrToInt(dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.Value);

            if dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value > 0 then
              RefNF.serie      := dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value
            else
              RefNF.serie      := 0;

            RefNF.nNF          := StrToInt(dmMProvider.cdsDocumentoRef_NFSDOCUMENTO_REF.Value);

          end;


        end;

        dmMProvider.cdsDocumentoRef_NFS.Next;

      end;

      //cupom fiscal
      while not dmMProvider.cdsCupomFiscalRefNFS.Eof do
      begin

        with ide.NFref.Add do
        begin

          with RefECF do
          begin

            modelo  := ECFModRef2D;
            nECF    := FormatFloat('000',dmMProvider.cdsCupomFiscalRefNFSSERIE_DOC_REF.Value);
            nCOO    := Trim(dmMProvider.cdsCupomFiscalRefNFSDOCUMENTO_REF.Value);

          end;

        end;

        dmMProvider.cdsCupomFiscalRefNFS.Next;

      end;

      case dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value of
        1:Ide.tpAmb := taProducao;
        2:Ide.tpAmb := taHomologacao;
      end;

      case dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value of
        0:Ide.tpNF  := tnSaida;
        1:Ide.tpNF  := tnEntrada;
      end;

      if dmMProvider.cdsParcelasNFS.IsEmpty then
        Ide.indPag  := ipOutras
      else
        Ide.indPag  := ipPrazo;


      if dmMProvider.cdsParametros_NFEVERSAO_NFE.Value > 2 then
      begin

        with pag.Add do
        begin

          if not dmMProvider.cdsParcelasNFS.IsEmpty then
          begin

            tPag := StrToFormaPagamento(ok,'14'); //credito da loja

            while not dmMProvider.cdsParcelasNFS.Eof do
            begin

              with Cobr.Dup.Add do
              begin

                nDup  := dmMProvider.cdsParcelasNFSDOCUMENTO.Value;
                dVenc := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
                vDup  := dmMProvider.cdsParcelasNFSVALOR.AsCurrency;

              end;

              dmMProvider.cdsParcelasNFS.Next;

            end;

          end
          else
            tPag := StrToFormaPagamento(ok,'01');//dinheiro

          vPag := dmMProvider.cdsNFSaidaVALORDANOTA.Value;

        end;

      end;

      Ide.verProc             := PREFIXO_VERSAO + RetornarVersao(Application.ExeName, 1);
      Ide.cUF                 := dmMProvider.cdsFilialCODIGO_ESTADO_IBGE.Value;
      Ide.cMunFG              := dmMProvider.cdsFilialCODIGO_MUNICIPIO.Value;

      Emit.CNPJCPF            := dmMProvider.cdsFilialCNPJ.Value;
      Emit.IE                 := dmMProvider.cdsFilialINSCRICAO.Value;
      Emit.xNome              := dmMProvider.cdsFilialRAZAOSOCIAL.Value;
      Emit.xFant              := dmMProvider.cdsFilialFANTASIA.Value;

      if Length(Trim(dmMProvider.cdsFilialTELEFONE1.Value)) > 0 then
        Emit.EnderEmit.fone   := dmMProvider.cdsFilialDDD.Value + ' ' + dmMProvider.cdsFilialTELEFONE1.Value;

      Emit.EnderEmit.CEP      := StrToInt(dmMProvider.cdsFilialCEP.Value);
      Emit.EnderEmit.xLgr     := dmMProvider.cdsFilialENDERECO.Value;
      Emit.EnderEmit.nro      := InttoStr(dmMProvider.cdsFilialNUMERO.Value);
      Emit.EnderEmit.xCpl     := dmMProvider.cdsFilialCOMPLEMENTO.AsString;
      Emit.EnderEmit.xBairro  := dmMProvider.cdsFilialBAIRRO.Value;
      Emit.EnderEmit.cMun     := dmMProvider.cdsFilialCODIGO_MUNICIPIO.Value;
      Emit.EnderEmit.xMun     := dmMProvider.cdsFilialNOMECIDADE.Value;
      Emit.EnderEmit.UF       := dmMProvider.cdsFilialESTADO.Value;
      Emit.EnderEmit.cPais    := 1058;
      Emit.EnderEmit.xPais    := 'BRASIL';
      Emit.CRT                := StrToCRT(ok, InttoStr(dmMProvider.cdsFilialCRT.AsInteger));

      if dmMProvider.cdsConfiguracoesHABILITA_CONTAB_DOWNLOAD_XML.Value = 1 then
      begin

        with autXML.Add do
          CNPJCPF := dmMProvider.cdsConfiguracoesCNPJ_CONTADOR.Value;

      end;

      Dest.EnderDest.CEP      := StrToIntDef(dmMProvider.cdsClientesCEPENTREGA.AsString, 0);
      Dest.EnderDest.xLgr     := dmMProvider.cdsClientesENDERECOENTREGA.AsString;

      if dmMProvider.cdsClientesNUMEROENTREGA.AsInteger > 0 then
        Dest.EnderDest.nro    := InttoStr(dmMProvider.cdsClientesNUMEROENTREGA.Value)
      else
        Dest.EnderDest.nro    := 'S/N';

      Dest.EnderDest.xCpl     := dmMProvider.cdsClientesCOMPLEMENTO.AsString;
      Dest.EnderDest.xBairro  := dmMProvider.cdsClientesBAIRROENTREGA.AsString;
      Dest.EnderDest.cMun     := dmMProvider.cdsClientesCODIGO_MUNICIPIO.AsInteger;
      Dest.EnderDest.xMun     := dmMProvider.cdsClientesNOME_CIDADE_ENTREGA.AsString;
      Dest.EnderDest.UF       := dmMProvider.cdsClientesESTADOENTREGA.AsString;

      dmMProvider.cdsEstados.Close;
      dmMProvider.cdsEstados.ProviderName := 'dspEstados';

      dmDBEXMaster.fdqEstados.SQL.Clear;
      dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');
      dmDBEXMaster.fdqEstados.SQL.Add('WHERE SIGLA = ' + QuotedStr(Dest.EnderDest.UF));

      dmMProvider.cdsEstados.Open;
      dmMProvider.cdsEstados.ProviderName := '';

      if Length(Trim(dmMProvider.cdsClientesTELEFONE1.AsString)) > 0 then
        Dest.EnderDest.fone   := dmMProvider.cdsClientesDDD.AsString + ' ' + dmMProvider.cdsClientesTELEFONE1.AsString;

      case dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value of
        1:begin

            if Dest.EnderDest.xPais <> 'EXTERIOR' then
            begin

              Dest.CNPJCPF        := dmMProvider.cdsClientesCNPJ.Value;
              Dest.indIEDest      := StrToindIEDest(ok,IntToStr(dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value));// inContribuinte;

              if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (Dest.EnderDest.UF <> dmMProvider.cdsFilialESTADO.Value)then
                Dest.IE             := ''
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF = ve310 ) then
                Dest.IE             := ''
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF <> ve310 ) then
                Dest.IE             := ''
              else
                Dest.IE             := dmMProvider.cdsClientesINSCRICAO.AsString;

{              if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (Dest.EnderDest.UF <> dmMProvider.cdsFilialESTADO.Value)then
              begin

                Dest.IE             := '';
                Dest.indIEDest      := inNaoContribuinte;

              end
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF = ve310 ) then
              begin

                Dest.IE             := '';
                Dest.indIEDest      := inIsento;

              end
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF <> ve310 ) then
              begin

                Dest.IE             := '';
                Dest.indIEDest      := inIsento;

              end
              else
                Dest.IE             := dmMProvider.cdsClientesINSCRICAO.AsString;
              }

              Dest.xNome          := dmMProvider.cdsClientesRAZAOSOCIAL.AsString;

{              if Length(Trim(dmMProvider.cdsClientesCNPJ.Value)) <= 11 then
                Dest.indIEDest      := inNaoContribuinte;
}
            end;

          end;
        2:begin

            if Dest.EnderDest.xPais <> 'EXTERIOR' then
            begin

              Dest.CNPJCPF        := dmMProvider.cdsClientesCNPJ.Value;
              Dest.indIEDest      := StrToindIEDest(ok,IntToStr(dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value));// inContribuinte;

              if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (Dest.EnderDest.UF <> dmMProvider.cdsFilialESTADO.Value)then
                Dest.IE             := ''
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF = ve310 ) then
                Dest.IE             := ''
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF <> ve310 ) then
                Dest.IE             := ''
              else
                Dest.IE             := dmMProvider.cdsClientesINSCRICAO.AsString;

{              Dest.CNPJCPF        := dmMProvider.cdsClientesCNPJ.Value;
              Dest.indIEDest      := inContribuinte;

              if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (Dest.EnderDest.UF <> dmMProvider.cdsFilialESTADO.Value)then
              begin

                Dest.IE             := '';
                Dest.indIEDest      := inNaoContribuinte;

              end
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF = ve310 ) then
              if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF = ve310 ) then
              begin

                Dest.IE             := '';
                Dest.indIEDest      := inIsento;

              end
              else if (UpperCase(dmMProvider.cdsClientesINSCRICAO.AsString) = 'ISENTO') and (ACBrNFe1.Configuracoes.Geral.VersaoDF <> ve310 ) then
              begin

                Dest.IE             := '';
                Dest.indIEDest      := inIsento;

              end
              else
                Dest.IE             := dmMProvider.cdsClientesINSCRICAO.AsString;
}
{              if Length(Trim(dmMProvider.cdsClientesCNPJ.Value)) <= 11 then
                Dest.indIEDest      := inNaoContribuinte;
}
              Dest.xNome          := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO � SEM VALOR FISCAL';

            end;

          end;
      end;

      bNContribuinte := (Dest.indIEDest = inNaoContribuinte);

      case dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value of
        1:begin //interna

            Dest.EnderDest.xPais  := 'BRASIL';
            ide.idDest            := doInterna

          end;
        2:begin //interestadual

            Dest.EnderDest.xPais  := 'BRASIL';
            ide.idDest            := doInterestadual;

          end;
        3:begin //exterior

            Dest.CNPJCPF          := '00000000000000';
            Dest.EnderDest.UF     := 'EX';
            Dest.EnderDest.xPais  := 'EXTERIOR';
            ide.idDest            := doExterior;
            Dest.indIEDest        := inNaoContribuinte;
            Dest.idEstrangeiro    := '';
            Retirada.CNPJCPF      := '';
            Retirada.xLgr         := '';
            Retirada.nro          := '';
            Retirada.xCpl         := '';
            Retirada.xBairro      := '';
            Retirada.cMun         := 9999999;
            Retirada.xMun         := '';
            Retirada.UF           := '';
            if Length(Trim(dmMProvider.cdsNFSaidaLOCAL_EMBARQUE.Value)) > 0 then
              exporta.UFembarq    := dmMProvider.cdsFilialESTADO.AsString;

            exporta.xLocEmbarq    := dmMProvider.cdsNFSaidaLOCAL_EMBARQUE.Value;

            if Length(Trim(dmMProvider.cdsNFSaidaLOCAL_EMBARQUE.Value)) > 0 then
              exporta.UFSaidaPais := dmMProvider.cdsFilialESTADO.AsString;

            exporta.xLocExporta   := dmMProvider.cdsNFSaidaLOCAL_EMBARQUE.Value;
            exporta.xLocDespacho  := dmMProvider.cdsNFSaidaLOCAL_DESPACHO.Value;

          end;

      end;

      Dest.EnderDest.cPais := dmMProvider.cdsClientesPAIS.AsInteger;

      AbrirTabelaTransportadora;

      if not dmMProvider.cdsTransportadoraNFS.IsEmpty then
      begin

        case dmMProvider.cdsNFSaidaTIPOFRETE.Value of
          0: Transp.modFrete := mfContaEmitente;
          1: Transp.modFrete := mfContaDestinatario;
          2: Transp.modFrete := mfContaTerceiros;
          9: Transp.modFrete := mfSemFrete;
        end;

        Transp.Transporta.CNPJCPF := dmMProvider.cdsTransportadoraNFSCNPJ.AsString;
        Transp.Transporta.xNome   := dmMProvider.cdsTransportadoraNFSRSOCIAL.AsString;
        Transp.Transporta.IE      := dmMProvider.cdsTransportadoraNFSINSCRICAO_EST.AsString;
        Transp.Transporta.xEnder  := dmMProvider.cdsTransportadoraNFSENDERECO.AsString;
        Transp.Transporta.xMun    := dmMProvider.cdsTransportadoraNFSNOME_CIDADE_TRANSP.AsString;
        Transp.Transporta.UF      := dmMProvider.cdsTransportadoraNFSESTADO.AsString;
        Transp.veicTransp.placa   := dmMProvider.cdsTransportadoraNFSPLACA.AsString;
        Transp.veicTransp.UF      := dmMProvider.cdsTransportadoraNFSUF.AsString;

      end
      else
      begin

        case dmMProvider.cdsNFSaidaTIPOFRETE.Value of
          0: Transp.modFrete := mfContaEmitente;
          1: Transp.modFrete := mfContaDestinatario;
          2: Transp.modFrete := mfContaTerceiros;
          9: Transp.modFrete := mfSemFrete;
        end;

      end;

      with Transp.Vol.Add do
      begin

        qVol  := dmMProvider.cdsNFSaidaQUANTIDADEVOLUME.AsInteger;
        esp   := dmMProvider.cdsNFSaidaESPECIEVOLUME.AsString;
        marca := dmMProvider.cdsNFSaidaMARCAVOLUME.AsString;
        pesoL := dmMProvider.cdsNFSaidaPESOLIQUIDO.AsCurrency;
        pesoB := dmMProvider.cdsNFSaidaPESOBRUTO.AsCurrency;

      end;

      dmMProvider.cdsItemNFSaida.First;

      if dmMProvider.cdsNFSaidaDESCONTO_ST.AsCurrency > 0 then
        pPerc_Desc_Rat := ((dmMProvider.cdsNFSaidaDESCONTO_ST.AsCurrency / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.AsCurrency) * 100);

      while not dmMProvider.cdsItemNFSaida.Eof do
      begin

        with Det.Add do
        begin

          Prod.nItem  := dmMProvider.cdsItemNFSaida.RecNo;
          Prod.NCM    := dmMProvider.cdsItemNFSaidaCF_IPI.Value;
          Prod.CFOP   := dmMProvider.cdsItemNFSaidaCFOP.Value;

          if (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 0) or (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 3) then
            Prod.IndTot :=  StrToindTot(ok, '1')
          else
            prod.IndTot := itNaoSomaTotalNFe;

          if dmMProvider.cdsBarrasGERADO.Value = 0 then
          begin

            while not dmMProvider.cdsBarras.Eof do
            begin

              if ValidaEAN(dmMProvider.cdsBarrasBARRAS.Value) then
              begin

                Prod.cEAN     := dmMProvider.cdsItemNFSaidaEAN.Value;
                prod.cEANTrib := dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value;

              end
              else
                dmMProvider.cdsBarras.Next;

            end;

          end
          else
          begin

            Prod.cEAN     := '';
            prod.cEANTrib := '';

          end;

          Prod.cProd      := InttoStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value);
          Prod.xProd      := dmMProvider.cdsItemNFSaidaDESCRICAO_PRODUTO.Value;
          Prod.qCom       := dmMProvider.cdsItemNFSaidaQUANTIDADE.AsCurrency;
          Prod.uCom       := dmMProvider.cdsItemNFSaidaUNIDADE.Value;

          if Length(Trim(dmMProvider.cdsItemNFSaidaCEST.AsString)) > 0 then
            Prod.CEST       := dmMProvider.cdsItemNFSaidaCEST.AsString
          else
            Prod.CEST       := '0000000';

          if dmMProvider.cdsNFSaidaVALORDOFRETE.AsCurrency > 0 then
          begin

            pFrete      := (dmMProvider.cdsNFSaidaVALORDOFRETE.AsCurrency / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.AsCurrency) * 100;
            v_Frete     := dmMProvider.cdsItemNFSaidaSUB_TOTAL.AsCurrency *( pFrete / 100);
            Prod.vFrete := v_Frete;

          end
          else
            Prod.vFrete     := 0;

          Prod.vSeg       := 0;

          dmDBEXMaster.fdqMasterPesquisa.Close;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select codigo_anp from produto');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value));
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and codigo_anp is not null');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and ativo = 1 and visibilidade = 1');
          dmDBEXMaster.fdqMasterPesquisa.Open;

          if not dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
          begin

            if Length(Trim(dmDBEXMaster.fdqMasterPesquisa.FieldByName('CODIGO_ANP').AsString)) > 0 then
            begin

              with prod.comb do
              begin

                cProdANP  := StrToInt(Trim(dmDBEXMaster.fdqMasterPesquisa.FieldByName('CODIGO_ANP').AsString));
                UFcons    := dmMProvider.cdsNFSaidaUF_DEST.AsString;

              end;

            end;

          end;

          Prod.vDesc      := dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.AsCurrency;
          Prod.vUnCom     := dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat;
          Prod.vProd      := dmMProvider.cdsItemNFSaidaSUB_TOTAL.AsCurrency;
          Prod.qTrib      := dmMProvider.cdsItemNFSaidaQUANTIDADE.AsCurrency;
          Prod.uTrib      := dmMProvider.cdsItemNFSaidaUNIDADE.Value;
          Prod.vUnTrib    := dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat;

          if (dmMProvider.cdsFilialCRT.AsInteger = 1) and (dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency > 0) then
            PROD.vOutro     := dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency
          else if dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency > 0 then
            PROD.vOutro     := dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency;

          if dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.Value <> 0 then
          begin

            cTributosFederais     := dmMProvider.cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL.AsCurrency;
            cPercentualTribFederal:= dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.AsCurrency;

          end
          else
          begin

            cTributosFederais     := dmMProvider.cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL.AsCurrency;
            cPercentualTribFederal:= dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.AsCurrency;

          end;

          Prod.xPed     := dmMProvider.cdsItemNFSaidaPEDIDO_DE_COMPRA.Value;

          if dmMProvider.cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA.Value > 0 then
            Prod.nItemPed := IntToStr(dmMProvider.cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA.Value);

          {

          Preciso calcular o imposto nas remessas para industrializa��o, amostras gr�tis, mat�ria prima entre outras?

          N�o, o c�lculo e demonstra��o do valor do imposto deve ser feito somente para vendas a consumidor final.
          Considera-se tamb�m venda a consumidor final a venda de mercadorias para uso e consumo e ativo imobilizado.


          Fonte: IBPT - Manual da IBPT

          }

          if dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1 then
            infAdProd := 'Trib. aprox. Fed R$ ' + FormatFloat('##0.00', cTributosFederais)+'('+FormatFloat('#0.00',cPercentualTribFederal)+'%)'
                          + ' Est R$ ' + FormatFloat('##0.00', dmMProvider.cdsItemNFSaidaVALOR_CARGA_ESTADUAL.AsCurrency)+'('+FormatFloat('#0.00',dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.AsCurrency)+'%)'
                          + ' Mun R$ ' + FormatFloat('##0.00', dmMProvider.cdsItemNFSaidaVALOR_CARGA_MUNICIPAL.AsCurrency)+'('+FormatFloat('#0.00',dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.AsCurrency)+'%)'
                          + ' FONTE ' + dmMProvider.cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA.AsString + ' ' + dmMProvider.cdsItemNFSaidaASSINATURA_IBPT.AsString;


          with Imposto do
          begin

            with ICMS do
            begin

              if dmMProvider.cdsClientesPAIS.Value = dmMProvider.cdsFilialPAIS.Value then
              begin

                if dmMProvider.cdsFilialCRT.AsInteger <> 1 then
                begin

                  ICMS.CST        := StrToCSTICMS(ok, Copy(FormatFloat('000', dmMProvider.cdsItemNFSaidaCST.Value),2,2));
                  ICMS.modBC      := dbiValorOperacao;
                  ICMS.orig       := StrToOrig(ok,IntToStr(dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.AsInteger));
                  ICMS.pICMS      := dmMProvider.cdsItemNFSaidaICMS.AsCurrency;
                  ICMS.vBC        := dmMProvider.cdsItemNFSaidaBASE_ICMS.AsCurrency;
                  ICMS.vICMS      := dmMProvider.cdsItemNFSaidaVALOR_ICMS.AsCurrency;
                  ICMS.modBCST    := dbisMargemValorAgregado;
                  ICMS.pMVAST     := dmMProvider.cdsEstadosMVA.AsCurrency;
                  ICMS.vBCST      := dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.AsCurrency;
                  ICMS.vBCSTRet   := dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.AsCurrency;
                  ICMS.vICMSST    := dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.AsCurrency;
                  ICMS.vICMSSTRet := dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.AsCurrency;

                end
                else
                begin

                  ICMS.CSOSN      := StrToCSOSNIcms(ok, FormatFloat('000', dmMProvider.cdsItemNFSaidaCST.Value));
                  ICMS.modBC      := dbiValorOperacao;
                  ICMS.orig       := StrToOrig(ok,IntToStr(dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.AsInteger));
                  ICMS.pICMS      := dmMProvider.cdsItemNFSaidaICMS.AsCurrency;
                  ICMS.vBC        := dmMProvider.cdsItemNFSaidaBASE_ICMS.AsCurrency;
                  ICMS.vICMS      := dmMProvider.cdsItemNFSaidaVALOR_ICMS.AsCurrency;
                  ICMS.modBCST    := dbisMargemValorAgregado;
                  ICMS.pMVAST     := dmMProvider.cdsEstadosMVA.AsCurrency;
                  ICMS.vBCST      := dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.AsCurrency;
                  ICMS.vBCSTRet   := dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.AsCurrency;
                  ICMS.vICMSST    := dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.AsCurrency;
                  ICMS.vICMSSTRet := dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO. AsCurrency;

                end;

              end
              else
              begin

                CST   := cst41;
                modBC := dbiValorOperacao;
                orig  := StrToOrig(ok,IntToStr(dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.AsInteger));
                pICMS := dmMProvider.cdsItemNFSaidaICMS.AsCurrency;
                vICMS := dmMProvider.cdsItemNFSaidaVALOR_ICMS.AsCurrency;
                vBC   := dmMProvider.cdsItemNFSaidaBASE_ICMS.AsCurrency;

              end;


            end;

            with ICMSUFDest do
            begin

              if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2) then
              begin

                vBCUFDest         := dmMProvider.cdsItemNFSaidaBASE_ICMS.Value;
                pFCPUFDest        := dmMProvider.cdsItemNFSaidaPERC_FCP.Value;
                pICMSUFDest       := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value;
                pICMSInter        := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value;
                pICMSInterPart    := dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value;
                vFCPUFDest        := dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value;
                vICMSUFDest       := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO.Value;
                vICMSUFRemet      := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM.Value;

                if bNContribuinte then
                begin

                  vlBCUFDest        := vlBCUFDest + vBCUFDest;
                  percFCPUFDest     := pFCPUFDest;
                  percICMSUFDest    := pICMSUFDest;
                  percICMSInter     := pICMSInter;
                  percICMSInterPart := pICMSInterPart;
                  vlFCPUFDest       := vlFCPUFDest + vFCPUFDest;
                  vlICMSUFDest      := vlICMSUFDest + vICMSUFDest;
                  vlICMSUFRemet     := vlICMSUFRemet + vICMSUFRemet;

                end
                else
                begin

                  vBCUFDest       := 0;
                  pFCPUFDest      := 0;
                  pICMSUFDest     := 0;
                  pICMSInter      := 0;
                  pICMSInterPart  := 0;
                  vFCPUFDest      := 0;
                  vICMSUFDest     := 0;
                  vICMSUFRemet    := 0;

                end;

              end
              else
              begin

                vBCUFDest       := 0;
                pFCPUFDest      := 0;
                pICMSUFDest     := 0;
                pICMSInter      := 0;
                pICMSInterPart  := 0;
                vFCPUFDest      := 0;
                vICMSUFDest     := 0;
                vICMSUFRemet    := 0;

              end;

            end;

            if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) and not (bDevolucao) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 0) or (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 2) then
//            if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) and (not bDevolucao) then
              vTotTrib := dmMProvider.cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL.AsCurrency +
                          dmMProvider.cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL.AsCurrency +
                          dmMProvider.cdsItemNFSaidaVALOR_CARGA_ESTADUAL.AsCurrency +
                          dmMProvider.cdsItemNFSaidaVALOR_CARGA_MUNICIPAL.AsCurrency;

            if dmMProvider.cdsItemNFSaidaIPI.AsCurrency > 0 then
            begin

              with IPI do
              begin

  // 05/03/2016             CST       := ipi50;
                CST       := StrToCSTIPI(ok, dmMProvider.cdsItemNFSaidaCST_IPI.AsString);
  // 05/03/2016             clEnq     := '999';
                clEnq     := dmMProvider.cdsItemNFSaidaCOD_ENQUADRAMENTO.AsString;
                CNPJProd  := '';
                cSelo     := '';
                qSelo     := 0;
                cEnq      := '';
                IPI.vBC   := dmMProvider.cdsItemNFSaidaSUB_TOTAL.AsCurrency;
                IPI.vUnid := 0;//dmMProvider.cdsItem_NFSaidaVALORUNITARIO.AsCurrency;
                IPI.qUnid := 0;//dmMProvider.cdsItem_NFSaidaQUANTIDADE.AsCurrency;
                IPI.pIPI  := dmMProvider.cdsItemNFSaidaIPI.AsCurrency;
                IPI.vIPI  := SimpleRoundTo(dmMProvider.cdsItemNFSaidaSUB_TOTAL.AsCurrency *(dmMProvider.cdsItemNFSaidaIPI.AsCurrency / 100),-2);
                pIpi      := dmMProvider.cdsItemNFSaidaIPI.AsCurrency;

              end;

            end;

            with PIS do
            begin

              CST       := StrToCSTPIS(ok, FormatFloat('00',dmMProvider.cdsItemNFSaidaCST_PIS.Value));
              vBC       := dmMProvider.cdsItemNFSaidaBASE_PIS.AsCurrency;
              pPIS      := dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.AsCurrency;
              vPIS      := dmMProvider.cdsItemNFSaidaVALOR_PIS.AsCurrency;
              qBCProd   := 0;//dmMProvider.cdsItem_NFSaidaBASE_PIS.AsCurrency;
              vAliqProd := 0;//dmMProvider.cdsItem_NFSaidaVALOR_PIS.AsCurrency;

            end;

            with COFINS do
            begin

              CST       := StrToCSTCOFINS(ok, FormatFloat('00',dmMProvider.cdsItemNFSaidaCST_COFINS.Value));
              vBC       := dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.AsCurrency;
              pCOFINS   := dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.AsCurrency;
              vCOFINS   := dmMProvider.cdsItemNFSaidaVALOR_COFINS.AsCurrency;
              qBCProd   := 0;//dmMProvider.cdsItem_NFSaidaVALOR_BC_COFINS.AsCurrency;
              vAliqProd := 0;//dmMProvider.cdsItem_NFSaidaVALOR_COFINS.AsCurrency;

            end;

          end;

        end;

        dmMProvider.cdsItemNFSaida.Next;

      end;

      if (dmMProvider.cdsItemNFSaida.IsEmpty) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 1) then
      begin

        with det.Add do
        begin

          Prod.nItem    := 1;
          Prod.CFOP     := dmMProvider.cdsCfop_NFSaida.FieldByName('CFOP').Value;
          Prod.IndTot   := itNaoSomaTotalNFe;
          Prod.cEAN     := '';
          prod.cEANTrib := '';
          Prod.cProd    := 'CFOP'+Prod.CFOP;

          if (dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.AsCurrency > 0) and (dmMProvider.cdsNFSaidaVALORDOIPI.AsCurrency > 0) then
            Prod.xProd    :='COMPLEMENTO DE ICMS-ST/IPI'
          else if dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.AsCurrency > 0 then
            Prod.xProd    :='COMPLEMENTO DE ICMS-ST'
          else if dmMProvider.cdsNFSaidaVALORICMS.AsCurrency > 0 then
            Prod.xProd    :='COMPLEMENTO DE ICMS'
          else if dmMProvider.cdsNFSaidaVALORDOIPI.AsCurrency > 0 then
            Prod.xProd    :='COMPLEMENTO DE IPI'
          else if (dmMProvider.cdsFilialCRT.AsInteger = 1) and  (dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency > 0 )then
          begin

            Prod.xProd    :='COMPLEMENTO DE IPI';
            PROD.vOutro   := dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency;

          end;

          Prod.IndTot   := itNaoSomaTotalNFe;
          Prod.uCom     := 'R$';
          Prod.uTrib    := 'R$';
          Prod.qCom     := 0;
          Prod.qTrib    := 0;
          Prod.vUnCom   := 0;
          Prod.vUnTrib  := 0;
          Prod.vProd    := 0;
          Prod.NCM      := '10011900';

          with Imposto do
          begin

            with ICMSUFDest do
            begin

              vBCUFDest       := 0;
              pFCPUFDest      := 0;
              pICMSUFDest     := 0;
              pICMSInter      := 0;
              pICMSInterPart  := 0;
              vFCPUFDest      := 0;
              vICMSUFDest     := 0;
              vICMSUFRemet    := 0;

            end;

            with ICMS do
            begin

              if dmMProvider.cdsClientesPAIS.Value = dmMProvider.cdsFilialPAIS.Value then
              begin

                if dmMProvider.cdsFilialCRT.AsInteger <> 1 then
                begin

                  if dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.AsCurrency > 0 then
                    ICMS.CST      := StrToCSTICMS(ok, FormatFloat('00', 70))
                  else
                    ICMS.CST      := StrToCSTICMS(ok, FormatFloat('00', 0));

                  ICMS.modBC      := dbiValorOperacao;
                  ICMS.orig       := oeNacional;

                  if dmMProvider.cdsNFSaidaVALORICMS.AsCurrency > 0 then
                    ICMS.pICMS    := TruncVal((dmMProvider.cdsNFSaidaVALORICMS.AsCurrency / (dmMProvider.cdsNFSaidaBASECALCULOICMS.AsCurrency/100)),2)
                  else
                    ICMS.pICMS    := 0;

                  ICMS.vBC        := dmMProvider.cdsNFSaidaBASECALCULOICMS.AsCurrency;
                  ICMS.vICMS      := dmMProvider.cdsNFSaidaVALORICMS.AsCurrency;
                  ICMS.modBCST    := dbisPrecoTabelado;
                  ICMS.pMVAST     := dmMProvider.cdsEstadosMVA.AsCurrency;
                  ICMS.vBCST      := dmMProvider.cdsNFSaidaBASESUBSTITUICAO.AsCurrency;
                  ICMS.vBCSTRet   := dmMProvider.cdsNFSaidaBASESUBSTITUICAO.AsCurrency;
                  ICMS.vICMSST    := dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.AsCurrency;
                  ICMS.vICMSSTRet := dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.AsCurrency;

                end
                else if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 1  then
                begin

                  ICMS.CSOSN      := StrToCSOSNIcms(ok, FormatFloat('000', 900));
                  ICMS.modBC      := dbiValorOperacao;
                  ICMS.orig       := oeNacional;

                  if dmMProvider.cdsNFSaidaVALORICMS.AsCurrency > 0 then
                    ICMS.pICMS    := TruncVal((dmMProvider.cdsNFSaidaVALORICMS.AsCurrency / (dmMProvider.cdsNFSaidaBASECALCULOICMS.AsCurrency/100)),2)
                  else
                    ICMS.pICMS    := 0;

                  ICMS.vBC        := dmMProvider.cdsNFSaidaBASECALCULOICMS.AsCurrency;
                  ICMS.vICMS      := dmMProvider.cdsNFSaidaVALORICMS.AsCurrency;
                  ICMS.modBCST    := dbisMargemValorAgregado;
                  ICMS.pMVAST     := 0;
                  ICMS.vBCST      := 0;
                  ICMS.vBCSTRet   := 0;
                  ICMS.vICMSST    := 0;
                  ICMS.vICMSSTRet := 0;

                end
                else
                begin

                  ICMS.CSOSN      := StrToCSOSNIcms(ok, FormatFloat('000', 900));
                  ICMS.modBC      := dbiValorOperacao;
                  ICMS.orig       := oeNacional;
                  ICMS.pICMS      := 0;
                  ICMS.vBC        := 0;
                  ICMS.vICMS      := 0;
                  ICMS.modBCST    := dbisMargemValorAgregado;
                  ICMS.pMVAST     := 0;
                  ICMS.vBCST      := 0;
                  ICMS.vBCSTRet   := 0;
                  ICMS.vICMSST    := 0;
                  ICMS.vICMSSTRet := 0;

                end;


              end
              else
              begin

              end;

            end;

            if dmMProvider.cdsNFSaidaVALORDOIPI.AsCurrency > 0 then
            begin

              with IPI do
              begin

  //              CST       := ipi00;
                CST       := StrToCSTIPI(ok, dmMProvider.cdsItemNFSaidaCST_IPI.AsString);
  //              clEnq     := '999';
                clEnq     := dmMProvider.cdsItemNFSaidaCOD_ENQUADRAMENTO.AsString;

                CNPJProd  := '';
                cSelo     := '';
                qSelo     := 0;
                cEnq      := '';
                IPI.vBC   := 0;
                IPI.vUnid := 0;
                IPI.qUnid := 0;
                IPI.pIPI  := 0;
                IPI.vIPI  := dmMProvider.cdsNFSaidaVALORDOIPI.AsCurrency;

              end;

            end;

          end;

        end;

      end;

      if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) and not (bDevolucao) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 0) or (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 2) then
        Total.ICMSTot.vTotTrib := dmMProvider.cdsNFSaidaVALOR_CARGA_NAC_FEDERAL.AsCurrency +
                                  dmMProvider.cdsNFSaidaVALOR_CARGA_IMP_FEDERAL.AsCurrency +
                                  dmMProvider.cdsNFSaidaVALOR_CARGA_ESTADUAL.AsCurrency +
                                  dmMProvider.cdsNFSaidaVALOR_CARGA_MUNICIPAL.AsCurrency;

      Total.ICMSTot.vBC           := dmMProvider.cdsNFSaidaBASECALCULOICMS.AsCurrency;
      Total.ICMSTot.vICMS         := dmMProvider.cdsNFSaidaVALORICMS.AsCurrency;
      Total.ICMSTot.vNF           := dmMProvider.cdsNFSaidaVALORDANOTA.AsCurrency;
      Total.ICMSTot.vProd         := dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.AsCurrency;
      Total.ICMSTot.vFrete        := dmMProvider.cdsNFSaidaVALORDOFRETE.AsCurrency;
      Total.ICMSTot.vBCST         := dmMProvider.cdsNFSaidaBASESUBSTITUICAO.AsCurrency;
      Total.ICMSTot.vCOFINS       := dmMProvider.cdsNFSaidaVALOR_COFINS.AsCurrency;
      Total.ICMSTot.vPIS          := dmMProvider.cdsNFSaidaVALOR_PIS.AsCurrency;
      Total.ICMSTot.vST           := dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.AsCurrency;
      Total.ICMSTot.vSeg          := dmMProvider.cdsNFSaidaVALORDOSEGURO.AsCurrency;
      Total.ICMSTot.vDesc         := dmMProvider.cdsNFSaidaDESCONTO_ST.AsCurrency;
      Total.ICMSTot.vIPI          := dmMProvider.cdsNFSaidaVALORDOIPI.AsCurrency;
      Total.ICMSTot.vOutro        := dmMProvider.cdsNFSaidaOUTRASDESPESAS.AsCurrency;
      InfAdic.infCpl              := Trim(dmMProvider.cdsNFSaidaOBSERVACAO.AsString);
      InfAdic.infAdFisco          := Trim(dmMProvider.cdsNFSaidaINFO_FISCO.AsString);

      Total.ICMSTot.vFCPUFDest    := 0;
      Total.ICMSTot.vICMSUFDest   := 0;
      Total.ICMSTot.vICMSUFRemet  := 0;

      if bNContribuinte then
      begin

        Total.ICMSTot.vFCPUFDest    := vlFCPUFDest;
        Total.ICMSTot.vICMSUFDest   := vlICMSUFDest;
        Total.ICMSTot.vICMSUFRemet  := vlICMSUFRemet;

        if vlICMSUFDest > 0 then
        begin

          InfAdic.infAdFisco          := dmMProvider.cdsNFSaidaINFO_FISCO.AsString
                                         + ' Valores totais do ICMS Interestadual: DIFAL da UF destino R$' + FormatFloat('#,##0.00',vlICMSUFDest)
                                         + ' DIFAL da UF Origem R$ ' + FormatFloat('#,##0.00',vlICMSUFRemet)

        end;

        if vlFCPUFDest > 0 then
          InfAdic.infAdFisco          := InfAdic.infAdFisco + ' FCP R$ ' + FormatFloat('#,##0.00',vlFCPUFDest);

      end;

      cTributosFederais           := dmMProvider.cdsNFSaidaVALOR_CARGA_NAC_FEDERAL.AsCurrency + dmMProvider.cdsNFSaidaVALOR_CARGA_IMP_FEDERAL.AsCurrency;

      if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) and not (bDevolucao) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value <> 2) then

        InfAdic.infCpl := InfAdic.infCpl
                          + ' Trib. aprox. Fed R$ ' + FormatFloat('##0.00', cTributosFederais) + '(' + FormatFloat('#0.00',((cTributosFederais / dmMProvider.cdsNFSaidaVALORDANOTA.AsCurrency)*100)) + '%)'
                          + ' Est R$ ' + FormatFloat('##0.00', dmMProvider.cdsNFSaidaVALOR_CARGA_ESTADUAL.AsCurrency)+'('+FormatFloat('#0.00',((dmMProvider.cdsNFSaidaVALOR_CARGA_ESTADUAL.AsCurrency / dmMProvider.cdsNFSaidaVALORDANOTA.AsCurrency) * 100 ))+'%)'
                          + ' Mun R$ ' + FormatFloat('##0.00', dmMProvider.cdsNFSaidaVALOR_CARGA_MUNICIPAL.AsCurrency)+'('+FormatFloat('#0.00',((dmMProvider.cdsNFSaidaVALOR_CARGA_MUNICIPAL.AsCurrency / dmMProvider.cdsNFSaidaVALORDANOTA.AsCurrency) * 100 ))+'%)'
                          + ' FONTE ' + dmMProvider.cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA.AsString + ' ' + dmMProvider.cdsItemNFSaidaASSINATURA_IBPT.AsString;

    end;

    LimparMSG_ERRO(lblMsg, imgErro);

    if pOpcao = ord(PreviewNFE) then
    begin

      ACBrNFe1.NotasFiscais.Assinar;
      ACBrNFe1.NotasFiscais.Items[0].GravarXML();

      sArquivo := SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-NFe.xml';

      ACBrNFe1.NotasFiscais.Clear;

      if (dmMProvider.cdsParametros_NFECRIAR_PASTAS_MENSALMENTE.Value = 1) then
        ACBrNFe1.NotasFiscais.LoadFromFile(ACBrNFe1.Configuracoes.Arquivos.PathNFe + FormatDateTime('yyyymm',dmMProvider.cdsNFSaidaEMISSAO.Value) + '\' + sArquivo)
      else
        ACBrNFe1.NotasFiscais.LoadFromFile(ACBrNFe1.Configuracoes.Arquivos.PathNFe + sArquivo);

      ACBrNFe1.NotasFiscais.Imprimir;

    end
    else
    begin

      ACBrNFe1.Enviar(0);
//      ACBrNFe1.NotasFiscais.Imprimir;
      ACBrNFe1.NotasFiscais.ImprimirPDF;
//      ACBrNFe1.NotasFiscais.; //27/03/2017

      lblMsg.Caption  := RetornarRejeicao(dmDBEXMaster.sNomeUsuario,ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo, ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat);

      if ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID <> '' then
      begin

        dmMSProcedure.fdspMaster.StoredProcName             := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;
        dmMSProcedure.fdspMaster.ParamByName('I_SQL').Text  := 'UPDATE NFSAIDA SET NUMERO_DANFE = '
                                                              + QuotedStr(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)
                                                              + ' WHERE NFSAIDA = ' + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                              + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                              + ' AND SERIE = ' + QuotedStr(Trim(dmMProvider.cdsNFSaidaSERIE.Value))
                                                              + ' AND DESTINATARIO_ = ' + QuotedStr(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);
        dmMSProcedure.fdspMaster.ExecProc;

        dmMSProcedure.fdspMaster.ParamByName('I_SQL').Text  := 'UPDATE NFSAIDA SET PROTOCOLO_DANFE = '
                                                              + QuotedStr(ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt)
                                                              + ' WHERE NFSAIDA = ' + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                              + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                              + ' AND SERIE = ' + QuotedStr(Trim(dmMProvider.cdsNFSaidaSERIE.Value))
                                                              + ' AND DESTINATARIO_ = ' + QuotedStr(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);
        dmMSProcedure.fdspMaster.ExecProc;

        dmMSProcedure.fdspMaster.ParamByName('I_SQL').Text  := 'UPDATE EFD_PIS_COFINS_RC100 SET CHV_NFE = '
                                                              + QuotedStr(ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].chNFe)
                                                              + ' WHERE NUM_DOCUMENTO = ' + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                              + ' AND COD_MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                              + ' AND SERIE = ' + QuotedStr(Trim(dmMProvider.cdsNFSaidaSERIE.Value))
                                                              + ' AND COD_PARTICIPANTE = ' + QuotedStr(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);

        dmMSProcedure.fdspMaster.ExecProc;

        dmMSProcedure.fdspGravarFCP_Estados.Params[0].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;
        dmMSProcedure.fdspGravarFCP_Estados.Params[1].Value := dmMProvider.cdsNFSaidaMODELO.Value;
        dmMSProcedure.fdspGravarFCP_Estados.Params[2].Value := dmMProvider.cdsNFSaidaUF_DEST.Value;
        dmMSProcedure.fdspGravarFCP_Estados.ExecProc;
{
        dmMSProcedure.fdspGravarRegistroC101SPED.Params[0].Value := dmMProvider.cdsNFSaidaEMISSAO.Value;
        dmMSProcedure.fdspGravarRegistroC101SPED.Params[1].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;
        dmMSProcedure.fdspGravarRegistroC101SPED.Params[2].Value := dmMProvider.cdsNFSaidaMODELO.Value;
        dmMSProcedure.fdspGravarRegistroC101SPED.Params[3].Value := dmMProvider.cdsNFSaidaSERIE.Value;
        dmMSProcedure.fdspGravarRegistroC101SPED.Params[4].Value := dmDBEXMaster.iIdFilial;
        dmMSProcedure.fdspGravarRegistroC101SPED.ExecProc;
}
        if Length(Trim(dmMProvider.cdsClientesEMAIL.AsString)) > 0 then
        begin

          if (ValidarEmail(dmMProvider.cdsClientesEMAIL.AsString)) and (Length(Trim((dmMProvider.cdsConfiguracoesSERVIDOR_SMTP.AsString))) > 0) then
          begin

            if dmMProvider.cdsConfiguracoesENVIAR_XML_CONTABILIDADE.Value = 1 then
              lblMsg.Caption := 'Aguarde...enviando e-mail para: ' +  dmMProvider.cdsClientesEMAIL.AsString
                                + ' com c�pia para: ' + dmMProvider.cdsConfiguracoesEMAIL_CONTADOR.AsString
            else
              lblMsg.Caption := 'Aguarde...enviando e-mail para: ' +  dmMProvider.cdsClientesEMAIL.AsString;

            Application.ProcessMessages;

            CC := TStringList.Create;

            CC.Add('Esta mensagem refere-se � Nota Fiscal Eletr�nica N�: ' + InttoStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cNF) + ' emitida pela empresa:');

            CC.Add('Raz�o Social: '     + dmMProvider.cdsFilialRAZAOSOCIAL.Value);
            CC.Add('E-mail: '           + dmMProvider.cdsFilialEMAIL.Value);
            CC.Add('CNPJ: '             + FormatarCNPJCPF(dmMProvider.cdsFilialCNPJ.Value));
            CC.Add('Insc.Est.: '        + FormatarCNPJCPF(dmMProvider.cdsFilialINSCRICAO.Value));
            CC.Add(' ');
            CC.Add(' ');
            CC.Add('Para visualiz�-la acesse o link a seguir:');
            CC.Add('https://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
            CC.Add('chave de acesso:  ' + Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 4, Length(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)));
            CC.Add(' ');
            CC.Add(' ');
            CC.Add('* Este e-mail foi enviado automaticamente pelo Sistema de Gest�o GenesisAC-XE');
            CC.Add('  Favor n�o responder. Em caso de d�vidas, entre em contato com: ' + dmMProvider.cdsFilialEMAIL.Value);
            CC.Add(' ');
            CC.Add(' ');
            CC.Add('________________________________________________________________');
            CC.Add(' ');
            CC.Add(' ');
            CC.Add('*     Esta mensagem, incluindo seus anexos, � confidencial e seu conte�do � restrito ao destinat�rio da mensagem.');
            CC.Add('Caso voc� a tenha recebido por engano, queira, por favor, retorn�-la ao destinat�rio e apag�-la de seus arquivos.');
            CC.Add('� expressamente proibido o uso n�o autorizado, replica��o ou dissemina��o da mesma.');
            CC.Add('As opini�es contidas nesta mensagem e seus anexos n�o necessariamente refletem a opini�o do emissor. Grato pela colabora��o.');

            Para := dmMProvider.cdsClientesEMAIL.AsString;

            cEmailContabilidade.Add(dmMProvider.cdsConfiguracoesEMAIL_CONTADOR.AsString);

            if (dmMProvider.cdsConfiguracoesENVIAR_XML_CONTABILIDADE.Value = 1) and (Length(Trim(dmMProvider.cdsConfiguracoesEMAIL_CONTADOR.AsString)) > 0) then
              ACBrNFe1.NotasFiscais.Items[0].EnviarEmail( Para,
                                                          'Nf-e ' + ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,
                                                          CC,
                                                          True,                // Enviar PDF junto
                                                          cEmailContabilidade, // Lista com emails que serão enviado cópias - TStrings
                                                          nil)                 // Lista de anexos - TStrings
            else
              ACBrNFe1.NotasFiscais.Items[0].EnviarEmail( Para,
                                                          'Nf-e ' + ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,
                                                          CC,
                                                          True,   // Enviar PDF junto
                                                          nil ,   // Lista com emails que serão enviado cópias - TStrings
                                                          nil);    // Lista de anexos - TStrings

            CC.Free;

            lblMsg.Caption := 'email enviado com sucesso!';
            Application.ProcessMessages;

          end
          else
          begin

            lblMsg.Caption := 'Email inv�lido: ' +  dmMProvider.cdsClientesEMAIL.AsString;
            Application.ProcessMessages;

          end;


        end
        else
          lblMsg.Caption := MSG_EMAIL_NAO_CADASTRADO + dmMProvider.cdsClientesRAZAOSOCIAL.AsString;

        Application.ProcessMessages;

      end;

      if Length(Trim(dmMProvider.cdsParametros_NFEREPOSITORIO_XML.AsString)) > 0 then
      begin

        sPastaOrigemXML   := ACBrNFe1.Configuracoes.Arquivos.PathNFe;
        sPastaOrigemPDF   := ACBrNFe1.DANFE.PathPDF;

        sPastaDestinoXML  := dmMProvider.cdsParametros_NFEREPOSITORIO_XML.AsString;
        sPastaDestinoPDF  := dmMProvider.cdsParametros_NFEREPOSITORIO_PDF.AsString;

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_COPIANDO_XML_REPOSITORIO + dmMProvider.cdsParametros_NFEREPOSITORIO_XML.AsString;
        Application.ProcessMessages;

        if ForceDirectories(sPastaDestinoXML + sAno_Mes) then
        begin

          if FileExists(sPastaOrigemXML + FormatDateTime('yyyymm', Date{dmMProvider.cdsNFSaidaEMISSAO.Value})+'\'+ SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-NFe.xml' ) then
          begin

  //          if not CopiaArquivo(ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\' + FormatDateTime('yyyymm',dmMProvider.cdsNFSaidaEMISSAO.Value)+'\'+ SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-NFe.xml', dmMProvider.cdsParametros_NFEREPOSITORIO_XML.AsString + SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-NFe.xml', dmDBEXMaster.iTipo_Acesso) then
            if not CopyFile(PWideChar( sPastaOrigemXML + FormatDateTime('yyyymm', Date{dmMProvider.cdsNFSaidaEMISSAO.Value})+'\'+ SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-NFe.xml') ,
                     PWideChar( sPastaDestinoXML + sAno_Mes + '\' + SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-NFe.xml'),True) then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_COPIANDO_ARQ_REPOS + sPastaDestinoXML;
              Application.ProcessMessages;
              sleep(3000);

            end;

          end;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_CRIAR_PASTA + sPastaDestinoXML;
          Application.ProcessMessages;
          sleep(3000);

        end;

        if ForceDirectories(sPastaDestinoPDF + sAno_Mes)then
        begin

          if FileExists(sPastaOrigemPDF + SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) + '-nfe.pdf' ) then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_COPIANDO_PDF_REPOSITORIO + sPastaDestinoPDF;
            Application.ProcessMessages;

            if not CopyFile(PWideChar(sPastaOrigemPDF + SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-nfe.pdf') ,
                     PWideChar(sPastaDestinoPDF  + sAno_Mes + '\' + SomenteNumeros(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) +'-nfe.pdf'),False) then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_COPIANDO_ARQ_REPOS + sPastaDestinoPDF;
              Application.ProcessMessages;
              sleep(3000);

            end;

          end;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_CRIAR_PASTA + sPastaDestinoPDF;
          Application.ProcessMessages;
          sleep(3000);

        end;

      end;

      ACBrNFe1.NotasFiscais.Clear;

      FreeAndNil(cEmailContabilidade);

      LimparMSG_ERRO(lblMsg, imgErro);

      grdSelecionaNotas.Enabled := True;

      actSelecionarNotasExecute(self);
      AbrirTabela_Cliente(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);
      actSelecionarNotasExecute(self);

    end;

    if dmDBEXMaster.fdcMaster.InTransaction then
      dmDBEXMaster.fdtMaster.Commit;

  except

    on E:exception do
    begin

      grdSelecionaNotas.Enabled := True;

      if ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Count > 0 then
      begin

        if not dmDBEXMaster.fdcMaster.InTransaction then
          dmDBEXMaster.fdtMaster.StartTransaction;

        lblMsg.Caption  := RetornarRejeicao(dmDBEXMaster.sNomeUsuario,ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo, ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat);
        Application.ProcessMessages;

        case ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat of
          110:begin //denegar a nota

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DENEGANDO_NFE;
                Application.ProcessMessages;

                dmMSProcedure.fdspMaster.StoredProcName   := 'EXECUTA_SQL';
                dmMSProcedure.fdspMaster.Prepare;
                dmMSProcedure.fdspMaster.Params[0].Value  := 'UPDATE NFSAIDA SET NUMERO_DANFE = '
                                                              + QuotedStr('Nfe'+ACBrNFe1.WebServices.Consulta.NFeChave)
                                                              + ', PROTOCOLO_DANFE = ' + QuotedStr(ACBrNFe1.WebServices.Consulta.Protocolo)
                                                              + ', STATUS  = 3'
                                                              + ' WHERE NFSAIDA = ' + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                              + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                              + ' AND SERIE = ' + Trim(dmMProvider.cdsNFSaidaSERIE.AsString)
                                                              + ' AND DESTINATARIO_ = ' + QuotedStr(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);
                dmMSProcedure.fdspMaster.ExecProc;

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DENEGANDO_NFE;
                Application.ProcessMessages;

                GravarEstornarRegistro50(2);

                GravarEstornarLivroSaida(1);

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ATUALIZANDO_STATUS + 'Nota fiscal';
                Application.ProcessMessages;

                dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                dmMSProcedure.fdspMaster.Prepare;

                dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE EFD_PIS_COFINS_RC100 SET CHV_NFE = '
                                                                    + QuotedStr(ACBrNFe1.WebServices.Consulta.NFeChave)
                                                                    + ' WHERE NUM_DOCUMENTO = ' + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                                    + ' AND COD_MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                                    + ' AND SERIE = 1'
                                                                    + ' AND COD_PARTICIPANTE = ' + QuotedStr(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);

                dmMSProcedure.fdspMaster.ExecProc;

                dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE EFD_PIS_COFINS_RC100 SET COD_SITUACAO = 4'
                                                                    + ' WHERE CHV_NFE = ' + QuotedStr(ACBrNFe1.WebServices.Consulta.NFeChave);
                dmMSProcedure.fdspMaster.ExecProc;

                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[0].Value  := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[1].Value  := dmMProvider.cdsFilialCNPJ.Value;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[2].Value  := dmMProvider.cdsFilialINSCRICAO.Value;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[3].Value  := dmMProvider.cdsNFSaidaEMISSAO.Value;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[4].Value  := dmMProvider.cdsFilialESTADOENTREGA.Value;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[5].Value  := dmMProvider.cdsConfiguracoesMODELO.Value;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[6].Value  := dmMProvider.cdsConfiguracoesSERIE.Value;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[7].Value  := InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[8].Value  := '';
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[9].Value  := 'P';
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[10].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[11].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[12].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[13].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[14].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[15].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[16].Value := '2';
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[17].Value := 0;
                dmMSProcedure.fdspMan_Tab_R50_Sint.Params[18].Value := dmMProvider.cdsNFSaidaEMISSAO.Value;

                dmMSProcedure.fdspMan_Tab_R50_Sint.ExecProc;

                actSelecionarNotasExecute(self);

              end;

        end;

        if dmDBEXMaster.fdcMaster.InTransaction then
          dmDBEXMaster.fdtMaster.Commit;

      end


      else

//        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + ', ' + Copy(Tratar_Erro_Conexao(E),1,-1) + ' ' + Trim(Copy(Tratar_Erro_Conexao(E),Pos(#13,e.Message)+2, Length(e.Message)));
        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
        Application.ProcessMessages;

    end;

  end;


end;

procedure TfrmMonitorPedido.actIntegracaoPedidoZeusExecute(Sender: TObject);
var
  sOrcamento_Controle:string;
begin

  LimparMsgErro;

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  if ConsisteValorPedidoValorRecebido then
  begin

    try

      if not dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.StartTransaction;

      case dmMProvider.cdsFilialUTILIZA_NFCE.Value of
        0:begin// n�o uliza nfce

            //verifica se a tabela depedido n�o est� vazia
            if not dmMProvider.cdsPedidoZeus.IsEmpty then
            begin

              //verifica se o pedido n�o est� confirmado
              if dmMProvider.cdsPedidoZeusSITUACAO.Value = 1 then
              begin

                if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
                begin

                  //verifica finaliza��o a prazo e cheque
                  {if not Validar_A_Prazo_Cheque then
                  begin

                    lblMsg.Caption := dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value + ', opera��o n�o pode ser conclu�da ';
                    Application.ProcessMessages;
                    exit;

                  end;
                  }
                  //verifica se o pedido n�o existe na tabela do zeus
                  if not pesquisa_pedido_zeus(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                    dmMZeus.cdsIntPedZeus.Append
                  else
                    dmMZeus.cdsIntPedZeus.Edit;

                  dmMZeus.cdsIntPedZeuscod_loja.Value                               := dmMProvider.cdsPedidoZeusFILIAL.Value;
                  dmMZeus.cdsIntPedZeuscod_pedido.Value                             := dmMProvider.cdsPedidoZeusPEDIDO.Value;
                  dmMZeus.cdsIntPedZeuscod_loja_saida_mercadoria.Value              := dmMProvider.cdsPedidoZeusLOJA_SAI_MERCADORIA.Value;
                  dmMZeus.cdsIntPedZeusdata_pedido.AsDateTime                       := Date;//dmMProvider.cdsPedidoZeusEMISSAO.AsDateTime;
                  dmMZeus.cdsIntPedZeusentrega.Value                                := '0';
                  dmMZeus.cdsIntPedZeusdata_entrega.AsDateTime                      := Date;//dmMProvider.cdsPedidoZeusDATA_ENTREGA.AsDateTime;

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
                  dmMZeus.cdsIntPedZeussituacao.Value                               := IntToStr(dmMProvider.cdsPedidoZeusSITUACAO.Value +1);
                  dmMZeus.cdsIntPedZeususuario.Value                                := dmMProvider.cdsPedidoZeusUSUARIO.Value;
                  dmMZeus.cdsIntPedZeusdata_cadastro.AsDateTime                     := Date;//dmMProvider.cdsPedidoZeusEMISSAO.AsDateTime;
                  dmMZeus.cdsIntPedZeuscod_vendedor.Value                           := dmMProvider.cdsPedidoZeusVENDEDOR.Value;
                  dmMZeus.cdsIntPedZeuscod_funcionario_liberador.Value              := dmMProvider.cdsPedidoZeusVENDEDOR.Value;
                  dmMZeus.cdsIntPedZeusdata_ultima_alteracao.AsDateTime             := Date;//dmMProvider.cdsPedidoZeusEMISSAO.AsDateTime;
                  dmMZeus.cdsIntPedZeusnum_itens_pedido.Value                       := dmMProvider.cdsItemPedZeus.RecordCount;
                  dmMZeus.cdsIntPedZeusvalor_pedido.Value                           := dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value;
                  dmMZeus.cdsIntPedZeusvalor_desconto_adicional.Value               := dmMProvider.cdsPedidoZeusVALOR_DESCONTO.Value;
                  dmMZeus.cdsIntPedZeusvalor_acrescimo.Value                        := dmMProvider.cdsPedidoZeusVALOR_ACRESCIMO.Value;
                  dmMZeus.cdsIntPedZeusvalor_acrescimo_adicional.Value              := 0;
                  dmMZeus.cdsIntPedZeusnum_prevenda.AsInteger                       := dmMProvider.cdsPedidoZeusPEDIDO.Value;
                  dmMZeus.cdsIntPedZeusnum_linhas_item.Value                        := dmMProvider.cdsItemPedZeus.RecordCount;
                  dmMZeus.cdsIntPedZeuspreco_tipo_venda_usado.Value                 := '1';
                  dmMZeus.cdsIntPedZeusproibicao_venda_tipo_1.Value                 := '0';
                  dmMZeus.cdsIntPedZeusproibicao_venda_tipo_2.Value                 := '1';
                  dmMZeus.cdsIntPedZeusproibicao_venda_tipo_3.Value                 := '1';
                  dmMZeus.cdsIntPedZeusproibicao_venda_tipo_4.Value                 := '1';
                  dmMZeus.cdsIntPedZeusproibicao_venda_tipo_5.Value                 := '1';
                  dmMZeus.cdsIntPedZeusopcao_mensagem.Value                         := 2;
                  dmMZeus.cdsIntPedZeuspedido_ja_conferido.Value                    := '0';
                  dmMZeus.cdsIntPedZeusflg_pedido_exclusivo.Value                   := '0';
                  dmMZeus.cdsIntPedZeusflg_integracao_01.Value                      := 0;
                  dmMZeus.cdsIntPedZeusflg_tipo_cobranca_frete.Value                := '9';
                  dmMZeus.cdsIntPedZeusflg_venda_para_exterior.Value                := '0';
                  dmMZeus.cdsIntPedZeusflg_venda_para_exterior.Value                := '0';
                  dmMZeus.cdsIntPedZeusflg_venda_para_exterior.Value                := '0';

                  dmMZeus.cdsIntPedZeus.ApplyUpdates(0);

                  //dados da entrega
                  {if not dmMProvider.cdsEndEntregaPedZeus.IsEmpty then
                  begin

                    if not pesquisa_end_entrega(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                      dmMProvider.cdsIntEndEntregaZeus.Append
                    else
                      dmMProvider.cdsIntEndEntregaZeus.Edit;

                    dmMProvider.cdsIntEndEntregaZeuscod_loja.Value                      := dmMProvider.cdsPedidoZeusFILIAL.Value;
                    dmMProvider.cdsIntEndEntregaZeuscod_pedido.Value                    := dmMProvider.cdsPedidoZeusPEDIDO.Value;
                    dmMProvider.cdsIntEndEntregaZeustelefone_entrega.Value              := dmMProvider.cdsEndEntregaPedZeusTELEFONE_ENTREGA.Value;
                    dmMProvider.cdsIntEndEntregaZeusrua.Value                           := dmMProvider.cdsEndEntregaPedZeusENDERECO.Value;
                    if dmMProvider.cdsEndEntregaPedZeusNUMERO.Value > 0 then
                      dmMProvider.cdsIntEndEntregaZeusnumero.Value                      := IntToStr(dmMProvider.cdsEndEntregaPedZeusNUMERO.Value)
                    else
                      dmMProvider.cdsIntEndEntregaZeusnumero.Value                      := 'S/N';
                    dmMProvider.cdsIntEndEntregaZeuscomplemento.Value                   := dmMProvider.cdsEndEntregaPedZeusCOMPLEMENTO.Value;
                    dmMProvider.cdsIntEndEntregaZeusbairro.Value                        := dmMProvider.cdsEndEntregaPedZeusBAIRRO.Value;
                    dmMProvider.cdsIntEndEntregaZeuscidade.Value                        := dmMProvider.cdsEndEntregaPedZeusCIDADE.Value;
                    dmMProvider.cdsIntEndEntregaZeusuf.Value                            := dmMProvider.cdsEndEntregaPedZeusESTADO.Value;
                    dmMProvider.cdsIntEndEntregaZeuscep.Value                           := dmMProvider.cdsEndEntregaPedZeusCEP.Value;
                    dmMProvider.cdsIntEndEntregaZeushorario_transacao.Value             := FormatDateTime('hhmm',dmMProvider.cdsEndEntregaPedZeusHORA_TRANSACAO.Value);

                    dmMProvider.cdsIntEndEntregaZeus.ApplyUpdates(0);

                  end
                  else
                  begin

                    if pesquisa_end_entrega(dmMProvider.cdsPedidoZeusFILIAL.Value, dmMProvider.cdsPedidoZeusPEDIDO.Value) then
                      dmMProvider.cdsIntEndEntregaZeus.Delete;

                    dmMProvider.cdsIntEndEntregaZeus.ApplyUpdates(0);

                  end;}

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

                      dmMZeus.cdsIntFinalizPedZeuscod_loja.Value                    := dmMProvider.cdsPedidoZeusFILIAL.Value;
                      dmMZeus.cdsIntFinalizPedZeuscod_pedido.Value                  := dmMProvider.cdsFinalizadoraPedZeusPEDIDO.Value;

                      dmMZeus.cdsIntFinalizPedZeuscod_finalizadora.Value            := StrToInt(dmMProvider.cdsFinalizadoraPedZeusCOD_FINALIZADORA.Value);
                      dmMZeus.cdsIntFinalizPedZeusval_finalizado.Value              := dmMZeus.cdsIntFinalizPedZeusval_finalizado.Value + dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value;

                      if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                        dmMZeus.cdsIntFinalizPedZeuscod_cliente.Value               := dmMProvider.cdsPedidoZeusCLIENTE.Value;

                      dmMZeus.cdsIntFinalizPedZeusqtd_parcelas.Value                := dmMProvider.cdsFinalizadoraPedZeusQUANTIDADE_PARCELAS.Value;
                      dmMZeus.cdsIntFinalizPedZeuscod_pedido_ordem_finaliz.Value    := dmMProvider.cdsFinalizadoraPedZeus.RecNo;

                      dmMZeus.cdsIntFinalizPedZeus.ApplyUpdates(0);

                      if dmMProvider.cdsFretePedidoVendaTIPO_PAGAMENTO.Value > 0 then
                      begin

                        if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                        begin

                          frmFreteCaixa := TfrmFreteCaixa.Create(self);
                          if frmFreteCaixa.ShowModal = mrOk then
                          begin

                            dmMSProcedure.fdspCre.Params[0].Value       := 0;
                            dmMSProcedure.fdspCre.Params[1].Value       := -1;
                            dmMSProcedure.fdspCre.Params[2].Value       := dmDBEXMaster.iIdFilial;
                            dmMSProcedure.fdspCre.Params[3].Value       := 'FRT' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-1';
                            dmMSProcedure.fdspCre.Params[4].Value       := 0;
                            dmMSProcedure.fdspCre.Params[5].Value       := Date;
                            dmMSProcedure.fdspCre.Params[6].Value       := dmMProvider.cdsPedidoZeusCLIENTE.Value;
                            dmMSProcedure.fdspCre.Params[7].Value       := 0;
                            dmMSProcedure.fdspCre.Params[8].Value       := dmMProvider.cdsPedidoZeusEMISSAO.Value;
                            dmMSProcedure.fdspCre.Params[9].Value       := dmMProvider.cdsFretePedidoVendaVENCIMENTO.Value;
                            dmMSProcedure.fdspCre.Params[10].Value      := 0;
                            dmMSProcedure.fdspCre.Params[11].Value      := dmMProvider.cdsFretePedidoVendaVALOR.Value;
                            //calcular mora
                            dmMSProcedure.fdspCre.Params[12].Value      := (dmMProvider.cdsFretePedidoVendaVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100 ;
                            dmMSProcedure.fdspCre.Params[13].Value      := 0;
                            dmMSProcedure.fdspCre.Params[14].Value      := null;
                            dmMSProcedure.fdspCre.Params[15].Value      := 'LANCAMENTO REFER FRETE PED N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                            dmMSProcedure.fdspCre.Params[16].Value      := 0;
                            dmMSProcedure.fdspCre.Params[17].Value      := 0;
                            dmMSProcedure.fdspCre.Params[18].Value      := 0;
                            dmMSProcedure.fdspCre.Params[19].Value      := 0;
                            dmMSProcedure.fdspCre.Params[20].Value      := dmMProvider.cdsFretePedidoVendaPLANO_CONTAS.Value;
                            dmMSProcedure.fdspCre.Params[21].Value      := dmMProvider.cdsFretePedidoVendaITEM_PLANO_CONTAS.Value;
                            dmMSProcedure.fdspCre.Params[22].Value      := dmMProvider.cdsFretePedidoVendaTIPO_LANCAMENTO.Value;
                            dmMSProcedure.fdspCre.Params[23].Value      := 0;
                            dmMSProcedure.fdspCre.Params[24].Value      := null;
                            dmMSProcedure.fdspCre.Params[25].Value      := '11';
                            dmMSProcedure.fdspCre.Params[26].Value      := 0;
                            dmMSProcedure.fdspCre.Params[27].Value      := null;
                            dmMSProcedure.fdspCre.Params[28].Value      := null;
                            dmMSProcedure.fdspCre.Params[29].Value      := 0;
                            dmMSProcedure.fdspCre.Params[30].Value      := 0;
                            dmMSProcedure.fdspCre.Params[31].Value      := 0;
                            dmMSProcedure.fdspCre.Params[32].Value      := null;
                            dmMSProcedure.fdspCre.Params[33].Value      := '';
                            dmMSProcedure.fdspCre.Params[34].Value      := 0;
                            dmMSProcedure.fdspCre.Params[35].Value      := 0;
                            dmMSProcedure.fdspCre.Params[36].Value      := 0;
                            dmMSProcedure.fdspCre.ExecProc;

                            Imprimir_Parcelas_Frete;

                          end
                          else
                          begin

                            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_NAO_REALIZADA;
                            Application.ProcessMessages;
                            exit;

                          end;

                        end
                        else
                        begin

                          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', necess�rio informar o Cliente!';
                          Application.ProcessMessages;
                          exit;

                        end;

                        FreeAndNil(frmFreteCaixa);

                      end;

                      if dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 10 then
                      begin

                        frmFormaPgamentoCRE := TfrmFormaPgamentoCRE.Create(self);
                        if frmFormaPgamentoCRE.ShowModal = mrOk then
                        begin

                          dmMProvider.cdsParcelasCRE_TEMP_CX.First;

                          while not dmMProvider.cdsParcelasCRE_TEMP_CX.Eof do
                          begin

                            dmMSProcedure.fdspCre.Params[0].Value       := 0;
                            dmMSProcedure.fdspCre.Params[1].Value       := -1;
                            dmMSProcedure.fdspCre.Params[2].Value       := dmDBEXMaster.iIdFilial;
                            dmMSProcedure.fdspCre.Params[3].Value       := 'PV' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-' + InttoStr(dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value) + '/' + IntToStr(dmMProvider.cdsParcelasCRE_TEMP_CX.RecordCount);
                            dmMSProcedure.fdspCre.Params[4].Value       := 0;
                            dmMSProcedure.fdspCre.Params[5].Value       := Date;
                            dmMSProcedure.fdspCre.Params[6].Value       := dmMProvider.cdsPedidoZeusCLIENTE.Value;
                            dmMSProcedure.fdspCre.Params[7].Value       := 0;
                            dmMSProcedure.fdspCre.Params[8].Value       := dmMProvider.cdsPedidoZeusEMISSAO.Value;
                            dmMSProcedure.fdspCre.Params[9].Value       := dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value;
                            dmMSProcedure.fdspCre.Params[10].Value      := 0;
                            dmMSProcedure.fdspCre.Params[11].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value;
                            //calcular mora
                            dmMSProcedure.fdspCre.Params[12].Value      := (dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100 ;
                            dmMSProcedure.fdspCre.Params[13].Value      := 0;
                            dmMSProcedure.fdspCre.Params[14].Value      := null;
                            dmMSProcedure.fdspCre.Params[15].Value      := 'LANCAMENTO EFTUADO PELO CX. PED N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                            dmMSProcedure.fdspCre.Params[16].Value      := 0;
                            dmMSProcedure.fdspCre.Params[17].Value      := 0;
                            dmMSProcedure.fdspCre.Params[18].Value      := 0;
                            dmMSProcedure.fdspCre.Params[19].Value      := 0;
                            dmMSProcedure.fdspCre.Params[20].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXPLANO_CONTA.Value;
                            dmMSProcedure.fdspCre.Params[21].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXITEM_PLANO_CONTA.Value;
                            dmMSProcedure.fdspCre.Params[22].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXLANCAMENTO.Value;
                            dmMSProcedure.fdspCre.Params[23].Value      := 0;
                            dmMSProcedure.fdspCre.Params[24].Value      := null;
                            dmMSProcedure.fdspCre.Params[25].Value      := '11';
                            dmMSProcedure.fdspCre.Params[26].Value      := 0;
                            dmMSProcedure.fdspCre.Params[27].Value      := null;
                            dmMSProcedure.fdspCre.Params[28].Value      := null;
                            dmMSProcedure.fdspCre.Params[29].Value      := 0;
                            dmMSProcedure.fdspCre.Params[30].Value      := 0;
                            dmMSProcedure.fdspCre.Params[31].Value      := 0;
                            dmMSProcedure.fdspCre.Params[32].Value      := null;
                            dmMSProcedure.fdspCre.Params[33].Value      := '';
                            dmMSProcedure.fdspCre.Params[34].Value      := 0;
                            dmMSProcedure.fdspCre.Params[35].Value      := 0;
                            dmMSProcedure.fdspCre.Params[36].Value      := 0;

      //                      dmMSProcedure.fdspCre.ExecProc;

                            dmMProvider.cdsParcelasCRE_TEMP_CX.Next;

                          end;

                          dmMProvider.cdsParcelasCRE_TEMP_CX.First;
      //                    Imprimir_Parcelas_CRE;

                        end
                        else
                        begin

                          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_NAO_REALIZADA;
                          Application.ProcessMessages;
                          exit;

                        end;

                      end;

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
      //              dmMZeus.cdsIntItemPedidoZeususuario.Value                       := dmMProvider.cdsPedidoZeusUSUARIO.Value;
      //              dmMZeus.cdsIntItemPedidoZeusdata_cadastro.AsDateTime            := dmMProvider.cdsItemPedZeusDATA_CADASTRO.AsDateTime;
      //              dmMZeus.cdsIntItemPedidoZeusdata_ultima_alteracao.AsDateTime    := dmMProvider.cdsItemPedZeusDATA_ALTERACAO.AsDateTime;
                    dmMZeus.cdsIntItemPedidoZeusquantidade.Value                    := dmMProvider.cdsItemPedZeusQUANTIDADE.Value;
                    dmMZeus.cdsIntItemPedidoZeuscod_departamento.Value              := dmMProvider.cdsItemPedZeusGRUPO.Value;

                    dmMZeus.cdsIntItemPedidoZeuspreco_unitario.Value                := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
                    dmMZeus.cdsIntItemPedidoZeusvalor_desconto.Value                := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value;
                    dmMZeus.cdsIntItemPedidoZeusvalor_acrescimo.Value               := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value;
                    dmMZeus.cdsIntItemPedidoZeusgarantia_fabricante.Value           := 0;
                    dmMZeus.cdsIntItemPedidoZeussituacao.Value                      := '0';
                    dmMZeus.cdsIntItemPedidoZeusflags.Value                         := 1;
                    dmMZeus.cdsIntItemPedidoZeusentrega.Value                       := '0';
                    dmMZeus.cdsIntItemPedidoZeusencomenda.Value                     := '0';
      //              dmMZeus.cdsIntItemPedidoZeusdata_entrega_prod.AsDateTime        := dmMProvider.cdsPedidoZeusDATA_ENTREGA.AsDateTime;
      //              dmMZeus.cdsIntItemPedidoZeuscod_local.Value                     := dmMProvider.cdsItemPedZeusFILIAL.Value;
      //              dmMZeus.cdsIntItemPedidoZeussituacao.Value                      := IntToStr(dmMProvider.cdsPedidoZeusSITUACAO.Value);
        //            dmMZeus.cdsIntItemPedidoZeusdocumento_registro.Value            := 0;
                    dmMZeus.cdsIntItemPedidoZeusitem_ja_conferido.Value             := '0';

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

                end;

                //ATUALIZAR SALDO DE PRODUTOS

                if Atualializar_saldo_Produto(7, 0 ,0) then
                begin

                  dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                  dmMSProcedure.fdspMaster.Prepare;

                  dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 2 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.cdsPedidoZeus.Edit;
                  dmMProvider.cdsPedidoZeusSITUACAO.Value := 2;
                  dmMProvider.cdsPedidoZeus.Post;

                end;

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PEDIDO_GRAVADO + ', pedido: ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                Application.ProcessMessages;

                dmMProvider.cdsFinalizadoraPedZeus.First;

                while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
                begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where FORMAPAGAMENTO = ' + IntToStr(dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value));

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

      //            if (dmMProvider.cdsFormasPagamentoTIPO.Value = 2) or (dmMProvider.cdsFormasPagamentoTIPO.Value = 7) then
      //            begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_EFETUANDO_LANC_CAIXA;
                    Application.ProcessMessages;

                    dmMProvider.cdsItemCaixaLoja.Close;
                    dmMProvider.cdsItemCaixaLoja.ProviderName := 'dspItemCaixaLoja';

                    dmDBEXMaster.fdqItemCaixaLoja.SQL.Clear;
                    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('select * from item_caixa_loja');
                    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where caixa_loja = ' + IntToStr(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value));

                    dmMProvider.cdsItemCaixaLoja.Open;
                    dmMProvider.cdsItemCaixaLoja.ProviderName := '';
                    dmMProvider.cdsItemCaixaLoja.Last;

                    dmMSProcedure.fdspItem_caixa_loja.Params[0].Value   :=  dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value;
                    if  Length(Trim(dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value)) > 0 then
                      dmMSProcedure.fdspItem_caixa_loja.Params[1].Value :=  dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value
                    else
                      dmMSProcedure.fdspItem_caixa_loja.Params[1].Value :=  'CONSUMIDOR FINAL';

                    dmMSProcedure.fdspItem_caixa_loja.Params[2].Value   :=  'P' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                    dmMSProcedure.fdspItem_caixa_loja.Params[3].Value   :=  Date;
                    dmMSProcedure.fdspItem_caixa_loja.Params[4].Value   :=  dmMProvider.cdsFormasPagamentoTIPO.Value;
                    dmMSProcedure.fdspItem_caixa_loja.Params[5].Value   :=  dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value;
                    dmMSProcedure.fdspItem_caixa_loja.Params[6].Value   :=  'C';
                    dmMSProcedure.fdspItem_caixa_loja.Params[7].Value   :=  dmMProvider.cdsItemCaixaLojaSALDO.Value;
                    dmMSProcedure.fdspItem_caixa_loja.Params[8].Value   :=  'LANCAMENTO EFETUADO POR VENDA';
                    dmMSProcedure.fdspItem_caixa_loja.Params[9].Value   :=  '';
                    dmMSProcedure.fdspItem_caixa_loja.Params[10].Value  :=  null;
                    dmMSProcedure.fdspItem_caixa_loja.Params[11].Value  :=  null;
                    dmMSProcedure.fdspItem_caixa_loja.ExecProc;

                    dmDBEXMaster.fdcMaster.Commit;

      //            end;

                  dmMProvider.cdsFinalizadoraPedZeus.Next;

                end;

                if not dmMProvider.cdsPedidoZeus.IsEmpty then
                begin

                  {if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1 then
                  begin

      //              if FileExists(ExtractFilePath(Application.ExeName)+'epr.exe') then
      //              begin

                      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
                      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemPedZeus;

                      LimparMsgErro;

                      sOrcamento_Controle := '';

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamentoPV',true);
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
                        dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value);
                        dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOME_CIDADE.Value);
                        dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);

                        if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 0 then
                          sOrcamento_Controle := 'OR�AMENTO:'
                        else
                          sOrcamento_Controle := 'CONTROLE:';

                        dmRelatorios.rvpGenesisAC.SetParam('pOrcamento_Controle',sOrcamento_Controle);

                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;

                      end
                      else
                      begin

                        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        Application.ProcessMessages;

                      end;

      //              end;

                  end;}

                end;

                AbrirTabelaPedido(0);
                FecharTabelas;
                LimparMsgErro;

              end;

            end;

          end;
        1:begin //utiliza nfce

            ACBrNFe1.DANFE.NFeCancelada   := False;

            //verifica se a tabela depedido n�o est� vazia
            if not dmMProvider.cdsPedidoZeus.IsEmpty then
            begin

              //verifica se o pedido n�o est� confirmado
              if dmMProvider.cdsPedidoZeusSITUACAO.Value = 1 then
              begin

                if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value = 0 then
                begin

                  if dmMProvider.cdsFretePedidoVendaTIPO_PAGAMENTO.Value > 0 then
                  begin

                    if dmMProvider.cdsPedidoZeusCLIENTE.Value > 0 then
                    begin

                      frmFreteCaixa := TfrmFreteCaixa.Create(self);

                      if frmFreteCaixa.ShowModal = mrOk then
                      begin

                        dmMSProcedure.fdspCre.Params[0].Value       := 0;
                        dmMSProcedure.fdspCre.Params[1].Value       := -1;
                        dmMSProcedure.fdspCre.Params[2].Value       := dmDBEXMaster.iIdFilial;
                        dmMSProcedure.fdspCre.Params[3].Value       := 'FRT' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-1';
                        dmMSProcedure.fdspCre.Params[4].Value       := 0;
                        dmMSProcedure.fdspCre.Params[5].Value       := Date;
                        dmMSProcedure.fdspCre.Params[6].Value       := dmMProvider.cdsPedidoZeusCLIENTE.Value;
                        dmMSProcedure.fdspCre.Params[7].Value       := 0;
                        dmMSProcedure.fdspCre.Params[8].Value       := dmMProvider.cdsPedidoZeusEMISSAO.Value;
                        dmMSProcedure.fdspCre.Params[9].Value       := dmMProvider.cdsFretePedidoVendaVENCIMENTO.Value;
                        dmMSProcedure.fdspCre.Params[10].Value      := 0;
                        dmMSProcedure.fdspCre.Params[11].Value      := dmMProvider.cdsFretePedidoVendaVALOR.Value;
                        //calcular mora
                        dmMSProcedure.fdspCre.Params[12].Value      := (dmMProvider.cdsFretePedidoVendaVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100 ;
                        dmMSProcedure.fdspCre.Params[13].Value      := 0;
                        dmMSProcedure.fdspCre.Params[14].Value      := null;
                        dmMSProcedure.fdspCre.Params[15].Value      := 'LANCAMENTO REFER FRETE PED N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                        dmMSProcedure.fdspCre.Params[16].Value      := 0;
                        dmMSProcedure.fdspCre.Params[17].Value      := 0;
                        dmMSProcedure.fdspCre.Params[18].Value      := 0;
                        dmMSProcedure.fdspCre.Params[19].Value      := 0;
                        dmMSProcedure.fdspCre.Params[20].Value      := dmMProvider.cdsFretePedidoVendaPLANO_CONTAS.Value;
                        dmMSProcedure.fdspCre.Params[21].Value      := dmMProvider.cdsFretePedidoVendaITEM_PLANO_CONTAS.Value;
                        dmMSProcedure.fdspCre.Params[22].Value      := dmMProvider.cdsFretePedidoVendaTIPO_LANCAMENTO.Value;
                        dmMSProcedure.fdspCre.Params[23].Value      := 0;
                        dmMSProcedure.fdspCre.Params[24].Value      := null;
                        dmMSProcedure.fdspCre.Params[25].Value      := '11';
                        dmMSProcedure.fdspCre.Params[26].Value      := 0;
                        dmMSProcedure.fdspCre.Params[27].Value      := null;
                        dmMSProcedure.fdspCre.Params[28].Value      := null;
                        dmMSProcedure.fdspCre.Params[29].Value      := 0;
                        dmMSProcedure.fdspCre.Params[30].Value      := 0;
                        dmMSProcedure.fdspCre.Params[31].Value      := 0;
                        dmMSProcedure.fdspCre.Params[32].Value      := null;
                        dmMSProcedure.fdspCre.Params[33].Value      := '';
                        dmMSProcedure.fdspCre.Params[34].Value      := 0;
                        dmMSProcedure.fdspCre.Params[35].Value      := 0;
                        dmMSProcedure.fdspCre.Params[36].Value      := 0;
                        dmMSProcedure.fdspCre.ExecProc;

                        Imprimir_Parcelas_Frete;

                      end
                      else
                      begin

                        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_NAO_REALIZADA;
                        Application.ProcessMessages;
                        exit;

                      end;

                    end
                    else
                    begin

                      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', necess�rio informar o Cliente!';
                      Application.ProcessMessages;
                      exit;

                    end;

                    FreeAndNil(frmFreteCaixa);

                  end;

                  if dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 10 then
                  begin

                    frmFormaPgamentoCRE := TfrmFormaPgamentoCRE.Create(self);
                    if frmFormaPgamentoCRE.ShowModal = mrOk then
                    begin

                      dmMProvider.cdsParcelasCRE_TEMP_CX.First;

                      while not dmMProvider.cdsParcelasCRE_TEMP_CX.Eof do
                      begin

                        dmMSProcedure.fdspCre.Params[0].Value       := 0;
                        dmMSProcedure.fdspCre.Params[1].Value       := -1;
                        dmMSProcedure.fdspCre.Params[2].Value       := dmDBEXMaster.iIdFilial;
                        dmMSProcedure.fdspCre.Params[3].Value       := 'PV' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-' + InttoStr(dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value) + '/' + IntToStr(dmMProvider.cdsParcelasCRE_TEMP_CX.RecordCount);
                        dmMSProcedure.fdspCre.Params[4].Value       := 0;
                        dmMSProcedure.fdspCre.Params[5].Value       := Date;
                        dmMSProcedure.fdspCre.Params[6].Value       := dmMProvider.cdsPedidoZeusCLIENTE.Value;
                        dmMSProcedure.fdspCre.Params[7].Value       := 0;
                        dmMSProcedure.fdspCre.Params[8].Value       := dmMProvider.cdsPedidoZeusEMISSAO.Value;
                        dmMSProcedure.fdspCre.Params[9].Value       := dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value;
                        dmMSProcedure.fdspCre.Params[10].Value      := 0;
                        dmMSProcedure.fdspCre.Params[11].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value;
                        //calcular mora
                        dmMSProcedure.fdspCre.Params[12].Value      := (dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100 ;
                        dmMSProcedure.fdspCre.Params[13].Value      := 0;
                        dmMSProcedure.fdspCre.Params[14].Value      := null;
                        dmMSProcedure.fdspCre.Params[15].Value      := 'LANCAMENTO EFTUADO PELO CX. PED N� ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                        dmMSProcedure.fdspCre.Params[16].Value      := 0;
                        dmMSProcedure.fdspCre.Params[17].Value      := 0;
                        dmMSProcedure.fdspCre.Params[18].Value      := 0;
                        dmMSProcedure.fdspCre.Params[19].Value      := 0;
                        dmMSProcedure.fdspCre.Params[20].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXPLANO_CONTA.Value;
                        dmMSProcedure.fdspCre.Params[21].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXITEM_PLANO_CONTA.Value;
                        dmMSProcedure.fdspCre.Params[22].Value      := dmMProvider.cdsParcelasCRE_TEMP_CXLANCAMENTO.Value;
                        dmMSProcedure.fdspCre.Params[23].Value      := 0;
                        dmMSProcedure.fdspCre.Params[24].Value      := null;
                        dmMSProcedure.fdspCre.Params[25].Value      := '11';
                        dmMSProcedure.fdspCre.Params[26].Value      := 0;
                        dmMSProcedure.fdspCre.Params[27].Value      := null;
                        dmMSProcedure.fdspCre.Params[28].Value      := null;
                        dmMSProcedure.fdspCre.Params[29].Value      := 0;
                        dmMSProcedure.fdspCre.Params[30].Value      := 0;
                        dmMSProcedure.fdspCre.Params[31].Value      := 0;
                        dmMSProcedure.fdspCre.Params[32].Value      := null;
                        dmMSProcedure.fdspCre.Params[33].Value      := '';
                        dmMSProcedure.fdspCre.Params[34].Value      := 0;
                        dmMSProcedure.fdspCre.Params[35].Value      := 0;
                        dmMSProcedure.fdspCre.Params[36].Value      := 0;

  //                      dmMSProcedure.fdspCre.ExecProc;

                        dmMProvider.cdsParcelasCRE_TEMP_CX.Next;

                      end;

                      dmMProvider.cdsParcelasCRE_TEMP_CX.First;
  //                    Imprimir_Parcelas_CRE;

                    end
                    else
                    begin

                      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPERACAO_NAO_REALIZADA;
                      Application.ProcessMessages;
                      exit;

                    end;

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
      //              dmMZeus.cdsIntItemPedidoZeususuario.Value                       := dmMProvider.cdsPedidoZeusUSUARIO.Value;
      //              dmMZeus.cdsIntItemPedidoZeusdata_cadastro.AsDateTime            := dmMProvider.cdsItemPedZeusDATA_CADASTRO.AsDateTime;
      //              dmMZeus.cdsIntItemPedidoZeusdata_ultima_alteracao.AsDateTime    := dmMProvider.cdsItemPedZeusDATA_ALTERACAO.AsDateTime;
                    dmMZeus.cdsIntItemPedidoZeusquantidade.Value                    := dmMProvider.cdsItemPedZeusQUANTIDADE.Value;
                    dmMZeus.cdsIntItemPedidoZeuscod_departamento.Value              := dmMProvider.cdsItemPedZeusGRUPO.Value;

                    dmMZeus.cdsIntItemPedidoZeuspreco_unitario.Value                := dmMProvider.cdsItemPedZeusVALOR_UNITARIO.Value;
                    dmMZeus.cdsIntItemPedidoZeusvalor_desconto.Value                := dmMProvider.cdsItemPedZeusVALOR_DESCONTO.Value;
                    dmMZeus.cdsIntItemPedidoZeusvalor_acrescimo.Value               := dmMProvider.cdsItemPedZeusVALOR_ACRESCIMO.Value;
                    dmMZeus.cdsIntItemPedidoZeusgarantia_fabricante.Value           := 0;
                    dmMZeus.cdsIntItemPedidoZeussituacao.Value                      := '0';
                    dmMZeus.cdsIntItemPedidoZeusflags.Value                         := 1;
                    dmMZeus.cdsIntItemPedidoZeusentrega.Value                       := '0';
                    dmMZeus.cdsIntItemPedidoZeusencomenda.Value                     := '0';
      //              dmMZeus.cdsIntItemPedidoZeusdata_entrega_prod.AsDateTime        := dmMProvider.cdsPedidoZeusDATA_ENTREGA.AsDateTime;
      //              dmMZeus.cdsIntItemPedidoZeuscod_local.Value                     := dmMProvider.cdsItemPedZeusFILIAL.Value;
      //              dmMZeus.cdsIntItemPedidoZeussituacao.Value                      := IntToStr(dmMProvider.cdsPedidoZeusSITUACAO.Value);
        //            dmMZeus.cdsIntItemPedidoZeusdocumento_registro.Value            := 0;
                    dmMZeus.cdsIntItemPedidoZeusitem_ja_conferido.Value             := '0';

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

                end;

                //ATUALIZAR SALDO DE PRODUTOS

                if Atualializar_saldo_Produto(7, 0 ,0) then
                begin

                  dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                  dmMSProcedure.fdspMaster.Prepare;

                  dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PEDIDO_VENDA_ZEUS SET SITUACAO = 2 WHERE PEDIDO = ' + (IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.cdsPedidoZeus.Edit;
                  dmMProvider.cdsPedidoZeusSITUACAO.Value := 2;
                  dmMProvider.cdsPedidoZeus.Post;

                end;

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PEDIDO_GRAVADO + ', pedido: ' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                Application.ProcessMessages;

                dmMProvider.cdsFinalizadoraPedZeus.First;

                while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
                begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where FORMAPAGAMENTO = ' + IntToStr(dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value));

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

      //            if (dmMProvider.cdsFormasPagamentoTIPO.Value = 2) or (dmMProvider.cdsFormasPagamentoTIPO.Value = 7) then
      //            begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_EFETUANDO_LANC_CAIXA;
                    Application.ProcessMessages;

                    dmMProvider.cdsItemCaixaLoja.Close;
                    dmMProvider.cdsItemCaixaLoja.ProviderName := 'dspItemCaixaLoja';

                    dmDBEXMaster.fdqItemCaixaLoja.SQL.Clear;
                    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('select * from item_caixa_loja');
                    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where caixa_loja = ' + IntToStr(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value));

                    dmMProvider.cdsItemCaixaLoja.Open;
                    dmMProvider.cdsItemCaixaLoja.ProviderName := '';
                    dmMProvider.cdsItemCaixaLoja.Last;

                    dmMSProcedure.fdspItem_caixa_loja.Params[0].Value   :=  dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value;
                    if  Length(Trim(dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value)) > 0 then
                      dmMSProcedure.fdspItem_caixa_loja.Params[1].Value :=  dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value
                    else
                      dmMSProcedure.fdspItem_caixa_loja.Params[1].Value :=  'CONSUMIDOR FINAL';

                    dmMSProcedure.fdspItem_caixa_loja.Params[2].Value   :=  'P' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value);
                    dmMSProcedure.fdspItem_caixa_loja.Params[3].Value   :=  Date;
                    dmMSProcedure.fdspItem_caixa_loja.Params[4].Value   :=  dmMProvider.cdsFormasPagamentoTIPO.Value;
                    dmMSProcedure.fdspItem_caixa_loja.Params[5].Value   :=  dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value;
                    dmMSProcedure.fdspItem_caixa_loja.Params[6].Value   :=  'C';
                    dmMSProcedure.fdspItem_caixa_loja.Params[7].Value   :=  dmMProvider.cdsItemCaixaLojaSALDO.Value;
                    dmMSProcedure.fdspItem_caixa_loja.Params[8].Value   :=  'LANCAMENTO EFETUADO POR VENDA';
                    dmMSProcedure.fdspItem_caixa_loja.Params[9].Value   :=  '';
                    dmMSProcedure.fdspItem_caixa_loja.Params[10].Value  :=  null;
                    dmMSProcedure.fdspItem_caixa_loja.Params[11].Value  :=  null;
                    dmMSProcedure.fdspItem_caixa_loja.ExecProc;

                    dmDBEXMaster.fdcMaster.Commit;

      //            end;

                  dmMProvider.cdsFinalizadoraPedZeus.Next;

                end;

                if not dmMProvider.cdsPedidoZeus.IsEmpty then
                begin

                  {if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 1 then
                  begin

      //              if FileExists(ExtractFilePath(Application.ExeName)+'epr.exe') then
      //              begin

                      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
                      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemPedZeus;

                      LimparMsgErro;

                      sOrcamento_Controle := '';

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptOrcamentoPV',true);
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
                        dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value);
                        dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOME_CIDADE.Value);
                        dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);

                        if dmMProvider.cdsPedidoZeusPEDIDO_ORCAMENTO.Value = 0 then
                          sOrcamento_Controle := 'OR�AMENTO:'
                        else
                          sOrcamento_Controle := 'CONTROLE:';

                        dmRelatorios.rvpGenesisAC.SetParam('pOrcamento_Controle',sOrcamento_Controle);

                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;

                      end
                      else
                      begin

                        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        Application.ProcessMessages;

                      end;

      //              end;

                  end;}

                end;

                AbrirTabelaPedido(0);
                FecharTabelas;
                LimparMsgErro;

              end;

            end;

          end;

      end;

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

    except
      on E: exception do
      begin

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
        Application.ProcessMessages;

      end;

    end;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLR_REC_VLR_PED;
    Application.ProcessMessages;

  end;


end;

function TfrmMonitorPedido.Atualializar_saldo_Produto(pOpcao, pOperacao ,pLocal_movimento: smallint): Boolean;
begin

  try

//    if not dmDBEXMaster.fdcMaster.InTransaction then
    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspAtualizarSaldoProduto.Params[0].Value   := 7;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[1].Value   := pLocal_movimento;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[2].Value   := pOperacao;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[3].Value   := dmMProvider.cdsPedidoZeusPEDIDO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[4].Value   := '';
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[5].Value   := 0;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[6].Value   := 0;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[7].Value   := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[8].Value   := '';
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[9].Value   := Date;
    dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

    Result := true;

//    if dmDBEXMaster.fdcMaster.InTransaction then
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
      Result :=  False;

    end;

  end;


end;

procedure TfrmMonitorPedido.cboFormaPagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

function TfrmMonitorPedido.ConsisteCliente_FPG_Prazo: boolean;
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

function TfrmMonitorPedido.ConsisteValorPedidoValorRecebido: boolean;
begin

  Result := dmMProvider.cdsFinalizadoraPedZeusTOTAL_RECEBIDO.Value >= dmMProvider.cdsPedidoZeusVALOR_DO_PEDIDO.Value;

end;

procedure TfrmMonitorPedido.edtValorFinalizEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmMonitorPedido.edtValorFinalizExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if not ConsisteCliente_FPG_Prazo then
  begin

    lblMsg.Caption              := dmDBEXMaster.sNomeUsuario + MSG_CLIENTE_APRAZO_OBRIGATORIO;
    Application.ProcessMessages;

    cboFormaPagamento.KeyValue  := -1;

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

procedure TfrmMonitorPedido.edtValorFinalizKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmMonitorPedido.FecharTabelas;
begin

  dmMProvider.cdsItemPedZeus.Close;
  dmMProvider.cdsFinalizadoraPedZeus.Close;
  dmMProvider.cdsEndEntregaPedZeus.Close;
  dmMZeus.fdcZeusRetail.Close;

end;

procedure TfrmMonitorPedido.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(handle);
  Color := COR_PADRAO_TELAS;

  for i := 0 to grdPedidos.Columns.Count - 1 do
    grdPedidos.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdFormasPagamento.Columns.Count - 1 do
    grdFormasPagamento.Columns[i].Title.Color := COR_TITULO_GRADE;

  AbrirTabelaPedido(0);

  dmMProvider.cdsFormasPagamento.Close;
  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where tipooperacao = 1');
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('and codigoecf <> 00');
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('order by nome');

  dmMProvider.cdsFormasPagamento.Open;
  dmMProvider.cdsFormasPagamento.ProviderName := '';

  ConfigurarCertificadoNFE(ACBrNFe1, True);

end;

procedure TfrmMonitorPedido.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin


  case key of
    VK_F7:begin

            //verifica finaliza��o cartao
            if not Validar_Cartao_Credito then
              exit;

            lblMsg.Tag      := ord(ConfirmarLancPedidoRT);
            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO;
            Application.ProcessMessages;

          end;
  end;

end;

procedure TfrmMonitorPedido.FormKeyPress(Sender: TObject; var Key: Char);
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
    else if (UpperCase(key) = 'S') and (lblMsg.Tag = ord(ConfirmarLancPedidoRT)) then
    begin

      Key         := #0;
      lblMsg.Tag  := 0;
      actConfirmarLanRTExecute(self);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(EnviarNFCE)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actIntegracaoPedidoZeusExecute(self);

    end
    else if (UpperCase(Key) = 'N') and (lblMsg.Tag <> ord(nulo)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      LimparMsgErro;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmMonitorPedido.GerarEnviarNFCe(pOpcao: smallint);
var
 vAux, vNumLote, vSincrono : String;
 Sincrono : boolean;
begin

  try

    if not dmDBEXMaster.fdcMaster.InTransaction then
      dmDBEXMaster.fdtMaster.StartTransaction;

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
    Application.ProcessMessages;

    ACBrNFe1.NotasFiscais.Clear;

  except

  end;

end;

procedure TfrmMonitorPedido.grdFormasPagamentoDblClick(Sender: TObject);
begin

  if not  dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
  begin

    cboFormaPagamento.KeyValue  := dmMProvider.cdsFinalizadoraPedZeusFORMA_PAGAMENTO.Value;
    edtValorFinaliz.Text        := FormatFloat('#,##0.00',dmMProvider.cdsFinalizadoraPedZeusVALOR_FINALIZADO.Value);
    edtValorFinaliz.SetFocus;

  end;

end;

procedure TfrmMonitorPedido.grdFormasPagamentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsFinalizadoraPedZeus.IsEmpty then
  begin

    if not odd(dmMProvider.cdsFinalizadoraPedZeus.RecNo) then
    begin

      grdFormasPagamento.Canvas.Font.Color   := clBlack;
      grdFormasPagamento.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdFormasPagamento.Canvas.Font.Color   := clBlack;
      grdFormasPagamento.Canvas.Brush.Color  := clWhite;

    end;

    grdFormasPagamento.Canvas.FillRect(Rect);
    grdFormasPagamento.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmMonitorPedido.grdFormasPagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TfrmMonitorPedido.grdPedidosDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    AbrirTabelaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value);

    RelacionarItemsPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarEndEntregaPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value, dmDBEXMaster.iIdFilial);
    RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,  dmDBEXMaster.iIdFilial);
    RelacionarFretePedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,  dmDBEXMaster.iIdFilial);

  end;

end;

procedure TfrmMonitorPedido.grdPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsPedidoZeus.IsEmpty then
  begin

    if not odd(dmMProvider.cdsPedidoZeus.RecNo) then
    begin

      grdPedidos.Canvas.Font.Color   := clBlack;
      grdPedidos.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdPedidos.Canvas.Font.Color   := clBlack;
      grdPedidos.Canvas.Brush.Color  := clWhite;

    end;

    grdPedidos.Canvas.FillRect(Rect);
    grdPedidos.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmMonitorPedido.grdPedidosKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdPedidosDblClick(self);

end;

procedure TfrmMonitorPedido.imgAtualizarClick(Sender: TObject);
begin

  AbrirTabelaPedido(0);

end;

procedure TfrmMonitorPedido.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmMonitorPedido.imgConfirmarClick(Sender: TObject);
begin

  case dmMProvider.cdsFilialUTILIZA_NFCE.Value of
    0:begin// n�o uliza nfce

        lblMsg.Tag      := ord(ConfirmarLancPedidoZEUS);
        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO;
        Application.ProcessMessages;

      end;
    1:begin

        ACBrNFe1.DANFE.NFeCancelada   := False;

        LimparMSG_ERRO(lblMsg, nil);

        if not dmMProvider.cdsItemPedZeus.IsEmpty then
        begin

          lblMsg.Tag      := ord(EnviarNFCE);
          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_ENVIAR_NFCE;
          Application.ProcessMessages;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_NECESSARIO_SELECIONAR_NF;
          Application.ProcessMessages;

        end;

      end;

  end;

end;

procedure TfrmMonitorPedido.Imprimir_Parcelas_CRE;
var
  i:integer;
begin

  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Financeiros.rav') then
  begin

    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Financeiros.rav';
    dmRelatorios.rvpGenesisAC.SelectReport('rptParcelasCRE_CX',true);
    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
    dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

    if dmMProvider.cdsFilialNUMERO.Value > 0 then
      dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
    else
      dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

    dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);

    dmRelatorios.rvpGenesisAC.SetParam('pENDERECO_SACADO',dmMProvider.cdsClientesENDERECOCOBRANCA.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pBAIRRO_SACADO',dmMProvider.cdsClientesBAIRROCOBRANCA.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pCIDADE_SACADO',dmMProvider.cdsClientesNOME_CIDADE.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pUF_SACADO',dmMProvider.cdsClientesESTADOCOBRANCA.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pCEP_SACADO',dmMProvider.cdsClientesCEPCOBRANCA.Value);
    if dmMProvider.cdsClientesNUMEROCOBRANCA.Value > 0 then
      dmRelatorios.rvpGenesisAC.SetParam('pNum_Sacado',IntToStr(dmMProvider.cdsClientesNUMEROCOBRANCA.Value))
    else
    dmRelatorios.rvpGenesisAC.SetParam('pNum_Sacado','S/N');

    dmRelatorios.rvpGenesisAC.SetParam('pmORA_Endereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

    dmRelatorios.rvpGenesisAC.Execute;
    dmRelatorios.rvpGenesisAC.Close;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Financeiros.rav';
    Application.ProcessMessages;

  end;
end;

procedure TfrmMonitorPedido.Imprimir_Parcelas_Frete;
var
  i:integer;
begin

  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Financeiros.rav') then
  begin

    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Financeiros.rav';
    dmRelatorios.rvpGenesisAC.SelectReport('rptComprovanteFrete',true);
    dmRelatorios.rvpGenesisAC.SetParam('pNUM_FRETE','FRT' + IntToStr(dmMProvider.cdsFretePedidoVendaPEDIDO.Value) + '-1');
    ACBrExtenso1.Valor := dmMProvider.cdsFretePedidoVendaVALOR.Value;
    dmRelatorios.rvpGenesisAC.SetParam('pVALOR_EXTENSO', ACBrExtenso1.Texto);
    dmRelatorios.rvpGenesisAC.SetParam('pVENCIMENTO', Trim(dmMProvider.cdsFilialNOMECIDADE.Value) +', ' + FormatDateTime('dddddd',dmMProvider.cdsFretePedidoVendaVENCIMENTO.Value));

    dmRelatorios.rvpGenesisAC.Execute;
    dmRelatorios.rvpGenesisAC.Close;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Financeiros.rav';
    Application.ProcessMessages;

  end;

end;

procedure TfrmMonitorPedido.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

function TfrmMonitorPedido.Man_Tab_finalizadorasPedido(
  pOpcao: smallint): boolean;
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

      RelacionarFinalizadoraPedido(dmMProvider.cdsPedidoZeusPEDIDO.Value,dmDBEXMaster.iIdFilial);

      Result := True;

//      if dmDBEXMaster.fdcMaster.InTransaction then
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Commit;

    except
      on E: exception do
      begin

//        if dmDBEXMaster.fdcMaster.InTransaction then
        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
        dmDBEXMaster.fdcMaster.Rollback;
        Result := False;;

      end;

    end;

  end
  else
    Result := dmMProvider.cdsFinalizadoraPedZeus.IsEmpty;

end;

function TfrmMonitorPedido.pesquisa_end_entrega(pLoja,
  pPedido: integer): boolean;
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

function TfrmMonitorPedido.pesquisa_Finaliz_pedido(pLoja, pPedido: integer;
  pFinaliz: string): boolean;
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

function TfrmMonitorPedido.pesquisa_item_pedido_zeus(pLoja, pPedido,
  pItemPedido: integer): boolean;
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

function TfrmMonitorPedido.pesquisa_pedido_zeus(pLoja,
  pPedido: integer): boolean;
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

procedure TfrmMonitorPedido.RelacionarEndEntregaPedido(pPedido,
  pFilial: integer);
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

procedure TfrmMonitorPedido.RelacionarFinalizadoraPedido(pPedido,
  pFilial: integer);
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

procedure TfrmMonitorPedido.RelacionarFretePedido(pPedido, pFilial: integer);
begin

  dmMProvider.cdsFretePedidoVenda.Close;
  dmMProvider.cdsFretePedidoVenda.ProviderName := 'dspFretePedidoVenda';

  dmDBEXMaster.fdqFretePedidoVenda.SQL.Clear;
  dmDBEXMaster.fdqFretePedidoVenda.SQL.Add('select * from frete_pedido_venda');
  dmDBEXMaster.fdqFretePedidoVenda.SQL.Add('where pedido = ' + IntToStr(pPedido));

  dmMProvider.cdsFretePedidoVenda.Open;
  dmMProvider.cdsFretePedidoVenda.ProviderName := '';

end;

procedure TfrmMonitorPedido.RelacionarItemsPedido(pPedido, pFilial: integer);
begin

  dmMProvider.cdsItemPedZeus.Close;
  dmMProvider.cdsItemPedZeus.ProviderName := 'dspItemPedZeus';

  dmDBEXMaster.fdqItemPedZeus.SQL.Clear;
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('select itemped.*, pro.descricao,pro.unidade from item_pedido_zeus itemped');
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('join produto pro');
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('on(pro.produto = itemped.produto)');

  dmDBEXMaster.fdqItemPedZeus.SQL.Add('where itemped.pedido = ' + IntToStr(pPedido));
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('and itemped.filial = '   + IntToStr(pFilial));
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('and itemped.quantidade > 0');
  dmDBEXMaster.fdqItemPedZeus.SQL.Add('and itemped.valor_unitario > 0');

  dmDBEXMaster.fdqItemPedZeus.SQL.Add('order by itemped.item_pedido');

  dmMProvider.cdsItemPedZeus. Open;
  dmMProvider.cdsItemPedZeus.ProviderName := '';

end;

procedure TfrmMonitorPedido.tmrRecarregaTimer(Sender: TObject);
begin

  if not dmMProvider.cdsFinalizadoraPedZeus.Active then
    AbrirTabelaPedido(0);

end;

function TfrmMonitorPedido.Validar_A_Prazo: boolean;
begin

  dmMProvider.cdsFinalizadoraPedZeus.First;
  dmMProvider.cdsFinalizadoraPedZeus.DisableControls;

  Result := True;

  while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
  begin

    if (dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 6) or (dmMProvider.cdsFinalizadoraPedZeusTIPO.Value = 10) then
      Result := False;

    dmMProvider.cdsFinalizadoraPedZeus.Next;

  end;

  dmMProvider.cdsFinalizadoraPedZeus.First;
  dmMProvider.cdsFinalizadoraPedZeus.EnableControls;

end;

function TfrmMonitorPedido.Validar_A_Prazo_Cheque: boolean;
begin

  dmMProvider.cdsFinalizadoraPedZeus.First;
  dmMProvider.cdsFinalizadoraPedZeus.DisableControls;

  Result := True;

  while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
  begin

    if dmMProvider.cdsFinalizadoraPedZeusTIPO.Value in [2,3,4,5,6,10] then
      Result := False;

    dmMProvider.cdsFinalizadoraPedZeus.Next;

  end;

  dmMProvider.cdsFinalizadoraPedZeus.First;
  dmMProvider.cdsFinalizadoraPedZeus.EnableControls;

end;

function TfrmMonitorPedido.Validar_Cartao_Credito: boolean;
begin

  dmMProvider.cdsFinalizadoraPedZeus.First;
  dmMProvider.cdsFinalizadoraPedZeus.DisableControls;

  Result := True;

  while not dmMProvider.cdsFinalizadoraPedZeus.Eof do
  begin

    if dmMProvider.cdsFinalizadoraPedZeusTIPO.Value in [0,1] then
      Result := False;

    dmMProvider.cdsFinalizadoraPedZeus.Next;

  end;

  dmMProvider.cdsFinalizadoraPedZeus.First;
  dmMProvider.cdsFinalizadoraPedZeus.EnableControls;

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
