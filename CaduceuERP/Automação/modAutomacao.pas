unit modAutomacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdActns, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.CheckLst, Vcl.ButtonGroup, JvExMask, JvToolEdit;

type
  TfrmAutomacao = class(TForm)
    ctgAutomacao: TCategoryPanelGroup;
    ctpExportacao: TCategoryPanel;
    ctpImportacao: TCategoryPanel;
    btnExportacao: TButtonGroup;
    pgcAutomacao: TPageControl;
    tbsPdv: TTabSheet;
    tbsBalanca: TTabSheet;
    rdgTipoExpPdv: TRadioGroup;
    grpTabelaExportacao: TGroupBox;
    chkArquivosExportacao: TCheckListBox;
    grpPastaDestinoPDV: TGroupBox;
    edtPastaDestinoPDV: TEdit;
    grpArquivoExportadoPDV: TGroupBox;
    edtArquivoExportadoPDV: TEdit;
    grpProgressoGeralPDV: TGroupBox;
    grpProgresoArquivoPDV: TGroupBox;
    pgbprogressoGeral: TProgressBar;
    pgbProgressoArquivo: TProgressBar;
    btnExportar: TButton;
    actAutomacao: TActionManager;
    acAutomacaoPDV: TAction;
    btnSair: TButton;
    grpSoftwareFrentedeLoja: TGroupBox;
    pnlSoftwareFrentedeLoja: TPanel;
    grpSoftwareBalanca: TGroupBox;
    pnlSoftwareBalanca: TPanel;
    grpTabExpbalanca: TGroupBox;
    chkArquivosExpBalanca: TCheckListBox;
    grpPastaExportacaoBalanca: TGroupBox;
    edtPastaExpBalanca: TEdit;
    grpArqExpBalanca: TGroupBox;
    edtArqExpBalanca: TEdit;
    grpProgressoGeralBalanca: TGroupBox;
    pgbProgressoGeralBalanca: TProgressBar;
    grpProgressoArqBalanca: TGroupBox;
    pgbProgressoArqBalanca: TProgressBar;
    btnExportaBalanca: TButton;
    rdpTipoExpBalanca: TRadioGroup;
    acAutomacaoBalanca: TAction;
    btgImporacao: TButtonGroup;
    tbsImportacao: TTabSheet;
    btnOk: TButton;
    grpSoftwareFrentedeLojaImp: TGroupBox;
    pnlImportaPDV: TPanel;
    grpDataMovimentoImportacao: TGroupBox;
    dtpMovimentoImportacao: TDateTimePicker;
    grpProgressoImportacao: TGroupBox;
    pgbProgressoImportacao: TProgressBar;
    grpProgressoGeralImp: TGroupBox;
    pgbProgressoGeralImp: TProgressBar;
    grpCaixas: TGroupBox;
    chkCaixas: TCheckListBox;
    btnEstornar: TButton;
    lblMsgProgresso: TLabel;
    tbsLogImportacao: TTabSheet;
    grpLogCheques: TGroupBox;
    memLogCheques: TMemo;
    grpLogProdutos: TGroupBox;
    memLogProdutos: TMemo;
    grpImpNumCX: TGroupBox;
    grpDataCupom: TGroupBox;
    grpNumCupom: TGroupBox;
    grpCodigodeBarras: TGroupBox;
    lblNumCx: TLabel;
    lblDataCupom: TLabel;
    lblNumeroCupom: TLabel;
    lblCodigoBarras: TLabel;
    acExportaLoja: TAction;
    acImportar: TAction;
    grpConteudo: TGroupBox;
    pnlConteudo: TPanel;
    acImportarMovimento: TAction;
    acEstornarMovimento: TAction;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    chkLimparCadastro: TCheckBox;
    ctpSintegra: TCategoryPanel;
    tbsSintegra: TTabSheet;
    btgSintegra: TButtonGroup;
    acImportarSintegra: TAction;
    grpSelecionaArquivoSintegra: TGroupBox;
    edtArquivoSintegra: TJvFilenameEdit;
    Button1: TButton;
    GroupBox1: TGroupBox;
    lblNumCXSintegra: TLabel;
    GroupBox2: TGroupBox;
    lblDataCupomSintegra: TLabel;
    GroupBox3: TGroupBox;
    lblNumeroCupomSintegra: TLabel;
    GroupBox4: TGroupBox;
    lblCodigoBarrasSintegra: TLabel;
    GroupBox5: TGroupBox;
    pgbSintegraGeral: TProgressBar;
    GroupBox6: TGroupBox;
    pgbSintegraItem: TProgressBar;
    lblMSGImportacaoSintegra: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnExportacaoItems0Click(Sender: TObject);
    procedure btnExportacaoItems1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure acAutomacaoPDVExecute(Sender: TObject);
    procedure acAutomacaoBalancaExecute(Sender: TObject);
    procedure btgImporacaoItems0Click(Sender: TObject);
    procedure dtpMovimentoImportacaoChange(Sender: TObject);
    procedure Man_Tab_Registro_C405(pOpcao:smallint);
    procedure Man_Tab_Registro_C410(pOpcao: smallint;pBarras:string);
    procedure Man_Tab_Registro_C420(pOpcao: smallint);
    procedure Man_Tab_Registro_C460(pOpcao,pSituacao: smallint);
//    procedure Man_Tab_Registro_C470(pOpcao,pSituacao: smallint; pAliq:string);
    procedure Man_Tab_Registro_C490(pOpcao: smallint);
    procedure Man_Tab_ArqImportado(pOpcao: smallint);
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure acImportarMovimentoExecute(Sender: TObject);
    procedure acEstornarMovimentoExecute(Sender: TObject);
    procedure btgSintegraItems0Click(Sender: TObject);
    procedure acImportarSintegraExecute(Sender: TObject);
  private
    procedure Man_Tab_Registro_60M(pOpcao:smallint;pData:TDateTime);
    procedure Man_tab_Registro_60A(pOpcao:smallint;pData:TDateTime);
    procedure Man_Tab_LivroSaida(pOpcao:smallint);
    procedure Man_Tab_Movimento(pOpcao:smallint);
    procedure Atualizar_Saldo_Produto(pOpcao:smallint);
    procedure Man_Tab_Registro_60D(pOpcao:smallint;pData:TDateTime);
    procedure Man_Tab_Registro_60I(pOpcao:smallint;pData:TDateTime);
    procedure Man_Tab_Registro_60R(pOpcao:smallint;pData:TDateTime);
    procedure Man_Tab_ChqRec(pOpcao:smallint);
    procedure Man_Tab_CRE(pOpcao:smallint);
    procedure Atualizar_Saldo_Cliente(pOpcao:smallint;pCliente:integer; pValor:Currency);
    { Private declarations }
  public
    { Public declarations }
    iContador :integer;
    cIsentasNTTemp:currency;
    bJaPassou:boolean;
  end;

var
  frmAutomacao: TfrmAutomacao;
  iValidacao:integer;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  modAutomacaoTOLEDO, modAutomacaoZEUSFREE, uFuncoes, uConstantes_Padrao, datamZeus,
  modAutomacaoFILIZOLA, modAutomacaoDJPDV, uFuncoes_BD, dataMDJPdv,
  modAutomacaoImportarSintegra;


procedure TfrmAutomacao.acAutomacaoBalancaExecute(Sender: TObject);
var
  iContador :integer;
begin

  pgcAutomacao.Pages[3].TabVisible := False;

  case dmMProvider.cdsConfiguracoesMODELOBALANCA.AsInteger of
    6:begin //toledo mgv5

        pgbProgressoGeralBalanca.Max := frmAutomacao.chkArquivosExpBalanca.Count;

        for iContador := 0 to frmAutomacao.chkArquivosExpBalanca.Count - 1 do
        begin
          //arquivo de produto
          if frmAutomacao.chkArquivosExpBalanca.Checked[0] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position       := iContador+1;

            ExportarProdutoMGV5(dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSPARABALANCA.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial, dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger);

          end
          //rceitas
          else if frmAutomacao.chkArquivosExpBalanca.Checked[1] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position := iContador+1;

            ExportarReceitaMGV5(dmMProvider.cdsConfiguracoesARQUIVODERECEITASPARABALANCA.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial, dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger);

          end
          //teclado
          else if frmAutomacao.chkArquivosExpBalanca.Checked[2] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position := iContador+1;

            ExportarTecladoMGV5(dmMProvider.cdsConfiguracoesARQUIVODETECLADOPARABALANCA.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial, dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger);

          end
          //inf nutricional
          else if frmAutomacao.chkArquivosExpBalanca.Checked[3] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position := iContador+1;

            ExportarInfNutricionalMGV5(dmMProvider.cdsConfiguracoesARQUIVODEINFORMACAONUTRICIONAL.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial, dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger);

          end;

        end;

      end;
    9:begin //smart

        pgbProgressoGeralBalanca.Max := frmAutomacao.chkArquivosExpBalanca.Count;

        for iContador := 0 to frmAutomacao.chkArquivosExpBalanca.Count - 1 do
        begin

          //arquivo de produto
          if frmAutomacao.chkArquivosExpBalanca.Checked[0] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position       := iContador+1;
            ExportarProdutoTSC_Smart(dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSPARABALANCA.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial);

          end
          //setor
          else if frmAutomacao.chkArquivosExpBalanca.Checked[1] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position := iContador+1;
            ExportarSetorTSC_Smart(dmMProvider.cdsConfiguracoesARQUIVODESETORPARABALANCA.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial);

          end
          //receitas
          else if frmAutomacao.chkArquivosExpBalanca.Checked[2] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position := iContador+1;

            ExportarReceitasTSC_Smart(dmMProvider.cdsConfiguracoesARQUIVODERECEITASPARABALANCA.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial);

          end
          //inf nutricional
          else if frmAutomacao.chkArquivosExpBalanca.Checked[3] then
          begin

            chkArquivosExpBalanca.State[iContador]  := cbUnChecked;
            pgbProgressoGeralBalanca.Position := iContador+1;

            ExportarInfNutricionalTSC_Smart(dmMProvider.cdsConfiguracoesARQUIVODEINFORMACAONUTRICIONAL.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString, dmDBEXMaster.iIdFilial);

          end;

        end;

      end;
  end;

  pgbProgressoGeralBalanca.Position := 0;

  for iContador := 0 to chkArquivosExpBalanca.Count - 1 do
    chkArquivosExpBalanca.State[iContador]  := cbChecked;

end;

procedure TfrmAutomacao.acAutomacaoPDVExecute(Sender: TObject);
var
  iContador, iContaTC, iQtdTC :integer;
