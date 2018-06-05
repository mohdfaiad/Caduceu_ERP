unit modParticipantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  ACBrSocket, ACBrConsultaCNPJ, ACBrBase, ACBrValidador, System.Actions,
  Vcl.ActnList, Vcl.StdActns, Vcl.Mask, Vcl.DBCtrls, ACBrDFe, ACBrNFe, ACBrCEP;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmParticipantes = class(TForm)
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
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
    pgcCadastro: TPageControl;
    tbsTabela: TTabSheet;
    tbsCadastro: TTabSheet;
    grdTabela: TDBGrid;
    grpCadastro: TGroupBox;
    lblCodigo: TLabel;
    edtCliente: TDBEdit;
    lblDataCadastro: TLabel;
    edtDatacadastro: TDBEdit;
    lblRazaoSocial: TLabel;
    edtRazaoSocial: TDBEdit;
    edtNomeFantasia: TDBEdit;
    lblNomeFantasia: TLabel;
    lblCNPJ_CPF_CEI: TLabel;
    edtCNPJ_CPF_CEI: TDBEdit;
    edtIE_RG: TDBEdit;
    lblIE_RG: TLabel;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    rdgTipoPessoa: TDBRadioGroup;
    rdgStatus_Credito: TDBRadioGroup;
    edtNumero: TDBEdit;
    lblNumero: TLabel;
    edtCep: TDBEdit;
    lblCep: TLabel;
    imgConsultaCepEnd: TImage;
    lblEstado: TLabel;
    rdgAtivo: TDBRadioGroup;
    cboEstado: TDBLookupComboBox;
    lblCidade: TLabel;
    cboCidade: TDBLookupComboBox;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblContato: TLabel;
    edtContato: TDBEdit;
    lblPontodeReferencia: TLabel;
    edtPontodeReferencia: TDBEdit;
    chkEndEntrCobrIgualEnd: TDBCheckBox;
    lblWebSite: TLabel;
    edtWebSite: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblDDD: TLabel;
    edtDDD: TDBEdit;
    lblTelefone1: TLabel;
    edtTelefone1: TDBEdit;
    edtTelefone2: TDBEdit;
    lblTelefone2: TLabel;
    lblCelular: TLabel;
    edtCelular: TDBEdit;
    lblVendedor: TLabel;
    edtVendedor: TDBEdit;
    cboVendedor: TDBLookupComboBox;
    tbsInformacoesFiscaisCompementares: TTabSheet;
    grpInformaoesFiscaisComplementares: TGroupBox;
    lblInscricaoSuframa: TLabel;
    edtInscricaoSuframa: TDBEdit;
    edtInscricaoProdutor: TDBEdit;
    lblInscricaoProdutor: TLabel;
    cboPais: TDBLookupComboBox;
    lblPais: TLabel;
    lblTipoLogradouro: TLabel;
    cboTipoLogradouro: TDBLookupComboBox;
    lblDataAbertura: TLabel;
    edtDataAbertura: TDBEdit;
    lblSituacaoEmpresa: TLabel;
    edtSituacao_Empresa: TDBEdit;
    lblDataSituacaoAtual: TLabel;
    edtDataSituacaoAtual: TDBEdit;
    lblInscricaoMunicipal: TLabel;
    edtInscricaoMunicipal: TDBEdit;
    lblCodigoAtividadeMunicipal: TLabel;
    edtCodigoAtividadeMunicipal: TDBEdit;
    edtCodigoAtividadeEstadual: TDBEdit;
    lblCodigoAtividadeEstadual: TLabel;
    lblCodigoAtividadeFederal: TLabel;
    edtCodigoAtividadeFederal: TDBEdit;
    lblCNAE_Principal: TLabel;
    edtCNAE_Principal: TDBEdit;
    lblCNAE_Secundarios: TLabel;
    memCNAE_Secundarios: TDBMemo;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    actIncluir: TAction;
    actDesfazer: TAction;
    actSalvar: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    ACBrValidador1: TACBrValidador;
    ACBrNFe1: TACBrNFe;
    edtTipoEmpresa: TDBEdit;
    lblTipoEmpresa: TLabel;
    DBCheckBox1: TDBCheckBox;
    lblCRT: TLabel;
    edtCRT: TDBEdit;
    chkProdutorRural: TDBCheckBox;
    chkContribuinteICMS: TDBCheckBox;
    tbsInformacoesCredito: TTabSheet;
    grpInformacoesdeCredito: TGroupBox;
    lblRenda: TLabel;
    lblLimitedeCredito: TLabel;
    lblSaldoDEvedor: TLabel;
    lblLimiteDisponivel: TLabel;
    edtRenda: TDBEdit;
    edtLimitedeCredito: TDBEdit;
    edtSaldoDevedor: TDBEdit;
    edtLimiteDisponivel: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    ACBrCEP1: TACBrCEP;
    pgcEndEntregaCobr: TPageControl;
    tbsObservacoes: TTabSheet;
    tbsEndEntrega: TTabSheet;
    tbsEnderecoCobranca: TTabSheet;
    tbsUltimaNFEntrada: TTabSheet;
    tbsUltimaNFsaida: TTabSheet;
    tbsUltimaNCFe: TTabSheet;
    tbsUltimaOrdemCompra: TTabSheet;
    grpObservacoes: TGroupBox;
    memObservacoes: TDBMemo;
    grpEnderecoEntrega: TGroupBox;
    lblEnderecoEntrega: TLabel;
    lblNumeroEndEntrega: TLabel;
    lblCEPEndEntrega: TLabel;
    lblEstadoEntrega: TLabel;
    lblCidadeEntrega: TLabel;
    lblPontoReferenciaEntrega: TLabel;
    edtEnderecoEntrega: TDBEdit;
    edtNumeroEndEntrega: TDBEdit;
    edtCEPEndEntrega: TDBEdit;
    cboEstadoEntrega: TDBLookupComboBox;
    cboCidadeEntrega: TDBLookupComboBox;
    edtPontoReferenciaEntrega: TDBEdit;
    imgConsultaCEPEndEntrega: TImage;
    grpEnderecoCobranca: TGroupBox;
    lblEnderecoCobranca: TLabel;
    lblNumeroEndCobranca: TLabel;
    lblCEPCobranca: TLabel;
    imgConsultaCepCobranca: TImage;
    lblEstadoCobranca: TLabel;
    lblCidadeCobranca: TLabel;
    lblPontoReferenciaCobranca: TLabel;
    edtEnderecoCobranca: TDBEdit;
    edtNumeroEndCobranca: TDBEdit;
    edtCEPCobranca: TDBEdit;
    cboEstadoCobranca: TDBLookupComboBox;
    cboCidadeCobranca: TDBLookupComboBox;
    edtPontoreferenciaCobranca: TDBEdit;
    grpUltimaNFEntrada: TGroupBox;
    grpUltimaNFSaida: TGroupBox;
    grpUltimaNFCe: TGroupBox;
    grpUltimaOrdemCompra: TGroupBox;
    grdUltimaNFEntrada: TDBGrid;
    grdUltimaNFsaida: TDBGrid;
    grdUltimaOCPart: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure MostrarOcultarAbas(pOpcao:integer);
    procedure actIncluirExecute(Sender: TObject);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure edtRazaoSocialExit(Sender: TObject);
    procedure edtCodigoPaisExit(Sender: TObject);
    procedure edtNomeFantasiaExit(Sender: TObject);
    procedure MostrarOcultarEnderecosEntr_Cobr(pOpcao:integer);
    procedure chkEndEntrCobrIgualEndClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtEnderecoExit(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure edtContatoExit(Sender: TObject);
    procedure edtPontodeReferenciaExit(Sender: TObject);
    procedure edtEnderecoEntregaExit(Sender: TObject);
    procedure edtPontoReferenciaEntregaExit(Sender: TObject);
    procedure edtEnderecoCobrancaExit(Sender: TObject);
    procedure edtPontoreferenciaCobrancaExit(Sender: TObject);
    procedure edtCNPJ_CPF_CEIKeyPress(Sender: TObject; var Key: Char);
    procedure chkProdutorRuralClick(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure cboEstadoExit(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdUltimaNFEntradaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdUltimaNFsaidaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cboEstadoEntregaExit(Sender: TObject);
    procedure cboEstadoCobrancaExit(Sender: TObject);
    procedure rdgTipoPessoaClick(Sender: TObject);
    procedure rdgTipoPessoaChange(Sender: TObject);
    procedure imgConsultaCepEndClick(Sender: TObject);
    procedure imgConsultaCEPEndEntregaClick(Sender: TObject);
    procedure imgConsultaCepCobrancaClick(Sender: TObject);
    procedure edtCNPJ_CPF_CEIExit(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    function ValidarEnderecos:boolean;
    procedure AtualizarEnderecoPeloCEP(pOpcao:smallint);
  public
    { Public declarations }
  end;

var
  frmParticipantes: TfrmParticipantes;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMDJPdv, dataMProvider, dataMSource, uConstantes_Padrao,
  uFuncoes, uFuncoes_BD, modPesqCnpj, modCaptcha;


procedure TfrmParticipantes.actDesfazerExecute(Sender: TObject);
var
  i:integer;
begin

  LimparMSG_ERRO(lblMsg, nil);

  if dmMProvider.cdsParticipantes.Active then
    if InserindoEditando(dmMProvider.cdsParticipantes) then
    begin

      dmMProvider.cdsParticipantes.Cancel;

      for i := 0 to pgcCadastro.PageCount -1 do
        pgcCadastro.Pages[i].TabVisible  := false;

      pgcCadastro.Pages[0].TabVisible  := True;

      pgcCadastro.ActivePageIndex      := 0;

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end;

  HabilitaDesabilitaControles(False);

end;

procedure TfrmParticipantes.actEditarExecute(Sender: TObject);
begin

  if dmMProvider.cdsParticipantes.Active then
  begin

    if not InserindoEditando(dmMProvider.cdsParticipantes) then
    begin

      pgcCadastro.ActivePageIndex := 1;
      HabilitaDesabilitaControles(True);
      dmMProvider.cdsParticipantes.Edit;
      edtRazaoSocial.SetFocus;

    end;

  end;

end;

procedure TfrmParticipantes.actExcluirExecute(Sender: TObject);
begin

  try

    Man_Tab_Partiipantes(1);

    dmMProvider.cdsParticipantes.Delete;

    LimparMSG_ERRO(lblMsg, nil);

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

  HabilitaDesabilitaControles(false);
  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmParticipantes.actIncluirExecute(Sender: TObject);
var
  iModalResult, iConsultaSEFAZ, i:integer;
  sTelefone, sResposta:string;
begin

  LimparMSG_ERRO(lblMsg, nil);

  try

    if not InserindoEditando(dmMProvider.cdsParticipantes) then
    begin

      edtConteudoPesquisa.Clear;

      frmPesqCnpj               := TfrmPesqCnpj.Create(self);
      frmPesqCnpj.sNome_Usuario := dmDBEXMaster.sNomeUsuario;
      //seta a tag para mostrar o checkbox indicando que � exterior;
      frmPesqCnpj.Tag           := 1;

      if frmPesqCnpj.ShowModal = mrOk then
      begin

        if frmPesqCnpj.chkExterior.Checked then
        begin //exterior

          MostrarOcultarAbas(1);

          pgcCadastro.ActivePageIndex := 1;

          HabilitaDesabilitaControles(True);

          PesquisarParticipantes(1,'-1');

          dmMProvider.cdsParticipantes.Append;
          dmMProvider.cdsParticipantesESTADO.Value := 'EX';

          if AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO.Value,'') then
            dmMProvider.cdsParticipantesCODIGO_MUNICIPIO.Value := dmMProvider.cdsCidadesCIDADE.Value;

          dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value := 1;

          edtRazaoSocial.SetFocus;

          pgcCadastro.Pages[2].TabVisible := False;

        end
        else
        begin

          if not PesquisarParticipantes(1,Trim(frmPesqCnpj.edtCNPJ.Text)) then
          begin

            if dmMProvider.cdsConfiguracoesCONSULTAR_CNPJ_CPF_RFB_SEFAZ.Value = 1 then
            begin

              frmCaptcha              := TfrmCaptcha.Create(self);
              frmCaptcha.sCnpj_Cpf    := Trim(frmPesqCnpj.edtCNPJ.Text);
              frmCaptcha.sNomeUsuario := dmDBEXMaster.sNomeUsuario;

              lblMsg.Caption          := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE_CONS_CNPJ_RFB;
              Application.ProcessMessages;

              iModalResult := frmCaptcha.ShowModal;

              case iModalResult of
               mrOk:begin

                      if length(Trim(frmCaptcha.sCnpj_Cpf)) = 14 then
                      begin

                        if frmCaptcha.ACBrConsultaCNPJ1.Consulta(frmCaptcha.sCnpj_Cpf, frmCaptcha.edtCaptcha.Text,True) then
                        begin

                          if UpperCase(frmCaptcha.ACBrConsultaCNPJ1.Situacao) = 'BAIXADA' then
                          begin

                            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_EMPRESA_BAIXADA_RFB;
                            Application.ProcessMessages;

                          end
                          else
                          begin

                            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSULTA_CADASTRO_SEFAZ;
                            Application.ProcessMessages;

                            ACBrNFe1.WebServices.ConsultaCadastro.UF    := frmCaptcha.ACBrConsultaCNPJ1.UF;
                            ACBrNFe1.WebServices.ConsultaCadastro.CNPJ  := LimparCpnjInscricao(frmCaptcha.ACBrConsultaCNPJ1.CNPJ);
                            ACBrNFe1.WebServices.ConsultaCadastro.Executar;

                            sResposta := ACBrNFe1.WebServices.StatusServico.RetornoWS;

                            LimparMSG_ERRO(lblMsg, nil);

                            iConsultaSEFAZ := ACBrNFe1.WebServices.ConsultaCadastro.cStat;

                            MostrarOcultarAbas(1);  //111

                            if not PesquisarParticipantes(0,'-1') then
                            begin

                              HabilitaDesabilitaControles(True);

                              pgcCadastro.ActivePageIndex := 1;

                              dmMProvider.cdsParticipantes.Append;

                              dmMProvider.cdsParticipantesNOME_RAZAO_SOCIAL.Value       := UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCNPJ1.RazaoSocial));
                              dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value            := frmCaptcha.sCnpj_Cpf;

                              if (iConsultaSEFAZ = 264) or (ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cSit = 0) then
                              begin

                                dmMProvider.cdsParticipantesRG_IE.Value                 := 'ISENTO';
                                dmMProvider.cdsParticipantesCONTRIBUINTE_ICMS.Value     := 0;

                              end
                              else if (iConsultaSEFAZ = 111) and (ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cSit = 1) then
                              begin

                                dmMProvider.cdsParticipantesRG_IE.Value                 := ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE;
                                dmMProvider.cdsParticipantesCONTRIBUINTE_ICMS.Value     := 1;

                              end
                              else if (iConsultaSEFAZ = 111) and (ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cSit = 0) then
                              begin

                                dmMProvider.cdsParticipantesRG_IE.Value                 := 'ISENTO';
                                dmMProvider.cdsParticipantesCONTRIBUINTE_ICMS.Value     := 0;

                              end;

                              if UpperCase(RetirarAcentuacaoString(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xRegApur)) = 'ORDINARIO' then
                                dmMProvider.cdsParticipantesCRT.Value := 3
                              else
                                dmMProvider.cdsParticipantesCRT.Value := 1;

                              dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value  := 1;
                              dmMProvider.cdsParticipantesNOME_FANTASIA.Value           := UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCNPJ1.Fantasia));
                              dmMProvider.cdsParticipantesENDERECO.Value                := UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCNPJ1.Endereco));
                              dmMProvider.cdsParticipantesNUMERO.Value                  := frmCaptcha.ACBrConsultaCNPJ1.Numero;
                              dmMProvider.cdsParticipantesCOMPLEMENTO.Value             := UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCNPJ1.Complemento));
                              dmMProvider.cdsParticipantesBAIRRO.Value                  := UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCNPJ1.Bairro));
                              dmMProvider.cdsParticipantesESTADO.Value                  := frmCaptcha.ACBrConsultaCNPJ1.UF;

                              if  AbrirTabelaCidades(2,UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCNPJ1.Cidade)), dmMProvider.cdsParticipantesESTADO.Value) then
                                dmMProvider.cdsParticipantesCODIGO_MUNICIPIO.Value      := dmMProvider.cdsCidadesCIDADE.Value;

                              dmMProvider.cdsParticipantesCEP.Value                     := SomenteNumeros(frmCaptcha.ACBrConsultaCNPJ1.CEP);
                              dmMProvider.cdsParticipantesEMAIL.Value                   := frmCaptcha.ACBrConsultaCNPJ1.EndEletronico;

                              try

                                ACBrCEP1.BuscarPorCEP(dmMProvider.cdsParticipantesCEP.Value);
                                if ACBrCEP1.Enderecos.Count > 0 then
                                begin

                                  if dmMProvider.cdsTipoLogradouro.Locate('SIGLA',UpperCase(Copy(Trim(ACBrCEP1.Enderecos[0].Tipo_Logradouro),1,7)),[]) then
                                    dmMProvider.cdsParticipantesTIPO_LOGRADOURO.Value  := dmMProvider.cdsTipoLogradouroTIPO_LOGRADOURO.Value
                                  else
                                  begin

                                    dmMProvider.cdsTipoLogradouro.Append;
                                    dmMProvider.cdsTipoLogradouroSIGLA.Value      := UpperCase(Copy(Trim(ACBrCEP1.Enderecos[0].Tipo_Logradouro),1,7));
                                    dmMProvider.cdsTipoLogradouroDESCRICAO.Value  := UpperCase(Copy(Trim(ACBrCEP1.Enderecos[0].Tipo_Logradouro),1,30));

                                    Man_Tab_Tipo_Logradouro(0);

                                    dmMProvider.cdsTipoLogradouro.Post;

                                    dmMProvider.cdsParticipantesTIPO_LOGRADOURO.Value  := dmMProvider.cdsTipoLogradouroTIPO_LOGRADOURO.Value

                                  end;

                                end;

                              except
                                On E : Exception do
                                begin

                                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', consulta do CEP n�o realizada. ' + Tratar_Erro_Conexao(E);
                                  Application.ProcessMessages;

                                end;

                              end;

                              sTelefone                                                 := SomenteNumeros(frmCaptcha.ACBrConsultaCNPJ1.Telefone);

                              if Length(Trim(sTelefone)) = 10 then
                              begin

                                if sTelefone[1] = '0' then
                                begin

                                  dmMProvider.cdsParticipantesDDD.Value                 := Copy(sTelefone,1,3);
                                  dmMProvider.cdsParticipantesTELEFONE1.Value           := Copy(sTelefone,4,7);

                                end
                                else
                                begin

                                  dmMProvider.cdsParticipantesDDD.Value                 := Copy(sTelefone,1,2);
                                  dmMProvider.cdsParticipantesTELEFONE1.Value           := Copy(sTelefone,3,8);

                                end;

                              end;

                              //informa��es fiscais
                              dmMProvider.cdsParticipantesTIPO_EMPRESA.Value            := frmCaptcha.ACBrConsultaCNPJ1.EmpresaTipo;
                              dmMProvider.cdsParticipantesDATA_ABERTURA.Value           := frmCaptcha.ACBrConsultaCNPJ1.Abertura;
                              dmMProvider.cdsParticipantesSITUACAO_EMPRESA.Value        := frmCaptcha.ACBrConsultaCNPJ1.Situacao;
                              dmMProvider.cdsParticipantesDATA_ENCERRAMENTO.Value       := frmCaptcha.ACBrConsultaCNPJ1.DataSituacao;
                              dmMProvider.cdsParticipantesCNAE_PRINCIPAL.Value          := frmCaptcha.ACBrConsultaCNPJ1.CNAE1;

                              for i := 0 to frmCaptcha.ACBrConsultaCNPJ1.CNAE2.Count - 1 do
                                dmMProvider.cdsParticipantesCNAE_SECUNDARIOS.Value := dmMProvider.cdsParticipantesCNAE_SECUNDARIOS.Value + frmCaptcha.ACBrConsultaCNPJ1.CNAE2[i] + #13;

                              edtRazaoSocial.SetFocus;
                              edtCNPJ_CPF_CEI.ReadOnly := True;


                            end;

                          end;

                        end;

                      end
                      else if length(Trim(frmCaptcha.sCnpj_Cpf)) <= 11 then
                      begin

                        if frmCaptcha.ACBrConsultaCPF1.Consulta(frmCaptcha.sCnpj_Cpf, FormatDateTime('dd/mm/yyyy',frmCaptcha.dtpDataNascimento.Date),frmCaptcha.edtCaptcha.Text) then
                        begin

                          if UpperCase(Trim(frmCaptcha.ACBrConsultaCPF1.Situacao)) <> 'REGULAR' then
                          begin

                            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_SITUACAO_CPF;
                            Application.ProcessMessages;

                          end
                          else
                          begin

                            MostrarOcultarAbas(1);  //111

                            if not PesquisarParticipantes(0,'-1') then
                            begin

                              HabilitaDesabilitaControles(True);

                              pgcCadastro.ActivePageIndex := 1;

                              dmMProvider.cdsParticipantes.Append;

                              dmMProvider.cdsParticipantesNOME_RAZAO_SOCIAL.Value       := UpperCase(RetirarAcentuacaoString(frmCaptcha.ACBrConsultaCPF1.Nome));
                              dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value            := frmCaptcha.sCnpj_Cpf;
                              dmMProvider.cdsParticipantesCONTRIBUINTE_ICMS.Value       := 0;
                              dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value  := 0;
                              dmMProvider.cdsParticipantesNOME_FANTASIA.Value           := dmMProvider.cdsParticipantesNOME_RAZAO_SOCIAL.Value;

                              //informa��es fiscais
                              dmMProvider.cdsParticipantesSITUACAO_EMPRESA.Value        := frmCaptcha.ACBrConsultaCPF1.Situacao;
                              dmMProvider.cdsParticipantesDATA_NASCIMENTO.Value         := StrTodate(frmCaptcha.ACBrConsultaCPF1.DataNascimento);

                              edtRazaoSocial.SetFocus;
                              edtCNPJ_CPF_CEI.ReadOnly := True;

                            end;

                          end;

                        end;

                      end;

                    end;
           mrCancel:begin

                      if (not frmPesqCnpj.chkExterior.Checked) or (Length(Trim(frmPesqCnpj.edtCNPJ.Text)) = 14) then
                      begin

                        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSULTA_CADASTRO_SEFAZ;
                        Application.ProcessMessages;

                        ACBrNFe1.WebServices.ConsultaCadastro.UF    := dmMProvider.cdsFilialESTADO.Value;
                        ACBrNFe1.WebServices.ConsultaCadastro.CNPJ  := LimparCpnjInscricao(frmPesqCnpj.edtCNPJ.Text);
                        ACBrNFe1.WebServices.ConsultaCadastro.Executar;

                        sResposta := ACBrNFe1.WebServices.StatusServico.RetornoWS;

                        LimparMSG_ERRO(lblMsg, nil);

                        iConsultaSEFAZ := ACBrNFe1.WebServices.ConsultaCadastro.cStat;

                      end;

                      if not PesquisarParticipantes(0,'-1') then
                      begin

                        MostrarOcultarAbas(1);

                        pgcCadastro.ActivePageIndex := 1;

                        HabilitaDesabilitaControles(True);

                        dmMProvider.cdsParticipantes.Append;

                        edtRazaoSocial.SetFocus;

                        dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value               := frmCaptcha.sCnpj_Cpf;

                        if length(trim(dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value)) <= 12 then
                        begin

                          dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value := 0;
                          pgcCadastro.Pages[2].TabVisible := False;

                        end
                        else
                          dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value := 1;

                      end;

                      edtCNPJ_CPF_CEI.ReadOnly := True;

                    end;
            mrClose:begin

                      if not PesquisarParticipantes(0,'-1') then
                      begin

                        MostrarOcultarAbas(1);

                        pgcCadastro.ActivePageIndex := 1;

                        HabilitaDesabilitaControles(True);

                        dmMProvider.cdsParticipantes.Append;

                        edtRazaoSocial.SetFocus;

                        dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value               := frmCaptcha.sCnpj_Cpf;

                        if length(trim(dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value)) <= 12 then
                        begin

                          dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value := 0;
                          pgcCadastro.Pages[2].TabVisible := False;

                        end
                        else
                          dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value := 1;

                      end;

                      edtCNPJ_CPF_CEI.ReadOnly := True;

                    end;

              end;

            end
            else
            begin

              MostrarOcultarAbas(1);

              pgcCadastro.ActivePageIndex := 1;

              HabilitaDesabilitaControles(True);

              dmMProvider.cdsParticipantes.Append;

              edtRazaoSocial.SetFocus;

              dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value               := frmPesqCnpj.edtCNPJ.Text;

              if length(trim(dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value)) <= 12 then
              begin

                dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value := 0;
                pgcCadastro.Pages[2].TabVisible := False;

              end
              else
                dmMProvider.cdsParticipantesPESSOA_FISICA_JURIDICA.Value := 1;

              edtCNPJ_CPF_CEI.ReadOnly := True;

            end;

          end;

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_USAR_ENDERECOS_IGUAIS;
          lblMsg.Tag      := ord(UsarEnderecosIguais);
          Application.ProcessMessages;

        end;

