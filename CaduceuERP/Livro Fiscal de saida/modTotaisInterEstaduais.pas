unit modTotaisInterEstaduais;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Forms,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Vcl.Controls,
  Vcl.Grids;


type
  TfrmTotaisInterEstaduais = class(TForm)
    stgTotaisInterEstadual: TStringGrid;
    Panel1: TPanel;
    edtTVContalbil: TEdit;
    edtTBCalculo: TEdit;
    edtIsentas: TEdit;
    edtOutras: TEdit;
    edtICMSRetido: TEdit;
    edtBaseICMSR: TEdit;
    btnSair: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    fdqTotalizaValorContabil: TFDQuery;
    fdqTotalizaOutras: TFDQuery;
    fdqTotalizaIsentas: TFDQuery;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sWhere:string;
  public
    { Public declarations }
  end;

var
  frmTotaisInterEstaduais: TfrmTotaisInterEstaduais;

implementation

uses modLivroFiscalSaida, dataDBEXMaster, dataMProvider, uFuncoes;

{$R *.dfm}

procedure TfrmTotaisInterEstaduais.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTotaisInterEstaduais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTotaisInterEstaduais.FormCreate(Sender: TObject);
var
  iContador:integer;
  sUf_Origem:string;
begin

  iContador := 1;

  DesabilitarBotaoFecharForm(handle);

  stgTotaisInterEstadual.Cols[0].Text := 'UF Destino';
  stgTotaisInterEstadual.Cols[1].Text := 'V.Cont. n/Contrib';
  stgTotaisInterEstadual.Cols[2].Text := 'V.Cont. Contrib';
  stgTotaisInterEstadual.Cols[3].Text := 'B.Calc. n/Contrib';
  stgTotaisInterEstadual.Cols[4].Text := 'B.Calc. Contrib';
  stgTotaisInterEstadual.Cols[5].Text := 'Isentas';
  stgTotaisInterEstadual.Cols[6].Text := 'Outras';
  stgTotaisInterEstadual.Cols[7].Text := 'ICMS Ret';
  stgTotaisInterEstadual.Cols[8].Text := 'B. C�lculo';

  if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
  begin

    fdqTotalizaValorContabil.Close;
    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT UF_DESTINATARIO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO_SAIDA');
    fdqTotalizaValorContabil.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.SQL.Add('GROUP BY UF_DESTINATARIO');
    fdqTotalizaValorContabil.Open;

    while not fdqTotalizaValorContabil.Eof do
    begin

      stgTotaisInterEstadual.Cells[0,stgTotaisInterEstadual.RowCount-1] := Format('%2.2s',[fdqTotalizaValorContabil.FieldByName('UF_ORIGEM').AsString]);
      stgTotaisInterEstadual.Cells[1,stgTotaisInterEstadual.RowCount-1] := Format('%13.13s',[FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('VC').AsCurrency)]);

      fdqTotalizaValorContabil.Next;
      if not fdqTotalizaValorContabil.Eof then
        stgTotaisInterEstadual.RowCount := stgTotaisInterEstadual.RowCount + 1;

    end;

    fdqTotalizaValorContabil.Close;
    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO_SAIDA');
    fdqTotalizaValorContabil.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.Open;

    edtTVContalbil.Text := FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('VC').AsCurrency);

    fdqTotalizaValorContabil.Close;

    //base
    fdqTotalizaValorContabil.Close;
    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT UF_DESTINATARIO, COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
    fdqTotalizaValorContabil.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaValorContabil.SQL.Add('AND ALIQUOTA > 0');

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.SQL.Add('GROUP BY UF_DESTINATARIO');
    fdqTotalizaValorContabil.Open;

    while not fdqTotalizaValorContabil.Eof do
    begin

      stgTotaisInterEstadual.Cells[2,iContador] := Format('%12.12s',[FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('BC').AsCurrency)]);

      //isentas
      fdqTotalizaIsentas.Close;
      fdqTotalizaIsentas.SQL.Clear;
      fdqTotalizaIsentas.SQL.Add('SELECT UF_DESTINATARIO, COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
      fdqTotalizaIsentas.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('UF_ORIGEM').AsString));

      if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
        sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
      else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
        sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
      else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
        sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

      fdqTotalizaIsentas.SQL.Add(sWhere);

      fdqTotalizaIsentas.SQL.Add('GROUP BY UF_DESTINATARIO');
      fdqTotalizaIsentas.Open;

      stgTotaisInterEstadual.Cells[3,iContador] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaIsentas.FieldByName('BC').AsCurrency)]);
      fdqTotalizaIsentas.Close;

      //outras
      fdqTotalizaOutras.Close;
      fdqTotalizaOutras.SQL.Clear;
      fdqTotalizaOutras.SQL.Add('SELECT UF_DESTINATARIO, COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
      fdqTotalizaOutras.SQL.Add('WHERE UF_DESTINATARIO = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('UF_ORIGEM').AsString));

      if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
        sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
      else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
        sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
      else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
        sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

      fdqTotalizaOutras.SQL.Add(sWhere);

      fdqTotalizaOutras.SQL.Add('GROUP BY UF_DESTINATARIO');
      fdqTotalizaOutras.Open;

      stgTotaisInterEstadual.Cells[4,iContador] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaOutras.FieldByName('BC').AsCurrency)]);
      stgTotaisInterEstadual.Cells[5,iContador] := Format('%11.11s',[FormatFloat('#,##0.00',0)]);
      stgTotaisInterEstadual.Cells[6,iContador] := Format('%11.11s',[FormatFloat('#,##0.00',0)]);
      fdqTotalizaOutras.Close;

      fdqTotalizaValorContabil.Next;
      inc(iContador);

    end;

    fdqTotalizaValorContabil.Close;
    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
    fdqTotalizaValorContabil.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaValorContabil.SQL.Add('AND ALIQUOTA > 0');

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text)))
         + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.Open;

    edtTBCalculo.Text := FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('BC').AsCurrency);

    fdqTotalizaValorContabil.Close;

    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
    fdqTotalizaValorContabil.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text)))
         + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.Open;

    edtIsentas.Text := FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('BC').AsCurrency);

    //isentas
    fdqTotalizaIsentas.Close;
    fdqTotalizaIsentas.SQL.Clear;
    fdqTotalizaIsentas.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
    fdqTotalizaIsentas.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaIsentas.SQL.Add(sWhere);

    fdqTotalizaIsentas.Open;

    edtIsentas.Text := FormatFloat('#,##0.00',fdqTotalizaIsentas.FieldByName('BC').AsCurrency);
    fdqTotalizaIsentas.Close;

    //outras
    fdqTotalizaOutras.Close;
    fdqTotalizaOutras.SQL.Clear;
    fdqTotalizaOutras.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO),0) AS BC FROM LIVRO_SAIDA');
    fdqTotalizaOutras.SQL.Add('WHERE UF_DESTINATARIO <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := 'AND DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :='AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :='AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

    fdqTotalizaOutras.SQL.Add(sWhere);

    fdqTotalizaOutras.Open;

    edtOutras.Text := FormatFloat('#,##0.00',fdqTotalizaOutras.FieldByName('BC').AsCurrency);
    fdqTotalizaOutras.Close;

    fdqTotalizaOutras.Close;

  end;

end;

end.
