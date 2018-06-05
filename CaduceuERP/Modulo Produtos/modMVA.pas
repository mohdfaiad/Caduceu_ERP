unit modMVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, Grids, Vcl.DBGrids, Db, StdCtrls, DBCtrls, Mask;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmMva = class(TForm)
    grdTabela: TDBGrid;
    grpEstado: TGroupBox;
    grpMVA: TGroupBox;
    grpIcms_IE: TGroupBox;
    grpICMS_Interno: TGroupBox;
    edtICMS_Interno: TDBEdit;
    edtMVA: TDBEdit;
    edtICMS_IE: TDBEdit;
    cboEstado: TDBLookupComboBox;
    imgSair: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure grdTabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtICMS_InternoKeyPress(Sender: TObject; var Key: Char);
    procedure cboEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure edtICMS_InternoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtICMS_InternoEnter(Sender: TObject);
    procedure edtICMS_InternoExit(Sender: TObject);
    procedure edtMVAExit(Sender: TObject);
    procedure edtICMS_IEExit(Sender: TObject);
    procedure cboEstadoExit(Sender: TObject);
    procedure cboEstadoCloseUp(Sender: TObject);
  private
    { Private declarations }
    function Man_Tab_MVA(pOpcao:SmallInt):boolean;
  public
    { Public declarations }
  end;

var
  frmMva: TfrmMva;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes, dataMSProcedure;

procedure TfrmMva.cboEstadoCloseUp(Sender: TObject);
begin

  if not dmMProvider.cdsMva.Locate('ESTADO',cboEstado.Text,[]) then
    dmMProvider.cdsMva.Append;

end;

procedure TfrmMva.cboEstadoExit(Sender: TObject);
begin

  if not dmMProvider.cdsMva.Locate('ESTADO',cboEstado.Text,[]) then
    dmMProvider.cdsMva.Append;

end;

procedure TfrmMva.cboEstadoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmMva.edtICMS_IEExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsMva) then
  begin

    if (cboEstado.Text <> '')  and (dmMProvider.cdsMvaPRODUTO.Value > 0) and (dmMProvider.cdsMvaMARGEM_MVA.Value > 0) and (dmMProvider.cdsMvaICMS_INTERESTADUAL.Value > 0) and (dmMProvider.cdsMvaICMS_INTERNO.Value > 0) then
    begin

      if Man_Tab_MVA(0) then
      begin

        dmMProvider.cdsMVA.Post;
        cboEstado.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmMva.edtICMS_InternoEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmMva.edtICMS_InternoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmMva.edtICMS_InternoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TfrmMva.edtICMS_InternoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmMva.edtMVAExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmMva.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(Handle);

  Color                           := COR_PADRAO_DIALOGOS;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  dmMProvider.cdsMVA.Close;
  dmMProvider.cdsMVA.ProviderName := 'dspMVA';

  dmDBEXMaster.fdqMVA.SQL.Clear;
  dmDBEXMaster.fdqMVA.SQL.Add('SELECT * FROM MVA');
  dmDBEXMaster.fdqMVA.SQL.Add('WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));
  dmDBEXMaster.fdqMVA.SQL.Add('ORDER BY ESTADO');
  dmDBEXMaster.fdqMVA.Open;

  dmMProvider.cdsMVA.Open;
  dmMProvider.cdsMVA.ProviderName := '';

  dmMProvider.cdsEstados.Close;
  dmMProvider.cdsEstados.ProviderName := 'dspEstados';

  dmDBEXMaster.fdqEstados.SQL.Clear;
  dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');
  dmDBEXMaster.fdqEstados.SQL.Add('ORDER BY SIGLA');

  dmMProvider.cdsEstados.Open;
  dmMProvider.cdsEstados.ProviderName := '';

end;

procedure TfrmMva.grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsMva.IsEmpty then
  begin

    if not odd(dmMProvider.cdsMva.RecNo) then
    begin

      grdTabela.Canvas.Font.Color := clBlack;
      grdTabela.Canvas.Brush.Color := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color := clBlack;
      grdTabela.Canvas.Brush.Color := clWhite;

    end;

    grdTabela.Canvas.FillRect(Rect);
    grdTabela.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmMva.grdTabelaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = 38 then
  begin

    if dmMProvider.cdsMva.State in [dsEdit, dsInsert] then
      dmMProvider.cdsMva.Cancel;

  end
  else if (shift = [ssctrl]) and (key = 46) then
  begin

    key := 0;
    exit;

  end
  else if key = 46 then
  begin

    if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_EXCLUIR),
      'Aten��o!', mb_IconQuestion + mb_DefButton2 + mb_YesNo) = idYes then
    begin

      if Man_Tab_MVA(1) then
        dmMProvider.cdsMva.Delete;

      end;

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

procedure TfrmMva.imgSairClick(Sender: TObject);
begin

  Close;

end;

function TfrmMva.Man_Tab_MVA(pOpcao: SmallInt): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMVA.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspMVA.Params[1].Value   := dmMProvider.cdsMVAPRODUTO.AsInteger;
    dmMSProcedure.fdspMVA.Params[2].Value   := dmMProvider.cdsMVAESTADO.AsString;
    dmMSProcedure.fdspMVA.Params[3].Value   := dmMProvider.cdsMVAMVA.AsInteger;
    dmMSProcedure.fdspMVA.Params[4].Value   := dmMProvider.cdsMVAICMS_INTERESTADUAL.AsCurrency;
    dmMSProcedure.fdspMVA.Params[5].Value   := dmMProvider.cdsMVAICMS_INTERNO.AsCurrency;
    dmMSProcedure.fdspMVA.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := true;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;
      Result          := False;

    end;

  end;


end;

end.
