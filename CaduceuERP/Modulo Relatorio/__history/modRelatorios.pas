unit modRelatorios;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,  Buttons, StdCtrls, DBCtrls, pngimage, ExtCtrls, rvLDCompiler,
  Menus, IniFiles, jpeg, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, midaslib,DB,
  DBClient,  EXLReportExcelTLB, EXLReportBand, EXLReport, System.DateUtils;




type
  TfrmRelatorios = class(TForm)
    lstItens: TListView;
    pgcFiltro: TPageControl;
    tbsRelProdutos: TTabSheet;
    grpIntervProdutos: TGroupBox;
    lblProdutoIni: TLabel;
    lblProdutoFin: TLabel;
    edtProdutoIni: TEdit;
    edtProdutoFin: TEdit;
    edtNomeProdutoIni: TEdit;
    edtNomeProdutoFin: TEdit;
    grpGrupo: TGroupBox;
    edtGrupo: TEdit;
    lblGrupo: TLabel;
    grpSubgrupo: TGroupBox;
    lblSubgrupo: TLabel;
    edtSubgrupo: TEdit;
    grpSecao: TGroupBox;
    lblSecao: TLabel;
    edtSecao: TEdit;
    imgImprimir: TImage;
    imgSair: TImage;
    grpFornecedor: TGroupBox;
    lblFornecedor: TLabel;
    edtFornecedor: TEdit;
    grpSetorBalanca: TGroupBox;
    lblSetorBalanca: TLabel;
    edtSetorBalanca: TEdit;
    grpAliquotaICMS_Saida: TGroupBox;
    lblAliquotaICMS_Saida: TLabel;
    edtAliquotaICMS_Saida: TEdit;
    grpSaldoLoja: TGroupBox;
    rdpSaldoLoja: TRadioGroup;
    edtSaldoDesejado: TEdit;
    lblSaldoDesejado: TLabel;
    rdpEnviarBalanca: TRadioGroup;
    rdpAtivo: TRadioGroup;
    rdpVisivel: TRadioGroup;
    edtNomeGrupo: TEdit;
    edtNomeSubGrupo: TEdit;
    edtNomeSecao: TEdit;
    edtNomeFornecedor: TEdit;
    edtNomeSetorBalanca: TEdit;
    edtNomeAliquotaS: TEdit;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    tbsMovimento: TTabSheet;
    grpDatasPisCofins: TGroupBox;
    lblDataInicialPISCOFINS: TLabel;
    lblDataFinalPISCOFINS: TLabel;
    dtpDataInicialPISCOFINS: TDateTimePicker;
    dtpDataFinalPISCOFINS: TDateTimePicker;
    tbsCidades: TTabSheet;
    frpEstadosCidade: TGroupBox;
    cboEstadosCidades: TDBLookupComboBox;
    tbsContaCorrente: TTabSheet;
    grpFiltroConta: TGroupBox;
    cboContaCorrente: TDBLookupComboBox;
    tbsFinanceiro: TTabSheet;
    grpDatas: TGroupBox;
    grpPeriodo: TGroupBox;
    lblPeriodoInicial: TLabel;
    dtpPeriodoInicial: TDateTimePicker;
    lblPeriodoFinal: TLabel;
    dtpPeriodoFinal: TDateTimePicker;
    chkEmissao: TCheckBox;
    chkVencimento: TCheckBox;
    chkPagamento: TCheckBox;
    rdpStatusDocumento: TRadioGroup;
    rdpAgrupamento: TRadioGroup;
    grpPrecovenda: TGroupBox;
    lblValor: TLabel;
    rdpPrecoVenda: TRadioGroup;
    edtValor: TEdit;
    grpTributacao: TGroupBox;
    cboTributacao: TDBLookupComboBox;
    tbsRegistroInventario: TTabSheet;
    grpAnoReferenciaRI: TGroupBox;
    cboAnoReferenciaRI: TComboBox;
    frpInventarioDisponivel: TGroupBox;
    grdInventarioDisponivel: TDBGrid;
    grpVenda_Grupo: TGroupBox;
    cboGrupoVenda: TDBLookupComboBox;
    grpVenda_SubGrupo: TGroupBox;
    cboSubGrupoVenda: TDBLookupComboBox;
    tbsRanking: TTabSheet;
    grpRankingPeriodo: TGroupBox;
    lblDataInicialRanking: TLabel;
    lblDataFinalRanking: TLabel;
    dtpDataInicialRanking: TDateTimePicker;
    dtpDataFinalRanking: TDateTimePicker;
    grpGrupo_Inventario: TGroupBox;
    Label1: TLabel;
    edtGrupo_Inventario: TEdit;
    edtNomeGrupo_Inventario: TEdit;
    grpSubGrupo_Inventario: TGroupBox;
    Label2: TLabel;
    edtSubgrupo_Inventario: TEdit;
    edtNomeSubGrupo_Inventario: TEdit;
    grpSecao_Inventario: TGroupBox;
    Label3: TLabel;
    edtSecao_Inventario: TEdit;
    edtNomeSecao_Inventario: TEdit;
    tbsEFDControbuicoes: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCSTPIS_Entrada: TEdit;
    edtCSTCOFINS_Entrada: TEdit;
    edtAliqPIS_Entrada: TMaskEdit;
    edtAliqCOFINS_Entrada: TMaskEdit;
    GroupBox5: TGroupBox;
    edtCodigo_Cred: TEdit;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtCSTPIS_Saida: TEdit;
    edtAliqPIS_Saida: TMaskEdit;
    GroupBox8: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtCSTCOFINS_Saida: TEdit;
    edtAliqCOFINS_Saida: TMaskEdit;
    GroupBox9: TGroupBox;
    edtNat_rec: TEdit;
    grpNCM_EFD_Contr: TGroupBox;
    edtNCM_EFD_Ctr: TEdit;
    chkCST_PIS_Saida_SP: TCheckBox;
    chkCST_COFINS_Saida_SP: TCheckBox;
    chkCOD_CRED_SP: TCheckBox;
    chkCST_PIS_Entrada_SP: TCheckBox;
    chkCST_COFINS_Entrada_SP: TCheckBox;
    chkNAT_REC_SP: TCheckBox;
    chkNCM_SP: TCheckBox;
    imgLimparContaCorrente: TImage;
    imgLimparEstadosCidades: TImage;
    grpgrupoRanking: TGroupBox;
    cboGrupoRanking: TDBLookupComboBox;
    imgLimparGrupoRanking: TImage;
    chkExportaRVendaRankingExcel: TCheckBox;
    exlRVendaProdutoGrupo: TEXLReport;
    grpTipoItem: TGroupBox;
    cboTipoItem: TDBLookupComboBox;
    grpVenda_Prod_CFOP: TGroupBox;
    cboCFOPVendaProd: TDBLookupComboBox;
    imgLimparTributacaoVenda: TImage;
    imgLimpaGrupoVenda: TImage;
    imgLimparSubGrupoVenda: TImage;
    imgLimparCFOPVenda: TImage;
    imgLimparTipoItem: TImage;
    tbsCFOP_CFPS: TTabSheet;
    rdgOperacaoEstoqueCFOP: TRadioGroup;
    rdgFinalidadeCFOP: TRadioGroup;
    extRControlePerda: TEXLReport;
    tbsPerdas: TTabSheet;
    grpPeriodoPerdas: TGroupBox;
    lblDataIniPerdas: TLabel;
    lblDataFinPerdas: TLabel;
    dtpDataIniPerdas: TDateTimePicker;
    dtpDataFinPerdas: TDateTimePicker;
    grpFornecedorPerda: TGroupBox;
    lblFornecedorPerda: TLabel;
    edtFornecedorPerda: TEdit;
    edtNomeFornecedorPerda: TEdit;
    procedure lstItensClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure rdpSaldoLojaClick(Sender: TObject);
    procedure edtSaldoDesejadoExit(Sender: TObject);
    procedure edtProdutoIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoIniEnter(Sender: TObject);
    procedure edtProdutoIniExit(Sender: TObject);
    procedure edtProdutoFinExit(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubgrupoExit(Sender: TObject);
    procedure edtSecaoExit(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtSetorBalancaExit(Sender: TObject);
    procedure edtAliquotaICMS_SaidaExit(Sender: TObject);
    procedure edtProdutoIniKeyPress(Sender: TObject; var Key: Char);
    procedure LimparMsgErro;
    procedure edtProdutoFinKeyPress(Sender: TObject; var Key: Char);
    procedure edtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSubgrupoKeyPress(Sender: TObject; var Key: Char);
    procedure imgImprimirClick(Sender: TObject);
    procedure edtSecaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure edtSetorBalancaKeyPress(Sender: TObject; var Key: Char);
    procedure edtAliquotaICMS_SaidaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure cboAnoReferenciaRICloseUp(Sender: TObject);
    procedure grdInventarioDisponivelDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure imgLimparSubGrupoVendaClick(Sender: TObject);
    procedure cboGrupoVendaCloseUp(Sender: TObject);
    procedure edtGrupo_InventarioExit(Sender: TObject);
    procedure edtSubgrupo_InventarioExit(Sender: TObject);
    procedure edtSecao_InventarioExit(Sender: TObject);
    procedure edtGrupo_InventarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSubgrupo_InventarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSecao_InventarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtCSTPIS_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure edtAliqPIS_EntradaKeyPress(Sender: TObject; var Key: Char);
    procedure imgLimparContaCorrenteClick(Sender: TObject);
    procedure imgLimparEstadosCidadesClick(Sender: TObject);
    procedure imgLimparGrupoRankingClick(Sender: TObject);
    procedure imgLimparTipoItemClick(Sender: TObject);
    procedure imgLimparCFOPVendaClick(Sender: TObject);
    procedure imgLimparTributacaoVendaClick(Sender: TObject);
    procedure imgLimpaGrupoVendaClick(Sender: TObject);
    procedure edtFornecedorPerdaKeyPress(Sender: TObject; var Key: Char);
    procedure edtFornecedorPerdaExit(Sender: TObject);
  private
    { Private declarations }
    sFilial:string;
    ifArqIni:TIniFile;
    function Montar_Where(pRelatorio:smallint):string;
    procedure LimparCampos;
    procedure MontarSQL_Produto(pRelatorio:smallint);
    procedure MontarSQL_Movimento(pRelatorio:smallint);
    procedure MontarSQL_Estados;
    procedure MontarSQL_Perdas;
    procedure MontarSQL_Cidades(pEstado:string);
    procedure MontarSQL_Bancos;
    procedure MontarSQL_AdmCartoes(pConta:string);
    procedure MontarSQL_ContaCorrente;
    procedure MontarSQL_CFOP_CFPS(pRelatorio:smallint);
    procedure OcultarAbas;
    procedure ExportarRankingGrupoExcel(pDataSet:TClientDataSet);
    procedure AbrirTabelaCFOP;
    procedure AbrirTabelaGrupos;
    procedure AbrirTabelaAliquotas;
    procedure AbrirTabelaSubGrupo;
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation


{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes, modPesquisaGrupo,
  modPesquisaSecao, modPesquisaSubGrupo, modPesquisaTributacao,
  modPesquisaFornecedorCNPJRSocial, modPesquisaProduto,
  modPesquisaSetorBalanca;

procedure TfrmRelatorios.AbrirTabelaAliquotas;
begin

  dmMProvider.cdsTributacao.Close;
  dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

  dmDBEXMaster.fdqTributacao.SQL.Clear;
  dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
  dmDBEXMaster.fdqTributacao.SQL.Add('ORDER BY NOME');

  dmMProvider.cdsTributacao.Open;
  dmMProvider.cdsTributacao.ProviderName := '';

end;

procedure TfrmRelatorios.AbrirTabelaCFOP;
begin

  dmMProvider.cdsCFOP_CFPS.Close;
  dmMProvider.cdsCFOP_CFPS.ProviderName := 'dspCFOP_CFPS';

  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('SELECT * from cfop ');
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('order by descricao');

  dmMProvider.cdsCFOP_CFPS.Open;
  dmMProvider.cdsCFOP_CFPS.ProviderName := '';

end;

procedure TfrmRelatorios.AbrirTabelaGrupos;
begin

  dmMProvider.cdsGrupo.Close;
  dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';
  dmMSource.dtsGrupo.DataSet        := dmMProvider.cdsGrupo;

  dmDBEXMaster.fdqGrupo.SQL.Clear;
  dmDBEXMaster.fdqGrupo.SQL.Add('SELECT * FROM GRUPO');
  dmDBEXMaster.fdqGrupo.SQL.Add('ORDER BY NOME');

  dmMProvider.cdsGrupo.Open;
  dmMProvider.cdsGrupo.ProviderName := '';

end;

procedure TfrmRelatorios.AbrirTabelaSubGrupo;
begin

  dmMProvider.cdsSubGrupo.Close;
  dmMProvider.cdsSubGrupo.ProviderName := 'dspSubGrupo';

  dmDBEXMaster.fdqSubGrupo.SQL.Clear;
  dmDBEXMaster.fdqSubGrupo.SQL.Add('SELECT * FROM SUBGRUPO');
  dmDBEXMaster.fdqSubGrupo.SQL.Add('WHERE GRUPO = ' + IntToStr(cboGrupoVenda.KeyValue));
  dmDBEXMaster.fdqSubGrupo.SQL.Add('ORDER BY NOME');

  dmMProvider.cdsSubGrupo.Open;
  dmMProvider.cdsSubGrupo.ProviderName := '';

end;

procedure TfrmRelatorios.cboAnoReferenciaRICloseUp(Sender: TObject);
begin

  if cboAnoReferenciaRI.Text <> '' then
  begin

    dmMProvider.cdsRegInventarioP7.Close;
    dmMProvider.cdsRegInventarioP7.ProviderName := 'dspRegInventarioP7';

    dmRelatorios.fdqRegInventarioP7.SQL.Clear;
    dmRelatorios.fdqRegInventarioP7.SQL.Add('select status, inventario, data, anodereferencia, valordoinventario,');
    dmRelatorios.fdqRegInventarioP7.SQL.Add('tipocustoinventario, valorliquidodoinventario, numero_ordem, filial');
    dmRelatorios.fdqRegInventarioP7.SQL.Add('from inventario');
    dmRelatorios.fdqRegInventarioP7.SQL.Add('where status = 1');
    dmRelatorios.fdqRegInventarioP7.SQL.Add('and anodereferencia = ' + QuotedStr(cboAnoReferenciaRI.Text));

    dmMProvider.cdsRegInventarioP7.Open;
    dmMProvider.cdsRegInventarioP7.ProviderName := '';

  end

end;

procedure TfrmRelatorios.cboGrupoVendaCloseUp(Sender: TObject);
begin

  if cboGrupoVenda.Text <> '' then
    AbrirTabelaSubGrupo
  else
    cboSubGrupoVenda.KeyValue := -1;

end;

procedure TfrmRelatorios.edtSecao_InventarioExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtSecao_Inventario.Text)) > 0 then
  begin

    dmMProvider.cdsSecao.Close;
    dmMProvider.cdsSecao.ProviderName := 'dspSecao';

    dmDBEXMaster.fdqSecao.SQL.Clear;
    dmDBEXMaster.fdqSecao.SQL.Add('SELECT * FROM SECAO');
    dmDBEXMaster.fdqSecao.SQL.Add('WHERE SECAO = ' + edtSecao_Inventario.Text);

    dmMProvider.cdsSecao.Open;
    dmMProvider.cdsSecao.ProviderName := '';

    if dmMProvider.cdsSecao.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtSecao_Inventario.SetFocus;
      edtSecao_Inventario.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeSecao_Inventario.Text := dmMProvider.cdsSecaoNOME.Value;

    end;

  end;


end;

procedure TfrmRelatorios.edtSecao_InventarioKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    if length(trim(edtSecao_Inventario.Text)) = 0 then
      edtNomeSecao_Inventario.Clear;

    frmPesquisaSecao     := TfrmPesquisaSecao.Create(self);

    if frmPesquisaSecao.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtSecao_Inventario.Text       := IntToStr(dmMProvider.cdsSecaoSECAO.Value);
      edtNomeSecao_Inventario.Text   := dmMProvider.cdsSecaoNOME.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmRelatorios.edtGrupo_InventarioExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtGrupo_Inventario.Text)) > 0 then
  begin

    dmMProvider.cdsGrupo.Close;
    dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';

    dmDBEXMaster.fdqGrupo.SQL.Clear;
    dmDBEXMaster.fdqGrupo.SQL.Add('SELECT * FROM GRUPO');
    dmDBEXMaster.fdqGrupo.SQL.Add('WHERE GRUPO = ' + edtGrupo_Inventario.Text);

    dmMProvider.cdsGrupo.Open;
    dmMProvider.cdsGrupo.ProviderName := '';

    if dmMProvider.cdsGrupo.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtGrupo_Inventario.SetFocus;
      edtGrupo_Inventario.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeGrupo_Inventario.Text   := dmMProvider.cdsGrupoNOME.Value;

    end;

    dmMProvider.cdsGrupo.Close;

  end
  else
    edtNomeGrupo_Inventario.Clear;

  grpSubGrupo_Inventario.Enabled := edtNomeGrupo_Inventario.Text <> '';
  if grpSubGrupo_Inventario.Enabled then
    edtSubgrupo.SetFocus;

