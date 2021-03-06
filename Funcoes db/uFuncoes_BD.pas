unit uFuncoes_BD;

interface

uses
  System.SysUtils, System.Variants, Vcl.DBCtrls, Vcl.StdCtrls, Datasnap.DBClient,
  System.Classes, Data.DB, Vcl.Forms, ACBRNfe, ACBrDFeSSL, pcnConversaoNFe, pcnConversao,
  ACBrUtil, System.Math, ACBrCEP, Vcl.ExtCtrls;

procedure AbrirTabelaProdutos(pProduto:integer);
procedure AbrirTabelaUsuarios(pUsuario:integer);
procedure AbrirTabelaCtrl_Modulos;
function AbrirTabelaREFFornecedor(pOpcao: smallint; pConteudo: string):boolean;
function Montar_SQL_Pesquisa_RefFornecedor(pOpcao: smallint; pConteudo: string): string;
function AbrirTabelaCFOP_CFPS(pOpcao:smallint; pConteudo:string):boolean;
function Montar_SQL_Pesquisa_CFOP_CFPS(pOpcao:smallint; pConteudo:string):string;
procedure AbrirTabelas;
procedure CriarPastasAplicacao;
procedure AbrirTabelaTipoUtilidadeCtrlNotas(pIndice:smallint; pWhere:variant);
procedure AbrirTabelaSetorCtrlNotas(pIndice:smallint; pWhere:variant);
function AbrirTabelaCtrlNotas(sWhere:string):boolean;
function PesquisarFornecedor(sWhere:string):boolean;
procedure AbrirTabelaFilial(pProduto:integer);
procedure Man_Tab_Filial(pOpcao:smallint);
procedure Man_Tab_Registro_60M(pOpcao:smallint; pData:TDateTime);
procedure Man_Tab_Registro_C405(pOpcao:smallint; pData:TDateTime);
procedure Man_tab_Registro_60A(pOpcao:smallint; pData:TDateTime);
procedure Man_Tab_Registro_60D(pOpcao:smallint; pData:TDateTime);
procedure Man_Tab_Registro_C420(pOpcao: smallint);
procedure Man_Tab_CFOP(pOpcao: smallint);
procedure Man_Tab_LivroSaida(pOpcao:smallint);
procedure Man_Tab_Movimento(pOpcao:smallint; pData:TDateTime);
procedure Atualizar_Saldo_Produto(pOpcao:smallint);
procedure Man_Tab_Registro_C410(pOpcao: smallint;pBarras:string; pData:TDateTime);
procedure Man_Tab_Registro_C460(pOpcao,pSituacao: smallint; pData:TDateTime);
procedure Man_Tab_Registro_C470(pOpcao,pSituacao: smallint; pAliq:string; pData:TDateTime);
procedure Man_Tab_Registro_C490(pOpcao: smallint);
procedure Man_Tab_Registro_60I(pOpcao:smallint; pData:TDateTime);
procedure Man_Tab_Registro_60R(pOpcao:smallint; pData:TDateTime);
procedure Man_Tab_ChqRec(pOpcao:smallint);
procedure Atualizar_Saldo_Cliente(pOpcao:smallint;pCliente:integer; pValor:Currency);
procedure Man_Tab_CRE(pOpcao:smallint);
procedure Man_Tab_ArqImportado(pOpcao: smallint; pData:TDateTime);
procedure Man_Tab_Tipo_Util_Ctrl_Notas(pOpcao:smallint);
procedure Man_Tab_Setores(pOpcao:smallint);
procedure Man_Tab_CtrlNotas(pOpcao:smallint);
procedure Man_Tab_Estados(pOpcao:smallint);
procedure Man_Tab_FCP_Estados(pOpcao:SmallInt);
procedure Man_Tab_Cidades(pOpcao:smallint);
procedure Man_Tab_RefFornecedor(pOpcao:smallint);
function PesquisaAutoCompletar(pTabela, pCampo: ShorTString ; pBusca: TObject ):ShortString;
function ExportarExcel(pDataSet:TClientDataSet; pArquivo:string;pSubstArq:boolean; pOpcao:smallint):boolean;
function ExportarCtrlNotas(pArquivo:string):boolean;
procedure Relacionar_FCP;
function ValidarPermissao(pIdTela,pIdUsuario: integer; pOpValidacao: string ): boolean;
procedure Man_Tab_Parametro_NFE;
procedure Abrir_Tabela_ParamIntegracaoPDV;
procedure Man_Tab_ParametroIntegraPDV;
function ValidarNumeroCaixa(pNumeroCx: string): boolean;
procedure RelacionarTributacao_Produto;
procedure RelacionarGrupo_Produto;
procedure RelacionarNCM_CEST_Produto;
function AbrirTabelaClientes(pOpcao: smallint; pConteudo:string):boolean;
function Montar_SQL_Clientes(pOpcao: smallint; pConteudo: string): string;
function AbrirTabelaCidades(pOpcao: smallint; pConteudo, pEstado:string):boolean;
function Montar_SQL_Cidades(pOpcao: smallint; pConteudo, pEstado: string): string;
procedure Man_Tab_Sped_R0500(pOpcao:smallint);
procedure DuplicarRegistro(pCds: TClientDataSet);
function PesquisarParticipantes(pOpcao: smallint; pConteudo:string):boolean;
function Montar_SQL_Participantes(pOpcao: smallint; pConteudo: string): string;
procedure Man_Tab_Partiipantes(pOpcao:smallint);
procedure Man_Tab_Configuracoes(pOpcao:smallint);
procedure Man_Tab_Config_Financeiro(pOpcao:smallint);
procedure AbrirTabelaSped_0500(pData:TdateTime; pConta:string);
procedure Man_Tab_Config_CEP(pWSOpcao:smallint);
procedure Man_Tab_Tipo_Logradouro(pOpcao:smallint);
procedure ConfigurarCertificadoNFE(pACBRNfe: TACBrNFe; pOk:Boolean);
procedure ConfigurarBuscaCep(pACBrCEP: TACBrCEP);
function InicializarTabelas_Temp_Automacao:boolean;
function AbrirTabelaEstados(pOpcao: smallint; pConteudo: string): boolean;
procedure RelacionarUltimaNFEntrada_Participante;
procedure RelacionarUltimaNFSaida_Participante;
procedure RelacionarUltimaOrdemCompra;
function Retornar_Info_TabBarras(pProduto:integer):string;
procedure Man_Tab_LOG_SYS(pTabela_modulo,pLog, pLogErro, pImagem:string; pOperacao:integer);

var
 nor_set: integer;

implementation

uses dataDBEXMaster, dataMProvider, dataMSProcedure, uConstantes_Padrao,
  uFuncoes, dataMSource;

procedure AbrirTabelaProdutos(pProduto:integer);
begin

  dmMProvider.cdsProdutos.Close;
  dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

  dmDBEXMaster.fdqProdutos.SQL.Clear;
  dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
  dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
  dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
  dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
  dmDBEXMaster.fdqProdutos.SQL.Add('where pro.produto = ' + IntToStr(pProduto));

  dmMProvider.cdsProdutos.Open;
  dmMProvider.cdsProdutos.ProviderName := '';

end;
procedure AbrirTabelaTipoUtilidadeCtrlNotas(pIndice:smallint; pWhere:variant);
begin

  dmDBEXMaster.fdqTipoUtilCtrlNotas.Close;;
  dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Clear;

  case pIndice of
    0:begin

        dmMProvider.cdsTipoUtilCtrlNotas.Close;
        dmMProvider.cdsTipoUtilCtrlNotas.ProviderName := 'dspTipoUtilCtrlNotas';

        dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Add('select * from tipo_util_ctrl_notas');
        dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Add('order by descricao');
        dmMProvider.cdsTipoUtilCtrlNotas.Open;
        dmMProvider.cdsTipoUtilCtrlNotas.ProviderName := '';

      end;
    1:begin

        dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Add('Select max(TIPO_UTIL_CTRL_NOTAS) TIPO_UTIL_CTRL_NOTAS from TIPO_UTIL_CTRL_NOTAS');
        dmDBEXMaster.fdqTipoUtilCtrlNotas.Open;

      end;
    2:begin

        dmMProvider.cdsTipoUtilCtrlNotas.Close;
        dmMProvider.cdsTipoUtilCtrlNotas.ProviderName := 'dspTipoUtilCtrlNotas';

        dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Add('select * from tipo_util_ctrl_notas');
        dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Add(pWhere);
        dmDBEXMaster.fdqTipoUtilCtrlNotas.SQL.Add('order by descricao');

        dmMProvider.cdsTipoUtilCtrlNotas.Open;
        dmMProvider.cdsTipoUtilCtrlNotas.ProviderName := '';

      end;
  end;


end;
procedure AbrirTabelaSetorCtrlNotas(pIndice:smallint; pWhere:variant);
begin


  dmDBEXMaster.fdqSetorCtrlNotas.Close;
  dmDBEXMaster.fdqSetorCtrlNotas.SQL.Clear;

  case pIndice of
    0:begin

        dmMProvider.cdsSetorCtrlNotas.Close;
        dmMProvider.cdsSetorCtrlNotas.ProviderName := 'dspSetorCtrlNotas';

        dmDBEXMaster.fdqSetorCtrlNotas.SQL.Add('select * from SETOR_CTRL_NOTAS');
        dmDBEXMaster.fdqSetorCtrlNotas.SQL.Add('order by descricao');

        dmMProvider.cdsSetorCtrlNotas.Open;
        dmMProvider.cdsSetorCtrlNotas.ProviderName := '';

      end;
    1:begin

        dmDBEXMaster.fdqSetorCtrlNotas.SQL.Add('Select max(setor_ctrl_notas) setor_ctrl_notas from setor_ctrl_notas');
        dmDBEXMaster.fdqSetorCtrlNotas.Open;

      end;
    2:begin

        dmMProvider.cdsSetorCtrlNotas.Close;
        dmMProvider.cdsSetorCtrlNotas.ProviderName := 'dspSetorCtrlNotas';

        dmDBEXMaster.fdqSetorCtrlNotas.SQL.Add('select * from SETOR_CTRL_NOTAS');
        dmDBEXMaster.fdqSetorCtrlNotas.SQL.Add(pWhere);
        dmDBEXMaster.fdqSetorCtrlNotas.SQL.Add('order by descricao');

        dmMProvider.cdsSetorCtrlNotas.Open;
        dmMProvider.cdsSetorCtrlNotas.ProviderName := '';

      end;
  end;

end;
procedure AbrirTabelaFilial(pProduto:integer);
begin

  dmMProvider.cdsProdutoFilial.Close;
  dmMProvider.cdsProdutoFilial.ProviderName := 'dspProdutoFilial';

  dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
  dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(pProduto));

  dmMProvider.cdsProdutoFilial.Open;
  dmMProvider.cdsProdutoFilial.ProviderName := '';

end;
procedure Man_Tab_Registro_60M(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_OPCAO').Value        := pOpcao;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_SERIE_ECF').AsString := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_EMISSAO').AsDate     := pData;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_NUMERO_CAIXA').Value := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_COO_INICIAL').Value  := dmMProvider.fdmImpReg60MCOO_INICIAL.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_COO_FINAL').Value    := dmMProvider.fdmImpReg60MCOO_FINAL.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_CRZ').Value          := dmMProvider.fdmImpReg60MCRZ.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_VENDA_BRUTA').Value  := dmMProvider.fdmImpReg60MVENDA_BRUTA.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_GT_FINAL').Value     := dmMProvider.fdmImpReg60MVALOR_GT.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_CRO').Value          := dmMProvider.fdmImpReg60MCRO.Value;
    dmMSProcedure.fdspMan_Tab_Reg60M.ParamByName('IP_MODELO').Value       := dmMProvider.fdmImpReg60MMODELO_DOCUMENTO.Value;

    dmMSProcedure.fdspMan_Tab_Reg60M.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_C405(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_RC405.Params[0].Value:= pOpcao;
    dmMSProcedure.fdspMan_Tab_RC405.Params[1].Value := pData;
    dmMSProcedure.fdspMan_Tab_RC405.Params[2].Value := dmMProvider.fdmImpReg60MCRO.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[3].Value := dmMProvider.fdmImpReg60MCRZ.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[4].Value := dmMProvider.fdmImpReg60MCOO_FINAL.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[5].Value := dmMProvider.fdmImpReg60MVALOR_GT.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[6].Value := dmMProvider.fdmImpReg60MVENDA_BRUTA.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[7].Value := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
    dmMSProcedure.fdspMan_Tab_RC405.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_tab_Registro_60A(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Reg60A.ParamByName('IP_OPCAO').Value            := pOpcao;
    dmMSProcedure.fdspMan_Tab_Reg60A.ParamByName('IP_SERIE_ECF').Value        := dmMProvider.fdmImpReg60ASERIE_ECF.Value;
    dmMSProcedure.fdspMan_Tab_Reg60A.ParamByName('IP_ALIQUOTA').Value         := dmMProvider.fdmImpReg60AALIQUOTA.Value;
    dmMSProcedure.fdspMan_Tab_Reg60A.ParamByName('IP_VALOR_ACUMULADO').Value  := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
    dmMSProcedure.fdspMan_Tab_Reg60A.ParamByName('IP_EMISSAO').Value          := pData;
    dmMSProcedure.fdspMan_Tab_Reg60A.ParamByName('IP_REG60_MESTRE').Value     := dmMSProcedure.fdspMaster.ParamByName('ID_REG60M').Value;

    dmMSProcedure.fdspMan_Tab_Reg60A.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_60D(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_OPCAO').AsInteger            := pOpcao;
    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_EMISSAO').AsDate             := pData;
    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_NUMERO_SERIE').AsString      := dmMProvider.fdmImpCupomSERIE_ECF.Value;
    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_QUANTIDADE').AsCurrency      := (dmMProvider.fdmImpCupomQUANTIDADE.Value * dmMProvider.cdsBarrasQUANTIDADE.AsCurrency);
    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_VALOR_UNITARIO').AsCurrency  := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_ALIQUOTA_ICMS').Value        := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value;

    if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'F') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'I') then
      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_ALIQUOTA_ICMS').Value := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value
    else
      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_ALIQUOTA_ICMS').Value := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1];

    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_DOCUMENTO').AsString         := IntToStr(dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_ECF').AsInteger              := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;

    if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'F') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'I') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_BASE_ICMS').AsCurrency   := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_VALOR_ICMS').AsCurrency  := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value * (StrToFloat(dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value) / 100);

    end
    else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_BASE_ICMS').AsCurrency   := 0;
      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_VALOR_ICMS').AsCurrency  := 0;

    end
    else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] = 'N') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_BASE_ICMS').AsCurrency   := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
      dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_VALOR_ICMS').AsCurrency  := 0;

    end;

    dmMSProcedure.fdspMan_Tab_Reg60D.ParamByName('IP_BARRAS').Value             := dmMProvider.fdmImpCupomBARRAS.Value;

    dmMSProcedure.fdspMan_Tab_Reg60D.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_C420(pOpcao: smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value <> '' then
    begin

      dmMProvider.cdsTributacao.Close;
      dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

      dmDBEXMaster.fdqTributacao.SQL.Clear;
      dmDBEXMaster.fdqTributacao.SQL.Add('select * from aliquotas');
      dmDBEXMaster.fdqTributacao.SQL.Add('where codigo_totalizador = ' + dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value);

      if dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value <> '' then
      begin

        dmMProvider.cdsTributacao.Open;
        dmMProvider.cdsTributacao.ProviderName := '';

      end;

      dmMSProcedure.fdspMan_Tab_RC420.Params[0].Value     := pOpcao;
      dmMSProcedure.fdspMan_Tab_RC420.Params[1].Value     := dmMProvider.fdmImpCupomEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC420.Params[2].Value     := dmMProvider.fdmImpCupomEMISSAO.Value;

      if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'CANC' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'Can-T';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'DESC' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'DT';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'F' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'F1';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'I' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'I1';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'N' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'N1';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value  + 'T' + dmMProvider.fdmImpReg60AALIQUOTA.Value;
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := StrToInt(dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value);
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := dmMProvider.cdsTributacaoOBSERVACAO.AsString;

      end;

      dmMSProcedure.fdspMan_Tab_RC420.Params[7].Value     := dmMProvider.fdmImpReg60ASERIE_ECF.Value;
      dmMSProcedure.fdspMan_Tab_RC420.Params[4].Value     := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;

      if (dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value > 0) or (pOpcao =1) then
        dmMSProcedure.fdspMan_Tab_RC420.ExecProc;

    end
    else
    begin

      dmMSProcedure.fdspMan_Tab_RC420.Params[0].Value     := pOpcao;
      dmMSProcedure.fdspMan_Tab_RC420.Params[1].Value     := dmMProvider.fdmImpCupomEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC420.Params[2].Value     := dmMProvider.fdmImpCupomEMISSAO.Value;

      if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'CANC' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'Can-T';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'DESC' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'DT';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'F' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'F1';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'I' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'I1';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'N' then
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := 'N1';
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := '';

      end
      else
      begin

        dmMSProcedure.fdspMan_Tab_RC420.Params[3].Value   := dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value  + 'T' + dmMProvider.fdmImpReg60AALIQUOTA.Value;
        dmMSProcedure.fdspMan_Tab_RC420.Params[5].Value   := StrToInt(dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value);
        dmMSProcedure.fdspMan_Tab_RC420.Params[6].Value   := dmMProvider.cdsTributacaoOBSERVACAO.AsString;

      end;

      dmMSProcedure.fdspMan_Tab_RC420.Params[7].Value     := dmMProvider.fdmImpReg60ASERIE_ECF.Value;
      dmMSProcedure.fdspMan_Tab_RC420.Params[4].Value     := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;

      if (dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value > 0) or (pOpcao =1) then
        dmMSProcedure.fdspMan_Tab_RC420.ExecProc;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_LivroSaida(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspLivroSaida.ParamByName('IP_OPCAO').value                  := pOpcao;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_LIVRO_SAIDA').value            := -1;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_FILIAL').value                 := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_MES_ANO').value                := FormatDateTime('mmyyyy', dmMProvider.fdmImpReg60ADATA_EMISSAO.Value);
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_TIPO_ESPECIE_DOCUMENTO').value := 'CF';
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_SERIE_SUBSERIE').value         := dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_NUMERO_DOCUMENTO').value       := IntToStr(dmMProvider.fdmImpReg60ACRZ.Value);
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_DATA_DOCUMENTO').value         := dmMProvider.fdmImpReg60ADATA_EMISSAO.Value;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_UF_DESTINATARIO').value        := 'ES';
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_TOTALIZADOR_GERAL').value      := dmMProvider.fdmImpReg60AGT.Value;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_CRZ').value                    := dmMProvider.fdmImpReg60ACRZ.Value;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_IDENTIFICACAO_ICMS_IPI').value := 0;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_OBSERVACAO').value             := null;

    if dmMProvider.fdmImpReg60AALIQUOTA.Value = 'F' then
    begin

      dmMSProcedure.fdspLivroSaida.ParamByName('IP_CODIGO_CONTABIL').value        := 2;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_CFOP').Value                   := '5405';
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_BASE_CALCULO').value           := 0;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_VALOR_CONTABIL').value         := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_ALIQUOTA').value               := 0;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_IMPOSTO_DEBITADO').value       := 0;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_ISENTAS_NAO_TRIBUTADAS').value := 0;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_OUTRAS').value                 := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
      dmMSProcedure.fdspLivroSaida.ExecProc;

    end
    else
    begin

      dmMSProcedure.fdspLivroSaida.ParamByName('IP_CODIGO_CONTABIL').value  := 1;
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_CFOP').Value             := '5102';
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_OUTRAS').value           := 0;

      if (dmMProvider.fdmImpReg60AALIQUOTA.Value = 'I') or (dmMProvider.fdmImpReg60AALIQUOTA.Value = 'N') then
      begin

        dmMSProcedure.fdspLivroSaida.ParamByName('IP_VALOR_CONTABIL').value         := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_BASE_CALCULO').value           := 0;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_ALIQUOTA').value               := 0;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_IMPOSTO_DEBITADO').value       := 0;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_ISENTAS_NAO_TRIBUTADAS').value := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
        dmMSProcedure.fdspLivroSaida.ExecProc;

      end
      else if (dmMProvider.fdmImpReg60AALIQUOTA.Value <> 'CANC') and (dmMProvider.fdmImpReg60AALIQUOTA.Value <> 'DESC') then
      begin

        dmMSProcedure.fdspLivroSaida.ParamByName('IP_VALOR_CONTABIL').value         := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_BASE_CALCULO').value           := dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_ALIQUOTA').value               := StrToFloat(dmMProvider.fdmImpReg60AALIQUOTA.Value) / 100;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_IMPOSTO_DEBITADO').value       := Trunc(dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value * (dmMSProcedure.fdspLivroSaida.ParamByName('IP_ALIQUOTA').value / 100) * 100) / 100;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_ISENTAS_NAO_TRIBUTADAS').value := 0;
        dmMSProcedure.fdspLivroSaida.ExecProc;

      end;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Movimento(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').AsInteger           := pOpcao;
    dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').AsInteger        := 0;
    dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO').AsInteger  := 2;
    dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').AsDate               := pData;
    dmMSProcedure.fdspMovimento.ParamByName('IP_HORA').AsTime               := dmMProvider.fdmImpCupomHORA_ABERTURA.Value;
    dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').AsInteger          := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').AsString        := FormatFloat('000000', dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
    dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO').AsInteger  := Ord(tdCUPOM);
    dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').AsInteger             := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
    dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL').AsInteger        := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
    dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE').Value             := null;
    dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO').Value     := null;
    dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA').Value       := null;
    dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE').AsCurrency     := (dmMProvider.fdmImpCupomQUANTIDADE.Value * dmMProvider.cdsBarrasQUANTIDADE.AsCurrency);
    dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO').AsCurrency := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
    dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS').AsString           := dmMProvider.cdsBarrasBARRAS.AsString;
    dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL').AsCurrency       := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
    dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR').Value          := -1;
    dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM').Value       := dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
    dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM').Value      := 0;

    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.AsInteger = 1 then
      dmMSProcedure.fdspMovimento.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Atualizar_Saldo_Produto(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_OPCAO').Value                   := pOpcao;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_OPERACAO').Value                := 0;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_NOTA_FISCAL').Value             := null;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_BARRAS').Value                  := dmMProvider.cdsBarrasBARRAS.AsString;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_QUANTIDADE').Value              := (dmMProvider.fdmImpCupomQUANTIDADE.Value * dmMProvider.cdsBarrasQUANTIDADE.Value);
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_LOCAL_MOVIMENTO').Value         := 0;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_PRODUTO').Value                 := 0;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_FILIAL').Value                  := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_MODELO').AsString               := '2D';
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_DATA').Value                    := dmMProvider.fdmImpCupomEMISSAO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_ATUALIZAR_ALMOXARIFADO').Value  := 0;

    if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.AsInteger = 0 then
      dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_C410(pOpcao: smallint;pBarras:string; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    case pOpcao of
      0:begin

          dmMProvider.cdsRegistro60_Mestre.Close;
          dmMProvider.cdsRegistro60_Mestre.ProviderName := 'dspRegistro60_Mestre';

          dmDBEXMaster.fdqRegistro60_Mestre.SQL.Clear;
          dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('SELECT * FROM REGISTRO60MESTRE');
          dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('WHERE EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',pData))
                                                                             + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',pData)));
          dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('AND NUMERODESERIEEQUIPAMENTO = ' + QuotedStr(dmMProvider.fdmImpCupomSERIE_ECF.Value));

          dmMProvider.cdsRegistro60_Mestre.Open;
          dmMProvider.cdsRegistro60_Mestre.ProviderName := '';

          if dmMProvider.cdsRegistro60_MestreVENDABRUTA.AsCurrency > 0 then
          begin

            if pBarras <> '' then
            begin

              dmMProvider.cdsBarras.Close;
              dmMProvider.cdsBarras.ProviderName := 'dspBarras';

              dmDBEXMaster.fdqBarras.SQL.Clear;
              dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
              dmDBEXMaster.fdqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(pBarras));

              dmMProvider.cdsBarras.Open;
              dmMProvider.cdsBarras.ProviderName := '';

              dmMProvider.cdsPesqProdutos.Close;
              dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

              dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.* ,UND.PERMITE_VENDA_FRACIONADA AS FRACAO FROM PRODUTO PRO');
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
              dmDBEXMaster.fdqPesqProdutos.SQL.Add('WHERE PRO.PRODUTO = ' + IntToStr(dmMProvider.cdsBarrasPRODUTO.AsInteger));

              dmMProvider.cdsPesqProdutos.Open;
              dmMProvider.cdsPesqProdutos.ProviderName := '';

              if (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.AsCurrency > 0) or (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.AsCurrency > 0) then
              begin

                dmMSProcedure.fdspMan_Tab_RC410.Params[0].Value       := pOpcao;
                dmMSProcedure.fdspMan_Tab_RC410.Params[1].AsDate      := pData;
                dmMSProcedure.fdspMan_Tab_RC410.Params[2].AsDate      := pData;
                dmMSProcedure.fdspMan_Tab_RC410.Params[3].Value       := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.Value /100);
                dmMSProcedure.fdspMan_Tab_RC410.Params[4].Value       := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.Value /100);
                dmMSProcedure.fdspMan_Tab_RC410.Params[5].AsString    := dmMProvider.fdmImpCupomSERIE_ECF.AsString;
                dmMSProcedure.fdspMan_Tab_RC410.ExecProc;

              end;

            end;

          end;

        end;
      1:begin

          dmMSProcedure.fdspMan_Tab_RC410.Params[0].Value       := pOpcao;
          dmMSProcedure.fdspMan_Tab_RC410.Params[1].AsDate      := pData;
          dmMSProcedure.fdspMan_Tab_RC410.Params[2].AsDate      := pData;
          dmMSProcedure.fdspMan_Tab_RC410.Params[3].Value       := 0;
          dmMSProcedure.fdspMan_Tab_RC410.Params[4].Value       := 0;
          dmMSProcedure.fdspMan_Tab_RC410.Params[5].AsString    := '';
          dmMSProcedure.fdspMan_Tab_RC410.ExecProc;

        end;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_C460(pOpcao,pSituacao: smallint; pData:TDateTime);
