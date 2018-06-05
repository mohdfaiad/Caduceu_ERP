unit modFichaTecnica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdActns,
  System.Actions, Vcl.ActnList, Vcl.Mask, Vcl.DBCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, Db;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmFichaTecnica = class(TForm)
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    imgSair: TImage;
    imgEditar: TImage;
    imgExcluir: TImage;
    imgSalvar: TImage;
    imgDesfazer: TImage;
    imgNovo: TImage;
    lblF6: TLabel;
    lblF5: TLabel;
    lblF4: TLabel;
    pgcProducao: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tbsCadastro: TTabSheet;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    tbsIngredientes: TTabSheet;
    ActionList1: TActionList;
    actEditar: TAction;
    actDesfazer: TAction;
    WindowClose1: TWindowClose;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actPesquisa: TAction;
    grpCadastro: TGroupBox;
    lblProducao: TLabel;
    edtProducao: TDBEdit;
    lblProduto: TLabel;
    lblRendimento: TLabel;
    edtProduto: TDBEdit;
    edtRendimento: TDBEdit;
    edtDescricaoProduto: TDBEdit;
    edtUnidade: TDBEdit;
    grpComposicao: TGroupBox;
    grdItemProducao: TDBGrid;
    grpCodigoProduto: TGroupBox;
    edtItemProduto: TJvValidateEdit;
    edtDescricaoItem: TEdit;
    grpQuantidade: TGroupBox;
    edtQuantidade: TJvValidateEdit;
    grpCusto: TGroupBox;
    edtCusto: TJvValidateEdit;
    grpVenda: TGroupBox;
    edtVenda: TJvValidateEdit;
    grpEstoque: TGroupBox;
    edtEstoque: TJvValidateEdit;
    grpTotais: TGroupBox;
    lblValorCusto: TLabel;
    lblValorvenda: TLabel;
    lblValorDesconto: TLabel;
    lblValorFinal: TLabel;
    edtCustoTotal: TDBEdit;
    edtVendaTotal: TDBEdit;
    edtValorDesconto: TDBEdit;
    edtValorTotal: TDBEdit;
    grpIngrdientes: TGroupBox;
    pnlProduto: TPanel;
    edtDescricaoIngrediente: TDBEdit;
    edtUnidadeIngrediente: TDBEdit;
    edtProdutoIngrediente: TDBEdit;
    groIngredientes: TGroupBox;
    edtIngrediente1: TDBEdit;
    edtIngrediente2: TDBEdit;
    edtIngrediente3: TDBEdit;
    edtIngrediente4: TDBEdit;
    edtIngrediente5: TDBEdit;
    edtIngrediente6: TDBEdit;
    edtIngrediente7: TDBEdit;
    lblF3: TLabel;
    lblF2: TLabel;
    actExcluirItemProducao: TAction;
    imgPesqItem: TImage;
    imgPesqProduto: TImage;
    grpPercPerda: TGroupBox;
    edtPercPerda: TJvValidateEdit;
    grpInformacao: TGroupBox;
    memInformacao: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure grdItemProducaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure MostrarEsconderAbas(pOpcao:boolean);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtRendimentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoEnter(Sender: TObject);
    procedure grdItemProducaoDblClick(Sender: TObject);
    procedure LimparCampos;
    procedure edtQuantidadeExit(Sender: TObject);
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure actPesquisaExecute(Sender: TObject);
    function AbrirTabelaProducao(pOpcao: smallint; pConteudo: string): boolean;
    procedure tbsCadastroShow(Sender: TObject);
    procedure RelacionarItemProducao(pProducao:integer);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtItemProdutoExit(Sender: TObject);
    function Man_Tab_Producao(pOpcao:integer):boolean;
    function Man_tab_item_Producao(pOpcao:integer):boolean;
    procedure Preencher_Campos(pProduto:integer;pDescricao:string);
    procedure Incluir_ItemProducao;
    function PesquisarItemProducao(pProduto:integer):boolean;
    procedure actEditarExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure grdItemProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExcluirItemProducaoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblF5Click(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure imgPesqItemClick(Sender: TObject);
    procedure imgPesqProdutoClick(Sender: TObject);
    procedure edtPercPerdaExit(Sender: TObject);
    procedure edtRendimentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaTecnica: TfrmFichaTecnica;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, modPesquisaProduto;

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

function TfrmFichaTecnica.AbrirTabelaProducao(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsProducao.Close;
  dmMProvider.cdsProducao.ProviderName := 'dspProducao';

  dmDBEXMaster.fdqProducao.SQL.Clear;
  dmDBEXMaster.fdqProducao.SQL.Add('select * from producao');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Producao(pOpcao,pConteudo);

  dmDBEXMaster.fdqProducao.SQL.Add(sWhere);
  dmDBEXMaster.fdqProducao.SQL.Add('order by producao');

  try

    dmMProvider.cdsProducao.Open;
    dmMProvider.cdsProducao.ProviderName := '';

    if (dmMProvider.cdsProducao.IsEmpty) and (pConteudo <> '-1')then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsProducao.IsEmpty;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E) + edtConteudoPesquisa.Text;
      Result := false;

    end;

  end;

end;

procedure TfrmFichaTecnica.grdItemProducaoDblClick(Sender: TObject);
begin

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    if not dmMProvider.cdsItemProducao.IsEmpty then
    begin

      dmMProvider.cdsItemProducao.Edit;

      edtItemProduto.Value    := dmMProvider.cdsItemProducaoPRODUTO.Value;
      edtDescricaoItem.Text   := dmMProvider.cdsItemProducaoDESCRICAO_PRODUTO.Value;
      edtQuantidade.Value     := dmMProvider.cdsItemProducaoQUANTIDADE.Value;
      edtCusto.Value          := dmMProvider.cdsItemProducaoTOTAL_CUSTO.Value;
      edtVenda.Value          := dmMProvider.cdsItemProducaoTOTAL_VENDA.Value;
      edtEstoque.Value        := dmMProvider.cdsItemProducaoESTOQUE.Value;

      edtQuantidade.SetFocus;

    end;

  end;

end;

procedure TfrmFichaTecnica.grdItemProducaoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsItemProducao.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItemProducao.RecNo) then
    begin

      grdItemProducao.Canvas.Font.Color   := clBlack;
      grdItemProducao.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdItemProducao.Canvas.Font.Color   := clBlack;
      grdItemProducao.Canvas.Brush.Color  := clWhite;

    end;

    grdItemProducao.Canvas.FillRect(Rect);
    grdItemProducao.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmFichaTecnica.grdItemProducaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        LimparMSG_ERRO(lblMsg,nil);

        if (not dmMProvider.cdsItemProducao.IsEmpty) and (grpCadastro.Enabled) then
        begin

          lblMsg.Tag      := ord(ExcluirItemProducao);
          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

        end;

      end;

  end;