//        LimparMSG_ERRO(lblMsg, nil);
        FreeAndNil(frmPesqCnpj);

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

procedure TfrmParticipantes.actSalvarExecute(Sender: TObject);
begin

  try

    if dmMProvider.cdsParticipantes.Active then
    begin

      if InserindoEditando(dmMProvider.cdsParticipantes) then
      begin

        LimparMSG_ERRO(lblMsg, nil);

        if not ValidarEnderecos then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ENDERECOS_PARTICIPANTES;
          Application.ProcessMessages;

        end
        else
        begin

          Man_Tab_Partiipantes(0);

          dmMProvider.cdsParticipantes.Post;

          edtConteudoPesquisa.Clear;

          edtConteudoPesquisa.SetFocus;

          HabilitaDesabilitaControles(False);

        end;

      end;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

end;

procedure TfrmParticipantes.AtualizarEnderecoPeloCEP(pOpcao: smallint);
begin

  case pOpcao of
    ord(EnderecoPorCEP):begin

                          if Length(trim(dmMProvider.cdsParticipantesCEP.Value)) > 0 then
                          begin

                            try

                              ACBrCEP1.BuscarPorCEP(dmMProvider.cdsParticipantesCEP.Value);

                              if ACBrCEP1.Enderecos.Count > 0 then
                              begin

                                if dmMProvider.cdsTipoLogradouro.Locate('SIGLA',UpperCase(Copy(Trim(ACBrCEP1.Enderecos[0].Tipo_Logradouro),1,7)),[]) then
                                  dmMProvider.cdsParticipantesTIPO_LOGRADOURO.Value  := dmMProvider.cdsTipoLogradouroTIPO_LOGRADOURO.Value
                                else
                                begin

                                  dmMProvider.cdsTipoLogradouro.Append;
                                  dmMProvider.cdsTipoLogradouroSIGLA.Value      := UpperCase(Copy(Trim(ACBrCEP1.Enderecos[0].Tipo_Logradouro),1,7));
                                  dmMProvider.cdsTipoLogradouroDESCRICAO.Value  := UpperCase(Copy(Trim(ACBrCEP1.Enderecos[0].Tipo_Logradouro),1,30));

                                  Man_Tab_Tipo_Logradouro(0);

                                  dmMProvider.cdsTipoLogradouro.Post;

                                end;

                                dmMProvider.cdsParticipantesTIPO_LOGRADOURO.Value   := dmMProvider.cdsTipoLogradouroTIPO_LOGRADOURO.Value;

                                dmMProvider.cdsParticipantesESTADO.Value            := UpperCase(Trim(ACBrCEP1.Enderecos[0].UF));
                                dmMProvider.cdsParticipantesENDERECO.Value          := dmMProvider.cdsTipoLogradouroSIGLA.Value + ' ' + RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Logradouro)));
                                dmMProvider.cdsParticipantesBAIRRO.Value            := RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Bairro)));
                                dmMProvider.cdsParticipantesCOMPLEMENTO.Value       := RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Complemento)));

                                if  AbrirTabelaCidades(2,UpperCase(RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Municipio)))),dmMProvider.cdsParticipantesESTADO.Value) then
                                  dmMProvider.cdsParticipantesCODIGO_MUNICIPIO.Value := dmMProvider.cdsCidadesCIDADE.Value;

                              end;

                            except
                              On E : Exception do
                              begin

                                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', consulta do CEP n�o realizada. ' + Tratar_Erro_Conexao(E);
                                Application.ProcessMessages;

                              end;

                            end;

                          end;

      end;

 ord(EnderecoEntregaPorCEP):begin

                              if Length(trim(dmMProvider.cdsParticipantesCEP_ENTREGA.Value)) > 0 then
                              begin

                                try

                                  ACBrCEP1.BuscarPorCEP(dmMProvider.cdsParticipantesCEP_ENTREGA.Value);

                                  if ACBrCEP1.Enderecos.Count > 0 then
                                  begin

                                    dmMProvider.cdsParticipantesESTADO_ENTREGA.Value            := UpperCase(Trim(ACBrCEP1.Enderecos[0].UF));
                                    dmMProvider.cdsParticipantesENDERECO_ENTREGA.Value          := dmMProvider.cdsTipoLogradouroSIGLA.Value + ' ' + RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Logradouro)));
                                    dmMProvider.cdsParticipantesBAIRRO_ENTREGA.Value            := RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Bairro)));
                                    dmMProvider.cdsParticipantesCOMPLEMENTO_ENTREGA.Value       := RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Complemento)));

                                    if  AbrirTabelaCidades(2,UpperCase(RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Municipio)))),dmMProvider.cdsParticipantesESTADO_ENTREGA.Value) then
                                      dmMProvider.cdsParticipantesCODIGO_MUNICIPIO_ENTREGA.Value := dmMProvider.cdsCidadesCIDADE.Value;

                                  end;

                                except
                                  On E : Exception do
                                  begin

                                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', consulta do CEP n�o realizada. ' + Tratar_Erro_Conexao(E);
                                    Application.ProcessMessages;

                                  end;

                                end;

                              end;

      end;

 ord(EnderecoCobrancaPorCEP):begin

                              if Length(trim(dmMProvider.cdsParticipantesCEP_COBRANCA.Value)) > 0 then
                              begin

                                try

                                  ACBrCEP1.BuscarPorCEP(dmMProvider.cdsParticipantesCEP_COBRANCA.Value);

                                  if ACBrCEP1.Enderecos.Count > 0 then
                                  begin

                                    dmMProvider.cdsParticipantesESTADO_COBRANCA.Value            := UpperCase(Trim(ACBrCEP1.Enderecos[0].UF));
                                    dmMProvider.cdsParticipantesENDERECO_COBRANCA.Value          := dmMProvider.cdsTipoLogradouroSIGLA.Value + ' ' + RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Logradouro)));
                                    dmMProvider.cdsParticipantesBAIRRO_COBRANCA.Value            := RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Bairro)));
                                    dmMProvider.cdsParticipantesCOMPLEMENTO_COBRANCA.Value       := RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Complemento)));

                                    if  AbrirTabelaCidades(2,UpperCase(RetirarAcentuacaoString(UpperCase(Trim(ACBrCEP1.Enderecos[0].Municipio)))),dmMProvider.cdsParticipantesESTADO_ENTREGA.Value) then
                                      dmMProvider.cdsParticipantesCODIGO_MUNICIPIO_COBRANCA.Value := dmMProvider.cdsCidadesCIDADE.Value;

                                  end;

                                except
                                  On E : Exception do
                                  begin

                                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', consulta do CEP n�o realizada. ' + Tratar_Erro_Conexao(E);
                                    Application.ProcessMessages;

                                  end;

                                end;

                              end;

      end;
  end;

