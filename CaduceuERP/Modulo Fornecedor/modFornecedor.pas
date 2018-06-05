unit modFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdActns, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, db, ACBrBase, ACBrValidador,
  ACBrDFe, ACBrNFe, ACBrNFeNotasFiscais, pcnConversao, pcnConversaoNFE, AcbrUtil,
  System.Math, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmFornecedor = class(TForm)
    imgNovo: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    lblF3: TLabel;
    imgSalvar: TImage;
    lblF4: TLabel;
    imgExcluir: TImage;
    lblF5: TLabel;
    imgEditar: TImage;
    lblF6: TLabel;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    pgcFornecedor: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tbsCadastro: TTabSheet;
    grpCadastro: TGroupBox;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    actIncluir: TAction;
    actDesfazer: TAction;
    actSalvar: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    lblCodigo: TLabel;
    lblRSocial: TLabel;
    lblCadastro: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblCEP: TLabel;
    lblComplemento: TLabel;
    edtCodigo: TDBEdit;
    edtRazaoSocial: TDBEdit;
    edtCadastro: TDBEdit;
    edtNFantasia: TDBEdit;
    edtCNPJ: TDBEdit;
    edtInscEst: TDBEdit;
    edtEndereco: TDBEdit;
    edtNumero: TDBEdit;
    edtCEP: TDBEdit;
    edtComplemento: TDBEdit;
    rdgTipoEmpresa: TDBRadioGroup;
    rdgAtividade: TDBRadioGroup;
    lnlFantasia: TLabel;
    lblCNPJ: TLabel;
    lblInsEst: TLabel;
    pcpInformacoes: TPageControl;
    tbsUltimaNFEntrada: TTabSheet;
    grdUltimaNFEntrada: TDBGrid;
    tbsUltimaOrdemCompra: TTabSheet;
    grdUltimaordemCompra: TDBGrid;
    chkAtacadistaRegEspecial: TDBCheckBox;
    chkOptanteSimplesNacional: TDBCheckBox;
    lblPais: TLabel;
    cboPaises: TDBLookupComboBox;
    lblBairro: TLabel;
    lblCidade: TLabel;
    edtBairro: TDBEdit;
    cboNomeCidade: TDBLookupComboBox;
    lblUF: TLabel;
    cboUF: TDBLookupComboBox;
    lblRepresentante: TLabel;
    edtRepresentante: TDBEdit;
    lblContato: TLabel;
    edtContato: TDBEdit;
    lblWWW: TLabel;
    lblEmail: TLabel;
    edtWWW: TDBEdit;
    edtEmail: TDBEdit;
    grpObservacao: TGroupBox;
    lblDDD: TLabel;
    lblTelefone1: TLabel;
    lblTelefone2: TLabel;
    lblFAX: TLabel;
    edtDDD: TDBEdit;
    edtTelefone1: TDBEdit;
    edtTelefone2: TDBEdit;
    edtFAX: TDBEdit;
    memObservacao: TDBMemo;
    ACBrValidador1: TACBrValidador;
    lblInscSuframa: TLabel;
    edtInsSUFRAMA: TDBEdit;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure edtRazaoSocialEnter(Sender: TObject);
    procedure edtRazaoSocialExit(Sender: TObject);
    procedure grdUltimaNFEntradaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdUltimaordemCompraDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure cboUFExit(Sender: TObject);
    procedure edtNFantasiaExit(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure edtInscEstExit(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure edtInsSUFRAMAExit(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExcluirExecute(Sender: TObject);
    procedure edtEnderecoExit(Sender: TObject);
    procedure edtBairroExit(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure edtRepresentanteExit(Sender: TObject);
    procedure edtContatoExit(Sender: TObject);
    procedure memObservacaoExit(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroExit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure rdgTipoEmpresaClick(Sender: TObject);
    procedure rdgAtividadeClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostrarOcultarAbas(pOpcao:integer);
    procedure LimparMSG_ERRO;
    function AbrirTabelaFornecedor(pOpcao:smallint; pConteudo:string):boolean;
    procedure RelacionarUltimaNF;
    procedure RelacionarUltimaOrdemCompra;
    procedure AbrirTabelas;
    procedure AbriTabelaCidade(pEstado:string);
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure CarregarConfiguracoesACBR;
  public
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;
  sCapctha:string;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes,modPesqCnpj, modCaptcha;

function TfrmFornecedor.AbrirTabelaFornecedor(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsFornecedor.Close;
  dmMProvider.cdsFornecedor.ProviderName := 'dspFornecedor';;
  dmDBEXMaster.fdqFornecedor.SQL.Clear;
  dmDBEXMaster.fdqFornecedor.SQL.Add('SELECT * FROM FORNECEDOR');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Fornecedor(pOpcao,pConteudo);

  dmDBEXMaster.fdqFornecedor.SQL.Add(sWhere);
  dmDBEXMaster.fdqFornecedor.SQL.Add('ORDER BY RAZAOSOCIAL');

  try

    dmMProvider.cdsFornecedor.Open;
    dmMProvider.cdsFornecedor.ProviderName := '';

    if dmMProvider.cdsFornecedor.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsFornecedor.IsEmpty;

   except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmFornecedor.AbrirTabelas;
begin

  dmMProvider.cdsFilial.Close;
  dmMProvider.cdsFilial.ProviderName := 'dspFilial';
  dmDBEXMaster.fdqFilial.SQL.Clear;
  dmDBEXMaster.fdqFilial.SQL.Add('SELECT FILIAL.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
  dmDBEXMaster.fdqFilial.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
  dmDBEXMaster.fdqFilial.SQL.Add('FROM FILIAL FILIAL');
  dmDBEXMaster.fdqFilial.SQL.Add('JOIN CIDADES CIDADES');
  dmDBEXMaster.fdqFilial.SQL.Add('ON(CIDADES.CIDADE = FILIAL.CIDADE)');
  dmDBEXMaster.fdqFilial.SQL.Add('JOIN ESTADOS ESTADOS');
  dmDBEXMaster.fdqFilial.SQL.Add('ON(ESTADOS.SIGLA = FILIAL.ESTADO)');
  dmDBEXMaster.fdqFilial.SQL.Add('where filial.filial= ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmMProvider.cdsFilial.Open;
  dmMProvider.cdsFilial.ProviderName := '';

  dmMProvider.cdsPaises.Close;
  dmMProvider.cdsPaises.ProviderName := 'dspPaises';

  dmDBEXMaster.fdqPaises.SQL.Clear;
  dmDBEXMaster.fdqPaises.SQL.Add('select * from pais');
  dmDBEXMaster.fdqPaises.SQL.Add('order by nome');

  dmMProvider.cdsPaises.Open;
  dmMProvider.cdsPaises.ProviderName := '';

  dmMProvider.cdsEstados.Close;
  dmMProvider.cdsEstados.ProviderName := 'dspEstados';
  dmDBEXMaster.fdqEstados.SQL.Clear;
  dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
  dmDBEXMaster.fdqEstados.SQL.Add('order by nome');
  dmMProvider.cdsEstados.Open;
  dmMProvider.cdsEstados.ProviderName := '';

end;

procedure TfrmFornecedor.AbriTabelaCidade(pEstado: string);
begin

  dmMProvider.cdsCidades.Close;
  dmMProvider.cdsCidades.ProviderName := 'dspCidades';

  dmDBEXMaster.fdqCidades.SQL.Clear;
  dmDBEXMaster.fdqCidades.SQL.Add('select * from cidades');
  dmDBEXMaster.fdqCidades.SQL.Add('where estado = ' + QuotedStr(pEstado));
  dmDBEXMaster.fdqCidades.SQL.Add('order by nome');

  dmMProvider.cdsCidades.Open;
  dmMProvider.cdsCidades.ProviderName := '';

end;

procedure TfrmFornecedor.actDesfazerExecute(Sender: TObject);
begin

  ActiveControl := nil;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    dmMProvider.cdsFornecedor.Cancel;

  HabilitaDesabilitaControles(False);

end;

procedure TfrmFornecedor.actEditarExecute(Sender: TObject);
begin

  if not dmMProvider.cdsFornecedor.IsEmpty then
  begin

    HabilitaDesabilitaControles(True);
    MostrarOcultarAbas(1);
    pgcFornecedor.ActivePageIndex := 1;
    edtRazaoSocial.SetFocus;
    dmMProvider.cdsFornecedor.Edit;

  end;

end;

procedure TfrmFornecedor.actExcluirExecute(Sender: TObject);
begin

  try

    if dmMProvider.cdsFornecedor.Active then
    begin

      if not (dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert]) then
      begin


        dmDBEXMaster.fdcMaster.StartTransaction;

        LimparMSG_ERRO;

        dmMSProcedure.fdspFornededor.Params[0].Value   := 1;
        dmMSProcedure.fdspFornededor.Params[1].Value   := dmMProvider.cdsFornecedorFORNECEDOR.Value;
        dmMSProcedure.fdspFornededor.Params[2].Value   := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;
        dmMSProcedure.fdspFornededor.Params[3].Value   := dmMProvider.cdsFornecedorFANTASIA.Value;
        dmMSProcedure.fdspFornededor.Params[4].Value   := dmMProvider.cdsFornecedorCNPJ.Value;
        dmMSProcedure.fdspFornededor.Params[5].Value   := dmMProvider.cdsFornecedorINSCRICAO.Value;
        dmMSProcedure.fdspFornededor.Params[6].Value   := dmMProvider.cdsFornecedorCADASTRO.Value;
        dmMSProcedure.fdspFornededor.Params[7].Value   := dmMProvider.cdsFornecedorENDERECO.Value;
        dmMSProcedure.fdspFornededor.Params[8].Value   := dmMProvider.cdsFornecedorNUMERO.Value;
        dmMSProcedure.fdspFornededor.Params[9].Value   := dmMProvider.cdsFornecedorCEP.Value;
        dmMSProcedure.fdspFornededor.Params[10].Value  := dmMProvider.cdsFornecedorBAIRRO.Value;
        dmMSProcedure.fdspFornededor.Params[11].Value  := dmMProvider.cdsFornecedorESTADO.Value;
        dmMSProcedure.fdspFornededor.Params[12].Value  := dmMProvider.cdsFornecedorDDD.Value;
        dmMSProcedure.fdspFornededor.Params[13].Value  := dmMProvider.cdsFornecedorTELEFONE1.Value;
        dmMSProcedure.fdspFornededor.Params[14].Value  := dmMProvider.cdsFornecedorTELEFONE2.Value;
        dmMSProcedure.fdspFornededor.Params[15].Value  := dmMProvider.cdsFornecedorFAX.Value;
        dmMSProcedure.fdspFornededor.Params[16].Value  := dmMProvider.cdsFornecedorCOMPLEMENTO.Value;
        dmMSProcedure.fdspFornededor.Params[17].Value  := dmMProvider.cdsFornecedorCONTATO.Value;
        dmMSProcedure.fdspFornededor.Params[18].Value  := dmMProvider.cdsFornecedorHTTP.Value;
        dmMSProcedure.fdspFornededor.Params[19].Value  := dmMProvider.cdsFornecedorEMAIL.Value;
        dmMSProcedure.fdspFornededor.Params[20].Value  := dmMProvider.cdsFornecedorTIPO.Value;
        dmMSProcedure.fdspFornededor.Params[21].Value  := dmMProvider.cdsFornecedorOBSERVACAO.Value;
        dmMSProcedure.fdspFornededor.Params[22].Value  := null;
        dmMSProcedure.fdspFornededor.Params[23].Value  := null;
        dmMSProcedure.fdspFornededor.Params[24].Value  := 0;
        dmMSProcedure.fdspFornededor.Params[25].Value  := null;
        dmMSProcedure.fdspFornededor.Params[26].Value  := null;
        dmMSProcedure.fdspFornededor.Params[27].Value  := 0;
        dmMSProcedure.fdspFornededor.Params[28].Value  := dmMProvider.cdsFornecedorRAMODEATIVIDADE.Value;
        dmMSProcedure.fdspFornededor.Params[29].Value  := dmMProvider.cdsFornecedorCIDADE.Value;
        dmMSProcedure.fdspFornededor.Params[30].Value  := dmMProvider.cdsFornecedorATACADISTAREGIMEESPECIAL.Value;
        dmMSProcedure.fdspFornededor.Params[31].Value  := dmMProvider.cdsFornecedorREPRESENTANTE.Value;
        dmMSProcedure.fdspFornededor.Params[32].Value  := dmMProvider.cdsFornecedorOPTANTE_SIMPLES.Value;
        dmMSProcedure.fdspFornededor.Params[33].Value  := dmMProvider.cdsFornecedorPAIS.Value;
        dmMSProcedure.fdspFornededor.Params[34].Value  := dmMProvider.cdsFornecedorINSCRICAO_SUFRAMA.Value;
        dmMSProcedure.fdspFornededor.Params[35].Value  := Date;
        dmMSProcedure.fdspFornededor.Params[36].Value  := Time;
        dmMSProcedure.fdspFornededor.Params[37].Value  := dmDBEXMaster.iIdUsuario;
        dmMSProcedure.fdspFornededor.Params[38].Value  := '';
        dmMSProcedure.fdspFornededor.Params[39].Value  := '';
        dmMSProcedure.fdspFornededor.Params[40].Value  := 0;

        dmMSProcedure.fdspFornededor.ExecProc;

        dmDBEXMaster.fdcMaster.Commit;

        dmMProvider.cdsFornecedor.Close;

        edtConteudoPesquisa.Clear;

        edtConteudoPesquisa.SetFocus;

        HabilitaDesabilitaControles(false);
        MostrarOcultarAbas(0);

      end;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;


end;

procedure TfrmFornecedor.actIncluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  try

    if not (dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert]) then
    begin

      edtConteudoPesquisa.Clear;

      frmPesqCnpj               := TfrmPesqCnpj.Create(self);
      frmPesqCnpj.sNome_Usuario := dmDBEXMaster.sNomeUsuario;
      if frmPesqCnpj.ShowModal = mrOk then
      begin

        if not AbrirTabelaFornecedor(1,frmPesqCnpj.edtCNPJ.Text) then
        begin

          LimparMSG_ERRO;

          MostrarOcultarAbas(1);
          HabilitaDesabilitaControles(True);

          pgcFornecedor.ActivePageIndex      := 1;

          dmMProvider.cdsFornecedor.Append;
          dmMProvider.cdsFornecedorCNPJ.Value := frmPesqCnpj.edtCNPJ.Text;

          cboPaises.SetFocus;

        end
        else
        begin

          AbriTabelaCidade(dmMProvider.cdsFornecedorESTADO.Value);
          pgcFornecedor.ActivePageIndex := 0;
          grdTabela.SetFocus;

        end;

      end;

    end;

  except
    on E: exception do
    begin

      lblMsg.Caption :=dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmFornecedor.actSalvarExecute(Sender: TObject);
begin

  try

    if dmMProvider.cdsFornecedor.Active then
    begin

      if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
      begin

        if Length(Trim(cboUF.Text)) > 0 then
        begin

          if (Length(Trim(dmMProvider.cdsFornecedorINSCRICAO.Value)) > 0) and (Length(Trim(dmMProvider.cdsFornecedorESTADO.Value)) > 0)then
          begin

            ACBrValidador1.TipoDocto   := docInscEst;
            ACBrValidador1.Documento   := dmMProvider.cdsFornecedorINSCRICAO.Value;
            ACBrValidador1.Complemento := dmMProvider.cdsFornecedorESTADO.Value;

            if not ACBrValidador1.Validar then
            begin

              edtInscEst.SetFocus;
              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INSCRICAO_INVALIDA;
              Application.ProcessMessages;

            end
            else
            begin

              ActiveControl := nil;

              if not dmDBEXMaster.fdtMaster.Active then
                dmDBEXMaster.fdtMaster.StartTransaction;

              LimparMSG_ERRO;

              dmMSProcedure.fdspFornededor.Params[0].Value   := 0;

              if dmMProvider.cdsFornecedorFORNECEDOR.Value <= 0  then
                dmMSProcedure.fdspFornededor.Params[1].Value := -1
              else
                dmMSProcedure.fdspFornededor.Params[1].Value := dmMProvider.cdsFornecedorFORNECEDOR.Value;
              dmMSProcedure.fdspFornededor.Params[2].Value   := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;
              dmMSProcedure.fdspFornededor.Params[3].Value   := dmMProvider.cdsFornecedorFANTASIA.Value;
              dmMSProcedure.fdspFornededor.Params[4].Value   := dmMProvider.cdsFornecedorCNPJ.Value;
              dmMSProcedure.fdspFornededor.Params[5].Value   := dmMProvider.cdsFornecedorINSCRICAO.Value;
              dmMSProcedure.fdspFornededor.Params[6].Value   := dmMProvider.cdsFornecedorCADASTRO.Value;
              dmMSProcedure.fdspFornededor.Params[7].Value   := dmMProvider.cdsFornecedorENDERECO.Value;
              dmMSProcedure.fdspFornededor.Params[8].Value   := dmMProvider.cdsFornecedorNUMERO.Value;
              dmMSProcedure.fdspFornededor.Params[9].Value   := dmMProvider.cdsFornecedorCEP.Value;
              dmMSProcedure.fdspFornededor.Params[10].Value  := dmMProvider.cdsFornecedorBAIRRO.Value;
              dmMSProcedure.fdspFornededor.Params[11].Value  := dmMProvider.cdsFornecedorESTADO.Value;
              dmMSProcedure.fdspFornededor.Params[12].Value  := dmMProvider.cdsFornecedorDDD.Value;
              dmMSProcedure.fdspFornededor.Params[13].Value  := dmMProvider.cdsFornecedorTELEFONE1.Value;
              dmMSProcedure.fdspFornededor.Params[14].Value  := dmMProvider.cdsFornecedorTELEFONE2.Value;
              dmMSProcedure.fdspFornededor.Params[15].Value  := dmMProvider.cdsFornecedorFAX.Value;
              dmMSProcedure.fdspFornededor.Params[16].Value  := dmMProvider.cdsFornecedorCOMPLEMENTO.Value;
              dmMSProcedure.fdspFornededor.Params[17].Value  := dmMProvider.cdsFornecedorCONTATO.Value;
              dmMSProcedure.fdspFornededor.Params[18].Value  := dmMProvider.cdsFornecedorHTTP.Value;
              dmMSProcedure.fdspFornededor.Params[19].Value  := dmMProvider.cdsFornecedorEMAIL.Value;
              dmMSProcedure.fdspFornededor.Params[20].Value  := dmMProvider.cdsFornecedorTIPO.Value;
              dmMSProcedure.fdspFornededor.Params[21].Value  := dmMProvider.cdsFornecedorOBSERVACAO.Value;
              dmMSProcedure.fdspFornededor.Params[22].Value  := null;
              dmMSProcedure.fdspFornededor.Params[23].Value  := null;
              dmMSProcedure.fdspFornededor.Params[24].Value  := 0;
              dmMSProcedure.fdspFornededor.Params[25].Value  := null;
              dmMSProcedure.fdspFornededor.Params[26].Value  := null;
              dmMSProcedure.fdspFornededor.Params[27].Value  := 0;
              dmMSProcedure.fdspFornededor.Params[28].Value  := dmMProvider.cdsFornecedorRAMODEATIVIDADE.Value;
              dmMSProcedure.fdspFornededor.Params[29].Value  := dmMProvider.cdsFornecedorCIDADE.Value;
              dmMSProcedure.fdspFornededor.Params[30].Value  := dmMProvider.cdsFornecedorATACADISTAREGIMEESPECIAL.Value;
              dmMSProcedure.fdspFornededor.Params[31].Value  := dmMProvider.cdsFornecedorREPRESENTANTE.Value;
              dmMSProcedure.fdspFornededor.Params[32].Value  := dmMProvider.cdsFornecedorOPTANTE_SIMPLES.Value;
              dmMSProcedure.fdspFornededor.Params[33].Value  := dmMProvider.cdsFornecedorPAIS.Value;
              dmMSProcedure.fdspFornededor.Params[34].Value  := dmMProvider.cdsFornecedorINSCRICAO_SUFRAMA.Value;
              dmMSProcedure.fdspFornededor.Params[35].Value  := Date;
              dmMSProcedure.fdspFornededor.Params[36].Value  := Time;
              dmMSProcedure.fdspFornededor.Params[37].Value  := dmDBEXMaster.iIdUsuario;
              dmMSProcedure.fdspFornededor.Params[38].Value  := '';
              dmMSProcedure.fdspFornededor.Params[39].Value  := '';
              dmMSProcedure.fdspFornededor.Params[40].Value  := 0;

              dmMSProcedure.fdspFornededor.ExecProc;

              if dmMSProcedure.fdspFornededor.Params[41].Value > 0 then
                dmMProvider.cdsFornecedorFORNECEDOR.Value := dmMSProcedure.fdspFornededor.Params[41].Value;

              if dmDBEXMaster.fdtMaster.Active then
                dmDBEXMaster.fdtMaster.Commit;

              dmMProvider.cdsFornecedor.Post;

              edtConteudoPesquisa.Clear;

              edtConteudoPesquisa.SetFocus;

              HabilitaDesabilitaControles(false);
              MostrarOcultarAbas(0);

            end;

          end;

        end;

      end;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure TfrmFornecedor.CarregarConfiguracoesACBR;
var
  Ok : Boolean;
begin

  ACBrNFe1.SSL.NumeroSerie  := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Text;
  ACBrNFe1.DANFE.Logo       := dmMProvider.cdsParametros_NFELOGO_MARCA.Value;
  ACBrNFe1.DANFE.PathPDF    := dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value;

  with ACBrNFe1.Configuracoes.Geral do
  begin

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

  with ACBrNFe1.Configuracoes.WebServices do
  begin

    UF                        := dmMProvider.cdsConfiguracoesWS_NFE.Value;
    Ambiente                  := StrToTpAmb(Ok,IntToStr(dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value));
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

  with ACBrNFe1.Configuracoes.Arquivos do
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

procedure TfrmFornecedor.cboUFExit(Sender: TObject);
begin

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(cboUF.Text)) > 0 then
    begin

      if Length(Trim(edtInscEst.Text)) > 0 then
      begin

        ACBrValidador1.TipoDocto   := docInscEst;
        ACBrValidador1.Documento   := dmMProvider.cdsFornecedorINSCRICAO.Value;
        ACBrValidador1.Complemento := dmMProvider.cdsFornecedorESTADO.Value;

        if not ACBrValidador1.Validar then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INSCRICAO_INVALIDA;
          Application.ProcessMessages;
          cboUF.SetFocus;

        end
        else
          AbriTabelaCidade(dmMProvider.cdsFornecedorESTADO.Value);

      end;

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      cboUF.SetFocus;

    end;

  end;

end;

procedure TfrmFornecedor.edtBairroExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmMProvider.cdsFornecedorBAIRRO.Text)) > 0 then
      dmMProvider.cdsFornecedorBAIRRO.Value  := RetirarAcentuacao(sender)
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtBairro.SetFocus;

    end;

  end;

end;

procedure TfrmFornecedor.edtCNPJExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmMProvider.cdsFornecedorCNPJ.Value)) > 0 then
    begin

      if not ValidarCnpjCpf(dmMProvider.cdsFornecedorCNPJ.Value) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO + FormatarCNPJCPF(dmMProvider.cdsFornecedorCNPJ.Value);
        Application.ProcessMessages;
        edtCNPJ.SetFocus;

      end
      else
      begin

        if Length(Trim(dmMProvider.cdsFornecedorCNPJ.Value)) <= 11 then
          dmMProvider.cdsFornecedorTIPO.Value := 0
        else
          dmMProvider.cdsFornecedorTIPO.Value := 1;

      end;

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtCNPJ.SetFocus;

    end;

  end;

end;

procedure TfrmFornecedor.edtCNPJKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not(Key in ['0' .. '9', Chr(8)]) then
    Key := #0;

end;

procedure TfrmFornecedor.edtComplementoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmMProvider.cdsFornecedorCOMPLEMENTO.Text)) > 0 then
      dmMProvider.cdsFornecedorCOMPLEMENTO.Value  := RetirarAcentuacao(sender)
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtComplemento.SetFocus;

    end;

  end;

