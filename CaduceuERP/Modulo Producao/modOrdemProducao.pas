unit modOrdemProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, DateUtils, JvExStdCtrls, JvEdit,
  JvValidateEdit, Data.DB;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmModOrdemProducao = class(TForm)
    imgNovo: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    imgSalvar: TImage;
    imgExcluir: TImage;
    imgEditar: TImage;
    lblF3: TLabel;
    lblF4: TLabel;
    lblF5: TLabel;
    lblF6: TLabel;
    imgOr�amento: TImage;
    imgSair: TImage;
    ActionList1: TActionList;
    actEditar: TAction;
    actDesfazer: TAction;
    WindowClose1: TWindowClose;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actPesquisa: TAction;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    pgcOrdemProducao: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tdsCadastro: TTabSheet;
    grpCadastro: TGroupBox;
    grpDetalhes: TGroupBox;
    grpOrdemProducao: TGroupBox;
    grpDataInicio: TGroupBox;
    grpDataPrevista: TGroupBox;
    grpdataTermino: TGroupBox;
    edtOrdemProducao: TDBEdit;
    dtpDataInicio: TJvDBDateTimePicker;
    dtpDataPrevista: TJvDBDateTimePicker;
    dtpDataTermino: TJvDBDateTimePicker;
    grpSituacao: TGroupBox;
    grpTipoProducao: TGroupBox;
    grpResponsavel: TGroupBox;
    grpProdutoFinal: TGroupBox;
    grpEstiqueAtual: TGroupBox;
    grpObservacoes: TGroupBox;
    grpMateriaPrima: TGroupBox;
    grpQuantidadeDesejada: TGroupBox;
    grditemOrdemProducao: TDBGrid;
    grpProdutoInsumo: TGroupBox;
    grpQuantidadeInsumo: TGroupBox;
    edtProdutoInsumo: TEdit;
    imgPesquiosarInsumo: TImage;
    edtDescricaoInsumo: TEdit;
    edtUnidade: TEdit;
    grpEstoqueInsumo: TGroupBox;
    edtSaldoLoja: TEdit;
    memObservacao: TDBMemo;
    edtQuantidadeInsumo: TJvValidateEdit;
    edtSituacaoProducao: TDBEdit;
    edtEstoqueAtualProdFinal: TDBEdit;
    cboResponsavel: TDBLookupComboBox;
    edtProdutoFinal: TDBEdit;
    edtDescricaoProdutoFinal: TDBEdit;
    edtUnidadeProdutoFinal: TDBEdit;
    edtRendimento: TDBEdit;
    imgPesqProdutoFinal: TImage;
    lblRendimento: TLabel;
    lblQuantidadeProduzida: TLabel;
    edtQuantidadeProduzida: TDBEdit;
    edtQuantidadeDesejada: TDBEdit;
    edtTipoProducao: TDBEdit;
    grpPerdaInsumo: TGroupBox;
    edtPerdaInsumo: TJvValidateEdit;
    actExcluirItemOrdem: TAction;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure dtpDataInicioEnter(Sender: TObject);
    procedure dtpDataInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtpDataInicioKeyPress(Sender: TObject; var Key: Char);
    procedure imgPesqProdutoFinalClick(Sender: TObject);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeDesejadaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtProdutoFinalExit(Sender: TObject);
    procedure edtProdutoInsumoExit(Sender: TObject);
    procedure edtOrdemProducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure tdsCadastroShow(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtQuantidadeDesejadaExit(Sender: TObject);
    procedure imgPesquiosarInsumoClick(Sender: TObject);
    procedure edtQuantidadeInsumoExit(Sender: TObject);
    procedure edtPerdaInsumoExit(Sender: TObject);
    procedure cboResponsavelExit(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grditemOrdemProducaoDblClick(Sender: TObject);
    procedure grditemOrdemProducaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grditemOrdemProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExcluirItemOrdemExecute(Sender: TObject);
    procedure imgOr�amentoClick(Sender: TObject);
  private
    { Private declarations }
    function AbrirTabelaOrdemProducao(pOpcao: smallint; pConteudo: string): boolean;
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure LimparMSG_ERRO;
    procedure AbrirTabelaFuncioanario;
    procedure CarregarFichaTecnica;
    function ValidarProdutoFinal(pProduto, pFilial, pOrdemProducao:integer): boolean;
    function Man_Tab_OrdemProducao(pOpcao, pSituacao: smallint): boolean;
    function Man_Tab_ItemOrdemProducaoFC(pOpcao: smallint): boolean;
    function Man_Tab_ItemOrdemProducao(pOpcao: smallint): boolean;
    procedure AtualizarSaldoProduto(pOperacao:smallint);
    procedure ResetarCampos;

  public
    { Public declarations }
  end;

var
  frmModOrdemProducao: TfrmModOrdemProducao;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, datamZeus,
  uConstantes_Padrao, uFuncoes, modPesquisaProduto, modPesquisaFuncionario,
  modResultadoProducao, dataMRelatorios;

procedure TfrmModOrdemProducao.AbrirTabelaFuncioanario;
begin

  dmMProvider.cdsFuncionarios.Close;
  dmMProvider.cdsFuncionarios.ProviderName := 'dspFuncionarios';

  dmDBEXMaster.fdqFuncionarios.SQL.Clear;
  dmDBEXMaster.fdqFuncionarios.SQL.Add('select * from funcionario');
  dmDBEXMaster.fdqFuncionarios.SQL.Add('where ativo = 1');
  dmDBEXMaster.fdqFuncionarios.SQL.Add('order by nome');

  dmMProvider.cdsFuncionarios.Open;
  dmMProvider.cdsFuncionarios.ProviderName := '';

end;

function TfrmModOrdemProducao.AbrirTabelaOrdemProducao(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsOrdemProducao.Close;
  dmMProvider.cdsOrdemProducao.ProviderName := 'dspOrdemProducao';

  dmDBEXMaster.fdqOrdemProducao.SQL.Clear;
  dmDBEXMaster.fdqOrdemProducao.SQL.Add('select op.*, pro.descricao, pro.unidade, pf.loja, pf.saldo_almoxarifado from ordem_de_producao op');
  dmDBEXMaster.fdqOrdemProducao.SQL.Add('join produto pro');
  dmDBEXMaster.fdqOrdemProducao.SQL.Add('on(pro.produto = op.produto_final)');
  dmDBEXMaster.fdqOrdemProducao.SQL.Add('join produtofilial pf');
  dmDBEXMaster.fdqOrdemProducao.SQL.Add('on(pf.produto = op.produto_final)');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Ordem_Producao(pOpcao,pConteudo);

  dmDBEXMaster.fdqOrdemProducao.SQL.Add(sWhere);

  dmDBEXMaster.fdqOrdemProducao.SQL.Add('order by pro.descricao');

  try

    dmMProvider.cdsOrdemProducao.Open;
    dmMProvider.cdsOrdemProducao.ProviderName := '';

    if (dmMProvider.cdsOrdemProducao.IsEmpty) and (pConteudo <> '-1') then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsOrdemProducao.IsEmpty;

   except
    on E: exception do
      lblMsg.Caption := Tratar_Erro_Conexao(E);

  end;


end;

procedure TfrmModOrdemProducao.actDesfazerExecute(Sender: TObject);
begin

  if dmMProvider.cdsOrdemProducao.State in [dsEdit] then
    dmMProvider.cdsOrdemProducao.Cancel
  else if dmMProvider.cdsOrdemProducao.State in [dsInsert] then
  begin

    Man_Tab_OrdemProducao(1,0);
    dmMProvider.cdsOrdemProducao.Cancel;

  end;

  ResetarCampos;
  HabilitaDesabilitaControles(False);

end;

procedure TfrmModOrdemProducao.actEditarExecute(Sender: TObject);
begin

  if not dmMProvider.cdsOrdemProducao.IsEmpty then
  begin

    if not dmMProvider.cdsItemOrdemProducao.IsEmpty then
    begin

      if Man_Tab_OrdemProducao(0,0) then
      begin

        //estorna saldo produto
        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
        Application.ProcessMessages;

        AtualizarSaldoProduto(0);

        LimparMSG_ERRO;

      end;

      dmMProvider.cdsOrdemProducao.Edit;
      dmMProvider.cdsOrdemProducaoSITUACAO.Value := 0;
      dmMProvider.cdsOrdemProducao.Post;

      HabilitaDesabilitaControles(True);
      pgcOrdemProducao.ActivePageIndex := 1;
      dtpDataInicio.SetFocus;
      dmMProvider.cdsOrdemProducao.Edit;

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ITEM_PRODUCAO_VAZIO;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModOrdemProducao.actExcluirExecute(Sender: TObject);
begin

  try

    if dmMProvider.cdsOrdemProducao.Active then
    begin

      if not InserindoEditando(dmMProvider.cdsOrdemProducao) then
      begin

        LimparMSG_ERRO;

        Man_Tab_OrdemProducao(1,0);

        dmMProvider.cdsOrdemProducao.Close;
        dmMProvider.cdsItemOrdemProducao.Close;

        edtConteudoPesquisa.Clear;

        edtConteudoPesquisa.SetFocus;

        HabilitaDesabilitaControles(false);

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

procedure TfrmModOrdemProducao.actExcluirItemOrdemExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  Man_Tab_ItemOrdemProducaoFC(1);

  dmMProvider.cdsOrdemProducao.Edit;
  dmMProvider.cdsOrdemProducao.Post;

  dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);


end;

procedure TfrmModOrdemProducao.actIncluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  try

    if not InserindoEditando(dmMProvider.cdsOrdemProducao) then
    begin

      edtConteudoPesquisa.Clear;

      if not AbrirTabelaOrdemProducao(0,'-1') then
      begin

        LimparMSG_ERRO;

        HabilitaDesabilitaControles(True);

        pgcOrdemProducao.ActivePageIndex      := 1;

        dmMProvider.cdsOrdemProducao.Append;

        dtpDataInicio.SetFocus;

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

procedure TfrmModOrdemProducao.actSalvarExecute(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
  begin

    if not dmMProvider.cdsItemOrdemProducao.IsEmpty then
    begin

      frmResultadoProcucao := TfrmResultadoProcucao.Create(self);
      frmResultadoProcucao.ShowModal;

      if Man_Tab_OrdemProducao(0,1) then
      begin

        dmMProvider.cdsOrdemProducaoSITUACAO.Value := 1;
        dmMProvider.cdsOrdemProducao.Post;

        AtualizarSaldoProduto(0);

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
        Application.ProcessMessages;

        dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);
        edtConteudoPesquisa.SetFocus;

        LimparMSG_ERRO;

      end;

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ITEM_PRODUCAO_VAZIO;
      Application.ProcessMessages;

    end;

  end;

  HabilitaDesabilitaControles(False);

end;

procedure TfrmModOrdemProducao.AtualizarSaldoProduto(pOperacao: smallint);
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspAtualizarSaldoProduto.Params[0].Value    := 8; //op��o - ordem produ��o (OP)
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[1].Value    := 0; //local movimento - indiferente para OP
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[2].Value    := pOperacao;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[3].Value    := dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[4].Value    := '';//barras - indiferente para OP
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[5].Value    := dmMProvider.cdsOrdemProducaoQUANTIDADE.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[6].Value    := 0; //produto - indiferente para OP
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[7].Value    := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[8].Value    := ''; //modelo - indiferente para OP
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[9].Value    := Date; //data - indiferente para OP
    dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;
end;



procedure TfrmModOrdemProducao.CarregarFichaTecnica;
begin

  dmMProvider.cdsProducao.Close;
  dmMProvider.cdsProducao.ProviderName := 'dspProducao';

  dmDBEXMaster.fdqProducao.SQL.Clear;
  dmDBEXMaster.fdqProducao.SQL.Add('select * from producao');
  dmDBEXMaster.fdqProducao.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value));

  dmMProvider.cdsProducao.Open;
  dmMProvider.cdsProducao.ProviderName := '';

  if not dmMProvider.cdsProducao.IsEmpty then
  begin

    dmMProvider.cdsItemProducao.Close;
    dmMProvider.cdsItemProducao.ProviderName := 'dspItemProducao';

    dmDBEXMaster.fdqItemProducao.SQL.Clear;
    dmDBEXMaster.fdqItemProducao.SQL.Add('select *  from itemproducao');
    dmDBEXMaster.fdqItemProducao.SQL.Add('where producao = ' + IntToStr(dmMProvider.cdsProducaoPRODUCAO.Value));
    dmDBEXMaster.fdqItemProducao.SQL.Add('order by itemproducao');

    dmMProvider.cdsItemProducao.Open;
    dmMProvider.cdsItemProducao.ProviderName := '';

  end;