end;

procedure TfrmRelatorios.edtGrupo_InventarioKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    if length(trim(edtGrupo_Inventario.Text)) = 0 then
      edtNomeGrupo_Inventario.Clear;

    frmPesquisaGrupo := TfrmPesquisaGrupo.Create(self);

    if frmPesquisaGrupo.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtGrupo_Inventario.Text       := IntToStr(dmMProvider.cdsGrupoGRUPO.Value);
      edtNomeGrupo_Inventario.Text   := dmMProvider.cdsGrupoNOME.Value;

    end;

    dmMProvider.cdsGrupo.Close;

  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;


end;

procedure TfrmRelatorios.edtAliqPIS_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := '.';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmRelatorios.edtAliquotaICMS_SaidaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtAliquotaICMS_Saida.Text)) > 0 then
  begin

    dmMProvider.cdsTributacao.Close;
    dmMProvider.cdsTributacao.ProviderName := 'dspAliquotasICMS';

    dmDBEXMaster.fdqTributacao.SQL.Clear;
    dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
    dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + edtAliquotaICMS_Saida.Text);

    dmMProvider.cdsTributacao.Open;
    dmMProvider.cdsTributacao.ProviderName := '';

    if dmMProvider.cdsTributacao.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtAliquotaICMS_Saida.SetFocus;
      edtAliquotaICMS_Saida.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeAliquotaS.Text := dmMProvider.cdsTributacaoNOME.Value;

    end;

  end;

end;

procedure TfrmRelatorios.edtAliquotaICMS_SaidaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaTributacao     := TfrmPesquisaTributacao.Create(self);

    if length(trim(edtAliquotaICMS_Saida.Text)) = 0 then
      edtNomeAliquotaS.Clear;

    if frmPesquisaTributacao.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtAliquotaICMS_Saida.Text  := IntToStr(dmMProvider.cdsTributacaoTRIBUTACAO.Value);
      edtNomeAliquotaS.Text       := dmMProvider.cdsTributacaoNOME.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;
end;

procedure TfrmRelatorios.edtCSTPIS_EntradaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmRelatorios.edtFornecedorExit(Sender: TObject);
begin

{  MudarCorEdit(Sender);

  if Length(Trim(edtFornecedor.Text)) > 0 then
  begin

    dmDBEXMaster.sqqFornecedor.Close;
    dmDBEXMaster.sqqFornecedor.SQL.Clear;
    dmDBEXMaster.sqqFornecedor.SQL.Add('SELECT * FROM FORNECEDOR');
    dmDBEXMaster.sqqFornecedor.SQL.Add('WHERE FORNECEDOR = ' + edtFornecedor.Text);
    dmDBEXMaster.sqqFornecedor.Open;

    if dmDBEXMaster.sqqFornecedor.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtFornecedor.SetFocus;
      edtFornecedor.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeFornecedor.Text   := dmDBEXMaster.sqqFornecedor.FieldByName('RAZAOSOCIAL').Value;

    end;

    dmDBEXMaster.sqqFornecedor.Close;

  end
  else
    edtNomeFornecedor.Clear;
}
end;

procedure TfrmRelatorios.edtFornecedorKeyPress(Sender: TObject; var Key: Char);
begin

  //codigo provisorio ate migra��o total para dmcdsmaster;
//  dmMSource.dtsFornecedor.DataSet := dmCDSMaster.cdsFornecedor;

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaFornecedor     := TfrmPesquisaFornecedor.Create(self);

    frmPesquisaFornecedor.edtNomeRSocial.ReadOnly := False;

    if length(trim(edtFornecedor.Text)) = 0 then
      edtNomeFornecedor.Clear;

    if frmPesquisaFornecedor.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtFornecedor.Text       := IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value);
      edtNomeFornecedor.Text   := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;
end;

procedure TfrmRelatorios.edtFornecedorPerdaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMsgErro;

  if Length(Trim(edtFornecedorPerda.Text)) > 0 then
  begin

    dmMProvider.cdsFornecedor.Close;
    dmMProvider.cdsFornecedor.ProviderName := 'dspFornecedor';

    dmDBEXMaster.fdqFornecedor.SQL.Clear;
    dmDBEXMaster.fdqFornecedor.SQL.Add('SELECT * FROM FORNECEDOR');
    dmDBEXMaster.fdqFornecedor.SQL.Add('WHERE FORNECEDOR = ' + edtFornecedorPerda.Text);

    dmMProvider.cdsFornecedor.Open;
    dmMProvider.cdsFornecedor.ProviderName := '';

    if dmMProvider.cdsFornecedor.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtFornecedorPerda.SetFocus;
      edtFornecedorPerda.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeFornecedorPerda.Text   := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;

    end;


  end
  else
    edtNomeFornecedorPerda.Clear;

end;

procedure TfrmRelatorios.edtFornecedorPerdaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaFornecedor     := TfrmPesquisaFornecedor.Create(self);

    frmPesquisaFornecedor.edtNomeRSocial.ReadOnly := False;

    if length(trim(edtFornecedor.Text)) = 0 then
      edtNomeFornecedor.Clear;

    if frmPesquisaFornecedor.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtFornecedorPerda.Text       := IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value);
      edtNomeFornecedorPerda.Text   := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmRelatorios.edtGrupoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtGrupo.Text)) > 0 then
  begin

    dmMProvider.cdsGrupo.Close;
    dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';

    dmDBEXMaster.fdqGrupo.SQL.Clear;
    dmDBEXMaster.fdqGrupo.SQL.Add('SELECT * FROM GRUPO');
    dmDBEXMaster.fdqGrupo.SQL.Add('WHERE GRUPO = ' + edtGrupo.Text);

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
      edtNomeGrupo.Text   := dmMProvider.cdsGrupoNOME.Value;

    end;

    dmMProvider.cdsGrupo.Close;

  end
  else
    edtNomeGrupo.Clear;

  grpSubgrupo.Enabled := edtNomeGrupo.Text <> '';
  if grpSubgrupo.Enabled then
    edtSubgrupo.SetFocus;
end;

