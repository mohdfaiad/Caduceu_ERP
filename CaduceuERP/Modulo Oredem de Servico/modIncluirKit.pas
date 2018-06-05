unit modIncluirKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  JvExStdCtrls, JvEdit, JvValidateEdit, Data.DB;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmIncluirKitMontado = class(TForm)
    grpItenskit: TGroupBox;
    imgConfirmar: TImage;
    imgSair: TImage;
    grdItensProducao: TDBGrid;
    grpTotais: TGroupBox;
    lblValorVenda: TLabel;
    lblValorDesconto: TLabel;
    lblValorTotal: TLabel;
    edtValorVenda: TDBEdit;
    edtValorDesconto: TDBEdit;
    edtValorTotal: TDBEdit;
    grpInformacoesGerais: TGroupBox;
    grpQuantidade: TGroupBox;
    edtQuantidade: TJvValidateEdit;
    grpValorUnitario: TGroupBox;
    edtValor: TJvValidateEdit;
    grpDataUtilizacao: TGroupBox;
    dtpDataUtilizacao: TDateTimePicker;
    grpTecnicoResponsavel: TGroupBox;
    cboTecnicoResponsavel: TDBLookupComboBox;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    procedure imgSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdItensProducaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataUtilizacaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluirKitMontado: TfrmIncluirKitMontado;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes;

procedure TfrmIncluirKitMontado.dtpDataUtilizacaoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmIncluirKitMontado.edtQuantidadeEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmIncluirKitMontado.edtQuantidadeExit(Sender: TObject);
begin

  if edtQuantidade.Value > 0 then
    edtValor.Value := edtQuantidade.Value * dmMProvider.cdsProducaoVALOR_TOTAL.Value;

end;

procedure TfrmIncluirKitMontado.edtQuantidadeKeyDown(Sender: TObject;
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

procedure TfrmIncluirKitMontado.edtQuantidadeKeyPress(Sender: TObject;
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

procedure TfrmIncluirKitMontado.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                           := COR_PADRAO_DIALOGOS;

  for i := 0 to grdItensProducao.Columns.Count - 1 do
    grdItensproducao.Columns[i].Title.Color := COR_TITULO_GRADE;

  edtValor.Value := dmMProvider.cdsProducaoVALOR_TOTAL.Value;

  dtpDataUtilizacao.Date := Date;

end;

procedure TfrmIncluirKitMontado.grdItensProducaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsItemProducao.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItemProducao.RecNo) then
    begin

      grdItensProducao.Canvas.Font.Color   := clBlack;
      grdItensProducao.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdItensProducao.Canvas.Font.Color   := clBlack;
      grdItensProducao.Canvas.Brush.Color  := clWhite;

    end;

    grdItensProducao.Canvas.FillRect(Rect);
    grdItensProducao.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmIncluirKitMontado.imgConfirmarClick(Sender: TObject);
begin

  if (edtQuantidade.Value > 0) and (Length(Trim(cboTecnicoResponsavel.Text)) > 0 ) then
  begin

    if not dmMProvider.cdsItens_OS_Pecas.Active then
      dmMProvider.cdsItens_OS_Pecas.Open;

    dmMProvider.cdsItemProducao.First;

    while not dmMProvider.cdsItemProducao.Eof do
    begin

      dmMProvider.cdsItens_OS_Pecas.Append;
      dmMProvider.cdsItens_OS_PecasITENS_OS_PECAS.Value := (dmMProvider.cdsItens_OS_Pecas.RecordCount + 1);
      dmMProvider.cdsItens_OS_PecasCODIGO_PECA.Value    := dmMProvider.cdsItemProducaoPRODUTO.Value;
      dmMProvider.cdsItens_OS_PecasDESCRICAO.Value      := dmMProvider.cdsItemProducaoDESCRICAO_PRODUTO.Value;
      dmMProvider.cdsItens_OS_PecasVALOR_UNITARIO.Value := dmMProvider.cdsItemProducaoTOTAL_VENDA.Value;
      dmMProvider.cdsItens_OS_PecasFUNCIONARIO.Value    := dmMProvider.cdsFuncionariosFUNCIONARIO.Value;
      dmMProvider.cdsItens_OS_PecasQUANTIDADE.Value     := dmMProvider.cdsItemProducaoQUANTIDADE.Value  * edtQuantidade.Value;
      dmMProvider.cdsItens_OS_PecasDIA.AsDateTime       := dtpDataUtilizacao.DateTime;
      dmMProvider.cdsItens_OS_PecasVALOR_TOTAL.Value    := (dmMProvider.cdsItens_OS_PecasQUANTIDADE.Value * dmMProvider.cdsItemProducaoTOTAL_VENDA.Value);
      dmMProvider.cdsItens_OS_Pecas.post;

      dmMProvider.cdsItemProducao.Next;

    end;

    ModalResult := mrOk

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VALIDA_TENCNO_RESPONS;
    Application.ProcessMessages;

    cboTecnicoResponsavel.SetFocus;

  end;

end;

procedure TfrmIncluirKitMontado.imgSairClick(Sender: TObject);
begin

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
