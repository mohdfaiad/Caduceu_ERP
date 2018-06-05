unit modIntegracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.CheckLst, DateUtils,
  ACBrSintegra, ACBrSpedPisCofins, ACBrSpedFiscal, AdvSmoothWin8Marquee, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  ACBrBase;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmIntegracao = class(TForm)
    lstItens: TListView;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    pgcIntegracao: TPageControl;
    tbsSintegra: TTabSheet;
    tbsSPEDFiscal: TTabSheet;
    tbsSPEDContribuicoes: TTabSheet;
    imgSintegra: TImage;
    imgSpedFiscal: TImage;
    imgSpedContribuicoes: TImage;
    grpPeriodoSintegra: TGroupBox;
    lblDataInicialSintegra: TLabel;
    dtpInicioSintegra: TDateTimePicker;
    dtpFimSintegra: TDateTimePicker;
    lblDataFinalSintegra: TLabel;
    rdgFinalidadeSintegra: TRadioGroup;
    rdgOperacaoSintegra: TRadioGroup;
    grpRegistrosSintegra: TGroupBox;
    chkRegistroSintegra: TCheckListBox;
    grpConteudoSintegra: TGroupBox;
    memConteudoSintegra: TMemo;
    imgConfirmar: TImage;
    grpPeridoSpedFiscal: TGroupBox;
    lblSpedFDataInicial: TLabel;
    lblSpedFDataFinal: TLabel;
    dtpSpedFDataInicial: TDateTimePicker;
    dtpSpedFDataFinal: TDateTimePicker;
    grpBlocosSPEDF: TGroupBox;
    chkBlocosSPEDF: TCheckListBox;
    rdgFinalidadeSPEDF: TRadioGroup;
    pnlProgresso: TPanel;
    grpConteudoSPEDFiscal: TGroupBox;
    memConteudoSPEDFiscal: TMemo;
    grpDatasSpedContribuicoes: TGroupBox;
    lblDataInicialSPEDContribuicoes: TLabel;
    lblDataFinalSPEDContribuicoes: TLabel;
    dtpSpedContribuicoesInicial: TDateTimePicker;
    dtpSpedContribuicoesFinal: TDateTimePicker;
    rgpTipoEscrituracao: TRadioGroup;
    rgpIndicadorSitacao: TRadioGroup;
    rgpRegimeApuracao: TRadioGroup;
    rgpMetodoApropriacaoCredito: TRadioGroup;
    rgpTipoContrApurada: TRadioGroup;
    rgpCriterioApuracao: TRadioGroup;
    grpBlocosContribuicoes: TGroupBox;
    chkBlocosSpedContribuicoes: TCheckListBox;
    grpNumeroRecibo: TGroupBox;
    edtNumeroEscrituracaoAnterior: TEdit;
    grpConteudoSPEDContribuicoes: TGroupBox;
    memConteudoSPEDContribuicoes: TMemo;
    chkGerarSPEDContribuicoesSM: TCheckBox;
    lblC470: TLabel;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    ACBrSPEDPisCofins1: TACBrSPEDPisCofins;
    ACBrSintegra1: TACBrSintegra;
    advMarquueProcesso: TAdvSmoothWin8Marquee;
    grpInvetarios: TGroupBox;
    grdInventario: TDBGrid;
    rdgMotivoInventario: TDBRadioGroup;
    pnlAvisoInvetario: TPanel;
    rdgIndicadorApuracaoContr: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure lstItensClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure dtpInicioSintegraCloseUp(Sender: TObject);
    procedure dtpSpedFDataInicialCloseUp(Sender: TObject);
    procedure rgpTipoEscrituracaoClick(Sender: TObject);
    procedure dtpSpedContribuicoesInicialCloseUp(Sender: TObject);
    procedure ACBrSPEDPisCofins1EventsBloco_CBeforeWriteRegistroC481(const AC481: TObject; var ANullVL_BC_PIS, ANullALIQ_PIS,
      ANullQUANT_BC_PIS, ANullALIQ_PIS_QUANT, ANullVL_PIS: Boolean);
    procedure ACBrSPEDPisCofins1EventsBloco_CBeforeWriteRegistroC485(const AC485: TObject; var ANullVL_BC_COFINS, ANullALIQ_COFINS,
      ANullQUANT_BC_COFINS, ANullALIQ_COFINS_QUANT, ANullVL_COFINS: Boolean);
    procedure chkBlocosSPEDFClick(Sender: TObject);
  private
    { Private declarations }
    procedure OcultarAbas;
    procedure AbrirTabelaInventario;
  public
    { Public declarations }
    iHoraInicial: TDateTime;
  end;