begin

  pgcAutomacao.Pages[3].TabVisible := False;

  iQtdTC := dmMProvider.cdsConfiguracoesQUANTIDADE_TERMINAL_CONSULTA.AsInteger;

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  case dmMProvider.cdsConfiguracoesMODELOPDV.AsInteger of
    3:begin//Zeus Frente de Loja

        pgbProgressoGeral.Max := frmAutomacao.chkArquivosExportacao.Count;

        for iContador := 0 to frmAutomacao.chkArquivosExportacao.Count - 1 do
        begin
          //arquivo de produto
          if frmAutomacao.chkArquivosExportacao.Checked[0] then
          begin

            chkArquivosExportacao.State[iContador]  := cbUnChecked;
            pgbProgressoGeral.Position := iContador+1;

            case rdgTipoExpPdv.ItemIndex of
              0:ExportarProdutosZEUS_FE(dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSGERAL.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.AsString, dmDBEXMaster.iIdFilial, rdgTipoExpPdv.ItemIndex);
              1:begin

                  ExportarProdutosZEUS_FE(dmMProvider.cdsConfiguracoesARQUIVODEPRODUTOSALTERADOS.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.AsString, dmDBEXMaster.iIdFilial, rdgTipoExpPdv.ItemIndex);

                  if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                    + 'Deseja liberar os produtos com status de alterados?'), 'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
                  begin

                    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                    dmMSProcedure.fdspMaster.Prepare;

                    dmMSProcedure.fdspMaster.Params[0].AsString := 'UPDATE PRODUTO SET STATUS = 0 WHERE STATUS = 1';

                    try

                      dmMSProcedure.fdspMaster.ExecProc;
                      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                                            + 'Opera��o realizada com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);
                    except
                      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                                            + 'Ouve falha na libera��o!'), 'Aten��o!', mb_IconWarning + mb_Ok);
                    end;

                  end;

                end;

            end;

          end
          else if frmAutomacao.chkArquivosExportacao.Checked[1] then
          begin

            chkArquivosExportacao.State[iContador]  := cbUnChecked;
            pgbProgressoGeral.Position := iContador+1;
            ExportarClienteZEUS_FE(dmMProvider.cdsConfiguracoesARQUIVODECLIENTES.AsString, dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.AsString, dmDBEXMaster.iIdFilial);

          end
          else if frmAutomacao.chkArquivosExportacao.Checked[2] then
          begin

            chkArquivosExportacao.State[iContador]  := cbUnChecked;
            pgbProgressoGeral.Position := iContador+1;
            ExportarPrecoQuantidade('23.sdf', dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.AsString, dmDBEXMaster.iIdFilial);

          end

          else if frmAutomacao.chkArquivosExportacao.Checked[3] then
          begin

            chkArquivosExportacao.State[3]  := cbUnChecked;
            pgbProgressoGeral.Position      := iContador+1;
            Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                                  + chkArquivosExportacao.Items[iContador]  +#13 + #13
                                  + 'Op��o em desenvolvimento!'), 'Aten��o!', mb_IconWarning + mb_Ok);

          end
          else if frmAutomacao.chkArquivosExportacao.Checked[4] then
          begin

            chkArquivosExportacao.State[4]  := cbUnChecked;
            pgbProgressoGeral.Position      := iContador+1;

            dmMProvider.cdsGrupo.Close;
            dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';

            dmDBEXMaster.fdqGrupo.SQL.Clear;
            dmDBEXMaster.fdqGrupo.SQL.Add('SELECT * FROM GRUPO');
            dmDBEXMaster.fdqGrupo.SQL.Add('ORDER BY NOME');

            dmMProvider.cdsGrupo.Open;
            dmMProvider.cdsGrupo.ProviderName := '';

            if not dmMProvider.cdsGrupo.IsEmpty then
              ExportarGrupoProdutoZEUS_FE('5.sdf', dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.AsString, dmDBEXMaster.iIdFilial);

          end;

        end;
      end;
    4:begin//DJPdv

        pgbProgressoGeral.Max := frmAutomacao.chkArquivosExportacao.Count;

        for iContador := 0 to frmAutomacao.chkArquivosExportacao.Count - 1 do
        begin

          //arquivo de cst/aliquota PIS
          if frmAutomacao.chkArquivosExportacao.Checked[0] then
          begin

            ExportarPISDJPDV(dmMProvider.cdsParamIntegraPDVARQUIVO_PIS.Value, dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value, dmDBEXMaster.iIdFilial);
            chkArquivosExportacao.State[0]  := cbUnChecked;

          end;

          //arquivo de cst/aliquota COFINS
          if frmAutomacao.chkArquivosExportacao.Checked[1] then
          begin

            ExportarCOFINSDJPDV(dmMProvider.cdsParamIntegraPDVARQUIVO_COFINS.Value, dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value, dmDBEXMaster.iIdFilial);
            chkArquivosExportacao.State[1]  := cbUnChecked;

          end;

          //TABELA cest
          if frmAutomacao.chkArquivosExportacao.Checked[2] then
          begin

            ExportarCEST(dmMProvider.cdsParamIntegraPDVARQUIVO_CEST.Value, dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value);
            chkArquivosExportacao.State[2]  := cbUnChecked;

          end;

          //arquivo de produto
          if frmAutomacao.chkArquivosExportacao.Checked[3] then
          begin

            chkArquivosExportacao.State[iContador]  := cbUnChecked;
            pgbProgressoGeral.Position := iContador+1;

            case rdgTipoExpPdv.ItemIndex of
              0:ExportarProdutosDJPDV(dmMProvider.cdsParamIntegraPDVARQUIVO_PRODUTOS.Value, dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value, dmDBEXMaster.iIdFilial, rdgTipoExpPdv.ItemIndex, dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value);
              1:begin

                  ExportarProdutosDJPDV(dmMProvider.cdsParamIntegraPDVARQUIVO_PRODUTOS.Value, dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.Value, dmDBEXMaster.iIdFilial, rdgTipoExpPdv.ItemIndex, dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value);

                  if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                    + 'Deseja liberar os produtos com status de alterados?'), 'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
                  begin

                    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                    dmMSProcedure.fdspMaster.Prepare;

                    dmMSProcedure.fdspMaster.Params[0].AsString := 'UPDATE PRODUTO SET STATUS = 0 WHERE STATUS = 1';

                    try

                      dmMSProcedure.fdspMaster.ExecProc;
                      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                                            + 'Opera��o realizada com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);
                    except
                      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                                            + 'Ouve falha na libera��o!'), 'Aten��o!', mb_IconWarning + mb_Ok);
                    end;

                  end;

                end;

            end;

            chkArquivosExportacao.State[3]  := cbUnChecked;

          end
          else if frmAutomacao.chkArquivosExportacao.Checked[5] then
          begin

            pgbProgressoGeral.Position := iContador+1;
            ExportarClienteDJPDV(dmMProvider.cdsParamIntegraPDVARQUIVO_CLIENTES.AsString, dmMProvider.cdsParamIntegraPDVPASTA_EXPORTACAO.AsString, dmDBEXMaster.iIdFilial);
            chkArquivosExportacao.State[5]  := cbUnChecked;

          end;

        end;

      end;

  end;

  pgbProgressoGeral.Position    := 0;
  pgbProgressoArquivo.Position  := 0;

  for iContador := 0 to chkArquivosExportacao.Count - 1 do
    chkArquivosExportacao.State[iContador]  := cbChecked;

  frmAutomacao.pnlConteudo.Caption          := '';
  Application.ProcessMessages;

  LimparMSG_ERRO(lblMsg, nil);

end;


procedure TfrmAutomacao.acEstornarMovimentoExecute(Sender: TObject);
var
  iContador,iEcf :integer;
  sData,sSenha:string;
  cIsentasNTTemp:currency;
  bJaPassou:boolean;