end;

procedure TfrmFichaTecnica.actDesfazerExecute(Sender: TObject);
begin

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
    dmMProvider.cdsProducao.Cancel;

  if dmMProvider.cdsItemProducao.State in [dsEdit, dsInsert] then
    dmMProvider.cdsItemProducao.Cancel;

  MostrarEsconderAbas(False);
  pgcProducao.ActivePageIndex      := 0;

  HabilitaDesabilitaControles(false);


end;

procedure TfrmFichaTecnica.actEditarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if dmMProvider.cdsProducao.Active then
  begin

    if not (dmMProvider.cdsProducao.State in [dsEdit, dsInsert])  then
    begin

      MostrarEsconderAbas(True);
      pgcProducao.ActivePageIndex      := 1;

      HabilitaDesabilitaControles(True);
      dmMProvider.cdsProducao.Edit;
      edtProduto.SetFocus;

    end;

  end;


end;

procedure TfrmFichaTecnica.actExcluirExecute(Sender: TObject);
begin

  while not dmMProvider.cdsItemProducao.Eof do
  begin

    if Man_tab_item_Producao(1) then
      RelacionarItemProducao(dmMProvider.cdsProducaoPRODUCAO.Value);

  end;

  if Man_Tab_Producao(1) then
    dmMProvider.cdsProducao.delete;

  HabilitaDesabilitaControles(false);

  MostrarEsconderAbas(False);
  pgcProducao.ActivePageIndex      := 0;

  LimparMSG_ERRO(lblMsg,nil);
  edtConteudoPesquisa.Text;