var
  frmIntegracao: TfrmIntegracao;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSProcedure, uConstantes_Padrao, uFuncoes, modSintegra, modSpedFiscal,
  modSpedContribuicoes, dataMSource, dataSintegraSped;


procedure TfrmIntegracao.AbrirTabelaInventario;
var
  wAno, wMes, wDia:word;
begin

  DecodeDate(dtpSpedFDataInicial.Date,wAno, wMes, wDia);

  dmMProvider.cdsInventario.Close;
  dmMProvider.cdsInventario.ProviderName := 'dspInventario';

  dmRelatorios.fdqInventario.SQL.Clear;
  dmRelatorios.fdqInventario.SQL.Add('select * from inventario');
  dmRelatorios.fdqInventario.SQL.Add('where status = 1');
  dmRelatorios.fdqInventario.SQL.Add('order by anodereferencia');

  dmMProvider.cdsInventario.Open;
  dmMProvider.cdsInventario.ProviderName := '';

  dmMProvider.cdsInventario.Last;

end;

procedure TfrmIntegracao.ACBrSPEDPisCofins1EventsBloco_CBeforeWriteRegistroC481(
  const AC481: TObject; var ANullVL_BC_PIS, ANullALIQ_PIS, ANullQUANT_BC_PIS,
  ANullALIQ_PIS_QUANT, ANullVL_PIS: Boolean);
begin

  ANullVL_BC_PIS      := false;
  ANullALIQ_PIS       := false;
  ANullQUANT_BC_PIS   := True;
  ANullALIQ_PIS_QUANT := True;
  ANullVL_PIS         := false;

end;

procedure TfrmIntegracao.ACBrSPEDPisCofins1EventsBloco_CBeforeWriteRegistroC485(
  const AC485: TObject; var ANullVL_BC_COFINS, ANullALIQ_COFINS,
  ANullQUANT_BC_COFINS, ANullALIQ_COFINS_QUANT, ANullVL_COFINS: Boolean);
begin

  ANullVL_BC_COFINS       := false;
  ANullALIQ_COFINS        := false;
  ANullQUANT_BC_COFINS    := True;
  ANullALIQ_COFINS_QUANT  := True;
  ANullVL_COFINS          := false;

end;

procedure TfrmIntegracao.chkBlocosSPEDFClick(Sender: TObject);
begin

  if chkBlocosSPEDF.Checked[5] then
    AbrirTabelaInventario
  else
    dmMProvider.cdsInventario.Close;

end;

procedure TfrmIntegracao.dtpInicioSintegraCloseUp(Sender: TObject);
begin

  dtpFimSintegra.Date := EndOfTheMonth(dtpInicioSintegra.Date);

end;

procedure TfrmIntegracao.dtpSpedContribuicoesInicialCloseUp(Sender: TObject);
begin

  dtpSpedContribuicoesFinal.Date := EndOfTheMonth(dtpSpedContribuicoesInicial.Date);

end;

procedure TfrmIntegracao.dtpSpedFDataInicialCloseUp(Sender: TObject);
begin

  dtpSpedFDataFinal.Date := EndOfTheMonth(dtpSpedFDataInicial.Date);