begin

  iEcf            := -1;
  sData           := FormatDateTime('ddmm',Date);
  iValidacao      := StrToInt(sData);
  sData           := FormatDateTime('mmdd',Date);
  cIsentasNTTemp  := 0;
  bJaPassou       := False;
  iValidacao      := iValidacao + StrToInt(sData);

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'ImportacaoPDV') then
    ForceDirectories(ExtractFilePath(Application.ExeName)+'ImportacaoPDV\');

  case dmMProvider.cdsConfiguracoesMODELOPDV.AsInteger of
    3:begin //Zeus front end


        dmMProvider.cdsConfigECF.First;

        //verifica se o arquivo j� foi importado
        dmDBEXMaster.fdqValidarImportacao.Close;
        dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_NOME_ARQUIVO').AsString   := '';
        dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_DATA_MOVIMENTO').AsDate   := dtpMovimentoImportacao.Date;
        dmDBEXMaster.fdqValidarImportacao.Open;

        if dmDBEXMaster.fdqValidarImportacao.IsEmpty then
        begin

          Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
            + 'O movimento do dia ' + FormatDateTime('dd/mm/yyyy', dtpMovimentoImportacao.Date )
            + ' n�o foi importado.' + #13 + #13
            + 'Para realizar o estorno'
            + '� necess�rio que se realize uma importa��o!'),
            'Aten��o!', mb_IconWarning + mb_Ok);

        end
        else
        begin

          InicializarTabelas_Temp_Automacao;

          dmMZeus.cdsZan_M05.Close;
          dmMZeus.cdsZan_M05.ProviderName := 'dspZan_M05';
          while not dmMProvider.cdsConfigECF.Eof do
          begin

            dmMZeus.cdsZan_M05.Close;
            dmMZeus.cdsZan_M05.ProviderName := 'dspZan_M05';

            dmMZeus.fdqZan_M05.SQL.Clear;
            dmMZeus.fdqZan_M05.SQL.Add('select * from zan_m05');
            //data do movimento
            dmMZeus.fdqZan_M05.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
            //serie ecf
            dmMZeus.fdqZan_M05.SQL.Add('and m05bb = ' + QuotedStr(Trim(dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value)));
            //loja
            dmMZeus.fdqZan_M05.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));

            dmMZeus.cdsZan_M05.Open;
            dmMZeus.cdsZan_M05.ProviderName := '';
            //verifica se o movimento foi gravado
            if dmMZeus.cdsZan_M05.IsEmpty then
            begin

              dmMZeus.cdsZan_M46.Close;
              dmMZeus.cdsZan_M46.ProviderName := 'dspZan_M46';

              dmMZeus.fdqZan_M46.SQL.Clear;
              dmMZeus.fdqZan_M46.SQL.Add('select * from zan_m46');
              //data do movimento
              dmMZeus.fdqZan_M46.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
              //serie ecf
              dmMZeus.fdqZan_M46.SQL.Add('and m46bb = ' + QuotedStr(Trim(dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value)));
              //loja
              dmMZeus.fdqZan_M46.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
              //tipo de coleta informa��es / lidos do ecf ante da redu��o
              dmMZeus.fdqZan_M46.SQL.Add('and m46bl = 1');

              dmMZeus.cdsZan_M46.Open;
              dmMZeus.cdsZan_M46.ProviderName := '';

              if dmMZeus.cdsZan_M46.IsEmpty then
              begin

                dmMZeus.cdsZan_M0_51.Close;
                dmMZeus.cdsZan_M0_51.ProviderName := 'dspZan_M0_51';

                dmMZeus.fdqZan_M0_51.SQL.Clear;
                dmMZeus.fdqZan_M0_51.SQL.Add('select * from zan_m051');
                //data do movimento
                dmMZeus.fdqZan_M0_51.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
                //serie ecf
                dmMZeus.fdqZan_M0_51.SQL.Add('and m05bb = ' + QuotedStr(Trim(dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value)));
                //loja
                dmMZeus.fdqZan_M0_51.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
{                  //tipo de coleta informa��es / lidos do ecf ante da redu��o
                dmMZeus.fdqZan_M051.SQL.Add('and m05bl = 1');}

                dmMZeus.cdsZan_M0_51.Open;
                dmMZeus.cdsZan_M0_51.ProviderName := '';

                if dmMZeus.cdsZan_M0_51.IsEmpty then
                begin

                  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                    + 'N�o foi/foram encontrado(s) registros de movimento para a data selecionad:  ' + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date) + #13
                    + 'referente ao ECF: ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + '/' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value +#13 +#13
                    + 'Verifique se a redu��o Z foi emitida!'), 'Aten��o!', mb_IconWarning + mb_Ok);

                end
                else
                  ImportarVendaZEUS_FE('', '', dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, 51, True, dtpMovimentoImportacao.Date);

              end
              else
                ImportarVendaZEUS_FE('', '', dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, 46, True, dtpMovimentoImportacao.Date);

            end
            else
              ImportarVendaZEUS_FE('', '', dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, 5, True, dtpMovimentoImportacao.Date);

            dmMProvider.cdsConfigECF.Next;

          end;

          if not dmMProvider.fdmImpCupom.IsEmpty  then
          begin

            if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
              + 'A leitura do arquivo foi conclu�da.'+#13
              + 'Deseja gravar as informa��es no banco de dados?'),
              'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
            begin

              pgbProgressoGeralImp.Max      := 1;
              pgbProgressoGeralImp.Position := 1;

              lblMsgProgresso.Caption := 'Aguarde..estornando registro 60 mestre - SINTEGRA' + #13 +
                                        'Estornando registro 60 anal�tico - SINTEGRA';

              lblMsgProgresso.Visible := true;
              Application.ProcessMessages;

              dmMProvider.fdmImpReg60M.First;

              Man_Tab_Registro_60M(1, dtpMovimentoImportacao.Date);

              dmMSProcedure.fdspMaster.StoredProcName := 'RETORNA_GNR_REG60M';
              dmMSProcedure.fdspMaster.Prepare;
              dmMSProcedure.fdspMaster.ExecProc;

              Man_Tab_Registro_60A(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60D(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60I(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60R(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_C405(1);
              Man_Tab_Registro_C410(1,'');
              Man_Tab_Registro_C420(1);
              Man_Tab_Registro_C490(1);
              Man_Tab_LivroSaida(1);

              lblMsgProgresso.Caption := 'Aguarde..estornando movimento de venda..' + #13
                                        +'Estornando saldo de produtos...' + #13
                                        +'Estornando registros sintegra: 60 di�rio, item, e mensal';
              lblMsgProgresso.Visible := true;
              pgbProgressoImportacao.Position := 0;
              Application.ProcessMessages;

              dmMProvider.fdmImpCupom.First;

              pgbProgressoImportacao.Max := dmMProvider.fdmImpCupom.RecordCount;

              //grava movimento de venda
              dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').Value             := 2;
              dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').Value          := 0;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO').Value    := 2;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').AsDate             := dtpMovimentoImportacao.Date;
              dmMSProcedure.fdspMovimento.ParamByName('IP_HORA').AsTime             := dmMProvider.fdmImpCupomHORA_ABERTURA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').Value            := dmDBEXMaster.iIdFilial;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').AsString      := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
              dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO').Value    := Ord(tdCUPOM);
              dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').Value               := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL').Value          := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE').Value           := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO').Value   := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA').Value     := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE').Value        := dmMProvider.fdmImpCupomQUANTIDADE.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO').Value    := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS').AsString         := '';//dmMProvider.fdmImpCupomBARRAS.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL').Value          := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR').Value        := -1;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM').Value     := dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM').Value    := 0;
              dmMSProcedure.fdspMovimento.ExecProc;

              Man_Tab_Registro_C460(1,dmMProvider.fdmImpCupomSITUACAO.Value);
              Man_Tab_Registro_C470(1,dmMProvider.fdmImpCupomSITUACAO.Value, dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value, dtpMovimentoImportacao.Date);

              while not dmMProvider.fdmImpCupom.eof do
              begin

                lblNumCx.Caption        := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value);
                lblDataCupom.Caption    := FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date);
                lblNumeroCupom.Caption  := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
                lblCodigoBarras.Caption := dmMProvider.fdmImpCupomBARRAS.Value;
                application.ProcessMessages;

                pgbProgressoImportacao.Position := dmMProvider.fdmImpCupom.RecNo;

                dmMProvider.cdsBarras.Close;
                dmMProvider.cdsBarras.ProviderName := 'dspBarras';

                dmDBEXMaster.fdqBarras.SQL.Clear;
                dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
                dmDBEXMaster.fdqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(dmMProvider.fdmImpCupomBARRAS.Value));

                dmMProvider.cdsBarras.Open;
                dmMProvider.cdsBarras.ProviderName := '';

                //atualiza sado de produto
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_OPCAO').Value                   := 2;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_OPERACAO').Value                := 1;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_NOTA_FISCAL').Value             := null;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_BARRAS').Value                  := dmMProvider.cdsBarrasBARRAS.AsString;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_QUANTIDADE').Value              := dmMProvider.fdmImpCupomQUANTIDADE.Value;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_LOCAL_MOVIMENTO').Value         := 0;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_PRODUTO').Value                 := 0;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_FILIAL').Value                  := dmDBEXMaster.iIdFilial;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_MODELO').AsString               := '2D';
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_DATA').Value                    := dmMProvider.fdmImpCupomEMISSAO.Value;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_ATUALIZAR_ALMOXARIFADO').Value  := 0;

                if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.AsInteger = 0 then
                  dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

                dmMProvider.fdmImpCupom.Next;

                Application.ProcessMessages;

              end;

              dmMProvider.fdmImpCheque.First;

              if not dmMProvider.fdmImpCheque.IsEmpty then
              begin

                lblMsgProgresso.Caption := 'Aguarde..efetuando estorno' + #13
                                         + 'de cheques a receber..';
                lblMsgProgresso.Visible := true;
                Application.ProcessMessages;

                pgbProgressoImportacao.Max    := dmMProvider.fdmImpCheque.RecordCount;

                while not dmMProvider.fdmImpCheque.eof do
                begin

                  pgbProgressoImportacao.Position := dmMProvider.fdmImpCheque.RecNo;

                  if dmMProvider.fdmImpChequeCHEQUE.Value <> '' then
                  begin

                    //grava cheques
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_OPCAO').Value                := 1;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CLIENTE').Value              := dmMProvider.fdmImpChequeCLIENTE.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_EMISSAO').AsDate             := dmMProvider.fdmImpChequeEMISSAO.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_BANCO').Value                := dmMProvider.fdmImpChequeBANCO.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_AGENCIA').AsString           := dmMProvider.fdmImpChequeAGENCIA.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CONTA').AsString             := dmMProvider.fdmImpChequeCONTA.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CHEQUE').AsString            := dmMProvider.fdmImpChequeCHEQUE.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_VENCIMENTO').AsDate          := dmMProvider.fdmImpChequeVENCIMENTO.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_VALOR').Value                := dmMProvider.fdmImpChequeVALOR.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_BAIXA').Value                := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_VALOR_RECEBIDO').Value       := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_TERCEIRO').Value             := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_NOME_TERCEIRO').Value        := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CPF_TERCEIRO').Value         := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_TELEFONE_TERCEIRO').Value    := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_DEPOSITO').Value             := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_ALINEA').Value               := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_STATUS').Value               := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CONTA_CORRENTE').Value       := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_DEVOLUCAO').Value            := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_REAPRESENTACAO').Value       := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_PLANO_DE_CONTAS').Value      := dmMProvider.fdmImpChequePL_CONTAS.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_ITEM_PLANO_DE_CONTAS').Value := dmMProvider.fdmImpChequeITEM_PL_CONTAS.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CUPOM').Value                := dmMProvider.fdmImpChequeCUPOM.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_LANCAMENTO').AsDate          := Date;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_OBS_REPASSADO').Value        := '';
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_OBSERVACAO').AsString        := '';
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_JUROS').Value                := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_SELECIONADO').Value          := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_GERADO').Value               := 0;
                    dmMSProcedure.fdspChequesREC.ExecProc;

                    dmMProvider.cdsPesqClientes.Close;
                    dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                    dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                    dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                    dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + IntToStr(dmMProvider.fdmImpChequeCLIENTE.Value));

                    dmMProvider.cdsPesqClientes.Open;
                    dmMProvider.cdsPesqClientes.ProviderName := '';

                    dmMSProcedure.fdspMaster.StoredProcName := 'ATUALIZASALDOCLIENTE';
                    dmMSProcedure.fdspMaster.Prepare;
                    dmMSProcedure.fdspMaster.ParamByName('OPCAO').Value  := 1;
                    dmMSProcedure.fdspMaster.ParamByName('CNPJ').Value   := dmMProvider.cdsPesqClientesCNPJ.Value;
                    dmMSProcedure.fdspMaster.ParamByName('VALOR').Value  := dmMProvider.fdmImpChequeVALOR.Value;
                    dmMSProcedure.fdspMaster.Prepare;
                    dmMSProcedure.fdspMaster.ExecProc;

                  end;

                  dmMProvider.fdmImpCheque.Next;

                  Application.ProcessMessages;

                end;

              end;

              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

            end;

            lblMsgProgresso.Caption := '';
            lblMsgProgresso.Visible := false;
            Application.ProcessMessages;

          end
          else if not dmMProvider.fdmImpReg60M.IsEmpty then
          begin

            if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
              + 'A leitura do arquivo foi conclu�da.'+#13
              + 'Deseja gravar as informa��es no banco de dados?'),
              'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
            begin

              pgbProgressoGeralImp.Max      := 1;
              pgbProgressoGeralImp.Position := 1;

              lblMsgProgresso.Caption := 'Aguarde..estornando registros fiscais!';
              lblMsgProgresso.Visible := true;
              Application.ProcessMessages;

              dmMProvider.fdmImpReg60M.First;

              Man_Tab_Registro_60M(1, dtpMovimentoImportacao.Date);
              Man_Tab_Registro_60A(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60D(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60I(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60R(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_C405(1);
              Man_Tab_Registro_C410(1,'');
              Man_Tab_Registro_C420(1);
              Man_Tab_Registro_C490(1);
              Man_Tab_LivroSaida(1);

              lblMsgProgresso.Caption := '';
              lblMsgProgresso.Visible := False;
              pgbProgressoImportacao.Position := 0;
              Application.ProcessMessages;

              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

            end;

          end;

          Man_Tab_ArqImportado(1);

          dmMProvider.fdmImpCupom.SaveToFile(ExtractFilePath(Application.ExeName)
                                            + 'ImportacaoPDV\Estorno' + FormatDateTime('ddmmyyyy',dtpMovimentoImportacao.Date)
                                            + '_' + FormatDateTime('ddmmyyyy',Date) +'Cupom.xml');
          dmMProvider.fdmImpCupom.Close;

        end;

      end;
    4:begin

        dmMProvider.cdsConfigECF.First;

        //verifica se o arquivo j� foi importado
        dmDBEXMaster.fdqValidarImportacao.Close;
        dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_NOME_ARQUIVO').AsString   := '';
        dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_DATA_MOVIMENTO').AsDate   := dtpMovimentoImportacao.Date;
        dmDBEXMaster.fdqValidarImportacao.Open;

        if dmDBEXMaster.fdqValidarImportacao.IsEmpty then
        begin

          Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
            + 'O movimento do dia ' + FormatDateTime('dd/mm/yyyy', dtpMovimentoImportacao.Date )
            + ' n�o foi importado.' + #13 + #13
            + 'Para realizar o estorno'
            + '� necess�rio que se realize uma importa��o!'),
            'Aten��o!', mb_IconWarning + mb_Ok);

        end
        else
        begin

          InicializarTabelas_Temp_Automacao;

          dmMZeus.cdsZan_M05.Close;
          dmMZeus.cdsZan_M05.ProviderName := 'dspZan_M05';

          while not dmMProvider.cdsConfigECF.Eof do
          begin

            dmMDJPdv.cdsReducaoZ.Close;
            dmMDJPdv.cdsReducaoZ.ProviderName := 'dspReducaoZ';

            dmMDJPdv.fdqReducaoZ.SQL.Clear;
            dmMDJPdv.fdqReducaoZ.SQL.Add('select * from reducaoz');
            dmMDJPdv.fdqReducaoZ.SQL.Add('where codecf = ' + QuotedStr(IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value)));
            dmMDJPdv.fdqReducaoZ.SQL.Add('and codloja = ' + IntToStr(dmDBEXMaster.iIdFilial));
            dmMDJPdv.fdqReducaoZ.SQL.Add('and data_movimento = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));

            dmMDJPdv.cdsReducaoZ.Open;
            dmMDJPdv.cdsReducaoZ.ProviderName := '';

            //verifica se o movimento foi gravado
            if dmMDJPdv.cdsReducaoZ.IsEmpty then
            begin
              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'N�o foi/foram encontrado(s) registros de movimento para a data selecionada:  ' + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date) + #13
                + 'referente ao ECF: ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + '/' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value +#13 +#13
                + 'Verifique se a redu��o Z foi emitida!'), 'Aten��o!', mb_IconWarning + mb_Ok);

            end
            else
              ImportarVendaDJPdv(dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, True, dtpMovimentoImportacao.Date);

            dmMProvider.cdsConfigECF.Next;

          end;

          if not dmMProvider.fdmImpCupom.IsEmpty  then
          begin

            if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
              + 'A leitura do arquivo foi conclu�da.'+#13
              + 'Deseja gravar as informa��es no banco de dados?'),
              'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
            begin

              pgbProgressoGeralImp.Max      := 1;
              pgbProgressoGeralImp.Position := 1;

              lblMsgProgresso.Caption := 'Aguarde..estornando registro 60 mestre - SINTEGRA' + #13 +
                                        'Estornando registro 60 anal�tico - SINTEGRA';

              lblMsgProgresso.Visible := true;
              Application.ProcessMessages;

              dmMProvider.fdmImpReg60M.First;

              Man_Tab_Registro_60M(1, dtpMovimentoImportacao.Date);

              dmMSProcedure.fdspMaster.StoredProcName := 'RETORNA_GNR_REG60M';
              dmMSProcedure.fdspMaster.Prepare;
              dmMSProcedure.fdspMaster.ExecProc;

              Man_Tab_Registro_60A(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60D(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60I(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60R(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_C405(1);
              Man_Tab_Registro_C410(1,'');
              Man_Tab_Registro_C420(1);
              Man_Tab_Registro_C490(1);
              Man_Tab_LivroSaida(1);

              lblMsgProgresso.Caption := 'Aguarde..estornando movimento de venda..' + #13
                                        +'Estornando saldo de produtos...' + #13
                                        +'Estornando registros sintegra: 60 di�rio, item, e mensal';
              lblMsgProgresso.Visible := true;
              pgbProgressoImportacao.Position := 0;
              Application.ProcessMessages;

              dmMProvider.fdmImpCupom.First;

              pgbProgressoImportacao.Max := dmMProvider.fdmImpCupom.RecordCount;

              //grava movimento de venda
              dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').Value             := 2;
              dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').Value          := 0;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO').Value    := 2;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').AsDate             := dtpMovimentoImportacao.Date;
              dmMSProcedure.fdspMovimento.ParamByName('IP_HORA').AsTime             := dmMProvider.fdmImpCupomHORA_ABERTURA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').Value            := dmDBEXMaster.iIdFilial;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').AsString      := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
              dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO').Value    := Ord(tdCUPOM);
              dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').Value               := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL').Value          := dmMProvider.fdmImpCupomNUMERO_CAIXA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE').Value           := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO').Value   := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA').Value     := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE').Value        := dmMProvider.fdmImpCupomQUANTIDADE.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO').Value    := dmMProvider.fdmImpCupomVALOR_UNITARIO.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS').AsString         := '';//dmMProvider.fdmImpCupomBARRAS.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL').Value          := dmMProvider.fdmImpCupomSUB_TOTAL.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR').Value        := -1;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM').Value     := dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM').Value    := 0;
              dmMSProcedure.fdspMovimento.ExecProc;

              Man_Tab_Registro_C460(1,dmMProvider.fdmImpCupomSITUACAO.Value);
              Man_Tab_Registro_C470(1,dmMProvider.fdmImpCupomSITUACAO.Value, dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value, dtpMovimentoImportacao.Date);

              while not dmMProvider.fdmImpCupom.eof do
              begin

                lblNumCx.Caption        := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value);
                lblDataCupom.Caption    := FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date);
                lblNumeroCupom.Caption  := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
                lblCodigoBarras.Caption := dmMProvider.fdmImpCupomBARRAS.Value;
                application.ProcessMessages;

                pgbProgressoImportacao.Position := dmMProvider.fdmImpCupom.RecNo;

                dmMProvider.cdsBarras.Close;
                dmMProvider.cdsBarras.ProviderName := 'dspBarras';

                dmDBEXMaster.fdqBarras.SQL.Clear;
                dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
                dmDBEXMaster.fdqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(dmMProvider.fdmImpCupomBARRAS.Value));

                dmMProvider.cdsBarras.Open;
                dmMProvider.cdsBarras.ProviderName := '';

                //atualiza sado de produto
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_OPCAO').Value                   := 2;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_OPERACAO').Value                := 1;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_NOTA_FISCAL').Value             := null;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_BARRAS').Value                  := dmMProvider.cdsBarrasBARRAS.AsString;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_QUANTIDADE').Value              := dmMProvider.fdmImpCupomQUANTIDADE.Value;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_LOCAL_MOVIMENTO').Value         := 0;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_PRODUTO').Value                 := 0;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_FILIAL').Value                  := dmDBEXMaster.iIdFilial;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_MODELO').AsString               := '2D';
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_DATA').Value                    := dmMProvider.fdmImpCupomEMISSAO.Value;
                dmMSProcedure.fdspAtualizarSaldoProduto.ParamByName('IP_ATUALIZAR_ALMOXARIFADO').Value  := 0;

                if dmMProvider.cdsConfiguracoesINTEGRAR_BALCAO_ZEUS.AsInteger = 0 then
                  dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

                dmMProvider.fdmImpCupom.Next;

                Application.ProcessMessages;

              end;

              dmMProvider.fdmImpCheque.First;

              if not dmMProvider.fdmImpCheque.IsEmpty then
              begin

                lblMsgProgresso.Caption := 'Aguarde..efetuando estorno' + #13
                                         + 'de cheques a receber..';
                lblMsgProgresso.Visible := true;
                Application.ProcessMessages;

                pgbProgressoImportacao.Max    := dmMProvider.fdmImpCheque.RecordCount;

                while not dmMProvider.fdmImpCheque.eof do
                begin

                  pgbProgressoImportacao.Position := dmMProvider.fdmImpCheque.RecNo;

                  if dmMProvider.fdmImpChequeCHEQUE.Value <> '' then
                  begin

                    //grava cheques
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_OPCAO').Value                := 1;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CLIENTE').Value              := dmMProvider.fdmImpChequeCLIENTE.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_EMISSAO').AsDate             := dmMProvider.fdmImpChequeEMISSAO.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_BANCO').Value                := dmMProvider.fdmImpChequeBANCO.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_AGENCIA').AsString           := dmMProvider.fdmImpChequeAGENCIA.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CONTA').AsString             := dmMProvider.fdmImpChequeCONTA.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CHEQUE').AsString            := dmMProvider.fdmImpChequeCHEQUE.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_VENCIMENTO').AsDate          := dmMProvider.fdmImpChequeVENCIMENTO.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_VALOR').Value                := dmMProvider.fdmImpChequeVALOR.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_BAIXA').Value                := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_VALOR_RECEBIDO').Value       := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_TERCEIRO').Value             := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_NOME_TERCEIRO').Value        := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CPF_TERCEIRO').Value         := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_TELEFONE_TERCEIRO').Value    := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_DEPOSITO').Value             := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_ALINEA').Value               := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_STATUS').Value               := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CONTA_CORRENTE').Value       := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_DEVOLUCAO').Value            := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_REAPRESENTACAO').Value       := null;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_PLANO_DE_CONTAS').Value      := dmMProvider.fdmImpChequePL_CONTAS.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_ITEM_PLANO_DE_CONTAS').Value := dmMProvider.fdmImpChequeITEM_PL_CONTAS.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_CUPOM').Value                := dmMProvider.fdmImpChequeCUPOM.Value;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_LANCAMENTO').AsDate          := Date;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_OBS_REPASSADO').Value        := '';
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_OBSERVACAO').AsString        := '';
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_JUROS').Value                := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_SELECIONADO').Value          := 0;
                    dmMSProcedure.fdspChequesREC.ParamByName('IP_GERADO').Value               := 0;
                    dmMSProcedure.fdspChequesREC.ExecProc;

                    dmMProvider.cdsPesqClientes.Close;
                    dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                    dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                    dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                    dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + IntToStr(dmMProvider.fdmImpChequeCLIENTE.Value));

                    dmMProvider.cdsPesqClientes.Open;
                    dmMProvider.cdsPesqClientes.ProviderName := '';

                    dmMSProcedure.fdspMaster.StoredProcName := 'ATUALIZASALDOCLIENTE';
                    dmMSProcedure.fdspMaster.Prepare;
                    dmMSProcedure.fdspMaster.ParamByName('OPCAO').Value  := 1;
                    dmMSProcedure.fdspMaster.ParamByName('CNPJ').Value   := dmMProvider.cdsPesqClientesCNPJ.Value;
                    dmMSProcedure.fdspMaster.ParamByName('VALOR').Value  := dmMProvider.fdmImpChequeVALOR.Value;
                    dmMSProcedure.fdspMaster.Prepare;
                    dmMSProcedure.fdspMaster.ExecProc;

                  end;

                  dmMProvider.fdmImpCheque.Next;

                  Application.ProcessMessages;

                end;

              end;

              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

            end;

            lblMsgProgresso.Caption := '';
            lblMsgProgresso.Visible := false;
            Application.ProcessMessages;

          end
          else if not dmMProvider.fdmImpReg60M.IsEmpty then
          begin

            if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
              + 'A leitura do arquivo foi conclu�da.'+#13
              + 'Deseja gravar as informa��es no banco de dados?'),
              'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
            begin

              pgbProgressoGeralImp.Max      := 1;
              pgbProgressoGeralImp.Position := 1;

              lblMsgProgresso.Caption := 'Aguarde..estornando registros fiscais!';
              lblMsgProgresso.Visible := true;
              Application.ProcessMessages;

              dmMProvider.fdmImpReg60M.First;

              Man_Tab_Registro_60M(1, dtpMovimentoImportacao.Date);
              Man_Tab_Registro_60A(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60D(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60I(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_60R(1, dtpMovimentoImportacao.DateTime);
              Man_Tab_Registro_C405(1);
              Man_Tab_Registro_C410(1,'');
              Man_Tab_Registro_C420(1);
              Man_Tab_Registro_C490(1);
              Man_Tab_LivroSaida(1);

              lblMsgProgresso.Caption := '';
              lblMsgProgresso.Visible := False;
              pgbProgressoImportacao.Position := 0;
              Application.ProcessMessages;

              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

            end;

          end;

          Man_Tab_ArqImportado(1);

          dmMProvider.fdmImpCupom.SaveToFile(ExtractFilePath(Application.ExeName)
                                            + 'ImportacaoPDV\Estorno' + FormatDateTime('ddmmyyyy',dtpMovimentoImportacao.Date)
                                            + '_' + FormatDateTime('ddmmyyyy',Date) +'Cupom.xml');
          dmMProvider.fdmImpCupom.Close;

        end;

      end;

  end;

  pgbProgressoGeralImp.Position     := 0;
  pgbProgressoImportacao.Position   := 0;

end;

procedure TfrmAutomacao.Man_Tab_Registro_60M(pOpcao:smallint; pData:TDateTime);
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

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_Reg60M.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmAutomacao.Man_tab_Registro_60A(pOpcao:smallint;pData:TDateTime);
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

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_Reg60A.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmAutomacao.Man_Tab_LivroSaida(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspLivroSaida.ParamByName('IP_OPCAO').value                  := pOpcao;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_LIVRO_SAIDA').value            := -1;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_FILIAL').value                 := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspLivroSaida.ParamByName('IP_MES_ANO').value                := FormatDateTime('mmyyyy', dmMProvider.fdmImpReg60ADATA_EMISSAO.Value);

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 1 then
      dmMSProcedure.fdspLivroSaida.ParamByName('IP_TIPO_ESPECIE_DOCUMENTO').value := 'NFCE'
    else
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

        cIsentasNTTemp                                                              := cIsentasNTTemp + dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value;

        dmMSProcedure.fdspLivroSaida.ParamByName('IP_VALOR_CONTABIL').value         := cIsentasNTTemp;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_BASE_CALCULO').value           := 0;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_ALIQUOTA').value               := 0;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_IMPOSTO_DEBITADO').value       := 0;
        dmMSProcedure.fdspLivroSaida.ParamByName('IP_ISENTAS_NAO_TRIBUTADAS').value := cIsentasNTTemp;
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

procedure TfrmAutomacao.Man_Tab_Movimento(pOpcao:smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').AsInteger           := pOpcao;
    dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').AsInteger        := 0;
    dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO').AsInteger  := 2;
    dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').AsDate               := dtpMovimentoImportacao.DateTime;
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
      if dmMProvider.fdmImpCupomSITUACAO.Value = 0 then
        dmMSProcedure.fdspMovimento.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;
end;

procedure TfrmAutomacao.Atualizar_Saldo_Produto(pOpcao:smallint);
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

procedure TfrmAutomacao.Man_Tab_Registro_60D(pOpcao:smallint; pData:TDateTime);
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

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_Reg60D.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmAutomacao.Man_Tab_Registro_60I(pOpcao:smallint; pData:TDateTime);
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

    dmMSProcedure.fdspMan_Tab_Reg60I.ParamByName('IP_BARRAS').Value             := dmMProvider.fdmImpCupomBARRAS.Value;//dmMProvider.cdsBarrasBARRAS.AsString;

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_Reg60I.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmAutomacao.Man_Tab_Registro_60R(pOpcao:smallint; pData:TDateTime);
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
    
    dmMSProcedure.fdspMan_Tab_Reg60R.ParamByName('IP_BARRAS').Value             := dmMProvider.fdmImpCupomBARRAS.Value;//dmMProvider.cdsBarrasBARRAS.AsString;

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_Reg60R.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;
    
  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;
      
  end;

end;

procedure TfrmAutomacao.Man_Tab_ArqImportado(pOpcao: smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[0].Value := pOpcao;
    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[1].Value := Date;
    dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.Params[2].Value := dtpMovimentoImportacao.Date;
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

procedure TfrmAutomacao.Man_Tab_ChqRec(pOpcao:smallint);
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

procedure TfrmAutomacao.Man_Tab_CRE(pOpcao:smallint);
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

procedure TfrmAutomacao.Atualizar_Saldo_Cliente(pOpcao:smallint;pCliente:integer; pValor:Currency);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;
  
    dmMProvider.cdsPesqClientes.Close;
    dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

    dmDBEXMaster.fdqPesqCliente.SQL.Clear;
    dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
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

procedure TfrmAutomacao.acImportarMovimentoExecute(Sender: TObject);
var
  iContador,i: integer;
begin

  cIsentasNTTemp  := 0;
  bJaPassou       := false;

  LimparMSG_ERRO(lblMsg, nil);

  try

    { TODO 1 -olindomar -cimplementa��o : mudar importa��o para acesso direto ao banco }
    lblNumCx.Caption        := '';
    lblDataCupom.Caption    := lblNumCx.Caption;
    lblNumeroCupom.Caption  := lblNumCx.Caption;
    lblCodigoBarras.Caption := lblNumCx.Caption;
    Application.ProcessMessages;

    pgcAutomacao.Pages[3].TabVisible := False;

    cIsentasNTTemp  := 0;
    bJaPassou       := false;

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'ImportacaoPDV') then
      ForceDirectories(ExtractFilePath(Application.ExeName)+'ImportacaoPDV\');

    case dmMProvider.cdsConfiguracoesMODELOPDV.AsInteger of
      3:begin //Zeus Front End

          dmMProvider.cdsConfigECF.First;

          //verifica se o arquivo j� foi importado
          dmDBEXMaster.fdqValidarImportacao.Close;
          dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_NOME_ARQUIVO').AsString   := '';//edtArquivoImportado.Text;
          dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_DATA_MOVIMENTO').AsDate   := dtpMovimentoImportacao.Date;
          dmDBEXMaster.fdqValidarImportacao.Open;

          if not dmDBEXMaster.fdqValidarImportacao.IsEmpty then
          begin

            Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
              + 'O movimento do dia ' + FormatDateTime('dd/mm/yyyy', dtpMovimentoImportacao.Date)
              + ' foi importado em : '
              + FormatDateTime('dd/mm/yyyy',dmDBEXMaster.fdqValidarImportacao.FieldByName('OP_DATA_IMPORTACAO').AsDateTime)+#13+#13
              + 'Para realizar outra importa��o ser� necess�rio efetuar o estorno!'), 'Aten��o!', mb_IconWarning + mb_Ok);

          end
          else
          begin

            InicializarTabelas_Temp_Automacao;

            while not dmMProvider.cdsConfigECF.Eof do
            begin

              dmMZeus.cdsZan_M05.Close;
              dmMZeus.cdsZan_M05.ProviderName := 'dspZan_M05';

              dmMZeus.fdqZan_M05.SQL.Clear;
              dmMZeus.fdqZan_M05.SQL.Add('select * from zan_m05');
              //data do movimento
              dmMZeus.fdqZan_M05.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
              //serie ecf
              dmMZeus.fdqZan_M05.SQL.Add('and m05bb = ' + QuotedStr(Trim(dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value)));
              //loja
              dmMZeus.fdqZan_M05.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));

              dmMZeus.cdsZan_M05.Open;
              dmMZeus.cdsZan_M05.ProviderName := '';
              //verifica se o movimento foi gravado
              if dmMZeus.cdsZan_M05.IsEmpty then
              begin

                dmMZeus.cdsZan_M46.Close;
                dmMZeus.cdsZan_M46.ProviderName := 'dspZan_M46';

                dmMZeus.fdqZan_M46.SQL.Clear;
                dmMZeus.fdqZan_M46.SQL.Add('select * from zan_m46');
                //data do movimento
                dmMZeus.fdqZan_M46.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
                //serie ecf
                dmMZeus.fdqZan_M46.SQL.Add('and m46bb = ' + QuotedStr(Trim(dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value)));
                //loja
                dmMZeus.fdqZan_M46.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
                //tipo de coleta informa��es / lidos do ecf ante da redu��o
                dmMZeus.fdqZan_M46.SQL.Add('and m46bl = 1');

                dmMZeus.cdsZan_M46.Open;
                dmMZeus.cdsZan_M46.ProviderName := '';

                if dmMZeus.cdsZan_M46.IsEmpty then
                begin

                  dmMZeus.cdsZan_M0_51.Close;
                  dmMZeus.cdsZan_M0_51.ProviderName := 'dspZan_M0_51';

                  dmMZeus.fdqZan_M0_51.SQL.Clear;
                  dmMZeus.fdqZan_M0_51.SQL.Add('select * from zan_m051');
                  //data do movimento
                  dmMZeus.fdqZan_M0_51.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
                  //serie ecf
                  dmMZeus.fdqZan_M0_51.SQL.Add('and m05bb = ' + QuotedStr(Trim(dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value)));
                  //loja
                  dmMZeus.fdqZan_M0_51.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
{                  //tipo de coleta informa��es / lidos do ecf ante da redu��o
                  dmMZeus.fdqZan_M051.SQL.Add('and m05bl = 1');}

                  dmMZeus.cdsZan_M0_51.Open;
                  dmMZeus.cdsZan_M0_51.ProviderName := '';

                  if dmMZeus.cdsZan_M0_51.IsEmpty then
                  begin

                    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                      + 'N�o foi/foram encontrado(s) registros de movimento para a data selecionad:  ' + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date) + #13
                      + 'referente ao ECF: ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + '/' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value +#13 +#13
                      + 'Verifique se a redu��o Z foi emitida!'), 'Aten��o!', mb_IconWarning + mb_Ok);

                  end
                  else
                    ImportarVendaZEUS_FE('', '', dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, 51, True, dtpMovimentoImportacao.Date);

                end
                else
                  ImportarVendaZEUS_FE('', '', dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, 46, True, dtpMovimentoImportacao.Date);

              end
              else
                ImportarVendaZEUS_FE('', '', dmDBEXMaster.iIdFilial, dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger,chkCaixas, 5, True, dtpMovimentoImportacao.Date);

              dmMProvider.cdsConfigECF.Next;

            end;

            frmAutomacao.pgbProgressoGeralImp.Position    := 0;
            frmAutomacao.pgbProgressoImportacao.Position  := 0;

            if not (dmMProvider.fdmImpCupom.IsEmpty) or not (dmMProvider.fdmImpReg60M.IsEmpty)  then
            begin

              if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'A leitura do arquivo foi conclu�da.'+#13
                + 'Deseja gravar as informa��es no banco de dados?'),
                'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
              begin

                dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.ParamByName('IP_OPCAO').Value           := 0;
                dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.ParamByName('IP_DATA_IMPORTACAO').Value := Date;;
                dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.ParamByName('IP_DATA_MOVIMENTO').Value  := dtpMovimentoImportacao.Date;
                dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.ParamByName('IP_ARQUIVO').Value         := '';//edtArquivoImportado.Text;
                dmMSProcedure.fdspMan_Tab_Arq_Imp_Prod.ExecProc;


                lblMsgProgresso.Caption := 'Aguarde..gerando registro 60 mestre - SINTEGRA' + #13 +
                                           'Registro 60 anal�tico - SINTEGRA';

                lblMsgProgresso.Visible := true;

                dmMProvider.fdmImpReg60M.First;

                frmAutomacao.pgbProgressoImportacao.Max := dmMProvider.fdmImpReg60M.RecordCount;

                while not dmMProvider.fdmImpReg60M.Eof do
                begin

                  frmAutomacao.pgbProgressoImportacao.Position  := dmMProvider.fdmImpReg60M.RecNo;
                  Application.ProcessMessages;

                  Man_Tab_Registro_60M(0, dtpMovimentoImportacao.Date);

                  Man_Tab_Registro_C405(0);

                  dmMSProcedure.fdspMaster.StoredProcName := 'RETORNA_GNR_REG60M';
                  dmMSProcedure.fdspMaster.Prepare;
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.fdmImpReg60A.First;
                  dmMProvider.fdmImpReg60A.Filtered := False;
                  dmMProvider.fdmImpReg60A.Filter   := 'SERIE_ECF = ' + QuotedStr(dmMProvider.fdmImpReg60MSERIE_ECF.Value);
                  dmMProvider.fdmImpReg60A.Filtered := True;

                  while not dmMProvider.fdmImpReg60A.Eof do
                  begin

                    Man_tab_Registro_60A(0, dtpMovimentoImportacao.DateTime);

                    if dmMProvider.fdmImpReg60MVENDA_BRUTA.Value >  0 then
                      Man_Tab_Registro_C420(0);

                    if dmMProvider.fdmImpReg60ACRZ.Value <> dmMSProcedure.fdspLivroSaida.ParamByName('IP_CRZ').value then
                      cIsentasNTTemp := 0;

                    Man_Tab_LivroSaida(0);

                    dmMProvider.fdmImpReg60A.Next;

                  end;

                  dmMProvider.fdmImpReg60M.Next;

                end;

                frmAutomacao.pgbProgressoImportacao.Max := dmMProvider.fdmImpCupom.RecordCount;

                lblMsgProgresso.Caption := 'Aguarde..gerando movimento de venda..' + #13
                                          +'Atualizando saldo de produtos...' + #13
                                          +'Registros sintegra: 60 di�rio, item, e mensal';

                lblMsgProgresso.Visible := true;
                Application.ProcessMessages;

                dmMProvider.fdmImpCupom.First;
                pgbProgressoImportacao.Max    := dmMProvider.fdmImpCupom.RecordCount;

                memLogProdutos.Clear;

                while not dmMProvider.fdmImpCupom.eof do
                begin

                  pgbProgressoImportacao.Position := dmMProvider.fdmImpCupom.RecNo;
                  Application.ProcessMessages;
                  //grava movimento de venda

                  if dmMProvider.fdmImpCupomSITUACAO.Value = 0 then
                  begin

                    dmMProvider.cdsBarras.Close;
                    dmMProvider.cdsBarras.ProviderName := 'dspBarras';

                    dmDBEXMaster.fdqBarras.Close;
                    dmDBEXMaster.fdqBarras.SQL.Clear;
                    dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
                    dmDBEXMaster.fdqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(dmMProvider.fdmImpCupomBARRAS.Value));

                    dmMProvider.cdsBarras.Open;
                    dmMProvider.cdsBarras.ProviderName := '';

                    if not dmMProvider.cdsBarras.IsEmpty then
                    begin

                      dmMProvider.cdsPesqProdutos.Close;
                      dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

                      dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.* ,UND.PERMITE_VENDA_FRACIONADA AS FRACAO FROM PRODUTO PRO');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('WHERE PRO.PRODUTO = ' + IntToStr(dmMProvider.cdsBarrasPRODUTO.AsInteger));

                      dmMProvider.cdsPesqProdutos.Open;;
                      dmMProvider.cdsPesqProdutos.ProviderName := '';

                      if not dmMProvider.cdsPesqProdutos.IsEmpty then
                      begin

                        dmMProvider.cdsTributacao.Close;
                        dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';;

                        dmDBEXMaster.fdqTributacao.Close;
                        dmDBEXMaster.fdqTributacao.SQL.Clear;
                        dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
                        dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.fdmImpCupomTRIBUTACAO.Value));

                        dmMProvider.cdsTributacao.Open;
                        dmMProvider.cdsTributacao.ProviderName := '';;

                        lblNumCx.Caption        := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value);
                        lblDataCupom.Caption    := FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date);
                        lblNumeroCupom.Caption  := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
                        lblCodigoBarras.Caption := dmMProvider.fdmImpCupomBARRAS.Value;
                        application.ProcessMessages;

                        Man_Tab_Movimento(1);
                        //atualiza sado de produto
                        Atualizar_Saldo_Produto(2);
                        //grava registro 60 diario
                        Man_Tab_Registro_60D(0, dtpMovimentoImportacao.Date);
                        Man_Tab_Registro_C410(0,dmMProvider.fdmImpCupomBARRAS.Value);
                        Man_Tab_Registro_C460(0,dmMProvider.fdmImpCupomSITUACAO.Value);

                        if dmMProvider.fdmImpCupomSITUACAO.AsInteger = 0 then
                          Man_Tab_Registro_C470(0,dmMProvider.fdmImpCupomSITUACAO.Value,dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value, dtpMovimentoImportacao.Date);

                        Man_Tab_Registro_C490(0);

                        //grava registro 60 item
                        Man_Tab_Registro_60I(0, dtpMovimentoImportacao.Date);

                        //grava registro 60 mensal
                        Man_Tab_Registro_60R(0, dtpMovimentoImportacao.Date);

                      end;

                    end
                    else
                    begin

                      memLogProdutos.Lines.Add('C�digo de barras n�o encontrado: ' + dmMProvider.fdmImpCupomBARRAS.Value);
                      memLogProdutos.Lines.Add('Dados do Cupom');
                      memLogProdutos.Lines.Add(' ');
                      memLogProdutos.Lines.Add('N Cupom/Num Caixa/Data');
                      memLogProdutos.Lines.Add(' ' + FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value) + '/'
                                              + '      ' + FormatFloat('000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value) + '/'
                                              + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date));
                      memLogProdutos.Lines.Add('----------------------------------------------');

                    end;

                  end
                  else
                  begin

                    Man_Tab_Registro_C460(0,dmMProvider.fdmImpCupomSITUACAO.Value);

                  end;

                  dmMProvider.fdmImpCupom.Next;
                  Application.ProcessMessages;

                end;

              end;

              if memLogProdutos.Lines.Count > 0 then
              begin

                Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                  + 'Verifique o log de importa��o de produtos!'),
                  'Aten��o!', mb_IconInformation + mb_Ok);

                pgcAutomacao.Pages[3].TabVisible := True;
                pgcAutomacao.ActivePageIndex := 3;

              end;

              case dmMProvider.cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.AsInteger of
                1:begin

                    dmMProvider.fdmImpCheque.First;

                    if not dmMProvider.fdmImpCheque.IsEmpty then
                    begin

                      lblMsgProgresso.Caption := 'Aguarde..efetuando lan�amentos' + #13
                                               + 'de cheques a receber..';
                      lblMsgProgresso.Visible := true;
                      Application.ProcessMessages;

                      pgbProgressoImportacao.Max    := dmMProvider.fdmImpCheque.RecordCount;

                      memLogCheques.Clear;

                      while not dmMProvider.fdmImpCheque.eof do
                      begin

                        pgbProgressoImportacao.Position := dmMProvider.fdmImpCheque.RecNo;
                        if dmMProvider.fdmImpChequeCHEQUE.Value <> '' then
                        begin

                          dmMProvider.cdsBancos.Close;
                          dmMProvider.cdsBancos.ProviderName := 'dspBancos';

                          dmDBEXMaster.fdqBancos.SQL.Clear;
                          dmDBEXMaster.fdqBancos.SQL.Add('SELECT * FROM BANCOS');
                          dmDBEXMaster.fdqBancos.SQL.Add('WHERE BANCO = ' + IntToStr(dmMProvider.fdmImpChequeBANCO.Value));

                          dmMProvider.cdsBancos.Open;
                          dmMProvider.cdsBancos.ProviderName := '';

                          if not dmMProvider.cdsBancos.IsEmpty then
                          begin

                            //grava cheques
                            Man_Tab_ChqRec(0);

                            Atualizar_Saldo_Cliente(0,dmMProvider.fdmImpChequeCLIENTE.Value,dmMProvider.fdmImpChequeVALOR.Value);

                          end
                          else
                          begin

                            memLogCheques.Lines.Add('Banco n�o cadastrado: ' + IntToStr(dmMProvider.fdmImpChequeBANCO.Value));
                            memLogCheques.Lines.Add('Dados do Cheque');
                            memLogCheques.Lines.Add(' ');
                            memLogCheques.Lines.Add('CHEQUE/AGENCIA/CONTA/CLIENTE/VALOR');
                            memLogCheques.Lines.Add(dmMProvider.fdmImpChequeCHEQUE.Value+ '/'
                                                    + dmMProvider.fdmImpChequeAGENCIA.Value + '/'
                                                    + dmMProvider.fdmImpChequeCONTA.Value+ '/'
                                                    + IntToStr(dmMProvider.fdmImpChequeCLIENTE.Value)+ '/'
                                                    +FormatFloat('#,##0.00',dmMProvider.fdmImpChequeVALOR.Value));
                            memLogCheques.Lines.Add('-------------------------');

                          end;


                        end;

                        dmMProvider.fdmImpCheque.Next;

                        Application.ProcessMessages;
                      end;

                    end;
                end;
              end;

              if not dmMProvider.cdsPedidoZeus.IsEmpty then
              begin

                dmMProvider.fdmFinalizadoraPedido.First;

                lblMsgProgresso.Caption := 'Aguarde..atualizando informa��es pedido..!';
                lblMsgProgresso.Visible := true;
                pgbProgressoImportacao.Position := 0;
                Application.ProcessMessages;

                while not dmMProvider.fdmFinalizadoraPedido.Eof do
                begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where codigoecf = ' + QuotedStr(FormatFloat('00',StrToFloat(dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value))));

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

                  if not dmMProvider.cdsFormasPagamento.IsEmpty then
                  begin

                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[0].Value     := 0;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[1].Value     := dmDBEXMaster.iIdFilial;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[2].Value     := dmMProvider.fdmFinalizadoraPedidoCODIGO_PEDIDO.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[3].Value     := dmMProvider.cdsFormasPagamentoFORMAPAGAMENTO.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[4].Value     := Trim(dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value);
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[5].Value     := dmMProvider.fdmFinalizadoraPedidoVALOR.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[6].Value     := dmMProvider.cdsFormasPagamentoPARCELAS.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[7].Value     := dmMProvider.cdsFormasPagamentoTIPO.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.ExecProc;

                  end;

                  dmMProvider.fdmFinalizadoraPedido.Next;

                end;

              end;

              lblMsgProgresso.Caption := 'Aguarde..atualizando estat�sticas finaceira..!';
              lblMsgProgresso.Visible := true;
              pgbProgressoImportacao.Position := 0;
              Application.ProcessMessages;

              if dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger = 1 then
              begin

                pgbProgressoImportacao.Max :=  dmMProvider.fdmImpFinanceiro.RecordCount;
                Application.ProcessMessages;

                if not dmMProvider.fdmImpFinanceiro.IsEmpty then
                begin

                  dmMProvider.fdmImpFinanceiro.First;

                  while not dmMProvider.fdmImpFinanceiro.Eof do
                  begin

                    pgbProgressoImportacao.Position :=  dmMProvider.fdmImpFinanceiro.Recno;
                    Application.ProcessMessages;

                    Man_Tab_CRE(0);

                    Atualizar_Saldo_Cliente(0,dmMProvider.fdmImpFinanceiroIP_SACADO.Value,dmMProvider.fdmImpFinanceiroIP_VALOR.Value);

                    dmMProvider.fdmImpFinanceiro.Next;

                  end;

                end;

              end;

              Man_Tab_ArqImportado(0);

              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

              if memLogCheques.Lines.Count > 0 then
              begin

                Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                  + 'Verifique o log de importa��o de cheques!'), 'Aten��o!', mb_IconInformation + mb_Ok);

                pgcAutomacao.Pages[3].TabVisible := True;
                pgcAutomacao.ActivePageIndex := 3;

              end;

              lblMsgProgresso.Caption := '';
              lblMsgProgresso.Visible := false;
              Application.ProcessMessages;

            end;

          end;

          dmMProvider.fdmImpCupom.SaveToFile(ExtractFilePath(Application.ExeName)
                                      + 'ImportacaoPDV\' + FormatDateTime('ddmmyyyy',dtpMovimentoImportacao.Date)
                                      + '_' + FormatDateTime('ddmmyyyy',Date) + 'Cupom.xml');
          dmMProvider.fdmImpCupom.Close;

        end;
      4:begin //djpDV

          dmMProvider.cdsConfigECF.First;

          //verifica se o arquivo j� foi importado
          dmDBEXMaster.fdqValidarImportacao.Close;
          dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_NOME_ARQUIVO').AsString   := '';//edtArquivoImportado.Text;
          dmDBEXMaster.fdqValidarImportacao.ParamByName('IP_DATA_MOVIMENTO').AsDate   := dtpMovimentoImportacao.Date;
          dmDBEXMaster.fdqValidarImportacao.Open;

          if not dmDBEXMaster.fdqValidarImportacao.IsEmpty then
          begin

            Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
              + 'O movimento do dia ' + FormatDateTime('dd/mm/yyyy', dtpMovimentoImportacao.Date)
              + ' foi importado em : '
              + FormatDateTime('dd/mm/yyyy',dmDBEXMaster.fdqValidarImportacao.FieldByName('OP_DATA_IMPORTACAO').AsDateTime)+#13+#13
              + 'Para realizar outra importa��o ser� necess�rio efetuar o estorno!'), 'Aten��o!', mb_IconWarning + mb_Ok);

          end
          else
          begin

            InicializarTabelas_Temp_Automacao;

            //while not dmMProvider.cdsConfigECF.Eof do
            for i := 0 to chkCaixas.Count-1 do
            begin

              if chkCaixas.Checked[i] then
              begin

                dmMDJPdv.cdsReducaoZ.Close;
                dmMDJPdv.cdsReducaoZ.ProviderName := 'dspReducaoZ';

                dmMDJPdv.fdqReducaoZ.SQL.Clear;
                dmMDJPdv.fdqReducaoZ.SQL.Add('select * from reducaoz');

  //              dmMDJPdv.fdqReducaoZ.SQL.Add('where codecf = ' + QuotedStr(IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value)));
                dmMDJPdv.fdqReducaoZ.SQL.Add('where codecf = ' + QuotedStr(IntToStr(StrToInt(Copy(chkCaixas.Items[i],4,2)))));
                dmMDJPdv.fdqReducaoZ.SQL.Add('and codloja = ' + IntToStr(dmDBEXMaster.iIdFilial));
                dmMDJPdv.fdqReducaoZ.SQL.Add('and data_movimento = ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));

                dmMDJPdv.cdsReducaoZ.Open;
                dmMDJPdv.cdsReducaoZ.ProviderName := '';

                 //verifica se o movimento foi gravado
                if dmMDJPdv.cdsReducaoZ.IsEmpty then
                begin
                  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                    + 'N�o foi/foram encontrado(s) registros de movimento para a data selecionada:  ' + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date) + #13
                    + 'referente ao ECF: ' + IntToStr(StrToInt(Copy(chkCaixas.Items[i],4,2))) + '/' + Trim(Copy(chkCaixas.Items[i],8,Length(chkCaixas.Items[i]))) +#13 +#13
                    + 'Verifique se a redu��o Z foi emitida!'), 'Aten��o!', mb_IconWarning + mb_Ok);

                end
                else
                  ImportarVendaDJPdv(dmDBEXMaster.iIdFilial, StrToInt(Copy(chkCaixas.Items[i],4,2)),chkCaixas, True, dtpMovimentoImportacao.Date);

              end;

