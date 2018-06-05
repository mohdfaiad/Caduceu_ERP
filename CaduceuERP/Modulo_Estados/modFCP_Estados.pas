unit modFCP_Estados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmFCP_Estados = class(TForm)
    grpPesquisasNCM: TGroupBox;
    lblCapituloNCM: TLabel;
    lblPosicaoNCM: TLabel;
    lblSubposicaoNCM: TLabel;
    lblItemNCM: TLabel;
    lblNCM_SH: TLabel;
    edtCapituloNCM: TEdit;
    edtPosicaoNCM: TEdit;
    edtSubposicaoNCM: TEdit;
    edtItemNCM: TEdit;
    edtNCM: TEdit;
    edtDescricaoNCM: TEdit;
    lblPorcentagemFCP: TLabel;
    edtPercentualFCP: TJvValidateEdit;
    grpProdutos: TGroupBox;
    grdProtudos: TDBGrid;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    imgConfirmar: TImage;
    imgSelecionar: TImage;
    chkExcecao: TCheckBox;
    procedure imgSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdProtudosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCapituloNCMEnter(Sender: TObject);
    procedure imgSelecionarClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtCapituloNCMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCapituloNCMKeyPress(Sender: TObject; var Key: Char);
    procedure edtNCMExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFCP_Estados: TfrmFCP_Estados;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, uConstantes_Padrao, uFuncoes;

procedure TfrmFCP_Estados.edtCapituloNCMEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmFCP_Estados.edtCapituloNCMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmFCP_Estados.edtCapituloNCMKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmFCP_Estados.edtNCMExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if length(Trim(edtNCM.Text)) > 0 then
  begin

    dmMProvider.cdsNcmNbs.Close;
    dmMProvider.cdsNcmNbs.ProviderName := 'dspNcmNbs';

    dmDBEXMaster.fdqNcmNbs.SQL.Clear;
    dmDBEXMaster.fdqNcmNbs.SQL.Add('select * from nbm_ncm');
    dmDBEXMaster.fdqNcmNbs.SQL.Add('where cod_ncm = ' + QuotedStr(Trim(edtNcm.Text)));

    dmMProvider.cdsNcmNbs.Open;
    dmMProvider.cdsNcmNbs.ProviderName := '';

    if dmMProvider.cdsNcmNbs.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' NCM: ' + Trim(edtNCM.Text);
      Application.ProcessMessages;
      edtNCM.SetFocus;

    end;

  end
  else
    edtDescricaoNCM.Clear;
end;

procedure TfrmFCP_Estados.FormCreate(Sender: TObject);
VAR
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  for i := 0 to grdProtudos.Columns.Count - 1 do
    grdProtudos.Columns[i].Title.Color := COR_TITULO_GRADE;

  edtPercentualFCP.Value := dmMProvider.cdsEstadosFCP.Value;

end;

procedure TfrmFCP_Estados.grdProtudosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsProdutos.IsEmpty then
  begin

    if not odd(dmMProvider.cdsProdutos.RecNo) then
    begin

      grdProtudos.Canvas.Font.Color   := clBlack;
      grdProtudos.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdProtudos.Canvas.Font.Color   := clBlack;
      grdProtudos.Canvas.Brush.Color  := clWhite;

    end;

    grdProtudos.Canvas.FillRect(Rect);
    grdProtudos.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmFCP_Estados.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if not (dmMProvider.cdsProdutos.IsEmpty) and (chkExcecao.Checked) then
    ModalResult := mrOk
  else if not (dmMProvider.cdsProdutos.IsEmpty) and (edtPercentualFCP.Value > 0) then
    ModalResult := mrOk
  else if edtPercentualFCP.Value <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' % FCP';
    Application.ProcessMessages;
    edtPercentualFCP.SetFocus;

  end;

end;

procedure TfrmFCP_Estados.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmFCP_Estados.imgSelecionarClick(Sender: TObject);
begin

  dmMProvider.cdsProdutos.Close;
  dmMProvider.cdsProdutos.ProviderName := 'dspProdutos';

  dmDBEXMaster.fdqProdutos.SQL.Clear;
  dmDBEXMaster.fdqProdutos.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
  dmDBEXMaster.fdqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
  dmDBEXMaster.fdqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');

  if Length(Trim(edtCapituloNCM.Text)) > 0 then
    dmDBEXMaster.fdqProdutos.SQL.Add('where pro.ncm like ' + QuotedStr(Trim(edtCapituloNCM.Text)+'%'))
  else if Length(Trim(edtPosicaoNCM.Text)) > 0 then
    dmDBEXMaster.fdqProdutos.SQL.Add('where pro.ncm like ' + QuotedStr(Trim(edtPosicaoNCM.Text)+'%'))
  else if Length(Trim(edtSubposicaoNCM.Text)) > 0 then
    dmDBEXMaster.fdqProdutos.SQL.Add('where pro.ncm like ' + QuotedStr(Trim(edtSubposicaoNCM.Text)+'%'))
  else if Length(Trim(edtItemNCM.Text)) > 0 then
    dmDBEXMaster.fdqProdutos.SQL.Add('where pro.ncm like ' + QuotedStr(Trim(edtItemNCM.Text)+'%'))
  else if Length(Trim(edtNCM.Text)) > 0 then
    dmDBEXMaster.fdqProdutos.SQL.Add('where pro.ncm like ' + QuotedStr(Trim(edtNCM.Text)+'%'));
  dmDBEXMaster.fdqProdutos.SQL.Add('order by pro.descricao');

  if (Length(Trim(edtCapituloNCM.Text)) > 0) or (Length(Trim(edtPosicaoNCM.Text)) > 0) or (Length(Trim(edtSubposicaoNCM.Text)) > 0) or (Length(Trim(edtItemNCM.Text)) > 0) or (Length(Trim(edtNCM.Text)) > 0) then
  begin

    dmMProvider.cdsProdutos.Open;
    dmMProvider.cdsProdutos.ProviderName := '';

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