end;

procedure TfrmModOrdemProducao.cboResponsavelExit(Sender: TObject);
begin

  if cboResponsavel.KeyValue < 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    cboResponsavel.SetFocus;

  end;

end;

procedure TfrmModOrdemProducao.dtpDataInicioEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmModOrdemProducao.dtpDataInicioKeyDown(Sender: TObject;
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

procedure TfrmModOrdemProducao.dtpDataInicioKeyPress(Sender: TObject;
  var Key: Char);
begin

{  if Key = FormatSettings.DecimalSeparator then
    Key := ',';
}
  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModOrdemProducao.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmModOrdemProducao.edtConteudoPesquisaExit(Sender: TObject);
begin

  if length(Trim(edtConteudoPesquisa.Text)) > 0  then
  begin

    case rdpOpcoesPesquisa.ItemIndex of
          0:begin

            end;
      1,2,3:begin

              try

                edtConteudoPesquisa.Text := FormatDateTime('dd/mm/yyyy',StrTodate(Trim(edtConteudoPesquisa.Text)));

              except

                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DATA_INVALIDA + ' : ' + edtConteudoPesquisa.Text;
                  TocarSomAlerta(0);
                  Application.ProcessMessages;
                  exit

                end;

              end;

            end;
    end;

    if AbrirTabelaOrdemProducao(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
    begin

      edtConteudoPesquisa.Clear;
      pgcOrdemProducao.ActivePageIndex := 0;
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

procedure TfrmModOrdemProducao.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModOrdemProducao.edtOrdemProducaoKeyDown(Sender: TObject;
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

procedure TfrmModOrdemProducao.edtPerdaInsumoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if (not dmMProvider.cdsOrdemProducao.IsEmpty) and (Length(Trim(edtProdutoInsumo.Text)) > 0) then
  begin

    if Man_Tab_ItemOrdemProducao(0) then
    begin

      dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);
      dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);
      ResetarCampos;
      edtProdutoInsumo.SetFocus;

    end;

  end;

end;

procedure TfrmModOrdemProducao.edtProdutoFinalExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
  begin

    if dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value > 0 then
    begin

      if not ValidarProdutoFinal(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value, dmDBEXMaster.iIdFilial, dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PRODUTO_PRODUCAO_EXISTE + ' - Cod. ' + IntToStr(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value);
        Application.ProcessMessages;

        AbrirTabelaOrdemProducao(0, IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ordem_de_producao').AsInteger));
        dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);

        dmDBEXMaster.fdqMasterPesquisa.Close;
        CarregarFichaTecnica;
        edtQuantidadeDesejada.SetFocus;
        dmMProvider.cdsOrdemProducao.edit;

      end
      else
      begin

        //verifica se o produto est� relacionado a uma ficha tecnica
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select * from producao');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value));
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          dmDBEXMaster.fdqMasterPesquisa.Close;
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_FICHA_TECNICA_N_EXISTE;
          Application.ProcessMessages;
          edtProdutoFinal.SetFocus;

        end //verifica se o campo rendimento foi informado
        else if dmDBEXMaster.fdqMasterPesquisa.FieldByName('RENDIMENTO').AsCurrency <= 0 then
        begin

          dmDBEXMaster.fdqMasterPesquisa.Close;
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PRODUTO_PRODUCAO_SEM_REND;
          Application.ProcessMessages;
          edtProdutoFinal.SetFocus;

        end
        else
        begin

          dmMProvider.cdsPesqProdutos.Close;
          dmMProvider.cdsPesqProdutos.ProviderName  := 'dspPesqProdutos';

          dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.*, UND.PERMITE_VENDA_FRACIONADA  as FRACAO FROM PRODUTO PRO');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = '+ IntToStr(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value));

          dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial = '+ InttoStr(dmDBEXMaster.iIdFilial));

          dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pro.produto in (select produto from producao)');

          dmMProvider.cdsPesqProdutos.Open;
          dmMProvider.cdsPesqProdutos.ProviderName := '';

          if dmMProvider.cdsPesqProdutos.IsEmpty then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - Cod. ' + IntToStr(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value);
            Application.ProcessMessages;

          end
          else
          begin

            CarregarFichaTecnica;

            dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value := dmMProvider.cdsPesqProdutosPRODUTO.Value;
            dmMProvider.cdsOrdemProducaoESTOQUE_ATUAL.Value := dmMProvider.cdsPesqProdutosLOJA.Value;
            dmMProvider.cdsOrdemProducaoRENDIMENTO.Value    := dmDBEXMaster.fdqMasterPesquisa.FieldByName('RENDIMENTO').AsCurrency;

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmModOrdemProducao.edtProdutoInsumoExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if (not dmMProvider.cdsOrdemProducao.IsEmpty) and (Length(Trim(edtProdutoInsumo.Text)) > 0) then
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
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = '+ Trim(edtProdutoInsumo.Text));
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial= '+ InttoStr(dmDBEXMaster.iIdFilial));
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pro.tipo_item in (0,1,2,3,4,5,10)');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pro.visibilidade = 1');
    dmDBEXMaster.fdqPesqProdutos.SQL.Add('order by pro.descricao');

    dmMProvider.cdsPesqProdutos.Open;
    dmMProvider.cdsPesqProdutos.ProviderName := '';

    if dmMProvider.cdsPesqProdutos.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - Cod. ' + edtProdutoInsumo.Text;
      Application.ProcessMessages;
      edtProdutoInsumo.SetFocus;

    end
    else
    begin

      edtDescricaoInsumo.Text   := dmMProvider.cdsPesqProdutosDESCRICAO.Value;
      edtUnidade.Text           := dmMProvider.cdsPesqProdutosUNIDADE.Value;
      edtSaldoLoja.Text         := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosLOJA.Value);
      edtQuantidadeInsumo.Value := 1;

      edtQuantidadeInsumo.SetFocus;

    end;

  end;

