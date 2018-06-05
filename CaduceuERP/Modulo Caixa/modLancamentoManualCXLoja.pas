unit modLancamentoManualCXLoja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.DBCtrls, ACBrBase, ACBrExtenso;

const

 InputBoxMsg = WM_USER + 123;

type
  TfrmLancamentoManualCXLoja = class(TForm)
    imgConfirmar: TImage;
    imgCancelar: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    rdgTipoLan�amento: TRadioGroup;
    grpEspecieLancamento: TGroupBox;
    cboEspecieLancamento: TComboBox;
    grpValorlancamento: TGroupBox;
    grpHistorico: TGroupBox;
    edtValorLancamento: TEdit;
    edtHistorico: TEdit;
    grpFuncionarioRetirante: TGroupBox;
    grpAutorizador: TGroupBox;
    cboRetirante: TDBLookupComboBox;
    cboAutorizador: TDBLookupComboBox;
    ACBrExtenso1: TACBrExtenso;
    procedure FormCreate(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure rdgTipoLan�amentoClick(Sender: TObject);
    procedure edtValorLancamentoEnter(Sender: TObject);
    procedure edtValorLancamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorLancamentoExit(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure cboRetiranteExit(Sender: TObject);
    procedure cboRetiranteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAutorizadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboEspecieLancamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    iOpItemCaixaLoja:integer;
    procedure InputBoxSet(var Msg: TMessage); message InputBoxMsg;
    procedure LancarItemCaixa(pTipo:smallint; pCredDebito:string; pValor:currency);
    procedure AbrirItemCaixa(pItem:integer);
    procedure LimparMsgErro;
    procedure ResetCampos;
    function ValidarSenhaRetirante(pSenha:string; pRetirante: integer): boolean;
  public
    { Public declarations }
  end;

var
  frmLancamentoManualCXLoja: TfrmLancamentoManualCXLoja;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes,
  dataMSProcedure, dataMRelatorios;

procedure TfrmLancamentoManualCXLoja.AbrirItemCaixa(pItem:integer);
begin

  if pItem <= 0 then
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
    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where caixa_loja = ' + IntToStr(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value));

    dmMProvider.cdsItemCaixaLoja.Open;
    dmMProvider.cdsItemCaixaLoja.ProviderName := '';
    dmMProvider.cdsItemCaixaLoja.Last;

  end
  else
  begin

    dmMProvider.cdsItemCaixaLoja.Close;
    dmMProvider.cdsItemCaixaLoja.ProviderName := 'dspItemCaixaLoja';

    dmDBEXMaster.fdqItemCaixaLoja.SQL.Clear;
    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('select * from item_caixa_loja');
    dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where item_caixa_loja = ' + IntToStr(pItem));

    dmMProvider.cdsItemCaixaLoja.Open;
    dmMProvider.cdsItemCaixaLoja.ProviderName := '';
    dmMProvider.cdsItemCaixaLoja.Last;

  end;

end;

procedure TfrmLancamentoManualCXLoja.cboAutorizadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if key = VK_DELETE then
    cboAutorizador.KeyValue := '';

end;

procedure TfrmLancamentoManualCXLoja.cboEspecieLancamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if key = VK_DELETE then
    cboEspecieLancamento.ItemIndex := -1;

end;

procedure TfrmLancamentoManualCXLoja.cboRetiranteExit(Sender: TObject);
var
  sSenha: string;
begin

  LimparMsgErro;

  if (Length(Trim(cboRetirante.KeyValue)) > 0) and (rdgTipoLan�amento.ItemIndex = 0) then
  begin

      PostMessage(Handle, InputBoxMsg, 0, 0);

      sSenha := InputBox('Valida��o','Informe sua senha: ','');

      if not ValidarSenhaRetirante(sSenha, dmMProvider.cdsFuncionariosFUNCIONARIO.Value) then
      begin

        lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
        Application.ProcessMessages;
        cboRetirante.SetFocus;

      end;

  end;

end;

procedure TfrmLancamentoManualCXLoja.cboRetiranteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if key = VK_DELETE then
    cboRetirante.KeyValue := '';

end;

procedure TfrmLancamentoManualCXLoja.edtHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmLancamentoManualCXLoja.edtValorLancamentoEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmLancamentoManualCXLoja.edtValorLancamentoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  try

    if Length(Trim(edtValorLancamento.Text))  <= 0 then
      edtValorLancamento.Text := '1,000';

    edtValorLancamento.Text := FormatFloat('#,##0.00',StrToFloat(RetirarPonto(edtValorLancamento.Text)));

  except

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ' - ' + edtValorLancamento.Text + MSG_VALOR_INVALIDO;
    Application.ProcessMessages;
    edtValorLancamento.SetFocus;

  end;

end;

procedure TfrmLancamentoManualCXLoja.edtValorLancamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TfrmLancamentoManualCXLoja.edtValorLancamentoKeyPress(Sender: TObject;
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

procedure TfrmLancamentoManualCXLoja.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);

  Color := COR_PADRAO_DIALOGOS;

end;

procedure TfrmLancamentoManualCXLoja.FormKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ConfirmaLancManualCX)) then
  begin

    Key         := #0;
    lblMsg.Tag  := ord(nulo);

    if Length(Trim(edtHistorico.Text)) <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtHistorico.SetFocus;

    end
    else if StrToFloat(RetirarPonto(edtValorLancamento.Text)) <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtValorLancamento.SetFocus;

    end
    else
    begin

      case rdgTipoLan�amento.ItemIndex of
        0:begin

            case cboEspecieLancamento.ItemIndex of
              0:begin

                  if dmMProvider.cdsCaixaLojaVALOR_DINHEIRO.Value < StrToFloat(edtValorLancamento.Text) then
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VALOR_LANC_MAIOR_CX + FormatFloat('#,##0.00',dmMProvider.cdsCaixaLojaVALOR_DINHEIRO.Value);
                    edtValorLancamento.SetFocus;
                    exit;

                  end
                  else
                    LancarItemCaixa(7, 'D', StrToFloat(edtValorLancamento.Text));

                end;
              1:begin

                  if dmMProvider.cdsCaixaLojaVALOR_CHEQUE.Value < StrToFloat(edtValorLancamento.Text) then
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VALOR_LANC_MAIOR_CX + FormatFloat('#,##0.00',dmMProvider.cdsCaixaLojaVALOR_CHEQUE.Value);
                    edtValorLancamento.SetFocus;
                    exit;

                  end
                  else
                    LancarItemCaixa(2, 'D', StrToFloat(edtValorLancamento.Text));

                end;
              2:begin

                  if dmMProvider.cdsCaixaLojaOUTROS_VALORES.Value < StrToFloat(edtValorLancamento.Text) then
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VALOR_LANC_MAIOR_CX + FormatFloat('#,##0.00',dmMProvider.cdsCaixaLojaOUTROS_VALORES.Value);
                    edtValorLancamento.SetFocus;
                    exit;

                  end
                  else
                    LancarItemCaixa(98, 'D', StrToFloat(edtValorLancamento.Text));

                end;

            end;

            //gerar comprovante retirada

            ACBrExtenso1.Valor := StrToFloat(edtValorLancamento.Text);

            AbrirItemCaixa(iOpItemCaixaLoja);

            dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
            dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemCaixaLoja;

            if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
            begin

              dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
              dmRelatorios.rvpGenesisAC.SelectReport('rptComprovanteRetirada',true);
              dmRelatorios.rvpGenesisAC.SetParam('pIDSistema',ID_SISTEMA);
              dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
              dmRelatorios.rvpGenesisAC.SetParam('pID_Sistema',ID_SISTEMA);
              dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsClientesCNPJ.Value));
              dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

              if dmMProvider.cdsFilialNUMERO.Value > 0 then
                dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
              else
                dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

              dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);
              dmRelatorios.rvpGenesisAC.SetParam('pValor_Extenso',ACBrExtenso1.Texto);

              dmRelatorios.rvpGenesisAC.Execute;
              dmRelatorios.rvpGenesisAC.Close;

            end
            else
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
              Application.ProcessMessages;

            end;

            AbrirItemCaixa(0);

            Close;

          end;

        else
        begin

          case cboEspecieLancamento.ItemIndex of
            0:LancarItemCaixa(7, 'C', StrToFloat(edtValorLancamento.Text));
            1:LancarItemCaixa(2, 'C', StrToFloat(edtValorLancamento.Text));
            2:LancarItemCaixa(98,'C', StrToFloat(edtValorLancamento.Text));
          end;

          LimparMsgErro;
          ResetCampos;

        end;

      end;

    end;

  end
  else if (UpperCase(Key) = 'N') AND (lblMsg.Tag <> ord(nulo)) then
  begin

    LimparMsgErro;
    Key         := #0;
    lblMsg.Tag  := ord(nulo);
    ModalResult := mrNone;

  end;