end;

procedure TfrmFichaTecnica.actExcluirItemProducaoExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  Man_tab_item_Producao(1);

  dmMProvider.cdsProducao.Edit;
  dmMProvider.cdsProducao.Post;

  RelacionarItemProducao(dmMProvider.cdsProducaoPRODUCAO.Value);

end;

procedure TfrmFichaTecnica.actIncluirExecute(Sender: TObject);
begin

  if not (dmMProvider.cdsProducao.State in [dsEdit, dsInsert]) then
  begin

    LimparMSG_ERRO(lblMsg,nil);

    try

      edtConteudoPesquisa.Clear;

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      AbrirTabelaProducao(0,'-1');
      RelacionarItemProducao(-1);

      MostrarEsconderAbas(True);

      HabilitaDesabilitaControles(True);

      pgcProducao.ActivePageIndex      := 1;

      dmMProvider.cdsProducao.Append;

      edtProduto.SetFocus;

      LimparMSG_ERRO(lblMsg,nil);

    except
      on E: exception do
        lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);

    end;

  end;

end;

procedure TfrmFichaTecnica.actPesquisaExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    if AbrirTabelaProducao(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
      grdTabela.SetFocus;

    edtConteudoPesquisa.Clear;

  end;

  MudarCorEdit(Sender);

end;


procedure TfrmFichaTecnica.actSalvarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    if dmMProvider.cdsProducaoRENDIMENTO.Value > 0 then
    begin

      if Man_Tab_Producao(0) then
      begin

        dmMProvider.cdsProducao.Post;
        HabilitaDesabilitaControles(false);

      end;

      MostrarEsconderAbas(False);
      pgcProducao.ActivePageIndex      := 0;

    end
    else
    begin

      edtRendimento.SetFocus;
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmFichaTecnica.edtConteudoPesquisaEnter(Sender: TObject);
begin

   MostrarEsconderAbas(False);
   MudarCorEdit(Sender);

end;

procedure TfrmFichaTecnica.edtConteudoPesquisaKeyDown(Sender: TObject;
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

procedure TfrmFichaTecnica.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmFichaTecnica.edtItemProdutoExit(Sender: TObject);
var
  iProduto:integer;
  sDescricao:string;
begin

  iProduto    := 0;
  sDescricao  := '';

  MudarCorEdit(sender);

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    if edtItemProduto.Value > 0 then
    begin

      if PesquisarItemProducao(edtItemProduto.Value) then
      begin

        LimparMSG_ERRO(lblMsg,nil);

        if edtItemProduto.Value = dmMProvider.cdsProducaoPRODUTO.Value then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INSUMO_IGUAL_ITEM_PROD;
          Application.ProcessMessages;
          edtItemProduto.SetFocus;
          exit;

        end;

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto =  '+ InttoStr(edtItemProduto.Value));
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and pro.tipo_item in (0,1,2,3,4,5,10)');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and pro.visibilidade = 1');

        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_ITEM_INSUMO + ' - ' + Trim(edtItemProduto.Text);
          TocarSomAlerta(ord(SystemHand));
          edtItemProduto.SetFocus;

        end
        else
        begin

          iProduto    := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value;
          sDescricao  := dmDBEXMaster.fdqMasterPesquisa.FieldByName('DESCRICAO').Value;

          Preencher_Campos(iProduto, sDescricao);

          edtCusto.Value    := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CUSTOLIQUIDO').Value;
          edtVenda.Value    := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRECODEVENDA').Value;
          edtEstoque.Value  := dmDBEXMaster.fdqMasterPesquisa.FieldByName('LOJA').Value;

        end;

        dmDBEXMaster.fdqMasterPesquisa.Close;

      end
      else
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_VALIDAR_ITEM_PRODUCAO;
        edtItemProduto.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmFichaTecnica.edtPercPerdaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    if (edtItemProduto.Value > 0 ) and (edtQuantidade.Value > 0) then
    begin

      if not (dmMProvider.cdsItemProducao.State in [dsEdit]) then
        Incluir_ItemProducao
      else
      begin

        dmMProvider.cdsItemProducaoQUANTIDADE.Value := edtQuantidade.Value;
        dmMProvider.cdsItemProducaoPERDA.Value      := edtPercPerda.Value;

      end;

      if Man_Tab_Producao(0) then
      begin

        if  Man_tab_item_Producao(0) then
        begin

          dmMProvider.cdsProducao.Post;
          dmMProvider.cdsProducao.Edit;

          RelacionarItemProducao(dmMProvider.cdsProducaoPRODUCAO.Value);
          edtItemProduto.SetFocus;

        end;

      end;

    end
    else
      edtItemProduto.SetFocus;

  end;

  LimparCampos;

end;

procedure TfrmFichaTecnica.edtProdutoEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmFichaTecnica.edtProdutoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    if dmMProvider.cdsProducaoPRODUTO.Value > 0 then
    begin

      if PesquisarItemProducao(edtItemProduto.Value) then
      begin

        LimparMSG_ERRO(lblMsg,nil);

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto =  '+ InttoStr(dmMProvider.cdsProducaoPRODUTO.Value));
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and pro.tipo_item in (3,4)');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('and pro.visibilidade = 1');

        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA_ITEM_PRODUZIDO + ' - ' + Trim(edtProduto.Text);
          TocarSomAlerta(ord(SystemHand));
          edtProduto.SetFocus;


        end;

        dmDBEXMaster.fdqMasterPesquisa.Close;

      end
      else
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_ITEM_PROD_IGUAL_INSUMO;
        edtProduto.SetFocus;

      end;

    end
    else
      edtProduto.SetFocus;

  end;

end;

procedure TfrmFichaTecnica.edtQuantidadeExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if (edtItemProduto.Value > 0) and (edtQuantidade.Value <= 0) then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    edtQuantidade.SetFocus;

  end

end;

procedure TfrmFichaTecnica.edtRendimentoExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  MudarCorEdit(Sender);

  if InserindoEditando(dmMProvider.cdsProducao) then
  begin

    if dmMProvider.cdsProducaoRENDIMENTO.Value <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtRendimento.SetFocus;

     end;

  end;

end;

procedure TfrmFichaTecnica.edtRendimentoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmFichaTecnica.FormCreate(Sender: TObject);
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

  pgcProducao.ActivePageIndex       := 0;
  MostrarEsconderAbas(False);

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdItemProducao.Columns.Count - 1 do
    grdItemProducao.Columns[i].Title.Color := COR_TITULO_GRADE;

  dmMProvider.AbrirTabelaFilial;

end;

procedure TfrmFichaTecnica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmFichaTecnica.FormKeyPress(Sender: TObject; var Key: Char);
begin

  try

    if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirItemProducao)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExcluirItemProducaoExecute(self);

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
      LimparMSG_ERRO(lblMsg,nil);

    end;
  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