//              dmMProvider.cdsConfigECF.Next;

            end;

            frmAutomacao.pgbProgressoGeralImp.Position    := 0;
            frmAutomacao.pgbProgressoImportacao.Position  := 0;

            if not (dmMProvider.fdmImpCupom.IsEmpty) or not (dmMProvider.fdmImpReg60M.IsEmpty)  then
            begin

              if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'A leitura do arquivo foi conclu�da.'+#13
                + 'Deseja gravar as informa��es no banco de dados?'),
                'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
              begin


                if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
                  lblMsgProgresso.Caption := 'Aguarde..gerando registro 60 mestre - SINTEGRA' + #13 +
                                             'Registro 60 anal�tico - SINTEGRA';

                lblMsgProgresso.Visible := true;

                dmMProvider.fdmImpReg60M.First;

                frmAutomacao.pgbProgressoImportacao.Max := dmMProvider.fdmImpReg60M.RecordCount;

                while not dmMProvider.fdmImpReg60M.Eof do
                begin

                  frmAutomacao.pgbProgressoImportacao.Position  := dmMProvider.fdmImpReg60M.RecNo;
                  Application.ProcessMessages;

                  Man_Tab_Registro_60M(0, dtpMovimentoImportacao.Date);

                  Man_Tab_Registro_C405(0);

                  dmMSProcedure.fdspMaster.StoredProcName := 'RETORNA_GNR_REG60M';
                  dmMSProcedure.fdspMaster.Prepare;
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.fdmImpReg60A.First;
                  dmMProvider.fdmImpReg60A.Filtered := False;
                  dmMProvider.fdmImpReg60A.Filter   := 'SERIE_ECF = ' + QuotedStr(dmMProvider.fdmImpReg60MSERIE_ECF.Value);
                  dmMProvider.fdmImpReg60A.Filtered := True;

                  while not dmMProvider.fdmImpReg60A.Eof do
                  begin

                    Man_tab_Registro_60A(0, dtpMovimentoImportacao.DateTime);

                    if dmMProvider.fdmImpReg60MVENDA_BRUTA.Value >  0 then
                      Man_Tab_Registro_C420(0);

                    if dmMProvider.fdmImpReg60ACRZ.Value <> dmMSProcedure.fdspLivroSaida.ParamByName('IP_CRZ').value then
                      cIsentasNTTemp := 0;

                    Man_Tab_LivroSaida(0);

                    dmMProvider.fdmImpReg60A.Next;

                  end;

                  dmMProvider.fdmImpReg60M.Next;

                end;

                frmAutomacao.pgbProgressoImportacao.Max := dmMProvider.fdmImpCupom.RecordCount;

                lblMsgProgresso.Caption := 'Aguarde..gerando movimento de venda..' + #13
                                          +'Atualizando saldo de produtos...' + #13;

                if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
                  lblMsgProgresso.Caption := lblMsgProgresso.Caption +'Registros sintegra: 60 di�rio, item, e mensal';

                lblMsgProgresso.Visible := true;
                Application.ProcessMessages;

                dmMProvider.fdmImpCupom.First;
                pgbProgressoImportacao.Max    := dmMProvider.fdmImpCupom.RecordCount;

                memLogProdutos.Clear;

                while not dmMProvider.fdmImpCupom.eof do
                begin

                  pgbProgressoImportacao.Position := dmMProvider.fdmImpCupom.RecNo;
                  Application.ProcessMessages;
                  //grava movimento de venda

                  if dmMProvider.fdmImpCupomSITUACAO.Value = 0 then
                  begin

                    dmMProvider.cdsBarras.Close;
                    dmMProvider.cdsBarras.ProviderName := 'dspBarras';

                    dmDBEXMaster.fdqBarras.Close;
                    dmDBEXMaster.fdqBarras.SQL.Clear;
                    dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
                    dmDBEXMaster.fdqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(dmMProvider.fdmImpCupomBARRAS.Value));

                    dmMProvider.cdsBarras.Open;
                    dmMProvider.cdsBarras.ProviderName := '';

                    if not dmMProvider.cdsBarras.IsEmpty then
                    begin

                      dmMProvider.cdsPesqProdutos.Close;
                      dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

                      dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.* ,UND.PERMITE_VENDA_FRACIONADA AS FRACAO FROM PRODUTO PRO');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
                      dmDBEXMaster.fdqPesqProdutos.SQL.Add('WHERE PRO.PRODUTO = ' + IntToStr(dmMProvider.cdsBarrasPRODUTO.AsInteger));

                      dmMProvider.cdsPesqProdutos.Open;;
                      dmMProvider.cdsPesqProdutos.ProviderName := '';

                      if not dmMProvider.cdsPesqProdutos.IsEmpty then
                      begin

                        dmMProvider.cdsTributacao.Close;
                        dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';;

                        dmDBEXMaster.fdqTributacao.Close;
                        dmDBEXMaster.fdqTributacao.SQL.Clear;
                        dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
                        dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.fdmImpCupomTRIBUTACAO.Value));

                        dmMProvider.cdsTributacao.Open;
                        dmMProvider.cdsTributacao.ProviderName := '';;

                        lblNumCx.Caption        := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value);
                        lblDataCupom.Caption    := FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date);
                        lblNumeroCupom.Caption  := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
                        lblCodigoBarras.Caption := dmMProvider.fdmImpCupomBARRAS.Value;
                        application.ProcessMessages;

                        Man_Tab_Movimento(1);
                        //atualiza sado de produto
                        Atualizar_Saldo_Produto(2);

                        //grava registro 60 diario
                        Man_Tab_Registro_60D(0, dtpMovimentoImportacao.Date);
                        Man_Tab_Registro_C410(0,dmMProvider.fdmImpCupomBARRAS.Value);
                        Man_Tab_Registro_C460(0,dmMProvider.fdmImpCupomSITUACAO.Value);

                        if dmMProvider.fdmImpCupomSITUACAO.AsInteger = 0 then
                          Man_Tab_Registro_C470(0,dmMProvider.fdmImpCupomSITUACAO.Value,dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value, dtpMovimentoImportacao.Date);

                        Man_Tab_Registro_C490(0);

                        //grava registro 60 item
                        Man_Tab_Registro_60I(0, dtpMovimentoImportacao.Date);

                        //grava registro 60 mensal
                        Man_Tab_Registro_60R(0, dtpMovimentoImportacao.Date);

                      end;

                    end
                    else
                    begin

                      memLogProdutos.Lines.Add('C�digo de barras n�o encontrado: ' + dmMProvider.fdmImpCupomBARRAS.Value);
                      memLogProdutos.Lines.Add('Dados do Cupom');
                      memLogProdutos.Lines.Add(' ');
                      memLogProdutos.Lines.Add('N Cupom/Num Caixa/Data');
                      memLogProdutos.Lines.Add(' ' + FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value) + '/'
                                              + '      ' + FormatFloat('000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value) + '/'
                                              + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date));
                      memLogProdutos.Lines.Add('----------------------------------------------');

                    end;

                  end
                  else
                  begin

                    Man_Tab_Registro_C460(0,dmMProvider.fdmImpCupomSITUACAO.Value);

                  end;

                  dmMProvider.fdmImpCupom.Next;
                  Application.ProcessMessages;

                end;

              end;

              if memLogProdutos.Lines.Count > 0 then
              begin

                Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                  + 'Verifique o log de importa��o de produtos!'),
                  'Aten��o!', mb_IconInformation + mb_Ok);

                pgcAutomacao.Pages[3].TabVisible := True;
                pgcAutomacao.ActivePageIndex := 3;

              end;

              case dmMProvider.cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.AsInteger of
                1:begin

                    dmMProvider.fdmImpCheque.First;

                    if not dmMProvider.fdmImpCheque.IsEmpty then
                    begin

                      lblMsgProgresso.Caption := 'Aguarde..efetuando lan�amentos' + #13
                                               + 'de cheques a receber..';
                      lblMsgProgresso.Visible := true;
                      Application.ProcessMessages;

                      pgbProgressoImportacao.Max    := dmMProvider.fdmImpCheque.RecordCount;

                      memLogCheques.Clear;

                      while not dmMProvider.fdmImpCheque.eof do
                      begin

                        pgbProgressoImportacao.Position := dmMProvider.fdmImpCheque.RecNo;
                        if dmMProvider.fdmImpChequeCHEQUE.Value <> '' then
                        begin

                          dmMProvider.cdsBancos.Close;
                          dmMProvider.cdsBancos.ProviderName := 'dspBancos';

                          dmDBEXMaster.fdqBancos.SQL.Clear;
                          dmDBEXMaster.fdqBancos.SQL.Add('SELECT * FROM BANCOS');
                          dmDBEXMaster.fdqBancos.SQL.Add('WHERE BANCO = ' + IntToStr(dmMProvider.fdmImpChequeBANCO.Value));

                          dmMProvider.cdsBancos.Open;
                          dmMProvider.cdsBancos.ProviderName := '';

                          if not dmMProvider.cdsBancos.IsEmpty then
                          begin

                            //grava cheques
                            Man_Tab_ChqRec(0);

                            Atualizar_Saldo_Cliente(0,dmMProvider.fdmImpChequeCLIENTE.Value,dmMProvider.fdmImpChequeVALOR.Value);

                          end
                          else
                          begin

                            memLogCheques.Lines.Add('Banco n�o cadastrado: ' + IntToStr(dmMProvider.fdmImpChequeBANCO.Value));
                            memLogCheques.Lines.Add('Dados do Cheque');
                            memLogCheques.Lines.Add(' ');
                            memLogCheques.Lines.Add('CHEQUE/AGENCIA/CONTA/CLIENTE/VALOR');
                            memLogCheques.Lines.Add(dmMProvider.fdmImpChequeCHEQUE.Value+ '/'
                                                    + dmMProvider.fdmImpChequeAGENCIA.Value + '/'
                                                    + dmMProvider.fdmImpChequeCONTA.Value+ '/'
                                                    + IntToStr(dmMProvider.fdmImpChequeCLIENTE.Value)+ '/'
                                                    +FormatFloat('#,##0.00',dmMProvider.fdmImpChequeVALOR.Value));
                            memLogCheques.Lines.Add('-------------------------');

                          end;


                        end;

                        dmMProvider.fdmImpCheque.Next;

                        Application.ProcessMessages;
                      end;

                    end;
                end;
              end;

              if not dmMProvider.cdsPedidoZeus.IsEmpty then
              begin

                dmMProvider.fdmFinalizadoraPedido.First;

                lblMsgProgresso.Caption := 'Aguarde..atualizando informa��es pedido..!';
                lblMsgProgresso.Visible := true;
                pgbProgressoImportacao.Position := 0;
                Application.ProcessMessages;

                while not dmMProvider.fdmFinalizadoraPedido.Eof do
                begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where codigoecf = ' + QuotedStr(FormatFloat('00',StrToFloat(dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value))));

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

                  if not dmMProvider.cdsFormasPagamento.IsEmpty then
                  begin

                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[0].Value     := 0;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[1].Value     := dmDBEXMaster.iIdFilial;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[2].Value     := dmMProvider.fdmFinalizadoraPedidoCODIGO_PEDIDO.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[3].Value     := dmMProvider.cdsFormasPagamentoFORMAPAGAMENTO.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[4].Value     := Trim(dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value);
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[5].Value     := dmMProvider.fdmFinalizadoraPedidoVALOR.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[6].Value     := dmMProvider.cdsFormasPagamentoPARCELAS.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.Params[7].Value     := dmMProvider.cdsFormasPagamentoTIPO.Value;
                    dmMSProcedure.fdspFinalizadoraPedZeus.ExecProc;

                  end;

                  dmMProvider.fdmFinalizadoraPedido.Next;

                end;

              end;

              lblMsgProgresso.Caption := 'Aguarde..atualizando estat�sticas finaceira..!';
              lblMsgProgresso.Visible := true;
              pgbProgressoImportacao.Position := 0;
              Application.ProcessMessages;

              if dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger = 1 then
              begin

                pgbProgressoImportacao.Max :=  dmMProvider.fdmImpFinanceiro.RecordCount;
                Application.ProcessMessages;

                if not dmMProvider.fdmImpFinanceiro.IsEmpty then
                begin

                  dmMProvider.fdmImpFinanceiro.First;

                  while not dmMProvider.fdmImpFinanceiro.Eof do
                  begin

                    pgbProgressoImportacao.Position :=  dmMProvider.fdmImpFinanceiro.Recno;
                    Application.ProcessMessages;

                    Man_Tab_CRE(0);

                    Atualizar_Saldo_Cliente(0,dmMProvider.fdmImpFinanceiroIP_SACADO.Value,dmMProvider.fdmImpFinanceiroIP_VALOR.Value);

                    dmMProvider.fdmImpFinanceiro.Next;

                  end;

                end;

              end;

              Man_Tab_ArqImportado(0);

              Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

              if memLogCheques.Lines.Count > 0 then
              begin

                Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
                  + 'Verifique o log de importa��o de cheques!'), 'Aten��o!', mb_IconInformation + mb_Ok);

                pgcAutomacao.Pages[3].TabVisible := True;
                pgcAutomacao.ActivePageIndex := 3;

              end;

              lblMsgProgresso.Caption := '';
              lblMsgProgresso.Visible := false;
              Application.ProcessMessages;

            end;

          end;

          dmMProvider.fdmImpCupom.SaveToFile(ExtractFilePath(Application.ExeName)
                                      + 'ImportacaoPDV\' + FormatDateTime('ddmmyyyy',dtpMovimentoImportacao.Date)
                                      + '_' + FormatDateTime('ddmmyyyy',Date) + 'Cupom.xml');
          dmMProvider.fdmImpCupom.Close;

        end;

    end;

    pgbProgressoGeralImp.Position     := 0;
    pgbProgressoImportacao.Position   := 0;

  except
  on E: Exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmAutomacao.acImportarSintegraExecute(Sender: TObject);