end;

procedure TfrmParticipantes.cboEstadoCobrancaExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    if Length(Trim(dmMProvider.cdsParticipantesESTADO_COBRANCA.Value)) > 0 then
      AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO_COBRANCA.Value, '');

  end;

end;

procedure TfrmParticipantes.cboEstadoEntregaExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    if Length(Trim(dmMProvider.cdsParticipantesESTADO_ENTREGA.Value)) > 0 then
      AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO_ENTREGA.Value,'');

  end;

end;

procedure TfrmParticipantes.cboEstadoExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    if Length(Trim(dmMProvider.cdsParticipantesESTADO.Value)) > 0 then
      AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO.Value, '');

  end;

end;

procedure TfrmParticipantes.chkEndEntrCobrIgualEndClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    if chkEndEntrCobrIgualEnd.Checked then
    begin

      MostrarOcultarEnderecosEntr_Cobr(1);
      dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value := 1;

    end
    else
    begin

      MostrarOcultarEnderecosEntr_Cobr(0);
      dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value := 0;

    end;

  end;

end;

procedure TfrmParticipantes.chkProdutorRuralClick(Sender: TObject);
begin

  edtInscricaoProdutor.Enabled := chkProdutorRural.Checked;

end;

procedure TfrmParticipantes.edtCepExit(Sender: TObject);
begin

  ActiveControl := nil;

  MudarCorEdit(sender);

  if Length(trim(dmMProvider.cdsParticipantesENDERECO.Value)) <= 0 then
    imgConsultaCepEndClick(self);