procedure TfrmRelatorios.edtGrupoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaGrupo := TfrmPesquisaGrupo.Create(self);

    if frmPesquisaGrupo.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtGrupo.Text       := IntToStr(dmMProvider.cdsGrupoGRUPO.Value);
      edtNomeGrupo.Text   := dmMProvider.cdsGrupoNOME.Value;

    end;

    dmMProvider.cdsGrupo.Close;

  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmRelatorios.edtProdutoFinExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtProdutoFin.Text)) > 0 then
  begin

    dmMProvider.cdsProdutos.Close;
    dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

    dmDBEXMaster.fdqProdutos.SQL.Clear;
    dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRODUTO, DESCRICAO FROM PRODUTO');
    dmDBEXMaster.fdqProdutos.SQL.Add('WHERE PRODUTO = ' + edtProdutoFin.Text);

    dmMProvider.cdsProdutos.Open;
    dmMProvider.cdsProdutos.ProviderName := '';

    if dmMProvider.cdsProdutos.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
      edtProdutoFin.SetFocus;

    end
    else
    begin

      edtNomeProdutoFin.Text  := dmMProvider.cdsProdutosDESCRICAO.Value;
      LimparMsgErro;

    end;

    dmMProvider.cdsProdutos.Close;

  end
  else
    edtNomeProdutoFin.Clear;

end;

procedure TfrmRelatorios.edtProdutoFinKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(key) = 'C' then
  begin

    Key := #0;

    frmPesquisaProduto := TfrmPesquisaProduto.Create(self);

    if frmPesquisaProduto.ShowModal = mrOk then
    begin

      edtProdutoFin.Text      := IntToStr(dmMProvider.cdsProdutosPRODUTO.Value);
      edtNomeProdutoFin.Text  := dmMProvider.cdsProdutosDESCRICAO.Value;

    end;

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmRelatorios.edtProdutoIniEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmRelatorios.edtProdutoIniExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtProdutoIni.Text)) > 0 then
  begin

    dmMProvider.cdsProdutos.Close;
    dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

    dmDBEXMaster.fdqProdutos.SQL.Clear;
    dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRODUTO, DESCRICAO FROM PRODUTO');
    dmDBEXMaster.fdqProdutos.SQL.Add('WHERE PRODUTO = ' + edtProdutoIni.Text);

    dmMProvider.cdsProdutos.Open;
    dmMProvider.cdsProdutos.ProviderName := '';

    if dmMProvider.cdsProdutos.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
      edtProdutoIni.SetFocus;

    end
    else
    begin

      edtNomeProdutoIni.Text  := dmMProvider.cdsProdutosDESCRICAO.Value;
      LimparMsgErro;

    end;

  end
  else
    edtNomeProdutoIni.Clear;

end;

procedure TfrmRelatorios.edtProdutoIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TfrmRelatorios.edtProdutoIniKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(key) = 'C' then
  begin

    Key := #0;

    frmPesquisaProduto := TfrmPesquisaProduto.Create(self);

    if frmPesquisaProduto.ShowModal = mrOk then
    begin

      edtProdutoIni.Text      := IntToStr(dmMProvider.cdsProdutosPRODUTO.Value);
      edtNomeProdutoIni.Text  := dmMProvider.cdsProdutosDESCRICAO.Value;

    end;

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;
end;

procedure TfrmRelatorios.edtSaldoDesejadoExit(Sender: TObject);
begin

  MudarCorEdit(edtSaldoDesejado);

end;

procedure TfrmRelatorios.edtSecaoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtSecao.Text)) > 0 then
  begin

    dmMProvider.cdsSecao.Close;
    dmMProvider.cdsSecao.ProviderName := 'dspSecao';

    dmDBEXMaster.fdqSecao.SQL.Clear;
    dmDBEXMaster.fdqSecao.SQL.Add('SELECT * FROM SECAO');
    dmDBEXMaster.fdqSecao.SQL.Add('WHERE SECAO = ' + edtSecao.Text);

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
      edtNomeSecao.Text := dmMProvider.cdsSecaoNOME.Value;

    end;

  end;

end;

procedure TfrmRelatorios.edtSecaoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaSecao     := TfrmPesquisaSecao.Create(self);

    if length(trim(edtSecao.Text)) = 0 then
      edtNomeSecao.Clear;

    if frmPesquisaSecao.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtSecao.Text       := IntToStr(dmMProvider.cdsSecaoSECAO.Value);
      edtNomeSecao.Text   := dmMProvider.cdsSecaoNOME.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;
end;

procedure TfrmRelatorios.edtSetorBalancaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtSetorBalanca.Text)) > 0 then
  begin

    dmMProvider.cdsSetorBalanca.Close;
    dmMProvider.cdsSetorBalanca.ProviderName := 'dspSetorBalanca';

    dmDBEXMaster.fdqSetorBalanca.SQL.Clear;
    dmDBEXMaster.fdqSetorBalanca.SQL.Add('SELECT * FROM SETORDEBALANCA');
    dmDBEXMaster.fdqSetorBalanca.SQL.Add('WHERE SETOR = ' + edtSetorBalanca.Text);

    dmMProvider.cdsSetorBalanca.Open;
    dmMProvider.cdsSetorBalanca.ProviderName := '';


    if dmMProvider.cdsSetorBalanca.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtSetorBalanca.SetFocus;
      edtSetorBalanca.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeSetorBalanca.Text := dmMProvider.cdsSetorBalancaNOME.Value;

    end;

  end;

end;

procedure TfrmRelatorios.edtSetorBalancaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaSetorBalanca     := TfrmPesquisaSetorBalanca.Create(self);

    if length(trim(edtSetorBalanca.Text)) = 0 then
      edtNomeSetorBalanca.Clear;

    if frmPesquisaSetorBalanca.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtSetorBalanca.Text       := IntToStr(dmMProvider.cdsSetorBalancaSETOR.Value);
      edtNomeSetorBalanca.Text   := dmMProvider.cdsSetorBalancaNOME.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;
end;

procedure TfrmRelatorios.edtSubgrupoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtSubgrupo.Text)) > 0 then
  begin

    dmMProvider.cdsSubGrupo.Close;
    dmMProvider.cdsSubGrupo.ProviderName := 'dspSubGrupo';

    dmDBEXMaster.fdqSubGrupo.SQL.Clear;
    dmDBEXMaster.fdqSubGrupo.SQL.Add('SELECT * FROM SUBGRUPO');
    dmDBEXMaster.fdqSubGrupo.SQL.Add('WHERE SUBGRUPO = ' + edtSubgrupo.Text);

    dmMProvider.cdsSubGrupo.Open;
    dmMProvider.cdsSubGrupo.ProviderName := '';


    if dmMProvider.cdsSubGrupo.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtSubgrupo.SetFocus;
      edtSubgrupo.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeSubGrupo.Text := dmMProvider.cdsSubGrupoNOME.Value;

    end;

  end;

end;

procedure TfrmRelatorios.edtSubgrupoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    frmPesquisaSubGrupo     := TfrmPesquisaSubGrupo.Create(self);
    frmPesquisaSubGrupo.Tag := StrToInt(edtGrupo.Text);

    if length(trim(edtSubgrupo.Text)) = 0 then
      edtNomeSubGrupo.Clear;

    if frmPesquisaSubGrupo.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtSubgrupo.Text       := IntToStr(dmMProvider.cdsSubGrupoSUBGRUPO.Value);
      edtNomeSubGrupo.Text   := dmMProvider.cdsSubGrupoNOME.Value;

    end
  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmRelatorios.edtSubgrupo_InventarioExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if Length(Trim(edtSubgrupo_Inventario.Text)) > 0 then
  begin

    dmMProvider.cdsSubGrupo.Close;
    dmMProvider.cdsSubGrupo.ProviderName := 'dspSubGrupo';

    dmDBEXMaster.fdqSubGrupo.SQL.Clear;
    dmDBEXMaster.fdqSubGrupo.SQL.Add('SELECT * FROM SUBGRUPO');
    dmDBEXMaster.fdqSubGrupo.SQL.Add('WHERE SUBGRUPO = ' + edtSubgrupo_Inventario.Text);

    dmMProvider.cdsSubGrupo.Open;
    dmMProvider.cdsSubGrupo.ProviderName := '';

    if dmMProvider.cdsSubGrupo.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtSubgrupo_Inventario.SetFocus;
      edtSubgrupo_Inventario.SelectAll;

    end
    else
    begin

      LimparMsgErro;
      edtNomeSubGrupo_Inventario.Text := dmMProvider.cdsSubGrupoNOME.Value;

    end;

  end;

end;

procedure TfrmRelatorios.edtSubgrupo_InventarioKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if UpperCase(Key)  = 'C' then
  begin

    Key := #0;

    if length(trim(edtSubgrupo_Inventario.Text)) = 0 then
      edtNomeSubGrupo_Inventario.Clear;

    frmPesquisaSubGrupo     := TfrmPesquisaSubGrupo.Create(self);
    frmPesquisaSubGrupo.Tag := StrToInt(edtGrupo.Text);

    if frmPesquisaSubGrupo.ShowModal = mrOk then
    begin

      LimparMsgErro;
      edtSubgrupo_Inventario.Text       := IntToStr(dmMProvider.cdsSubGrupoSUBGRUPO.Value);
      edtNomeSubGrupo_Inventario.Text   := dmMProvider.cdsSubGrupoNOME.Value;

    end

  end

  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;


end;

procedure TfrmRelatorios.edtValorEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmRelatorios.edtValorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmRelatorios.ExportarRankingGrupoExcel(pDataSet: TClientDataSet);
begin
  exlRVendaProdutoGrupo.Show;
end;

procedure TfrmRelatorios.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  ifArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  // inicializa variaveis

  Formatar_Variaveis;

  Caption                   := Application.Title + ' - ' + RetornarVersao(Application.ExeName, 1);
  Color                     := COR_PADRAO_TELAS;

  dmDBEXMaster.sNomeUsuario := 'SYSDBA';//ParamStr(1);
  dmDBEXMaster.sSenha       := 'masterkey';//ParamStr(2);
  dmDBEXMaster.iIdUsuario   := 999999;//StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := 1;//StrToInt(ParamStr(4));

  dmMProvider.cdsFilial.Close;
  dmMProvider.cdsFilial.ProviderName := 'dspFilial';

  dmDBEXMaster.fdqFilial.SQL.Clear;
  dmDBEXMaster.fdqFilial.SQL.Add('SELECT fil.*, (select nome as nome_cidade from cidades where cidade = fil.cidade) FROM FILIAL fil');
  dmDBEXMaster.fdqFilial.SQL.Add('WHERE fil.FILIAL = ' + InttoStr(dmDBEXMaster.iIdFilial));

  dmMProvider.cdsFilial.Open;
  dmMProvider.cdsFilial.ProviderName := '';

  sFilial                     := dmMProvider.cdsFilialRAZAOSOCIAL.Value;
  dmDBEXMaster.iIdFilial      := dmMProvider.cdsFilialFILIAL.Value;
  OcultarAbas;

  for i := 0 to lstItens.Groups.Count - 1 do
    lstItens.Groups[i].State := [lgsCollapsible, lgsCollapsed];

  for i := 0 to 200 do
    cboAnoReferenciaRI.Items.Add(IntToStr(2000 + i));

  chkExportaRVendaRankingExcel.Enabled := IsObjetoInstalado('Excel.Application');

end;

procedure TfrmRelatorios.grdInventarioDisponivelDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not odd(dmMProvider.cdsRegInventarioP7.RecNo) then
  begin

    grdInventarioDisponivel.Canvas.Font.Color   := clBlack;
    grdInventarioDisponivel.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

  end
  else
  begin

    grdInventarioDisponivel.Canvas.Font.Color   := clBlack;
    grdInventarioDisponivel.Canvas.Brush.Color  := clWhite;

  end;

  grdInventarioDisponivel.Canvas.FillRect(Rect);
  grdInventarioDisponivel.DefaultDrawDataCell(Rect,Column.Field,State);

end;

procedure TfrmRelatorios.imgLimpaGrupoVendaClick(Sender: TObject);
begin

  cboGrupoVenda.KeyValue    := -1;
  cboSubGrupoVenda.KeyValue := -1;
  dmMProvider.cdsSubGrupo.Close;

end;

procedure TfrmRelatorios.imgLimparCFOPVendaClick(Sender: TObject);
begin

  cboCFOPVendaProd.KeyValue := -1;

end;

procedure TfrmRelatorios.imgLimparContaCorrenteClick(Sender: TObject);
begin

  cboContaCorrente.KeyValue := '';

end;