var
  iContador :integer;
  i, iEcf:integer;
  cPercDesconto, cPercAcrescimo:currency;
  sCnpj_Cpf, sArquivo:string;
begin

  LimparMSG_ERRO(lblMsg, nil);

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  if Length(Trim(edtArquivoSintegra.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ARQUIVO_NAO_INFORMADO;
    Application.ProcessMessages;
    edtArquivoSintegra.SetFocus;

  end
  else
  begin

    InicializarTabelas_Temp_Automacao;

    if ImportarRegistros60_Sintegra_ECF(edtArquivoSintegra.Text, dmDBEXMaster.iIdFilial) then
    begin

      frmAutomacao.pgbSintegraGeral.Position    := 0;
      frmAutomacao.pgbSintegraItem.Position     := 0;

      if not (dmMProvider.fdmImpCupom.IsEmpty) or not (dmMProvider.fdmImpReg60M.IsEmpty)  then
      begin

        if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'A leitura do arquivo foi conclu�da.'+#13
          + 'Deseja gravar as informa��es no banco de dados?'),
          'Aten��o!', mb_IconQuestion + mb_YesNo) = idYes then
        begin

          lblMSGImportacaoSintegra.Caption := 'Aguarde..gerando registro 60 mestre - SINTEGRA' + #13 +
                                              'Registro 60 anal�tico - SINTEGRA';

          lblMSGImportacaoSintegra.Visible := true;

          dmMProvider.fdmImpReg60M.First;

          pgbSintegraItem.Max := dmMProvider.fdmImpReg60M.RecordCount;

          while not dmMProvider.fdmImpReg60M.Eof do
          begin

            frmAutomacao.pgbSintegraItem.Position  := dmMProvider.fdmImpReg60M.RecNo;
            Application.ProcessMessages;

            Man_Tab_Registro_60M(0, dmMProvider.fdmImpReg60MDATA_EMISSAO.Value);