end;

procedure TfrmParticipantes.edtClienteChange(Sender: TObject);
begin

  MostrarOcultarEnderecosEntr_Cobr(dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value);

end;

procedure TfrmParticipantes.edtCNPJ_CPF_CEIExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmParticipantes.edtCNPJ_CPF_CEIKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not(Key in ['0' .. '9', Chr(8)]) then
    Key := #0;

end;

procedure TfrmParticipantes.edtCodigoPaisExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmParticipantes.edtComplementoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesCOMPLEMENTO.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtContatoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesCONTATO.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmParticipantes.edtConteudoPesquisaExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);
  MudarCorEdit(Sender);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    if rdpOpcoesPesquisa.ItemIndex = 1 then
    begin

      if not ValidarCnpjCpf(Trim(LimparCpnjInscricao(edtConteudoPesquisa.Text))) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO;
        Application.ProcessMessages;

        edtConteudoPesquisa.SetFocus;
        exit;

      end;

    end;

    if PesquisarParticipantes(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
    begin

      pgcCadastro.ActivePageIndex := 0;
      grdTabela.SetFocus

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;

    end;

    edtConteudoPesquisa.Clear;

  end;

end;

procedure TfrmParticipantes.edtConteudoPesquisaKeyDown(Sender: TObject;
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

procedure TfrmParticipantes.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmParticipantes.edtEnderecoCobrancaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesENDERECO_COBRANCA.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtEnderecoEntregaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesENDERECO_ENTREGA.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtEnderecoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesENDERECO.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtNomeFantasiaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesNOME_FANTASIA.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtPontodeReferenciaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesPONTO_REFERENCIA.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtPontoreferenciaCobrancaExit(Sender: TObject);
begin
  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesPONTO_REFERENCIA_COBRANCA.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtPontoReferenciaEntregaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesPONTO_REFERENCIA_ENTREGA.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.edtRazaoSocialExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
    dmMProvider.cdsParticipantesNOME_RAZAO_SOCIAL.Value := RetirarAcentuacao(sender);

end;

procedure TfrmParticipantes.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                             := COR_PADRAO_TELAS;
  Caption                           := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1);

  dmDBEXMaster.sNomeUsuario         := ParamStr(1);
  dmDBEXMaster.sSenha               := paramstr(2);
  dmDBEXMaster.iIdUsuario           := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial            := StrToInt(ParamStr(4));

  pgcCadastro.ActivePageIndex       := 0;
  pgcEndEntregaCobr.ActivePageIndex := 0;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdUltimaNFEntrada.Columns.Count - 1 do
    grdUltimaNFEntrada.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdUltimaNFsaida.Columns.Count - 1 do
    grdUltimaNFsaida.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdUltimaOCPart.Columns.Count - 1 do
    grdUltimaOCPart.Columns[i].Title.Color := COR_TITULO_GRADE;

  MostrarOcultarAbas(0);

  AbrirTabelas;

  ConfigurarCertificadoNFE(ACBrNFe1,True);

  ConfigurarBuscaCep(ACBrCEP1);

end;

procedure TfrmParticipantes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmParticipantes.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else if (UpperCase(key) = 'S') and (lblMsg.Tag = ord(UsarEnderecosIguais)) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;

    if not InserindoEditando(dmMProvider.cdsParticipantes) then
      dmMProvider.cdsParticipantes.Edit;

    dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value := 1;
    chkEndEntrCobrIgualEndClick(self);
    LimparMSG_ERRO(lblMsg, nil);

  end
  else if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) or (lblMsg.Tag = ord(UsarEnderecosIguais)) then
  begin

    key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO(lblMsg, nil);

  end
  else if (UpperCase(key) = 'S') and (Tag <> 0) then
  begin

    Key := #0;

    AtualizarEnderecoPeloCEP(Tag);

    Tag := 0;

    LimparMSG_ERRO(lblMsg, nil);

  end
  else if (UpperCase(key) = 'N') and (Tag <> 0) then
  begin

    key := #0;
    Tag := 0;
    LimparMSG_ERRO(lblMsg, nil);

  end;