end;

procedure TfrmFichaTecnica.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsProducao.IsEmpty then
  begin

    pgcProducao.Pages[1].TabVisible  := True;
    pgcProducao.ActivePageIndex      := 1;

  end;

end;

procedure TfrmFichaTecnica.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsProducao.IsEmpty then
  begin

    if not odd(dmMProvider.cdsProducao.RecNo) then
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

procedure TfrmFichaTecnica.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(self);

end;

procedure TfrmFichaTecnica.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled     := pOpcao;
  grpIngrdientes.Enabled  := grpCadastro.Enabled;

end;

procedure TfrmFichaTecnica.imgPesqItemClick(Sender: TObject);
var
  iProduto:integer;
  sDescricao:string;
begin

  iProduto    := 0;
  sDescricao  := '';

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
    frmPesquisaProduto.Tag  := ord(PesquisaItemInsumo);

    if frmPesquisaProduto.ShowModal = mrOK then
    begin

      if dmMProvider.cdsPesqProdutosPRODUTO.Value = dmMProvider.cdsProducaoPRODUTO.Value then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_INSUMO_IGUAL_ITEM_PROD;
        Application.ProcessMessages;
        edtItemProduto.SetFocus;
        exit;

      end;

      iProduto    := dmMProvider.cdsPesqProdutosPRODUTO.Value;

      sDescricao  := dmMProvider.cdsPesqProdutosDESCRICAO.Value;

      if PesquisarItemProducao(dmMProvider.cdsPesqProdutosPRODUTO.Value) then
      begin

        edtCusto.Value    := dmMProvider.cdsPesqProdutosCUSTOLIQUIDO.Value;
        edtVenda.Value    := dmMProvider.cdsPesqProdutosPRECODEVENDA.Value;
        edtEstoque.Value  := dmMProvider.cdsPesqProdutosLOJA.Value;

        Preencher_Campos(iProduto, sDescricao);
        edtQuantidade.SetFocus;

      end
      else
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_VALIDAR_ITEM_PRODUCAO;
        edtItemProduto.SetFocus;

      end;

      dmMProvider.cdsPesqProdutos.Close;

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_VALIDAR_ITEM_PRODUCAO;
      edtItemProduto.SetFocus;

    end;

    FreeAndNil(frmPesquisaProduto);

  end;

