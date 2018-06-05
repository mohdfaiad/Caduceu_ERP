unit modApuracaoICMS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, 
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, 
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, 
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, 
  System.Classes, Vcl.Controls, Vcl.Grids, Data.FMTBcd, Vcl.Menus, 
  System.Actions, Vcl.ActnList, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, 
  Vcl.DBGrids, Vcl.ToolWin, System.DateUtils, FireDAC.DBX.Migrate;

type
  TfrmApuracaoICMS = class(TForm)
    pgcLivroFiscalSaida: TPageControl;
    tbsCadastro: TTabSheet;
    grpEmpresa: TGroupBox;
    lblRSocial: TLabel;
    lblInscrEstadual: TLabel;
    lblCnpj: TLabel;
    lblMesAnoReferencia: TLabel;
    edtRSocial: TEdit;
    edtInscrEstadual: TEdit;
    edtCNPJ: TEdit;
    edtMesAnoReferencia: TEdit;
    stbAtalho: TStatusBar;
    Panel2: TPanel;
    Panel1: TPanel;
    stgTotaisCfopEstadualE: TStringGrid;
    Panel3: TPanel;
    edtTVContalbilEST: TEdit;
    edtTBCalculoEst: TEdit;
    edtCreditoEst: TEdit;
    edtIsentasNTEst: TEdit;
    edtOutrasEst: TEdit;
    Panel4: TPanel;
    edtTVContalbilinter: TEdit;
    edtTBCalculoInter: TEdit;
    edtCreditoInter: TEdit;
    edtIsentasNTInter: TEdit;
    edtOutrasInter: TEdit;
    actApuracaoICMS: TActionList;
    actSair: TAction;
    actImprimirApuracao: TAction;
    stgTotaisCfopEstadualS: TStringGrid;
    Panel5: TPanel;
    edtTVContalbilEST_S: TEdit;
    edtTBCalculoeST_S: TEdit;
    edtDebitoEst: TEdit;
    edtIsentasNTEst_S: TEdit;
    edtOutrasEst_S: TEdit;
    Panel6: TPanel;
    edtTVContalbilinter_S: TEdit;
    edtTBCalculoInter_S: TEdit;
    edtDebitoInter: TEdit;
    edtIsentasNTInter_S: TEdit;
    edtOutrasInter_S: TEdit;
    Panel7: TPanel;
    fdqSelecionaPeriodo: TFDQuery;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    grpMesAno: TGroupBox;
    grpPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    btnIprimirApuracao: TButton;
    Button2: TButton;
    Button3: TButton;
    fdqTotalizaBCalculoE: TFDQuery;
    fdqTotalizaCredito_E: TFDQuery;
    fdqTotalizaIsentasNT_E: TFDQuery;
    fdqTotalizaOutras_E: TFDQuery;
    fdqTotalBCalculoEstadual_E: TFDQuery;
    fdqTotalICreditadoEstadual_E: TFDQuery;
    fdqTotalIsentasNTEstadual_E: TFDQuery;
    fdqTotalOutrasEstadual_E: TFDQuery;
    fdqTotalizaVContabil_IE: TFDQuery;
    fdqTotalizaBCalculo_IE: TFDQuery;
    fdqTotalICreditadoEstadual_IE: TFDQuery;
    fdqTotalIsentasNTEstadual_IE: TFDQuery;
    fdqTotalOutrasEstadual_IE: TFDQuery;
    fdqTotalizaVContabilS: TFDQuery;
    fdqTotalizaBCalculoS: TFDQuery;
    fdqTotalizaDebito_S: TFDQuery;
    fdqTotalizaIsentasNT_S: TFDQuery;
    fdqTotalizaOutras_S: TFDQuery;
    fdqTotalVLContEstadual_S: TFDQuery;
    fdqTotalBCalculoEstadual_S: TFDQuery;
    fdqTotalIDebitadoEstadual_S: TFDQuery;
    fdqTotalIsentasNTEstadual_S: TFDQuery;
    fdqTotalOutrasEstadual_S: TFDQuery;
    fdqTotalizaVContabil_IE_S: TFDQuery;
    fdqTotalizaBCalculo_IE_S: TFDQuery;
    fdqTotalIDebitadoEstadual_IE_S: TFDQuery;
    fdqTotalIsentasNTEstadual_IE_S: TFDQuery;
    fdqTotalOutrasEstadual_IE_S: TFDQuery;
    pnlMsgAguarde: TPanel;
    actImprimirResumoApuracao: TAction;
    fdqDataApuracao: TFDQuery;
    fdqTotalVLContEstadual_E: TFDQuery;
    cboPeriodoApuracao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure stbAtalhoDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure edtDataInicialEnter(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure edtDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataFinalExit(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure edtPesquisaEnter(Sender: TObject);
    procedure edtPesquisaExit(Sender: TObject);
    procedure cboPeriodoApuracaoExit(Sender: TObject);
    procedure actImprimirApuracaoExecute(Sender: TObject);
    procedure actImprimirResumoApuracaoExecute(Sender: TObject);
  private
    { Private declarations }
    sWhere: string;
    iLinha:integer;
    procedure Totalizar_Valores_Entradas(pOpcao: smallint);
    procedure Totalizar_Valores_Saidas(pOpcao: smallint);
    procedure TotalizarValoresEstaduais(pOpcao: Smallint);
    procedure TotalizaValoresInterEstaduais(pOpcao: Smallint);
    procedure TotalizaValoresSaidas(pOpcao: Smallint);
    procedure TotalizaSaidasEstatuais(pOpcao: Smallint);
    procedure TotalizaSaidasInterEstaduais(pOpcao: Smallint);
  public
    { Public declarations }
  end;

var
  frmApuracaoICMS: TfrmApuracaoICMS;

implementation

{$R *.dfm}

uses
  dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource, dataMSProcedure, 
  uConstantes_Padrao, uFuncoes;

procedure TfrmApuracaoICMS.actImprimirApuracaoExecute(Sender: TObject);
begin

  Tag := 0;

  if not dmMProvider.cdsTotalizaVContabilE.IsEmpty then
  begin

    if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
    begin

      dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
      dmRelatorios.rvpGenesisAC.SelectReport('rptApuracaoICMS_P9',true);
      dmRelatorios.rvpGenesisAC.SetParam('pReferenciaLivro',RetornaPeriodoReferencia(fdqDataApuracao.FieldByName('DATA_ENTRADA').Value));
      dmRelatorios.rvpGenesisAC.Execute;
      dmRelatorios.rvpGenesisAC.Close;

    end
    else
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
      + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

  end;

end;

procedure TfrmApuracaoICMS.actImprimirResumoApuracaoExecute(Sender: TObject);
begin

  if not dmDBEXMaster.fdqTotalizaVContabilE.IsEmpty then
//    ImprimirResumoApuracao;

end;

procedure TfrmApuracaoICMS.actSairExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmApuracaoICMS.cboPeriodoApuracaoExit(Sender: TObject);
begin

  if cboPeriodoApuracao.Text <> '' then
  begin

    Totalizar_Valores_Entradas(1);
    Totalizar_Valores_Saidas(1);

    fdqDataApuracao.Close;
    fdqDataApuracao.SQL.Clear;
    fdqDataApuracao.SQL.Add('SELECT DATA_ENTRADA FROM LIVRO_ENTRADA WHERE MES_ANO = ' + QuotedStr(cboPeriodoApuracao.Text));
    fdqDataApuracao.Open;

  end;

end;

procedure TfrmApuracaoICMS.edtDataFinalEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmApuracaoICMS.edtDataFinalExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  try
    if edtDataFinal.Text <> '  /  /    ' then
    begin

      edtDataFinal.Text := FormatDateTime('dd/mm/yyyy',
        StrToDate(edtDataFinal.Text));

      Totalizar_Valores_Entradas(0);
      Totalizar_Valores_Saidas(0);

    end;
  except
    Application.MessageBox('Data inv�lida', 'Aten��o',
      mb_IconInformation + mb_Ok);
    edtDataFinal.SetFocus;
  end;

end;

procedure TfrmApuracaoICMS.edtDataInicialEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmApuracaoICMS.edtDataInicialExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  try
    if edtDataInicial.Text <> '  /  /    ' then
      edtDataInicial.Text := FormatDateTime('dd/mm/yyyy',
        StrToDate(edtDataInicial.Text));
  except
    Application.MessageBox('Data inv�lida', 'Aten��o',
      mb_IconInformation + mb_Ok);
    edtDataInicial.SetFocus;
  end;

end;

procedure TfrmApuracaoICMS.edtDataInicialKeyDown(Sender: TObject;
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

procedure TfrmApuracaoICMS.edtDataInicialKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);
  end;

end;

procedure TfrmApuracaoICMS.edtPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmApuracaoICMS.edtPesquisaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if edtPesquisa.Text <> '' then
  begin

    Totalizar_Valores_Entradas(2);
    Totalizar_Valores_Saidas(2);

  end;

end;

procedure TfrmApuracaoICMS.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);

  Caption                             := Application.Title + ' - ' + RetornarVersao(Application.ExeName, 1);

  pgcLivroFiscalSaida.ActivePageIndex := 0;

  dmDBEXMaster.sNomeUsuario           := ParamStr(1);
  dmDBEXMaster.sSenha                 := ParamStr(2);
  dmDBEXMaster.iIdUsuario             := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial              := StrToInt(ParamStr(4));

  edtRSocial.Text                     := dmMProvider.cdsFilialRAZAOSOCIAL.Value;
  edtInscrEstadual.Text               := dmMProvider.cdsFilialINSCRICAO.Value;
  edtCNPJ.Text                        := FormatarCNPJCPF(dmMProvider.cdsFilialCNPJ.Value);

  fdqSelecionaPeriodo.Open;

  while not fdqSelecionaPeriodo.Eof do
  begin

    cboPeriodoApuracao.Items.Add(fdqSelecionaPeriodo.FieldByName('MES_ANO').AsString);
    fdqSelecionaPeriodo.Next;

  end;

  stgTotaisCfopEstadualE.Cols[0].Text := 'Cfop';
  stgTotaisCfopEstadualE.Cols[1].Text := 'Descri��o Cfop';
  stgTotaisCfopEstadualE.Cols[2].Text := 'Vlr Cont�bil';
  stgTotaisCfopEstadualE.Cols[3].Text := 'B.C�lculo';
  stgTotaisCfopEstadualE.Cols[4].Text := 'Cr�dito';
  stgTotaisCfopEstadualE.Cols[5].Text := 'Isentas/NT';
  stgTotaisCfopEstadualE.Cols[6].Text := 'Outras';

  stgTotaisCfopEstadualS.Cols[0].Text := 'Cfop';
  stgTotaisCfopEstadualS.Cols[1].Text := 'Descri��o Cfop';
  stgTotaisCfopEstadualS.Cols[2].Text := 'Vlr Cont�bil';
  stgTotaisCfopEstadualS.Cols[3].Text := 'B.C�lculo';
  stgTotaisCfopEstadualS.Cols[4].Text := 'D�bito';
  stgTotaisCfopEstadualS.Cols[5].Text := 'Isentas/NT';
  stgTotaisCfopEstadualS.Cols[6].Text := 'Outras';

end;

procedure TfrmApuracaoICMS.TotalizarValoresEstaduais(pOpcao: Smallint);
begin

  dmMProvider.cdsTotalizaValoresEST.Close;
  dmMProvider.cdsTotalizaValoresEST.ProviderName := 'dspTotalizaValoresEST';

  dmDBEXMaster.fdqTotalizaVContabilE.Params[0].Value := pOpcao;

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    dmDBEXMaster.fdqTotalizaVContabilE.Params[4].Value :=  FormatdateTime('mmyyyy',StrToDate(edtDataInicial.Text))
  else if Length(Trim(cboPeriodoApuracao.Text)) > 0 then
    dmDBEXMaster.fdqTotalizaVContabilE.Params[4].Value := cboPeriodoApuracao.Text;

  dmDBEXMaster.fdqTotalizaVContabilE.Params[5].Value := dmMProvider.cdsFilialESTADO.Value;

  dmMProvider.cdsTotalizaValoresEST.Open;
  dmMProvider.cdsTotalizaValoresEST.ProviderName := '';

  edtTVContalbilEST.Text  := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresESTOP_VALOR_CONTABIL.Value);
  edtTBCalculoEst.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresESTOP_BASE_CALCULO.Value);
  edtCreditoEst.Text      := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresESTOP_IMPOSTO_CREDITADO.Value);
  edtIsentasNTEst.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresESTOP_ISENTAS_NT.Value);
  edtOutrasEst.Text       := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresESTOP_OUTRAS.Value);