end;

procedure TfrmParticipantes.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsParticipantes.IsEmpty then
  begin

    MostrarOcultarAbas(1);
    pgcCadastro.ActivePageIndex      := 1;
    RelacionarUltimaNFEntrada_Participante;
    RelacionarUltimaNFSaida_Participante;

  end;

end;

procedure TfrmParticipantes.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsParticipantes.IsEmpty then
  begin

    if not odd(dmMProvider.cdsParticipantes.RecNo) then
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

procedure TfrmParticipantes.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
   grdTabelaDblClick(self);

end;

procedure TfrmParticipantes.grdUltimaNFEntradaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsUltimaNFForn.IsEmpty then
  begin

    if not odd(dmMProvider.cdsUltimaNFForn.RecNo) then
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

procedure TfrmParticipantes.grdUltimaNFsaidaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsUltimaNFSaidaPart.IsEmpty then
  begin

    if not odd(dmMProvider.cdsUltimaNFSaidaPart.RecNo) then
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

procedure TfrmParticipantes.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled           := pOpcao;
  grpObservacoes.Enabled        := grpCadastro.Enabled;
  grpEnderecoEntrega.Enabled    := grpCadastro.Enabled;
  grpEnderecoCobranca.Enabled   := grpCadastro.Enabled;
  grpUltimaNFEntrada.Enabled    := grpCadastro.Enabled;
  grpUltimaNFSaida.Enabled      := grpCadastro.Enabled;
  grpUltimaNFCe.Enabled         := grpCadastro.Enabled;
  grpUltimaOrdemCompra.Enabled  := grpCadastro.Enabled;