end;

procedure TfrmFichaTecnica.imgPesqProdutoClick(Sender: TObject);
begin

  if dmMProvider.cdsProducao.State in [dsEdit, dsInsert] then
  begin

    frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
    frmPesquisaProduto.Tag  := ord(PesquisaItemProduzido);

    if frmPesquisaProduto.ShowModal = mrOK then
    begin

      if PesquisarItemProducao(dmMProvider.cdsPesqProdutosPRODUTO.Value) then
      begin

        dmMProvider.cdsProducaoPRODUTO.Value := dmMProvider.cdsPesqProdutosPRODUTO.Value;
        edtRendimento.SetFocus;

      end
      else
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_ITEM_PROD_IGUAL_INSUMO;
        edtProduto.SetFocus;

      end;

    end;

    FreeAndNil(frmPesquisaProduto);

  end;

end;

procedure TfrmFichaTecnica.Incluir_ItemProducao;
begin

  dmMProvider.cdsItemProducao.Append;
  dmMProvider.cdsItemProducaoPRODUTO.Value      := edtItemProduto.Value;
  dmMProvider.cdsItemProducaoQUANTIDADE.Value   := edtQuantidade.Value;
  dmMProvider.cdsItemProducaoPERDA.Value        := edtPercPerda.Value;

end;

