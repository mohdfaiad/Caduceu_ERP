unit modCodigoComumFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, Vcl.Imaging.jpeg, System.Actions,
  Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Comp.Client, Vcl.StdActns,
  Vcl.Imaging.pngimage;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmReferenciaFornecedor = class(TForm)
    rdgPesquisa: TRadioGroup;
    grpPesquisa: TGroupBox;
    edtConteudoPesquisa: TEdit;
    pgcPrincipal: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tbsCadastro: TTabSheet;
    actRefFornecedor: TActionList;
    actIncluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actEditar: TAction;
    actSair: TAction;
    actEstorno: TAction;
    acImportarCupom: TAction;
    grpCadastro: TGroupBox;
    lblControle: TLabel;
    lblFornecedor: TLabel;
    lblProduto: TLabel;
    lblReferencia: TLabel;
    edtControle: TDBEdit;
    edtFornecedor: TDBEdit;
    edtProduto: TDBEdit;
    edtReferencia: TDBEdit;
    lblMsgValidaCampo: TLabel;
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
    edtNomeFornecedor: TDBEdit;
    edtNome_Produto: TDBEdit;
    imgPesqFornecedor: TImage;
    imgPesqProduto: TImage;
    procedure FormCreate(Sender: TObject);
    procedure edtFornecedorEnter(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure rdgPesquisaClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure imgPesqFornecedorClick(Sender: TObject);
    procedure imgPesqProdutoClick(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    sReferencia:string;
    iFornecedor :integer;
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure MostrarOcultarAbas(pOpcao:integer);
    function ValidarCampos: boolean;
  public
    { Public declarations }
  end;

var
  frmReferenciaFornecedor: TfrmReferenciaFornecedor;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, uFuncoes_BD, modPesquisaFornecedorCNPJRSocial,
  modPesquisaProduto, dataMSource;

procedure TfrmReferenciaFornecedor.actCancelarExecute(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
  begin

    dmMProvider.cdsReferenciaFornecedor.Cancel;
    pgcPrincipal.ActivePageIndex  := 0;
    edtConteudoPesquisa.Clear;
    edtConteudoPesquisa.SetFocus;
    grpCadastro.Enabled           := False;

  end;

end;

procedure TfrmReferenciaFornecedor.actEditarExecute(Sender: TObject);
begin

  if not dmMProvider.cdsReferenciaFornecedor.IsEmpty then
  begin

    HabilitaDesabilitaControles(True);
    MostrarOcultarAbas(1);
    pgcPrincipal.ActivePageIndex := 1;
    edtFornecedor.SetFocus;
    dmMProvider.cdsReferenciaFornecedor.Edit;

  end;

end;

procedure TfrmReferenciaFornecedor.actExcluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  try

    if not dmMProvider.cdsReferenciaFornecedor.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      Man_Tab_RefFornecedor(1);
      dmMProvider.cdsReferenciaFornecedor.Delete;

      LimparMSG_ERRO(lblMsg, nil);

    end;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmReferenciaFornecedor.actIncluirExecute(Sender: TObject);
var
  iFornecedor:integer;
begin

  iFornecedor := dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value;

  LimparMSG_ERRO(lblMsg, nil);

  try

    edtConteudoPesquisa.Clear;

    AbrirTabelaREFFornecedor(0,'-1');

    pgcPrincipal.Pages[1].TabVisible  := True;

    HabilitaDesabilitaControles(True);

    pgcPrincipal.ActivePageIndex      := 1;

    dmMProvider.cdsReferenciaFornecedor.Append;

    if iFornecedor > 0 then
    begin

      dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value := iFornecedor;
      edtProduto.SetFocus;

    end
    else
      edtFornecedor.SetFocus;


  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmReferenciaFornecedor.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmReferenciaFornecedor.actSalvarExecute(Sender: TObject);
begin

  try

    if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
    begin

      ActiveControl := nil;

      if ValidarCampos then
        Man_Tab_RefFornecedor(0);

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;
      HabilitaDesabilitaControles(False);

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmReferenciaFornecedor.edtFornecedorEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmReferenciaFornecedor.edtFornecedorExit(Sender: TObject);
begin

  MudarCorEdit(edtFornecedor);

  if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
  begin

    if dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value > 0 then
    begin

      if not PesquisarFornecedor('WHERE FORNECEDOR = ' + IntToStr(dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value)) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' Fornecedor: ' + IntToStr(dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value);
        dmMProvider.cdsReferenciaFornecedorNOME_FORNECEDOR.Value  := '';
        Application.ProcessMessages;
        edtFornecedor.SetFocus;

      end
      else
        dmMProvider.cdsReferenciaFornecedorNOME_FORNECEDOR.Value  := dmMProvider.cdsPesqFornecedorRAZAOSOCIAL.Value;

    end;

  end;
end;

procedure TfrmReferenciaFornecedor.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmReferenciaFornecedor.edtConteudoPesquisaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  try

    if rdgPesquisa.ItemIndex < 2 then
    begin

      if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
      begin

        if AbrirTabelaREFFornecedor(rdgPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
        begin

          MostrarOcultarAbas(1);
          pgcPrincipal.ActivePageIndex := 0;
          edtConteudoPesquisa.Clear;
          grdTabela.SetFocus;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
          Application.ProcessMessages;
          edtConteudoPesquisa.Clear;
          edtConteudoPesquisa.SetFocus;

        end;

      end;

    end;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmReferenciaFornecedor.edtConteudoPesquisaKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmReferenciaFornecedor.edtConteudoPesquisaKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmReferenciaFornecedor.edtProdutoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
  begin

    if dmMProvider.cdsReferenciaFornecedorPRODUTO.Value > 0 then
    begin

      AbrirTabelaProdutos(dmMProvider.cdsReferenciaFornecedorPRODUTO.Value);

      if dmMProvider.cdsProdutos.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' Produto: ' + IntToStr(dmMProvider.cdsReferenciaFornecedorPRODUTO.Value);
        dmMProvider.cdsReferenciaFornecedorNOME_PRODUTO.Value  := '';
        Application.ProcessMessages;
        edtProduto.SetFocus;

      end
      else
        if dmMProvider.cdsReferenciaFornecedorPRODUTO.Value > 0 then
          dmMProvider.cdsReferenciaFornecedorNOME_PRODUTO.Value := dmMProvider.cdsProdutosDESCRICAO.Value;

    end;

  end;

end;

procedure TfrmReferenciaFornecedor.edtReferenciaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmReferenciaFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;

end;

procedure TfrmReferenciaFornecedor.FormCreate(Sender: TObject);
var
  i:integer;
begin

  pgcPrincipal.ActivePageIndex  := 0;

  Caption                       := Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(Application.ExeName, 1);

  DesabilitarBotaoFecharForm(handle);

  dmDBEXMaster.sNomeUsuario   := ParamStr(1);
  dmDBEXMaster.sSenha         := ParamStr(2);
  dmDBEXMaster.iIdUsuario     := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial      := StrToInt(ParamStr(4));

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  if (Length(Trim(ParamStr(5))) > 0) and (ParamStr(6) <> '') then
  begin

    dmMProvider.cdsReferenciaFornecedor.Close;
    dmMProvider.cdsReferenciaFornecedor.ProviderName := 'dspReferenciaFornecedor';

    AbrirTabelaREFFornecedor(0,'-1');

    dmMProvider.cdsReferenciaFornecedor.Append;

    dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value       := StrToInt(ParamStr(6));

    PesquisarFornecedor('WHERE FORNECEDOR = ' + IntToStr(dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value));

    dmMProvider.cdsReferenciaFornecedorNOME_FORNECEDOR.Value  := dmMProvider.cdsPesqFornecedorRAZAOSOCIAL.Value;

    dmMProvider.cdsReferenciaFornecedorREFERENCIA.Value            := Trim(ParamStr(5));

    grpCadastro.Enabled           := True;

    pgcPrincipal.ActivePageIndex  := 1;

  end;


end;

procedure TfrmReferenciaFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmReferenciaFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else if (UpperCase(key) = 'N') and (lblMsg.Tag  <> 0)then
  begin

    key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO(lblMsg, nil);

  end;

end;

procedure TfrmReferenciaFornecedor.grdTabelaDblClick(Sender: TObject);
begin

  pgcPrincipal.ActivePageIndex := 1;

end;

procedure TfrmReferenciaFornecedor.grdTabelaDrawColumnCell
  (Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if not odd(dmMProvider.cdsReferenciaFornecedor.RecNo) then
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

procedure TfrmReferenciaFornecedor.grdTabelaKeyPress
  (Sender: TObject; var Key: Char);
begin

  if Key = #13 then
    grdTabelaDblClick(Self);

end;

procedure TfrmReferenciaFornecedor.HabilitaDesabilitaControles(pOpcao: boolean);
begin
  grpCadastro.Enabled := pOpcao;

end;

procedure TfrmReferenciaFornecedor.imgPesqFornecedorClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
  begin

    Application.CreateForm(TfrmPesquisaFornecedor, frmPesquisaFornecedor);
    frmPesquisaFornecedor.Tag := 1; //permite pesquisar por nome/raz�o social

    if frmPesquisaFornecedor.ShowModal = mrOk then
    begin

      dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value  := dmMProvider.cdsFornecedorFORNECEDOR.Value;
      dmMProvider.cdsReferenciaFornecedorNOME_FORNECEDOR.Value  := dmMProvider.cdsFornecedorRAZAOSOCIAL.Value;
      edtProduto.SetFocus;

    end
    else
      dmMProvider.cdsReferenciaFornecedorNOME_FORNECEDOR.Value  := '';

    FreeAndNil(frmPesquisaFornecedor);

  end;

end;

procedure TfrmReferenciaFornecedor.imgPesqProdutoClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
  begin

    Application.CreateForm(TfrmPesquisaProduto, frmPesquisaProduto);

    if frmPesquisaProduto.ShowModal = mrOk then
    begin

      dmMProvider.cdsReferenciaFornecedorPRODUTO.Value        := dmMProvider.cdsProdutosPRODUTO.Value;
      dmMProvider.cdsReferenciaFornecedorNOME_PRODUTO.Value   := dmMProvider.cdsProdutosDESCRICAO.Value;
      edtReferencia.SetFocus;

    end
    else
      dmMProvider.cdsReferenciaFornecedorNOME_PRODUTO.Value  := '';

    FreeAndNil(frmPesquisaFornecedor);

  end;

end;

procedure TfrmReferenciaFornecedor.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmReferenciaFornecedor.lblF5Click(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if dmMProvider.cdsReferenciaFornecedor.Active then
  begin

    if not InserindoEditando(dmMProvider.cdsReferenciaFornecedor) then
    begin

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;
      Application.ProcessMessages

    end;

  end;

end;

procedure TfrmReferenciaFornecedor.MostrarOcultarAbas(pOpcao: integer);
begin

  pgcPrincipal.Pages[1].TabVisible := (pOpcao = 1);

end;


procedure TfrmReferenciaFornecedor.rdgPesquisaClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if rdgPesquisa.ItemIndex = 2 then
  begin

    dmMProvider.cdsProdutos.Close;
    dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

    dmMProvider.cdsReferenciaFornecedor.Close;

    dmDBEXMaster.fdqProdutos.SQL.Clear;
    dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, pf.loja, pf.deposito, PF.saldominimo, pf.saldomaximo, pf.saldoanterior, pf.saldo_reservado, pf.saldo_almoxarifado,');
    dmDBEXMaster.fdqProdutos.SQL.Add('pf.promocao, pf.precodevenda FROM PRODUTO PRO');
    dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
    dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');

    dmMProvider.cdsProdutos.Open;
    dmMProvider.cdsProdutos.ProviderName := '';

    frmPesquisaFornecedor     := TfrmPesquisaFornecedor.Create(self);
    //permite consultar no raz�o social
    frmPesquisaFornecedor.Tag := 1;
    if frmPesquisaFornecedor.ShowModal = mrOk then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      if AbrirTabelaREFFornecedor(rdgPesquisa.ItemIndex, IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value)) then
      begin

        LimparMSG_ERRO(lblMsg, nil);

        MostrarOcultarAbas(1);
        pgcPrincipal.ActivePageIndex := 0;
        edtConteudoPesquisa.Clear;
        grdTabela.SetFocus;

      end
      else
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(dmMProvider.cdsFornecedorRAZAOSOCIAL.Value);
        Application.ProcessMessages;
        edtConteudoPesquisa.Clear;
        edtConteudoPesquisa.SetFocus;

      end;

    end;

  end
  else
  begin

    edtConteudoPesquisa.Clear;
    edtConteudoPesquisa.SetFocus;

  end;

end;

procedure TfrmReferenciaFornecedor.tbsCadastroShow(Sender: TObject);
begin

  if (Length(Trim(ParamStr(5))) > 0) and (ParamStr(6) <> '') then
  begin

    dmMProvider.cdsReferenciaFornecedorNOME_FORNECEDOR.Value  := dmMProvider.cdsPesqFornecedorRAZAOSOCIAL.Value;
    if dmMProvider.cdsReferenciaFornecedorPRODUTO.Value > 0 then
      dmMProvider.cdsReferenciaFornecedorNOME_PRODUTO.Value := dmMProvider.cdsProdutosDESCRICAO.Value;

    if grpCadastro.Enabled then
      edtProduto.SetFocus;

  end;

end;

function TfrmReferenciaFornecedor.ValidarCampos: boolean;
begin

  lblMsgValidaCampo.Caption := '';

  if dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value <= 0 then
    lblMsgValidaCampo.Caption := 'Campo " FORNECEDOR " � de preenchimento obrigat�rio!'
  else if dmMProvider.cdsReferenciaFornecedorPRODUTO.Value <= 0 then
    lblMsgValidaCampo.Caption := 'Campo " PRODUTO " � de preenchimento obrigat�rio!'
  else if dmMProvider.cdsReferenciaFornecedorREFERENCIA.Value = '' then
    lblMsgValidaCampo.Caption := 'Campo " REFER�NCIA " � de preenchimento obrigat�rio!';

  Result := (dmMProvider.cdsReferenciaFornecedorFORNECEDOR.Value > 0) and
    (dmMProvider.cdsReferenciaFornecedorPRODUTO.Value > 0) and
    (dmMProvider.cdsReferenciaFornecedorREFERENCIA.AsString <> '');

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor;
  AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState, ACol, ARow)

end;

end.