end;

procedure TfrmFornecedor.edtContatoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    if Length(Trim(dmMProvider.cdsFornecedorCONTATO.Text)) > 0 then
      dmMProvider.cdsFornecedorCONTATO.Value  := RetirarAcentuacao(sender)

end;

procedure TfrmFornecedor.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MostrarOcultarAbas(0);
  MudarCorEdit(Sender);
  pgcFornecedor.ActivePageIndex := 0;

end;

procedure TfrmFornecedor.edtConteudoPesquisaExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    if rdpOpcoesPesquisa.ItemIndex = 1 then
    begin

      if not ValidarCnpjCpf(edtConteudoPesquisa.Text) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO + FormatarCNPJCPF(edtConteudoPesquisa.Text);
        Application.ProcessMessages;

        edtConteudoPesquisa.SetFocus;
        TocarSomAlerta(ord(SystemHand));
        exit;

      end;

    end;

    if AbrirTabelaFornecedor(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
    begin

      AbriTabelaCidade(dmMProvider.cdsFornecedorESTADO.Value);
      edtConteudoPesquisa.Clear;
      grdTabela.SetFocus;

    end
    else
    begin

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end;

    MudarCorEdit(Sender);

  end;

end;

procedure TfrmFornecedor.edtConteudoPesquisaKeyDown(Sender: TObject;
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

procedure TfrmFornecedor.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmFornecedor.edtEmailExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmMProvider.cdsFornecedorEMAIL.Value)) > 0 then
    begin

      if not ValidarEmail(dmMProvider.cdsFornecedorEMAIL.Value) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VALIDAR_EMAIL;
        Application.ProcessMessages;
        edtEmail.SetFocus;

      end;

    end;

  end;