var
  cValor_Pis, cValor_Cofins:currency;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    cValor_Pis      := 0;
    cValor_Cofins   := 0;

    dmMSProcedure.fdspMan_Tab_RC460.Params[0].Value := pOpcao;

    if pOpcao = 0 then
    begin

      dmMProvider.cdsRegistro60_Mestre.Close;
      dmMProvider.cdsRegistro60_Mestre.ProviderName := 'dspRegistro60_Mestre';

      dmDBEXMaster.fdqRegistro60_Mestre.Close;
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Clear;
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('SELECT * FROM REGISTRO60MESTRE');
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('WHERE EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',pData))
                                                                         + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',pData)));
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('AND NUMERODESERIEEQUIPAMENTO = ' + QuotedStr(dmMProvider.fdmImpCupomSERIE_ECF.Value));

      dmMProvider.cdsRegistro60_Mestre.Open;
      dmMProvider.cdsRegistro60_Mestre.ProviderName := '';

      if dmMProvider.cdsRegistro60_MestreVENDABRUTA.AsCurrency > 0 then
      begin

        if pSituacao = 0 then
        begin

          dmMProvider.cdsTributacao.Close;
          dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

          dmDBEXMaster.fdqTributacao.Close;
          dmDBEXMaster.fdqTributacao.SQL.Clear;
          dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
          dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.fdmImpCupomTRIBUTACAO.Value));

          dmMProvider.cdsTributacao.Open;
          dmMProvider.cdsTributacao.ProviderName := '';

          if (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.AsCurrency > 0) or (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.AsCurrency > 0) then
          begin

            cValor_Pis    := dmMProvider.fdmImpCupomSUB_TOTAL.AsCurrency * (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.AsCurrency /100);
            cValor_Cofins := dmMProvider.fdmImpCupomSUB_TOTAL.AsCurrency * (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.AsCurrency /100);

          end;

        end;

        dmMSProcedure.fdspMan_Tab_RC460.Params[1].Value   := '2D';


        if pSituacao = 1 then
          pSituacao := 2;

        dmMSProcedure.fdspMan_Tab_RC460.Params[2].Value   := pSituacao;
        dmMSProcedure.fdspMan_Tab_RC460.Params[3].Value   := dmMProvider.fdmImpCupomNUMERO_CUPOM.Value;

        if pSituacao = 0  then
        begin

          dmMSProcedure.fdspMan_Tab_RC460.Params[4].Value   := dmMProvider.fdmImpCupomEMISSAO.Value;
          dmMSProcedure.fdspMan_Tab_RC460.Params[5].Value   := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
          dmMSProcedure.fdspMan_Tab_RC460.Params[6].Value   := cValor_Pis;
          dmMSProcedure.fdspMan_Tab_RC460.Params[7].Value   := cValor_Cofins;
          dmMSProcedure.fdspMan_Tab_RC460.Params[8].Value   := '';
          dmMSProcedure.fdspMan_Tab_RC460.Params[9].Value   := '';
          dmMSProcedure.fdspMan_Tab_RC460.Params[10].Value  := dmMProvider.fdmImpCupomSERIE_ECF.Value;

          if dmMProvider.cdsTributacaoNOME.AsString = 'ISENTO'  then
            dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value:= 'I1'
          else if dmMProvider.cdsTributacaoNOME.AsString = 'SUBSTITUICAO'  then
            dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value:= 'F1'
          else if dmMProvider.cdsTributacaoNOME.AsString = 'NAO TRIBUTADO'  then
            dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value:= 'N1'
          else
            dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value:= FormatFloat('00',dmMProvider.cdsTributacaoCODIGO_TOTALIZADOR.AsInteger)
                                                                                      + 'T' + FormatFloat('0000',(dmMProvider.cdsTributacaoALIQUOTA.AsCurrency * 100));

        end
        else if pSituacao = 2 then
        begin

          dmMSProcedure.fdspMan_Tab_RC460.Params[1].Value   := '2D';
          dmMSProcedure.fdspMan_Tab_RC460.Params[4].Value   := dmMProvider.fdmImpCupomEMISSAO.Value;
          dmMSProcedure.fdspMan_Tab_RC460.Params[5].Value   := 0;
          dmMSProcedure.fdspMan_Tab_RC460.Params[6].Value   := 0;
          dmMSProcedure.fdspMan_Tab_RC460.Params[7].Value   := 0;
          dmMSProcedure.fdspMan_Tab_RC460.Params[8].Value   := '';
          dmMSProcedure.fdspMan_Tab_RC460.Params[9].Value   := '';
          dmMSProcedure.fdspMan_Tab_RC460.Params[10].Value  := dmMProvider.fdmImpCupomSERIE_ECF.Value;
          dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value  := '00';

        end;
      end
      else
      begin

        dmMSProcedure.fdspMan_Tab_RC460.Params[4].Value   := dmMProvider.fdmImpCupomEMISSAO.Value;
        dmMSProcedure.fdspMan_Tab_RC460.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC460.Params[6].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC460.Params[7].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC460.Params[8].Value   := '';
        dmMSProcedure.fdspMan_Tab_RC460.Params[9].Value   := '';
        dmMSProcedure.fdspMan_Tab_RC460.Params[10].Value  := dmMProvider.fdmImpCupomSERIE_ECF.Value;
        dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value  := '00';

      end;

    end
    else
    begin

      dmMSProcedure.fdspMan_Tab_RC460.Params[4].Value   := dmMProvider.fdmImpCupomEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC460.Params[5].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC460.Params[6].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC460.Params[7].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC460.Params[8].Value   := '';
      dmMSProcedure.fdspMan_Tab_RC460.Params[9].Value   := '';
      dmMSProcedure.fdspMan_Tab_RC460.Params[10].Value  := dmMProvider.fdmImpCupomSERIE_ECF.Value;
      dmMSProcedure.fdspMan_Tab_RC460.Params[11].Value  := '00';

    end;

    dmMSProcedure.fdspMan_Tab_RC460.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_C470(pOpcao,pSituacao: smallint; pAliq:string; pData:TDateTime);
