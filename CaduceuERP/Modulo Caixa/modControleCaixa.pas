unit modControleCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmControleCaixa = class(TForm)
    imgCancelar: TImage;
    grpInfoCaixa: TGroupBox;
    grpMovimentoCaixa: TGroupBox;
    txtDataAbertura: TDBText;
    txtHoraAbertura: TDBText;
    txtFuncionario: TDBText;
    txtValorAbertura: TDBText;
    txtValorMovimento: TDBText;
    lblDataAbertura: TLabel;
    lblHoraAbertura: TLabel;
    lblValorAbertura: TLabel;
    lblValorMovimento: TLabel;
    grdFluxoCXLoja: TDBGrid;
    imgLancamento: TImage;
    grpTotais: TGroupBox;
    lblEspecie: TLabel;
    lblCheques: TLabel;
    lblCartoes: TLabel;
    lblOutros: TLabel;
    txtEmEspecie: TDBText;
    txtEmCheques: TDBText;
    txtEmCartoes: TDBText;
    txtOutros: TDBText;
    grpHistorico: TGroupBox;
    txtHistorico: TDBText;
    Label1: TLabel;
    txtValorPrazo: TDBText;
    grpOutrasInformações: TGroupBox;
    procedure imgCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgLancamentoClick(Sender: TObject);
    procedure grdFluxoCXLojaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure AbrirItemCaixa(pCaixa:integer);
  public
    { Public declarations }
  end;

var
  frmControleCaixa: TfrmControleCaixa;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes,
  modLancamentoManualCXLoja, dataMRelatorios, dataMSProcedure;

procedure TfrmControleCaixa.AbrirItemCaixa(pCaixa: integer);
begin

  dmMProvider.cdsCaixaLoja.Close;
  dmMProvider.cdsCaixaLoja.ProviderName := 'dspCaixa_loja';

  dmDBEXMaster.fdqCaixaLoja.SQL.Clear;
  dmDBEXMaster.fdqCaixaLoja.SQL.Add('select * from caixa_loja');
  dmDBEXMaster.fdqCaixaLoja.SQL.Add('where data_abertura = ' + QuotedStr(FormatDateTime('mm/dd/yy',Date)));

  dmMProvider.cdsCaixaLoja.Open;
  dmMProvider.cdsCaixaLoja.ProviderName := '';

  dmMProvider.cdsItemCaixaLoja.Close;
  dmMProvider.cdsItemCaixaLoja.ProviderName := 'dspItemCaixaLoja';

  dmDBEXMaster.fdqItemCaixaLoja.SQL.Clear;
  dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('select * from item_caixa_loja');
  dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where caixa_loja = ' + IntToStr(pCaixa));

  dmMProvider.cdsItemCaixaLoja.Open;
  dmMProvider.cdsItemCaixaLoja.ProviderName := '';
  dmMProvider.cdsItemCaixaLoja.Last;

end;

procedure TfrmControleCaixa.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(handle);

  AbrirItemCaixa(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value);

  for i := 0 to grdFluxoCXLoja.Columns.Count - 1 do
    grdFluxoCXLoja.Columns[i].Title.Color := COR_TITULO_GRADE;

end;

procedure TfrmControleCaixa.grdFluxoCXLojaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsItemCaixaLoja.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItemCaixaLoja.RecNo) then
    begin

      grdFluxoCXLoja.Canvas.Font.Color  := clBlack;
      grdFluxoCXLoja.Canvas.Brush.Color := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdFluxoCXLoja.Canvas.Font.Color := clBlack;
      grdFluxoCXLoja.Canvas.Brush.Color := clWhite;

    end;

    if Column.Index = 3 then
      grdFluxoCXLoja.Canvas.Font.Color := clRed
    else
      grdFluxoCXLoja.Canvas.Font.color := clBlack;

    if Column.Index = 4 then
      grdFluxoCXLoja.Canvas.Font.Color := clBlue;

    if Column.Index = 6 then
      grdFluxoCXLoja.Canvas.Font.Color := clGreen;

    grdFluxoCXLoja.Canvas.FillRect(Rect);
    grdFluxoCXLoja.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmControleCaixa.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmControleCaixa.imgLancamentoClick(Sender: TObject);
begin

  frmLancamentoManualCXLoja := TfrmLancamentoManualCXLoja.Create(self);

  frmLancamentoManualCXLoja.ShowModal;
  FreeAndNil(frmLancamentoManualCXLoja);

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
