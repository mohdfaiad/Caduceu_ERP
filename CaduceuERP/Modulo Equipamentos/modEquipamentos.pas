unit modEquipamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdActns, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Imaging.pngimage;
type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmEquipamentos = class(TForm)
    imgNovo: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    imgSalvar: TImage;
    imgExcluir: TImage;
    imgEditar: TImage;
    imgSair: TImage;
    lblF3: TLabel;
    lblF4: TLabel;
    lblF5: TLabel;
    lblF6: TLabel;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    pgcEquipamentos: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tdsCadastro: TTabSheet;
    grpCadastro: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    ActionList1: TActionList;
    actEditar: TAction;
    actDesfazer: TAction;
    WindowClose1: TWindowClose;
    actMinimizar: TAction;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    grpCliente: TGroupBox;
    edtNome_Cliente: TDBEdit;
    lblRSocial: TLabel;
    lblTelefone: TLabel;
    edtDDD_Cliente: TDBEdit;
    edtTelefoneCliente: TDBEdit;
    imgPesquisaCliente: TImage;
    actPesquisa: TAction;
    lblModelo: TLabel;
    lblNumero: TLabel;
    lblOutrosItens: TLabel;
    lblKM: TLabel;
    edtModelo: TDBEdit;
    edtNumero: TDBEdit;
    edtOutrosItens: TDBEdit;
    edtKM: TDBEdit;
    grpObservacoes: TGroupBox;
    memObservacoes: TDBMemo;
    grpGarantia: TGroupBox;
    lblDataCompra: TLabel;
    edtdataCompra: TDBEdit;
    lblRevenda: TLabel;
    lblNumeroNF: TLabel;
    lblNumeroCertificado: TLabel;
    edtRevenda: TDBEdit;
    edtNumeroNF: TDBEdit;
    edtNumeroCertificadoGarantia: TDBEdit;
    grpOs_Relacionadas: TGroupBox;
    imgAgendarManutencao: TImage;
    grdOS: TDBGrid;
    actRastrearOS: TAction;
    actHistoricoOS: TAction;
    imgRastrearOS: TImage;
    imgHistorico: TImage;
    Label1: TLabel;
    edtCodigoProducao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure actPesquisaExecute(Sender: TObject);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actIncluirExecute(Sender: TObject);
    procedure memObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtModeloEnter(Sender: TObject);
    procedure memObservacoesExit(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdOSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure imgAgendarManutencaoClick(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actRastrearOSExecute(Sender: TObject);
    procedure actHistoricoOSExecute(Sender: TObject);
    procedure edtCodigoProducaoExit(Sender: TObject);
  private
    { Private declarations }
    function AbrirTabelaEquipamentos(pOpcao: smallint; pConteudo: string): boolean;
    procedure Tratar_Erro_Conexao(pE: exception);
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
  public
    { Public declarations }
  end;

var
  frmEquipamentos: TfrmEquipamentos;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes, modPesqCliente, modAgenda;

function TfrmEquipamentos.AbrirTabelaEquipamentos(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsEquipamentos.Close;
  dmMProvider.cdsEquipamentos.ProviderName := 'dspEquipamentos';
  dmDBEXMaster.fdqEquipamentos.SQL.Clear;
  dmDBEXMaster.fdqEquipamentos.SQL.Add('SELECT * FROM EQUIPAMENTOS');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Equipamentos(pOpcao,pConteudo);

  dmDBEXMaster.fdqEquipamentos.SQL.Add(sWhere);
  dmDBEXMaster.fdqEquipamentos.SQL.Add('ORDER BY MODELO');

  try

    dmMProvider.cdsEquipamentos.Open;
    dmMProvider.cdsEquipamentos.ProviderName := '';

    if (dmMProvider.cdsEquipamentos.IsEmpty) and (rdpOpcoesPesquisa.ItemIndex < 6) and (pConteudo <> '-1')then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end
    else if (rdpOpcoesPesquisa.ItemIndex = 6) and (dmMProvider.cdsEquipamentos.IsEmpty) then
          
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_RE_CLI_EQUIP + ' - ' + Trim(dmMProvider.cdsClientesRAZAOSOCIAL.Value);
      TocarSomAlerta(ord(SystemHand));

    end;

    dmMProvider.RelacionarOS_Equipamento(dmMProvider.cdsEquipamentosCODIGO_EQUIPAMENTO.Value);
    Result := not dmMProvider.cdsEquipamentos.IsEmpty;

   except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmEquipamentos.actDesfazerExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if dmMProvider.cdsEquipamentos.Active then
    if dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert] then
    begin

      dmMProvider.cdsEquipamentos.Cancel;

      HabilitaDesabilitaControles(False);

      pgcEquipamentos.Pages[1].TabVisible  := false;

      pgcEquipamentos.ActivePageIndex      := 0;

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end;


end;

procedure TfrmEquipamentos.actEditarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if dmMProvider.cdsEquipamentos.Active then
  begin

    if not (dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert]) then
    begin

      pgcEquipamentos.Pages[1].TabVisible  := true;
      pgcEquipamentos.ActivePageIndex      := 1;

      HabilitaDesabilitaControles(True);
      dmMProvider.cdsEquipamentos.Edit;
      edtDescricao.SetFocus;


    end;

  end;

end;

procedure TfrmEquipamentos.actExcluirExecute(Sender: TObject);
begin

  try

    dmDBEXMaster.fdcMaster.StartTransaction;

    dmMSProcedure.fdspEquipamentos.Params[0].Value    := 1;
    dmMSProcedure.fdspEquipamentos.Params[1].Value    := dmMProvider.cdsEquipamentosCODIGO_CLIENTE.Value;
    dmMSProcedure.fdspEquipamentos.Params[2].Value    := dmMProvider.cdsEquipamentosCODIGO_EQUIPAMENTO.Value;
    dmMSProcedure.fdspEquipamentos.Params[3].Value    := dmMProvider.cdsEquipamentosMODELO.Value;
    dmMSProcedure.fdspEquipamentos.Params[4].Value    := dmMProvider.cdsEquipamentosMARCA.Value;
    dmMSProcedure.fdspEquipamentos.Params[5].Value    := dmMProvider.cdsEquipamentosOPERADORA.Value;
    dmMSProcedure.fdspEquipamentos.Params[6].Value    := dmMProvider.cdsEquipamentosNUMERO_SERIE.Value;
    dmMSProcedure.fdspEquipamentos.Params[7].Value    := dmMProvider.cdsEquipamentosETIQ_PATRIMONIO.Value;
    dmMSProcedure.fdspEquipamentos.Params[8].Value    := dmMProvider.cdsEquipamentosOBSERVACOES.Value;
    dmMSProcedure.fdspEquipamentos.Params[9].Value    := dmMProvider.cdsEquipamentosDATA_COMPRA.Value;
    dmMSProcedure.fdspEquipamentos.Params[10].Value   := dmMProvider.cdsEquipamentosREVENDA.Value;
    dmMSProcedure.fdspEquipamentos.Params[11].Value   := dmMProvider.cdsEquipamentosNUMERO_NF.Value;
    dmMSProcedure.fdspEquipamentos.Params[12].Value   := dmMProvider.cdsEquipamentosNUMERO_CERTIFICADO_GARANTIA.Value;
    dmMSProcedure.fdspEquipamentos.Params[13].Value   := Date;
    dmMSProcedure.fdspEquipamentos.Params[14].Value   := Time;
    dmMSProcedure.fdspEquipamentos.Params[15].Value   := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspEquipamentos.Params[16].Value   := pubNomeComputador;
    dmMSProcedure.fdspEquipamentos.Params[17].Value   := '';//RetornarIP;

    dmMSProcedure.fdspEquipamentos.ExecProc;

    dmMProvider.cdsEquipamentos.Delete;

    dmDBEXMaster.fdcMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;

    LimparMSG_ERRO(lblMsg,nil);

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

  HabilitaDesabilitaControles(false);
  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmEquipamentos.actHistoricoOSExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if not dmMProvider.cdsOrdemServico.IsEmpty then
  begin

    if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_OS.rav') then
    begin

      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsOrdemServico;

      dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_OS.rav';
      dmRelatorios.rvpGenesisAC.SelectReport('rptHistoricoEquip',False);
      dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',dmMProvider.cdsFilialRAZAOSOCIAL.Value);
      dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
      dmRelatorios.rvpGenesisAC.SetParam('pModelo',dmMProvider.cdsEquipamentosMODELO.Value);
      dmRelatorios.rvpGenesisAC.SetParam('pMarca',dmMProvider.cdsEquipamentosMARCA.Value);
      dmRelatorios.rvpGenesisAC.SetParam('pOperadora',dmMProvider.cdsEquipamentosOPERADORA.Value);
      dmRelatorios.rvpGenesisAC.SetParam('pSerial',dmMProvider.cdsEquipamentosNUMERO_SERIE.Value);
      dmRelatorios.rvpGenesisAC.Execute;
      dmRelatorios.rvpGenesisAC.Close;

  end
  else
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_OS.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_RE_OS_EQUIP;
    TocarSomAlerta(ord(SystemHand));

  end;

end;

procedure TfrmEquipamentos.actIncluirExecute(Sender: TObject);
begin

  if not (dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert]) then
  begin

    LimparMSG_ERRO(lblMsg,nil);

    try

      edtConteudoPesquisa.Clear;

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      AbrirTabelaEquipamentos(0,'-1');

      pgcEquipamentos.Pages[1].TabVisible  := True;

      HabilitaDesabilitaControles(True);

      pgcEquipamentos.ActivePageIndex      := 1;

      dmMProvider.cdsEquipamentos.Append;

      LimparMSG_ERRO(lblMsg, nil);

      edtCodigoProducao.SetFocus;

    except
      on E: exception do
        Tratar_Erro_Conexao(E);

    end;

  end;