var
  cValor_Pis, cValor_Cofins:currency;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    cValor_Pis      := 0;
    cValor_Cofins   := 0;

    dmMSProcedure.fdspMan_Tab_RC470.Params[0].Value            := pOpcao;

    if pOpcao = 0 then
    begin

      dmMProvider.cdsRegistro60_Mestre.Close;
      dmMProvider.cdsRegistro60_Mestre.ProviderName := 'dspRegistro60_Mestre';

      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Clear;
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('SELECT * FROM REGISTRO60MESTRE');
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('WHERE EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',pData))
                                                                         + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',pData)));
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('AND NUMERODESERIEEQUIPAMENTO = ' + QuotedStr(dmMProvider.fdmImpCupomSERIE_ECF.Value));

      dmMProvider.cdsRegistro60_Mestre.Open;
      dmMProvider.cdsRegistro60_Mestre.ProviderName := '';

      if dmMProvider.cdsRegistro60_MestreVENDABRUTA.AsCurrency > 0 then
      begin

        dmMProvider.cdsTributacao.Close;
        dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';;

        dmDBEXMaster.fdqTributacao.SQL.Clear;
        dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
        dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.fdmImpCupomTRIBUTACAO.Value));

        dmMProvider.cdsTributacao.Open;
        dmMProvider.cdsTributacao.ProviderName := '';;

        if (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.Value > 0) or (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.Value > 0) then
        begin

          cValor_Pis    := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.Value /100);
          cValor_Cofins := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.Value /100);

        end;

        dmMSProcedure.fdspMan_Tab_RC470.Params[1].Value   := FormatFloat('000000',dmMProvider.cdsBarrasPRODUTO.Value);
        dmMSProcedure.fdspMan_Tab_RC470.Params[2].Value   := (dmMProvider.fdmImpCupomQUANTIDADE.Value * dmMProvider.cdsBarrasQUANTIDADE.Value);
        dmMSProcedure.fdspMan_Tab_RC470.Params[3].Value   := dmMProvider.fdmImpCupomQUANTIDADE_CANCELADA.Value;
        dmMSProcedure.fdspMan_Tab_RC470.Params[4].Value   := dmMProvider.cdsPesqProdutosUNIDADE.Value;
        dmMSProcedure.fdspMan_Tab_RC470.Params[5].Value   := dmMProvider.fdmImpCupomSUB_TOTAL.Value;

        if dmMProvider.cdsTributacaoALIQUOTA.Value > 0 then
          dmMSProcedure.fdspMan_Tab_RC470.Params[6].Value   := 0
        else
          dmMSProcedure.fdspMan_Tab_RC470.Params[6].Value   := StrToInt(Trim(dmMProvider.cdsPesqProdutosCST.Value));

        dmMSProcedure.fdspMan_Tab_RC470.Params[7].Value     := dmMProvider.fdmImpCupomCFOP.Value;

        if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value = 'F') then
        begin

          dmMSProcedure.fdspMan_Tab_RC470.Params[8].Value   := 0;
          dmMSProcedure.fdspMan_Tab_RC470.Params[14].Value  := 'F1'

        end
        else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value = 'I') then
        begin

          dmMSProcedure.fdspMan_Tab_RC470.Params[8].Value   := 0;
          dmMSProcedure.fdspMan_Tab_RC470.Params[14].Value  := 'I1'

        end
        else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value = 'N') then
        begin

          dmMSProcedure.fdspMan_Tab_RC470.Params[8].Value   := 0;
          dmMSProcedure.fdspMan_Tab_RC470.Params[14].Value  := 'N1'

        end
        else
        begin

          dmMSProcedure.fdspMan_Tab_RC470.Params[8].Value   := (StrToFloat(dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value)/100);
          dmMSProcedure.fdspMan_Tab_RC470.Params[14].Value  := FormatFloat('00',dmMProvider.cdsTributacaoCODIGO_TOTALIZADOR.Value)
                                                                + 'T' + dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value;

        end;

        dmMSProcedure.fdspMan_Tab_RC470.Params[9].Value     := cValor_Pis;
        dmMSProcedure.fdspMan_Tab_RC470.Params[10].Value    := cValor_Cofins;
        dmMSProcedure.fdspMan_Tab_RC470.Params[11].Value    := dmMProvider.fdmImpCupomEMISSAO.Value;
        dmMSProcedure.fdspMan_Tab_RC470.Params[12].Value    := IntToStr(dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
        dmMSProcedure.fdspMan_Tab_RC470.Params[13].Value    := dmMProvider.fdmImpCupomSERIE_ECF.Value;

      end
      else
      begin

        dmMSProcedure.fdspMan_Tab_RC470.Params[1].Value   := '';
        dmMSProcedure.fdspMan_Tab_RC470.Params[2].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[3].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[4].Value   := '';
        dmMSProcedure.fdspMan_Tab_RC470.Params[5].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[6].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[7].Value   := '';
        dmMSProcedure.fdspMan_Tab_RC470.Params[8].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[9].Value   := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[10].Value  := 0;
        dmMSProcedure.fdspMan_Tab_RC470.Params[11].Value  := dmMProvider.fdmImpCupomEMISSAO.Value;
        dmMSProcedure.fdspMan_Tab_RC470.Params[12].Value  := '';
        dmMSProcedure.fdspMan_Tab_RC470.Params[13].Value  := '';
        dmMSProcedure.fdspMan_Tab_RC470.Params[14].Value  := '00';

      end;
    end
    else
    begin

      dmMSProcedure.fdspMan_Tab_RC470.Params[1].Value     := '';
      dmMSProcedure.fdspMan_Tab_RC470.Params[2].Value     := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[3].Value     := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[4].Value     := '';
      dmMSProcedure.fdspMan_Tab_RC470.Params[5].Value     := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[6].Value     := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[7].Value     := '';
      dmMSProcedure.fdspMan_Tab_RC470.Params[8].Value     := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[9].Value     := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[10].Value    := 0;
      dmMSProcedure.fdspMan_Tab_RC470.Params[11].Value    := dmMProvider.fdmImpCupomEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC470.Params[12].Value    := '';
      dmMSProcedure.fdspMan_Tab_RC470.Params[13].Value    := '';
      dmMSProcedure.fdspMan_Tab_RC470.Params[14].Value    := '00';

    end;

    if AbrirTabelaCFOP_CFPS(0,dmMProvider.fdmImpCupomCFOP.Value) then
      dmMSProcedure.fdspMan_Tab_RC470.Params[15].Value  := dmMProvider.cdsCFOP_CFPSCOD_CTA.Value
    else
      dmMSProcedure.fdspMan_Tab_RC470.Params[15].Value  := '';

    dmMSProcedure.fdspMan_Tab_RC470.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_C490(pOpcao: smallint);
var
  iCst:integer;
  cP_Desconto, cP_Acrescimo:currency;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    cP_Desconto   := 0;
    cP_Acrescimo  := 0;

    dmMSProcedure.fdspMan_Tab_RC490.Params[0].Value := pOpcao;

    if pOpcao = 0 then
    begin

      iCst := StrToInt(Trim(dmMProvider.cdsPesqProdutosCST.Value));

      dmMProvider.cdsTributacao.Close;
      dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

      dmDBEXMaster.fdqTributacao.SQL.Clear;
      dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
      dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.fdmImpCupomTRIBUTACAO.Value));

      dmMProvider.cdsTributacao.Open;
      dmMProvider.cdsTributacao.ProviderName := '';

      if dmMProvider.cdsTributacaoALIQUOTA.AsCurrency > 0 then
        iCst := 0;

      dmMSProcedure.fdspMan_Tab_RC490.Params[1].Value   := dmMProvider.fdmImpCupomEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC490.Params[2].Value   := iCst;
      dmMSProcedure.fdspMan_Tab_RC490.Params[3].Value   := dmMProvider.fdmImpCupomCFOP.Value;

      if iCst in [30,40,41,50,60] then
      begin

        dmMSProcedure.fdspMan_Tab_RC490.Params[4].Value := 0;
        dmMSProcedure.fdspMan_Tab_RC490.Params[6].Value := 0;
        dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value := 0;

      end
      else if dmMProvider.cdsTributacaoALIQUOTA.Value > 0 then
      begin


        cP_Desconto   := (dmMProvider.fdmImpCupomVALOR_DESCONTO.Value / dmMProvider.fdmImpCupomSUB_TOTAL.Value) * 100;
        cP_Acrescimo  := (dmMProvider.fdmImpCupomVALOR_ACRESCIMO.Value / dmMProvider.fdmImpCupomSUB_TOTAL.Value) * 100;

        dmMSProcedure.fdspMan_Tab_RC490.Params[4].Value  := dmMProvider.cdsTributacaoALIQUOTA.Value;
        dmMSProcedure.fdspMan_Tab_RC490.Params[6].Value  := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
        dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value  := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsTributacaoALIQUOTA.Value / 100);

        if cP_Acrescimo > 0 then
        begin

          cP_Acrescimo := cP_Acrescimo / 100;
          dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value   := dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value + (dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value * cP_Acrescimo);

        end;

        if cP_Desconto > 0 then
        begin

          cP_Desconto := cP_Desconto / 100;
          dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value   := dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value + (dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value * cP_Desconto);

        end;

      end
      else if iCst in [20,51,90] then
      begin

        dmMSProcedure.fdspMan_Tab_RC490.Params[4].Value  := 0;
        dmMSProcedure.fdspMan_Tab_RC490.Params[6].Value  := 0;
        dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value     := 0;

      end
      else
      begin

        dmMSProcedure.fdspMan_Tab_RC490.Params[4].Value  := 0;
        dmMSProcedure.fdspMan_Tab_RC490.Params[6].Value  := 0;
        dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value     := 0;

      end;

      dmMSProcedure.fdspMan_Tab_RC490.Params[5].Value   := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
      dmMSProcedure.fdspMan_Tab_RC490.Params[8].Value   := '';
      dmMSProcedure.fdspMan_Tab_RC490.Params[9].Value   := dmMProvider.fdmImpCupomNUMERO_CUPOM.Value;
      dmMSProcedure.fdspMan_Tab_RC490.Params[10].Value  := dmMProvider.fdmImpCupomSERIE_ECF.Value;

      if dmMProvider.cdsTributacaoNOME.AsString = 'ISENTO'  then
        dmMSProcedure.fdspMan_Tab_RC490.Params[11].Value:= 'I1'
      else if dmMProvider.cdsTributacaoNOME.AsString = 'SUBSTITUICAO'  then
        dmMSProcedure.fdspMan_Tab_RC490.Params[11].Value:= 'F1'
      else if dmMProvider.cdsTributacaoNOME.AsString = 'NAO TRIBUTADO'  then
        dmMSProcedure.fdspMan_Tab_RC490.Params[11].Value:= 'N1'
      else
      begin

        if dmMProvider.cdsTributacaoCODIGO_TOTALIZADOR.AsInteger >= 0 then
          dmMSProcedure.fdspMan_Tab_RC490.Params[11].Value:= FormatFloat('00',dmMProvider.cdsTributacaoCODIGO_TOTALIZADOR.AsInteger)
                                                              + 'T' + FormatFloat('0000',(dmMProvider.cdsTributacaoALIQUOTA.AsCurrency * 100))
        else
          dmMSProcedure.fdspMan_Tab_RC490.Params[11].Value:= '00';

      end;

    end
    else
    begin

      dmMSProcedure.fdspMan_Tab_RC490.Params[1].Value   := dmMProvider.fdmImpCupomEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC490.Params[2].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC490.Params[3].Value   := dmMProvider.fdmImpCupomCFOP.Value;
      dmMSProcedure.fdspMan_Tab_RC490.Params[4].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC490.Params[5].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC490.Params[6].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC490.Params[7].Value   := 0;
      dmMSProcedure.fdspMan_Tab_RC490.Params[8].Value   := '';
      dmMSProcedure.fdspMan_Tab_RC490.Params[9].Value   := '';
      dmMSProcedure.fdspMan_Tab_RC490.Params[10].Value  := '';
      dmMSProcedure.fdspMan_Tab_RC490.Params[11].Value  := '00'

    end;

    if dmMProvider.fdmImpCupomSUB_TOTAL.Value >= 0 then
      dmMSProcedure.fdspMan_Tab_RC490.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;


