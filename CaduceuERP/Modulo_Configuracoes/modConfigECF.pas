unit modConfigECF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.StdActns, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, db;

type
  TfrmConfigECF = class(TForm)
    imgSair: TImage;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    grpNumeroECF: TGroupBox;
    grpNumeroSerieECF: TGroupBox;
    grpModeloECF: TGroupBox;
    indIncluirECF: TImage;
    grpCodigoModelo: TGroupBox;
    cboCodModeloDoc: TDBLookupComboBox;
    grdEcf: TDBGrid;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    edtNumeroECF: TEdit;
    edtNumeroSerieECF: TEdit;
    edtModeloECF: TEdit;
    imgExcluir: TImage;
    lblF5: TLabel;
    actExcluir: TAction;
    actIncluir: TAction;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure grdEcfDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtNumeroECFEnter(Sender: TObject);
    procedure edtNumeroECFKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroSerieECFKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroECFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actExcluirExecute(Sender: TObject);
    procedure Tratar_Erro_Conexao(pE: exception);
    procedure lblF5Click(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure LimparMSG_ERRO;
    function ValidarCampos:boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmConfigECF: TfrmConfigECF;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;

procedure TfrmConfigECF.actExcluirExecute(Sender: TObject);
begin

  try

    dmDBEXMaster.fdcMaster.StartTransaction;

    dmMSProcedure.fdspConfigECF.Params[0].Value   := 1;
    dmMSProcedure.fdspConfigECF.Params[1].Value   := dmMProvider.cdsConfigECFCODIGO_MODELO_DOCUMENTO.Value;
    dmMSProcedure.fdspConfigECF.Params[2].Value   := dmMProvider.cdsConfigECFNUMERO_CAIXA.Value;
    dmMSProcedure.fdspConfigECF.Params[3].Value   := dmMProvider.cdsConfigECFMODELO_ECF.Value;
    dmMSProcedure.fdspConfigECF.Params[4].Value   := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value;
    dmMSProcedure.fdspConfigECF.Params[5].Value   := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspConfigECF.Params[6].Value   := pubNomeComputador;
    dmMSProcedure.fdspConfigECF.Params[7].Value   := RetornarIP;

    dmMSProcedure.fdspConfigECF.ExecProc;

    dmMProvider.cdsConfigECF.Delete;

    dmDBEXMaster.fdcMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

end;

procedure TfrmConfigECF.actIncluirExecute(Sender: TObject);
begin

  ActiveControl := nil;

  try

    LimparMSG_ERRO;

    if ValidarCampos then
    begin

      dmDBEXMaster.fdcMaster.StartTransaction;

      dmMSProcedure.fdspConfigECF.Params[0].Value   := 0;
      dmMSProcedure.fdspConfigECF.Params[1].Value   := cboCodModeloDoc.KeyValue;
      dmMSProcedure.fdspConfigECF.Params[2].Value   := StrToInt(edtNumeroECF.Text);
      dmMSProcedure.fdspConfigECF.Params[3].Value   := edtModeloECF.Text;
      dmMSProcedure.fdspConfigECF.Params[4].Value   := edtNumeroSerieECF.Text;
      dmMSProcedure.fdspConfigECF.Params[5].Value   := dmDBEXMaster.iIdUsuario;
      dmMSProcedure.fdspConfigECF.Params[6].Value   := pubNomeComputador;
      dmMSProcedure.fdspConfigECF.Params[7].Value   := RetornarIP;

      dmMSProcedure.fdspConfigECF.ExecProc;

      dmMProvider.cdsConfigECF.Close;
      dmMProvider.cdsConfigECF.ProviderName := 'dspConfigECF';

      dmMProvider.cdsConfigECF.Open;
      dmMProvider.cdsConfigECF.ProviderName := '';

      dmDBEXMaster.fdcMaster.Commit;
      dmDBEXMaster.fdcMaster.Close;;

      LimparCampos;

    end;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

end;

procedure TfrmConfigECF.edtNumeroECFEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmConfigECF.edtNumeroECFKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmConfigECF.edtNumeroECFKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;

end;

procedure TfrmConfigECF.edtNumeroSerieECFKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmConfigECF.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  dmMProvider.cdsConfigECF.Close;

end;

procedure TfrmConfigECF.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);
  Color                     := COR_PADRAO_TELAS;

  dmMProvider.cdsConfigECF.ProviderName := 'dspConfigECF';
  dmMProvider.cdsConfigECF.Open;
  dmMProvider.cdsConfigECF.ProviderName := '';

end;

procedure TfrmConfigECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmConfigECF.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO;
    actExcluirExecute(self);

  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO;

  end;

end;

procedure TfrmConfigECF.grdEcfDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsConfigECF.IsEmpty then
  begin

    if not odd(dmMProvider.cdsConfigECF.RecNo) then
    begin

      grdEcf.Canvas.Font.Color   := clBlack;
      grdEcf.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdEcf.Canvas.Font.Color   := clBlack;
      grdEcf.Canvas.Brush.Color  := clWhite;

    end;

    grdEcf.Canvas.FillRect(Rect);
    grdEcf.DefaultDrawDataCell(Rect, Column.Field, State);

  end;


end;

procedure TfrmConfigECF.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsConfigECF.Active then
  begin

    if not (dmMProvider.cdsConfigECF.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO;

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;


end;

procedure TfrmConfigECF.LimparCampos;
begin

  edtNumeroECF.Clear;
  edtNumeroSerieECF.Clear;
  edtModeloECF.Clear;
  cboCodModeloDoc.KeyValue := null;

end;

procedure TfrmConfigECF.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmConfigECF.Tratar_Erro_Conexao(pE: exception);
var
  sChave_Extrang:string;
begin

  if Pos('Unable',pE.Message) > 0then
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_CONEXAO_BANCO
  else if Pos('FOREIGN',pE.Message) > 0then
  begin

    sChave_Extrang := Trim(Copy(pE.Message,pos('ON TABLE',Uppercase(pE.Message))+ 10,Length(pE.Message)));

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ERRO_CHAVE_ESTRANGEIRA
                      + Copy(sChave_Extrang,1,pos('"',sChave_Extrang)-1);

  end
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + pE.Message;

  TocarSomAlerta(ord(SystemHand));

end;

function TfrmConfigECF.ValidarCampos: boolean;
begin

  if Length(Trim(edtNumeroECF.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtNumeroECF.SetFocus;

  end
  else if Length(Trim(edtNumeroSerieECF.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtNumeroSerieECF.SetFocus;

  end
  else if Length(Trim(edtModeloECF.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtModeloECF.SetFocus;

  end
  else if Length(Trim(cboCodModeloDoc.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    cboCodModeloDoc.SetFocus;

  end;

  Application.ProcessMessages;

  Result := (Length(Trim(edtNumeroECF.Text)) > 0) and (Length(Trim(edtNumeroSerieECF.Text)) > 0)
             and (Length(Trim(edtModeloECF.Text)) > 0) and (Length(Trim(cboCodModeloDoc.Text)) > 0);

end;

procedure TfrmConfigECF.WindowClose1Execute(Sender: TObject);
begin

  Close;

end;

end.