end;

procedure TfrmEquipamentos.actPesquisaExecute(Sender: TObject);
begin

  if dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert] then
  begin

    frmPesquisaCliente      := TfrmPesquisaCliente.Create(self);
    frmPesquisaCliente.Tag  := ord(NPermiteClienteAvulso);

    if frmPesquisaCliente.ShowModal = mrOk then
      dmMProvider.cdsEquipamentosCODIGO_CLIENTE.Value   := dmMProvider.cdsClientesCLIENTE.Value;

    FreeAndNil(frmPesquisaCliente);

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE;
    Application.ProcessMessages;


  end;

end;

procedure TfrmEquipamentos.actRastrearOSExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if not dmMProvider.cdsOrdemServico.IsEmpty then
  begin

    if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_OS.rav') then
    begin

      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsOrdemServico;

      dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_OS.rav';
      dmRelatorios.rvpGenesisAC.SelectReport('rptRastrearOS',False);
      dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',dmMProvider.cdsFilialRAZAOSOCIAL.Value);
      dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
      dmRelatorios.rvpGenesisAC.Execute;
      dmRelatorios.rvpGenesisAC.Close;

  end
  else
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_OS.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_RE_OS_EQUIP;
    TocarSomAlerta(ord(SystemHand));

  end;

end;