end;
procedure Man_Tab_Registro_60I(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_OPCAO').AsInteger            := pOpcao;
    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_EMISSAO').AsDate             := pData;
    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_NUMERO_SERIE').AsString      := dmMProvider.fdmImpCupomSERIE_ECF.Value;
    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_QUANTIDADE').AsCurrency      := (dmMProvider.fdmImpCupomQUANTIDADE.Value * dmMProvider.cdsBarrasQUANTIDADE.AsCurrency);
    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_VALOR_UNITARIO').AsCurrency  := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;

    if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'F') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'I') then
      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_ALIQUOTA_ICMS').Value := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value
    else
      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_ALIQUOTA_ICMS').Value := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1];

    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_DOCUMENTO').AsString         := IntToStr(dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_ECF').AsInteger              := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_NUMERO_ITEM').AsInteger      := dmMProvider.fdmImpCupomNUMERO_ITEM.Value;

    if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'F') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'I') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_BASE_ICMS').AsCurrency   := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_VALOR_ICMS').AsCurrency  := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value * (StrToFloat(dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value) / 100);

    end
    else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_BASE_ICMS').AsCurrency   := 0;
      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_VALOR_ICMS').AsCurrency  := 0;

    end
    else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] = 'N') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_BASE_ICMS').AsCurrency   := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
      dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_VALOR_ICMS').AsCurrency  := 0;

    end;

    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_BARRAS').Value             := dmMProvider.cdsBarrasBARRAS.AsString;

    dmMSProcedure.fdspMan_Tab_Reg60I.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_Registro_60R(pOpcao:smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_OPCAO').Value                := pOpcao;
    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_EMISSAO').AsDate             := pData;
    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_NUMERO_SERIE').AsString      := dmMProvider.fdmImpCupomSERIE_ECF.Value;
    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_QUANTIDADE').AsCurrency      := (dmMProvider.fdmImpCupomQUANTIDADE.Value * dmMProvider.cdsBarrasQUANTIDADE.AsCurrency);
    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_VALOR_UNITARIO').AsCurrency  := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;

    if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'F') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'I') then
      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_ALIQUOTA_ICMS').Value := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value
    else
      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_ALIQUOTA_ICMS').Value := dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1];

    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_DOCUMENTO').AsString         := IntToStr(dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_ECF').AsInteger              := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;

    if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'F') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') and (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'I') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_BASE_ICMS').AsCurrency   := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_VALOR_ICMS').AsCurrency  := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value * (StrToFloat(dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value) / 100);

    end
    else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] <> 'N') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_BASE_ICMS').AsCurrency   := 0;
      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_VALOR_ICMS').AsCurrency  := 0;

    end
    else if (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value[1] = 'N') then
    begin

      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_BASE_ICMS').AsCurrency   := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
      dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_VALOR_ICMS').AsCurrency  := 0;

    end;

    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_BARRAS').Value               := dmMProvider.cdsBarrasBARRAS.AsString;

    dmMSProcedure.fdspMan_Tab_Reg60R.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_ChqRec(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspChequesREC.ParamByName('IP_OPCAO').Value                := pOpcao;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_CLIENTE').Value              := dmMProvider.fdmImpChequeCLIENTE.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_EMISSAO').AsDate             := dmMProvider.fdmImpChequeEMISSAO.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_BANCO').Value                := dmMProvider.fdmImpChequeBANCO.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_AGENCIA').AsString           := dmMProvider.fdmImpChequeAGENCIA.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_CONTA').AsString             := dmMProvider.fdmImpChequeCONTA.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_CHEQUE').AsString            := dmMProvider.fdmImpChequeCHEQUE.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_VENCIMENTO').AsDate          := dmMProvider.fdmImpChequeVENCIMENTO.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_VALOR').AsCurrency           := dmMProvider.fdmImpChequeVALOR.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_BAIXA').Value                := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_VALOR_RECEBIDO').AsCurrency  := 0;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_TERCEIRO').Value             := 0;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_NOME_TERCEIRO').Value        := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_CPF_TERCEIRO').Value         := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_TELEFONE_TERCEIRO').Value    := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_DEPOSITO').Value             := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_ALINEA').Value               := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_STATUS').AsInteger           := 0;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_CONTA_CORRENTE').Value       := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_DEVOLUCAO').Value            := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_REAPRESENTACAO').Value       := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_PLANO_DE_CONTAS').AsInteger  := dmMProvider.fdmImpChequePL_CONTAS.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_ITEM_PLANO_DE_CONTAS').Value := dmMProvider.fdmImpChequeITEM_PL_CONTAS.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_CUPOM').AsInteger            := dmMProvider.fdmImpChequeCUPOM.Value;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_LANCAMENTO').AsDate          := Date;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_OBS_REPASSADO').Value        := null;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_OBSERVACAO').AsString        := '';
    dmMSProcedure.fdspChequesREC.ParamByName('IP_JUROS').Value                := 0;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_SELECIONADO').Value          := 0;
    dmMSProcedure.fdspChequesREC.ParamByName('IP_GERADO').Value               := 0;

    dmMSProcedure.fdspChequesREC.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Atualizar_Saldo_Cliente(pOpcao:smallint;pCliente:integer; pValor:Currency);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMProvider.cdsPesqClientes.Close;
    dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

    dmDBEXMaster.fdqPesqCliente.SQL.Clear;
    dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT CNPJ FROM CLIENTES');
    dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + IntToStr(pCliente));

    dmMProvider.cdsPesqClientes.Open;
    dmMProvider.cdsPesqClientes.ProviderName  := '';

    dmMSProcedure.fdspMaster.StoredProcName   := 'ATUALIZASALDOCLIENTE';
    dmMSProcedure.fdspMaster.Prepare;

    dmMSProcedure.fdspMaster.ParamByName('OPCAO').Value := pOpcao;
    dmMSProcedure.fdspMaster.ParamByName('CNPJ').Value  := dmMProvider.cdsPesqClientesCNPJ.AsString;
    dmMSProcedure.fdspMaster.ParamByName('VALOR').Value := pValor;

    if dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger = 1 then
      dmMSProcedure.fdspMaster.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_CRE(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspCre.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspCre.Params[1].Value   := dmMProvider.fdmImpFinanceiroIP_CRE.Value;
    dmMSProcedure.fdspCre.Params[2].Value   := dmMProvider.fdmImpFinanceiroIP_FILIAL.Value;
    dmMSProcedure.fdspCre.Params[3].Value   := dmMProvider.fdmImpFinanceiroIP_DOCUMENTO.Value;
    dmMSProcedure.fdspCre.Params[4].Value   := dmMProvider.fdmImpFinanceiroIP_SITUACAO.Value;
    dmMSProcedure.fdspCre.Params[5].Value   := dmMProvider.fdmImpFinanceiroIP_DATA_ENTRADA.Value;
    dmMSProcedure.fdspCre.Params[6].Value   := dmMProvider.fdmImpFinanceiroIP_SACADO.Value;
    dmMSProcedure.fdspCre.Params[7].Value   := dmMProvider.fdmImpFinanceiroIP_TIPO.Value;
    dmMSProcedure.fdspCre.Params[8].Value   := dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.Value;
    dmMSProcedure.fdspCre.Params[9].Value   := dmMProvider.fdmImpFinanceiroIP_DATA_VENCIMENTO.Value;
    dmMSProcedure.fdspCre.Params[10].Value  := dmMProvider.fdmImpFinanceiroIP_MOEDA.Value;
    dmMSProcedure.fdspCre.Params[11].Value  := dmMProvider.fdmImpFinanceiroIP_VALOR.Value;
    dmMSProcedure.fdspCre.Params[12].Value  := dmMProvider.fdmImpFinanceiroIP_MORA_DIARIA.Value;
    dmMSProcedure.fdspCre.Params[13].Value  := dmMProvider.fdmImpFinanceiroIP_DESCONTO.Value;
    dmMSProcedure.fdspCre.Params[14].Value  := null;
    dmMSProcedure.fdspCre.Params[15].Value  := dmMProvider.fdmImpFinanceiroIP_HISTORICO.Value;
    dmMSProcedure.fdspCre.Params[16].Value  := dmMProvider.fdmImpFinanceiroIP_POSICAO.Value;
    dmMSProcedure.fdspCre.Params[17].Value  := dmMProvider.fdmImpFinanceiroIP_DESCONTO_CONCEDIDO.Value;
    dmMSProcedure.fdspCre.Params[18].Value  := dmMProvider.fdmImpFinanceiroIP_ABATIMENTOS.Value;
    dmMSProcedure.fdspCre.Params[19].Value  := dmMProvider.fdmImpFinanceiroIP_OUTRAS_DESPESAS.Value;
    dmMSProcedure.fdspCre.Params[20].Value  := dmMProvider.fdmImpFinanceiroIP_PLANO_CONTAS.Value;
    dmMSProcedure.fdspCre.Params[21].Value  := dmMProvider.fdmImpFinanceiroIP_SUB_CONTA.Value;
    dmMSProcedure.fdspCre.Params[22].Value  := dmMProvider.fdmImpFinanceiroIP_LANCAMENTO.Value;
    dmMSProcedure.fdspCre.Params[23].Value  := dmMProvider.fdmImpFinanceiroIP_TIPO_OCORRENCIA.Value;
    dmMSProcedure.fdspCre.Params[24].Value  := dmMProvider.fdmImpFinanceiroIP_CONTA_CORRENTE.Value;
    dmMSProcedure.fdspCre.Params[25].Value  := dmMProvider.fdmImpFinanceiroIP_CARTEIRA.Value;
    dmMSProcedure.fdspCre.Params[26].Value  := dmMProvider.fdmImpFinanceiroIP_TIPO_PARCELA.Value;
    dmMSProcedure.fdspCre.Params[27].Value  := null;
    dmMSProcedure.fdspCre.Params[28].Value  := dmMProvider.fdmImpFinanceiroIP_DATA.Value;
    dmMSProcedure.fdspCre.Params[29].Value  := dmMProvider.fdmImpFinanceiroIP_PERCENTUAL.Value;
    dmMSProcedure.fdspCre.Params[30].Value  := dmMProvider.fdmImpFinanceiroIP_REDUCAO.Value;
    dmMSProcedure.fdspCre.Params[31].Value  := dmMProvider.fdmImpFinanceiroIP_VALOR_COMISSAO.Value;
    dmMSProcedure.fdspCre.Params[32].Value  := null;
    dmMSProcedure.fdspCre.Params[33].Value  := null;
    dmMSProcedure.fdspCre.Params[34].Value  := dmMProvider.fdmImpFinanceiroIP_VALOR_CHQ_DEVOLVIDO.Value;
    dmMSProcedure.fdspCre.Params[35].Value  := dmMProvider.fdmImpFinanceiroIP_SEQUENCIAL.Value;
    dmMSProcedure.fdspCre.Params[36].Value  := dmMProvider.fdmImpFinanceiroIP_OUTROS_DEBITOS.Value;

    if dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger = 1 then
      dmMSProcedure.fdspCre.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;
procedure Man_Tab_ArqImportado(pOpcao: smallint; pData:TDateTime);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[0].Value := pOpcao;
    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[1].Value := Date;
    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[2].Value := pData;
    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[3].Value := '';
    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
function AbrirTabelaCtrlNotas(sWhere:string):boolean;
begin

  dmMProvider.cdsCtrlNotas.Close;
  dmMProvider.cdsCtrlNotas.ProviderName := 'dspCtrlNotas';

  dmDBEXMaster.fdqCtrlNotas.SQL.Clear;
  dmDBEXMaster.fdqCtrlNotas.SQL.Add('SELECT * FROM CTRL_NOTAS');
  dmDBEXMaster.fdqCtrlNotas.SQL.Add(sWhere);

  dmMProvider.cdsCtrlNotas.Open;
  dmMProvider.cdsCtrlNotas.ProviderName := 'dspCtrlNotas';

  Result := not dmMProvider.cdsCtrlNotas.IsEmpty;

end;
function PesquisarFornecedor(sWhere:string):boolean;
begin

  dmMProvider.cdsPesqFornecedor.Close;
  dmMProvider.cdsPesqFornecedor.ProviderName := 'dspPesqFornecedor';

  dmDBEXMaster.fdqPesqFornecedor.SQL.Clear;
  dmDBEXMaster.fdqPesqFornecedor.SQL.Add('select * from fornecedor');
  dmDBEXMaster.fdqPesqFornecedor.SQL.Add(sWhere);

  dmMProvider.cdsPesqFornecedor.Open;
  dmMProvider.cdsPesqFornecedor.ProviderName := '';

  Result := not dmMProvider.cdsPesqFornecedor.IsEmpty;

end;
function PesquisaAutoCompletar(pTabela, pCampo: ShorTString ; pBusca: TObject ):ShortString;
var
  iAux, iPosicao:integer;
begin

  if (Length(TEdit(pBusca).Text) < 0) or (nor_set = 0) then
    Result := ''
  else
  begin

    with dmDBEXMaster.fdqMasterPesquisa do
    begin

      Close;
      SQL.Clear;
//      SQL.Add('Select ' + pCampo + ' from ' + pTabela + ' where ' + pCampo + ' like ' + #39 + ' ' + copy(TEdit(pBusca).Text,1,TEdit(pBusca).SelStart)+'%' + #39);
      SQL.Add('Select ' + pCampo + ' from ' + pTabela + ' where ' + pCampo + ' like ' + #39 + TEdit(pBusca).Text +'%' + #39 + ' order by ' + pCampo);
      Open;

//      Result := copy(TEdit(pBusca).Text,0, TEdit(pBusca).SelStart) + copy(Fieldbyname(pCampo).AsString, TEdit(pBusca).SelStart + 1, 255);

      if Length(dmDBEXMaster.fdqMasterPesquisa.FieldByName(pCampo).AsString) > 0 then
      begin

        iPosicao := Length(TEdit(pBusca).Text);

        for iAux := Length((TEdit(pBusca).Text)) + 1 to Length(dmDBEXMaster.fdqMasterPesquisa.FieldByName(pCampo).AsString) do
          TEdit(pBusca).Text := TEdit(pBusca).Text + dmDBEXMaster.fdqMasterPesquisa.FieldByName(pCampo).AsString[iAux];

        TEdit(pBusca).SelStart  := iPosicao;
        TEdit(pBusca).SelLength := Length(TEdit(pBusca).Text);

        Result := copy(TEdit(pBusca).Text,0, TEdit(pBusca).SelStart) + copy(Fieldbyname(pCampo).AsString, TEdit(pBusca).SelStart + 1, 255);

      end;

    end;

    if nor_set = 0 then
      nor_set := 1
    else nor_set := 0;
      dmDBEXMaster.fdqMasterPesquisa.Close;

  end;

end;
procedure Man_Tab_Tipo_Util_Ctrl_Notas(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspTipoUtilCtrlNotas.Params[0].Value := dmMProvider.cdsTipoUtilCtrlNotasDESCRICAO.Value;
    dmMSProcedure.fdspTipoUtilCtrlNotas.ExecProc;

    if dmMSProcedure.fdspTipoUtilCtrlNotas.Params[1].AsInteger > 0 then
      dmMProvider.cdsTipoUtilCtrlNotasTIPO_UTIL_CTRL_NOTAS.Value := dmMSProcedure.fdspTipoUtilCtrlNotas.Params[1].Value;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure Man_Tab_Setores(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspSetorCtrlNotas.Params[0].Value := dmMProvider.cdsSetorCtrlNotasDESCRICAO.Value;
    dmMSProcedure.fdspSetorCtrlNotas.ExecProc;

    if dmMSProcedure.fdspSetorCtrlNotas.Params[1].AsInteger > 0 then
      dmMProvider.cdsSetorCtrlNotasSETOR_CTRL_NOTAS.Value := dmMSProcedure.fdspSetorCtrlNotas.Params[1].Value;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure Man_Tab_CtrlNotas(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspCtrlNotas.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspCtrlNotas.Params[1].Value   := dmMProvider.cdsCtrlNotasCTRL_NOTAS.Value;
    dmMSProcedure.fdspCtrlNotas.Params[2].Value   := dmMProvider.cdsCtrlNotasDATA_ENTRADA.Value;
    dmMSProcedure.fdspCtrlNotas.Params[3].Value   := dmMProvider.cdsCtrlNotasFILIAL.Value;
    dmMSProcedure.fdspCtrlNotas.Params[4].Value   := dmMProvider.cdsCtrlNotasFORNECEDOR.Value;
    dmMSProcedure.fdspCtrlNotas.Params[5].Value   := dmMProvider.cdsCtrlNotasNUMERO_DOCUMENTO.Value;
    dmMSProcedure.fdspCtrlNotas.Params[6].Value   := dmMProvider.cdsCtrlNotasVALOR_NOTA.Value;
    dmMSProcedure.fdspCtrlNotas.Params[7].Value   := dmMProvider.cdsCtrlNotasVALOR_ICMS.Value;
    dmMSProcedure.fdspCtrlNotas.Params[8].Value   := dmMProvider.cdsCtrlNotasVALOR_DEVOLUCAO.Value;
    dmMSProcedure.fdspCtrlNotas.Params[9].Value   := dmMProvider.cdsCtrlNotasVALOR_BRINDE.Value;
    dmMSProcedure.fdspCtrlNotas.Params[10].Value  := dmMProvider.cdsCtrlNotasVALOR_REMESSA.Value;
    dmMSProcedure.fdspCtrlNotas.Params[11].Value  := dmMProvider.cdsCtrlNotasVALOR_IMOBILIZADO.Value;
    dmMSProcedure.fdspCtrlNotas.Params[12].Value  := dmMProvider.cdsCtrlNotasTIPO_UTILIDADE.Value;
    dmMSProcedure.fdspCtrlNotas.Params[13].Value  := dmMProvider.cdsCtrlNotasSETOR.Value;
    dmMSProcedure.fdspCtrlNotas.Params[14].Value  := dmMProvider.cdsCtrlNotasOBSERVACAO.Value;
    dmMSProcedure.fdspCtrlNotas.Params[15].Value  := dmMProvider.cdsCtrlNotasDESCRICAO_TIPO_UTILIDADE.Value;
    dmMSProcedure.fdspCtrlNotas.Params[16].Value  := dmMProvider.cdsCtrlNotasDESCRICAO_SETOR.Value;
    dmMSProcedure.fdspCtrlNotas.Params[17].Value  := dmMProvider.cdsCtrlNotasTIPO_LANCAMENTO.Value;

    dmMSProcedure.fdspCtrlNotas.ExecProc;

    if dmMSProcedure.fdspCtrlNotas.Params[18].AsInteger > 0 then
      dmMProvider.cdsCtrlNotasCTRL_NOTAS.Value := dmMSProcedure.fdspCtrlNotas.Params[18].AsInteger;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    if pOpcao = 1 then
      dmMProvider.cdsCtrlNotas.Delete;

    if InserindoEditando(dmMProvider.cdsCtrlNotas) then
      dmMProvider.cdsCtrlNotas.Post;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

function ExportarExcel(pDataSet:TClientDataSet; pArquivo:string;pSubstArq:boolean; pOpcao:smallint):boolean;
var
  tfArquivo: TextFile;
  nX, nY: SmallInt;
  tsCabecalho, tsArquivo: TStringLIst;
  sLinhaDados,sArquivo : String;
begin

  try

    if not pSubstArq then
    begin

      tsCabecalho := TStringList.Create;

  //    FormatSettings.DecimalSeparator := '.';

      ForceDirectories(ExtractFilePath(paramstr(0)) + 'CSV\');

      AssignFile(tfArquivo, ExtractFilePath(paramstr(0)) + 'CSV\' + pArquivo);
      ReWrite(tfArquivo);

      tsCabecalho := pDataSet.FieldList;
      nY          := tsCabecalho.Count-1;

      sLinhaDados := '';

      for nX := 0 to nY do
        sLinhaDados := sLinhaDados + pDataSet.FieldByName(tsCabecalho.Strings[nX]).DisplayLabel + ';'; //tsCabecalho.Strings[nX] + ';';

      WriteLn(tfArquivo, sLinhaDados);

      nY := pDataSet.FieldCount-1;

      while not pDataSet.Eof do
      begin

        sLinhaDados := '';

        for nX := 0 to nY do
        begin


          if pDataSet.Fields[nX].DataType =  ftBCD then
            sLinhaDados := sLinhaDados + FormatFloat('#,##0.00', pDataSet.FieldByName(tsCabecalho.Strings[nX]).AsCurrency) +';'
          else
            sLinhaDados := sLinhaDados + pDataSet.FieldByName(tsCabecalho.Strings[nX]).AsString +';';

        end;

        WriteLn(tfArquivo, sLinhaDados);

        pDataSet.Next;

      end;

  //    FreeAndNil(tsCabecalho);
      CloseFile(tfArquivo);
      pDataSet.Close;
      Result := true;

  //    FormatSettings.DecimalSeparator := ',';

    end
    else
    begin

      tsCabecalho := TStringList.Create;
      tsArquivo   := TStringList.Create;
      sArquivo    := ExtractFilePath(paramstr(0)) + 'CSV\' + pArquivo;

      if FileExists(sArquivo) then
      begin

        tsArquivo.LoadFromFile(sArquivo);

        case pOpcao of
          2:begin

              tsArquivo.Add('');
              tsArquivo.Add('');
              tsArquivo.Add('NOTA FISCAL X CFOP');
              tsArquivo.Add('');
              tsArquivo.Add('');

            end;
          3:begin

              tsArquivo.Add('');
              tsArquivo.Add('');
              tsArquivo.Add('TOTAIS POR CFOP');
              tsArquivo.Add('');
              tsArquivo.Add('');

            end;

        end;

        tsCabecalho := pDataSet.FieldList;
        nY          := tsCabecalho.Count-1;

        sLinhaDados := '';

        for nX := 0 to nY do
          sLinhaDados := sLinhaDados + pDataSet.FieldByName(tsCabecalho.Strings[nX]).DisplayLabel + ';';

        tsArquivo.Add(sLinhaDados);

        nY := pDataSet.FieldCount-1;

        while not pDataSet.Eof do
        begin

          sLinhaDados := '';

          for nX := 0 to nY do
          begin


            if pDataSet.Fields[nX].DataType =  ftBCD then
              sLinhaDados := sLinhaDados + FormatFloat('#,##0.00', pDataSet.FieldByName(tsCabecalho.Strings[nX]).AsCurrency) +';'
            else
              sLinhaDados := sLinhaDados + pDataSet.FieldByName(tsCabecalho.Strings[nX]).AsString +';';

          end;

          tsArquivo.Add(sLinhaDados);

          pDataSet.Next;

        end;

        tsArquivo.SaveToFile(sArquivo);
    //    FreeAndNil(tsCabecalho);
        pDataSet.Close;
        Result := true;

    //    FormatSettings.DecimalSeparator := ',';



      end;

    end;

  except

//    FormatSettings.DecimalSeparator := ',';
//    FreeAndNil(tsCabecalho);
    CloseFile(tfArquivo);
    pDataSet.Close;
    Result := False;

  end;

end;

function ExportarCtrlNotas(pArquivo:string):boolean;
var
  sArquivo: TextFile;
  nX, nY: SmallInt;
  tsCabecalho: TStringLIst;
  sLinhaDados: String;
begin

  try

    tsCabecalho := TStringList.Create;

    FormatSettings.DecimalSeparator := '.';

    AssignFile(sArquivo, ExtractFilePath(paramstr(0)) + 'CSV\' + pArquivo);
    ReWrite(sArquivo);

    tsCabecalho.Add('Empresa');
    tsCabecalho.Add('Data');
    tsCabecalho.Add('Fornecedor');
    tsCabecalho.Add('Nota Fiscal');
    tsCabecalho.Add('Valor Nota');
    tsCabecalho.Add('Valor ICMS');
    tsCabecalho.Add('Valor Devolucao');
    tsCabecalho.Add('Valor Brinde');
    tsCabecalho.Add('Valor Remessa');
    tsCabecalho.Add('Valor Imobilizado');
    tsCabecalho.Add('Utilizacao');
    tsCabecalho.Add('Setor');
    tsCabecalho.Add('Aplicacao');

    nY          := tsCabecalho.Count-1;

    sLinhaDados := '';

    for nX := 0 to nY do
      sLinhaDados := sLinhaDados + tsCabecalho.Strings[nX] + ';'; //tsCabecalho.Strings[nX] + ';';

    WriteLn(sArquivo, sLinhaDados);

    while not dmMProvider.cdsCtrlNotas.Eof do
    begin

      sLinhaDados := '';

      sLinhaDados := sLinhaDados + Trim(dmMProvider.cdsFilialFANTASIA.Value) + ';'
                      + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsCtrlNotasDATA_ENTRADA.Value) + ';'
                      + Trim(dmMProvider.cdsCtrlNotasRAZAO_SOCIAL.Value) + ';'
                      + Trim(dmMProvider.cdsCtrlNotasNUMERO_DOCUMENTO.Value) + ';'
                      + FormatFloat('#,##0.00', dmMProvider.cdsCtrlNotasVALOR_NOTA.Value) + ';'
                      + FormatFloat('#,##0.00', dmMProvider.cdsCtrlNotasVALOR_ICMS.Value) + ';'
                      + FormatFloat('#,##0.00', dmMProvider.cdsCtrlNotasVALOR_DEVOLUCAO.Value) + ';'
                      + FormatFloat('#,##0.00', dmMProvider.cdsCtrlNotasVALOR_BRINDE.Value) + ';'
                      + FormatFloat('#,##0.00', dmMProvider.cdsCtrlNotasVALOR_REMESSA.Value) + ';'
                      + FormatFloat('#,##0.00', dmMProvider.cdsCtrlNotasVALOR_IMOBILIZADO.Value) + ';'
                      + Trim(dmMProvider.cdsCtrlNotasDESCRICAO_TIPO_UTILIDADE.Value) + ';'
                      + Trim(dmMProvider.cdsCtrlNotasDESCRICAO_SETOR.Value) + ';'
                      + Trim(dmMProvider.cdsCtrlNotasOBSERVACAO.Value) + ';';

      WriteLn(sArquivo, sLinhaDados);

      dmMProvider.cdsCtrlNotas.Next;

    end;

    FreeAndNil(tsCabecalho);
    CloseFile(sArquivo);
    Result := true;

    FormatSettings.DecimalSeparator := ',';

  except
    FormatSettings.DecimalSeparator := ',';
    Result := False;
  end;

end;
procedure Man_Tab_Estados(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspEstados.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspEstados.Params[1].Value   := dmMProvider.cdsEstadosSIGLA.Value;
    dmMSProcedure.fdspEstados.Params[2].Value   := dmMProvider.cdsEstadosNOME.Value;
    dmMSProcedure.fdspEstados.Params[3].Value   := dmMProvider.cdsEstadosCODIGO_ESTADO_IBGE.Value;
    dmMSProcedure.fdspEstados.Params[4].Value   := dmMProvider.cdsEstadosMVA.Value;
    dmMSProcedure.fdspEstados.Params[5].Value   := dmMProvider.cdsEstadosICMS_INTERNO.Value;
    dmMSProcedure.fdspEstados.Params[6].Value   := dmMProvider.cdsEstadosICMS_INTERESTADUAL.Value;
    dmMSProcedure.fdspEstados.Params[7].Value   := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspEstados.Params[8].Value   := pubNomeComputador;
    dmMSProcedure.fdspEstados.Params[9].Value   := RetornarIP;
    dmMSProcedure.fdspEstados.Params[10].Value  := dmMProvider.cdsEstadosFCP.Value;
{    dmMSProcedure.fdspEstados.Params[11].Value  := dmMProvider.cdsEstadosESTADO_BRASILEIRO.Value;
    dmMSProcedure.fdspEstados.Params[12].Value  := dmMProvider.cdsEstadosCODIGO_PAIS.Value;
    dmMSProcedure.fdspEstados.Params[13].Value  := dmMProvider.cdsEstadosCODIGO_SINIEF.Value;
    dmMSProcedure.fdspEstados.Params[14].Value  := dmMProvider.cdsEstadosREGIAO_GEOGRAFICA.Value;
    dmMSProcedure.fdspEstados.Params[15].Value  := dmMProvider.cdsEstadosMASCARA_INSCRICAO_ESTADUAL.Value;
    dmMSProcedure.fdspEstados.Params[16].Value  := dmMProvider.cdsEstadosUTILIZA_ATIVIDADE_ESTADUAL.Value;
    dmMSProcedure.fdspEstados.Params[17].Value  := dmMProvider.cdsEstadosMASCARA_ATIVIDADE_ESTADUAL.Value;
    dmMSProcedure.fdspEstados.Params[18].Value  := dmMProvider.cdsEstadosSIMPLES_FEDERAL.Value;
    dmMSProcedure.fdspEstados.Params[19].Value  := dmMProvider.cdsEstadosALIQUOTA_SIMPLES_FEDERAL.Value;
    dmMSProcedure.fdspEstados.Params[20].Value  := dmMProvider.cdsEstadosREGIAO_FISCAL.Value;
}
    dmMSProcedure.fdspEstados.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure Man_Tab_FCP_Estados(pOpcao:SmallInt);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspFCP_Estados.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspFCP_Estados.Params[1].Value   := dmMProvider.cdsFCP_EstadosSIGLA.Value;
    dmMSProcedure.fdspFCP_Estados.Params[2].Value   := dmMProvider.cdsFCP_EstadosNCM.Value;
    dmMSProcedure.fdspFCP_Estados.Params[3].Value   := dmMProvider.cdsFCP_EstadosFCP.Value;
    dmMSProcedure.fdspFCP_Estados.Params[4].Value   := dmMProvider.cdsFCP_EstadosEXCECAO.Value;
    dmMSProcedure.fdspFCP_Estados.Params[5].Value   := dmMProvider.cdsFCP_EstadosALIQUOTA_INTERNA_DESTINO.Value;
    dmMSProcedure.fdspFCP_Estados.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure Relacionar_FCP;
begin

  dmMProvider.cdsFCP_Estados.Close;
  dmMProvider.cdsFCP_Estados.ProviderName := 'dspFCP_Estados';

  dmDBEXMaster.fdqFCP_EStados.SQL.Clear;
  dmDBEXMaster.fdqFCP_EStados.SQL.Add('select * from fcp_estados');
  dmDBEXMaster.fdqFCP_EStados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsEstadosSIGLA.Value));
  dmDBEXMaster.fdqFCP_EStados.SQL.Add('order by fcp, ncm');

  dmMProvider.cdsFCP_Estados.Open;
  dmMProvider.cdsFCP_Estados.ProviderName := '';

end;

procedure Man_Tab_Cidades(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspCidades.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspCidades.Params[1].Value   := dmMProvider.cdsCidadesCIDADE.Value;
    dmMSProcedure.fdspCidades.Params[2].Value   := dmMProvider.cdsCidadesNOME.Value;
    dmMSProcedure.fdspCidades.Params[3].Value   := dmMProvider.cdsCidadesESTADO.Value;
    dmMSProcedure.fdspCidades.Params[4].Value   := dmMProvider.cdsCidadesCODIGO_MUNICIPIO.Value;
    dmMSProcedure.fdspCidades.Params[5].Value   := 999999;
    dmMSProcedure.fdspCidades.Params[6].Value   := pubNomeComputador;
    dmMSProcedure.fdspCidades.Params[7].Value   := RetornarIP;
    dmMSProcedure.fdspCidades.ExecProc;

    if dmMSProcedure.fdspCidades.Params[8].Value > 0 then
    begin

      if not InserindoEditando(dmMProvider.cdsCidades) then
        dmMProvider.cdsCidades.Edit;

      dmMProvider.cdsCidadesCIDADE.Value  := dmMSProcedure.fdspCidades.Params[8].Value;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure AbrirTabelas;
begin

  dmMProvider.cdsMenuAtalhos.Close;
  dmMProvider.cdsMenuAtalhos.ProviderName := 'dspMenuAtalhos';

  dmMProvider.cdsMenuAtalhos.Open;
  dmMProvider.cdsMenuAtalhos.ProviderName := '';

  dmMProvider.cdsVersaoBanco.Open;
  dmMProvider.cdsVersaoBanco.ProviderName := '';

  dmMProvider.cdsParametros_NFE.Close;
  dmMProvider.cdsParametros_NFE.ProviderName := 'dspParametros_NFE';

  dmMProvider.cdsParametros_NFE.Open;
  dmMProvider.cdsParametros_NFE.ProviderName := '';

  dmMProvider.cdsPaises.Close;
  dmMProvider.cdsPaises.ProviderName := 'dspPaises';

  dmMProvider.cdsPaises.Open;
  dmMProvider.cdsPaises.ProviderName := '';

  dmMProvider.cdsTipoLogradouro.Close;
  dmMProvider.cdsTipoLogradouro.ProviderName := 'dspTipoLogradouro';

  dmMProvider.cdsTipoLogradouro.Open;
  dmMProvider.cdsTipoLogradouro.ProviderName := '';

end;
procedure CriarPastasAplicacao;
begin

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_ARQS_CANCELAMENTO.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_ARQS_CANCELAMENTO.Value);

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_ARQS_DEPEC.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_ARQS_DEPEC.Value);

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_ARQS_INUTILIZACAO.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_ARQS_INUTILIZACAO.Value);

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_ARQS_NFE.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_ARQS_NFE.Value);

  if not FileExists(dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value) then
    CriarPasta(dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value);

  if not FileExists(ExtractFilePath(Application.ExeName)+'Nfe\Arqs\Rave\') then
    CriarPasta(ExtractFilePath(Application.ExeName)+'Nfe\Arqs\Rave\');

  if not FileExists(ExtractFilePath(dmMProvider.cdsConfiguracoesLOGOMARCA_DANFE.Value)) then
    CriarPasta(ExtractFilePath(dmMProvider.cdsConfiguracoesLOGOMARCA_DANFE.Value));

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_ARQS_CCE.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_ARQS_CCE.Value);

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_ARQS_EVENTO.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_ARQS_EVENTO.Value);

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_LOGS.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_LOGS.Value);

  if not FileExists(dmMProvider.cdsParametros_NFEPASTA_SCHEMAS.Value) then
    CriarPasta(dmMProvider.cdsParametros_NFEPASTA_SCHEMAS.Value);

end;
function AbrirTabelaREFFornecedor(pOpcao: smallint; pConteudo: string):boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsReferenciaFornecedor.Close;
  dmMProvider.cdsReferenciaFornecedor.ProviderName := 'dspReferenciaFornecedor';

  dmDBEXMaster.fdqReferenciaFornecedor.SQL.Clear;
  dmDBEXMaster.fdqReferenciaFornecedor.SQL.Add('select * from REFERENCIAFORNECEDOR');

  sWhere := Montar_SQL_Pesquisa_RefFornecedor(pOpcao,pConteudo);

  dmDBEXMaster.fdqReferenciaFornecedor.SQL.Add(sWhere);

  dmMProvider.cdsReferenciaFornecedor.Open;
  dmMProvider.cdsReferenciaFornecedor.ProviderName := '';

  Result := not dmMProvider.cdsReferenciaFornecedor.IsEmpty;

end;

function Montar_SQL_Pesquisa_RefFornecedor(pOpcao: smallint; pConteudo: string): string;
begin

  case pOpcao of
    0:Result := 'WHERE PRODUTO = ' + pConteudo;
    1:Result := 'WHERE REFERENCIA = ' + QuotedStr(pConteudo);
    2:Result := 'WHERE FORNECEDOR = ' + pConteudo;
  end;

end;
procedure Man_Tab_RefFornecedor(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspRef_Fornecedor.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspRef_Fornecedor.Params[1].Value   := dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value;
    dmMSProcedure.fdspRef_Fornecedor.Params[2].Value   := dmMProvider.cdsReferenciaFornecedorPRODUTO.Value;
    dmMSProcedure.fdspRef_Fornecedor.Params[3].Value   := dmMProvider.cdsReferenciaFornecedorREFERENCIA.Value;
    dmMSProcedure.fdspRef_Fornecedor.Params[4].Value   := dmMProvider.cdsReferenciaFornecedorREFERENCIAFORNECEDOR.Value;
    dmMSProcedure.fdspRef_Fornecedor.ExecProc;

    if dmMSProcedure.fdspRef_Fornecedor.Params[5].Value > 0 then
    begin

      if not InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
        dmMProvider.cdsReferenciaFornecedor.Edit;

      dmMProvider.cdsReferenciaFornecedorREFERENCIAFORNECEDOR.Value  := dmMSProcedure.fdspRef_Fornecedor.Params[5].Value;

    end
    else if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
        dmMProvider.cdsReferenciaFornecedor.Post;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
function AbrirTabelaCFOP_CFPS(pOpcao:smallint; pConteudo:string):boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsCFOP_CFPS.Close;
  dmMProvider.cdsCFOP_CFPS.ProviderName := 'dspCFOP_CFPS';

  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('SELECT * FROM CFOP');

  sWhere := Montar_SQL_Pesquisa_CFOP_CFPS(pOpcao,pConteudo);

  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add(sWhere);
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('ORDER BY DESCRICAO');

  dmMProvider.cdsCFOP_CFPS.Open;

  dmMProvider.cdsCFOP_CFPS.ProviderName := '';

  Result := not dmMProvider.cdsCFOP_CFPS.IsEmpty;

end;
function Montar_SQL_Pesquisa_CFOP_CFPS(pOpcao:smallint; pConteudo:string):string;
begin

  case pOpcao of
    0:Result := 'WHERE CFOP = ' + pConteudo;
    1:Result := 'WHERE DESCRICAO LIKE ' + QuotedStr('%' + pConteudo + '%');
  end;

end;
procedure Man_Tab_CFOP(pOpcao: smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspCFOP_CFPS.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspCFOP_CFPS.Params[1].Value   := dmMProvider.cdsCFOP_CFPSCFOP.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[2].Value   := dmMProvider.cdsCFOP_CFPSDESCRICAO.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[3].Value   := dmMProvider.cdsCFOP_CFPSOPERACAO.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[4].Value   := dmMProvider.cdsCFOP_CFPSCFOP_ENTRADA_ESTADUAL.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[5].Value   := dmMProvider.cdsCFOP_CFPSCFOP_ENTRADA_INTERESTADUAL.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[6].Value   := dmMProvider.cdsCFOP_CFPSCFOP_ENTRADA_ESTRANGEIRA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[7].Value   := dmMProvider.cdsCFOP_CFPSATUALIZAR_CUSTOS.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[8].Value   := dmMProvider.cdsCFOP_CFPSNATUREZA_CFOP.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[9].Value   := dmMProvider.cdsCFOP_CFPSGERA_CREDITO_PIS_COFINS.Value;

    if Length(Trim(dmMProvider.cdsCFOP_CFPSTABELA_4_3_7.Value))>0 then
      dmMSProcedure.fdspCFOP_CFPS.Params[10].Value:= dmMProvider.cdsCFOP_CFPSTABELA_4_3_7.Value
    else
      dmMSProcedure.fdspCFOP_CFPS.Params[10].Value:= null;

    dmMSProcedure.fdspCFOP_CFPS.Params[11].Value  := dmMProvider.cdsCFOP_CFPSOBSERVACAO_NFS.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[12].Value  := dmMProvider.cdsCFOP_CFPSGERA_DEBITO_CREDITO_ICMS.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[13].Value  := dmMProvider.cdsCFOP_CFPSSUBSTITUICAO_TRIBUTARIA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[14].Value  := dmMProvider.cdsCFOP_CFPSGERA_DEBITO_CREDITO_IPI.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[15].Value  := Date;
    dmMSProcedure.fdspCFOP_CFPS.Params[16].Value  := Time;
    dmMSProcedure.fdspCFOP_CFPS.Params[17].Value  := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspCFOP_CFPS.Params[18].Value  := pubNomeComputador;
    dmMSProcedure.fdspCFOP_CFPS.Params[19].Value  := RetornarIP;
    dmMSProcedure.fdspCFOP_CFPS.Params[20].Value  := dmMProvider.cdsCFOP_CFPSCST_PIS_ENTRADA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[21].Value  := dmMProvider.cdsCFOP_CFPSALIQUOTA_PIS_ENTRADA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[22].Value  := dmMProvider.cdsCFOP_CFPSCST_COFINS_ENTRADA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[23].Value  := dmMProvider.cdsCFOP_CFPSALIQUOTA_COFINS_ENTRADA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[24].Value  := dmMProvider.cdsCFOP_CFPSCST_PIS_SAIDA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[25].Value  := dmMProvider.cdsCFOP_CFPSALIQUOTA_PIS_SAIDA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[26].Value  := dmMProvider.cdsCFOP_CFPSCST_COFINS_SAIDA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[27].Value  := dmMProvider.cdsCFOP_CFPSALIQUOTA_COFINS_SAIDA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[28].Value  := dmMProvider.cdsCFOP_CFPSNATUREZA_RECEITA_PIS_COFINS.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[29].Value  := dmMProvider.cdsCFOP_CFPSCODIGO_CREDITO_PIS_COFINS.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[30].Value  := dmMProvider.cdsCFOP_CFPSREMESSA.Value;
    dmMSProcedure.fdspCFOP_CFPS.Params[31].Value  := dmMProvider.cdsCFOP_CFPSCOD_CTA.Value;

    dmMSProcedure.fdspCFOP_CFPS.ExecProc;

    if InserindoEditando(dmMProvider.cdsCFOP_CFPS) then
      dmMProvider.cdsCFOP_CFPS.Post;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
function ValidarPermissao(pIdTela,pIdUsuario: integer; pOpValidacao: string ): boolean;
begin

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT * FROM PERMISSOES');
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE USUARIO = '+IntToStr(pIdUsuario));
  dmDBEXMaster.fdqMasterPesquisa.Open;

  if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
    Result := not dmDBEXMaster.fdqMasterPesquisa.IsEmpty
  else
  begin

    case pIdTela  of
      ord(pEstado)          :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('ESTADOS').AsString)               = 0;
      ord(pCidade)          :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CIDADES').AsString)               = 0;
      ord(pFilial)          :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('FILIAL').AsString)                = 0;
      ord(pFuncionario)     :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('FUNCIONARIO').AsString)           = 0;
      ord(pUsuario)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('USUARIOS').AsString)              = 0;
      ord(pFornecedor)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('FORNECEDORES').AsString)          = 0;
      ord(pCliente)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CLIENTES').AsString)              = 0;
      ord(pGrupo)           :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('GRUPOS').AsString)                = 0;
      ord(pSubGrupo)        :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('SUBGRUPOS').AsString)             = 0;
      ord(pSecao)           :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('SECOES').AsString)                = 0;
      ord(pSetorBalanca)    :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('SETORDEBALANCA').AsString)        = 0;
      ord(pInfNutricional)  :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('INFNUTRICIONAL').AsString)        = 0;
      ord(pProducao)        :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUCAO').AsString)              = 0;
      ord(pRentabilidade)   :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('RENTABILIDADE').AsString)         = 0;
      ord(pAliquota)        :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTAS').AsString)             = 0;
      ord(pProduto)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTOS').AsString)              = 0;
      ord(pCfop)            :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CFOP').AsString)                  = 0;
      ord(pFPagto)          :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('FORMAPAGAMENTO').AsString)        = 0;
      ord(pNbm_Ncm)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('NBMNCM').AsString)                = 0;
      ord(pBanco)           :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('BANCOS').AsString)                = 0;
      ord(pContaMov)        :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CONTACORRENTE').AsString)         = 0;
      ord(pPlConta)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('PLANODECONTAS').AsString)         = 0;
      ord(pAdmCartao)       :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('ADMINISTRADORAS').AsString)       = 0;
      ord(pLancamento)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('LANCAMENTO').AsString)            = 0;
      ord(pCpa)             :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CPA').AsString)                   = 0;
      ord(pCre)             :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CRE').AsString)                   = 0;
      ord(pChqRec)          :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CHEQUESRECEBER').AsString)        = 0;
      ord(pChqPagar)        :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CHEQUEPREDATADO').AsString)       = 0;
      ord(pCtrlCartao)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CONTROLECARTOES').AsString)       = 0;
      ord(pFluxoCaixa)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('FLUXODECAIXA').AsString)          = 0;
      ord(pOCompra)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('ORDEMDECOMPRA').AsString)         = 0;
      ord(pNFEntrada)       :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('NFENTRADA').AsString)             = 0;
      ord(pNFSaida)         :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('NFSAIDA').AsString)               = 0;
      ord(pSaldo)           :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('SALDO').AsString)                 = 0;
      ord(pInventario)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('INVENTARIO').AsString)            = 0;
      ord(pPreco)           :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRECOS').AsString)                = 0;
      ord(pPermissao)       :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('PERMISSOES').AsString)            = 0;
      ord(pEtiqueta)        :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('ETIQUETAS').AsString)             = 0;
      ord(pChat)            :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CHAT').AsString)                  = 0;
      ord(pFechaVenda)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('FECHAVENDA').AsString)            = 0;
      ord(pMRECF)           :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('MAPARESUMO').AsString)            = 0;
      ord(pGeraArqSintegra) :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('GERARARQUIVOSINTEGRA').AsString)  = 0;
      ord(pTabComissao)     :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('DESCONTOCOMISSAO').AsString)      = 0;
      ord(pRelatorio)       :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('RELATORIOS').AsString)            = 0;
      ord(pConfiguracao)    :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('CONFIGURACOES').AsString)         = 0;
      ord(pAutomacao)       :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('AUTOMACAO').AsString)             = 0;
      ord(pIntegracao)      :Result := Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('INTEGRACAO').AsString)            = 0;
      ord(pCtrlNotas)       :Result := True;//Pos(pOpValidacao,dmDBEXMaster.fdqMasterPesquisa.FieldByName('INTEGRACAO').AsString)            = 0;

    end;

  end;

  dmDBEXMaster.fdqMasterPesquisa.Close;