//            Man_Tab_Registro_C405(0);

            dmMSProcedure.fdspMaster.StoredProcName := 'RETORNA_GNR_REG60M';
            dmMSProcedure.fdspMaster.Prepare;
            dmMSProcedure.fdspMaster.ExecProc;

            dmMProvider.fdmImpReg60A.First;
            dmMProvider.fdmImpReg60A.Filtered := False;
            dmMProvider.fdmImpReg60A.Filter   := 'SERIE_ECF = ' + QuotedStr(dmMProvider.fdmImpReg60MSERIE_ECF.Value);
            dmMProvider.fdmImpReg60A.Filtered := True;

            while not dmMProvider.fdmImpReg60A.Eof do
            begin

              Man_tab_Registro_60A(0, dmMProvider.fdmImpReg60ADATA_EMISSAO.Value);

              if dmMProvider.fdmImpReg60MVENDA_BRUTA.Value >  0 then
//                Man_Tab_Registro_C420(0);

              if dmMProvider.fdmImpReg60ACRZ.Value <> dmMSProcedure.fdspLivroSaida.ParamByName('IP_CRZ').value then
                cIsentasNTTemp := 0;

//              Man_Tab_LivroSaida(0);

              dmMProvider.fdmImpReg60A.Next;

            end;

            dmMProvider.fdmImpReg60M.Next;

          end;

          pgbSintegraItem.Max := dmMProvider.fdmImpCupom.RecordCount;

          lblMSGImportacaoSintegra.Caption := 'Aguarde..gerando movimento de venda..' + #13
                                    +'Atualizando saldo de produtos...' + #13
                                    +'Registros sintegra: 60 di�rio, item, e mensal';

          lblMSGImportacaoSintegra.Visible := true;
          Application.ProcessMessages;

          dmMProvider.fdmImpCupom.First;
          pgbSintegraItem.Max    := dmMProvider.fdmImpCupom.RecordCount;

          while not dmMProvider.fdmImpCupom.eof do
          begin

            pgbSintegraItem.Position := dmMProvider.fdmImpCupom.RecNo;
            Application.ProcessMessages;
            //grava movimento de venda

            if (dmMProvider.fdmImpCupomSITUACAO.Value = 0) AND (dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value <> 'CANC') then
            begin

              dmMProvider.cdsBarras.Close;
              dmMProvider.cdsBarras.ProviderName := 'dspBarras';

              dmDBEXMaster.fdqBarras.Close;
              dmDBEXMaster.fdqBarras.SQL.Clear;
              dmDBEXMaster.fdqBarras.SQL.Add('SELECT * FROM BARRAS');
              dmDBEXMaster.fdqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(FormatFloat('0000000000000',StrToFloat(dmMProvider.fdmImpCupomBARRAS.Value))));

              dmMProvider.cdsBarras.Open;
              dmMProvider.cdsBarras.ProviderName := '';

              if not dmMProvider.cdsBarras.IsEmpty then
              begin

                dmMProvider.cdsPesqProdutos.Close;
                dmMProvider.cdsPesqProdutos.ProviderName := 'dspPesqProdutos';

                dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
                dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.* ,UND.PERMITE_VENDA_FRACIONADA AS FRACAO FROM PRODUTO PRO');
                dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
                dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
                dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
                dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
                dmDBEXMaster.fdqPesqProdutos.SQL.Add('WHERE PRO.PRODUTO = ' + IntToStr(dmMProvider.cdsBarrasPRODUTO.AsInteger));

                dmMProvider.cdsPesqProdutos.Open;;
                dmMProvider.cdsPesqProdutos.ProviderName := '';

                if not dmMProvider.cdsPesqProdutos.IsEmpty then
                begin

                  dmMProvider.cdsTributacao.Close;
                  dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';;

                  dmDBEXMaster.fdqTributacao.Close;
                  dmDBEXMaster.fdqTributacao.SQL.Clear;
                  dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.fdmImpCupomTRIBUTACAO.Value));

                  dmMProvider.cdsTributacao.Open;
                  dmMProvider.cdsTributacao.ProviderName := '';;

                  lblNumCXSintegra.Caption        := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value);
                  lblDataCupomSintegra.Caption    := FormatDateTime('dd/mm/yyyy',dmMProvider.fdmImpCupomEMISSAO.Value);
                  lblNumeroCupomSintegra.Caption  := FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value);
                  lblCodigoBarrasSintegra.Caption := dmMProvider.fdmImpCupomBARRAS.Value;
                  application.ProcessMessages;

                  Man_Tab_Movimento(1);
                  //atualiza sado de produto
                  Atualizar_Saldo_Produto(2);
                  //grava registro 60 diario
                  Man_Tab_Registro_60D(0, dmMProvider.fdmImpCupomEMISSAO.Value);