end;

procedure TfrmApuracaoICMS.TotalizaValoresInterEstaduais(pOpcao: Smallint);
begin

  dmMProvider.cdsTotalizaValoresINTER.Close;
  dmMProvider.cdsTotalizaValoresINTER.ProviderName := 'dspTotalizaValoresINTER';

  dmDBEXMaster.fdqTotalizaVContabilE.Params[0].Value := pOpcao;

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    dmDBEXMaster.fdqTotalizaVContabilE.Params[4].Value :=  FormatdateTime('mmyyyy',StrToDate(edtDataInicial.Text))
  else if Length(Trim(cboPeriodoApuracao.Text)) > 0 then
    dmDBEXMaster.fdqTotalizaVContabilE.Params[4].Value := cboPeriodoApuracao.Text;

  dmDBEXMaster.fdqTotalizaVContabilE.Params[5].Value := dmMProvider.cdsFilialESTADO.Value;

  dmMProvider.cdsTotalizaValoresINTER.Open;
  dmMProvider.cdsTotalizaValoresINTER.ProviderName := '';

  edtTVContalbilinter.Text  := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTEROP_VALOR_CONTABIL.Value);
  edtTBCalculoInter.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTEROP_BASE_CALCULO.Value);
  edtCreditoInter.Text      := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTEROP_IMPOSTO_CREDITADO.Value);
  edtIsentasNTInter.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTEROP_ISENTAS_NT.Value);
  edtOutrasInter.Text       := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTEROP_OUTRAS.Value);