end;

procedure TfrmModOrdemProducao.edtQuantidadeDesejadaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
  begin

    if dmMProvider.cdsOrdemProducaoFUNCIONARIO_RESPONSAVEL.Value <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      cboResponsavel.SetFocus;

    end
    else
    begin

      if dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value > 0 then
      begin

        if Man_Tab_OrdemProducao(0,0) then
        begin

          dmMProvider.cdsItemProducao.First;

          while not dmMProvider.cdsItemProducao.Eof do
          begin

             { codigo para incluri insumo/ficha tecnica}
            if Man_Tab_ItemOrdemProducaoFC(0) then
              dmMProvider.cdsItemProducao.Next
            else
              exit;

          end;

          dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);

          dmMProvider.cdsItemOrdemProducao.First;

        end;

      end;

    end;

  end;

end;

procedure TfrmModOrdemProducao.edtQuantidadeDesejadaKeyPress(Sender: TObject;
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

procedure TfrmModOrdemProducao.edtQuantidadeInsumoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO;

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
  begin

    if not Validar_Venda_Fracionada(dmMProvider.cdsPesqProdutosFRACAO.Value, edtQuantidadeInsumo.Value) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VENDA_FRACIONADA_NP + edtDescricaoInsumo.Text;
      Application.ProcessMessages;
      edtQuantidadeInsumo.SetFocus;

    end;

  end;

end;

procedure TfrmModOrdemProducao.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                               := COR_PADRAO_TELAS;
  Caption                             := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  dmDBEXMaster.sNomeUsuario           := ParamStr(1);
  dmDBEXMaster.sSenha                 := paramstr(2);
  dmDBEXMaster.iIdUsuario             := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial              := StrToInt(ParamStr(4));

//  pgcOrdemProducao.Pages[1].TabVisible  := false;
  pgcOrdemProducao.ActivePageIndex      := 0;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grditemOrdemProducao.Columns.Count - 1 do
    grditemOrdemProducao.Columns[i].Title.Color := COR_TITULO_GRADE;

  dtpDataInicio.Date    := Date;
  dtpDataPrevista.Date  := dtpDataInicio.Date;
  dtpDataTermino.Date   := dtpDataInicio.Date;

  AbrirTabelaFuncioanario;

end;

procedure TfrmModOrdemProducao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmModOrdemProducao.FormKeyPress(Sender: TObject; var Key: Char);
begin

  try

    if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirItemProducao)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExcluirItemOrdemExecute(self);

    end
    else   if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
    begin

      Key         := #0;
      lblMsg.Tag  := 0;
      actExcluirExecute(self);

    end

    else if (UpperCase(Key) = 'N') AND (lblMsg.Tag <> ord(nulo)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      LimparMSG_ERRO;

    end;
  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

end;

procedure TfrmModOrdemProducao.grditemOrdemProducaoDblClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
  begin

    if not dmMProvider.cdsItemOrdemProducao.IsEmpty then
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
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = '+ InttoStr(dmMProvider.cdsItemOrdemProducaoPRODUTO_INSUMO.Value));
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial= '+ InttoStr(dmDBEXMaster.iIdFilial));
      dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pro.visibilidade = 1');

      dmMProvider.cdsPesqProdutos.Open;
      dmMProvider.cdsPesqProdutos.ProviderName := '';


      dmMProvider.cdsItemOrdemProducao.Edit;

      edtProdutoInsumo.Text       := InttoStr(dmMProvider.cdsItemOrdemProducaoPRODUTO_INSUMO.Value);
      edtDescricaoInsumo.Text     := dmMProvider.cdsItemOrdemProducaoDESCRICAO_PRODUTO.Value;
      edtQuantidadeInsumo.Value   := dmMProvider.cdsItemOrdemProducaoQUANTIDADE_PREVISTA.Value;
      edtPerdaInsumo.Value        := dmMProvider.cdsItemOrdemProducaoPERDA.Value;
      edtQuantidadeInsumo.SetFocus;

    end;

  end;

end;

procedure TfrmModOrdemProducao.grditemOrdemProducaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if not dmMProvider.cdsItemOrdemProducao.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItemOrdemProducao.RecNo) then
    begin

      grditemOrdemProducao.Canvas.Font.Color   := clBlack;
      grditemOrdemProducao.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grditemOrdemProducao.Canvas.Font.Color   := clBlack;
      grditemOrdemProducao.Canvas.Brush.Color  := clWhite;

    end;

    grditemOrdemProducao.Canvas.FillRect(Rect);
    grditemOrdemProducao.DefaultDrawDataCell(Rect, Column.Field, State);

  end;