end;
procedure AbrirTabelaUsuarios(pUsuario:integer);
begin

  dmMProvider.cdsUsuarios.Close;
  dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';

  dmDBEXMaster.fdqUsuarios.SQL.Clear;
  dmDBEXMaster.fdqUsuarios.SQL.Add('select * from usuarios');

  if pUsuario > 0 then
    dmDBEXMaster.fdqUsuarios.SQL.Add('where usuaro = ' + IntToStr(pUsuario));

  dmDBEXMaster.fdqUsuarios.SQL.Add('order by nome');

  dmMProvider.cdsUsuarios.Open;
  dmMProvider.cdsUsuarios.ProviderName := '';

end;
procedure AbrirTabelaCtrl_Modulos;
begin

  dmMProvider.cdsCtrlModulos.Close;
  dmMProvider.cdsCtrlModulos.ProviderName := 'dspCtrlModulos';

  dmMProvider.cdsCtrlModulos.Open;
  dmMProvider.cdsCtrlModulos.ProviderName := '';

end;

procedure Man_Tab_Parametro_NFE;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspParametros_NFE.Params[0].Value    := dmMProvider.cdsParametros_NFEPARAMETROS_NFE.Value;
    dmMSProcedure.fdspParametros_NFE.Params[1].Value    := dmMProvider.cdsParametros_NFEORIENTACAO_IMPRESSAO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[2].Value    := dmMProvider.cdsParametros_NFEREPOSITORIO_XML.Value;
    dmMSProcedure.fdspParametros_NFE.Params[3].Value    := dmMProvider.cdsParametros_NFEREPOSITORIO_PDF.Value;
    dmMSProcedure.fdspParametros_NFE.Params[4].Value    := dmMProvider.cdsParametros_NFELOGO_MARCA.Value;
    dmMSProcedure.fdspParametros_NFE.Params[5].Value    := dmMProvider.cdsParametros_NFEATUALIZAR_XML.Value;
    dmMSProcedure.fdspParametros_NFE.Params[6].Value    := dmMProvider.cdsParametros_NFEEXIBIR_ERRO_SCHEMA.Value;
    dmMSProcedure.fdspParametros_NFE.Params[7].Value    := dmMProvider.cdsParametros_NFERETIRAR_ACENTOS_XML_ENVIADO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[8].Value    := dmMProvider.cdsParametros_NFESALVAR_ARQUIVOS_ENVIO_RESPOSTA.Value;
    dmMSProcedure.fdspParametros_NFE.Params[9].Value    := dmMProvider.cdsParametros_NFEFORMATO_ALERTA.Value;
    dmMSProcedure.fdspParametros_NFE.Params[10].Value   := dmMProvider.cdsParametros_NFEPASTA_LOGS.Value;
    dmMSProcedure.fdspParametros_NFE.Params[11].Value   := dmMProvider.cdsParametros_NFEPASTA_SCHEMAS.Value;
    dmMSProcedure.fdspParametros_NFE.Params[12].Value   := dmMProvider.cdsParametros_NFESALVAR_ARQS_EM_PASTAS_SEPARADAS.Value;
    dmMSProcedure.fdspParametros_NFE.Params[13].Value   := dmMProvider.cdsParametros_NFECRIAR_PASTAS_MENSALMENTE.Value;
    dmMSProcedure.fdspParametros_NFE.Params[14].Value   := dmMProvider.cdsParametros_NFEADICIONAR_LITERAL_NOME_PASTAS.Value;
    dmMSProcedure.fdspParametros_NFE.Params[15].Value   := dmMProvider.cdsParametros_NFESALVAR_NFE_PELA_EMISSAO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[16].Value   := dmMProvider.cdsParametros_NFESALVAR_ARQUIVOS_EVENTOS.Value;
    dmMSProcedure.fdspParametros_NFE.Params[17].Value   := dmMProvider.cdsParametros_NFESEPARAR_ARQ_POR_CNPJ_CERTIF.Value;
    dmMSProcedure.fdspParametros_NFE.Params[18].Value   := dmMProvider.cdsParametros_NFESEPARAR_ARQ_POR_MODELO_DOC.Value;
    dmMSProcedure.fdspParametros_NFE.Params[19].Value   := dmMProvider.cdsParametros_NFEPASTA_ARQS_NFE.Value;
    dmMSProcedure.fdspParametros_NFE.Params[20].Value   := dmMProvider.cdsParametros_NFEPASTA_ARQS_CANCELAMENTO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[21].Value   := dmMProvider.cdsParametros_NFEPASTA_ARQS_CCE.Value;
    dmMSProcedure.fdspParametros_NFE.Params[22].Value   := dmMProvider.cdsParametros_NFEPASTA_ARQS_INUTILIZACAO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[23].Value   := dmMProvider.cdsParametros_NFEPASTA_ARQS_DEPEC.Value;
    dmMSProcedure.fdspParametros_NFE.Params[24].Value   := dmMProvider.cdsParametros_NFEPASTA_ARQS_EVENTO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[25].Value   := dmMProvider.cdsParametros_NFESALVAR_ENVELOP_SOAP.Value;
    dmMSProcedure.fdspParametros_NFE.Params[26].Value   := dmMProvider.cdsParametros_NFEAJUSTAR_MSG_AGUARDE.Value;
    dmMSProcedure.fdspParametros_NFE.Params[27].Value   := dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[28].Value   := dmMProvider.cdsParametros_NFETENTATIVAS_ENVIO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[29].Value   := dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.Value;
    dmMSProcedure.fdspParametros_NFE.Params[30].Value   := dmMProvider.cdsParametros_NFESSL_LIB.Value;
    dmMSProcedure.fdspParametros_NFE.Params[31].Value   := dmMProvider.cdsParametros_NFECRYPT_LIB.Value;
    dmMSProcedure.fdspParametros_NFE.Params[32].Value   := dmMProvider.cdsParametros_NFEHTTP_LIB.Value;
    dmMSProcedure.fdspParametros_NFE.Params[33].Value   := dmMProvider.cdsParametros_NFEXMLSIGN_LIB.Value;
    dmMSProcedure.fdspParametros_NFE.Params[34].Value   := dmMProvider.cdsParametros_NFEMODELO_CERTIFICADO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[35].Value   := dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[36].Value   := dmMProvider.cdsParametros_NFESSL_TYPE.Value;
    dmMSProcedure.fdspParametros_NFE.Params[37].Value   := dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value;
    dmMSProcedure.fdspParametros_NFE.Params[38].Value   := dmMProvider.cdsParametros_NFEVERSAO_NFE.Value;

    dmMSProcedure.fdspParametros_NFE.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure Abrir_Tabela_ParamIntegracaoPDV;
