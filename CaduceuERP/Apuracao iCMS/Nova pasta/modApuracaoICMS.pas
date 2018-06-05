unit modApuracaoICMS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Forms,
  Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Vcl.Controls,
  Vcl.Grids, Data.FMTBcd, Vcl.Menus, Data.SqlExpr, System.Actions,
  Vcl.ActnList, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.DBGrids, Vcl.ToolWin,
  System.DateUtils, RDprint;

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
    sqqSelecionaPeriodo: TSQLQuery;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    grpMesAno: TGroupBox;
    cboPeriodoApuracao: TComboBox;
    grpPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    btnIprimirApuracao: TButton;
    Button2: TButton;
    Button3: TButton;
    sqqTotalizaVContabilE: TSQLQuery;
    sqqTotalizaBCalculoE: TSQLQuery;
    sqqTotalizaCredito_E: TSQLQuery;
    sqqTotalizaIsentasNT_E: TSQLQuery;
    sqqTotalizaOutras_E: TSQLQuery;
    sqqTotalVLContEstadual_E: TSQLQuery;
    sqqTotalBCalculoEstadual_E: TSQLQuery;
    sqqTotalICreditadoEstadual_E: TSQLQuery;
    sqqTotalIsentasNTEstadual_E: TSQLQuery;
    sqqTotalOutrasEstadual_E: TSQLQuery;
    sqqTotalizaVContabil_IE: TSQLQuery;
    sqqTotalizaBCalculo_IE: TSQLQuery;
    sqqTotalICreditadoEstadual_IE: TSQLQuery;
    sqqTotalIsentasNTEstadual_IE: TSQLQuery;
    sqqTotalOutrasEstadual_IE: TSQLQuery;
    sqqTotalizaVContabilS: TSQLQuery;
    sqqTotalizaBCalculoS: TSQLQuery;
    sqqTotalizaDebito_S: TSQLQuery;
    sqqTotalizaIsentasNT_S: TSQLQuery;
    sqqTotalizaOutras_S: TSQLQuery;
    sqqTotalVLContEstadual_S: TSQLQuery;
    sqqTotalBCalculoEstadual_S: TSQLQuery;
    sqqTotalIDebitadoEstadual_S: TSQLQuery;
    sqqTotalIsentasNTEstadual_S: TSQLQuery;
    sqqTotalOutrasEstadual_S: TSQLQuery;
    sqqTotalizaVContabil_IE_S: TSQLQuery;
    sqqTotalizaBCalculo_IE_S: TSQLQuery;
    sqqTotalIDebitadoEstadual_IE_S: TSQLQuery;
    sqqTotalIsentasNTEstadual_IE_S: TSQLQuery;
    sqqTotalOutrasEstadual_IE_S: TSQLQuery;
    rdpLivroApuracao: TRDprint;
    pnlMsgAguarde: TPanel;
    actImprimirResumoApuracao: TAction;
    fdqDataApuracao: TFDQuery;
    FDQuery1: TFDQuery;
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
    procedure rdpLivroApuracaoNewPage(Sender: TObject; Pagina: Integer);
    procedure actImprimirResumoApuracaoExecute(Sender: TObject);
  private
    { Private declarations }
    sWhere: string;
    iLinha:integer;
    procedure Totalizar_Valores_Entradas(pOpcao: smallint);
    procedure Totalizar_Valores_Saidas(pOpcao: smallint);
    procedure ImprimirApuracao;
    procedure ImprimirApuracaoEntradas;
    procedure ImprimirApuracaoSaidas;
    procedure ImprimirResumoApuracao;
  public
    { Public declarations }
  end;

var
  frmApuracaoICMS: TfrmApuracaoICMS;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes;

procedure TfrmApuracaoICMS.actImprimirApuracaoExecute(Sender: TObject);
begin

  Tag := 0;

  if not sqqTotalizaVContabilE.IsEmpty then
    ImprimirApuracao;

end;

procedure TfrmApuracaoICMS.actImprimirResumoApuracaoExecute(Sender: TObject);
begin

  if not sqqTotalizaVContabilE.IsEmpty then
    ImprimirResumoApuracao;

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

  sqqSelecionaPeriodo.Open;

  while not sqqSelecionaPeriodo.Eof do
  begin

    cboPeriodoApuracao.Items.Add(sqqSelecionaPeriodo.FieldByName('MES_ANO').AsString);
    sqqSelecionaPeriodo.Next;

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