procedure TfrmRelatorios.imgLimparEstadosCidadesClick(Sender: TObject);
begin

  cboEstadosCidades.KeyValue := '';

end;

procedure TfrmRelatorios.imgLimparGrupoRankingClick(Sender: TObject);
begin

  cboGrupoRanking.KeyValue := -1;

end;

procedure TfrmRelatorios.imgLimparTipoItemClick(Sender: TObject);
begin

  cboTipoItem.KeyValue := -1;

end;

procedure TfrmRelatorios.imgLimparTributacaoVendaClick(Sender: TObject);
begin

  cboTributacao.KeyValue := -1;

end;

procedure TfrmRelatorios.imgImprimirClick(Sender: TObject);
var
  sWhere:string;
begin

  lblMsg.Caption := 'Aguarde....gerando relat�rio';
  Application.ProcessMessages;

  dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;

  case pgcFiltro.Tag of
    ord(rlEstados):begin

                      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
                      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsEstados;

                      MontarSQL_Estados;

                      LimparMsgErro;

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptEstados',true);
                        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;
                        LimparCampos;

                      end
                      else
                        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                        + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);


                   end;
    ord(rlCidades):begin

                      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
                      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsCidades;

                      if cboEstadosCidades.Text <> '' then
                        MontarSQL_Cidades(cboEstadosCidades.KeyValue)
                      else
                        MontarSQL_Cidades('');

                      LimparMsgErro;

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptCidades',true);
                        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;
                        LimparCampos;

                      end
                      else
                        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                        + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                   end;
     ord(rlBancos):begin

                      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
                      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsBancos;

                      MontarSQL_Bancos;

                      LimparMsgErro;

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptBancos',true);
                        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;
                        LimparCampos;

                      end
                      else
                        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                        + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                   end;
    ord(rlRelCFOP):begin

                      dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsCFOP_CFPS;

                      MontarSQL_CFOP_CFPS(ord(rlRelCFOP));

                      LimparMsgErro;

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\\Relatorios_Diversos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\\Relatorios_Diversos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptCfop',true);
                        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;
                        LimparCampos;

                      end
                      else
                        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                        + ExtractFilePath(Application.ExeName)+'Rav\\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                   end;

  end;

  case tbsPerdas.Tag of
    ord(rlControlePerda):begin

                          MontarSQL_Perdas;

                          dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsRControlePerda;

                          LimparMsgErro;

                          if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Perdas.rav') then
                          begin

                            dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Perdas.rav';
                            dmRelatorios.rvpGenesisAC.SelectReport('rptControlePerda',false);
                            dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                            dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                            dmRelatorios.rvpGenesisAC.SetParam('pBairro','Per�odo entre ' + FormatDateTime('dd/mm/yyyy', dtpDataIniPerdas.Date) + ' e ' + FormatDateTime('dd/mm/yyyy', dtpDataFinPerdas.Date));
                            dmRelatorios.rvpGenesisAC.Execute;
                            dmRelatorios.rvpGenesisAC.Close;
                            LimparCampos;

                            tbsPerdas.Tag := -1;

                          end
                          else
                            Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                            + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Perdas.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                         end;


  end;

  case tbsRelProdutos.Tag of

    ord(rlTabPreco):begin

                      dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsProdutos;

                      MontarSQL_Produto(ord(rlTabPreco));

                      LimparMsgErro;

                      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav') then
                      begin

                        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav';
                        dmRelatorios.rvpGenesisAC.SelectReport('rptTabPreco',true);
                        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                        dmRelatorios.rvpGenesisAC.Execute;
                        dmRelatorios.rvpGenesisAC.Close;
                        LimparCampos;

                      end
                      else
                        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                        + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);



                    end;
    ord(rlTabProdutoPromocao):begin

                                MontarSQL_Produto(ord(rlTabProdutoPromocao));

                                LimparMsgErro;

                                if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav') then
                                begin

                                  dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav';
                                  dmRelatorios.rvpGenesisAC.SetParam('P_NOME_LOJA',sFilial);
                                  dmRelatorios.rvpGenesisAC.SetParam('P_LOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                                  dmRelatorios.rvpGenesisAC.SetParam('P_TITULO_RELATORIO','LISTAGEM DE PRODUTOS E PROMO��O');
                                  dmRelatorios.rvpGenesisAC.Open;
                                  dmRelatorios.rvpGenesisAC.ExecuteReport('rptTab_Promocao');
                                  dmRelatorios.rvpGenesisAC.Close;

                                  LimparCampos;

                                end
                                else
                                  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                  + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                              end;

    ord(rlApoioPromocao):begin


                          MontarSQL_Produto(ord(rlApoioPromocao));

                          LimparMsgErro;

                          if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav') then
                          begin

                            dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav';
                            dmRelatorios.rvpGenesisAC.SetParam('P_NOME_LOJA',sFilial);
                            dmRelatorios.rvpGenesisAC.SetParam('P_LOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                            dmRelatorios.rvpGenesisAC.SetParam('P_TITULO_RELATORIO','LISTAGEM DE PROMO��ES ATIVAS');
                            dmRelatorios.rvpGenesisAC.Open;
                            dmRelatorios.rvpGenesisAC.ExecuteReport('rptTab_Promocao');
                            dmRelatorios.rvpGenesisAC.Close;
                            LimparCampos;

                          end
                          else
                            Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                              + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                         end;
    ord(rlApoioInvetario):begin


                            MontarSQL_Produto(ord(rlApoioInvetario));

                            LimparMsgErro;

                            if FileExists(ExtractFilePath(Application.ExeName)+'Rav\RAInventario.rav') then
                            begin

                              dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\RAInventario.rav';
                              dmRelatorios.rvpGenesisAC.Open;
                              dmRelatorios.rvpGenesisAC.SetParam('P_NOME_LOJA',sFilial);
                              dmRelatorios.rvpGenesisAC.SetParam('P_LOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                              dmRelatorios.rvpGenesisAC.SetParam('P_VALOR_TOTAL','0');
                              dmRelatorios.rvpGenesisAC.ExecuteReport('rptApoioInventario');
                              dmRelatorios.rvpGenesisAC.Close;
                              LimparCampos;

                            end
                            else
                              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                + ExtractFilePath(Application.ExeName)+'Rav\RAInventario.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                          end;
  end;

  case tbsRegistroInventario.Tag of

      ord(rlRegistroInventaroP7):begin

                                    dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 156.6;

                                    dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsItemRegInventP7;

                                    MontarSQL_Produto(ord(rlRegistroInventaroP7));

                                    LimparMsgErro;

                                    if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav') then
                                    begin

                                      dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav';
                                      dmRelatorios.rvpGenesisAC.SetParam('pDATA',FormatDateTime('dd/mm/yyyy',dmMProvider.cdsRegInventarioP7DATA.Value));
                                      dmRelatorios.rvpGenesisAC.SetParam('pNUMERO_ORDEM',FormatFloat('000',dmMProvider.cdsRegInventarioP7NUMERO_ORDEM.Value));
                                      dmRelatorios.rvpGenesisAC.SetParam('pRAZAO_SOCIAL',sFilial);
                                      dmRelatorios.rvpGenesisAC.SetParam('pENDERECO',dmMProvider.cdsFilialENDERECO.Value);
                                      dmRelatorios.rvpGenesisAC.SetParam('pBAIRRO',dmMProvider.cdsFilialBAIRRO.Value);
                                      dmRelatorios.rvpGenesisAC.SetParam('pTOTAL_INVENTARIO',FormatFloat('#,##0.00',dmMProvider.cdsRegInventarioP7VALORLIQUIDODOINVENTARIO.Value));

                                      dmRelatorios.rvpGenesisAC.SetParam('pMUNICIPIO',dmMProvider.cdsFilialNOME_CIDADE.Value);

                                      dmRelatorios.rvpGenesisAC.SetParam('pESTADO',dmMProvider.cdsFilialESTADO.Value);
                                      dmRelatorios.rvpGenesisAC.SetParam('pINSCRICAO_ESTADUAL',dmMProvider.cdsFilialINSCRICAO.Value);
                                      dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsFilialCNPJ.Value));
                                      dmRelatorios.rvpGenesisAC.SetParam('pREGISTRO_JUNTA',dmMProvider.cdsFilialREGISTROJUNTACOMERCIAL.Value);
                                      dmRelatorios.rvpGenesisAC.SelectReport('rptInventarioP7',true);
                                      dmRelatorios.rvpGenesisAC.Execute;
                                      dmRelatorios.rvpGenesisAC.Close;
                                      LimparCampos;

                                  end
                                  else
                                    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                    + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);



                      end;
  end;



  case tbsMovimento.Tag of
    ord(rlVendaTributacao):begin

                                  dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor := 158.6;
//                                  dmRelatorios.rvdGenesis.DataSet := dmRelatorios.cdsVendaPisCofins;

                                  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\RelVendas.rav') then
                                  begin

                                    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\RelVendas.rav';
                                    dmRelatorios.rvpGenesisAC.SelectReport('rptVendaTributacao',true);
                                    dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                                    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                                    dmRelatorios.rvpGenesisAC.SetParam('pPERIODO','Per�odo ' + FormatDateTime('dd/mm/yyyy', dtpDataInicialPISCOFINS.DateTime)
                                                                                           + ' a ' + FormatDateTime('dd/mm/yyyy', dtpDataFinalPISCOFINS.DateTime));
                                    dmRelatorios.rvpGenesisAC.Execute;
                                    dmRelatorios.rvpGenesisAC.Close;
                                    LimparCampos;

                                  end
                                  else
                                    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                    + ExtractFilePath(Application.ExeName)+'Rav\RelVendas.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);
                                  end;
    ord(rlVendaProdutoCFOP):begin

                                  dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor := 128.6;
                                  dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsVendaProdCFOP;

                                  MontarSQL_Movimento(ord(rlVendaProdutoCFOP));

                                  LimparMsgErro;

                                  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatatorio_Movimento.rav') then
                                  begin

                                    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatatorio_Movimento.rav';
                                    dmRelatorios.rvpGenesisAC.SelectReport('rptVendaProdCFOP',true);
                                    dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                                    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                                    dmRelatorios.rvpGenesisAC.SetParam('pPERIODO','Per�odo ' + FormatDateTime('dd/mm/yyyy', dtpDataInicialPISCOFINS.DateTime)
                                                                                           + ' a ' + FormatDateTime('dd/mm/yyyy', dtpDataFinalPISCOFINS.DateTime));
                                    dmRelatorios.rvpGenesisAC.Execute;
                                    dmRelatorios.rvpGenesisAC.Close;
                                    LimparCampos;

                                  end
                                  else
                                    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                    + ExtractFilePath(Application.ExeName)+'Rav\Relatatorio_Movimento.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);
                                  end;
    ord(rlCompraProdutoCFOP):begin

                                  dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor := 128.6;
                                  dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsCompraProdCFOP;

                                  MontarSQL_Movimento(ord(rlCompraProdutoCFOP));

                                  LimparMsgErro;

                                  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatatorio_Movimento.rav') then
                                  begin

                                    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatatorio_Movimento.rav';
                                    dmRelatorios.rvpGenesisAC.SelectReport('rptCompraProdCFOP',true);
                                    dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                                    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                                    dmRelatorios.rvpGenesisAC.SetParam('pPERIODO','Per�odo ' + FormatDateTime('dd/mm/yyyy', dtpDataInicialPISCOFINS.DateTime)
                                                                                           + ' a ' + FormatDateTime('dd/mm/yyyy', dtpDataFinalPISCOFINS.DateTime));
                                    dmRelatorios.rvpGenesisAC.Execute;
                                    dmRelatorios.rvpGenesisAC.Close;
                                    LimparCampos;

                                  end
                                  else
                                    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                    + ExtractFilePath(Application.ExeName)+'Rav\Relatatorio_Movimento.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);
                                  end;
  end;

  case tbsRanking.Tag of
    ord(rlVendaProdutoGrupo):begin

                                  dmMProvider.cdsVendaRankingGrupo.Close;
                                  dmMProvider.cdsVendaRankingGrupo.ProviderName := 'dspVendaRankingGrupo';

                                  dmRelatorios.fdqVendaRankingGrupo.Params[0].Value := dtpDataInicialRanking.Date;
                                  dmRelatorios.fdqVendaRankingGrupo.Params[1].Value := dtpDataFinalRanking.Date;
                                  dmRelatorios.fdqVendaRankingGrupo.Params[2].Value := cboGrupoRanking.KeyValue;
                                  dmRelatorios.fdqVendaRankingGrupo.Params[3].Value := 0;

                                  dmMProvider.cdsVendaRankingGrupo.Open;
                                  dmMProvider.cdsVendaRankingGrupo.ProviderName := '';

                                  dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor := 158.6;

                                  dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsVendaRankingGrupo;

                                  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\RelVendas.rav') then
                                  begin

                                    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\RelVendas.rav';
                                    dmRelatorios.rvpGenesisAC.SelectReport('rptRankingProdutoGrupo',true);
                                    dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);

                                    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