end;

procedure TfrmModOrdemProducao.grditemOrdemProducaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        LimparMSG_ERRO;

        if (not dmMProvider.cdsItemOrdemProducao.IsEmpty) and (grpCadastro.Enabled) then
        begin

          lblMsg.Tag      := ord(ExcluirItemOrdemProducao);
          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

        end;

      end;

  end;


end;

procedure TfrmModOrdemProducao.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsOrdemProducao.IsEmpty then
    pgcOrdemProducao.ActivePageIndex      := 1;

end;

procedure TfrmModOrdemProducao.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsOrdemProducao.IsEmpty then
  begin

    if not odd(dmMProvider.cdsOrdemProducao.RecNo) then
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

procedure TfrmModOrdemProducao.grdTabelaKeyPress(Sender: TObject;  var Key: Char);
begin

  if key = #13 then
   grdTabelaDblClick(self);

end;

procedure TfrmModOrdemProducao.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled := pOpcao;

end;

procedure TfrmModOrdemProducao.imgOr�amentoClick(Sender: TObject);
begin

  if NOT dmMProvider.cdsOrdemProducao.IsEmpty then
  begin

    if FileExists(ExtractFilePath(Application.ExeName) + 'Rav\Relatorios_Diversos.rav') then
    begin

      if AbrirTabelaOrdemProducao(0,IntToStr(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value)) then
        dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);

      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 160;
      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsOrdemProducao;

      dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName) + 'Rav\Relatorios_Diversos.rav';
      dmRelatorios.rvpGenesisAC.SelectReport('rptOrdemProducao',true);
      dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
      dmRelatorios.rvpGenesisAC.SetParam('pNomeCliente',cboResponsavel.Text);
      dmRelatorios.rvpGenesisAC.Execute;
      dmRelatorios.rvpGenesisAC.Close;

    end
    else
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
                  + ExtractFilePath(Application.ExeName) + 'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

  end;