end;

procedure TfrmApuracaoICMS.TotalizaValoresSaidas(pOpcao: Smallint);
begin

  dmMProvider.cdsTotalizaVContabilS.Close;
  dmMProvider.cdsTotalizaVContabilS.ProviderName     := 'dspTotalizaVContabilS';

  dmDBEXMaster.fdqTotalizaVContabilS.Params[0].Value := pOpcao;

  case pOpcao of
    0:begin

        dmDBEXMaster.fdqTotalizaVContabilS.Params[1].Value := StrToDate(edtDataInicial.Text);
        dmDBEXMaster.fdqTotalizaVContabilS.Params[2].Value := StrToDate(edtDataFinal.Text);

      end;
    1:dmDBEXMaster.fdqTotalizaVContabilS.Params[4].Value := cboPeriodoApuracao.Text;
    2:dmDBEXMaster.fdqTotalizaVContabilS.Params[3].Value := edtPesquisa.Text;
  end;

  dmMProvider.cdsTotalizaVContabilS.Open;
  dmMProvider.cdsTotalizaVContabilS.ProviderName := '';

  while not dmMProvider.cdsTotalizaVContabilS.Eof do
  begin

    stgTotaisCfopEstadualS.Cells[0, stgTotaisCfopEstadualS.RowCount - 1] := dmMProvider.cdsTotalizaVContabilSOP_CFOP.Value;
    stgTotaisCfopEstadualS.Cells[1, stgTotaisCfopEstadualS.RowCount - 1] := Format('%-30.30s', [dmMProvider.cdsTotalizaVContabilSOP_DESCRICAO_CFOP.Value]);
    stgTotaisCfopEstadualS.Cells[2, stgTotaisCfopEstadualS.RowCount - 1] := Format('%12.12s', [FormatFloat('#,##0.00', dmMProvider.cdsTotalizaVContabilSOP_VALOR_CONTABIL.Value)]);
    stgTotaisCfopEstadualS.Cells[3, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00', dmMProvider.cdsTotalizaVContabilSOP_BASE_CALCULO.Value)]);
    stgTotaisCfopEstadualS.Cells[4, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00', dmMProvider.cdsTotalizaVContabilSOP_IMPOSTO_DEBITADO.Value)]);
    stgTotaisCfopEstadualS.Cells[5, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00', dmMProvider.cdsTotalizaVContabilSOP_ISENTAS_NT.Value)]);
    stgTotaisCfopEstadualS.Cells[6, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00', dmMProvider.cdsTotalizaVContabilSOP_OUTRAS.Value)]);

    if not dmMProvider.cdsTotalizaVContabilS.Eof then
      stgTotaisCfopEstadualS.RowCount := stgTotaisCfopEstadualS.RowCount + 1;

    dmMProvider.cdsTotalizaVContabilS.Next;

  end;

end;

procedure TfrmApuracaoICMS.TotalizaSaidasEstatuais(pOpcao: Smallint);
begin

  dmMProvider.cdsTotalizaValoresEST_S.Close;
  dmMProvider.cdsTotalizaValoresEST_S.ProviderName      := 'dspTotalizaValoresEST_S';

  dmDBEXMaster.fdqTotalizaVContabilS.Params[0].Value  := pOpcao;

  case pOpcao of
    0:begin

        dmDBEXMaster.fdqTotalizaVContabilS.Params[1].Value := StrToDate(edtDataInicial.Text);
        dmDBEXMaster.fdqTotalizaVContabilS.Params[2].Value := StrToDate(edtDataFinal.Text);

      end;
    1:dmDBEXMaster.fdqTotalizaVContabilS.Params[4].Value := cboPeriodoApuracao.Text;
    2:dmDBEXMaster.fdqTotalizaVContabilS.Params[3].Value := edtPesquisa.Text;
  end;

  dmDBEXMaster.fdqTotalizaVContabilS.Params[5].Value := dmMProvider.cdsFilialESTADO.Value;

  dmMProvider.cdsTotalizaValoresEST_S.Open;
  dmMProvider.cdsTotalizaValoresEST_S.ProviderName := '';

  edtOutrasEst_S.Text       := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresEST_SOP_OUTRAS.Value);
  edtTVContalbilEST_S.Text  := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresEST_SOP_VALOR_CONTABIL.Value);
  edtTBCalculoeST_S.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresEST_SOP_BASE_CALCULO.Value);
  edtDebitoEst.Text         := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresEST_SOP_IMPOSTO_DEBITADO.Value);
  edtIsentasNTEst_S.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresEST_SOP_ISENTAS_NT.Value);
  edtOutrasEst_S.Text       := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresEST_SOP_OUTRAS.Value);