end;

procedure TfrmFornecedor.edtEnderecoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmMProvider.cdsFornecedorENDERECO.Text)) > 0 then
      dmMProvider.cdsFornecedorENDERECO.Value  := RetirarAcentuacao(sender)
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtEndereco.SetFocus;

    end;

  end;

end;

procedure TfrmFornecedor.edtInscEstExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(cboUF.Text)) > 0 then
    begin

      if (Length(Trim(dmMProvider.cdsFornecedorINSCRICAO.Value)) > 0) and (Length(Trim(dmMProvider.cdsFornecedorESTADO.Value)) > 0)then
      begin

        ACBrValidador1.TipoDocto   := docInscEst;
        ACBrValidador1.Documento   := dmMProvider.cdsFornecedorINSCRICAO.Value;
        ACBrValidador1.Complemento := dmMProvider.cdsFornecedorESTADO.Value;

        if not ACBrValidador1.Validar then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INSCRICAO_INVALIDA;
          Application.ProcessMessages;
          edtInscEst.SetFocus;

        end;

      end
      else
        dmMProvider.cdsFornecedorINSCRICAO.Value := 'ISENTO';

    end
    else
      dmMProvider.cdsFornecedorINSCRICAO.Value := 'ISENTO';

  end;

end;

procedure TfrmFornecedor.edtInsSUFRAMAExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin


    if Length(Trim(dmMProvider.cdsFornecedorINSCRICAO_SUFRAMA.Value)) > 0 then
    begin

      ACBrValidador1.TipoDocto   := docSuframa;
      ACBrValidador1.Documento   := dmMProvider.cdsFornecedorINSCRICAO.Value;

      if not ACBrValidador1.Validar then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INSC_SUFRAMA_INVALIDA;
        Application.ProcessMessages;
        edtInsSUFRAMA.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmFornecedor.edtNFantasiaExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    if Length(Trim(dmMProvider.cdsFornecedorFANTASIA.Text)) > 0 then
      dmMProvider.cdsFornecedorFANTASIA.Value     := RetirarAcentuacao(sender);