procedure TfrmApuracaoICMS.ImprimirApuracao;
begin

  rdpLivroApuracao.TitulodoRelatorio := 'L I V R O   A P U R A C A O   D O   I C M S ';
  rdpLivroApuracao.OpcoesPreview.Preview := True;

  rdpLivroApuracao.abrir; // Inicia a montagem do relat�rio...

  if rdpLivroApuracao.Setup = False then
    exit;

  pnlMsgAguarde.Visible := True;

  Application.ProcessMessages;

  sqqTotalizaVContabilE.First;

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text)))
      + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := 'AND MES_ANO = ' + QuotedStr(cboPeriodoApuracao.Text)
  else if edtPesquisa.Text <> '' then
    sWhere := 'AND LIVRO_SAIDA.NUMERO_DOCUMENTO = ' + QuotedStr(dmCDSMaster.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'AND LIVRO_SAIDA.NUMERO_DOCUMENTO = ' + QuotedStr(dmCDSMaster.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  ImprimirApuracaoEntradas;

  ImprimirApuracaoSaidas;

  pnlMsgAguarde.Visible := False;

  Application.ProcessMessages;
  rdpLivroApuracao.Fechar;

end;

procedure TfrmApuracaoICMS.ImprimirApuracaoEntradas;
begin

  while not sqqTotalizaVContabilE.Eof do
  begin

    inc(iLinha);

    rdpLivroApuracao.impBox(iLinha, 1,'i                     i');
    rdpLivroApuracao.imp   (iLinha, 25, sqqTotalizaVContabilE.FieldByName('CFOP').Value);
    rdpLivroApuracao.impBox(iLinha, 30,'i');
    rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaVContabilE.FieldByName('VC_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 46,'i');

    // TOTALIZA BASE POR CFOP
    sqqTotalizaBCalculoE.Close;
    sqqTotalizaBCalculoE.SQL.Clear;
    sqqTotalizaBCalculoE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.BASE_CALCULO_VALOR_OPERACAO),0) AS BC_E');
    sqqTotalizaBCalculoE.SQL.Add('FROM LIVRO_ENTRADA');
    sqqTotalizaBCalculoE.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
    sqqTotalizaBCalculoE.SQL.Add('AND CODIGO_VALORES_FISCAIS = 1');

    if sWhere <> '' then
      sqqTotalizaBCalculoE.SQL.Add(sWhere);

    sqqTotalizaBCalculoE.Open;

    rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaBCalculoE.FieldByName('BC_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 76,'i');

    // TOTALIZA IMPOSTO CREDITADO POR CFOP
    sqqTotalizaCredito_E.Close;
    sqqTotalizaCredito_E.SQL.Clear;
    sqqTotalizaCredito_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.IMPOSTO_CREDITADO),0) AS IC_E');
    sqqTotalizaCredito_E.SQL.Add('FROM LIVRO_ENTRADA');

    sqqTotalizaCredito_E.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
    sqqTotalizaCredito_E.SQL.Add('AND CODIGO_VALORES_FISCAIS = 1');

    if sWhere <> '' then
      sqqTotalizaCredito_E.SQL.Add(sWhere);

    sqqTotalizaCredito_E.Open;

    rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaCredito_E.FieldByName('IC_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 105,'i');

    // TOTALIZA ISENTAS NT POR CFOP
    sqqTotalizaIsentasNT_E.Close;
    sqqTotalizaIsentasNT_E.SQL.Clear;
    sqqTotalizaIsentasNT_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS ISENTAS_NT_E');
    sqqTotalizaIsentasNT_E.SQL.Add('FROM LIVRO_ENTRADA');
    sqqTotalizaIsentasNT_E.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
    sqqTotalizaIsentasNT_E.SQL.Add('AND CODIGO_VALORES_FISCAIS = 2');

    if sWhere <> '' then
      sqqTotalizaIsentasNT_E.SQL.Add(sWhere);

    sqqTotalizaIsentasNT_E.Open;

    rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaIsentasNT_E.FieldByName('ISENTAS_NT_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 131,'i');

    // TOTALIZA OUTRAS POR CFOP
    sqqTotalizaOutras_E.Close;
    sqqTotalizaOutras_E.SQL.Clear;
    sqqTotalizaOutras_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS OUTRAS_E');
    sqqTotalizaOutras_E.SQL.Add('FROM LIVRO_ENTRADA');
    sqqTotalizaOutras_E.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
    sqqTotalizaOutras_E.SQL.Add('AND CODIGO_VALORES_FISCAIS = 3');

    if sWhere <> '' then
      sqqTotalizaOutras_E.SQL.Add(sWhere);

    sqqTotalizaOutras_E.Open;

    rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaOutras_E.FieldByName('OUTRAS_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 160,'i');


    sqqTotalizaVContabilE.Next;
  end;

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'<---------------------v------+---------------+-----------------------------+----------------------------+-------------------------+---------------------------->');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 2, '1.000 DO ESTADO');

  //TOTALIZA VL CONTABIL ESTADUAL
  sqqTotalVLContEstadual_E.Close;
  sqqTotalVLContEstadual_E.SQL.Clear;
  sqqTotalVLContEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TVC_E');
  sqqTotalVLContEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalVLContEstadual_E.SQL.Add('WHERE UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalVLContEstadual_E.SQL.Add(sWhere);

  sqqTotalVLContEstadual_E.Open;

  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalVLContEstadual_E.FieldByName('TVC_E').Value)]));
  rdpLivroApuracao.impBox(iLinha, 46,'i');

  //TOTALIZA B. CALCULO ESTADUAL
  sqqTotalBCalculoEstadual_E.Close;
  sqqTotalBCalculoEstadual_E.SQL.Clear;
  sqqTotalBCalculoEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.BASE_CALCULO_VALOR_OPERACAO),0) AS TBC_E');
  sqqTotalBCalculoEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalBCalculoEstadual_E.SQL.Add('WHERE UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalBCalculoEstadual_E.SQL.Add('AND ALIQUOTA > 0');
  if sWhere <> '' then
    sqqTotalBCalculoEstadual_E.SQL.Add(sWhere);

  sqqTotalBCalculoEstadual_E.Open;

  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalBCalculoEstadual_E.FieldByName('TBC_E').Value)]));
  rdpLivroApuracao.impBox(iLinha, 76,'i');

  //TOTALIZA CREDITO ESTADUAL
  sqqTotalICreditadoEstadual_E.Close;
  sqqTotalICreditadoEstadual_E.SQL.Clear;
  sqqTotalICreditadoEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.IMPOSTO_CREDITADO),0) AS TCREDITO_E');
  sqqTotalICreditadoEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalICreditadoEstadual_E.SQL.Add('WHERE UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalICreditadoEstadual_E.SQL.Add('AND ALIQUOTA > 0');

  if sWhere <> '' then
    sqqTotalICreditadoEstadual_E.SQL.Add(sWhere);

  sqqTotalICreditadoEstadual_E.Open;

  rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalICreditadoEstadual_E.FieldByName('TCREDITO_E').Value)]));
  rdpLivroApuracao.impBox(iLinha, 105,'i');

  //TOTALIZA ISENTAS ESTADUAL
  sqqTotalIsentasNTEstadual_E.Close;
  sqqTotalIsentasNTEstadual_E.SQL.Clear;
  sqqTotalIsentasNTEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TISENTAS_E');
  sqqTotalIsentasNTEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalIsentasNTEstadual_E.SQL.Add(' WHERE UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalIsentasNTEstadual_E.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 2');

  if sWhere <> '' then
    sqqTotalIsentasNTEstadual_E.SQL.Add(sWhere);

  sqqTotalIsentasNTEstadual_E.Open;

  rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIsentasNTEstadual_E.FieldByName('TISENTAS_E').Value)]));
  rdpLivroApuracao.impBox(iLinha, 131,'i');

  //TOTALIZA OUTRAS ESTADUAL
  sqqTotalOutrasEstadual_E.Close;
  sqqTotalOutrasEstadual_E.SQL.Clear;
  sqqTotalOutrasEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TOUTRAS_E');
  sqqTotalOutrasEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalOutrasEstadual_E.SQL.Add(' WHERE UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalOutrasEstadual_E.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 3');

  if sWhere <> '' then
    sqqTotalOutrasEstadual_E.SQL.Add(sWhere);

  sqqTotalOutrasEstadual_E.Open;

  rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalOutrasEstadual_E.FieldByName('TOUTRAS_E').Value)]));
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 2, '2.000 DE OUT ESTADO');

  //TOTALIZA VL CONTABIL INTERESTADUAL
  sqqTotalizaVContabil_IE.Close;
  sqqTotalizaVContabil_IE.SQL.Clear;
  sqqTotalizaVContabil_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TVC_IE');
  sqqTotalizaVContabil_IE.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalizaVContabil_IE.SQL.Add('WHERE UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalizaVContabil_IE.SQL.Add(sWhere);

  sqqTotalizaVContabil_IE.Open;

  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaVContabil_IE.FieldByName('TVC_IE').Value)]));
  rdpLivroApuracao.impBox(iLinha, 46,'i');

  //TOTALIZA B. CALCULO INTERESTADUAL
  sqqTotalizaBCalculo_IE.Close;
  sqqTotalizaBCalculo_IE.SQL.Clear;
  sqqTotalizaBCalculo_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.BASE_CALCULO_VALOR_OPERACAO),0) AS TBC_IE');
  sqqTotalizaBCalculo_IE.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalizaBCalculo_IE.SQL.Add('WHERE UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalizaBCalculo_IE.SQL.Add('AND ALIQUOTA > 0');
  if sWhere <> '' then
    sqqTotalizaBCalculo_IE.SQL.Add(sWhere);

  sqqTotalizaBCalculo_IE.Open;

  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaBCalculo_IE.FieldByName('TBC_IE').Value)]));
  rdpLivroApuracao.impBox(iLinha, 76,'i');

  //TOTALIZA CREDITO INTERESTADUAL
  sqqTotalICreditadoEstadual_IE.Close;
  sqqTotalICreditadoEstadual_IE.SQL.Clear;
  sqqTotalICreditadoEstadual_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.IMPOSTO_CREDITADO),0) AS TCREDITO_IE');
  sqqTotalICreditadoEstadual_IE.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalICreditadoEstadual_IE.SQL.Add('WHERE UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalICreditadoEstadual_IE.SQL.Add('AND ALIQUOTA > 0');

  if sWhere <> '' then
    sqqTotalICreditadoEstadual_IE.SQL.Add(sWhere);

  sqqTotalICreditadoEstadual_IE.Open;

  rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalICreditadoEstadual_IE.FieldByName('TCREDITO_IE').Value)]));
  rdpLivroApuracao.impBox(iLinha, 105,'i');

  //TOTALIZA ISENTAS INTERESTADUAL
  sqqTotalIsentasNTEstadual_IE.Close;
  sqqTotalIsentasNTEstadual_IE.SQL.Clear;
  sqqTotalIsentasNTEstadual_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TISENTAS_IE');
  sqqTotalIsentasNTEstadual_IE.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalIsentasNTEstadual_IE.SQL.Add(' WHERE UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalIsentasNTEstadual_IE.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 2');

  if sWhere <> '' then
    sqqTotalIsentasNTEstadual_IE.SQL.Add(sWhere);

  sqqTotalIsentasNTEstadual_IE.Open;

  rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIsentasNTEstadual_IE.FieldByName('TISENTAS_IE').Value)]));
  rdpLivroApuracao.impBox(iLinha, 131,'i');

  //TOTALIZA OUTRAS INTERESTADUAL
  sqqTotalOutrasEstadual_IE.Close;
  sqqTotalOutrasEstadual_IE.SQL.Clear;
  sqqTotalOutrasEstadual_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TOUTRAS_IE');
  sqqTotalOutrasEstadual_IE.SQL.Add('FROM LIVRO_ENTRADA');
  sqqTotalOutrasEstadual_IE.SQL.Add(' WHERE UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalOutrasEstadual_IE.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 3');

  if sWhere <> '' then
    sqqTotalOutrasEstadual_IE.SQL.Add(sWhere);

  sqqTotalOutrasEstadual_IE.Open;

  rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalOutrasEstadual_IE.FieldByName('TOUTRAS_IE').Value)]));
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 2, '3.000 DO EXTERIOR');

  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 46,'i');

  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 76,'i');

  rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 105,'i');

  rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 131,'i');

  rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'<----------------------------+---------------+-----------------------------+----------------------------+-------------------------+---------------------------->');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.impF  (iLinha, 2, 'Total:',[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.impF  (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalVLContEstadual_E.FieldByName('TVC_E').Value+sqqTotalizaVContabil_IE.FieldByName('TVC_IE').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.impF  (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalBCalculoEstadual_E.FieldByName('TBC_E').Value+sqqTotalizaBCalculo_IE.FieldByName('TBC_IE').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 76,'i');
  rdpLivroApuracao.impF  (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalICreditadoEstadual_E.FieldByName('TCREDITO_E').Value+sqqTotalICreditadoEstadual_IE.FieldByName('TCREDITO_IE').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 105,'i');
  rdpLivroApuracao.impF  (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIsentasNTEstadual_E.FieldByName('TISENTAS_E').Value+sqqTotalIsentasNTEstadual_IE.FieldByName('TISENTAS_IE').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 131,'i');
  rdpLivroApuracao.impF  (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalOutrasEstadual_E.FieldByName('TOUTRAS_E').Value+sqqTotalOutrasEstadual_IE.FieldByName('TOUTRAS_IE').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 160,'i');
  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'d----------------------------v---------------v-----------------------------v----------------------------v-------------------------v----------------------------c');

end;

procedure TfrmApuracaoICMS.ImprimirApuracaoSaidas;
begin

  inc(iLinha);
  rdpLivroApuracao.impF  (iLinha, 63, 'S A I D A S',[NEGRITO, EXPANDIDO]);

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,
    'a----------------------------t---------------t-----------------------------------------------------------------------------------------------------------------b');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 10, 'Codificacao');
  rdpLivroApuracao.impBox(iLinha, 30,'i               i');
  rdpLivroApuracao.imp   (iLinha, 90, 'Valores Fiscais');
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'<---------------------t------>');
  rdpLivroApuracao.imp   (iLinha, 35, 'Valores');
  rdpLivroApuracao.impBox(iLinha, 46,'<----------------------------------------------------------t------------------------------------------------------>');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.impBox(iLinha, 23,'i');
  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 62, 'Operacoes com Debito do Imposto');
  rdpLivroApuracao.impBox(iLinha, 105,'i');
  rdpLivroApuracao.imp   (iLinha, 118, 'Operacoes sem Debito do Imposto');
  rdpLivroApuracao.impBox(iLinha, 160, 'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 08, 'Contabil');
  rdpLivroApuracao.impBox(iLinha, 23,'i');
  rdpLivroApuracao.imp   (iLinha, 24, 'Fiscal');
  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, 'Contabeis');
  rdpLivroApuracao.impBox(iLinha, 46,'<-----------------------------t----------------------------+-------------------------t---------------------------->');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i                     i      i               i');
  rdpLivroApuracao.imp   (iLinha, 54, 'Base de Calculo');
  rdpLivroApuracao.impBox(iLinha, 76,'i');
  rdpLivroApuracao.imp   (iLinha, 82, 'Imposto Debitado');
  rdpLivroApuracao.impBox(iLinha, 105,'i');
  rdpLivroApuracao.imp   (iLinha, 107, 'Isentas/Nao Tributaveis');
  rdpLivroApuracao.impBox(iLinha, 131,'i');
  rdpLivroApuracao.imp   (iLinha, 143, 'Outras');
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'<---------------------+------+---------------+-----------------------------+----------------------------+-------------------------+---------------------------->');

  sqqTotalizaVContabilS.First;

  while not  sqqTotalizaVContabilS.Eof do
  begin
    inc(iLinha);

    rdpLivroApuracao.impBox(iLinha, 1,'i                     i');
    rdpLivroApuracao.imp   (iLinha, 25, sqqTotalizaVContabilS.FieldByName('CFOP').Value);
    rdpLivroApuracao.impBox(iLinha, 30,'i');
    rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaVContabilS.FieldByName('VC_S').Value)]));
    rdpLivroApuracao.impBox(iLinha, 46,'i');

    // TOTALIZA BASE POR CFOP
    sqqTotalizaBCalculoS.Close;
    sqqTotalizaBCalculoS.SQL.Clear;
    sqqTotalizaBCalculoS.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.BASE_CALCULO),0) AS BC_E');
    sqqTotalizaBCalculoS.SQL.Add('FROM LIVRO_SAIDA');
    sqqTotalizaBCalculoS.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
    sqqTotalizaBCalculoS.SQL.Add('AND ALIQUOTA > 0');

    if sWhere <> '' then
      sqqTotalizaBCalculoS.SQL.Add(sWhere);

    sqqTotalizaBCalculoS.Open;

    rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaBCalculoS.FieldByName('BC_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 76,'i');

    // TOTALIZA IMPOSTO DEBITADO POR CFOP
    sqqTotalizaDebito_S.Close;
    sqqTotalizaDebito_S.SQL.Clear;
    sqqTotalizaDebito_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.IMPOSTO_DEBITADO),0) AS ID_E');
    sqqTotalizaDebito_S.SQL.Add('FROM LIVRO_SAIDA');
    sqqTotalizaDebito_S.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
    sqqTotalizaDebito_S.SQL.Add('AND IMPOSTO_DEBITADO > 0');

    if sWhere <> '' then
      sqqTotalizaDebito_S.SQL.Add(sWhere);

    sqqTotalizaDebito_S.Open;

    rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaDebito_S.FieldByName('ID_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 105,'i');

    // TOTALIZA ISENTAS NT POR CFOP
    sqqTotalizaIsentasNT_S.Close;
    sqqTotalizaIsentasNT_S.SQL.Clear;
    sqqTotalizaIsentasNT_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS ISENTAS_NT_E');
    sqqTotalizaIsentasNT_S.SQL.Add('FROM LIVRO_SAIDA');
    sqqTotalizaIsentasNT_S.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
    sqqTotalizaIsentasNT_S.SQL.Add('AND ISENTAS_NAO_TRIBUTADAS > 0');

    if sWhere <> '' then
      sqqTotalizaIsentasNT_S.SQL.Add(sWhere);

    sqqTotalizaIsentasNT_S.Open;

    rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaIsentasNT_S.FieldByName('ISENTAS_NT_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 131,'i');

    // TOTALIZA OUTRAS POR CFOP
    sqqTotalizaOutras_S.Close;
    sqqTotalizaOutras_S.SQL.Clear;
    sqqTotalizaOutras_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.OUTRAS),0) AS OUTRAS_E');
    sqqTotalizaOutras_S.SQL.Add('FROM LIVRO_SAIDA');
    sqqTotalizaOutras_S.SQL.Add('WHERE CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
    sqqTotalizaOutras_S.SQL.Add('AND OUTRAS > 0');

    if sWhere <> '' then
      sqqTotalizaOutras_S.SQL.Add(sWhere);

    sqqTotalizaOutras_S.Open;

    rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaOutras_S.FieldByName('OUTRAS_E').Value)]));
    rdpLivroApuracao.impBox(iLinha, 160,'i');

    sqqTotalizaVContabilS.Next;
  end;

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'<---------------------v------+---------------+-----------------------------+----------------------------+-------------------------+---------------------------->');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 2, '5.000 P/ O ESTADO');

  //TOTALIZA VLCONTABIL ESTADUAL
  sqqTotalVLContEstadual_S.Close;
  sqqTotalVLContEstadual_S.SQL.Clear;
  sqqTotalVLContEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS TVC_S');
  sqqTotalVLContEstadual_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalVLContEstadual_S.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalVLContEstadual_S.SQL.Add(sWhere);

  sqqTotalVLContEstadual_S.Open;

  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalVLContEstadual_S.FieldByName('TVC_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 46,'i');

  //TOTALIZA b. CALCULO ESTADUAL
  sqqTotalBCalculoEstadual_S.Close;
  sqqTotalBCalculoEstadual_S.SQL.Clear;
  sqqTotalBCalculoEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.BASE_CALCULO),0) AS TBC_S');
  sqqTotalBCalculoEstadual_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalBCalculoEstadual_S.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalBCalculoEstadual_S.SQL.Add(sWhere);

  sqqTotalBCalculoEstadual_S.Open;

  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalBCalculoEstadual_S.FieldByName('TBC_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 76,'i');

  //TOTALIZA DEBITO ESTADUAL
  sqqTotalIDebitadoEstadual_S.Close;
  sqqTotalIDebitadoEstadual_S.SQL.Clear;
  sqqTotalIDebitadoEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.IMPOSTO_DEBITADO),0) AS TDEBITO_S');
  sqqTotalIDebitadoEstadual_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalIDebitadoEstadual_S.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalIDebitadoEstadual_S.SQL.Add(sWhere);

  sqqTotalIDebitadoEstadual_S.Open;

  rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIDebitadoEstadual_S.FieldByName('TDEBITO_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 105,'i');

  //TOTALIZA ISENTAS ESTADUAL
  sqqTotalIsentasNTEstadual_S.Close;
  sqqTotalIsentasNTEstadual_S.SQL.Clear;
  sqqTotalIsentasNTEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.ISENTAS_NAO_TRIBUTADAS),0) AS TISENTAS_S');
  sqqTotalIsentasNTEstadual_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalIsentasNTEstadual_S.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalIsentasNTEstadual_S.SQL.Add(' AND ISENTAS_NAO_TRIBUTADAS > 0');

  if sWhere <> '' then
    sqqTotalIsentasNTEstadual_S.SQL.Add(sWhere);

  sqqTotalIsentasNTEstadual_S.Open;
  rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIsentasNTEstadual_S.FieldByName('TISENTAS_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 131,'i');

  //TOTALIZA OUTRAS ESTADUAL
  sqqTotalOutrasEstadual_S.Close;
  sqqTotalOutrasEstadual_S.SQL.Clear;
  sqqTotalOutrasEstadual_S.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS TOUTRAS_S');
  sqqTotalOutrasEstadual_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalOutrasEstadual_S.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalOutrasEstadual_S.SQL.Add(' AND OUTRAS > 0');

  if sWhere <> '' then
    sqqTotalOutrasEstadual_S.SQL.Add(sWhere);

  sqqTotalOutrasEstadual_S.Open;

  rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalOutrasEstadual_S.FieldByName('TOUTRAS_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 2, '6.000 P/OUT ESTADO');

  //TOTALIZA VLCONTABIL INTER_ESTADUAL
  sqqTotalizaVContabil_IE_S.Close;
  sqqTotalizaVContabil_IE_S.SQL.Clear;
  sqqTotalizaVContabil_IE_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS TVC_IE_S');
  sqqTotalizaVContabil_IE_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalizaVContabil_IE_S.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalizaVContabil_IE_S.SQL.Add(sWhere);

  sqqTotalizaVContabil_IE_S.Open;

  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaVContabil_IE_S.FieldByName('TVC_IE_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 46,'i');

  //TOTALIZA b. CALCULO INTER_ESTADUAL
  sqqTotalizaBCalculo_IE_S.Close;
  sqqTotalizaBCalculo_IE_S.SQL.Clear;
  sqqTotalizaBCalculo_IE_S.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO),0) AS TBC_IE_S');
  sqqTotalizaBCalculo_IE_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalizaBCalculo_IE_S.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalizaBCalculo_IE_S.SQL.Add(' AND ALIQUOTA > 0');

  if sWhere <> '' then
    sqqTotalizaBCalculo_IE_S.SQL.Add(sWhere);

  sqqTotalizaBCalculo_IE_S.Open;

  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalizaBCalculo_IE_S.FieldByName('TBC_IE_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 76,'i');

  //TOTALIZA DEBITO INTER_ESTADUAL
  sqqTotalIDebitadoEstadual_IE_S.Close;
  sqqTotalIDebitadoEstadual_IE_S.SQL.Clear;
  sqqTotalIDebitadoEstadual_IE_S.SQL.Add('SELECT COALESCE(SUM(IMPOSTO_DEBITADO),0) AS TDEBITO_IE_S');
  sqqTotalIDebitadoEstadual_IE_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalIDebitadoEstadual_IE_S.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

  if sWhere <> '' then
    sqqTotalIDebitadoEstadual_IE_S.SQL.Add(sWhere);

  sqqTotalIDebitadoEstadual_IE_S.Open;

  rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIDebitadoEstadual_IE_S.FieldByName('TDEBITO_IE_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 105,'i');

  //TOTALIZA ISENTAS INTER_ESTADUAL
  sqqTotalIsentasNTEstadual_IE_S.Close;
  sqqTotalIsentasNTEstadual_IE_S.SQL.Clear;
  sqqTotalIsentasNTEstadual_IE_S.SQL.Add('SELECT COALESCE(SUM(ISENTAS_NAO_TRIBUTADAS),0) AS TISENTAS_IE_S');
  sqqTotalIsentasNTEstadual_IE_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalIsentasNTEstadual_IE_S.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalIsentasNTEstadual_IE_S.SQL.Add(' AND ISENTAS_NAO_TRIBUTADAS > 0');

  if sWhere <> '' then
    sqqTotalIsentasNTEstadual_IE_S.SQL.Add(sWhere);

  sqqTotalIsentasNTEstadual_IE_S.Open;

  rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIsentasNTEstadual_IE_S.FieldByName('TISENTAS_IE_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 131,'i');

  //TOTALIZA OUTRAS INTERESTADUAL
  sqqTotalOutrasEstadual_IE_S.Close;
  sqqTotalOutrasEstadual_IE_S.SQL.Clear;
  sqqTotalOutrasEstadual_IE_S.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS TOUTRAS_IE_S');
  sqqTotalOutrasEstadual_IE_S.SQL.Add('FROM LIVRO_SAIDA');
  sqqTotalOutrasEstadual_IE_S.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
  sqqTotalOutrasEstadual_IE_S.SQL.Add(' AND OUTRAS > 0');

  if sWhere <> '' then
    sqqTotalOutrasEstadual_IE_S.SQL.Add(sWhere);

  sqqTotalOutrasEstadual_IE_S.Open;

  rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalOutrasEstadual_IE_S.FieldByName('TOUTRAS_IE_S').Value)]));
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.imp   (iLinha, 2, '7.000 P/O EXTERIOR');

  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.imp   (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 46,'i');

  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.imp   (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 76,'i');

  rdpLivroApuracao.imp   (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 105,'i');

  rdpLivroApuracao.imp   (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 131,'i');

  rdpLivroApuracao.imp   (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',0)]));
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'<----------------------------+---------------+-----------------------------+----------------------------+-------------------------+---------------------------->');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'i');
  rdpLivroApuracao.impF  (iLinha, 2, 'Total:',[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 30,'i');
  rdpLivroApuracao.impF  (iLinha, 34, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalVLContEstadual_S.FieldByName('TVC_S').Value+sqqTotalizaVContabil_IE_S.FieldByName('TVC_IE_S').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 46,'i');
  rdpLivroApuracao.impF  (iLinha, 64, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalBCalculoEstadual_S.FieldByName('TBC_S').Value+sqqTotalizaBCalculo_IE_S.FieldByName('TBC_IE_S').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 76,'i');
  rdpLivroApuracao.impF  (iLinha, 93, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIDebitadoEstadual_S.FieldByName('TDEBITO_S').Value+sqqTotalIDebitadoEstadual_IE_S.FieldByName('TDEBITO_IE_S').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 105,'i');
  rdpLivroApuracao.impF  (iLinha, 119, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalIsentasNTEstadual_S.FieldByName('TISENTAS_S').Value+sqqTotalIsentasNTEstadual_IE_S.FieldByName('TISENTAS_IE_S').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 131,'i');
  rdpLivroApuracao.impF  (iLinha, 148, Format('%12.12s',[FormatFloat('#,##0.00',sqqTotalOutrasEstadual_S.FieldByName('TOUTRAS_S').Value+sqqTotalOutrasEstadual_IE_S.FieldByName('TOUTRAS_IE_S').Value)]),[NEGRITO]);
  rdpLivroApuracao.impBox(iLinha, 160,'i');

  inc(iLinha);
  rdpLivroApuracao.impBox(iLinha, 1,'d----------------------------v---------------v-----------------------------v----------------------------v-------------------------v----------------------------c');

end;

procedure TfrmApuracaoICMS.ImprimirResumoApuracao;
begin

  Tag := 1;

  rdpLivroApuracao.TitulodoRelatorio := 'R E S U M O   D A   A P U R A C A O   D O   I M P O S T O   I C M S';
  rdpLivroApuracao.OpcoesPreview.Preview := True;

  rdpLivroApuracao.abrir; // Inicia a montagem do relat�rio...

  if rdpLivroApuracao.Setup = False then
    exit;

  pnlMsgAguarde.Visible := True;

  Application.ProcessMessages;

  sqqTotalizaVContabilE.First;

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text)))
      + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := 'AND MES_ANO = ' + QuotedStr(cboPeriodoApuracao.Text)
  else if edtPesquisa.Text <> '' then
    sWhere := 'AND LIVRO_SAIDA.NUMERO_DOCUMENTO = ' + QuotedStr(dmCDSMaster.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'AND LIVRO_SAIDA.NUMERO_DOCUMENTO = ' + QuotedStr(dmCDSMaster.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  ImprimirApuracaoEntradas;

  ImprimirApuracaoSaidas;

  pnlMsgAguarde.Visible := False;

  Application.ProcessMessages;
  rdpLivroApuracao.Fechar;

end;

procedure TfrmApuracaoICMS.rdpLivroApuracaoNewPage(Sender: TObject;
  Pagina: Integer);
begin
  case tag of
    0:begin

        rdpLivroApuracao.impBox(1, 1,
        'a--------------------------------------------------------------------------------------------------------------------------------------------------------------b');

        rdpLivroApuracao.impBox(2, 1, 'i');
        rdpLivroApuracao.impF  (2, 33, rdpLivroApuracao.TitulodoRelatorio,[NEGRITO, EXPANDIDO]);
        rdpLivroApuracao.impF  (2, 150, 'Modelo: P9',[NEGRITO]);
        rdpLivroApuracao.impBox(2, 160, 'i');

        rdpLivroApuracao.impBox(3, 1, 'i');
        rdpLivroApuracao.impF  (3, 2, 'Empresa.......:', [NEGRITO]);
        rdpLivroApuracao.imp   (3, 18, dmCDSMaster.cdsFilialRAZAO_SOCIAL.Value);
        rdpLivroApuracao.impBox(3, 160, 'i');

        rdpLivroApuracao.impBox(4, 1, 'i');
        rdpLivroApuracao.impF  (4, 2, 'Inscr.Estadual:', [NEGRITO]);
        rdpLivroApuracao.imp   (4, 18, dmCDSMaster.cdsFilialINSCRICAO_ESTADUAL.Value);
        rdpLivroApuracao.impF  (4, 45, 'CNPJ......:', [NEGRITO]);
        rdpLivroApuracao.imp   (4, 57, FormatarCNPJCPF(dmCDSMaster.cdsFilialCNPJ.Value));
        rdpLivroApuracao.impBox(4, 160, 'i');

        rdpLivroApuracao.impBox(5, 1, 'i');
        rdpLivroApuracao.impF  (5, 2, 'Pagina........:', [NEGRITO]);
        rdpLivroApuracao.imp   (5, 18, IntToStr(Pagina));
        rdpLivroApuracao.impF  (5, 45, 'Referencia:', [NEGRITO]);

        if cboPeriodoApuracao.Text <> '' then
        begin

          rdpLivroApuracao.imp (5, 57,RetornaPeriodoReferencia(sqqDataApuracao.FieldByName('DATA_ENTRADA').Value));
          rdpLivroApuracao.impF(5, 80, 'Periodo:', [NEGRITO]);
          rdpLivroApuracao.imp (5, 89,'Mensal');

        end
        else if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
        begin

          rdpLivroApuracao.imp (5, 57,RetornaPeriodoReferencia(StrToDate(edtDataInicial.Text)));
          rdpLivroApuracao.impF(5, 80, 'Periodo:', [NEGRITO]);
          rdpLivroApuracao.imp (5, 89,'de ' + edtDataInicial.Text + ' a ' + edtDataFinal.Text );

        end;

        rdpLivroApuracao.impBox(5, 160, 'i');
        rdpLivroApuracao.impBox(6, 1,
          'd--------------------------------------------------------------------------------------------------------------------------------------------------------------c');
        rdpLivroApuracao.impF  (7, 60, 'E N T R A D A S',[NEGRITO, EXPANDIDO]);
        rdpLivroApuracao.impBox(8, 1,
          'a----------------------------t---------------t-----------------------------------------------------------------------------------------------------------------b');
        rdpLivroApuracao.impBox(9, 1,'i');
        rdpLivroApuracao.imp   (9, 10, 'Codificacao');
        rdpLivroApuracao.impBox(9, 30,'i               i');
        rdpLivroApuracao.imp   (9, 90, 'Valores Fiscais');
        rdpLivroApuracao.impBox(9, 160,'i');

        rdpLivroApuracao.impBox(10, 1,'<---------------------t------>');
        rdpLivroApuracao.imp   (10, 35, 'Valores');
        rdpLivroApuracao.impBox(10, 46,'<----------------------------------------------------------t------------------------------------------------------>');

        rdpLivroApuracao.impBox(11, 1,'i');
        rdpLivroApuracao.impBox(11, 23,'i');
        rdpLivroApuracao.impBox(11, 30,'i');
        rdpLivroApuracao.impBox(11, 46,'i');
        rdpLivroApuracao.imp   (11, 62, 'Operacoes com Credito do Imposto');
        rdpLivroApuracao.impBox(11, 105,'i');
        rdpLivroApuracao.imp   (11, 118, 'Operacoes sem Credito do Imposto');
        rdpLivroApuracao.impBox(11, 160, 'i');

        rdpLivroApuracao.impBox(12, 1,'i');
        rdpLivroApuracao.imp   (12, 08, 'Contabil');
        rdpLivroApuracao.impBox(12, 23,'i');
        rdpLivroApuracao.imp   (12, 24, 'Fiscal');
        rdpLivroApuracao.impBox(12, 30,'i');
        rdpLivroApuracao.imp   (12, 34, 'Contabeis');
        rdpLivroApuracao.impBox(12, 46,'<-----------------------------t----------------------------+-------------------------t---------------------------->');

        rdpLivroApuracao.impBox(13, 1,'i                     i      i               i');
        rdpLivroApuracao.imp   (13, 54, 'Base de Calculo');
        rdpLivroApuracao.impBox(13, 76,'i');
        rdpLivroApuracao.imp   (13, 82, 'Imposto Creditado');
        rdpLivroApuracao.impBox(13, 105,'i');
        rdpLivroApuracao.imp   (13, 107, 'Isentas/Nao Tributaveis');
        rdpLivroApuracao.impBox(13, 131,'i');
        rdpLivroApuracao.imp   (13, 143, 'Outras');
        rdpLivroApuracao.impBox(13, 160,'i');

        rdpLivroApuracao.impBox(14, 1,'<---------------------+------+---------------+-----------------------------+----------------------------+-------------------------+---------------------------->');

        iLinha := 14;

      end;
  end;

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

  case pOpcao of
    0: // data
      sWhere := 'WHERE LIVRO_ENTRADA.DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text)))
        + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrToDate(edtDataFinal.Text)));
    1:// mes/ano
      sWhere := 'WHERE LIVRO_ENTRADA.MES_ANO = ' + QuotedStr(cboPeriodoApuracao.Text);
    2:// documento
      sWhere := 'WHERE LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(edtPesquisa.Text);
  end;

  sqqTotalizaVContabilE.Close;
  sqqTotalizaVContabilE.SQL.Clear;
  sqqTotalizaVContabilE.SQL.Add('SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS VC_E');
  sqqTotalizaVContabilE.SQL.Add('FROM LIVRO_ENTRADA LIVRO_ENTRADA');
  sqqTotalizaVContabilE.SQL.Add('JOIN CFOP CFOP');
  sqqTotalizaVContabilE.SQL.Add('ON(LIVRO_ENTRADA.CFOP = CFOP.CFOP)');

  if sWhere <> '' then
    sqqTotalizaVContabilE.SQL.Add(sWhere);

  sqqTotalizaVContabilE.SQL.Add('GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO');
  sqqTotalizaVContabilE.SQL.Add('ORDER BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO');

  sqqTotalizaVContabilE.Open;

    while not sqqTotalizaVContabilE.Eof do
    begin

      // TOTALIZA BASE PRO CFOP
      sqqTotalizaBCalculoE.Close;
      sqqTotalizaBCalculoE.SQL.Clear;
      sqqTotalizaBCalculoE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.BASE_CALCULO_VALOR_OPERACAO),0) AS BC_E');
      sqqTotalizaBCalculoE.SQL.Add('FROM LIVRO_ENTRADA');

      if sWhere <> '' then
        sqqTotalizaBCalculoE.SQL.Add(sWhere);

      sqqTotalizaBCalculoE.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
      sqqTotalizaBCalculoE.SQL.Add('AND CODIGO_VALORES_FISCAIS = 1');

      sqqTotalizaBCalculoE.Open;

      // TOTALIZA IMPOSTO CREDITADO POR CFOP
      sqqTotalizaCredito_E.Close;
      sqqTotalizaCredito_E.SQL.Clear;
      sqqTotalizaCredito_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.IMPOSTO_CREDITADO),0) AS IC_E');
      sqqTotalizaCredito_E.SQL.Add('FROM LIVRO_ENTRADA');

      if sWhere <> '' then
        sqqTotalizaCredito_E.SQL.Add(sWhere);

      sqqTotalizaCredito_E.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
      sqqTotalizaCredito_E.SQL.Add('AND CODIGO_VALORES_FISCAIS = 1');

      sqqTotalizaCredito_E.Open;

      // TOTALIZA ISENTAS NT POR CFOP
      sqqTotalizaIsentasNT_E.Close;
      sqqTotalizaIsentasNT_E.SQL.Clear;
      sqqTotalizaIsentasNT_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS ISENTAS_NT_E');
      sqqTotalizaIsentasNT_E.SQL.Add('FROM LIVRO_ENTRADA');

      if sWhere <> '' then
        sqqTotalizaIsentasNT_E.SQL.Add(sWhere);

      sqqTotalizaIsentasNT_E.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
      sqqTotalizaIsentasNT_E.SQL.Add('AND CODIGO_VALORES_FISCAIS = 2');

      sqqTotalizaIsentasNT_E.Open;

      // TOTALIZA OUTRAS POR CFOP
      sqqTotalizaOutras_E.Close;
      sqqTotalizaOutras_E.SQL.Clear;
      sqqTotalizaOutras_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS OUTRAS_E');
      sqqTotalizaOutras_E.SQL.Add('FROM LIVRO_ENTRADA');

      if sWhere <> '' then
        sqqTotalizaOutras_E.SQL.Add(sWhere);

      sqqTotalizaOutras_E.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilE.FieldByName('CFOP').Value));
      sqqTotalizaOutras_E.SQL.Add('AND CODIGO_VALORES_FISCAIS = 3');

      sqqTotalizaOutras_E.Open;

      stgTotaisCfopEstadualE.Cells[0, stgTotaisCfopEstadualE.RowCount - 1] := sqqTotalizaVContabilE.FieldByName('CFOP').Value;
      stgTotaisCfopEstadualE.Cells[1, stgTotaisCfopEstadualE.RowCount - 1] := Format('%-30.30s',[sqqTotalizaVContabilE.FieldByName('DESCRICAO').Value]);
      stgTotaisCfopEstadualE.Cells[2, stgTotaisCfopEstadualE.RowCount - 1] := Format('%12.12s', [FormatFloat('#,##0.00',sqqTotalizaVContabilE.FieldByName('VC_E').Value)]);
      stgTotaisCfopEstadualE.Cells[3, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaBCalculoE.FieldByName('BC_E').Value)]);
      stgTotaisCfopEstadualE.Cells[4, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaCredito_E.FieldByName('IC_E').Value)]);
      stgTotaisCfopEstadualE.Cells[5, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaIsentasNT_E.FieldByName('ISENTAS_NT_E').Value)]);
      stgTotaisCfopEstadualE.Cells[6, stgTotaisCfopEstadualE.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaOutras_E.FieldByName('OUTRAS_E').Value)]);

      if not sqqTotalizaVContabilE.Eof then
        stgTotaisCfopEstadualE.RowCount := stgTotaisCfopEstadualE.RowCount + 1;

      sqqTotalizaVContabilE.Next;

    end;

    //TOTALIZA VLCONTABIL ESTADUAL
    sqqTotalVLContEstadual_E.Close;
    sqqTotalVLContEstadual_E.SQL.Clear;
    sqqTotalVLContEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TVC_E');
    sqqTotalVLContEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalVLContEstadual_E.SQL.Add(sWhere);

    sqqTotalVLContEstadual_E.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalVLContEstadual_E.Open;

    edtTVContalbilEST.Text := FormatFloat
      ('#,##0.00', sqqTotalVLContEstadual_E.FieldByName('TVC_E').AsCurrency);

    //TOTALIZA b. CALCULO ESTADUAL
    sqqTotalBCalculoEstadual_E.Close;
    sqqTotalBCalculoEstadual_E.SQL.Clear;
    sqqTotalBCalculoEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.BASE_CALCULO_VALOR_OPERACAO),0) AS TBC_E');
    sqqTotalBCalculoEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalBCalculoEstadual_E.SQL.Add(sWhere);

    sqqTotalBCalculoEstadual_E.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalBCalculoEstadual_E.SQL.Add(' AND ALIQUOTA > 0');

    sqqTotalBCalculoEstadual_E.Open;

    edtTBCalculoEst.Text := FormatFloat
      ('#,##0.00', sqqTotalBCalculoEstadual_E.FieldByName('TBC_E').AsCurrency);

    //TOTALIZA CREDITO ESTADUAL
    sqqTotalICreditadoEstadual_E.Close;
    sqqTotalICreditadoEstadual_E.SQL.Clear;
    sqqTotalICreditadoEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.IMPOSTO_CREDITADO),0) AS TCREDITO_E');
    sqqTotalICreditadoEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalICreditadoEstadual_E.SQL.Add(sWhere);

    sqqTotalICreditadoEstadual_E.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalICreditadoEstadual_E.Open;

    edtCreditoEst.Text := FormatFloat
      ('#,##0.00', sqqTotalICreditadoEstadual_E.FieldByName('TCREDITO_E').AsCurrency);

    //TOTALIZA ISENTAS ESTADUAL
    sqqTotalIsentasNTEstadual_E.Close;
    sqqTotalIsentasNTEstadual_E.SQL.Clear;
    sqqTotalIsentasNTEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TISENTAS_E');
    sqqTotalIsentasNTEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalIsentasNTEstadual_E.SQL.Add(sWhere);

    sqqTotalIsentasNTEstadual_E.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalIsentasNTEstadual_E.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 2');

    sqqTotalIsentasNTEstadual_E.Open;

    edtIsentasNTEst.Text := FormatFloat('#,##0.00', sqqTotalIsentasNTEstadual_E.FieldByName('TISENTAS_E').AsCurrency);

    //TOTALIZA OUTRAS ESTADUAL
    sqqTotalOutrasEstadual_E.Close;
    sqqTotalOutrasEstadual_E.SQL.Clear;
    sqqTotalOutrasEstadual_E.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TOUTRAS_E');
    sqqTotalOutrasEstadual_E.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalOutrasEstadual_E.SQL.Add(sWhere);

    sqqTotalOutrasEstadual_E.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalOutrasEstadual_E.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 3');

    sqqTotalOutrasEstadual_E.Open;

    edtOutrasEst.Text := FormatFloat('#,##0.00', sqqTotalOutrasEstadual_E.FieldByName('TOUTRAS_E').AsCurrency);