end;

procedure TfrmIntegracao.FormCreate(Sender: TObject);
var
 i:integer;
 wAno, wDia, wMes:word;
begin

  DesabilitarGhostingDoWindows;

  DecodeDate(dtpSpedFDataFinal.Date,wAno, wMes, wDia);

  DesabilitarBotaoFecharForm(self.Handle);

  Color                           := COR_PADRAO_TELAS;
  Caption                         := ' ' + Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(ParamStr(0),1);

  dmDBEXMaster.sNomeUsuario       := ParamStr(1);
  dmDBEXMaster.sSenha             := paramstr(2);
  dmDBEXMaster.iIdUsuario         := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial          := StrToInt(ParamStr(4));


//  if dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value = 1 then
//    rgpreRegimeApuracao.ItemIndex := dmDBEXMaster.sqqFilial.FieldByName('REGIME_TRIBUTARIO').AsInteger;


  OcultarAbas;

  for i := 0 to lstItens.Groups.Count - 1 do
    lstItens.Groups[i].State := [lgsCollapsible, lgsCollapsed];

  for i := 0 to chkRegistroSintegra.Items.Count - 1 do
    chkRegistroSintegra.Checked[i] := True;

  for i := 0 to chkBlocosSPEDF.Items.Count - 1 do
    chkBlocosSPEDF.Checked[i] := True;

  chkBlocosSPEDF.Checked[5] := ((wMes = 12) or (wMes = 1) or (wMes = 2));

  for i := 0 to chkBlocosSpedContribuicoes.Items.Count - 1 do
    chkBlocosSpedContribuicoes.Checked[i] := True;

  dtpInicioSintegra.Date            := StartOfTheMonth(Date - 30);
  dtpFimSintegra.Date               := EndOfTheMonth(Date - 30);

  dtpSpedFDataInicial.Date          := StartOfTheMonth(Date - 30);
  dtpSpedFDataFinal.Date            := EndOfTheMonth(Date - 30);

  dtpSpedContribuicoesInicial.Date  := StartOfTheMonth(Date - 30);
  dtpSpedContribuicoesFinal.Date    := EndOfTheMonth(Date - 30);

  if dmMProvider.cdsFilialPERFIL_SPED.Value = 2 then
    lstItens.Items.Delete(lstItens.Groups.Count-1);

  for i := 0 to grdInventario.Columns.Count - 1 do
    grdInventario.Columns[i].Title.Color := COR_TITULO_GRADE;

end;

procedure TfrmIntegracao.imgConfirmarClick(Sender: TObject);
var
  iDia, iMes, iAno: Word;
  sMes, sPath: string;