procedure TfrmFichaTecnica.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsProducao.Active then
  begin

    if not (dmMProvider.cdsProducao.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO(lblMsg,nil);

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmFichaTecnica.LimparCampos;
begin

  edtItemProduto.Value    := 0;
  edtDescricaoItem.Clear;
  edtQuantidade.Value     := 0;
  edtCusto.Value          := 0;
  edtVenda.Value          := 0;
  edtEstoque.Value        := 0;

end;

function TfrmFichaTecnica.Man_tab_item_Producao(pOpcao: integer): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspItemProducao.Params[0].Value := pOpcao;
    dmMSProcedure.fdspItemProducao.Params[1].Value := dmMProvider.cdsItemProducaoITEMPRODUCAO.Value;
    dmMSProcedure.fdspItemProducao.Params[2].Value := dmMProvider.cdsProducaoPRODUCAO.Value;
    dmMSProcedure.fdspItemProducao.Params[3].Value := dmMProvider.cdsItemProducaoPRODUTO.Value;
    dmMSProcedure.fdspItemProducao.Params[4].Value := dmMProvider.cdsItemProducaoQUANTIDADE.Value;
    dmMSProcedure.fdspItemProducao.Params[5].Value := dmMProvider.cdsItemProducaoPERDA.Value;

    dmMSProcedure.fdspItemProducao.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := true;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Result := False;

    end;
  end;

end;

function TfrmFichaTecnica.Man_Tab_Producao(pOpcao: integer): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspProducao.Params[0].Value  := pOpcao;
    dmMSProcedure.fdspProducao.Params[1].Value  := dmMProvider.cdsProducaoPRODUCAO.Value;
    dmMSProcedure.fdspProducao.Params[2].Value  := dmMProvider.cdsProducaoPRODUTO.Value;
    dmMSProcedure.fdspProducao.Params[3].Value  := dmMProvider.cdsProducaoRENDIMENTO.Value;
    dmMSProcedure.fdspProducao.Params[4].Value  := dmMProvider.cdsProducaoVALOR_DESCONTO.Value;
    dmMSProcedure.fdspProducao.Params[5].Value  := dmMProvider.cdsProducaoINGREDIENTE1.Value;
    dmMSProcedure.fdspProducao.Params[6].Value  := dmMProvider.cdsProducaoINGREDIENTE2.Value;
    dmMSProcedure.fdspProducao.Params[7].Value  := dmMProvider.cdsProducaoINGREDIENTE3.Value;
    dmMSProcedure.fdspProducao.Params[8].Value  := dmMProvider.cdsProducaoINGREDIENTE4.Value;
    dmMSProcedure.fdspProducao.Params[9].Value  := dmMProvider.cdsProducaoINGREDIENTE5.Value;
    dmMSProcedure.fdspProducao.Params[10].Value := dmMProvider.cdsProducaoINGREDIENTE6.Value;
    dmMSProcedure.fdspProducao.Params[11].Value := dmMProvider.cdsProducaoINGREDIENTE7.Value;

    dmMSProcedure.fdspProducao.ExecProc;

    if dmMSProcedure.fdspProducao.Params[12].Value  > 0 then
      dmMProvider.cdsProducaoPRODUCAO.Value   := dmMSProcedure.fdspProducao.Params[12].Value;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := true;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Result := False;

    end;

  end;


end;

procedure TfrmFichaTecnica.MostrarEsconderAbas(pOpcao: boolean);
begin

  pgcProducao.Pages[1].TabVisible   := pOpcao;
  pgcProducao.Pages[2].TabVisible   := False;

end;

function TfrmFichaTecnica.PesquisarItemProducao(pProduto:integer): boolean;
var
  sWhere:string;
begin

  LimparMSG_ERRO(lblMsg,nil);

  try

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT * FROM ITEMPRODUCAO');
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE PRODUTO = ' + IntToStr(pProduto));
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('AND PRODUCAO = ' + IntToStr(dmMProvider.cdsProducaoPRODUCAO.Value));
    dmDBEXMaster.fdqMasterPesquisa.Open;

    Result := dmDBEXMaster.fdqMasterPesquisa.IsEmpty;

    dmDBEXMaster.fdqMasterPesquisa.Close;

   except
    on E: exception do
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario+ ', ' + Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmFichaTecnica.Preencher_Campos(pProduto:integer;pDescricao:string);
begin

  edtItemProduto.Value      := pProduto;
  edtDescricaoItem.Text     := pDescricao;

end;

procedure TfrmFichaTecnica.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmFichaTecnica.RelacionarItemProducao(pProducao: integer);
begin

  dmMProvider.cdsItemProducao.Close;
  dmMProvider.cdsItemProducao.ProviderName := 'dspItemProducao';

  dmDBEXMaster.fdqItemProducao.SQL.Clear;
  dmDBEXMaster.fdqItemProducao.SQL.Add('select *  from itemproducao');
  dmDBEXMaster.fdqItemProducao.SQL.Add('where producao = ' + IntToStr(pProducao));
  dmDBEXMaster.fdqItemProducao.SQL.Add('order by itemproducao');

  dmMProvider.cdsItemProducao.Open;
  dmMProvider.cdsItemProducao.ProviderName := '';

end;

procedure TfrmFichaTecnica.tbsCadastroShow(Sender: TObject);
begin

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  if not dmMProvider.cdsProducao.IsEmpty then
    RelacionarItemProducao(dmMProvider.cdsProducaoPRODUCAO.Value);

  LimparMSG_ERRO(lblMsg, nil);

end;

procedure TfrmFichaTecnica.WindowClose1Execute(Sender: TObject);
begin

  Close;

end;

end.
