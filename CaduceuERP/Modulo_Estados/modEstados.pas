unit modEstados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.StdActns,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.Mask, Vcl.DBCtrls, FireDAC.Phys.IBWrapper,
  midaslib;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmEstados = class(TForm)
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    pgcEstados: TPageControl;
    tbsTabela: TTabSheet;
    tdsCadastro: TTabSheet;
    imgSair: TImage;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    edtConteudoPesquisa: TEdit;
    grdTabela: TDBGrid;
    imgNovo: TImage;
    imgSalvar: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    lblF3: TLabel;
    lblF4: TLabel;
    imgExcluir: TImage;
    lblF5: TLabel;
    imgEditar: TImage;
    lblF6: TLabel;
    impPesquisar: TImage;
    grpCadastro: TGroupBox;
    grpCidades: TGroupBox;
    lblSigla: TLabel;
    lblNome: TLabel;
    lblMVA: TLabel;
    lblCodigoIBGE: TLabel;
    lblAliquota_ICMS_Interna: TLabel;
    lblAliquota_ICMS_InterEst: TLabel;
    edtSigla: TDBEdit;
    edtNome: TDBEdit;
    edtCodigoIBGE: TDBEdit;
    edtAliqICMSInt: TDBEdit;
    edtAliqICMSIntEst: TDBEdit;
    edtMVA: TDBEdit;
    grdCidades: TDBGrid;
    actIncluir: TAction;
    actDesfazer: TAction;
    actSalvar: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    TabSheet1: TTabSheet;
    grpFECP: TGroupBox;
    imgVincularFECP_NCM: TImage;
    grdFECP: TDBGrid;
    grpPesquisaNCM_FCP: TGroupBox;
    imgPesquisarNCM_FCP: TImage;
    edtPesquisaNCM_FCP: TEdit;
    actExcluirNCM_FCP: TAction;
    lblPercentualFCPPadrao: TLabel;
    edtPercentualFCPPadrao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure grdTabelaTitleClick(Column: TColumn);
    procedure edtSiglaExit(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtAliqICMSIntKeyPress(Sender: TObject; var Key: Char);
    procedure grdTabelaDblClick(Sender: TObject);
    function AbrirTabelaEstados(pOpcao:smallint; pConteudo:string):boolean;
    procedure AbrirTabelaCidades(pOpcao:smallint; pConteudo:string);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure grdCidadesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actIncluirExecute(Sender: TObject);
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure edtSiglaEnter(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoIBGEExit(Sender: TObject);
    procedure edtAliqICMSIntExit(Sender: TObject);
    procedure edtAliqICMSIntEstExit(Sender: TObject);
    procedure edtMVAExit(Sender: TObject);
    function ValidarCampos:boolean;
    procedure grdFECPDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPesquisaNCM_FCPExit(Sender: TObject);
    procedure imgVincularFECP_NCMClick(Sender: TObject);
    procedure edtPesquisaNCM_FCPEnter(Sender: TObject);
    procedure grdFECPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExcluirNCM_FCPExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstados: TfrmEstados;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMSource, uFuncoes, dataMProvider, uConstantes_Padrao,
  dataMSProcedure, modFCP_Estados, uFuncoes_BD;

procedure TfrmEstados.AbrirTabelaCidades(pOpcao: smallint; pConteudo: string);
var
  sWhere:string;
begin

  dmMProvider.cdsCidades.Close;
  dmMProvider.cdsCidades.ProviderName := 'dspCidades';;
  dmDBEXMaster.fdqCidades.SQL.Clear;
  dmDBEXMaster.fdqCidades.SQL.Add('select cidade, nome, estado, codigo_municipio');
  dmDBEXMaster.fdqCidades.SQL.Add('from cidades');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Cidades(pOpcao,pConteudo);

  dmDBEXMaster.fdqCidades.SQL.Add(sWhere);
  dmDBEXMaster.fdqCidades.SQL.Add('ORDER BY NOME');

  try

    dmMProvider.cdsCidades.Open;
    dmMProvider.cdsCidades.ProviderName := '';

{    if dmMProvider.cdsCidades.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;
}
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmEstados.AbrirTabelaEstados(pOpcao:smallint; pConteudo:string):boolean;
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

    if dmMProvider.cdsEstados.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsEstados.IsEmpty;

   except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmEstados.actDesfazerExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if dmMProvider.cdsEstados.Active then
    if dmMProvider.cdsEstados.State in [dsEdit, dsInsert] then
    begin
      dmMProvider.cdsEstados.Cancel;

      HabilitaDesabilitaControles(False);

      pgcEstados.Pages[1].TabVisible  := false;
      pgcEstados.Pages[2].TabVisible  := false;

      pgcEstados.ActivePageIndex      := 0;

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end;

end;

procedure TfrmEstados.actEditarExecute(Sender: TObject);
begin

  if dmMProvider.cdsEstados.Active then
  begin

    if not (dmMProvider.cdsEstados.State in [dsEdit, dsInsert]) then
    begin

      HabilitaDesabilitaControles(True);
      pgcEstados.ActivePageIndex := 1;
      edtNome.SetFocus;

    end;

  end;

end;

procedure TfrmEstados.actExcluirExecute(Sender: TObject);
begin

  try

    Man_Tab_Estados(1);
    dmMProvider.cdsEstados.Delete;
    LimparMSG_ERRO(lblMsg, nil);

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

  HabilitaDesabilitaControles(false);
  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmEstados.actExcluirNCM_FCPExecute(Sender: TObject);
begin

  Man_Tab_FCP_Estados(1);
  Relacionar_FCP;
  LimparMSG_ERRO(lblMsg, nil);

end;

procedure TfrmEstados.actIncluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  try

    edtConteudoPesquisa.Clear;

    AbrirTabelaEstados(2,'-1');

    dmMProvider.cdsCidades.Close;

    pgcEstados.Pages[1].TabVisible  := True;
    pgcEstados.Pages[2].TabVisible  := true;

    HabilitaDesabilitaControles(True);

    pgcEstados.ActivePageIndex      := 1;

    dmMProvider.cdsEstados.Append;

    edtSigla.SetFocus;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmEstados.actSalvarExecute(Sender: TObject);
begin

  ActiveControl := nil;

  try

    if dmMProvider.cdsEstados.Active then
    begin

      if InserindoEditando(dmMProvider.cdsEstados) then
      begin

        if ValidarCampos then
        begin

          LimparMSG_ERRO(lblMsg, nil);

          //verifica se o estado j� existe
          dmDBEXMaster.fdqEstados.Close;
          dmDBEXMaster.fdqEstados.SQL.Clear;
          dmDBEXMaster.fdqEstados.SQL.Add('SELECT SIGLA FROM ESTADOS');
          dmDBEXMaster.fdqEstados.SQL.Add('WHERE SIGLA = ' +QuotedStr(dmMProvider.cdsEstadosSIGLA.Value));
          dmDBEXMaster.fdqEstados.Open;

          if not dmDBEXMaster.fdqEstados.IsEmpty then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_REGISTRO_JA_EXISTE;
            TocarSomAlerta(ord(SystemHand));

          end
          else
          begin

            Man_Tab_Estados(0);

            dmMProvider.cdsEstados.Post;

            HabilitaDesabilitaControles(false);
            edtConteudoPesquisa.Clear;
            edtConteudoPesquisa.SetFocus;

          end;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PREENCHIMENTO_OBRIGATORIO;
          TocarSomAlerta(ord(SystemHand));

        end;

      end;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmEstados.edtAliqICMSIntEstExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtAliqICMSIntExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtAliqICMSIntKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = System.SysUtils.FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmEstados.edtCodigoIBGEExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtConteudoPesquisaEnter(Sender: TObject);
begin

   pgcEstados.Pages[1].TabVisible   := false;
   pgcEstados.Pages[2].TabVisible   := false;

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtConteudoPesquisaExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    if AbrirTabelaEstados(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
      grdTabela.SetFocus;

    edtConteudoPesquisa.Clear;
    MudarCorEdit(Sender);

  end;

end;

procedure TfrmEstados.edtConteudoPesquisaKeyDown(Sender: TObject;
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

procedure TfrmEstados.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmEstados.edtMVAExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtNomeExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtPesquisaNCM_FCPEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtPesquisaNCM_FCPExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if Length(Trim(edtPesquisaNCM_FCP.Text)) > 0 then
  begin

    if not dmMProvider.cdsFCP_Estados.IsEmpty then
    begin

      if not dmMProvider.cdsFCP_Estados.Locate('NCM',Trim(edtPesquisaNCM_FCP.Text),[]) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' NCM: ' + Trim(edtPesquisaNCM_FCP.Text);
        Application.ProcessMessages;
        edtPesquisaNCM_FCP.SetFocus;

      end
      else
      begin

        edtPesquisaNCM_FCP.Clear;
        grdFECP.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmEstados.edtSiglaEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.edtSiglaExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmEstados.FormCreate(Sender: TObject);
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

  pgcEstados.Pages[1].TabVisible  := false;
  pgcEstados.Pages[2].TabVisible  := false;
  pgcEstados.ActivePageIndex      := 0;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdFECP.Columns.Count - 1 do
    grdFECP.Columns[i].Title.Color := COR_TITULO_GRADE;

end;

procedure TfrmEstados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    VK_F5:lblF5Click(self);
  end;

end;

procedure TfrmEstados.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else if (UpperCase(key) = 'S') and (lblMsg.Tag = -2) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirNCM_FCPExecute(self);

  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag <> 0) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO(lblMsg, nil);

  end;

end;

procedure TfrmEstados.grdCidadesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsCidades.IsEmpty then
  begin

    if not odd(dmMProvider.cdsCidades.RecNo) then
    begin

      grdCidades.Canvas.Font.Color   := clBlack;
      grdCidades.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdCidades.Canvas.Font.Color   := clBlack;
      grdCidades.Canvas.Brush.Color  := clWhite;

    end;

    grdCidades.Canvas.FillRect(Rect);
    grdCidades.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmEstados.grdFECPDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsFCP_Estados.IsEmpty then
  begin

    if not odd(dmMProvider.cdsFCP_Estados.RecNo) then
    begin

      grdFECP.Canvas.Font.Color   := clBlack;
      grdFECP.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdFECP.Canvas.Font.Color   := clBlack;
      grdFECP.Canvas.Brush.Color  := clWhite;

    end;

    grdFECP.Canvas.FillRect(Rect);
    grdFECP.DefaultDrawDataCell(Rect, Column.Field, State);

  end;


end;

procedure TfrmEstados.grdFECPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of
    VK_DELETE:begin

                LimparMSG_ERRO(lblMsg, nil);

                if not dmMProvider.cdsFCP_Estados.IsEmpty then
                begin

                  lblMsg.Tag := -2;
                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

                end;

              end;
  end;

end;

procedure TfrmEstados.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsEstados.IsEmpty then
  begin

    LimparMSG_ERRO(lblMsg, nil);

//    AbrirTabelaEstados(0,dmMProvider.cdsEstadosSIGLA.Value);
    AbrirTabelaCidades(2,dmMProvider.cdsEstadosSIGLA.Value);
    Relacionar_FCP;
    pgcEstados.Pages[1].TabVisible  := True;
    pgcEstados.Pages[2].TabVisible  := True;
    pgcEstados.ActivePageIndex      := 1;

  end;

end;

procedure TfrmEstados.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsEstados.IsEmpty then
  begin

    if not odd(dmMProvider.cdsEstados.RecNo) then
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

procedure TfrmEstados.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(Self);

end;

procedure TfrmEstados.grdTabelaTitleClick(Column: TColumn);
var
  i:integer;
begin

  if dmMProvider.cdsEstados.Active then
  begin

    if not dmMProvider.cdsEstados.IsEmpty then
    begin

      for i := 0 to grdTabela.Columns.Count-1 do
        grdTabela.Columns[i].Title.Color := clred;

      if not (Column.Field.DataType in [ftBlob, ftMemo]) then
        if Column.Field.FieldKind = fkData then
          dmMProvider.cdsEstados.IndexFieldNames := Column.FieldName;

      grdTabela.Columns[Column.Index].Title.Color := COR_TITULO_GRADE;

    end;

  end;


end;

procedure TfrmEstados.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled := pOpcao;
  grpFECP.Enabled     := grpCadastro.Enabled;

end;

procedure TfrmEstados.imgVincularFECP_NCMClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  try

    if not dmMProvider.cdsEstados.IsEmpty then
    begin

      frmFCP_Estados := TfrmFCP_Estados.Create(self);
      if frmFCP_Estados.ShowModal = mrOk then
      begin

        dmMProvider.cdsProdutos.First;

        dmMProvider.cdsFCP_Estados.DisableControls;

        while not dmMProvider.cdsProdutos.Eof do
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE + ' - reg ' + IntToStr(dmMProvider.cdsProdutos.RecNo) + ' de '+ IntToStr(dmMProvider.cdsProdutos.RecordCount);
          Application.ProcessMessages;

          if not dmMProvider.cdsFCP_Estados.Locate('NCM',dmMProvider.cdsProdutosNCM.Value,[]) then
          begin

            dmMProvider.cdsFCP_Estados.Append;
            dmMProvider.cdsFCP_EstadosFCP.Value     := frmFCP_Estados.edtPercentualFCP.Value;

            if frmFCP_Estados.chkExcecao.Checked then
              dmMProvider.cdsFCP_EstadosEXCECAO.Value := 1
            else
              dmMProvider.cdsFCP_EstadosEXCECAO.Value := 0;

            Man_Tab_FCP_Estados(0);

            dmMProvider.cdsFCP_Estados.Post;

          end;

          dmMProvider.cdsProdutos.Next;

        end;

        dmMProvider.cdsFCP_Estados.First;
        dmMProvider.cdsFCP_Estados.EnableControls;

      end;

      FreeAndNil(frmFCP_Estados);

    end;

    LimparMSG_ERRO(lblMsg, nil);

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmEstados.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsEstados.Active then
  begin

    if not (dmMProvider.cdsEstados.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO(lblMsg, nil);

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmEstados.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

function TfrmEstados.ValidarCampos: boolean;
begin

  Result := true;

  if Length(Trim(dmMProvider.cdsEstadosSIGLA.Value)) <= 0 then
  begin

    edtSigla.SetFocus;
    Result := false;

  end
  else if Length(Trim(dmMProvider.cdsEstadosNOME.Value)) <= 0 then
  begin

    edtNome.SetFocus;
    Result := false;

  end
  else if dmMProvider.cdsEstadosCODIGO_ESTADO_IBGE.Value <= 0 then
  begin

    edtCodigoIBGE.SetFocus;
    Result := false;

  end;

end;

procedure TfrmEstados.WindowClose1Execute(Sender: TObject);
begin

  close;

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor; AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState,
      ACol, ARow)

end;

end.