end;

procedure TfrmLancamentoManualCXLoja.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmLancamentoManualCXLoja.imgConfirmarClick(Sender: TObject);
begin

  LimparMsgErro;

  if (Length(Trim(cboRetirante.KeyValue)) <= 0) and (rdgTipoLan�amento.ItemIndex = 0) then
  begin

    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    cboRetirante.SetFocus;

  end
  else if (Length(Trim(cboAutorizador.KeyValue)) <= 0) and (rdgTipoLan�amento.ItemIndex = 0) then
  begin

    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    cboAutorizador.SetFocus;

  end
  else
  begin

    lblMsg.Tag      := ord(ConfirmaLancManualCX);
    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO;

  end;

end;

procedure TfrmLancamentoManualCXLoja.InputBoxSet(var Msg: TMessage);
var
  i: integer;
begin

  for i:=0 to Screen.Forms[0].ComponentCount-1 do
  begin

    if Screen.Forms[0].Components[i] is TEdit then
    begin

      with TEdit( Screen.Forms[0].Components[i] ) do
      begin

        PasswordChar := '*'; //Aqui est� o caractere q ir� aparecer na inputbox
        Clear;               //Limpamos a caixa de digita��o da senha.

      end;

    end;

  end;


end;

procedure TfrmLancamentoManualCXLoja.LancarItemCaixa(pTipo:smallint; pCredDebito:string; pValor:currency);
begin

  try

    dmMSProcedure.fdspItem_caixa_loja.Params[0].Value   := dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value;
    dmMSProcedure.fdspItem_caixa_loja.Params[1].Value   := 'LANCAMENTO MANUAL';
    dmMSProcedure.fdspItem_caixa_loja.Params[2].Value   := 'LM' + IntToStr(dmMProvider.cdsItemCaixaLoja.RecordCount+1);
    dmMSProcedure.fdspItem_caixa_loja.Params[3].Value   := Date;
    dmMSProcedure.fdspItem_caixa_loja.Params[4].Value   := pTipo;
    dmMSProcedure.fdspItem_caixa_loja.Params[5].Value   := pValor;
    dmMSProcedure.fdspItem_caixa_loja.Params[6].Value   := pCredDebito;
    dmMSProcedure.fdspItem_caixa_loja.Params[7].Value   := dmMProvider.cdsItemCaixaLojaSALDO.Value;
    dmMSProcedure.fdspItem_caixa_loja.Params[8].Value   := edtHistorico.Text;
    dmMSProcedure.fdspItem_caixa_loja.Params[9].Value   := '';
    dmMSProcedure.fdspItem_caixa_loja.Params[10].Value  := null;
    dmMSProcedure.fdspItem_caixa_loja.Params[11].Value  := null;
    dmMSProcedure.fdspItem_caixa_loja.Params[12].Value  := cboRetirante.KeyValue;
    dmMSProcedure.fdspItem_caixa_loja.Params[13].Value  := cboAutorizador.KeyValue;

    dmMSProcedure.fdspItem_caixa_loja.ExecProc;

    if dmMSProcedure.fdspItem_caixa_loja.Params[14].Value > 0 then
      iOpItemCaixaLoja := dmMSProcedure.fdspItem_caixa_loja.Params[14].Value;

    dmDBEXMaster.fdcMaster.Commit;

    AbrirItemCaixa(0);

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmLancamentoManualCXLoja.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmLancamentoManualCXLoja.rdgTipoLan�amentoClick(Sender: TObject);
begin

  cboEspecieLancamento.SetFocus;

end;

procedure TfrmLancamentoManualCXLoja.ResetCampos;
begin

  rdgTipoLan�amento.ItemIndex     := -1;
  cboEspecieLancamento.ItemIndex  := -1;
  cboRetirante.KeyValue           := -1;
  cboAutorizador.KeyValue         := -1;
  edtValorLancamento.Text         := '0,00';
  edtHistorico.Clear;

end;

function TfrmLancamentoManualCXLoja.ValidarSenhaRetirante(pSenha:string; pRetirante: integer): boolean;
begin

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select * from funcionario');
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where funcionario = ' + IntToStr(pRetirante));
  dmDBEXMaster.fdqMasterPesquisa.Open;

  Result := (pSenha = dmDBEXMaster.fdqMasterPesquisa.FieldByName('senha').AsString);

  dmDBEXMaster.fdqMasterPesquisa.Close;

end;

end.