//                  Man_Tab_Registro_C410(0,dmMProvider.fdmImpCupomBARRAS.Value);
//                  Man_Tab_Registro_C460(0,dmMProvider.fdmImpCupomSITUACAO.Value);

                  if dmMProvider.fdmImpCupomSITUACAO.AsInteger = 0 then
//                    Man_Tab_Registro_C470(0,dmMProvider.fdmImpCupomSITUACAO.Value,dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value, dtpMovimentoImportacao.Date);

//                  Man_Tab_Registro_C490(0);

                  //grava registro 60 item
                  Man_Tab_Registro_60I(0, dmMProvider.fdmImpCupomEMISSAO.Value);

                  //grava registro 60 mensal
                  Man_Tab_Registro_60R(0, dmMProvider.fdmImpCupomEMISSAO.Value);

                end;

              end
              else
              begin

                memLogProdutos.Lines.Add('C�digo de barras n�o encontrado: ' + dmMProvider.fdmImpCupomBARRAS.Value);
                memLogProdutos.Lines.Add('Dados do Cupom');
                memLogProdutos.Lines.Add(' ');
                memLogProdutos.Lines.Add('N Cupom/Num Caixa/Data');
                memLogProdutos.Lines.Add(' ' + FormatFloat('000000',dmMProvider.fdmImpCupomNUMERO_CUPOM.Value) + '/'
                                        + '      ' + FormatFloat('000',dmMProvider.fdmImpCupomNUMERO_CAIXA.Value) + '/'
                                        + FormatDateTime('dd/mm/yyyy',dtpMovimentoImportacao.Date));
                memLogProdutos.Lines.Add('----------------------------------------------');

              end;

            end
            else
            begin

//              Man_Tab_Registro_C460(0,dmMProvider.fdmImpCupomSITUACAO.Value);

            end;

            dmMProvider.fdmImpCupom.Next;
            Application.ProcessMessages;

          end;

        end;

        if memLogProdutos.Lines.Count > 0 then
        begin

          Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
            + 'Verifique o log de importa��o de produtos!'),
            'Aten��o!', mb_IconInformation + mb_Ok);

          pgcAutomacao.Pages[3].TabVisible := True;
          pgcAutomacao.ActivePageIndex := 3;

        end;

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'Estat�sticas atualizadas com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

        RenameFile(edtArquivoSintegra.Text, edtArquivoSintegra.Text + '.ok');
        lblMSGImportacaoSintegra.Caption := '';
        lblMSGImportacaoSintegra.Visible := false;
        Application.ProcessMessages;

        LimparMSG_ERRO(lblMsg, nil);

      end;

    end;

  end;

  frmAutomacao.pgbSintegraGeral.Position    := 0;
  frmAutomacao.pgbSintegraItem.Position     := 0;