end;

procedure TfrmModOrdemProducao.imgPesqProdutoFinalClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
  begin

    frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
    frmPesquisaProduto.Tag  := ord(PesquisaProdFinal);

    if frmPesquisaProduto.ShowModal = mrOk then
    begin

      if not ValidarProdutoFinal(dmMProvider.cdsPesqProdutosPRODUTO.Value, dmDBEXMaster.iIdFilial, dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PRODUTO_PRODUCAO_EXISTE + ' - Cod. ' + IntToStr(dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value);
        Application.ProcessMessages;

        AbrirTabelaOrdemProducao(0, IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ordem_de_producao').AsInteger));
        dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);

        dmDBEXMaster.fdqMasterPesquisa.Close;
        CarregarFichaTecnica;
        edtQuantidadeDesejada.SetFocus;
        dmMProvider.cdsOrdemProducao.edit;

      end
      else
      begin

        //verifica se o produto est� relacionado a uma ficha tecnica
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select * from producao');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value));
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          dmDBEXMaster.fdqMasterPesquisa.Close;
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_FICHA_TECNICA_N_EXISTE;
          Application.ProcessMessages;
          edtProdutoFinal.SetFocus;

        end //verifica se o campo rendimento foi informado
        else if dmDBEXMaster.fdqMasterPesquisa.FieldByName('RENDIMENTO').AsCurrency <= 0 then
        begin

          dmDBEXMaster.fdqMasterPesquisa.Close;
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PRODUTO_PRODUCAO_SEM_REND;
          Application.ProcessMessages;
          edtProdutoFinal.SetFocus;

        end
        else
        begin

{          dmMProvider.cdsPesqProdutos.Close;
          dmMProvider.cdsPesqProdutos.ProviderName  := 'dspPesqProdutos';

          dmDBEXMaster.fdqPesqProdutos.SQL.Clear;
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('SELECT PRO.*, PF.*, UND.PERMITE_VENDA_FRACIONADA  as FRACAO FROM PRODUTO PRO');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('JOIN UNIDADE_MEDIDA UND');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('ON(UND.UNIDADE = PRO.UNIDADE)');
          dmDBEXMaster.fdqPesqProdutos.SQL.Add('where pro.produto = '+ IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value));

          dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pf.filial = '+ InttoStr(dmDBEXMaster.iIdFilial));

          dmDBEXMaster.fdqPesqProdutos.SQL.Add('and pro.produto in (select produto from producao)');

          dmMProvider.cdsPesqProdutos.Open;
          dmMProvider.cdsPesqProdutos.ProviderName := '';

          if dmMProvider.cdsPesqProdutos.IsEmpty then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - Cod. ' + IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value);
            Application.ProcessMessages;

          end
          else
          begin}

            dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value := dmMProvider.cdsPesqProdutosPRODUTO.Value;
            dmMProvider.cdsOrdemProducaoESTOQUE_ATUAL.Value := dmMProvider.cdsPesqProdutosLOJA.Value;
            dmMProvider.cdsOrdemProducaoRENDIMENTO.Value    := dmDBEXMaster.fdqMasterPesquisa.FieldByName('RENDIMENTO').AsCurrency;
            CarregarFichaTecnica;

