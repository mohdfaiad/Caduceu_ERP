unit manCtrlNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, System.DateUtils, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, System.Actions, Vcl.ActnList;

type

  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;

  TfrmCtrlNotas = class(TForm)
    imgSair: TImage;
    imgEditar: TImage;
    imgExcluir: TImage;
    imgSalvar: TImage;
    imgDesfazer: TImage;
    imgNovo: TImage;
    lblF6: TLabel;
    lblF5: TLabel;
    lblF4: TLabel;
    lblF3: TLabel;
    lblF2: TLabel;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    imgDuplicar: TImage;
    grpPerirodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    imgConfirmaPeriodo: TImage;
    imgExportarExcel: TImage;
    pgcCtrlNotas: TPageControl;
    tbsTabela: TTabSheet;
    tbsCadastro: TTabSheet;
    grdTabela: TDBGrid;
    grpCadastro: TGroupBox;
    lblDataEntrada: TLabel;
    lblFornecedor: TLabel;
    edtEntrada: TDBEdit;
    edtFornecedor: TDBEdit;
    edtRazaoSocial: TDBEdit;
    lblNumeroDocumento: TLabel;
    edtNumeroDocumento: TDBEdit;
    lblValorNF: TLabel;
    edtValorNF: TDBEdit;
    lblTipoUtilidade: TLabel;
    lblSetor: TLabel;
    lblObservacao: TLabel;
    edtObservacao: TDBEdit;
    ActionList1: TActionList;
    actEditar: TAction;
    actIncluir: TAction;
    actDesfazer: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    imgAddTipoUtil: TImage;
    cboTipoUtilidade: TDBLookupComboBox;
    imgIncluirSetor: TImage;
    cboSetorCtrlNotas: TDBLookupComboBox;
    actIncluirTipoUtil: TAction;
    actExportarCSV: TAction;
    Image1: TImage;
    grpIdentificacaoLancamento: TGroupBox;
    dbtInformacaoLancamento: TDBText;
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Montar_SQL_Pesquisa(pOpcao:smallint);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure dtpDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure imgConfirmaPeriodoClick(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtEntradaExit(Sender: TObject);
    procedure edtValorNFKeyPress(Sender: TObject; var Key: Char);
    procedure edtEntradaEnter(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure FecharTabelas;
    procedure edtFornecedorExit(Sender: TObject);
    procedure HabilitaControles(bOpcao:boolean);
    procedure imgAddTipoUtilClick(Sender: TObject);
    procedure imgIncluirSetorClick(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure lblF5Click(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExportarCSVExecute(Sender: TObject);
    procedure cboTipoUtilidadeExit(Sender: TObject);
    procedure cboSetorCtrlNotasExit(Sender: TObject);
    procedure imgImprimirClick(Sender: TObject);
    procedure imgDuplicarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtrlNotas: TfrmCtrlNotas;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, modPesquisaFornecedorCNPJRSocial,
  modPesquisaFornecedorNota, uFuncoes_BD, modTipoUilidade, modSetor,
  dataMRelatorios;

procedure TfrmCtrlNotas.actDesfazerExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    dmMProvider.cdsCtrlNotas.Cancel;
    HabilitaControles(False);
    edtConteudoPesquisa.SetFocus;;

  end;

end;

procedure TfrmCtrlNotas.actEditarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if not InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    dmMProvider.cdsCtrlNotas.Edit;
    HabilitaControles(True);
    pgcCtrlNotas.ActivePageIndex := 1;
    edtEntrada.SetFocus;

  end;

end;

procedure TfrmCtrlNotas.actExcluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if not InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    try

      Man_Tab_CtrlNotas(1);
      HabilitaControles(False);
      edtConteudoPesquisa.SetFocus;

    except

      on E: exception do
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
          Application.ProcessMessages;

        end;

    end;

  end;

end;

procedure TfrmCtrlNotas.actExportarCSVExecute(Sender: TObject);
begin

  if dmMProvider.cdsCtrlNotas.Active then
  begin

    if not InserindoEditando(dmMProvider.cdsCtrlNotas) then
    begin

      dmMProvider.cdsCtrlNotas.First;

      if ExportarCtrlNotas('Relatorio_Notas.csv') then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', arquivo gerado em ' + ExtractFilePath(ParamStr(0)) + 'CSV\Relatorio_Notas.csv';
        Application.ProcessMessages;

      end
      else
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', falha ao gerar arquivo ' + ExtractFilePath(ParamStr(0)) + 'CSV\Relatorio_Notas.csv';
        Application.ProcessMessages;

      end;

    end;

  end;

end;

procedure TfrmCtrlNotas.actIncluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  try

    if not InserindoEditando(dmMProvider.cdsCtrlNotas) then
    begin

      frmPesquisaFornecedorNota := TfrmPesquisaFornecedorNota.Create(self);
      if frmPesquisaFornecedorNota.ShowModal = mrOk then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
        Application.ProcessMessages;

        if not AbrirTabelaCtrlNotas('where fornecedor = ' + IntToStr(dmMProvider.cdsPesqFornecedorFORNECEDOR.Value) + ' and numero_documento = ' + QuotedStr(Trim(frmPesquisaFornecedorNota.edtNumeroNF.Text))) then
        begin

          pgcCtrlNotas.ActivePageIndex := 1;

          dmMProvider.cdsCtrlNotas.Append;
          dmMProvider.cdsCtrlNotasFORNECEDOR.Value            := dmMProvider.cdsPesqFornecedorFORNECEDOR.Value;
          dmMProvider.cdsCtrlNotasNUMERO_DOCUMENTO.Value      := Trim(frmPesquisaFornecedorNota.edtNumeroNF.Text);
          HabilitaControles(True);
          edtEntrada.SetFocus;

        end;

      end;

    end;

  except

    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmCtrlNotas.actSalvarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    ActiveControl := nil;

    try

      Man_Tab_CtrlNotas(0);
      HabilitaControles(False);
      edtConteudoPesquisa.SetFocus;

    except

      on E: exception do
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
          Application.ProcessMessages;

        end;

    end;

  end;

end;

procedure TfrmCtrlNotas.cboSetorCtrlNotasExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
    dmMProvider.cdsCtrlNotasDESCRICAO_SETOR.Value := cboSetorCtrlNotas.Text;

end;

procedure TfrmCtrlNotas.cboTipoUtilidadeExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
    dmMProvider.cdsCtrlNotasDESCRICAO_TIPO_UTILIDADE.Value := cboTipoUtilidade.Text;

end;

procedure TfrmCtrlNotas.dtpDataInicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iDirecao: Integer;
begin

  //habilita movimenta��o dos campos com as setas acima/abaixo
  iDirecao := -1;
  case Key of
    VK_DOWN: iDirecao := 0; {Pr�ximo}
    VK_UP: iDirecao := 1;   {Anterior}
  end;
  if iDirecao <> -1 then
  begin
    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;
  end;

end;

procedure TfrmCtrlNotas.dtpDataInicialKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmCtrlNotas.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmCtrlNotas.edtConteudoPesquisaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if rdpOpcoesPesquisa.ItemIndex = 0 then
  begin

    if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
      Montar_SQL_Pesquisa(rdpOpcoesPesquisa.ItemIndex);

  end;

end;

procedure TfrmCtrlNotas.edtEntradaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmCtrlNotas.edtEntradaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    try

      dmMProvider.cdsCtrlNotasDATA_ENTRADA.Value := StrToDate(Trim(edtEntrada.Text));

    except
      on E: exception do
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_DATA_INVALIDA;
          Application.ProcessMessages;
          edtEntrada.SetFocus;

        end;
    end;

  end;

end;

procedure TfrmCtrlNotas.edtFornecedorExit(Sender: TObject);
begin
{
  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    if dmMProvider.cdsCtrlNotasFORNECEDOR.Value <= 0 then
    begin

      frmPesquisaFornecedor := TfrmPesquisaFornecedor.Create(self);
      if frmPesquisaFornecedor.ShowModal = mrOk then
        dmMProvider.cdsCtrlNotasFORNECEDOR.Value := dmMProvider.cdsFornecedorFORNECEDOR.Value;

    end
    else
    begin

      if not PesquisarFornecedor('where fornecedor = ' + IntToStr(dmMProvider.cdsCtrlNotasFORNECEDOR.Value)) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' C�digo ' + IntToStr(dmMProvider.cdsCtrlNotasFORNECEDOR.Value);
        Application.ProcessMessages;
        edtFornecedor.SetFocus;

      end;

    end;

  end;
}
end;

procedure TfrmCtrlNotas.edtValorNFKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmCtrlNotas.FecharTabelas;
begin

  dmMProvider.cdsCtrlNotas.Close;

end;

procedure TfrmCtrlNotas.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  pgcCtrlNotas.ActivePageIndex  := 0;

  Caption                       := ' ' + Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(ParamStr(0),1);

  CriarPasta(ExtractFilePath(ParamStr(0)) + 'CSV\');

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := paramstr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

  dtpDataInicial.Date       := StartOfTheMonth(Date);
  dtpDataFinal.Date         := EndOfTheMonth(Date);

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  AbrirTabelaTipoUtilidadeCtrlNotas(0, null);
  AbrirTabelaSetorCtrlNotas(0,'');

end;

procedure TfrmCtrlNotas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmCtrlNotas.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCtrlNotas.grdTabelaDblClick(Sender: TObject);
begin

  pgcCtrlNotas.ActivePageIndex := 1;

end;

procedure TfrmCtrlNotas.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not odd(dmMProvider.cdsCtrlNotas.RecNo) then
  begin

    grdTabela.Canvas.Font.Color:= clBlack;
    grdTabela.Canvas.Brush.Color:= COR_ZEBRA_GRADE;

  end
  else
  begin

    grdTabela.Canvas.Font.Color:= clBlack;
    grdTabela.Canvas.Brush.Color:= clWhite;

  end;

  grdTabela.Canvas.FillRect(Rect);
  grdTabela.DefaultDrawDataCell(Rect,Column.Field,State);

end;

procedure TfrmCtrlNotas.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(self);

end;

procedure TfrmCtrlNotas.HabilitaControles(bOpcao: boolean);
begin

  grpCadastro.Enabled := bOpcao;

end;

procedure TfrmCtrlNotas.imgAddTipoUtilClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    frmTipoUtilidade := TfrmTipoUtilidade.Create(self);
    if frmTipoUtilidade.ShowModal = mrOk then
    begin

      AbrirTabelaTipoUtilidadeCtrlNotas(1, null);

      dmMProvider.cdsCtrlNotasTIPO_UTILIDADE.Value            := dmDBEXMaster.fdqTipoUtilCtrlNotas.FieldByName('TIPO_UTIL_CTRL_NOTAS').Value;

      AbrirTabelaTipoUtilidadeCtrlNotas(2, 'where tipo_util_ctrl_Notas = ' + IntToStr(dmMProvider.cdsCtrlNotasTIPO_UTILIDADE.Value));

      dmMProvider.cdsCtrlNotasDESCRICAO_TIPO_UTILIDADE.Value  := dmMProvider.cdsTipoUtilCtrlNotasDESCRICAO.Value;

      dmDBEXMaster.fdqTipoUtilCtrlNotas.Close;

      AbrirTabelaTipoUtilidadeCtrlNotas(0, null);

    end;

  end;

end;

procedure TfrmCtrlNotas.imgConfirmaPeriodoClick(Sender: TObject);
begin

  if rdpOpcoesPesquisa.ItemIndex = 2 then
    Montar_SQL_Pesquisa(rdpOpcoesPesquisa.ItemIndex);

end;

procedure TfrmCtrlNotas.imgDuplicarClick(Sender: TObject);
begin

  DuplicarRegistro(dmMProvider.cdsCtrlNotas);
  dmMProvider.cdsCtrlNotasNUMERO_DOCUMENTO.Value  := '';
  dmMProvider.cdsCtrlNotasTIPO_LANCAMENTO.Value   := 1;
  pgcCtrlNotas.ActivePageIndex := 1;
  HabilitaControles(True);
  edtEntrada.SetFocus;

end;

procedure TfrmCtrlNotas.imgImprimirClick(Sender: TObject);
begin

  if not dmMProvider.cdsCtrlNotas.IsEmpty then
  begin

    if not InserindoEditando(dmMProvider.cdsCtrlNotas) then
    begin

      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;

      LimparMSG_ERRO(lblMsg, nil);

      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
      begin

        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
        dmRelatorios.rvpGenesisAC.SelectReport('rptCtrlNotas',true);
        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',dmMProvider.cdsFilialFANTASIA.Value);
        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\logomarca.bmp');

        case rdpOpcoesPesquisa.ItemIndex of
          1:dmRelatorios.rvpGenesisAC.SetParam('pPeriodo','Fornecedor: ' + dmMProvider.cdsCtrlNotasRAZAO_SOCIAL.Value);
          2:dmRelatorios.rvpGenesisAC.SetParam('pPeriodo','Per�odo entre : ' + FormatDateTime('dd/mm/yyyy', dtpDataInicial.Date) + ' e ' + FormatDateTime('dd/mm/yyyy', dtpDataFinal.Date));
        end;

        dmRelatorios.rvpGenesisAC.Execute;
        dmRelatorios.rvpGenesisAC.Close;

      end
      else
        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
        + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

    end;

  end;
end;

procedure TfrmCtrlNotas.imgIncluirSetorClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsCtrlNotas) then
  begin

    frmSetores := TfrmSetores.Create(self);
    if frmSetores.ShowModal = mrOk then
    begin

      AbrirTabelaSetorCtrlNotas(1,null);

      if dmDBEXMaster.fdqSetorCtrlNotas.FieldByName('SETOR_CTRL_NOTAS').Value > 0 then
        dmMProvider.cdsCtrlNotasSETOR.Value := dmDBEXMaster.fdqSetorCtrlNotas.FieldByName('SETOR_CTRL_NOTAS').Value
      else
      begin

        AbrirTabelaSetorCtrlNotas(2,'where setor_ctrl_notas = ' + IntToStr(dmMProvider.cdsCtrlNotasSETOR.Value));
        dmMProvider.cdsCtrlNotasSETOR.Value := dmMProvider.cdsSetorCtrlNotasSETOR_CTRL_NOTAS.Value;

      end;

      dmMProvider.cdsCtrlNotasDESCRICAO_SETOR.Value := dmMProvider.cdsSetorCtrlNotasDESCRICAO.Value;
      dmDBEXMaster.fdqSetorCtrlNotas.Close;

      AbrirTabelaSetorCtrlNotas(0, null);

    end;

  end;

end;

procedure TfrmCtrlNotas.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmCtrlNotas.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsCtrlNotas.Active then
  begin

    if not InserindoEditando(dmMProvider.cdsCtrlNotas) then
    begin

      LimparMSG_ERRO(lblMsg, nil);

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmCtrlNotas.Montar_SQL_Pesquisa(pOpcao: smallint);
var
  sWhere:string;
begin

  try

    LimparMSG_ERRO(lblMsg, nil);

    dmMProvider.cdsCtrlNotas.Close;
    dmMProvider.cdsCtrlNotas.ProviderName := 'dspCtrlNotas';

    dmDBEXMaster.fdqCtrlNotas.SQL.Clear;
    dmDBEXMaster.fdqCtrlNotas.SQL.Add('select * from ctrl_notas');

    case pOpcao of
      0:sWhere := 'where numero_documento = ' + QuotedStr(edtConteudoPesquisa.Text);
      1:sWhere := 'where fornecedor = ' + IntToStr(dmMProvider.cdsFornecedorFORNECEDOR.Value);
      2:sWhere := 'where data_entrada between ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtpDataInicial.Date)) + ' and ' + QuotedStr(FormatDateTime('mm/dd/yyyy',dtpDataFinal.Date));
    end;

    if (pOpcao >= 0) then
      dmDBEXMaster.fdqCtrlNotas.SQL.Add(sWhere);

    dmDBEXMaster.fdqCtrlNotas.SQL.Add('order by data_entrada');
    dmMProvider.cdsCtrlNotas.Open;
    dmMProvider.cdsCtrlNotas.ProviderName := '';

    if (pOpcao >= 0) and  (dmMProvider.cdsCtrlNotas.IsEmpty) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      Application.ProcessMessages;
      edtConteudoPesquisa.SetFocus;

    end
    else if (pOpcao >= 0) then
    begin

      edtConteudoPesquisa.Clear;
      pgcCtrlNotas.ActivePageIndex := 0;
      grdTabela.SetFocus;

    end;

  except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmCtrlNotas.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.Clear;

  case rdpOpcoesPesquisa.ItemIndex of
    0:edtConteudoPesquisa.SetFocus;
    1:begin

        frmPesquisaFornecedor     := TfrmPesquisaFornecedor.Create(self);
        frmPesquisaFornecedor.Tag := 1;

        if frmPesquisaFornecedor.ShowModal = mrOk then
          Montar_SQL_Pesquisa(rdpOpcoesPesquisa.ItemIndex);

        FreeAndNil(frmPesquisaFornecedor);

      end;
    2:dtpDataInicial.SetFocus;

  end;

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