end;

procedure TfrmParticipantes.imgConsultaCepCobrancaClick(Sender: TObject);
begin

  ActiveControl := nil;

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    Tag := ord(EnderecoCobrancaPorCEP);

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ATUALIZAR_END_POR_CEP;
    Application.ProcessMessages;

  end;

end;

procedure TfrmParticipantes.imgConsultaCepEndClick(Sender: TObject);
begin

  ActiveControl := nil;

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    Tag := ord(EnderecoPorCEP);

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ATUALIZAR_END_POR_CEP;
    Application.ProcessMessages;

  end;

end;

procedure TfrmParticipantes.imgConsultaCEPEndEntregaClick(Sender: TObject);
begin

  ActiveControl := nil;

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    Tag := ord(EnderecoEntregaPorCEP);

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ATUALIZAR_END_POR_CEP;
    Application.ProcessMessages;

  end;

end;

procedure TfrmParticipantes.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsParticipantes.Active then
  begin

    if not  InserindoEditando(dmMProvider.cdsParticipantes) then
    begin

      LimparMSG_ERRO(lblMsg, nil);

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmParticipantes.MostrarOcultarAbas(pOpcao: integer);
var
  i:integer;
begin

  for i := 1 to pgcCadastro.PageCount -1 do
    pgcCadastro.Pages[i].TabVisible := (pOpcao = 1);