begin

  dmMProvider.cdsParamIntegraPDV.Close;
  dmMProvider.cdsParamIntegraPDV.ProviderName := 'dspParamIntegraPDV';

  dmDBEXMaster.fdqParamIntegraPDV.SQL.Clear;
  dmDBEXMaster.fdqParamIntegraPDV.SQL.Add('select * from parametro_integra_pdv');
  dmDBEXMaster.fdqParamIntegraPDV.SQL.Add('where modelo_pdv = ' + IntToStr(dmMProvider.cdsConfiguracoesMODELOPDV.Value));

  dmMProvider.cdsParamIntegraPDV.Open;
  dmMProvider.cdsParamIntegraPDV.ProviderName := '';

end;
procedure Man_Tab_ParametroIntegraPDV;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspParamIntegraPDV.Params[0].Value    := dmMProvider.cdsParamIntegraPDVMODELO_PDV.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[1].Value    := dmMProvider.cdsParamIntegraPDVTIPO_INTEGRACAO_EXPORTACAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[2].Value    := dmMProvider.cdsParamIntegraPDVTIPO_INTEGRACAO_IMPORTACAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[3].Value    := dmMProvider.cdsParamIntegraPDVARREDONDA_TRUNCA.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[4].Value    := dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[5].Value    := dmMProvider.cdsParamIntegraPDVPASTA_IMPORTACAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[6].Value    := dmMProvider.cdsParamIntegraPDVARQUIVO_PRODUTOS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[7].Value    := dmMProvider.cdsParamIntegraPDVARQUIVO_COD_BARRAS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[8].Value    := dmMProvider.cdsParamIntegraPDVARQUIVO_MONTAGEM_KIT.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[9].Value    := dmMProvider.cdsParamIntegraPDVARQUIVO_CLIENTES.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[10].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_AUTORIZADOS_CLIENTE.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[11].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_LISTA_NEGRA.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[12].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_VENDEDOR.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[13].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_COFINS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[14].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_COFINS_ST.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[15].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_ICMS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[16].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_IMPOSTO_IMPORTACAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[17].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_IPI.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[18].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_ISSQN.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[19].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_PIS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[20].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_PIS_ST.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[21].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_TRANSPORTADORAS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[22].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_TRANSPORTADORA_VEICULOS.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[23].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_FORMA_PAGAMENTO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[24].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_PLANO_PAGAMENTO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[25].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_ADMINISTRADORAS_CARTAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[26].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_PERGUNTAS_LISTA_VEZ.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[27].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_MOTIVO_CANCELAMENTO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[28].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_MOTIVO_DESCONTO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[29].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_MOTIVO_DEVOLUCAO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[30].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_OPERADORES.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[31].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_NCM.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[32].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_PRE_VENDA.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[33].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_RESPOSTA_PRE_VENDA.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[34].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_KARDEX.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[35].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_ATUALIZACAO_PRECO.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[36].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_CEST.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[37].Value   := dmMProvider.cdsParamIntegraPDVARQUIVO_ANP.Value;
    dmMSProcedure.fdspParamIntegraPDV.Params[38].Value   := dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value;

    dmMSProcedure.fdspParamIntegraPDV.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

function ValidarNumeroCaixa(pNumeroCx: string): boolean;
begin

  dmDBEXMaster.fdqConfigECF.Close;
  dmDBEXMaster.fdqConfigECF.SQL.Clear;
  dmDBEXMaster.fdqConfigECF.SQL.Add('SELECT * FROM CONFIG_CAIXAS');
  dmDBEXMaster.fdqConfigECF.SQL.Add('WHERE NUMERO_CAIXA = ' + pNumeroCx);
  dmDBEXMaster.fdqConfigECF.Open;

  Result := not dmDBEXMaster.fdqConfigECF.IsEmpty;

  dmDBEXMaster.fdqConfigECF.Close;

end;

procedure RelacionarTributacao_Produto;
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

  end;

end;

procedure RelacionarGrupo_Produto;
begin

  if dmMProvider.cdsProdutosGRUPO.Value > 0 then
  begin

    dmMProvider.cdsGrupo.Close;
    dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';

    dmDBEXMaster.fdqGrupo.SQL.Clear;
    dmDBEXMaster.fdqGrupo.SQL.Add('select * from grupo');
    dmDBEXMaster.fdqGrupo.SQL.Add('where grupo = ' + IntToStr(dmMProvider.cdsProdutosGRUPO.Value));

    dmMProvider.cdsGrupo.Open;
    dmMProvider.cdsGrupo.ProviderName := '';

  end;

end;

procedure RelacionarNCM_CEST_Produto;
begin

  dmMProvider.cdsNcmNbs.Close;
  dmMProvider.cdsNcmNbs.ProviderName := 'dspNcmNbs';

  dmDBEXMaster.fdqNcmNbs.SQL.Clear;
  dmDBEXMaster.fdqNcmNbs.SQL.Add('SELECT * FROM NBM_NCM');
  dmDBEXMaster.fdqNcmNbs.SQL.Add('WHERE COD_NCM = ' + QuotedStr(dmMProvider.cdsProdutosNCM.Value));

  if dmMProvider.cdsProdutosCF_IPI.Value > 0 then
    dmDBEXMaster.fdqNcmNbs.SQL.Add(' AND EX_TIPI = ' + QuotedStr(FormatFloat('00', dmMProvider.cdsProdutosCF_IPI.Value)));

  dmMProvider.cdsNcmNbs.Open;
  dmMProvider.cdsNcmNbs.ProviderName := '';

end;

function AbrirTabelaClientes(pOpcao: smallint; pConteudo:string):boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsClientes.Close;
  dmMProvider.cdsClientes.ProviderName := 'dspClientes';

  dmDBEXMaster.fdqClientes.SQL.Clear;
  dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLI.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
  dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
  dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES CLI');
  dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
  dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLI.CIDADEENTREGA)');
  dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
  dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLI.ESTADOENTREGA)');


  sWhere := Montar_SQL_Clientes(pOpcao,pConteudo);

  dmDBEXMaster.fdqClientes.SQL.Add(sWhere);

  dmMProvider.cdsClientes.Open;
  dmMProvider.cdsClientes.ProviderName := '';

  Result := not dmMProvider.cdsClientes.IsEmpty;

end;

function Montar_SQL_Clientes(pOpcao: smallint; pConteudo: string): string;
begin

  case pOpcao of
    0:Result := 'WHERE CLI.CLIENTE = ' + pConteudo;
    1:Result := 'WHERE CLI.CNPJ = ' + QuotedStr(pConteudo);
    2:Result := 'WHERE CLI.RAZAOSOCIAL like '+ QuotedStr('%' + Trim(pConteudo) + '%');
    3:Result := 'WHERE CLI.FANTASIA like '+ QuotedStr('%' + Trim(pConteudo) + '%');
  end;

end;
function AbrirTabelaCidades(pOpcao: smallint; pConteudo, pEstado:string):boolean;
begin

  dmMProvider.cdsCidades.Close;
  dmMProvider.cdsCidades.ProviderName := 'dspCidades';

  dmDBEXMaster.fdqCidades.SQL.Clear;
  dmDBEXMaster.fdqCidades.SQL.Add('SELECT * from cidades');

  dmDBEXMaster.fdqCidades.SQL.Add(Montar_SQL_Cidades(pOpcao, pConteudo, pEstado));

  dmMProvider.cdsCidades.Open;
  dmMProvider.cdsCidades.ProviderName := '';

  Result := not dmMProvider.cdsCidades.IsEmpty;

end;

function Montar_SQL_Cidades(pOpcao: smallint; pConteudo, pEstado: string): string;
begin

  case pOpcao of
    0:Result := 'WHERE CIDADE = '   + pConteudo;
    1:Result := 'WHERE NOME like '  + QuotedStr('%' + Trim(pConteudo) + '%');
    2:Result := 'WHERE NOME = '     + QuotedStr(Trim(pConteudo)) + ' AND ESTADO = ' + QuotedStr(pEstado) ;
    3:Result := 'WHERE ESTADO = '   + QuotedStr(Trim(pConteudo));
  end;