///*/*/*/*/*/**

    //TOTALIZA VLCONTABIL INTER_ESTADUAL
    sqqTotalizaVContabil_IE.Close;
    sqqTotalizaVContabil_IE.SQL.Clear;
    sqqTotalizaVContabil_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TVC_IE');
    sqqTotalizaVContabil_IE.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalizaVContabil_IE.SQL.Add(sWhere);

    sqqTotalizaVContabil_IE.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalizaVContabil_IE.Open;

    edtTVContalbilinter.Text := FormatFloat
      ('#,##0.00', sqqTotalizaVContabil_IE.FieldByName('TVC_IE').AsCurrency);

    //TOTALIZA b. CALCULO INTER_ESTADUAL
    sqqTotalizaBCalculo_IE.Close;
    sqqTotalizaBCalculo_IE.SQL.Clear;
    sqqTotalizaBCalculo_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.BASE_CALCULO_VALOR_OPERACAO),0) AS TBC_IE');
    sqqTotalizaBCalculo_IE.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalizaBCalculo_IE.SQL.Add(sWhere);

    sqqTotalizaBCalculo_IE.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalizaBCalculo_IE.SQL.Add(' AND ALIQUOTA > 0');

    sqqTotalizaBCalculo_IE.Open;

    edtTBCalculoInter.Text := FormatFloat
      ('#,##0.00', sqqTotalizaBCalculo_IE.FieldByName('TBC_IE').AsCurrency);

    //TOTALIZA CREDITO INTER_ESTADUAL
    sqqTotalICreditadoEstadual_IE.Close;
    sqqTotalICreditadoEstadual_IE.SQL.Clear;
    sqqTotalICreditadoEstadual_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.IMPOSTO_CREDITADO),0) AS TCREDITO_IE');
    sqqTotalICreditadoEstadual_IE.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalICreditadoEstadual_IE.SQL.Add(sWhere);

    sqqTotalICreditadoEstadual_IE.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalICreditadoEstadual_IE.Open;

    edtCreditoInter.Text := FormatFloat
      ('#,##0.00', sqqTotalICreditadoEstadual_IE.FieldByName('TCREDITO_IE').AsCurrency);

    //TOTALIZA ISENTAS INTER_ESTADUAL
    sqqTotalIsentasNTEstadual_IE.Close;
    sqqTotalIsentasNTEstadual_IE.SQL.Clear;
    sqqTotalIsentasNTEstadual_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TISENTAS_IE');
    sqqTotalIsentasNTEstadual_IE.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalIsentasNTEstadual_IE.SQL.Add(sWhere);

    sqqTotalIsentasNTEstadual_IE.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalIsentasNTEstadual_IE.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 2');

    sqqTotalIsentasNTEstadual_IE.Open;

    edtIsentasNTInter.Text := FormatFloat('#,##0.00', sqqTotalIsentasNTEstadual_IE.FieldByName('TISENTAS_IE').AsCurrency);


    //TOTALIZA OUTRAS ESTADUAL
    sqqTotalOutrasEstadual_IE.Close;
    sqqTotalOutrasEstadual_IE.SQL.Clear;
    sqqTotalOutrasEstadual_IE.SQL.Add('SELECT COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS TOUTRAS_IE');
    sqqTotalOutrasEstadual_IE.SQL.Add('FROM LIVRO_ENTRADA');

    if sWhere <> '' then
      sqqTotalOutrasEstadual_IE.SQL.Add(sWhere);

    sqqTotalOutrasEstadual_IE.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalOutrasEstadual_IE.SQL.Add(' AND CODIGO_VALORES_FISCAIS = 3');

    sqqTotalOutrasEstadual_IE.Open;

    edtOutrasInter.Text := FormatFloat('#,##0.00', sqqTotalOutrasEstadual_IE.FieldByName('TOUTRAS_IE').AsCurrency);


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

  case pOpcao of
    0: // data
      sWhere := 'WHERE LIVRO_SAIDA.DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text)))
        + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrToDate(edtDataFinal.Text)));
    1:// mes/ano
      sWhere := 'WHERE LIVRO_SAIDA.MES_ANO = ' + QuotedStr(cboPeriodoApuracao.Text);
    2:// documento
      sWhere := 'WHERE LIVRO_SAIDA.NUMERO_DOCUMENTO = ' + QuotedStr(edtPesquisa.Text);
  end;

  sqqTotalizaVContabilS.Close;
  sqqTotalizaVContabilS.SQL.Clear;
  sqqTotalizaVContabilS.SQL.Add('SELECT LIVRO_SAIDA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS VC_S');
  sqqTotalizaVContabilS.SQL.Add('FROM LIVRO_SAIDA LIVRO_SAIDA');
  sqqTotalizaVContabilS.SQL.Add('JOIN CFOP CFOP');
  sqqTotalizaVContabilS.SQL.Add('ON(LIVRO_SAIDA.CFOP = CFOP.CFOP)');

  if sWhere <> '' then
    sqqTotalizaVContabilS.SQL.Add(sWhere);

  sqqTotalizaVContabilS.SQL.Add('GROUP BY LIVRO_SAIDA.CFOP, CFOP.DESCRICAO');
  sqqTotalizaVContabilS.SQL.Add('ORDER BY LIVRO_SAIDA.CFOP, CFOP.DESCRICAO');

  sqqTotalizaVContabilS.Open;

    while not sqqTotalizaVContabilS.Eof do
    begin

      // TOTALIZA BASE POR CFOP
      sqqTotalizaBCalculoS.Close;
      sqqTotalizaBCalculoS.SQL.Clear;
      sqqTotalizaBCalculoS.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.BASE_CALCULO),0) AS BC_S');
      sqqTotalizaBCalculoS.SQL.Add('FROM LIVRO_SAIDA');

      if sWhere <> '' then
        sqqTotalizaBCalculoS.SQL.Add(sWhere);

      sqqTotalizaBCalculoS.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
      sqqTotalizaBCalculoS.SQL.Add('AND ALIQUOTA > 0');

      sqqTotalizaBCalculoS.Open;

      // TOTALIZA IMPOSTO DEBITADO POR CFOP
      sqqTotalizaDebito_S.Close;
      sqqTotalizaDebito_S.SQL.Clear;
      sqqTotalizaDebito_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.IMPOSTO_DEBITADO),0) AS ID_S');
      sqqTotalizaDebito_S.SQL.Add('FROM LIVRO_SAIDA');

      if sWhere <> '' then
        sqqTotalizaDebito_S.SQL.Add(sWhere);

      sqqTotalizaDebito_S.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
      sqqTotalizaDebito_S.SQL.Add('AND IMPOSTO_DEBITADO > 0');

      sqqTotalizaDebito_S.Open;

      // TOTALIZA ISENTAS NT POR CFOP
      sqqTotalizaIsentasNT_S.Close;
      sqqTotalizaIsentasNT_S.SQL.Clear;
      sqqTotalizaIsentasNT_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS ISENTAS_NT_S');
      sqqTotalizaIsentasNT_S.SQL.Add('FROM LIVRO_SAIDA');

      if sWhere <> '' then
        sqqTotalizaIsentasNT_S.SQL.Add(sWhere);

      sqqTotalizaIsentasNT_S.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
      sqqTotalizaIsentasNT_S.SQL.Add('AND ISENTAS_NAO_TRIBUTADAS > 0');

      sqqTotalizaIsentasNT_S.Open;

      edtIsentasNTEst_S.Text := FormatFloat('#,##0.00', sqqTotalizaIsentasNT_S.FieldByName('ISENTAS_NT_S').AsCurrency);

      // TOTALIZA OUTRAS POR CFOP
      sqqTotalizaOutras_S.Close;
      sqqTotalizaOutras_S.SQL.Clear;
      sqqTotalizaOutras_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS OUTRAS_S');
      sqqTotalizaOutras_S.SQL.Add('FROM LIVRO_SAIDA');

      if sWhere <> '' then
        sqqTotalizaOutras_S.SQL.Add(sWhere);

      sqqTotalizaOutras_S.SQL.Add('AND CFOP = ' + QuotedStr(sqqTotalizaVContabilS.FieldByName('CFOP').Value));
      sqqTotalizaOutras_S.SQL.Add('AND OUTRAS > 0');

      sqqTotalizaOutras_S.Open;

      edtOutrasEst_S.Text := FormatFloat('#,##0.00', sqqTotalizaOutras_S.FieldByName('OUTRAS_S').AsCurrency);

      stgTotaisCfopEstadualS.Cells[0, stgTotaisCfopEstadualS.RowCount - 1] := sqqTotalizaVContabilS.FieldByName('CFOP').Value;
      stgTotaisCfopEstadualS.Cells[1, stgTotaisCfopEstadualS.RowCount - 1] := Format('%-30.30s',[sqqTotalizaVContabilS.FieldByName('DESCRICAO').Value]);
      stgTotaisCfopEstadualS.Cells[2, stgTotaisCfopEstadualS.RowCount - 1] := Format('%12.12s', [FormatFloat('#,##0.00',sqqTotalizaVContabilS.FieldByName('VC_S').Value)]);
      stgTotaisCfopEstadualS.Cells[3, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaBCalculoS.FieldByName('BC_S').Value)]);
      stgTotaisCfopEstadualS.Cells[4, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaDebito_S.FieldByName('ID_S').Value)]);
      stgTotaisCfopEstadualS.Cells[5, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaIsentasNT_S.FieldByName('ISENTAS_NT_S').Value)]);
      stgTotaisCfopEstadualS.Cells[6, stgTotaisCfopEstadualS.RowCount - 1] := Format('%11.11s', [FormatFloat('#,##0.00',sqqTotalizaOutras_S.FieldByName('OUTRAS_S').Value)]);

      if not sqqTotalizaVContabilS.Eof then
        stgTotaisCfopEstadualS.RowCount := stgTotaisCfopEstadualS.RowCount + 1;

      sqqTotalizaVContabilS.Next;

    end;

    //TOTALIZA VLCONTABIL ESTADUAL
    sqqTotalVLContEstadual_S.Close;
    sqqTotalVLContEstadual_S.SQL.Clear;
    sqqTotalVLContEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS TVC_S');
    sqqTotalVLContEstadual_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalVLContEstadual_S.SQL.Add(sWhere);

    sqqTotalVLContEstadual_S.SQL.Add(' AND UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalVLContEstadual_S.Open;

    edtTVContalbilEST_S.Text := FormatFloat
      ('#,##0.00', sqqTotalVLContEstadual_S.FieldByName('TVC_S').AsCurrency);

    //TOTALIZA b. CALCULO ESTADUAL
    sqqTotalBCalculoEstadual_S.Close;
    sqqTotalBCalculoEstadual_S.SQL.Clear;
    sqqTotalBCalculoEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.BASE_CALCULO),0) AS TBC_S');
    sqqTotalBCalculoEstadual_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalBCalculoEstadual_S.SQL.Add(sWhere);

    sqqTotalBCalculoEstadual_S.SQL.Add(' AND UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalBCalculoEstadual_S.Open;

    edtTBCalculoeST_S.Text := FormatFloat
      ('#,##0.00', sqqTotalBCalculoEstadual_S.FieldByName('TBC_S').AsCurrency);

    //TOTALIZA DEBITO ESTADUAL
    sqqTotalIDebitadoEstadual_S.Close;
    sqqTotalIDebitadoEstadual_S.SQL.Clear;
    sqqTotalIDebitadoEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.IMPOSTO_DEBITADO),0) AS TDEBITO_S');
    sqqTotalIDebitadoEstadual_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalIDebitadoEstadual_S.SQL.Add(sWhere);

    sqqTotalIDebitadoEstadual_S.SQL.Add(' AND UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalIDebitadoEstadual_S.Open;

    edtDebitoEst.Text := FormatFloat
      ('#,##0.00', sqqTotalIDebitadoEstadual_S.FieldByName('TDEBITO_S').AsCurrency);

    //TOTALIZA ISENTAS ESTADUAL
    sqqTotalIsentasNTEstadual_S.Close;
    sqqTotalIsentasNTEstadual_S.SQL.Clear;
    sqqTotalIsentasNTEstadual_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.ISENTAS_NAO_TRIBUTADAS),0) AS TISENTAS_S');
    sqqTotalIsentasNTEstadual_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalIsentasNTEstadual_S.SQL.Add(sWhere);

    sqqTotalIsentasNTEstadual_S.SQL.Add(' AND UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalIsentasNTEstadual_S.SQL.Add(' AND ISENTAS_NAO_TRIBUTADAS > 0');

    sqqTotalIsentasNTEstadual_S.Open;

    edtIsentasNTEst_S.Text := FormatFloat('#,##0.00', sqqTotalIsentasNTEstadual_S.FieldByName('TISENTAS_S').AsCurrency);

    //TOTALIZA OUTRAS ESTADUAL
    sqqTotalOutrasEstadual_S.Close;
    sqqTotalOutrasEstadual_S.SQL.Clear;
    sqqTotalOutrasEstadual_S.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS TOUTRAS_S');
    sqqTotalOutrasEstadual_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalOutrasEstadual_S.SQL.Add(sWhere);

    sqqTotalOutrasEstadual_S.SQL.Add(' AND UF_DESTINATARIO = ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalOutrasEstadual_S.SQL.Add(' AND OUTRAS > 0');

    sqqTotalOutrasEstadual_S.Open;

    edtOutrasEst_S.Text := FormatFloat('#,##0.00', sqqTotalOutrasEstadual_S.FieldByName('TOUTRAS_S').AsCurrency);


///*/*/*/*/*/**

    //TOTALIZA VLCONTABIL INTER_ESTADUAL
    sqqTotalizaVContabil_IE_S.Close;
    sqqTotalizaVContabil_IE_S.SQL.Clear;
    sqqTotalizaVContabil_IE_S.SQL.Add('SELECT COALESCE(SUM(LIVRO_SAIDA.VALOR_CONTABIL),0) AS TVC_IE_S');
    sqqTotalizaVContabil_IE_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalizaVContabil_IE_S.SQL.Add(sWhere);

    sqqTotalizaVContabil_IE_S.SQL.Add(' AND UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalizaVContabil_IE_S.Open;

    edtTVContalbilinter_S.Text := FormatFloat
      ('#,##0.00', sqqTotalizaVContabil_IE_S.FieldByName('TVC_IE_S').AsCurrency);

    //TOTALIZA b. CALCULO INTER_ESTADUAL
    sqqTotalizaBCalculo_IE_S.Close;
    sqqTotalizaBCalculo_IE_S.SQL.Clear;
    sqqTotalizaBCalculo_IE_S.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO),0) AS TBC_IE_S');
    sqqTotalizaBCalculo_IE_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalizaBCalculo_IE_S.SQL.Add(sWhere);

    sqqTotalizaBCalculo_IE_S.SQL.Add(' AND UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalizaBCalculo_IE_S.SQL.Add(' AND ALIQUOTA > 0');
    sqqTotalizaBCalculo_IE_S.Open;

    edtTBCalculoInter.Text := FormatFloat
      ('#,##0.00', sqqTotalizaBCalculo_IE.FieldByName('TBC_IE').AsCurrency);

    //TOTALIZA CREDITO INTER_ESTADUAL
    sqqTotalIDebitadoEstadual_IE_S.Close;
    sqqTotalIDebitadoEstadual_IE_S.SQL.Clear;
    sqqTotalIDebitadoEstadual_IE_S.SQL.Add('SELECT COALESCE(SUM(IMPOSTO_DEBITADO),0) AS TDEBITO_IE');
    sqqTotalIDebitadoEstadual_IE_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalIDebitadoEstadual_IE_S.SQL.Add(sWhere);

    sqqTotalIDebitadoEstadual_IE_S.SQL.Add(' AND UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));

    sqqTotalIDebitadoEstadual_IE_S.Open;

    edtDebitoInter.Text := FormatFloat
      ('#,##0.00', sqqTotalIDebitadoEstadual_IE_S.FieldByName('TDEBITO_IE').AsCurrency);

    //TOTALIZA ISENTAS INTER_ESTADUAL
    sqqTotalIsentasNTEstadual_IE_S.Close;
    sqqTotalIsentasNTEstadual_IE_S.SQL.Clear;
    sqqTotalIsentasNTEstadual_IE_S.SQL.Add('SELECT COALESCE(SUM(ISENTAS_NAO_TRIBUTADAS),0) AS TISENTAS_IE_S');
    sqqTotalIsentasNTEstadual_IE_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalIsentasNTEstadual_IE_S.SQL.Add(sWhere);

    sqqTotalIsentasNTEstadual_IE_S.SQL.Add(' AND UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalIsentasNTEstadual_IE_S.SQL.Add(' AND ISENTAS_NAO_TRIBUTADAS > 0');

    sqqTotalIsentasNTEstadual_IE_S.Open;

    edtIsentasNTInter_S.Text := FormatFloat('#,##0.00', sqqTotalIsentasNTEstadual_IE_S.FieldByName('TISENTAS_IE_S').AsCurrency);

    //TOTALIZA OUTRAS ESTADUAL
    sqqTotalOutrasEstadual_IE_S.Close;
    sqqTotalOutrasEstadual_IE_S.SQL.Clear;
    sqqTotalOutrasEstadual_IE_S.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS TOUTRAS_IE_S');
    sqqTotalOutrasEstadual_IE_S.SQL.Add('FROM LIVRO_SAIDA');

    if sWhere <> '' then
      sqqTotalOutrasEstadual_IE_S.SQL.Add(sWhere);

    sqqTotalOutrasEstadual_IE_S.SQL.Add(' AND UF_DESTINATARIO <> ' + QuotedStr(dmCDSMaster.cdsFilial.FieldByName('ESTADO').Value));
    sqqTotalOutrasEstadual_IE_S.SQL.Add(' AND OUTRAS > 0');

    sqqTotalOutrasEstadual_IE_S.Open;

    edtOutrasInter_S.Text := FormatFloat('#,##0.00', sqqTotalOutrasEstadual_IE_S.FieldByName('TOUTRAS_IE_S').AsCurrency);

end;

end.