end;

procedure TfrmParticipantes.MostrarOcultarEnderecosEntr_Cobr(pOpcao: integer);
begin

  pgcEndEntregaCobr.Pages[1].TabVisible := (pOpcao = 0);
  pgcEndEntregaCobr.Pages[2].TabVisible := (pOpcao = 0);


end;

procedure TfrmParticipantes.rdgTipoPessoaChange(Sender: TObject);
begin

  pgcCadastro.Pages[2].TabVisible := (rdgTipoPessoa.ItemIndex = 1);

end;

procedure TfrmParticipantes.rdgTipoPessoaClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    if (rdgTipoPessoa.ItemIndex = 1) and (Length(trim(dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value)) <= 11)  then
      rdgTipoPessoa.ItemIndex := 0
    else if (rdgTipoPessoa.ItemIndex = 0) and (Length(trim(dmMProvider.cdsParticipantesCNPJ_CPF_CEI.Value)) >= 14 )  then
      rdgTipoPessoa.ItemIndex := 1;

  end;

  pgcCadastro.Pages[2].TabVisible := (rdgTipoPessoa.ItemIndex = 1);

end;

procedure TfrmParticipantes.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  if not InserindoEditando(dmMProvider.cdsParticipantes) then
  begin

    edtConteudoPesquisa.Clear;
    edtConteudoPesquisa.SetFocus;

  end;