end;
procedure Man_Tab_Sped_R0500(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspSped_R0500.Params[0].Value  := pOpcao;
    dmMSProcedure.fdspSped_R0500.Params[1].Value  := dmMProvider.cdsSped_R0500COD_CTA.Value;
    dmMSProcedure.fdspSped_R0500.Params[2].Value  := dmMProvider.cdsSped_R0500NOME_CTA.Value;
    dmMSProcedure.fdspSped_R0500.Params[3].Value  := dmMProvider.cdsSped_R0500COD_NAT_CC.Value;
    dmMSProcedure.fdspSped_R0500.Params[4].Value  := dmMProvider.cdsSped_R0500IND_CTA.Value;
    dmMSProcedure.fdspSped_R0500.Params[5].Value  := dmMProvider.cdsSped_R0500NIVEL.Value;
    dmMSProcedure.fdspSped_R0500.Params[6].Value  := dmMProvider.cdsSped_R0500COD_CTA_REFER.Value;
    dmMSProcedure.fdspSped_R0500.Params[7].Value  := dmMProvider.cdsSped_R0500CNPJ_EST.Value;

    dmMSProcedure.fdspSped_R0500.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure DuplicarRegistro(pCds: TClientDataSet);
var
  CdsClone: TClientDataSet;
  i: integer;
begin

  CdsClone := TClientDataSet.Create(Application);

  try

    CdsClone.CloneCursor(pCds, false, true);
    pCds.Append;

    for i := 0 to CdsClone.FieldCount-1 do
      pCds.Fields[i].Value := CdsClone.Fields[i].Value;

    CdsClone.Close;

  finally

    CdsClone.Free;

  end;

end;
procedure AbrirTabelaSped_0500(pData:TdateTime; pConta:string);
begin

  dmMProvider.cdsSped_R0500.Close;
  dmMProvider.cdsSped_R0500.ProviderName := 'dspSped_0500';

  dmDBEXMaster.fdqSped_R0500.SQL.Clear;
  dmDBEXMaster.fdqSped_R0500.SQL.Add('select * from sped_0500');
  dmDBEXMaster.fdqSped_R0500.SQL.Add('where cod_cta = ' + QuotedStr(pConta) + ' and data_cadastro = ' + FormatDateTime('mm/dd/yyyy', pData));

  dmMProvider.cdsSped_R0500.Open;
  dmMProvider.cdsSped_R0500.ProviderName := '';

end;

function PesquisarParticipantes(pOpcao: smallint; pConteudo:string):boolean;
begin

  dmMProvider.cdsParticipantes.Close;
  dmMProvider.cdsParticipantes.ProviderName := 'dspParticipantes';

  dmDBEXMaster.fdqParticipantes.SQL.Clear;
  dmDBEXMaster.fdqParticipantes.SQL.Add('SELECT PART.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
  dmDBEXMaster.fdqParticipantes.SQL.Add('CIDADES.CODIGO_MUNICIPIO MUNICIPIO_IBGE, ESTADOS.CODIGO_ESTADO_IBGE');
  dmDBEXMaster.fdqParticipantes.SQL.Add('FROM PARTICIPANTES PART');
  dmDBEXMaster.fdqParticipantes.SQL.Add('JOIN CIDADES CIDADES');
  dmDBEXMaster.fdqParticipantes.SQL.Add('ON(CIDADES.CIDADE = PART.CODIGO_MUNICIPIO)');
  dmDBEXMaster.fdqParticipantes.SQL.Add('JOIN ESTADOS ESTADOS');
  dmDBEXMaster.fdqParticipantes.SQL.Add('ON(ESTADOS.SIGLA = PART.ESTADO)');

  dmDBEXMaster.fdqParticipantes.SQL.Add(Montar_SQL_Participantes(pOpcao,pConteudo));

  dmMProvider.cdsParticipantes.Open;
  dmMProvider.cdsParticipantes.ProviderName := '';

  Result := not dmMProvider.cdsParticipantes.IsEmpty;

end;
function Montar_SQL_Participantes(pOpcao: smallint; pConteudo: string): string;
begin

  case pOpcao of
    0:Result := 'WHERE PART.PARTICIPANTE = '          + pConteudo;
    1:Result := 'WHERE PART.CNPJ_CPF_CEI = '          + QuotedStr(pConteudo);
    2:Result := 'WHERE PART.NOME_RAZAO_SOCIAL like '  + QuotedStr('%' + Trim(pConteudo) + '%');
    3:Result := 'WHERE PART.NOME_FANTASIA like '      + QuotedStr('%' + Trim(pConteudo) + '%');
  end;

end;
procedure ConfigurarCertificadoNFE(pACBRNfe: TACBrNFe; pOk:Boolean);
begin

  pACBRNfe.Configuracoes.Certificados.ArquivoPFX      := dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value;
  pACBRNfe.Configuracoes.Certificados.Senha           := dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value;
  pACBRNfe.Configuracoes.Certificados.NumeroSerie     := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Text;

  pACBRNfe.SSL.NumeroSerie                            := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Text;

  //testa se h� algum componente danfe vinculado ao acbrnfe
  if Assigned(pACBRNfe.DANFE) then
  begin

    pACBRNfe.DANFE.Logo                                 := dmMProvider.cdsParametros_NFELOGO_MARCA.Value;
    pACBRNfe.DANFE.PathPDF                              := dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value;

  end;

  with pACBRNfe.Configuracoes.Geral do
  begin

    SSLLib                := TSSLLib(dmMProvider.cdsParametros_NFESSL_LIB.Value);
    SSLCryptLib           := TSSLCryptLib(dmMProvider.cdsParametros_NFECRYPT_LIB.Value);
    SSLHttpLib            := TSSLHttpLib(dmMProvider.cdsParametros_NFEHTTP_LIB.Value);
    SSLXmlSignLib         := TSSLXmlSignLib(dmMProvider.cdsParametros_NFEXMLSIGN_LIB.Value);
    ExibirErroSchema      := (dmMProvider.cdsParametros_NFEEXIBIR_ERRO_SCHEMA.Value = 1);
    FormatoAlerta         := dmMProvider.cdsParametros_NFEFORMATO_ALERTA.Value;
//    FormaEmissao     := TpcnTipoEmissao(); //ver possibilidade de criar configuracao
    ModeloDF              := TpcnModeloDF(0);
    VersaoDF              := TpcnVersaoDF(2);
    IdCSC                 := '';
    CSC                   := '';
    Salvar                := (dmMProvider.cdsParametros_NFESALVAR_ARQUIVOS_ENVIO_RESPOSTA.Value = 1);
    AtualizarXMLCancelado := (dmMProvider.cdsParametros_NFEATUALIZAR_XML.Value = 1);
    ExibirErroSchema      := (dmMProvider.cdsParametros_NFEEXIBIR_ERRO_SCHEMA.Value = 1);
    RetirarAcentos        := (dmMProvider.cdsParametros_NFERETIRAR_ACENTOS_XML_ENVIADO.Value = 1);
    RetirarEspacos        := true;

  end;

  with pACBRNfe.Configuracoes.WebServices do
  begin

    UF                        := dmMProvider.cdsConfiguracoesWS_NFE.Value;
    Ambiente                  := StrToTpAmb(pOk,IntToStr(dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value));
    Visualizar                := (dmMProvider.cdsConfiguracoesVISUALIZAR_MSG_NFE.Value = 1);
    Salvar                    := (dmMProvider.cdsParametros_NFESALVAR_ENVELOP_SOAP.Value = 1);
    AjustaAguardaConsultaRet  := (dmMProvider.cdsParametros_NFEAJUSTAR_MSG_AGUARDE.Value = 1);

    if NaoEstaVazio(IntToStr(dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger)) then
      AguardarConsultaRet := ifThen(dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger < 1000, dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger * 1000, dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger);

    if NaoEstaVazio(IntToStr(dmMProvider.cdsParametros_NFETENTATIVAS_ENVIO.AsInteger)) then
      Tentativas          := dmMProvider.cdsParametros_NFETENTATIVAS_ENVIO.AsInteger;

    if NaoEstaVazio(IntToStr(dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger)) then
      IntervaloTentativas := ifThen(dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger < 1000,dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger * 1000, dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger);

    ProxyHost := '';
    ProxyPort := '';
    ProxyUser := '';
    ProxyPass := '';

  end;

  with pACBRNfe.Configuracoes.Arquivos do
  begin

    Salvar             := (dmMProvider.cdsParametros_NFESALVAR_ARQS_EM_PASTAS_SEPARADAS.Value = 1);
    SepararPorMes      := (dmMProvider.cdsParametros_NFECRIAR_PASTAS_MENSALMENTE.Value = 1);
    AdicionarLiteral   := (dmMProvider.cdsParametros_NFEADICIONAR_LITERAL_NOME_PASTAS.Value = 1);
    EmissaoPathNFe     := (dmMProvider.cdsParametros_NFESALVAR_NFE_PELA_EMISSAO.Value = 1);
    SalvarEvento       := (dmMProvider.cdsParametros_NFESALVAR_ARQUIVOS_EVENTOS.Value = 1);
    SepararPorCNPJ     := (dmMProvider.cdsParametros_NFESEPARAR_ARQ_POR_CNPJ_CERTIF.Value = 1);
    SepararPorModelo   := (dmMProvider.cdsParametros_NFESEPARAR_ARQ_POR_MODELO_DOC.Value = 1);
    PathSalvar         := dmMProvider.cdsParametros_NFEPASTA_LOGS.AsString;
    PathSchemas        := dmMProvider.cdsParametros_NFEPASTA_SCHEMAS.AsString;
    PathNFe            := dmMProvider.cdsParametros_NFEPASTA_ARQS_NFE.AsString;
    PathInu            := dmMProvider.cdsParametros_NFEPASTA_ARQS_INUTILIZACAO.AsString;
    PathEvento         := dmMProvider.cdsParametros_NFEPASTA_ARQS_EVENTO.AsString;

  end;

end;
function InicializarTabelas_Temp_Automacao;
begin

  try

    dmMProvider.fdmImpCupom.Close;
    dmMProvider.fdmImpCupom.Open;

    dmMProvider.fdmImpCheque.Close;
    dmMProvider.fdmImpCheque.Open;

    dmMProvider.fdmImpReg60M.Close;
    dmMProvider.fdmImpReg60M.Open;

    dmMProvider.fdmPedidoZeus.Close;
    dmMProvider.fdmPedidoZeus.Open;

    dmMProvider.fdmFinalizadoras.Close;
    dmMProvider.fdmFinalizadoras.Open;

    dmMProvider.fdmImpFinanceiro.Close;
    dmMProvider.fdmImpFinanceiro.Open;

    dmMProvider.fdmFinalizadoraPedido.Close;
    dmMProvider.fdmFinalizadoraPedido.Open;

    dmMProvider.fdmImpReg60M.Close;
    dmMProvider.fdmImpReg60M.Open;

    dmMProvider.fdmImpReg60A.Close;
    dmMProvider.fdmImpReg60A.Open;

    result := true;
  except

    result := false;

  end;

end;
procedure Man_Tab_Filial(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspFilial.Params[0].Value  := pOpcao;
    dmMSProcedure.fdspFilial.Params[1].Value  := dmMProvider.cdsFilialFILIAL.Value;
    dmMSProcedure.fdspFilial.Params[2].Value  := dmMProvider.cdsFilialRAZAOSOCIAL.Value;
    dmMSProcedure.fdspFilial.Params[3].Value  := dmMProvider.cdsFilialFANTASIA.Value;
    dmMSProcedure.fdspFilial.Params[4].Value  := dmMProvider.cdsFilialCNPJ.Value;
    dmMSProcedure.fdspFilial.Params[5].Value  := dmMProvider.cdsFilialINSCRICAO.Value;
    dmMSProcedure.fdspFilial.Params[6].Value  := dmMProvider.cdsFilialENDERECO.Value;
    dmMSProcedure.fdspFilial.Params[7].Value  := dmMProvider.cdsFilialNUMERO.Value;
    dmMSProcedure.fdspFilial.Params[8].Value  := dmMProvider.cdsFilialCEP.Value;
    dmMSProcedure.fdspFilial.Params[9].Value  := dmMProvider.cdsFilialBAIRRO.Value;
    dmMSProcedure.fdspFilial.Params[10].Value := dmMProvider.cdsFilialESTADO.Value;
    dmMSProcedure.fdspFilial.Params[11].Value := dmMProvider.cdsFilialCIDADE.Value;
    dmMSProcedure.fdspFilial.Params[12].Value := dmMProvider.cdsFilialDDD.Value;
    dmMSProcedure.fdspFilial.Params[13].Value := dmMProvider.cdsFilialTELEFONE1.Value;
    dmMSProcedure.fdspFilial.Params[14].Value := dmMProvider.cdsFilialTELEFONE2.Value;
    dmMSProcedure.fdspFilial.Params[15].Value := dmMProvider.cdsFilialFAX.Value;
    dmMSProcedure.fdspFilial.Params[16].Value := dmMProvider.cdsFilialHTTP.Value;
    dmMSProcedure.fdspFilial.Params[17].Value := dmMProvider.cdsFilialEMAIL.Value;
    dmMSProcedure.fdspFilial.Params[18].Value := dmMProvider.cdsFilialCOMPLEMENTO.Value;
    dmMSProcedure.fdspFilial.Params[19].Value := dmMProvider.cdsFilialCONTATO.Value;
    dmMSProcedure.fdspFilial.Params[20].Value := dmMProvider.cdsFilialENDERECOCOBRANCA.Value;
    dmMSProcedure.fdspFilial.Params[21].Value := dmMProvider.cdsFilialNUMEROCOBRANCA.Value;
    dmMSProcedure.fdspFilial.Params[22].Value := dmMProvider.cdsFilialCEPCOBRANCA.Value;
    dmMSProcedure.fdspFilial.Params[23].Value := dmMProvider.cdsFilialBAIRROCOBRANCA.Value;
    dmMSProcedure.fdspFilial.Params[24].Value := dmMProvider.cdsFilialESTADOCOBRANCA.Value;
    dmMSProcedure.fdspFilial.Params[25].Value := dmMProvider.cdsFilialCIDADECOBRANCA.Value;
    dmMSProcedure.fdspFilial.Params[26].Value := dmMProvider.cdsFilialENDERECOENTREGA.Value;
    dmMSProcedure.fdspFilial.Params[27].Value := dmMProvider.cdsFilialNUMEROENTREGA.Value;
    dmMSProcedure.fdspFilial.Params[28].Value := dmMProvider.cdsFilialCEPENTREGA.Value;
    dmMSProcedure.fdspFilial.Params[29].Value := dmMProvider.cdsFilialBAIRROENTREGA.Value;
    dmMSProcedure.fdspFilial.Params[30].Value := dmMProvider.cdsFilialESTADOENTREGA.Value;
    dmMSProcedure.fdspFilial.Params[31].Value := dmMProvider.cdsFilialCIDADEENTREGA.Value;
    dmMSProcedure.fdspFilial.Params[32].Value := dmMProvider.cdsFilialCONTRIBUINTEDOIPI.Value;
    dmMSProcedure.fdspFilial.Params[33].Value := dmMProvider.cdsFilialTIPO_EMPRESA.Value;
    dmMSProcedure.fdspFilial.Params[34].Value := dmMProvider.cdsFilialREGISTROJUNTACOMERCIAL.AsString;
    dmMSProcedure.fdspFilial.Params[35].Value := dmMProvider.cdsFilialMETRO_QUADRADO.AsCurrency;
    dmMSProcedure.fdspFilial.Params[36].Value := dmMProvider.cdsFilialREGIME_TRIBUTARIO.AsInteger;
    dmMSProcedure.fdspFilial.Params[37].Value := dmMProvider.cdsFilialINSCRICAO_MUNICIPAL.AsString;
    dmMSProcedure.fdspFilial.Params[38].Value := dmMProvider.cdsFilialINSCRICAO_SUFRAMA.AsString;
    dmMSProcedure.fdspFilial.Params[39].Value := dmMProvider.cdsFilialCRT.AsInteger;
    dmMSProcedure.fdspFilial.Params[40].Value := dmMProvider.cdsFilialPAIS.AsInteger;
    dmMSProcedure.fdspFilial.Params[41].AsMemo:= dmMProvider.cdsFilialOBSERVACAO_NFSAIDA.AsString;
    dmMSProcedure.fdspFilial.Params[42].Value := dmMProvider.cdsFilialNATUREZA_PESSOA_JURIDICA.AsInteger;
    dmMSProcedure.fdspFilial.Params[43].Value := dmMProvider.cdsFilialPERFIL_SPED.AsInteger;
    dmMSProcedure.fdspFilial.Params[44].Value := dmMProvider.cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC.AsCurrency;
    dmMSProcedure.fdspFilial.Params[45].Value := dmMProvider.cdsFilialIMPOSTO_SIMPLES_NACIONAL.AsInteger;
    dmMSProcedure.fdspFilial.Params[46].Value := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspFilial.Params[47].Value := pubNomeComputador;
    dmMSProcedure.fdspFilial.Params[48].Value := RetornarIP;
    dmMSProcedure.fdspFilial.Params[49].Value := dmMProvider.cdsFilialUTILIZA_NFCE.Value;

    dmMSProcedure.fdspFilial.ExecProc;

    if dmMSProcedure.fdspFilial.Params[49].Value > 0 then
      dmMProvider.cdsFilialFILIAL.Value := dmMSProcedure.fdspFilial.Params[8].Value;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure Man_Tab_Partiipantes(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspParticipantes.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspParticipantes.Params[1].Value   := dmMProvider.cdsParticipantesPARTICIPANTE.Value;
    dmMSProcedure.fdspParticipantes.Params[2].Value   := dmMProvider.cdsParticipantesFILIAL.Value;;
    dmMSProcedure.fdspParticipantes.Params[3].Value   := dmMProvider.cdsParticipantesATIVO.Value;
    dmMSProcedure.fdspParticipantes.Params[4].Value   := dmMProvider.cdsParticipantesTIPO_EMPRESA.Value;
    dmMSProcedure.fdspParticipantes.Params[5].Value   := dmMProvider.cdsParticipantesSITUACAO_EMPRESA.Value;

    if not dmMProvider.cdsParticipantesDATA_NASCIMENTO.IsNull then
      dmMSProcedure.fdspParticipantes.Params[6].Value := dmMProvider.cdsParticipantesDATA_NASCIMENTO.Value
    else
      dmMSProcedure.fdspParticipantes.Params[6].Value := null;

    dmMSProcedure.fdspParticipantes.Params[7].Value   := dmMProvider.cdsParticipantesDATA_ABERTURA.Value;

    if not dmMProvider.cdsParticipantesDATA_ENCERRAMENTO.IsNull then
      dmMSProcedure.fdspParticipantes.Params[8].Value := dmMProvider.cdsParticipantesDATA_ENCERRAMENTO.Value
    else
      dmMSProcedure.fdspParticipantes.Params[8].Value := null;

    dmMSProcedure.fdspParticipantes.Params[9].Value   := dmMProvider.cdsParticipantesNOME_RAZAO_SOCIAL.Value;
    dmMSProcedure.fdspParticipantes.Params[10].Value  := dmMProvider.cdsParticipantesNOME_FANTASIA.Value;
    dmMSProcedure.fdspParticipantes.Params[11].Value  := dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value;
    dmMSProcedure.fdspParticipantes.Params[12].Value  := dmMProvider.cdsParticipantesRG_IE.Value;
    dmMSProcedure.fdspParticipantes.Params[13].Value  := dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value;
    dmMSProcedure.fdspParticipantes.Params[14].Value  := dmMProvider.cdsParticipantesINSCRICAO_MUNICIPAL.Value;
    dmMSProcedure.fdspParticipantes.Params[15].Value  := dmMProvider.cdsParticipantesINSCRICAO_SUFRAMA.Value;
    dmMSProcedure.fdspParticipantes.Params[16].Value  := dmMProvider.cdsParticipantesCRT.Value;
    dmMSProcedure.fdspParticipantes.Params[17].Value  := dmMProvider.cdsParticipantesCNAE_PRINCIPAL.Value;
    dmMSProcedure.fdspParticipantes.Params[18].Value  := dmMProvider.cdsParticipantesCNAE_SECUNDARIOS.Value;
    dmMSProcedure.fdspParticipantes.Params[19].Value  := dmMProvider.cdsParticipantesCODIGO_PAIS.Value;
    dmMSProcedure.fdspParticipantes.Params[20].Value  := dmMProvider.cdsParticipantesTIPO_LOGRADOURO.Value;
    dmMSProcedure.fdspParticipantes.Params[21].Value  := dmMProvider.cdsParticipantesENDERECO.Value;
    dmMSProcedure.fdspParticipantes.Params[22].Value  := dmMProvider.cdsParticipantesNUMERO.Value;
    dmMSProcedure.fdspParticipantes.Params[23].Value  := dmMProvider.cdsParticipantesCOMPLEMENTO.Value;
    dmMSProcedure.fdspParticipantes.Params[24].Value  := dmMProvider.cdsParticipantesBAIRRO.Value;
    dmMSProcedure.fdspParticipantes.Params[25].Value  := dmMProvider.cdsParticipantesCODIGO_MUNICIPIO.Value;
    dmMSProcedure.fdspParticipantes.Params[26].Value  := dmMProvider.cdsParticipantesCEP.Value;
    dmMSProcedure.fdspParticipantes.Params[27].Value  := dmMProvider.cdsParticipantesESTADO.Value;
    dmMSProcedure.fdspParticipantes.Params[28].Value  := dmMProvider.cdsParticipantesCONTATO.Value;
    dmMSProcedure.fdspParticipantes.Params[29].Value  := dmMProvider.cdsParticipantesDDD.Value;
    dmMSProcedure.fdspParticipantes.Params[30].Value  := dmMProvider.cdsParticipantesTELEFONE1.Value;
    dmMSProcedure.fdspParticipantes.Params[31].Value  := dmMProvider.cdsParticipantesTELEFONE2.Value;
    dmMSProcedure.fdspParticipantes.Params[32].Value  := dmMProvider.cdsParticipantesCELULAR.Value;
    dmMSProcedure.fdspParticipantes.Params[33].Value  := dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value;
    dmMSProcedure.fdspParticipantes.Params[34].Value  := dmMProvider.cdsParticipantesENDERECO_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[35].Value  := dmMProvider.cdsParticipantesNUMERO_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[36].Value  := dmMProvider.cdsParticipantesCOMPLEMENTO_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[37].Value  := dmMProvider.cdsParticipantesBAIRRO_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[38].Value  := dmMProvider.cdsParticipantesCODIGO_MUNICIPIO_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[39].Value  := dmMProvider.cdsParticipantesCEP_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[40].Value  := dmMProvider.cdsParticipantesESTADO_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[41].Value  := dmMProvider.cdsParticipantesENDERECO_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[42].Value  := dmMProvider.cdsParticipantesNUMERO_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[43].Value  := dmMProvider.cdsParticipantesCOMPLEMENTO_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[44].Value  := dmMProvider.cdsParticipantesBAIRRO_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[45].Value  := dmMProvider.cdsParticipantesCODIGO_MUNICIPIO_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[46].Value  := dmMProvider.cdsParticipantesCEP_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[47].Value  := dmMProvider.cdsParticipantesESTADO_COBRANCA.Value;
    dmMSProcedure.fdspParticipantes.Params[48].Value  := dmMProvider.cdsParticipantesGARANTIDOR_OS.Value;
    dmMSProcedure.fdspParticipantes.Params[49].Value  := dmMProvider.cdsParticipantesPRODUTOR_RURAL.Value;
    dmMSProcedure.fdspParticipantes.Params[50].Value  := dmMProvider.cdsParticipantesTIPO_INSCRICAO_FEDERAL.Value;
    dmMSProcedure.fdspParticipantes.Params[51].Value  := dmMProvider.cdsParticipantesINSCRICAO_PRODUTOR.Value;
    dmMSProcedure.fdspParticipantes.Params[52].Value  := dmMProvider.cdsParticipantesCONTRIBUINTE_ICMS.Value;
    dmMSProcedure.fdspParticipantes.Params[53].Value  := dmMProvider.cdsParticipantesINSCR_ESTADUAL_SUBST_TRIB.Value;
    dmMSProcedure.fdspParticipantes.Params[54].Value  := dmMProvider.cdsParticipantesPIS_PASEP.Value;
    dmMSProcedure.fdspParticipantes.Params[55].Value  := dmMProvider.cdsParticipantesWEB_SITE.Value;
    dmMSProcedure.fdspParticipantes.Params[56].Value  := dmMProvider.cdsParticipantesEMAIL.Value;
    dmMSProcedure.fdspParticipantes.Params[57].Value  := dmMProvider.cdsParticipantesOBSERVACAO.Value;
    dmMSProcedure.fdspParticipantes.Params[58].Value  := dmMProvider.cdsParticipantesRENDA.Value;
    dmMSProcedure.fdspParticipantes.Params[59].Value  := dmMProvider.cdsParticipantesLIMITE_CREDITO.Value;
    dmMSProcedure.fdspParticipantes.Params[60].Value  := dmMProvider.cdsParticipantesSALDO_DEVEDOR.Value;
    dmMSProcedure.fdspParticipantes.Params[61].Value  := dmMProvider.cdsParticipantesCODIGO_ATIVIDADE_FEDERAL.Value;
    dmMSProcedure.fdspParticipantes.Params[62].Value  := dmMProvider.cdsParticipantesCODIGO_ATIVIDADE_ESTADUAL.Value;
    dmMSProcedure.fdspParticipantes.Params[63].Value  := dmMProvider.cdsParticipantesCODIGO_ATIVIDADE_MUNICIPAL.Value;
    dmMSProcedure.fdspParticipantes.Params[64].Value  := dmMProvider.cdsParticipantesCODIGO_UNIFICACAO.Value;
    dmMSProcedure.fdspParticipantes.Params[65].Value  := dmMProvider.cdsParticipantesPONTO_REFERENCIA.Value;
    dmMSProcedure.fdspParticipantes.Params[66].Value  := dmMProvider.cdsParticipantesPONTO_REFERENCIA_ENTREGA.Value;
    dmMSProcedure.fdspParticipantes.Params[67].Value  := dmMProvider.cdsParticipantesPONTO_REFERENCIA_COBRANCA.Value;

    if dmMProvider.cdsParticipantesVENDEDOR.Value > 0 then
      dmMSProcedure.fdspParticipantes.Params[68].Value:= dmMProvider.cdsParticipantesVENDEDOR.Value
    else
      dmMSProcedure.fdspParticipantes.Params[68].Value:= null;

    dmMSProcedure.fdspParticipantes.Params[69].Value  := dmMProvider.cdsParticipantesCLIENTE_FORNECEDOR.Value;
    dmMSProcedure.fdspParticipantes.Params[70].Value  := dmMProvider.cdsParticipantesPERMITE_VENDA_STATUS_BLOQUEADO.Value;
    dmMSProcedure.fdspParticipantes.Params[71].Value  := dmMProvider.cdsParticipantesDESCONTO_PERSONALIZADO.Value;

    dmMSProcedure.fdspParticipantes.ExecProc;

    if dmMSProcedure.fdspParticipantes.Params[72].Value > 0 then
      dmMProvider.cdsParticipantesPARTICIPANTE.Value := dmMSProcedure.fdspParticipantes.Params[72].Value;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure Man_Tab_Configuracoes(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspConfiguracoes.Params[0].Value     := dmMProvider.cdsConfiguracoesPATH_BANCO_DE_DADOS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[1].Value     := dmMProvider.cdsConfiguracoesINTERVALO_ENTRE_BACKUP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[2].Value     := dmMProvider.cdsConfiguracoesPATH_BACKUP_1.Value;
    dmMSProcedure.fdspConfiguracoes.Params[3].Value     := dmMProvider.cdsConfiguracoesPATH_BACKUP_2.Value;
    dmMSProcedure.fdspConfiguracoes.Params[4].Value     := dmMProvider.cdsConfiguracoesMODELO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[5].Value     := dmMProvider.cdsConfiguracoesSERIE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[6].Value     := dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[7].Value     := dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[8].Value     := dmMProvider.cdsConfiguracoesTIPOCLD.Value;
    dmMSProcedure.fdspConfiguracoes.Params[9].Value     := dmMProvider.cdsConfiguracoesUNIFICARPRECODEVENDA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[10].Value    := dmMProvider.cdsConfiguracoesUTILIZAR_SIMILAR_PRECO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[11].Value    := dmMProvider.cdsConfiguracoesVER_SIMILAR_PARA_ALTERAR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[12].Value    := dmMProvider.cdsConfiguracoesTOTALIZAR_CFOP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[13].Value    := dmMProvider.cdsConfiguracoesATUALIZAR_CUSTOS_SIMILAR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[14].Value    := dmMProvider.cdsConfiguracoesMODELOPDV.Value;
    dmMSProcedure.fdspConfiguracoes.Params[15].Value    := dmMProvider.cdsConfiguracoesPDV_TRUNCA_ARREDONDA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[16].Value    := dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value;
    dmMSProcedure.fdspConfiguracoes.Params[17].Value    := dmMProvider.cdsConfiguracoesENDERECO_WS_GENESIS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[18].Value    := dmMProvider.cdsConfiguracoesPORTA_WS_GENESIS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[19].Value    := dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.Value;
    dmMSProcedure.fdspConfiguracoes.Params[20].Value    := dmMProvider.cdsConfiguracoesPATH_IMPORTACAO_PDV.Value;
    dmMSProcedure.fdspConfiguracoes.Params[21].Value    := dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[22].Value    := dmMProvider.cdsConfiguracoesMULTA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[23].Value    := dmMProvider.cdsConfiguracoesTIPOMULTA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[24].Value    := dmMProvider.cdsConfiguracoesMORADIARIA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[25].Value    := dmMProvider.cdsConfiguracoesTIPOMORADIARIA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[26].Value    := dmMProvider.cdsConfiguracoesUTILIZACOBRANCAMAGNETICA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[27].Value    := dmMProvider.cdsConfiguracoesUSAR_COBRANCA_REGISTRADA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[28].Value    := dmMProvider.cdsConfiguracoesCOBRANCA_IMP_BANCO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[29].Value    := dmMProvider.cdsConfiguracoesTIPOBLOQUETO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[30].Value    := dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[31].Value    := 0; //quantidade de terminais de consulta - obsoleto
    dmMSProcedure.fdspConfiguracoes.Params[32].Value    := dmMProvider.cdsConfiguracoesPATH_TERMINAL_CONSULTA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[33].Value    := dmMProvider.cdsConfiguracoesWS_NFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[34].Value    := dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[35].Value    := dmMProvider.cdsConfiguracoesVISUALIZAR_MSG_NFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[36].Value    := dmMProvider.cdsConfiguracoesFORMA_EMSSAO_DANFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[37].Value    := dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[38].Value    := dmMProvider.cdsConfiguracoesCOPIAR_XML_ENTRADA_REPOSITORIO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[39].Value    := dmMProvider.cdsConfiguracoesIMPORTAR_PARCELAS_NFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[40].Value    := dmMProvider.cdsConfiguracoesCONFIGURACAO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[41].Value    := dmMProvider.cdsConfiguracoesMODELOBALANCA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[42].Value    := dmMProvider.cdsConfiguracoesATIVAR_RENTABILIDADE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[43].Value    := dmMProvider.cdsConfiguracoesUSAR_CAMPO_COMPLE_PESQUISA_NFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[44].Value    := dmMProvider.cdsConfiguracoesNOME_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[45].Value    := dmMProvider.cdsConfiguracoesCPF_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[46].Value    := dmMProvider.cdsConfiguracoesCRC_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[47].Value    := dmMProvider.cdsConfiguracoesCNPJ_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[48].Value    := dmMProvider.cdsConfiguracoesENDERECO_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[49].Value    := dmMProvider.cdsConfiguracoesNUMERO_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[50].Value    := dmMProvider.cdsConfiguracoesCEP_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[51].Value    := dmMProvider.cdsConfiguracoesBAIRRO_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[52].Value    := dmMProvider.cdsConfiguracoesCIDADE_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[53].Value    := dmMProvider.cdsConfiguracoesCOMPLEMENTO_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[54].Value    := dmMProvider.cdsConfiguracoesDDD_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[55].Value    := dmMProvider.cdsConfiguracoesTELEFONE_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[56].Value    := dmMProvider.cdsConfiguracoesFAX_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[57].Value    := dmMProvider.cdsConfiguracoesEMAIL_CONTADOR.Value;
    dmMSProcedure.fdspConfiguracoes.Params[58].Value    := dmMProvider.cdsConfiguracoesENVIAR_XML_CONTABILIDADE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[59].Value    := dmMProvider.cdsConfiguracoesPATH_ATUALIZACAO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[60].Value    := dmMProvider.cdsConfiguracoesOC_ATUALIZA_ALMOXARIFADO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[61].Value    := dmMProvider.cdsConfiguracoesTIPO_ESTOQUE_NF_ENTREDA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[62].Value    := dmMProvider.cdsConfiguracoesTIPO_ESTOQUE_NF_SAIDA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[63].Value    := dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[64].Value    := dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[65].Value    := dmMProvider.cdsConfiguracoesPERCENTUALLIMITEDECREDITO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[66].Value    := dmMProvider.cdsConfiguracoesUSAR_NOME_PASTA_IMP_CUPOM_NFS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[67].Value    := dmMProvider.cdsConfiguracoesQUANTIDADEDECOPIASDEPEDIDO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[68].Value    := dmMProvider.cdsConfiguracoesMODELO_COMUNICACAO_SERVICO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[69].Value    := dmMProvider.cdsConfiguracoesATUALIZAR_FOR_PRO_PELA_NFE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[70].Value    := dmMProvider.cdsConfiguracoesPERMITE_VENDA_ABAIXO_CUSTOLIQ.Value;
    dmMSProcedure.fdspConfiguracoes.Params[71].Value    := dmMProvider.cdsConfiguracoesDESCONTO_MAXIMO_VENDA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[72].Value    := dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSGERAL.Value;
    dmMSProcedure.fdspConfiguracoes.Params[73].Value    := dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSALTERADOS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[74].Value    := dmMProvider.cdsConfiguracoesARQUIVOIMEDITOPRODUTOS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[75].Value    := dmMProvider.cdsConfiguracoesARQUIVODECAIXA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[76].Value    := dmMProvider.cdsConfiguracoesARQUIVODECLIENTES.Value;
    dmMSProcedure.fdspConfiguracoes.Params[77].Value    := dmMProvider.cdsConfiguracoesARQUIVODEFORMAPAGAMENTO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[78].Value    := dmMProvider.cdsConfiguracoesARQUIVODESECOES.Value;
    dmMSProcedure.fdspConfiguracoes.Params[79].Value    := dmMProvider.cdsConfiguracoesARQUIVODEVENDA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[80].Value    := dmMProvider.cdsConfiguracoesARQUIVODERECEBIMENTOS.Value;
    dmMSProcedure.fdspConfiguracoes.Params[81].Value    := dmMProvider.cdsConfiguracoesARQUIVODEVENDADECLIENTE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[82].Value    := dmMProvider.cdsConfiguracoesARQUIVODECUPOMDIA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[83].Value    := dmMProvider.cdsConfiguracoesMENSAGEM_FINANCEIRA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[84].Value    := dmMProvider.cdsConfiguracoesVALIDADE_ORCAMENTO.Value;
    dmMSProcedure.fdspConfiguracoes.Params[85].Value    := dmMProvider.cdsConfiguracoesMENSAGEM_ENTREGA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[86].Value    := dmMProvider.cdsConfiguracoesSENHA_USUARIO_SMTP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[87].Value    := dmMProvider.cdsConfiguracoesUSUARIO_SMTP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[88].Value    := dmMProvider.cdsConfiguracoesPORTA_SMTP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[89].Value    := dmMProvider.cdsConfiguracoesSERVIDOR_SMTP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[90].Value    := dmMProvider.cdsConfiguracoesAUTENTICA_SMTP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[91].Value    := dmMProvider.cdsConfiguracoesUSAR_SSL_SMTP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[92].Value    := dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value;
    dmMSProcedure.fdspConfiguracoes.Params[93].Value    := dmMProvider.cdsConfiguracoesDESCRICAO_CF_CONV_25_2016.Value;
    dmMSProcedure.fdspConfiguracoes.Params[94].Value    := dmMProvider.cdsConfiguracoesHABILITA_CONTAB_DOWNLOAD_XML.Value;
    dmMSProcedure.fdspConfiguracoes.Params[95].Value    := dmMProvider.cdsConfiguracoesATUALIZAR_NCM_PELA_ENTRADA.Value;
    dmMSProcedure.fdspConfiguracoes.Params[96].Value    := dmMProvider.cdsConfiguracoesPATH_LIVE_UPDATE.Value;
    dmMSProcedure.fdspConfiguracoes.Params[97].Value    := dmMProvider.cdsConfiguracoesBUSCA_CEP.Value;
    dmMSProcedure.fdspConfiguracoes.Params[98].Value    := dmMProvider.cdsConfiguracoesCONSULTAR_CNPJ_CPF_RFB_SEFAZ.Value;

    dmMSProcedure.fdspConfiguracoes.ExecProc;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure Man_Tab_Config_Financeiro(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspConfig_financeiro.Params[0].Value := dmMProvider.cdsConfig_financeiroCONFIG_FINANCEIRO.Value;
    dmMSProcedure.fdspConfig_financeiro.Params[1].Value := dmMProvider.cdsConfig_financeiroEMITIR_RECIBO_RECEBIMENTO.Value;
    dmMSProcedure.fdspConfig_financeiro.Params[2].Value := dmMProvider.cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.Value;
    dmMSProcedure.fdspConfig_financeiro.ExecProc;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure Man_Tab_Config_CEP(pWSOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspConfigBuscaCEP.Params[0].Value    := pWSOpcao;
    dmMSProcedure.fdspConfigBuscaCEP.Params[1].Value    := dmMProvider.cdsConfigBuscaCEPPROXY_HOST.Value;
    dmMSProcedure.fdspConfigBuscaCEP.Params[2].Value    := dmMProvider.cdsConfigBuscaCEPPROXY_PORT.Value;
    dmMSProcedure.fdspConfigBuscaCEP.Params[3].Value    := dmMProvider.cdsConfigBuscaCEPPROXY_USER.Value;
    dmMSProcedure.fdspConfigBuscaCEP.Params[4].Value    := dmMProvider.cdsConfigBuscaCEPPROXY_PASSWORD.Value;
    dmMSProcedure.fdspConfigBuscaCEP.Params[5].Value    := dmMProvider.cdsConfigBuscaCEPCHAVE_ACESSO.Value;

    dmMSProcedure.fdspConfigBuscaCEP.ExecProc;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;
procedure ConfigurarBuscaCep(pACBrCEP: TACBrCEP);
begin

  dmMProvider.cdsConfigBuscaCEP.Close;
  dmMProvider.cdsConfigBuscaCEP.ProviderName := 'dspConfigBuscaCEP';

  dmDBEXMaster.fdqConfBuscaCep.SQL.Clear;
  dmDBEXMaster.fdqConfBuscaCep.SQL.Add('select * from config_busca_cep');
  dmDBEXMaster.fdqConfBuscaCep.SQL.Add('where web_service = ' + IntToStr(dmMProvider.cdsConfiguracoesBUSCA_CEP.Value));

  dmMProvider.cdsConfigBuscaCEP.Open;
  dmMProvider.cdsConfigBuscaCEP.ProviderName := '';

  pACBrCEP.WebService   := TACBrCEPWebService(dmMProvider.cdsConfigBuscaCEPWEB_SERVICE.Value) ;
  pACBrCEP.ProxyHost    := dmMProvider.cdsConfigBuscaCEPPROXY_HOST.Value;
  pACBrCEP.ProxyPort    := dmMProvider.cdsConfigBuscaCEPPROXY_PORT.Value;
  pACBrCEP.ProxyUser    := dmMProvider.cdsConfigBuscaCEPPROXY_USER.Value;
  pACBrCEP.ProxyPass    := dmMProvider.cdsConfigBuscaCEPPROXY_PASSWORD.Value;
  pACBrCEP.ChaveAcesso  := dmMProvider.cdsConfigBuscaCEPCHAVE_ACESSO.Value;

end;
procedure Man_Tab_Tipo_Logradouro(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspTipoLogradouro.Params[0].Value    := pOpcao;
    dmMSProcedure.fdspTipoLogradouro.Params[1].Value    := dmMProvider.cdsTipoLogradouroTIPO_LOGRADOURO.Value;
    dmMSProcedure.fdspTipoLogradouro.Params[2].Value    := dmMProvider.cdsTipoLogradouroSIGLA.Value;
    dmMSProcedure.fdspTipoLogradouro.Params[3].Value    := dmMProvider.cdsTipoLogradouroDESCRICAO.Value;

    dmMSProcedure.fdspTipoLogradouro.ExecProc;

    if dmMSProcedure.fdspTipoLogradouro.Params[4].Value > 0 then
      dmMProvider.cdsTipoLogradouroTIPO_LOGRADOURO.Value := dmMSProcedure.fdspTipoLogradouro.Params[4].Value;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

function AbrirTabelaEstados(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsEstados.Close;
  dmMProvider.cdsEstados.ProviderName := 'dspEstados';;
  dmDBEXMaster.fdqEstados.SQL.Clear;
  dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Estados(pOpcao,pConteudo);

  dmDBEXMaster.fdqEstados.SQL.Add(sWhere);
  dmDBEXMaster.fdqEstados.SQL.Add('ORDER BY NOME');

  try

    dmMProvider.cdsEstados.Open;
    dmMProvider.cdsEstados.ProviderName := '';

    Result := not dmMProvider.cdsEstados.IsEmpty;

   except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure RelacionarUltimaNFEntrada_Participante;
begin

  dmMProvider.cdsUltimaNFForn.Close;
  dmMProvider.cdsUltimaNFForn.ProviderName  := 'dspUltimaNFForn';

  dmDBEXMaster.fdqNFEntrada.SQL.Clear;
  dmDBEXMaster.fdqNFEntrada.SQL.Add('select first 1 max(entrada) as entrada, emissao,');
  dmDBEXMaster.fdqNFEntrada.SQL.Add('nfentrada,notafiscal, valordosprodutos, valordanota from nfentrada');
  dmDBEXMaster.fdqNFEntrada.SQL.Add('where participante = ' + IntToStr(dmMProvider.cdsParticipantesPARTICIPANTE.Value));
  dmDBEXMaster.fdqNFEntrada.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmDBEXMaster.fdqNFEntrada.SQL.Add('group by emissao, nfentrada, notafiscal, valordosprodutos, valordanota');
  dmDBEXMaster.fdqNFEntrada.SQL.Add('order by entrada desc');

  dmMProvider.cdsUltimaNFForn.Open;
  dmMProvider.cdsUltimaNFForn.ProviderName := '';

end;
procedure RelacionarUltimaNFSaida_Participante;
begin

  dmMProvider.cdsUltimaNFSaidaPart.Close;
  dmMProvider.cdsUltimaNFSaidaPart.ProviderName  := 'dspUltimaNFSaidaPart';

  dmDBEXMaster.fdqNFSaida.SQL.Clear;
  dmDBEXMaster.fdqNFSaida.SQL.Add('select first 1 max(emissao) as emissao, saida,');
  dmDBEXMaster.fdqNFSaida.SQL.Add('nfsaida, valordosprodutos, valordanota from nfsaida');
  dmDBEXMaster.fdqNFSaida.SQL.Add('where destinatario_ = ' + IntToStr(dmMProvider.cdsParticipantesPARTICIPANTE.Value));
  dmDBEXMaster.fdqNFSaida.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmDBEXMaster.fdqNFSaida.SQL.Add('group by saida, nfsaida, valordosprodutos, valordanota');
  dmDBEXMaster.fdqNFSaida.SQL.Add('order by emissao desc');

  dmMProvider.cdsUltimaNFSaidaPart.Open;
  dmMProvider.cdsUltimaNFSaidaPart.ProviderName := '';

end;
procedure RelacionarUltimaOrdemCompra;
begin

  dmMProvider.cdsUltimaOCForn.Close;
  dmMProvider.cdsUltimaOCForn.ProviderName  := 'dspUltimaOCForn';

  dmDBEXMaster.fdqOrdemCompra.SQL.Clear;
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('select max(ordemdecompra)as ordemdecompra, max(emissao) as emissao,');
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('max(entrega)as entrega, max(faturamento) as faturamento,');
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('max(totaldopedido) as totaldopedido from ordemdecompra');
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('where participante = ' + IntToStr(dmMProvider.cdsParticipantesPARTICIPANTE.Value));

  dmMProvider.cdsUltimaOCForn.Open;
  dmMProvider.cdsUltimaOCForn.ProviderName := '';

end;

function Retornar_Info_TabBarras(pProduto:integer):string;
begin

  try

    dmDBEXMaster.fdqBarras.Close;
    dmDBEXMaster.fdqBarras.SQL.Clear;
    dmDBEXMaster.fdqBarras.SQL.add('select * from barras');
    dmDBEXMaster.fdqBarras.SQL.add('where produto = ' + IntToStr(pProduto));
    dmDBEXMaster.fdqBarras.Open;

    Result := dmDBEXMaster.fdqBarras.FieldByName('BARRAS').AsString + '|' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('GERADO').AsInteger)+ '|' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PESADO').AsInteger);

  finally

    dmDBEXMaster.fdqBarras.Close;

  end;

end;
procedure Man_Tab_LOG_SYS(pTabela_modulo,pLog, pLogErro, pImagem:string; pOperacao:integer);
begin

  try

    if not dmDBEXMaster.fdtLogSys.Active then
      dmDBEXMaster.fdtLogSys.StartTransaction;

    dmMSProcedure.fdspLogSys.Params[0].Value  := RetiraBrancos(pTabela_modulo);
    dmMSProcedure.fdspLogSys.Params[1].Value  := pOperacao;
    dmMSProcedure.fdspLogSys.Params[2].Value  := dmDBEXMaster.sNomeUsuario;
    dmMSProcedure.fdspLogSys.Params[3].Value  := pubNomeComputador;
    dmMSProcedure.fdspLogSys.Params[4].Value  := RetornarIP;
    dmMSProcedure.fdspLogSys.Params[5].Value  := pLog;
    dmMSProcedure.fdspLogSys.Params[6].LoadFromFile(pImagem, ftBlob);
    dmMSProcedure.fdspLogSys.Params[7].Value  := pLogErro;
    dmMSProcedure.fdspLogSys.ExecProc;

    if dmDBEXMaster.fdtLogSys.Active then
      dmDBEXMaster.fdtLogSys.Commit;

    dmDBEXMaster.fdcLogSys.Close;

  except on E: Exception do
    begin

      if dmDBEXMaster.fdtLogSys.Active then
        dmDBEXMaster.fdtLogSys.Rollback;

      dmDBEXMaster.fdcLogSys.Close;

    end;

  end;

end;

end.