end;

procedure TfrmFornecedor.edtNumeroExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmFornecedor.edtRazaoSocialEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmFornecedor.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                           := COR_PADRAO_TELAS;
  Caption                         := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1);

  dmDBEXMaster.sNomeUsuario       := ParamStr(1);
  dmDBEXMaster.sSenha             := paramstr(2);
  dmDBEXMaster.iIdUsuario         := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial          := StrToInt(ParamStr(4));

  pgcFornecedor.ActivePageIndex   := 0;
  pcpInformacoes.ActivePageIndex  := 0;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdUltimaNFEntrada.Columns.Count - 1 do
    grdUltimaNFEntrada.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdUltimaordemCompra.Columns.Count - 1 do
    grdUltimaordemCompra.Columns[i].Title.Color := COR_TITULO_GRADE;

  MostrarOcultarAbas(0);

  AbrirTabelas;

  CarregarConfiguracoesACBR;

end;

procedure TfrmFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
  begin

    key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO;

  end;

end;

procedure TfrmFornecedor.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsFornecedor.IsEmpty then
  begin

    MostrarOcultarAbas(1);
    pgcFornecedor.ActivePageIndex      := 1;
    RelacionarUltimaNF;
    RelacionarUltimaOrdemCompra;

  end;

end;