//          end;

            edtQuantidadeDesejada.SetFocus;

        end;

      end;

    end;

    FreeAndNil(frmPesquisaProduto);

  end;

end;

procedure TfrmModOrdemProducao.imgPesquiosarInsumoClick(Sender: TObject);
begin

  if not dmMProvider.cdsOrdemProducao.IsEmpty then
  begin

    frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
    frmPesquisaProduto.Tag  := ord(PesquisaItemInsumo);

    if frmPesquisaProduto.ShowModal = mrOk then
    begin

      edtProdutoInsumo.Text     := IntToStr(dmMProvider.cdsPesqProdutosPRODUTO.Value);
      edtDescricaoInsumo.Text   := dmMProvider.cdsPesqProdutosDESCRICAO.Value;
      edtUnidade.Text           := dmMProvider.cdsPesqProdutosUNIDADE.Value;
      edtSaldoLoja.Text         := FormatFloat('#,##0.000',dmMProvider.cdsPesqProdutosLOJA.Value);
      edtQuantidadeInsumo.Value := 1;

      edtQuantidadeInsumo.SetFocus;

    end;

    FreeAndNil(frmPesquisaProduto);

  end;

end;

procedure TfrmModOrdemProducao.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsOrdemProducao.Active then
  begin

    if not InserindoEditando(dmMProvider.cdsOrdemProducao) then
    begin

      LimparMSG_ERRO;

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmModOrdemProducao.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