end;

procedure TfrmApuracaoICMS.TotalizaSaidasInterEstaduais(pOpcao: Smallint);
begin

  dmMProvider.cdsTotalizaValoresINTER_S.Close;
  dmMProvider.cdsTotalizaValoresINTER_S.ProviderName := 'dspTotalizaValoresINTER_S';

  dmDBEXMaster.fdqTotalizaVContabilS.Params[0].Value := pOpcao;

  case pOpcao of
    0:begin

        dmDBEXMaster.fdqTotalizaVContabilS.Params[1].Value := StrToDate(edtDataInicial.Text);
        dmDBEXMaster.fdqTotalizaVContabilS.Params[2].Value := StrToDate(edtDataFinal.Text);

      end;
    1:dmDBEXMaster.fdqTotalizaVContabilS.Params[4].Value := cboPeriodoApuracao.Text;
    2:dmDBEXMaster.fdqTotalizaVContabilS.Params[3].Value := edtPesquisa.Text;

  end;

  dmDBEXMaster.fdqTotalizaVContabilS.Params[5].Value := dmMProvider.cdsFilialESTADO.Value;

  dmMProvider.cdsTotalizaValoresINTER_S.Open;
  dmMProvider.cdsTotalizaValoresINTER_S.ProviderName := '';

  edtTVContalbilinter_S.Text  := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTER_SOP_VALOR_CONTABIL.Value);
  edtTBCalculoInter.Text      := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTER_SOP_BASE_CALCULO.Value);
  edtDebitoInter.Text         := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTER_SOP_IMPOSTO_DEBITADO.Value);
  edtIsentasNTInter_S.Text    := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTER_SOP_ISENTAS_NT.Value);
  edtOutrasInter_S.Text       := FormatFloat('#,##0.00', dmMProvider.cdsTotalizaValoresINTER_SOP_OUTRAS.Value);