begin



  sMes := MesExtenso(dtpInicioSintegra.Date);

  case pgcIntegracao.ActivePageIndex of
    0:begin  //sintegra

        if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'SINTEGRA_' + FormatDateTime('yyyy', dtpInicioSintegra.Date)) then
          CriarPasta(ExtractFilePath(Application.ExeName) + 'SINTEGRA_' + FormatDateTime('yyyy', dtpInicioSintegra.Date) + '\');

        memConteudoSintegra.Clear;

        iHoraInicial                        := Time;

        case rdgOperacaoSintegra.ItemIndex of
          2:GerarSintegraTotalidade(ExtractFilePath(Application.ExeName) + 'SINTEGRA_'
                + FormatDateTime('yyyy', dtpInicioSintegra.Date) + '\'
                + MesExtenso(dtpInicioSintegra.Date)
                + '_' + dmMProvider.cdsFilialCNPJ.Value + '.txt');

        end;

      end;
    1:begin // sped fiscal

        sMes := MesExtenso(dtpSpedFDataInicial.Date);

        sPath := ExtractFilePath(Application.ExeName) + 'SPED_FISCAL_' + FormatDateTime('yyyy', dtpSpedFDataInicial.Date);

        if not DirectoryExists(sPath) then
          CriarPasta(sPath + '\');

        ACBrSPEDFiscal1.Path                := sPath;
        ACBrSPEDFiscal1.Arquivo             := 'SPED_FISCAL_' + MesExtenso(dtpSpedFDataFinal.Date) + '_' + dmMProvider.cdsFilialCNPJ.Value + '.txt';

        iHoraInicial                        := Time;

        memConteudoSPEDFiscal.Clear;

        Gerar_SPED_Fiscal(ExtractFilePath(Application.ExeName) + 'SPED_FISCAL_'
                          + FormatDateTime('yyyy', dtpSpedFDataInicial.Date) + '\'
                          + 'SPED_FISCAL_' +  sMes
                          + '_' + dmMProvider.cdsFilialCNPJ.Value + '.txt');

        pnlProgresso.Visible                          := False;

      end;
    2:begin // sped contribuições

        case rgpTipoEscrituracao.ItemIndex of
          1:begin

                if Length(Trim(edtNumeroEscrituracaoAnterior.Text)) < 41 then
                begin

                  lblMsg.Caption     := dmDBEXMaster.sNomeUsuario + MSG_RECIBO_CONTR_RETIFICA_INV + ' tamanho informado = ' + IntToStr(Length(Trim(edtNumeroEscrituracaoAnterior.Text)))+' !';
                  Application.ProcessMessages;
                  edtNumeroEscrituracaoAnterior.SetFocus;
                  exit;

                end;

            end;
        end;

        lblMsg.Caption                      := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
        Application.ProcessMessages;

        sMes := MesExtenso(dtpSpedContribuicoesInicial.Date);

        sPath := ExtractFilePath(Application.ExeName) + 'SPED_CONTRIBUICOES_' + FormatDateTime('yyyy', dtpSpedContribuicoesInicial.Date);

        if not DirectoryExists(sPath) then
          CriarPasta(sPath + '\');

        ACBrSPEDPisCofins1.Path             := sPath;
        ACBrSPEDPisCofins1.Arquivo          := 'SPED_Contribuicoes_' + sMes + '_' + dmMProvider.cdsFilialCNPJ.Value + '.txt';

        iHoraInicial                        := Time;

        Gerar_SPED_Contribuicoes(ExtractFilePath(Application.ExeName) + 'SPED_CONTRIBUICOES_'
                          + FormatDateTime('yyyy', dtpSpedContribuicoesInicial.Date) + '\'
                          + 'SPED_Contribuicoes_' + sMes + '_' + dmMProvider.cdsFilialCNPJ.Value + '.txt');

      end;
  end;

end;

procedure TfrmIntegracao.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmIntegracao.lstItensClick(Sender: TObject);
begin

  OcultarAbas;

  if lstItens.ItemIndex > -1 then
  begin

    if lstItens.Items[lstItens.ItemIndex].Caption  = 'Sintegra' then

      tbsSintegra.TabVisible          := True

    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'SPED EFD ICMS IPI' then
    begin

      tbsSPEDFiscal.TabVisible        := True;

      if chkBlocosSPEDF.Checked[5] then
        AbrirTabelaInventario;

    end

    else if lstItens.Items[lstItens.ItemIndex].Caption  = 'SPED EFD Contribuições' then

      tbsSPEDContribuicoes.TabVisible := True;

  end;

end;

procedure TfrmIntegracao.OcultarAbas;
var
  i:integer;
begin

  for i := 0 to pgcIntegracao.PageCount - 1 do
  begin

    pgcIntegracao.Pages[i].TabVisible := False;
    pgcIntegracao.Pages[i].Tag        := -1;

  end;

end;

procedure TfrmIntegracao.rgpTipoEscrituracaoClick(Sender: TObject);
begin

  case rgpTipoEscrituracao.ItemIndex of
    1:edtNumeroEscrituracaoAnterior.SetFocus;
  end;

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