procedure TfrmEquipamentos.actSalvarExecute(Sender: TObject);
begin

  if dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert] then
  begin

    try

      dmDBEXMaster.fdcMaster.StartTransaction;

      dmMSProcedure.fdspEquipamentos.Params[0].Value    := 0;
      dmMSProcedure.fdspEquipamentos.Params[1].Value    := dmMProvider.cdsEquipamentosCODIGO_CLIENTE.Value;
      dmMSProcedure.fdspEquipamentos.Params[2].Value    := dmMProvider.cdsEquipamentosCODIGO_EQUIPAMENTO.Value;
      dmMSProcedure.fdspEquipamentos.Params[3].Value    := dmMProvider.cdsEquipamentosMODELO.Value;
      dmMSProcedure.fdspEquipamentos.Params[4].Value    := dmMProvider.cdsEquipamentosMARCA.Value;
      dmMSProcedure.fdspEquipamentos.Params[5].Value    := dmMProvider.cdsEquipamentosOPERADORA.Value;
      dmMSProcedure.fdspEquipamentos.Params[6].Value    := dmMProvider.cdsEquipamentosNUMERO_SERIE.Value;
      dmMSProcedure.fdspEquipamentos.Params[7].Value    := dmMProvider.cdsEquipamentosETIQ_PATRIMONIO.Value;
      dmMSProcedure.fdspEquipamentos.Params[8].Value    := dmMProvider.cdsEquipamentosOBSERVACOES.Value;
      dmMSProcedure.fdspEquipamentos.Params[9].Value    := dmMProvider.cdsEquipamentosDATA_COMPRA.Value;
      dmMSProcedure.fdspEquipamentos.Params[10].Value   := dmMProvider.cdsEquipamentosREVENDA.Value;
      dmMSProcedure.fdspEquipamentos.Params[11].Value   := dmMProvider.cdsEquipamentosNUMERO_NF.Value;
      dmMSProcedure.fdspEquipamentos.Params[12].Value   := dmMProvider.cdsEquipamentosNUMERO_CERTIFICADO_GARANTIA.Value;
      dmMSProcedure.fdspEquipamentos.Params[13].Value   := Date;
      dmMSProcedure.fdspEquipamentos.Params[14].Value   := Time;
      dmMSProcedure.fdspEquipamentos.Params[15].Value   := dmDBEXMaster.iIdUsuario;
      dmMSProcedure.fdspEquipamentos.Params[16].Value   := pubNomeComputador;
      dmMSProcedure.fdspEquipamentos.Params[17].Value   := '';//RetornarIP;
      dmMSProcedure.fdspEquipamentos.Params[18].Value   := dmMProvider.cdsEquipamentosCODIGO_PRODUCAO.Value;
      dmMSProcedure.fdspEquipamentos.ExecProc;

      if dmMSProcedure.fdspEquipamentos.Params[19].Value > 0 then
        dmMProvider.cdsEquipamentosCODIGO_EQUIPAMENTO.Value := dmMSProcedure.fdspEquipamentos.Params[19].Value;

      dmMProvider.cdsEquipamentos.Post;

      dmDBEXMaster.fdcMaster.Commit;
      dmDBEXMaster.fdcMaster.Close;;

      LimparMSG_ERRO(lblMsg,nil);

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

  end;

  HabilitaDesabilitaControles(false);
  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;