//                                    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ifArqIni.ReadString('ConfDANFE', 'LogoMarca', ''));
                                    dmRelatorios.rvpGenesisAC.SetParam('pPERIODO','Per�odo ' + FormatDateTime('dd/mm/yyyy', dtpDataInicialRanking.DateTime)
                                                                                           + ' a ' + FormatDateTime('dd/mm/yyyy', dtpDataFinalRanking.DateTime));
                                    dmRelatorios.rvpGenesisAC.SetParam('pID_SISTEMA',ID_SISTEMA);
                                    dmRelatorios.rvpGenesisAC.SetParam('pID_RELATORIO','rptRankingProdutoGrupo');

                                    LimparMsgErro;
                                    dmRelatorios.rvpGenesisAC.Execute;
                                    dmRelatorios.rvpGenesisAC.Close;
                                    LimparCampos;

                                    if chkExportaRVendaRankingExcel.Checked then
                                    begin

                                      exlRVendaProdutoGrupo.Template := ExtractFilePath(Application.ExeName)+'Template\RVendaProdutoGrupo.xls';
                                      exlRVendaProdutoGrupo.DataSet  := dmMProvider.cdsVendaRankingGrupo;
                                      ExportarRankingGrupoExcel(dmMProvider.cdsVendaRankingGrupo);

                                    end;

                                  end
                                  else
                                    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                    + ExtractFilePath(Application.ExeName)+'Rav\RelVendas.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);
                                  end;
  end;
  case tbsContaCorrente.Tag of
    ord(rlAdmCartoes):begin

                          dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor := 126.4;
                          dmRelatorios.rvdGenesis.DataSet                    := dmMProvider.cdsAdmCartoes;

                          if cboContaCorrente.Text <> '' then
                            MontarSQL_AdmCartoes(cboContaCorrente.KeyValue)
                          else
                            MontarSQL_AdmCartoes('');

                          LimparMsgErro;

                          if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
                          begin

                            dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
                            dmRelatorios.rvpGenesisAC.SelectReport('rptAdmCartoes',True);
                            dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',sFilial);
                            dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                            dmRelatorios.rvpGenesisAC.Execute;
                            dmRelatorios.rvpGenesisAC.Close;
                            LimparCampos;

                          end
                          else
                            Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                              + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

                      end;
  end;

  case tbsEFDControbuicoes.Tag of
    ord(rlEFDContribuicoes):begin

                              MontarSQL_Produto(ord(rlEFDContribuicoes));

                              LimparMsgErro;

                              if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav') then
                              begin

                                dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsApoioEFDContr;

                                dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav';
                                dmRelatorios.rvpGenesisAC.Open;
                                dmRelatorios.rvpGenesisAC.SetParam('P_NOME_LOJA',sFilial);
                                dmRelatorios.rvpGenesisAC.SetParam('P_LOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
                                dmRelatorios.rvpGenesisAC.ExecuteReport('rptApoioEFDContribucoes');
                                dmRelatorios.rvpGenesisAC.Close;
                                LimparCampos;

                              end
                              else
                                Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                                  + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Produtos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);


                            end;
  end;


end;

procedure TfrmRelatorios.imgLimparSubGrupoVendaClick(Sender: TObject);
begin

  cboSubGrupoVenda.KeyValue := -1;

end;

procedure TfrmRelatorios.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmRelatorios.LimparCampos;
begin

  edtProdutoIni.Clear;
  edtProdutoFin.Clear;
  edtNomeProdutoIni.Clear;
  edtNomeProdutoFin.Clear;
  edtGrupo.Clear;
  edtNomeGrupo.Clear;
  edtSubgrupo.Clear;
  edtNomeSubGrupo.Clear;
  edtSecao.Clear;
  edtNomeSecao.Clear;
  edtSaldoDesejado.Clear;
  edtSaldoDesejado.Clear;

  rdpSaldoLoja.ItemIndex      := -1;
  rdpEnviarBalanca.ItemIndex  := -1;
  rdpAtivo.ItemIndex          := -1;
  rdpVisivel.ItemIndex        := -1;

end;

procedure TfrmRelatorios.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmRelatorios.lstItensClick(Sender: TObject);
begin

  OcultarAbas;

  if lstItens.ItemIndex > -1 then
  begin

    dmMProvider.cdsTipoItem.Close;
    dmMProvider.cdsTipoItem.ProviderName := 'dspTipoItem';

    dmDBEXMaster.fdqTipoItem.SQL.Clear;
    dmDBEXMaster.fdqTipoItem.SQL.Add('select * from tipo_do_item');
    dmDBEXMaster.fdqTipoItem.SQL.Add('order by descricao');

    dmMProvider.cdsTipoItem.Open;
    dmMProvider.cdsTipoItem.ProviderName := '';

    if lstItens.Items[lstItens.ItemIndex].Caption  = 'Tabela de pre�os' then
    begin

      LimparMsgErro;
      tbsRelProdutos.Tag          := ord(rlTabPreco);
      tbsRelProdutos.TabVisible   := True;
      edtProdutoIni.SetFocus;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Tabela de Produtos em promo��o' then
    begin

      tbsRelProdutos.Tag          := ord(rlTabProdutoPromocao);
      imgImprimirClick(Self);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de venda de produto por CFOP' then
    begin

      AbrirTabelaCFOP;
      AbrirTabelaGrupos;
      AbrirTabelaAliquotas;

      tbsMovimento.Tag              := ord(rlVendaProdutoCFOP);
      dtpDataInicialPISCOFINS.Date  := StartOfTheMonth(Date - 30);
      dtpDataFinalPISCOFINS.Date    := EndOfTheMonth(Date - 30);
      tbsMovimento.TabVisible       := True;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de compra de produto por CFOP' then
    begin

      AbrirTabelaCFOP;
      AbrirTabelaGrupos;
      AbrirTabelaAliquotas;

      tbsMovimento.Tag              := ord(rlCompraProdutoCFOP);
      dtpDataInicialPISCOFINS.Date  := StartOfTheMonth(Date - 30);
      dtpDataFinalPISCOFINS.Date    := EndOfTheMonth(Date - 30);
      tbsMovimento.TabVisible       := True;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Listagem de CFOP / CFPS' then
    begin

      pgcFiltro.Tag           := ord(rlRelCFOP);
      tbsCFOP_CFPS.TabVisible := True;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Tabela de Apoio a Promo��o' then
    begin

      tbsRelProdutos.Tag          := ord(rlApoioPromocao);
      imgImprimirClick(Self);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Listagem de Controlede Perdas' then
    begin

      tbsPerdas.Tag           := ord(rlControlePerda);
      dtpDataIniPerdas.Date   := Date;
      dtpDataFinPerdas.Date   := Date;
      tbsPerdas.TabVisible    := True;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de Venda por Grupo' then
    begin

      AbrirTabelaGrupos;

      tbsRanking.Tag                    := ord(rlVendaProdutoGrupo);
      dtpDataInicialRanking.Date        := Date;
      dtpDataFinalRanking.Date          := Date;
      tbsRanking.TabVisible             := True;
      cboGrupoRanking.KeyValue          := -1;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Venda por Tributa��o' then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_MODULO_EM_DESENVOLVIMENTO;
      exit;

      AbrirTabelaCFOP;
      AbrirTabelaAliquotas;
      AbrirTabelaGrupos;

      tbsMovimento.Tag              := ord(rlVendaTributacao);
      dtpDataInicialPISCOFINS.Date  := StartOfTheMonth(Date - 30);
      dtpDataFinalPISCOFINS.Date    := EndOfTheMonth(Date - 30);
      tbsMovimento.TabVisible       := True;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Tabela de Apoio ao Invent�rio' then
    begin

      LimparMsgErro;
      tbsRelProdutos.Tag          := ord(rlApoioInvetario);
      tbsRelProdutos.TabVisible   := True;
      edtProdutoIni.SetFocus;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de Estados' then
    begin

      LimparMsgErro;
      pgcFiltro.Tag               := ord(rlEstados);

      imgImprimirClick(Self);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de Cidades' then
    begin

      LimparMsgErro;
      MontarSQL_Estados;
      tbsCidades.TabVisible       := True;
      pgcFiltro.Tag               := ord(rlCidades);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de Bancos' then
    begin

      LimparMsgErro;
      pgcFiltro.Tag               := ord(rlBancos);
      imgImprimirClick(Self);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de Administradoras de cart�es' then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_MODULO_EM_DESENVOLVIMENTO;
      exit;

      MontarSQL_ContaCorrente;
      LimparMsgErro;
      tbsContaCorrente.Caption    := 'Administradoras/Conta corrente';
      tbsContaCorrente.TabVisible := True;
      tbsContaCorrente.Tag        := ord(rlAdmCartoes);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Registro de Invent�rio P7' then
    begin

      LimparMsgErro;
      tbsRegistroInventario.TabVisible  := True;
      tbsRegistroInventario.Tag         := ord(rlRegistroInventaroP7);

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Livro Registro de Invent�rio P7' then
    begin

      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Modelo_Livros_Fiscais.rav') then
      begin

        dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Modelo_Livros_Fiscais.rav';
        dmRelatorios.rvpGenesisAC.SelectReport('rptModeloLivroRI_P7',true);
        dmRelatorios.rvpGenesisAC.Execute;
        dmRelatorios.rvpGenesisAC.Close;

      end;

    end
    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'Relat�rio de apoio EFD-Contribui��es' then
    begin

      LimparMsgErro;
      tbsEFDControbuicoes.TabVisible  := True;
      tbsEFDControbuicoes.Tag         := ord(rlEFDContribuicoes);

    end;

  end
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_MODULO_EM_DESENVOLVIMENTO;

end;


procedure TfrmRelatorios.MontarSQL_AdmCartoes(pConta: string);
begin

  dmMProvider.cdsAdmCartoes.Close;
  dmMProvider.cdsAdmCartoes.ProviderName := 'dspAdmCartoes';

  dmDBEXMaster.fdqAdministradoras.SQL.Clear;
  dmDBEXMaster.fdqAdministradoras.SQL.Add('SELECT ADM.ADMINISTRADORA, ADM.NOME, ADM.DESCONTO,');
  dmDBEXMaster.fdqAdministradoras.SQL.Add('ADM.PRAZO, ADM.BANCO, ADM.AGENCIA, ADM.CONTA,');
  dmDBEXMaster.fdqAdministradoras.SQL.Add('CC.TITULAR AS TT FROM ADMINISTRADORAS ADM');
  dmDBEXMaster.fdqAdministradoras.SQL.Add('FULL JOIN CONTACORRENTE CC');
  dmDBEXMaster.fdqAdministradoras.SQL.Add('ON(CC.CONTA = ADM.CONTA)');

  if pConta <> '' then
    dmDBEXMaster.fdqAdministradoras.SQL.Add('WHERE ADM.CONTA = ' + QuotedStr(pConta));

  dmDBEXMaster.fdqAdministradoras.SQL.Add('ORDER BY ADM.CONTA');

  dmMProvider.cdsAdmCartoes.Open;
  dmMProvider.cdsAdmCartoes.ProviderName := '';