end;


procedure TfrmApuracaoICMS.stbAtalhoDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin

  with stbAtalho.Canvas do
  begin
    FillRect(Rect);

    {

      define estilo da fonte

      }

    Font.Name := 'Arial';
    Font.Size := 8;
    Font.Style := [fsBold];

    // Desenha as imagens de acordo com o indice de cada panel
    if Panel.Index < 5 then
      dmDBEXMaster.imgHot.Draw(stbAtalho.Canvas, Rect.Left + 5, Rect.Top + 1,
        Panel.Index);

    // Escreve o texto em cada panel
    if Panel.Index = 0 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F2-Incluir');

    if Panel.Index = 1 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F3-Desfazer');

    if Panel.Index = 2 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F4-Salvar');

    if Panel.Index = 3 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F5-Excluir');

    if Panel.Index = 4 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F6-Editar');

  end;

end;

procedure TfrmApuracaoICMS.Totalizar_Valores_Entradas(pOpcao: smallint);
var
  i:integer;
begin

  for i := 0 to stgTotaisCfopEstadualE.RowCount - 1 do
    stgTotaisCfopEstadualE.Rows[i].Clear;

  stgTotaisCfopEstadualE.RowCount := 2;
  stgTotaisCfopEstadualE.Cols[0].Text := 'Cfop';
  stgTotaisCfopEstadualE.Cols[1].Text := 'Descri��o Cfop';
  stgTotaisCfopEstadualE.Cols[2].Text := 'Vlr Cont�bil';
  stgTotaisCfopEstadualE.Cols[3].Text := 'B.C�lculo';
  stgTotaisCfopEstadualE.Cols[4].Text := 'Cr�dito';
  stgTotaisCfopEstadualE.Cols[5].Text := 'Isentas/NT';
  stgTotaisCfopEstadualE.Cols[6].Text := 'Outras';

  dmMProvider.cdsTotalizaVContabilE.Close;
  dmMProvider.cdsTotalizaVContabilE.ProviderName := 'dspTotalizaVContabilE';

  dmDBEXMaster.fdqTotalizaVContabilE.Params[0].Value := pOpcao;

  case pOpcao of
    0:begin

        dmDBEXMaster.fdqTotalizaVContabilE.Params[1].Value := StrToDate(edtDataInicial.Text);
        dmDBEXMaster.fdqTotalizaVContabilE.Params[2].Value := StrToDate(edtDataFinal.Text);

      end;

    1:dmDBEXMaster.fdqTotalizaVContabilE.Params[4].Value := cboPeriodoApuracao.Text;
    2:dmDBEXMaster.fdqTotalizaVContabilE.Params[3].Value := edtPesquisa.Text;
  end;

  dmMProvider.cdsTotalizaVContabilE.Open;
  dmMProvider.cdsTotalizaVContabilE.ProviderName := '';

  while not dmMProvider.cdsTotalizaVContabilE.Eof do
  begin

    stgTotaisCfopEstadualE.Cells[0, stgTotaisCfopEstadualE.RowCount - 1] := dmMProvider.cdsTotalizaVContabilEOP_CFOP.Value;
    stgTotaisCfopEstadualE.Cells[1, stgTotaisCfopEstadualE.RowCount - 1] := Format('%-30.30s',[dmMProvider.cdsTotalizaVContabilEOP_DESCRICAO_CFOP.Value]);
    stgTotaisCfopEstadualE.Cells[2, stgTotaisCfopEstadualE.RowCount - 1] := Format('%12.12s', [FormatFloat('#,##0.00',dmMProvider.cdsTotalizaVContabilEOP_VALOR_CONTABIL.Value)]);
    stgTotaisCfopEstadualE.Cells[3, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',dmMProvider.cdsTotalizaVContabilEOP_BASE_CALCULO.Value)]);
    stgTotaisCfopEstadualE.Cells[4, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',dmMProvider.cdsTotalizaVContabilEOP_IMPOSTO_CREDITADO.Value)]);
    stgTotaisCfopEstadualE.Cells[5, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',dmMProvider.cdsTotalizaVContabilEOP_ISENTAS_NT.Value)]);
    stgTotaisCfopEstadualE.Cells[6, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',dmMProvider.cdsTotalizaVContabilEOP_OUTRAS.Value)]);

    if not dmMProvider.cdsTotalizaVContabilE.Eof then
      stgTotaisCfopEstadualE.RowCount := stgTotaisCfopEstadualE.RowCount + 1;

    dmMProvider.cdsTotalizaVContabilE.Next;

  end;

  { TODO : retirar isso - coloquei apenas para n�o prosseguir }

  TotalizarValoresEstaduais(3);
  TotalizaValoresInterEstaduais(4);

end;

procedure TfrmApuracaoICMS.Totalizar_Valores_Saidas(pOpcao: smallint);
var
  i:integer;
begin

  for i := 0 to stgTotaisCfopEstadualS.RowCount - 1 do
    stgTotaisCfopEstadualS.Rows[i].Clear;

  stgTotaisCfopEstadualS.RowCount := 2;

  stgTotaisCfopEstadualS.Cols[0].Text := 'Cfop';
  stgTotaisCfopEstadualS.Cols[1].Text := 'Descri��o Cfop';
  stgTotaisCfopEstadualS.Cols[2].Text := 'Vlr Cont�bil';
  stgTotaisCfopEstadualS.Cols[3].Text := 'B.C�lculo';
  stgTotaisCfopEstadualS.Cols[4].Text := 'D�bito';
  stgTotaisCfopEstadualS.Cols[5].Text := 'Isentas/NT';
  stgTotaisCfopEstadualS.Cols[6].Text := 'Outras';

  TotalizaValoresSaidas(pOpcao);
  TotalizaSaidasEstatuais(3);//estaduais
  TotalizaSaidasInterEstaduais(4);//interestaduais

end;

end.