end;

procedure TfrmEquipamentos.edtCodigoProducaoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsEquipamentos) then
  begin

    if (dmMProvider.cdsEquipamentosCODIGO_PRODUCAO.Value > 0) and (Length(trim(dmMProvider.cdsEquipamentosMODELO.Value)) <= 0)then
    begin

      dmMProvider.cdsProducao.Close;
      dmMProvider.cdsProducao.ProviderName := 'dspProducao';

      dmDBEXMaster.fdqProducao.SQL.Clear;
      dmDBEXMaster.fdqProducao.SQL.Add('select * from producao');
      dmDBEXMaster.fdqProducao.SQL.Add('where producao = ' + IntToStr(dmMProvider.cdsEquipamentosCODIGO_PRODUCAO.Value));

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      dmMProvider.cdsProducao.Open;
      dmMProvider.cdsProducao.ProviderName := '';

      LimparMSG_ERRO(lblMsg, nil);

      if dmMProvider.cdsProducao.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + IntToStr(dmMProvider.cdsEquipamentosCODIGO_PRODUCAO.Value);
        TocarSomAlerta(ord(SystemHand));
        edtCodigoProducao.SetFocus;

      end
      else
      begin

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select descricao from produto');;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where produto = ' + InttoStr(dmMProvider.cdsProducaoPRODUTO.Value));;
        dmDBEXMaster.fdqMasterPesquisa.Open;

        dmMProvider.cdsEquipamentosMODELO.Value := dmDBEXMaster.fdqMasterPesquisa.FieldByName('DESCRICAO').AsString;
        dmDBEXMaster.fdqMasterPesquisa.Close;

      end;

    end;

  end;