end;

procedure TfrmRelatorios.MontarSQL_Bancos;
begin

  dmMProvider.cdsBancos.Close;
  dmMProvider.cdsBancos.ProviderName := 'dspBancos';

  dmDBEXMaster.fdqBancos.SQL.Clear;
  dmDBEXMaster.fdqBancos.SQL.Add('SELECT * FROM BANCOS');
  dmDBEXMaster.fdqBancos.SQL.Add('ORDER BY NOME');

  dmMProvider.cdsBancos.Open;
  dmMProvider.cdsBancos.ProviderName := '';

end;

procedure TfrmRelatorios.MontarSQL_CFOP_CFPS(pRelatorio: smallint);
var
  sWhere :string;
begin

  sWhere := Montar_Where(pRelatorio);

  dmMProvider.cdsCFOP_CFPS.Close;
  dmMProvider.cdsCFOP_CFPS.ProviderName := 'dspCFOP_CFPS';

  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('SELECT * FROM CFOP');
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add(sWhere);
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('ORDER BY DESCRICAO');

  dmMProvider.cdsCFOP_CFPS.Open;
  dmMProvider.cdsCFOP_CFPS.ProviderName := '';

end;

procedure TfrmRelatorios.MontarSQL_Cidades(pEstado: string);
begin

  dmMProvider.cdsCidades.Close;
  dmMProvider.cdsCidades.ProviderName := 'dspCidades';

  dmDBEXMaster.fdqCidades.SQL.Clear;
  dmDBEXMaster.fdqCidades.SQL.Add('SELECT CIDADES.*, ESTADOS.NOME AS NOME_ESTADO FROM CIDADES CIDADES');
  dmDBEXMaster.fdqCidades.SQL.Add('JOIN ESTADOS ESTADOS');
  dmDBEXMaster.fdqCidades.SQL.Add('ON(ESTADOS.SIGLA = CIDADES.ESTADO)');
  if pEstado <> '' then
    dmDBEXMaster.fdqCidades.SQL.Add('WHERE CIDADES.ESTADO = ' + QuotedStr(pEstado));

  dmDBEXMaster.fdqCidades.SQL.Add('ORDER BY CIDADES.ESTADO, CIDADES.NOME');

  dmMProvider.cdsCidades.Open;
  dmMProvider.cdsCidades.ProviderName := '';


end;

procedure TfrmRelatorios.MontarSQL_ContaCorrente;
begin

  dmMProvider.cdsContaCorrente.Close;
  dmMProvider.cdsContaCorrente.ProviderName := 'dspContaCorrente';

  dmDBEXMaster.fdqContaCorrente.SQL.Clear;
  dmDBEXMaster.fdqContaCorrente.SQL.Add('SELECT * FROM CONTACORRENTE');
  dmDBEXMaster.fdqContaCorrente.SQL.Add('ORDER BY TITULAR');

  dmMProvider.cdsContaCorrente.Open;
  dmMProvider.cdsContaCorrente.ProviderName := '';

end;

procedure TfrmRelatorios.MontarSQL_Estados;
begin

  dmMProvider.cdsEstados.Close;
  dmMProvider.cdsEstados.ProviderName := 'dspEstados';

  dmDBEXMaster.fdqEstados.SQL.Clear;
  dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');
  dmDBEXMaster.fdqEstados.SQL.Add('ORDER BY NOME');

  dmMProvider.cdsEstados.Open;
  dmMProvider.cdsEstados.ProviderName := '';

end;

procedure TfrmRelatorios.MontarSQL_Perdas;
begin

  dmMProvider.cdsRControlePerda.Close;
  dmMProvider.cdsRControlePerda.ProviderName := 'dspRControlePerda';

  dmDBEXMaster.fdqRControlePerda.Params[0].Value := dtpDataIniPerdas.Date;
  dmDBEXMaster.fdqRControlePerda.Params[1].Value := dtpDataFinPerdas.Date;

  if Length(Trim(edtFornecedorPerda.Text)) > 0 then
    dmDBEXMaster.fdqRControlePerda.Params[2].Value := StrToInt(edtFornecedorPerda.Text)
  else
    dmDBEXMaster.fdqRControlePerda.Params[2].Value := 0;

  dmMProvider.cdsRControlePerda.Open;
  dmMProvider.cdsRControlePerda.ProviderName := '';

  //compras
  dmRelatorios.cdsMovCompraProd.Close;
  dmRelatorios.cdsMovCompraProd.ProviderName := 'dspMovCompraProd';

  dmRelatorios.fdqMovCompraProd.Params[0].Value := dtpDataIniPerdas.Date;
  dmRelatorios.fdqMovCompraProd.Params[1].Value := dtpDataFinPerdas.Date;

  if Length(Trim(edtFornecedorPerda.Text)) > 0 then
    dmRelatorios.fdqMovCompraProd.Params[2].Value := StrToInt(edtFornecedorPerda.Text)
  else
    dmRelatorios.fdqMovCompraProd.Params[2].Value := 0;

  dmRelatorios.cdsMovCompraProd.Open;
  dmRelatorios.cdsMovCompraProd.ProviderName := '';

  //vendas
  dmRelatorios.cdsMovVendaProd.Close;
  dmRelatorios.cdsMovVendaProd.ProviderName := 'dspMovCompraProd';

  dmRelatorios.fdqMovVendaProd.Params[0].Value := dtpDataIniPerdas.Date;
  dmRelatorios.fdqMovVendaProd.Params[1].Value := dtpDataFinPerdas.Date;

  if Length(Trim(edtFornecedorPerda.Text)) > 0 then
    dmRelatorios.fdqMovVendaProd.Params[2].Value := StrToInt(edtFornecedorPerda.Text)
  else
    dmRelatorios.fdqMovVendaProd.Params[2].Value := 0;

  dmRelatorios.cdsMovVendaProd.Open;
  dmRelatorios.cdsMovVendaProd.ProviderName := '';

end;

procedure TfrmRelatorios.MontarSQL_Produto(pRelatorio: smallint);
var
  sWhere: string;