end;

procedure TfrmParticipantes.tbsCadastroShow(Sender: TObject);
begin

  if dmMProvider.cdsParticipantes.Active then
  begin

    if not (dmMProvider.cdsParticipantes.IsEmpty) and not InserindoEditando(dmMProvider.cdsParticipantes) then
    begin

      AbrirTabelaEstados(2,dmMProvider.cdsParticipantesESTADO.Value);
      AbrirTabelaEstados(2,dmMProvider.cdsParticipantesESTADO_ENTREGA.Value);
      AbrirTabelaEstados(2,dmMProvider.cdsParticipantesESTADO_COBRANCA.Value);
      AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO.Value, '');

      if dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value = 0 then
      begin

        AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO_ENTREGA.Value,'');
        AbrirTabelaCidades(3,dmMProvider.cdsParticipantesESTADO_COBRANCA.Value,'');

      end;

    end;

  end;

end;

function TfrmParticipantes.ValidarEnderecos: boolean;
begin

  if dmMProvider.cdsParticipantesUSAR_ENDERECOS_IGUAIS.Value = 1 then
    result := true
  else
    Result := (Length(trim((dmMProvider.cdsParticipantesENDERECO_ENTREGA.Value))) > 0) and (Length(trim((dmMProvider.cdsParticipantesCEP_ENTREGA.Value))) > 0)
              and (Length(trim((dmMProvider.cdsParticipantesESTADO_ENTREGA.Value))) > 0) and (dmMProvider.cdsParticipantesCODIGO_MUNICIPIO_ENTREGA.Value > 0)
              and (Length(trim((dmMProvider.cdsParticipantesENDERECO_COBRANCA.Value))) > 0) and (Length(trim((dmMProvider.cdsParticipantesCEP_COBRANCA.Value))) > 0)
              and (Length(trim((dmMProvider.cdsParticipantesESTADO_COBRANCA.Value))) > 0) and (dmMProvider.cdsParticipantesCODIGO_MUNICIPIO_COBRANCA.Value > 0);

end;

procedure TfrmParticipantes.WindowClose1Execute(Sender: TObject);
begin

  Close

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