procedure TfrmFornecedor.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsFornecedor.IsEmpty then
  begin

    if not odd(dmMProvider.cdsFornecedor.RecNo) then
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

procedure TfrmFornecedor.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
   grdTabelaDblClick(self);

end;

procedure TfrmFornecedor.grdUltimaNFEntradaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsNFEntrada.IsEmpty then
  begin

    if not odd(dmMProvider.cdsNFEntrada.RecNo) then
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

procedure TfrmFornecedor.grdUltimaordemCompraDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsOrdemCompra.IsEmpty then
  begin

    if not odd(dmMProvider.cdsOrdemCompra.RecNo) then
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

procedure TfrmFornecedor.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled := pOpcao;

end;

procedure TfrmFornecedor.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsFornecedor.Active then
  begin

    if not (dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO;

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmFornecedor.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmFornecedor.memObservacaoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    if Length(Trim(dmMProvider.cdsFornecedorOBSERVACAO.Text)) > 0 then
      dmMProvider.cdsFornecedorOBSERVACAO.Value  := RetirarAcentuacao(sender)

end;

procedure TfrmFornecedor.memObservacaoKeyPress(Sender: TObject; var Key: Char);
begin

  key := Upcase(key);

end;

procedure TfrmFornecedor.MostrarOcultarAbas(pOpcao: integer);
begin

  pgcFornecedor.Pages[1].TabVisible := (pOpcao = 1);

end;

procedure TfrmFornecedor.rdgAtividadeClick(Sender: TObject);
begin

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    dmMProvider.cdsFornecedorRAMODEATIVIDADE.Value := rdgAtividade.ItemIndex;

end;

procedure TfrmFornecedor.rdgTipoEmpresaClick(Sender: TObject);
begin

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    dmMProvider.cdsFornecedorTIPO.Value := rdgTipoEmpresa.ItemIndex;

end;

procedure TfrmFornecedor.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.SetFocus;
  edtConteudoPesquisa.Clear;

end;

procedure TfrmFornecedor.RelacionarUltimaNF;
begin

  dmMProvider.cdsUltimaNFForn.Close;
  dmMProvider.cdsUltimaNFForn.ProviderName  := 'dspUltimaNFForn';

  dmDBEXMaster.fdqNFEntrada.SQL.Clear;
  dmDBEXMaster.fdqNFEntrada.SQL.Add('select first 1 max(entrada) as entrada, emissao,');
  dmDBEXMaster.fdqNFEntrada.SQL.Add('nfentrada,notafiscal, valordosprodutos, valordanota from nfentrada');
  dmDBEXMaster.fdqNFEntrada.SQL.Add('where fornecedor = ' + IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value));
  dmDBEXMaster.fdqNFEntrada.SQL.Add('group by emissao, nfentrada, notafiscal, valordosprodutos, valordanota');
  dmDBEXMaster.fdqNFEntrada.SQL.Add('order by entrada desc');

  dmMProvider.cdsUltimaNFForn.Open;
  dmMProvider.cdsUltimaNFForn.ProviderName := '';