function TfrmModOrdemProducao.Man_Tab_ItemOrdemProducao(pOpcao: smallint): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspItemOrdemProducao.Params[0].Value  := pOpcao;
    dmMSProcedure.fdspItemOrdemProducao.Params[1].Value  := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspItemOrdemProducao.Params[2].Value  := dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[3].Value  := StrToInt(Trim(edtProdutoInsumo.Text));
    dmMSProcedure.fdspItemOrdemProducao.Params[4].Value  := (edtQuantidadeInsumo.Value * dmMProvider.cdsOrdemProducaoQUANTIDADE.Value);
    dmMSProcedure.fdspItemOrdemProducao.Params[5].Value  := (edtQuantidadeInsumo.Value * dmMProvider.cdsOrdemProducaoQUANTIDADE.Value);
    dmMSProcedure.fdspItemOrdemProducao.Params[6].Value  := edtPerdaInsumo.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[7].Value  := dmMProvider.cdsPesqProdutosLOJA.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[8].Value  := dmDBEXMaster.sNomeUsuario;

    dmMSProcedure.fdspItemOrdemProducao.ExecProc;

    Result := true;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Result          := False;

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

function TfrmModOrdemProducao.Man_Tab_ItemOrdemProducaoFC(pOpcao: smallint): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspItemOrdemProducao.Params[0].Value  := pOpcao;
    dmMSProcedure.fdspItemOrdemProducao.Params[1].Value  := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspItemOrdemProducao.Params[2].Value  := dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[3].Value  := dmMProvider.cdsItemProducaoPRODUTO.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[4].Value  := dmMProvider.cdsItemProducaoQUANTIDADE.Value * dmMProvider.cdsOrdemProducaoQUANTIDADE.Value;;
    dmMSProcedure.fdspItemOrdemProducao.Params[5].Value  := dmMProvider.cdsItemProducaoQUANTIDADE.Value * dmMProvider.cdsOrdemProducaoQUANTIDADE.Value;;
    dmMSProcedure.fdspItemOrdemProducao.Params[6].Value  := dmMProvider.cdsItemProducaoPERDA.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[7].Value  := dmMProvider.cdsItemProducaoESTOQUE.Value;
    dmMSProcedure.fdspItemOrdemProducao.Params[8].Value  := dmDBEXMaster.sNomeUsuario;

    dmMSProcedure.fdspItemOrdemProducao.ExecProc;

    Result := true;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Result          := False;

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