end;

procedure TfrmAutomacao.btgImporacaoItems0Click(Sender: TObject);
var
  iContaCx:integer;
begin

  iContaCx := 0;

  pgcAutomacao.Pages[0].TabVisible := False;
  pgcAutomacao.Pages[1].TabVisible := False;
  pgcAutomacao.Pages[2].TabVisible := True;
  pgcAutomacao.Pages[4].TabVisible := False;

  case dmMProvider.cdsConfiguracoesMODELOPDV.AsInteger of
    3:begin //Zeus Front End

        dmMProvider.cdsConfigECF.Close;
        dmMProvider.cdsConfigECF.Open;
        dmMProvider.cdsConfigECF.Last;
        dmMProvider.cdsConfigECF.First;

        pnlImportaPDV.Caption := 'Zeus Front-End';

        dtpMovimentoImportacao.Date     := Date;

        chkCaixas.Clear;

        for iContaCx := 0 to (dmMProvider.cdsConfigECF.RecordCount-1) do
        begin

          chkCaixas.Items.Add('Ecf-'+FormatFloat('00',dmMProvider.cdsConfigECF.FieldByName('NUMERO_CAIXA').AsInteger));
          chkCaixas.State[iContaCx] := cbChecked;
          dmMProvider.cdsConfigECF.Next;

        end;

        dmMProvider.cdsConfigECF.First;

      end;
    4:begin //DJpdv

        dmMProvider.cdsConfigECF.Close;
        dmMProvider.cdsConfigECF.Open;
        dmMProvider.cdsConfigECF.Last;
        dmMProvider.cdsConfigECF.First;

        pnlImportaPDV.Caption := 'DJPdv';

        dtpMovimentoImportacao.Date     := Date;

        chkCaixas.Clear;

        case dmMProvider.cdsFilialUTILIZA_NFCE.Value of
          0:begin

              for iContaCx := 0 to (dmMProvider.cdsConfigECF.RecordCount-1) do
              begin

                chkCaixas.Items.Add('Ecf-'+FormatFloat('00',dmMProvider.cdsConfigECF.FieldByName('NUMERO_CAIXA').AsInteger));
                chkCaixas.State[iContaCx] := cbChecked;
                dmMProvider.cdsConfigECF.Next;

              end;

            end;
          1:begin

              chkCaixas.Columns := 2;

              for iContaCx := 0 to (dmMProvider.cdsConfigECF.RecordCount-1) do
              begin

                chkCaixas.Items.Add('PDV' + FormatFloat('00',dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + ' - ' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value);
                chkCaixas.State[iContaCx] := cbChecked;
                dmMProvider.cdsConfigECF.Next;

              end;

            end;

        end;

        dmMProvider.cdsConfigECF.First;

      end;

  end;

  pgbProgressoGeral.Position   := 0;
  pgbProgressoArquivo.Position := 0;
  Application.ProcessMessages;

end;

procedure TfrmAutomacao.btgSintegraItems0Click(Sender: TObject);
begin

  pgcAutomacao.Pages[0].TabVisible := False;
  pgcAutomacao.Pages[1].TabVisible := False;
  pgcAutomacao.Pages[2].TabVisible := False;
  pgcAutomacao.Pages[4].TabVisible := True;

end;

procedure TfrmAutomacao.btnExportacaoItems0Click(Sender: TObject);
begin

  pgcAutomacao.Pages[0].TabVisible := True;
  pgcAutomacao.Pages[1].TabVisible := False;
  pgcAutomacao.Pages[2].TabVisible := False;
  pgcAutomacao.Pages[4].TabVisible := False;

  case dmMProvider.cdsConfiguracoesMODELOPDV.AsInteger of
    3:begin //Zeus Front End

        pnlSoftwareFrentedeLoja.Caption := 'Zeus Front End';

        chkArquivosExportacao.Items.Clear;
        chkArquivosExportacao.Columns := 2;
        chkArquivosExportacao.AddItem('Produtos',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Clientes',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Pre�o por quantidade',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Vendedores',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Departamentos',chkArquivosExportacao);
        chkArquivosExportacao.State[0]  := cbChecked;
        chkArquivosExportacao.State[1]  := cbChecked;
        chkArquivosExportacao.State[2]  := cbChecked;
        chkArquivosExportacao.State[3]  := cbUnchecked;
        chkArquivosExportacao.State[4]  := cbChecked;

        rdgTipoExpPdv.ItemIndex     := 0;

      end;

    4:begin //DJPdv

        Abrir_Tabela_ParamIntegracaoPDV;

        pnlSoftwareFrentedeLoja.Caption := 'DJPdv';

        chkArquivosExportacao.Items.Clear;
        chkArquivosExportacao.Columns := 2;
        chkArquivosExportacao.AddItem('PIS',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('COFINS',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('CEST',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Produtos',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Barras',chkArquivosExportacao);
        chkArquivosExportacao.AddItem('Clientes',chkArquivosExportacao);
        chkArquivosExportacao.State[0]  := cbChecked;
        chkArquivosExportacao.State[1]  := cbChecked;
        chkArquivosExportacao.State[2]  := cbChecked;
        chkArquivosExportacao.State[3]  := cbChecked;
        chkArquivosExportacao.State[4]  := cbChecked;
        chkArquivosExportacao.State[5]  := cbChecked;

        rdgTipoExpPdv.ItemIndex     := 0;

      end;
  end;

  pgbProgressoGeral.Position   := 0;
  pgbProgressoArquivo.Position := 0;
  Application.ProcessMessages;

end;

procedure TfrmAutomacao.btnExportacaoItems1Click(Sender: TObject);
begin

  pgcAutomacao.Pages[0].TabVisible := False;
  pgcAutomacao.Pages[1].TabVisible := True;
  pgcAutomacao.Pages[2].TabVisible := False;
  pgcAutomacao.Pages[3].TabVisible := False;

  case dmMProvider.cdsConfiguracoesMODELOBALANCA.AsInteger of
    6:begin //tolefo mgv5

        pnlSoftwareBalanca.Caption := 'MGV 5 - M�dulo Gerenciador de Venda';

        chkArquivosExpBalanca.Items.Clear;
        chkArquivosExpBalanca.Columns := 2;
        chkArquivosExpBalanca.AddItem('Produtos',chkArquivosExpBalanca);
        chkArquivosExpBalanca.AddItem('Receitas',chkArquivosExpBalanca);
        chkArquivosExpBalanca.AddItem('Teclado',chkArquivosExpBalanca);
        chkArquivosExpBalanca.AddItem('Inf. Nutricional',chkArquivosExpBalanca);
        chkArquivosExpBalanca.State[0]  := cbChecked;
        chkArquivosExpBalanca.State[1]  := cbChecked;
        chkArquivosExpBalanca.State[2]  := cbChecked;
        chkArquivosExpBalanca.State[3]  := cbChecked;

      end;

    9:begin //filizola smart

        pnlSoftwareBalanca.Caption := 'Smart Editor - Gerenciamento de Balan�as';

        chkArquivosExpBalanca.Items.Clear;
        chkArquivosExpBalanca.Columns := 2;
        chkArquivosExpBalanca.AddItem('Produtos',chkArquivosExpBalanca);
        chkArquivosExpBalanca.AddItem('Receitas',chkArquivosExpBalanca);
        chkArquivosExpBalanca.AddItem('Teclado',chkArquivosExpBalanca);
        chkArquivosExpBalanca.AddItem('Inf. Nutricional',chkArquivosExpBalanca);
        chkArquivosExpBalanca.State[0]  := cbChecked;
        chkArquivosExpBalanca.State[1]  := cbChecked;
        chkArquivosExpBalanca.State[2]  := cbChecked;
        chkArquivosExpBalanca.State[3]  := cbChecked;

      end;
  end;

end;

procedure TfrmAutomacao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAutomacao.ButtonGroup1Items0Click(Sender: TObject);
begin

  pgcAutomacao.Pages[0].TabVisible := False;
  pgcAutomacao.Pages[1].TabVisible := False;
  pgcAutomacao.Pages[2].TabVisible := False;

end;

procedure TfrmAutomacao.dtpMovimentoImportacaoChange(Sender: TObject);
begin

  dmMProvider.cdsConfigECF.First;

{  case dmMProvider.cdsConfiguracoesMODELOPDV.AsInteger of
    3:edtArquivoImportado.Text    := 'MV' + FormatDateTime('yymmdd',dtpMovimentoImportacao.Date) + '.ZAN'
  end;
}
end;

procedure TfrmAutomacao.FormCreate(Sender: TObject);
var
  i:integer;
begin

  ForceDirectories(ExtractFilepath(Application.ExeName) + 'Integracao\');

  for i := 0 to pgcAutomacao.PageCount -1 do
    pgcAutomacao.Pages[i].TabVisible  := False;

  ctpExportacao.Collapsed           := True;
  ctpImportacao.Collapsed           := ctpExportacao.Collapsed;
  ctpSintegra.Collapsed             := ctpExportacao.Collapsed;

  //inicializa variaveis

  FormatSettings.ShortDateFormat    := 'dd/mm/yyyy';

  Caption                           := Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(Application.ExeName, 1);

  dmDBEXMaster.sNomeUsuario         := ParamStr(1);
  dmDBEXMaster.sSenha               := paramstr(2);
  dmDBEXMaster.iIdUsuario           := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial            := StrToInt(ParamStr(4));

  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Temp') then
    ForceDirectories(ExtractFilePath(Application.ExeName)+'Temp\');

  chkLimparCadastro.Visible := dmDBEXMaster.sNomeUsuario = 'SYSDBA';

end;

procedure TfrmAutomacao.Man_Tab_Registro_C405(pOpcao: smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_RC405.Params[0].Value:= pOpcao;
    dmMSProcedure.fdspMan_Tab_RC405.Params[1].Value := dtpMovimentoImportacao.DateTime;
    dmMSProcedure.fdspMan_Tab_RC405.Params[2].Value := dmMProvider.fdmImpReg60MCRO.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[3].Value := dmMProvider.fdmImpReg60MCRZ.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[4].Value := dmMProvider.fdmImpReg60MCOO_FINAL.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[5].Value := dmMProvider.fdmImpReg60MVALOR_GT.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[6].Value := dmMProvider.fdmImpReg60MVENDA_BRUTA.Value;
    dmMSProcedure.fdspMan_Tab_RC405.Params[7].Value := dmMProvider.fdmImpReg60MSERIE_ECF.Value;

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_RC405.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmAutomacao.Man_Tab_Registro_C410(pOpcao: smallint;pBarras:string);
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
          dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('WHERE EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date))
                                                                             + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
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
                dmMSProcedure.fdspMan_Tab_RC410.Params[1].AsDate      := dtpMovimentoImportacao.DateTime;
                dmMSProcedure.fdspMan_Tab_RC410.Params[2].AsDate      := dtpMovimentoImportacao.DateTime;
                dmMSProcedure.fdspMan_Tab_RC410.Params[3].Value       := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsPesqProdutosALIQUOTA_PIS.Value /100);
                dmMSProcedure.fdspMan_Tab_RC410.Params[4].Value       := dmMProvider.fdmImpCupomSUB_TOTAL.Value * (dmMProvider.cdsPesqProdutosALIQUOTA_COFINS.Value /100);
                dmMSProcedure.fdspMan_Tab_RC410.Params[5].AsString    := dmMProvider.fdmImpCupomSERIE_ECF.AsString;

                if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
                  dmMSProcedure.fdspMan_Tab_RC410.ExecProc;

              end;

            end;

          end;

        end;
      1:begin

          dmMSProcedure.fdspMan_Tab_RC410.Params[0].Value       := pOpcao;
          dmMSProcedure.fdspMan_Tab_RC410.Params[1].AsDate      := dtpMovimentoImportacao.DateTime;
          dmMSProcedure.fdspMan_Tab_RC410.Params[2].AsDate      := dtpMovimentoImportacao.DateTime;
          dmMSProcedure.fdspMan_Tab_RC410.Params[3].Value       := 0;
          dmMSProcedure.fdspMan_Tab_RC410.Params[4].Value       := 0;
          dmMSProcedure.fdspMan_Tab_RC410.Params[5].AsString    := '';

          if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
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

procedure TfrmAutomacao.Man_Tab_Registro_C420(pOpcao: smallint);
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
        if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
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
        if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
          dmMSProcedure.fdspMan_Tab_RC420.ExecProc;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmAutomacao.Man_Tab_Registro_C460(pOpcao,pSituacao: smallint);
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
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('WHERE EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date))
                                                                         + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
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

    if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
      dmMSProcedure.fdspMan_Tab_RC460.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

{procedure TfrmAutomacao.Man_Tab_Registro_C470(pOpcao, pSituacao: smallint; pAliq:string);
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
      dmDBEXMaster.fdqRegistro60_Mestre.SQL.Add('WHERE EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date))
                                                                         + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',dtpMovimentoImportacao.Date)));
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
      dmMSProcedure.fdspMan_Tab_RC470.Params[15].Value  := dmMProvider.fdmImpCupomCFOP.Value
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
}
procedure TfrmAutomacao.Man_Tab_Registro_C490(pOpcao: smallint);
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
      if dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0 then
        dmMSProcedure.fdspMan_Tab_RC490.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except on E: Exception do

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;


end.