end;

procedure TfrmEquipamentos.edtConteudoPesquisaEnter(Sender: TObject);
begin

   pgcEquipamentos.Pages[1].TabVisible := false;
   MudarCorEdit(Sender);

end;

procedure TfrmEquipamentos.edtConteudoPesquisaExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
    Application.ProcessMessages;

    if AbrirTabelaEquipamentos(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
    begin

      LimparMSG_ERRO(lblMsg,nil);
      grdTabela.SetFocus;

    end
    else
      edtConteudoPesquisa.SetFocus;;

    edtConteudoPesquisa.Clear;

  end;

  MudarCorEdit(Sender);

end;

procedure TfrmEquipamentos.edtConteudoPesquisaKeyDown(Sender: TObject;
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

procedure TfrmEquipamentos.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmEquipamentos.edtDescricaoEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEquipamentos.edtDescricaoExit(Sender: TObject);
begin

  if dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert] then
    dmMProvider.cdsEquipamentosMODELO.Value := RetirarAcentuacao(edtDescricao);

   MudarCorEdit(Sender);

end;

procedure TfrmEquipamentos.edtModeloEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEquipamentos.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                           := COR_PADRAO_TELAS;
  Caption                         := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  dmDBEXMaster.sNomeUsuario       := ParamStr(1);
  dmDBEXMaster.sSenha             := paramstr(2);
  dmDBEXMaster.iIdUsuario         := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial          := StrToInt(ParamStr(4));

  pgcEquipamentos.Pages[1].TabVisible  := false;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  dmMProvider.AbrirTabelaFilial;

end;

procedure TfrmEquipamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmEquipamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO(lblMsg,nil);

  end;

end;

procedure TfrmEquipamentos.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsEquipamentos.IsEmpty then
  begin

    dmMProvider.RelacionarOS_Equipamento(dmMProvider.cdsEquipamentosCODIGO_EQUIPAMENTO.Value);
    pgcEquipamentos.Pages[1].TabVisible  := True;
    pgcEquipamentos.ActivePageIndex      := 1;

  end;

end;

procedure TfrmEquipamentos.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsEquipamentos.IsEmpty then
  begin

    if not odd(dmMProvider.cdsEquipamentos.RecNo) then
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

procedure TfrmEquipamentos.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(Self);

end;

procedure TfrmEquipamentos.grdOSDrawColumnCell(Sender: TObject;  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R : TRect;
begin

  R :=  Rect;

  Dec(R.Bottom,2);

  if Column.Field = dmMProvider.cdsOrdemServico.FieldByName('DEFEITO') then
  begin

    if not (gdSelected in State) then
      grdOS.Canvas.FillRect(Rect);

    grdOS.Canvas.TextRect(R,R.Left,R.Top, dmMProvider.cdsOrdemServico.FieldByName('DEFEITO').AsString);

  end;

  if Column.Field = dmMProvider.cdsOrdemServico.FieldByName('LAUDO') then
  begin

    if not (gdSelected in State) then
      grdOS.Canvas.FillRect(Rect);

    grdOS.Canvas.TextRect(R,R.Left,R.Top, dmMProvider.cdsOrdemServico.FieldByName('LAUDO').AsString);

  end;

end;

procedure TfrmEquipamentos.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled := pOpcao;

end;

procedure TfrmEquipamentos.imgAgendarManutencaoClick(Sender: TObject);
begin

  try

    if not dmMProvider.cdsEquipamentos.IsEmpty then
    begin

      frmAgendaCompromisso := TfrmAgendaCompromisso.Create(self);
      if frmAgendaCompromisso.ShowModal = mrOk then
      begin

        dmDBEXMaster.fdcMaster.StartTransaction;

        dmMSProcedure.fdspAgenda.Params[0].Value     := 0;
        dmMSProcedure.fdspAgenda.Params[1].Value     := dmMProvider.cdsAgendaAGENDA.Value;
        dmMSProcedure.fdspAgenda.Params[2].Value     := dmMProvider.cdsAgendaCOMPROMISSO.Value;
        dmMSProcedure.fdspAgenda.Params[3].Value     := dmMProvider.cdsAgendaDATA_COMPROMISSO.Value;
        dmMSProcedure.fdspAgenda.Params[4].Value     := dmMProvider.cdsAgendaHORA_COMPROMISSO.AsString;
        dmMSProcedure.fdspAgenda.Params[5].Value     := dmMProvider.cdsAgendaALERTA.Value;
        dmMSProcedure.fdspAgenda.Params[6].Value     := dmMProvider.cdsAgendaFUNCIONARIO.Value;
        dmMSProcedure.fdspAgenda.Params[7].Value     := dmMProvider.cdsAgendaREALIZADO.Value;
        dmMSProcedure.fdspAgenda.ExecProc;

        if dmMProvider.cdsAgenda.State in [dsEdit, dsInsert] then
        begin

          if dmMSProcedure.fdspAgenda.Params[8].Value > 0 then
            dmMProvider.cdsAgendaAGENDA.Value := dmMSProcedure.fdspAgenda.Params[8].Value

        end;

        dmDBEXMaster.fdcMaster.CommitRetaining;

      end;

      FreeAndNil(frmAgendaCompromisso);

    end;
  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);

      dmDBEXMaster.fdcMaster.RollbackRetaining;

      FreeAndNil(frmAgendaCompromisso);

    end;

  end;

end;

procedure TfrmEquipamentos.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsEquipamentos.Active then
  begin

    if not (dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO(lblMsg,nil);

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmEquipamentos.memObservacoesExit(Sender: TObject);
begin

  if dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert] then
    dmMProvider.cdsEquipamentosOBSERVACOES.Value := RetirarAcentuacao(memObservacoes);

   MudarCorEdit(Sender);

end;

procedure TfrmEquipamentos.memObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin

  Key := UpCase(Key);

end;

procedure TfrmEquipamentos.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  if not (dmMProvider.cdsEquipamentos.State in [dsEdit, dsInsert]) then
  begin

    if rdpOpcoesPesquisa.ItemIndex < 6 then
    begin

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end
    else if rdpOpcoesPesquisa.ItemIndex = 6 then
    begin


      frmPesquisaCliente := TfrmPesquisaCliente.Create(self);

      if frmPesquisaCliente.ShowModal = mrOk then
      begin

        if AbrirTabelaEquipamentos(rdpOpcoesPesquisa.ItemIndex, IntToStr(dmMProvider.cdsClientesCLIENTE.Value)) then
          grdTabela.SetFocus;

      end;

      FreeAndNil(frmPesquisaCliente);

    end;

  end;
end;

procedure TfrmEquipamentos.Tratar_Erro_Conexao(pE: exception);
var
  sChave_Extrang:string;
begin

  if Pos('Unable',pE.Message) > 0then
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_CONEXAO_BANCO
  else if Pos('FOREIGN',pE.Message) > 0then
  begin

    sChave_Extrang := Trim(Copy(pE.Message,pos('ON TABLE',Uppercase(pE.Message))+ 10,Length(pE.Message)));

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ERRO_CHAVE_ESTRANGEIRA
                      + Copy(sChave_Extrang,1,pos('"',sChave_Extrang)-1);

  end
  else if Pos('conversion error',pE.Message) > 0then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONTEUDO_INVALIDO + edtConteudoPesquisa.Text;

  end
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + pE.Message;

  TocarSomAlerta(ord(SystemHand));


end;

procedure TfrmEquipamentos.WindowClose1Execute(Sender: TObject);
begin

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

end.