function TfrmModOrdemProducao.Man_Tab_OrdemProducao(pOpcao, pSituacao: smallint): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if pOpcao = 1 then
    begin

      //estorna saldo produto
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      AtualizarSaldoProduto(1);

      LimparMSG_ERRO;

      //exlui item ordem produ��o
      dmMProvider.cdsItemOrdemProducao.First;

      while not dmMProvider.cdsItemOrdemProducao.Eof do
      begin

        dmMSProcedure.fdspItemOrdemProducao.Params[0].Value  := pOpcao;
        dmMSProcedure.fdspItemOrdemProducao.Params[1].Value  := dmDBEXMaster.iIdFilial;
        dmMSProcedure.fdspItemOrdemProducao.Params[2].Value  := dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value;
        dmMSProcedure.fdspItemOrdemProducao.Params[3].Value  := dmMProvider.cdsItemOrdemProducaoPRODUTO_INSUMO.Value;
        dmMSProcedure.fdspItemOrdemProducao.Params[4].Value  := 0;
        dmMSProcedure.fdspItemOrdemProducao.Params[5].Value  := 0;
        dmMSProcedure.fdspItemOrdemProducao.Params[6].Value  := 0;
        dmMSProcedure.fdspItemOrdemProducao.Params[7].Value  := 0;
        dmMSProcedure.fdspItemOrdemProducao.Params[8].Value  := dmDBEXMaster.sNomeUsuario;

        dmMSProcedure.fdspItemOrdemProducao.ExecProc;

        dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial)

      end;

      dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial)

    end;

    dmMSProcedure.fdspOrdemdeProducao.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspOrdemdeProducao.Params[1].Value   := dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[2].Value   := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspOrdemdeProducao.Params[3].Value   := pSituacao;
    dmMSProcedure.fdspOrdemdeProducao.Params[4].Value   := dtpDataInicio.Date;
    dmMSProcedure.fdspOrdemdeProducao.Params[5].Value   := dtpDataPrevista.Date;
    dmMSProcedure.fdspOrdemdeProducao.Params[6].Value   := dtpDataTermino.Date;
    dmMSProcedure.fdspOrdemdeProducao.Params[7].Value   := dmMProvider.cdsOrdemProducaoORDEM_SERVICO.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[8].Value   := dmMProvider.cdsOrdemProducaoPRODUTO_FINAL.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[9].Value   := dmMProvider.cdsOrdemProducaoQUANTIDADE.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[10].Value  := dmMProvider.cdsOrdemProducaoTIPO_PRODUCAO.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[11].Value  := dmMProvider.cdsOrdemProducaoFUNCIONARIO_RESPONSAVEL.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[12].Value  := dmMProvider.cdsOrdemProducaoOBSERVACAO.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[13].Value  := dmMProvider.cdsOrdemProducaoESTOQUE_ATUAL.Value;
    dmMSProcedure.fdspOrdemdeProducao.Params[14].Value  := dmMProvider.cdsOrdemProducaoRENDIMENTO.Value;
    dmMSProcedure.fdspOrdemdeProducao.ExecProc;

    if dmMSProcedure.fdspOrdemdeProducao.Params[15].Value > 0 then
      dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value := dmMSProcedure.fdspOrdemdeProducao.Params[15].Value;

    Result := true;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Result          := False;
      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;
  end;
end;

procedure TfrmModOrdemProducao.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  if rdpOpcoesPesquisa.ItemIndex < 4 then
  begin

    edtConteudoPesquisa.SetFocus;
    edtConteudoPesquisa.Clear;

  end
  else
  begin

    frmPesquisaFuncionario := TfrmPesquisaFuncionario.Create(self);
    if frmPesquisaFuncionario.ShowModal = mrOk then
    begin

      if not dmMProvider.cdsFuncionarios.IsEmpty then
      begin

        if AbrirTabelaOrdemProducao(rdpOpcoesPesquisa.ItemIndex, IntToStr(dmMProvider.cdsFuncionariosFUNCIONARIO.Value)) then
        begin

          edtConteudoPesquisa.Clear;
          pgcOrdemProducao.ActivePageIndex := 0;
          grdTabela.SetFocus;

        end
        else
        begin

          edtConteudoPesquisa.Clear;
          edtConteudoPesquisa.SetFocus;

        end;

      end;

    end;

    FreeAndNil(frmPesquisaFuncionario);

  end;

end;

procedure TfrmModOrdemProducao.ResetarCampos;
begin

  edtProdutoInsumo.Clear;
  edtDescricaoInsumo.Clear;
  edtUnidade.Clear;
  edtSaldoLoja.Text         := '0,000';
  edtQuantidadeInsumo.Value := 0;
  edtPerdaInsumo.Value      := 0;

end;

procedure TfrmModOrdemProducao.tdsCadastroShow(Sender: TObject);
begin

  if not dmMProvider.cdsOrdemProducao.IsEmpty then
    dmMProvider.RelacionarItem_OrdemProducao(dmMProvider.cdsOrdemProducaoORDEM_DE_PRODUCAO.Value, dmDBEXMaster.iIdFilial);

end;

function TfrmModOrdemProducao.ValidarProdutoFinal(pProduto, pFilial, pOrdemProducao:integer): boolean;
begin

  Result := false;

  dmDBEXMaster.fdqMasterPesquisa.Close;

  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select * from ordem_de_producao');
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where produto_final = ' + IntToStr(pProduto));
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and filial = ' + IntToStr(pFilial));
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and situacao = 0');

  dmDBEXMaster.fdqMasterPesquisa.Open;
  Result := dmDBEXMaster.fdqMasterPesquisa.IsEmpty;

end;

procedure TfrmModOrdemProducao.WindowClose1Execute(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsOrdemProducao) then
    actSalvarExecute(self);

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