begin

  FormatSettings.DecimalSeparator := '.';

  case pRelatorio of
    0:begin

        sWhere := Montar_Where(pRelatorio);

        dmMProvider.cdsProdutos.Close;
        dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

        dmDBEXMaster.fdqProdutos.SQL.Clear;
        dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
        dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmDBEXMaster.fdqProdutos.SQL.Add(sWhere);
        dmDBEXMaster.fdqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');

        dmMProvider.cdsProdutos.Open;
        dmMProvider.cdsProdutos.ProviderName := '';

      end;
    1:begin

        sWhere := ' and PF.PROMOCAO = 1';
        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsPromocao;

        dmMProvider.cdsPromocao.Close;
        dmMProvider.cdsPromocao.ProviderName := 'dspPromocao';

        dmRelatorios.fdqPromocao.SQL.Clear;
        dmRelatorios.fdqPromocao.SQL.Add('select prom.*, pro.descricao, pf.promocao,');
        dmRelatorios.fdqPromocao.SQL.Add('pro.descricao from promocao prom');
        dmRelatorios.fdqPromocao.SQL.Add('join produto pro');
        dmRelatorios.fdqPromocao.SQL.Add('on(pro.produto = prom.produto)');
        dmRelatorios.fdqPromocao.SQL.Add('join produtofilial pf');
        dmRelatorios.fdqPromocao.SQL.Add('on(pf.produto = prom.produto)');
        dmRelatorios.fdqPromocao.SQL.Add('where pf.filial = ' + InttoStr(dmDBEXMaster.iIdFilial));
        dmRelatorios.fdqPromocao.SQL.Add(sWhere);
        dmRelatorios.fdqPromocao.SQL.Add('order by pro.descricao');

        dmMProvider.cdsPromocao.Open;
        dmMProvider.cdsPromocao.ProviderName := '';

      end;
    2:begin

        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsPromocao;

        dmMProvider.cdsPromocao.Close;
        dmMProvider.cdsPromocao.ProviderName := 'dspPromocao';

        dmRelatorios.fdqPromocao.SQL.Clear;
        dmRelatorios.fdqPromocao.SQL.Add('select prom.*, pro.descricao from promocao prom');
        dmRelatorios.fdqPromocao.SQL.Add('join produto pro');
        dmRelatorios.fdqPromocao.SQL.Add('on(pro.produto = prom.produto)');
        dmRelatorios.fdqPromocao.SQL.Add('where prom.status = 1');
        dmRelatorios.fdqPromocao.SQL.Add('order by pro.descricao');

        dmMProvider.cdsPromocao.Open;
        dmMProvider.cdsPromocao.ProviderName := '';

      end;
    4:begin//apoio ao inventario

        sWhere := Montar_Where(pRelatorio);

        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsApoioInventario;

        dmMProvider.cdsApoioInventario.Close;
        dmMProvider.cdsApoioInventario.ProviderName := 'dspApoioInventario';

        dmRelatorios.fdqApoioInventario.SQL.Clear;
        dmRelatorios.fdqApoioInventario.SQL.Add('SELECT PRO.PRODUTO, PRO.DESCRICAO, PRO.UNIDADE,');
        dmRelatorios.fdqApoioInventario.SQL.Add('PF.CUSTOLIQUIDO, PF.DEPOSITO, PF.LOJA  FROM PRODUTO PRO');
        dmRelatorios.fdqApoioInventario.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmRelatorios.fdqApoioInventario.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmRelatorios.fdqApoioInventario.SQL.Add(sWhere);
        dmRelatorios.fdqApoioInventario.SQL.Add('ORDER BY PRO.DESCRICAO');



        dmMProvider.cdsApoioInventario.Open;
        dmMProvider.cdsApoioInventario.ProviderName := '';

      end;
   10:begin//Registro de inventario P7

        sWhere := Montar_Where(pRelatorio);

        dmMProvider.cdsItemRegInventP7.Close;
        dmMProvider.cdsItemRegInventP7.ProviderName := 'dspItemRegInventP7';

        dmRelatorios.fdqRegInventarioP7.SQL.Clear;
        dmRelatorios.fdqRegInventarioP7.SQL.Add('SELECT INVENTARIO.anodereferencia, INVENTARIO.tipocustoinventario, INVENTARIO.valorliquidodoinventario,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('INVENTARIO.numero_ordem, iteminventario.quantidade, iteminventario.precodecusto,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('(iteminventario.precodecusto * iteminventario.quantidade) subtotal,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('produto.descricao as descricao_produto, produto.unidade, produto.tributacao,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('aliquotas.nome as descricao_tributacao, iteminventario.produto from inventario');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('join iteminventario iteminventario');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('on(iteminventario.inventario = inventario.inventario)');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('join produto produto');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('on(produto.produto = iteminventario.produto)');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('join aliquotas aliquotas');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('on(aliquotas.tributacao = produto.tributacao)');
        dmRelatorios.fdqRegInventarioP7.SQL.Add(sWhere);
        dmRelatorios.fdqRegInventarioP7.SQL.Add('order by produto.descricao');

        dmMProvider.cdsItemRegInventP7.Open;
        dmMProvider.cdsItemRegInventP7.ProviderName := '';

      end;
   14:begin

        sWhere := Montar_Where(pRelatorio);

        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsApoioEFDContr;

        dmMProvider.cdsApoioEFDContr.Close;
        dmMProvider.cdsApoioEFDContr.ProviderName := 'dspApoioEFDContr';

        dmRelatorios.fdqApoioEFDContr.Close;
        dmRelatorios.fdqApoioEFDContr.SQL.Clear;
        dmRelatorios.fdqApoioEFDContr.SQL.Add('SELECT PRO.PRODUTO, PRO.DESCRICAO, PRO.UNIDADE, PRO.NCM, PRO.cst_pis as cst_pis_s, PRO.cst_cofins as cst_cofins_s,');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('PRO.cst_pis_entrada, PRO.cst_cofins_entrada, PRO.aliquota_pis as aliq_pis_s, PRO.aliquota_cofins as aliq_cofins_s,');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('PRO.aliquota_pis_entrada, PRO.aliquota_cofins_entrada, PRO.natureza_receita, PRO.CODIGO_CREDITO_PIS_COFINS FROM PRODUTO PRO');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmRelatorios.fdqApoioEFDContr.SQL.Add(sWhere);
        dmRelatorios.fdqApoioEFDContr.SQL.Add('order by PRO.ncm, PRO.descricao');

        dmMProvider.cdsApoioEFDContr.Open;
        dmMProvider.cdsApoioEFDContr.ProviderName := '';

      end;
  end;

  FormatSettings.DecimalSeparator := ',';

end;

procedure TfrmRelatorios.MontarSQL_Movimento(pRelatorio: smallint);
var
  sWhere: string;
begin

  FormatSettings.DecimalSeparator := '.';

  case pRelatorio of
    1:begin

        sWhere := ' and PF.PROMOCAO = 1';
        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsPromocao;

        dmMProvider.cdsPromocao.Close;
        dmMProvider.cdsPromocao.ProviderName := 'dspPromocao';

        dmRelatorios.fdqPromocao.SQL.Clear;
        dmRelatorios.fdqPromocao.SQL.Add('select prom.*, pro.descricao, pf.promocao,');
        dmRelatorios.fdqPromocao.SQL.Add('pro.descricao from promocao prom');
        dmRelatorios.fdqPromocao.SQL.Add('join produto pro');
        dmRelatorios.fdqPromocao.SQL.Add('on(pro.produto = prom.produto)');
        dmRelatorios.fdqPromocao.SQL.Add('join produtofilial pf');
        dmRelatorios.fdqPromocao.SQL.Add('on(pf.produto = prom.produto)');
        dmRelatorios.fdqPromocao.SQL.Add('where pf.filial = ' + InttoStr(dmDBEXMaster.iIdFilial));
        dmRelatorios.fdqPromocao.SQL.Add(sWhere);
        dmRelatorios.fdqPromocao.SQL.Add('order by pro.descricao');

        dmMProvider.cdsPromocao.Open;
        dmMProvider.cdsPromocao.ProviderName := '';

      end;
    2:begin

        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsPromocao;

        dmMProvider.cdsPromocao.Close;
        dmMProvider.cdsPromocao.ProviderName := 'dspPromocao';

        dmRelatorios.fdqPromocao.SQL.Clear;
        dmRelatorios.fdqPromocao.SQL.Add('select prom.*, pro.descricao from promocao prom');
        dmRelatorios.fdqPromocao.SQL.Add('join produto pro');
        dmRelatorios.fdqPromocao.SQL.Add('on(pro.produto = prom.produto)');
        dmRelatorios.fdqPromocao.SQL.Add('where prom.status = 1');
        dmRelatorios.fdqPromocao.SQL.Add('order by pro.descricao');

        dmMProvider.cdsPromocao.Open;
        dmMProvider.cdsPromocao.ProviderName := '';

      end;
    4:begin//apoio ao inventario

        sWhere := Montar_Where(pRelatorio);

        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsApoioInventario;

        dmMProvider.cdsApoioInventario.Close;
        dmMProvider.cdsApoioInventario.ProviderName := 'dspApoioInventario';

        dmRelatorios.fdqApoioInventario.SQL.Clear;
        dmRelatorios.fdqApoioInventario.SQL.Add('SELECT PRO.PRODUTO, PRO.DESCRICAO, PRO.UNIDADE,');
        dmRelatorios.fdqApoioInventario.SQL.Add('PF.CUSTOLIQUIDO, PF.DEPOSITO, PF.LOJA  FROM PRODUTO PRO');
        dmRelatorios.fdqApoioInventario.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmRelatorios.fdqApoioInventario.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmRelatorios.fdqApoioInventario.SQL.Add(sWhere);
        dmRelatorios.fdqApoioInventario.SQL.Add('ORDER BY PRO.DESCRICAO');



        dmMProvider.cdsApoioInventario.Open;
        dmMProvider.cdsApoioInventario.ProviderName := '';

      end;
   10:begin//Registro de inventario P7

        sWhere := Montar_Where(pRelatorio);

        dmMProvider.cdsItemRegInventP7.Close;
        dmMProvider.cdsItemRegInventP7.ProviderName := 'dspItemRegInventP7';

        dmRelatorios.fdqRegInventarioP7.SQL.Clear;
        dmRelatorios.fdqRegInventarioP7.SQL.Add('SELECT INVENTARIO.anodereferencia, INVENTARIO.tipocustoinventario, INVENTARIO.valorliquidodoinventario,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('INVENTARIO.numero_ordem, iteminventario.quantidade, iteminventario.precodecusto,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('(iteminventario.precodecusto * iteminventario.quantidade) subtotal,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('produto.descricao as descricao_produto, produto.unidade, produto.tributacao,');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('aliquotas.nome as descricao_tributacao, iteminventario.produto from inventario');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('join iteminventario iteminventario');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('on(iteminventario.inventario = inventario.inventario)');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('join produto produto');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('on(produto.produto = iteminventario.produto)');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('join aliquotas aliquotas');
        dmRelatorios.fdqRegInventarioP7.SQL.Add('on(aliquotas.tributacao = produto.tributacao)');
        dmRelatorios.fdqRegInventarioP7.SQL.Add(sWhere);
        dmRelatorios.fdqRegInventarioP7.SQL.Add('order by produto.descricao');

        dmMProvider.cdsItemRegInventP7.Open;
        dmMProvider.cdsItemRegInventP7.ProviderName := '';

      end;
   14:begin

        sWhere := Montar_Where(pRelatorio);

        dmRelatorios.rvdGenesis.DataSet := dmMProvider.cdsApoioEFDContr;

        dmMProvider.cdsApoioEFDContr.Close;
        dmMProvider.cdsApoioEFDContr.ProviderName := 'dspApoioEFDContr';

        dmRelatorios.fdqApoioEFDContr.Close;
        dmRelatorios.fdqApoioEFDContr.SQL.Clear;
        dmRelatorios.fdqApoioEFDContr.SQL.Add('SELECT PRO.PRODUTO, PRO.DESCRICAO, PRO.UNIDADE, PRO.NCM, PRO.cst_pis as cst_pis_s, PRO.cst_cofins as cst_cofins_s,');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('PRO.cst_pis_entrada, PRO.cst_cofins_entrada, PRO.aliquota_pis as aliq_pis_s, PRO.aliquota_cofins as aliq_cofins_s,');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('PRO.aliquota_pis_entrada, PRO.aliquota_cofins_entrada, PRO.natureza_receita, PRO.CODIGO_CREDITO_PIS_COFINS FROM PRODUTO PRO');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmRelatorios.fdqApoioEFDContr.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmRelatorios.fdqApoioEFDContr.SQL.Add(sWhere);
        dmRelatorios.fdqApoioEFDContr.SQL.Add('order by PRO.ncm, PRO.descricao');

        dmMProvider.cdsApoioEFDContr.Open;
        dmMProvider.cdsApoioEFDContr.ProviderName := '';

      end;
    15:begin

        sWhere := Montar_Where(pRelatorio);

        dmMProvider.cdsVendaProdCFOP.Close;
        dmMProvider.cdsVendaProdCFOP.ProviderName := 'dspVendaProdCFOP';

        dmRelatorios.fdqVendaProdutoCFOP.SQL.Clear;
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('select pro.produto, pro.descricao, pro.unidade, sum(mov.quantidadesaida) as tot_quantidade, mov.cfop, cfop.descricao nome_cfop,');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('sum(mov.subtotalsaida) as sub_total,(sum(mov.subtotalsaida) / sum(mov.quantidadesaida)) as vl_medio from movimento mov');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('join produto pro');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('on pro.produto = mov.produto');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('join cfop cfop');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('on cfop.cfop = mov.cfop');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');

        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add(sWhere);

        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('group by mov.cfop, pro.descricao, pro.produto, pro.unidade, cfop.descricao');
        dmRelatorios.fdqVendaProdutoCFOP.SQL.Add('order by mov.cfop, pro.descricao');

        dmMProvider.cdsVendaProdCFOP.Open;
        dmMProvider.cdsVendaProdCFOP.ProviderName := '';

      end;
    17:begin

        sWhere := Montar_Where(pRelatorio);

        dmMProvider.cdsCompraProdCFOP.Close;
        dmMProvider.cdsCompraProdCFOP.ProviderName := 'dspCompraProdCFOP';

        dmRelatorios.fdqCompraProdCFOP.SQL.Clear;
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('select pro.produto, pro.descricao, pro.unidade, sum(mov.quantidadeentrada) as tot_quantidade, mov.cfop, cfop.descricao nome_cfop,');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('sum(mov.subtotalentrada) as sub_total,(sum(mov.subtotalentrada) / sum(mov.quantidadeentrada)) as vl_medio from movimento mov');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('join produto pro');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('on pro.produto = mov.produto');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('join cfop cfop');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('on cfop.cfop = mov.cfop');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');

        dmRelatorios.fdqCompraProdCFOP.SQL.Add(sWhere);

        dmRelatorios.fdqCompraProdCFOP.SQL.Add('group by mov.cfop, pro.descricao, pro.produto, pro.unidade, cfop.descricao');
        dmRelatorios.fdqCompraProdCFOP.SQL.Add('order by mov.cfop, pro.descricao');

        dmMProvider.cdsCompraProdCFOP.Open;
        dmMProvider.cdsCompraProdCFOP.ProviderName := '';

      end;
  end;

  FormatSettings.DecimalSeparator := ',';


end;

function TfrmRelatorios.Montar_Where(pRelatorio: smallint): string;
var
  sWhere:string;
  sDecimalSeparatorAnt:Char;
begin

  sDecimalSeparatorAnt            :=  FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';

  case pRelatorio of
    0:begin // tabela de pre�os

        sWhere := 'WHERE PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

        if (Length(Trim(edtProdutoIni.Text)) > 0) and (Length(Trim(edtProdutoFin.Text)) > 0) then
          sWhere := sWhere + ' AND PRO.PRODUTO BETWEEN ' + edtProdutoIni.Text
                           + ' AND ' + edtProdutoFin.Text;

        if Length(Trim(edtGrupo.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.GRUPO = ' + edtGrupo.Text;

        if Length(Trim(edtSubgrupo.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.SUBGRUPO = ' + edtSubgrupo.Text;

        if Length(Trim(edtSecao.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.SECAO = ' + edtSecao.Text;

        if Length(Trim(edtFornecedor.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.FORNECEDOR = ' + edtFornecedor.Text;

        if Length(Trim(edtSetorBalanca.Text)) > 0 then
          sWhere := sWhere + ' AND PF.SETORDEBALANCA = ' + edtSetorBalanca.Text;

        if Length(Trim(edtAliquotaICMS_Saida.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.TRIBUTACAO = ' + edtAliquotaICMS_Saida.Text;

        if cboTipoItem.KeyValue >=0 then
          sWhere := sWhere + ' AND PRO.TIPO_ITEM = ' + IntToStr(cboTipoItem.KeyValue);

        case rdpSaldoLoja.ItemIndex of
          0:sWhere := sWhere + ' AND PF.LOJA = PF.SALDOMINIMO';
          1:sWhere := sWhere + ' AND PF.LOJA = PF.SALDOMAXIMO';
          2:sWhere := sWhere + ' AND PF.LOJA = 0';
          3:sWhere := sWhere + ' AND PF.LOJA > PF.SALDOMAXIMO';
          4:sWhere := sWhere + ' AND PF.LOJA < 0';
          5:sWhere := sWhere + ' AND PF.LOJA > PF.SALDOMINIMO';
          6:sWhere := sWhere + ' AND PF.LOJA > 0';
          7:sWhere := sWhere + ' AND PF.LOJA < ' + FloatToStr((StrToFloat(RetirarVirgula(RetirarPonto(edtSaldoDesejado.Text)))/1000));
          8:sWhere := sWhere + ' AND PF.LOJA > ' + FloatToStr((StrToFloat(RetirarVirgula(RetirarPonto(edtSaldoDesejado.Text)))/1000));
        end;

        case rdpEnviarBalanca.ItemIndex of
          0:sWhere := sWhere + ' AND PF.ENVIARPARABALANCA = 0';
          1:sWhere := sWhere + ' AND PF.ENVIARPARABALANCA = 1';
        end;

        case rdpAtivo.ItemIndex of
          0:sWhere := sWhere + ' AND PRO.ATIVO = 0';
          1:sWhere := sWhere + ' AND PRO.ATIVO = 1';
        end;

        case rdpVisivel.ItemIndex of
          0:sWhere := sWhere + ' AND PRO.VISIVEL = 0';
          1:sWhere := sWhere + ' AND PRO.VISIVEL = 1';
        end;

        case rdpPrecoVenda.ItemIndex of
          0:sWhere := sWhere + ' AND PF.PRECODEVENDA > ' + FormatFloat('##,00',StrtoFloat(RetirarVirgula(RetirarPonto(edtValor.Text)))/100);
          1:sWhere := sWhere + ' AND PF.PRECODEVENDA < ' + FormatFloat('##,00',StrtoFloat(RetirarVirgula(RetirarPonto(edtValor.Text)))/100);
          2:sWhere := sWhere + ' AND PF.PRECODEVENDA = ' + FormatFloat('##,00',StrtoFloat(RetirarVirgula(RetirarPonto(edtValor.Text)))/100);
        end;

      end;
    4:begin //apoio ao inventario

        sWhere := 'WHERE PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

        if (Length(Trim(edtProdutoIni.Text)) > 0) and (Length(Trim(edtProdutoFin.Text)) > 0) then
          sWhere := sWhere + ' AND PRO.PRODUTO BETWEEN ' + edtProdutoIni.Text
                           + ' AND ' + edtProdutoFin.Text;

        if Length(Trim(edtGrupo.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.GRUPO = ' + edtGrupo.Text;

        if Length(Trim(edtSubgrupo.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.SUBGRUPO = ' + edtSubgrupo.Text;

        if Length(Trim(edtSecao.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.SECAO = ' + edtSecao.Text;

        if Length(Trim(edtFornecedor.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.FORNECEDOR = ' + edtFornecedor.Text;

        if Length(Trim(edtSetorBalanca.Text)) > 0 then
          sWhere := sWhere + ' AND PF.SETORDEBALANCA = ' + edtSetorBalanca.Text;

        if Length(Trim(edtAliquotaICMS_Saida.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.TRIBUTACAO = ' + edtAliquotaICMS_Saida.Text;

        if cboTipoItem.KeyValue >=0 then
          sWhere := sWhere + ' AND PRO.TIPO_ITEM = ' + IntToStr(cboTipoItem.KeyValue);

        case rdpSaldoLoja.ItemIndex of
          0:sWhere := sWhere + ' AND PF.LOJA = PF.SALDOMINIMO';
          1:sWhere := sWhere + ' AND PF.LOJA = PF.SALDOMAXIMO';
          2:sWhere := sWhere + ' AND PF.LOJA = 0';
          3:sWhere := sWhere + ' AND PF.LOJA > PF.SALDOMAXIMO';
          4:sWhere := sWhere + ' AND PF.LOJA < 0';
          5:sWhere := sWhere + ' AND PF.LOJA > PF.SALDOMINIMO';
          6:sWhere := sWhere + ' AND PF.LOJA > 0';
          7:sWhere := sWhere + ' AND PF.LOJA < ' + FloatToStr((StrToFloat(RetirarVirgula(RetirarPonto(edtSaldoDesejado.Text)))/1000));
          8:sWhere := sWhere + ' AND PF.LOJA > ' + FloatToStr((StrToFloat(RetirarVirgula(RetirarPonto(edtSaldoDesejado.Text)))/1000));
        end;

        case rdpEnviarBalanca.ItemIndex of
          0:sWhere := sWhere + ' AND PF.ENVIARPARABALANCA = 0';
          1:sWhere := sWhere + ' AND PF.ENVIARPARABALANCA = 1';
        end;

        case rdpAtivo.ItemIndex of
          0:sWhere := sWhere + ' AND PRO.ATIVO = 0';
          1:sWhere := sWhere + ' AND PRO.ATIVO = 1';
        end;

        case rdpVisivel.ItemIndex of
          0:sWhere := sWhere + ' AND PRO.VISIVEL = 0';
          1:sWhere := sWhere + ' AND PRO.VISIVEL = 1';
        end;

      end;
   10:begin //Registro de inventario P7

        sWhere := sWhere + ' WHERE (ITEMINVENTARIO.QUANTIDADE > 0)';
        sWhere := sWhere + ' AND (ITEMINVENTARIO.INVENTARIO = ' + IntToStr(dmMProvider.cdsRegInventarioP7INVENTARIO.Value) + ') AND (ITEMINVENTARIO.PRECODECUSTO > 0)';

        if Length(Trim(edtGrupo_Inventario.Text)) > 0 then
        begin
          sWhere := sWhere + ' AND PRODUTO.GRUPO = ' + Trim(edtGrupo_Inventario.Text);

          if Length(Trim(edtSubgrupo_Inventario.Text)) > 0 then
            sWhere := sWhere + ' AND PRODUTO.SUBGRUPO = ' + Trim(edtSubgrupo_Inventario.Text);

        end;

        if Length(Trim(edtSecao_Inventario.Text)) > 0 then
          sWhere := sWhere + ' AND PRODUTO.SECAO = ' + Trim(edtSecao_Inventario.Text);

      end;
   14:begin //apoio a efd contribui��es

        sWhere := 'WHERE PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

        //PIS

        if Length(Trim(edtCSTPIS_Entrada.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.CST_PIS_ENTRADA = ' + Trim(edtCSTPIS_Entrada.Text)
        else if chkCST_PIS_Entrada_SP.Checked then
          sWhere := sWhere + ' AND PRO.CST_PIS_ENTRADA <= 0';

        if Length(Trim(edtAliqPIS_Entrada.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.ALIQUOTA_PIS_ENTRADA = ' + Trim(edtAliqPIS_Entrada.Text);

        if Length(Trim(edtCSTPIS_Saida.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.CST_PIS = ' + Trim(edtCSTPIS_Saida.Text)
        else if chkCST_PIS_Saida_SP.Checked then
          sWhere := sWhere + ' AND PRO.CST_PIS <= 0';

        if Length(Trim(edtAliqPIS_Saida.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.ALIQUOTA_PIS = ' + Trim(edtAliqPIS_Saida.Text);

        //COFINS

        if Length(Trim(edtCSTCOFINS_Entrada.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.CST_COFINS_ENTRADA = ' + Trim(edtCSTCOFINS_Entrada.Text)
        else if chkCST_PIS_Entrada_SP.Checked then
          sWhere := sWhere + ' AND PRO.CST_COFINS_ENTRADA <= 0';

        if Length(Trim(edtAliqCOFINS_Entrada.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.ALIQUOTA_COFINS_ENTRADA = ' + Trim(edtAliqCOFINS_Entrada.Text);

        if Length(Trim(edtCSTCOFINS_Saida.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.CST_COFINS = ' + Trim(edtCSTCOFINS_Saida.Text)
        else if chkCST_PIS_Saida_SP.Checked then
          sWhere := sWhere + ' AND PRO.CST_COFINS <= 0';

        if Length(Trim(edtAliqCOFINS_Saida.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.ALIQUOTA_COFINS = ' + Trim(edtAliqCOFINS_Saida.Text);

        if Length(Trim(edtCodigo_Cred.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.CODIGO_CREDITO_PIS_COFINS = ' + Trim(edtCodigo_Cred.Text)
        else if chkCOD_CRED_SP.Checked then
          sWhere := sWhere + ' AND PRO.CODIGO_CREDITO <= 0';

        if Length(Trim(edtNat_rec.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.NATUREZA_RECEITA = ' + Trim(edtNat_rec.Text)
        else if chkNAT_REC_SP.Checked then
          sWhere := sWhere + ' AND PRO.NATUREZA_RECEITA <= 0';

        if Length(Trim(edtNCM_EFD_Ctr.Text)) > 0 then
          sWhere := sWhere + ' AND PRO.NCM like ' + QuotedStr('%' +Trim(edtNCM_EFD_Ctr.Text)+ '%')
        else if chkNCM_SP.Checked then
          sWhere := sWhere + ' AND PRO.NCM IS NULL';

      end;

   15:begin //venda de produto cfop

        sWhere := 'WHERE PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

        if cboTributacao.KeyValue >= 0 then
          sWhere := sWhere + ' AND PRO.TRIBUTACAO = ' + InttoStr(cboTributacao.KeyValue);

        if cboGrupoVenda.KeyValue >= 0 then
          sWhere := sWhere + ' AND PRO.GRUPO = ' + InttoStr(cboGrupoVenda.KeyValue);

        if cboSubGrupoVenda.KeyValue >= 0 then
          sWhere := sWhere + ' AND PRO.SUBGRUPO = ' + InttoStr(cboSubGrupoVenda.KeyValue);

        if cboCFOPVendaProd.KeyValue >= 0 then
          sWhere := sWhere + ' AND MOV.TRIBUTACAO = ' + InttoStr(cboCFOPVendaProd.KeyValue);

        sWhere := sWhere + ' AND MOV.DATA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpDataInicialPISCOFINS.Date))
                             + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpDataFinalPISCOFINS.Date));

        sWhere := sWhere + ' and mov.subtotalsaida > 0 and cfop.natureza_cfop = 0';

      end;
   16:begin //lustagem de cfop

        if rdgOperacaoEstoqueCFOP.ItemIndex < 4 then
          sWhere := 'WHERE OPERACAO = ' + IntToStr(rdgOperacaoEstoqueCFOP.ItemIndex)
        else
          sWhere := 'WHERE OPERACAO IS NULL';

        if rdgFinalidadeCFOP.ItemIndex < 8 then
          sWhere := sWhere + ' OR NATUREZA_CFOP = ' + IntToStr(rdgFinalidadeCFOP.ItemIndex)
        else
          sWhere := sWhere + ' OR NATUREZA_CFOP < 0';

      end;
   17:begin //compra de produto cfop

        sWhere := 'WHERE PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);

        if cboTributacao.KeyValue >= 0 then
          sWhere := sWhere + ' AND PRO.TRIBUTACAO = ' + InttoStr(cboTributacao.KeyValue);

        if cboGrupoVenda.KeyValue >= 0 then
          sWhere := sWhere + ' AND PRO.GRUPO = ' + InttoStr(cboGrupoVenda.KeyValue);

        if cboSubGrupoVenda.KeyValue >= 0 then
          sWhere := sWhere + ' AND PRO.SUBGRUPO = ' + InttoStr(cboSubGrupoVenda.KeyValue);

        if cboCFOPVendaProd.KeyValue >= 0 then
          sWhere := sWhere + ' AND MOV.TRIBUTACAO = ' + InttoStr(cboCFOPVendaProd.KeyValue);

        sWhere := sWhere + ' AND MOV.DATA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpDataInicialPISCOFINS.Date))
                             + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpDataFinalPISCOFINS.Date));

        sWhere := sWhere + ' and mov.subtotalentrada > 0 and cfop.operacao = 0 and cfop.natureza_cfop = 1';

      end;
  end;

  FormatSettings.DecimalSeparator := sDecimalSeparatorAnt;
  Result                          := sWhere;

end;

procedure TfrmRelatorios.OcultarAbas;
var
  i:integer;
begin

  for i := 0 to pgcFiltro.PageCount - 1 do
  begin

    pgcFiltro.Pages[i].TabVisible := False;
    pgcFiltro.Pages[i].Tag        := -1;

  end;
end;

procedure TfrmRelatorios.rdpSaldoLojaClick(Sender: TObject);
begin

  edtSaldoDesejado.Enabled := rdpSaldoLoja.ItemIndex > 6 ;

  if edtSaldoDesejado.Enabled then
    edtSaldoDesejado.SetFocus;

end;

end.