end;

procedure TfrmFornecedor.RelacionarUltimaOrdemCompra;
begin

  dmMProvider.cdsUltimaOCForn.Close;
  dmMProvider.cdsUltimaOCForn.ProviderName  := 'dspUltimaOCForn';
  dmMSource.dtsOrdemCompra.DataSet          := dmMProvider.cdsUltimaOCForn;

  dmDBEXMaster.fdqOrdemCompra.SQL.Clear;
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('select max(ordemdecompra)as ordemdecompra, max(emissao) as emissao,');
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('max(entrega)as entrega, max(faturamento) as faturamento,');
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('max(totaldopedido) as totaldopedido from ordemdecompra');
  dmDBEXMaster.fdqOrdemCompra.SQL.Add('where fornecedor = ' + IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value));

  dmMProvider.cdsUltimaOCForn.Open;
  dmMProvider.cdsUltimaOCForn.ProviderName := '';

end;

procedure TfrmFornecedor.WindowClose1Execute(Sender: TObject);
begin

  activecontrol := nil;
  Close;

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

procedure TfrmFornecedor.edtRazaoSocialExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmMProvider.cdsFornecedorRAZAOSOCIAL.Text)) > 0 then
    begin

      dmMProvider.cdsFornecedorRAZAOSOCIAL.Value  := RetirarAcentuacao(sender);
      dmMProvider.cdsFornecedorFANTASIA.Value     := AbreviaNome(dmMProvider.cdsFornecedorRAZAOSOCIAL.Value);

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtRazaoSocial.SetFocus;

    end;

  end;

end;

procedure TfrmFornecedor.edtRepresentanteExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsFornecedor.State in [dsEdit, dsInsert] then
    if Length(Trim(dmMProvider.cdsFornecedorREPRESENTANTE.Text)) > 0 then
      dmMProvider.cdsFornecedorREPRESENTANTE.Value  := RetirarAcentuacao(sender)

end;

end.
