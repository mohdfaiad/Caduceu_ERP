unit modEncerramentoOs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask, db;

type
  TfrmEncerramentoOS = class(TForm)
    pnlTitulo: TPanel;
    imgSair: TImage;
    chkEmitirRecibo: TCheckBox;
    grpCliente: TGroupBox;
    grpEquipamento: TGroupBox;
    grpServico: TGroupBox;
    grpEncerramento: TGroupBox;
    edtRSocial: TDBText;
    lblEnereco: TLabel;
    edtEndereco: TDBText;
    lblNumero: TLabel;
    edtNumero_Cliente: TDBText;
    lblCEP_Cliente: TLabel;
    edtCEP_Cliente: TDBText;
    edtCidade_Cliente: TDBText;
    edtBairro: TDBText;
    Label3: TLabel;
    edtDDD_Cliente: TDBText;
    edtTelefone_Cliente: TDBText;
    edtEquipamento: TDBText;
    edtEtqPatrimonio: TDBText;
    edtSerial: TDBText;
    lblEtqPatrimonio: TLabel;
    lblSerial: TLabel;
    lblSituacaoAtual: TLabel;
    lblDataTermino: TLabel;
    edtSituacao: TDBText;
    edtDataTermino: TDBText;
    memObservacaoEquipamento: TDBMemo;
    lblSituacaoEncerramento: TLabel;
    cboSituacaoEncerramento: TDBLookupComboBox;
    lblDataEntrega: TLabel;
    dtpDataEntrega: TDateTimePicker;
    lblValorTotal: TLabel;
    edtValorTotal: TDBEdit;
    Label1: TLabel;
    edtvsloDesconto: TDBEdit;
    imgDesconto: TImage;
    imgConfirmar: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgDescontoClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LimparMSG_ERRO;
  public
    { Public declarations }
  end;

var
  frmEncerramentoOS: TfrmEncerramentoOS;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes, modDescontoEncerramentoOS,
  modFormasPagamentoOS;

procedure TfrmEncerramentoOS.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);
  Color             := COR_PADRAO_DIALOGOS;
  pnlTitulo.Color   := COR_TITULO_GRADE;
  pnlTitulo.Caption := 'Encerramento OS N� '+ IntToStr(dmMProvider.cdsOrdemServicoORDEM_DE_SERVICO.Value);

  dmMProvider.cdsSituacoesOS_ENC.Close;
  dmMProvider.cdsSituacoesOS_ENC.ProviderName := 'dspSituacoesOS_ENC';

  dmDBEXMaster.fdqSituacoesOS.SQL.Clear;
  dmDBEXMaster.fdqSituacoesOS.SQL.Add('select * from situacoes_os');
  dmDBEXMaster.fdqSituacoesOS.SQL.Add('where fechamento_os = 1');
  dmDBEXMaster.fdqSituacoesOS.SQL.Add('order by descricao');

  dmMProvider.cdsSituacoesOS_ENC.Open;
  dmMProvider.cdsSituacoesOS_ENC.ProviderName := '';

  cboSituacaoEncerramento.KeyValue            := dmMProvider.cdsSituacoesOS_ENCCODIGO_SITUACAO.Value;

  dtpDataEntrega.Date := Date;

end;

procedure TfrmEncerramentoOS.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;

    dmMProvider.cdsOrdemServico.Edit;
    dmMProvider.cdsOrdemServicoDATA_TERMINO.Value := Date;
    dmMProvider.cdsOrdemServicoHORA_TERMINO.Value := Time;

//    frmFormasPagamentoOS := TfrmFormasPagamentoOS.Create(self);

//    if frmFormasPagamentoOS.ShowModal = mrOk then
//    begin

    dmMProvider.cdsOrdemServicoDATA_SAIDA.Value       := Date;
    dmMProvider.cdsOrdemServicoHORA_SAIDA.Value       := Time;
    dmMProvider.cdsOrdemServicoCODIGO_SITUACAO.Value  := dmMProvider.cdsSituacoesOS_ENCCODIGO_SITUACAO.Value;
    dmMProvider.cdsOrdemServico.Post;

    ModalResult := mrOk;

//    end
//    else
//    begin

//      dmMProvider.cdsOrdemServico.Cancel;
//      ModalResult := mrClose;

//    end;

//    FreeAndNil(frmFormasPagamentoOS);


  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO;
    ModalResult := mrClose;

  end;

end;

procedure TfrmEncerramentoOS.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(cboSituacaoEncerramento.Text)) > 0 then
  begin

    lblMsg.Tag      := -1;
    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ENCERRA_OS;

  end
  else
  begin

    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_VALIDA_SITUACAO_OS;
    Application.ProcessMessages;
    cboSituacaoEncerramento.SetFocus;

  end;

end;

procedure TfrmEncerramentoOS.imgDescontoClick(Sender: TObject);
begin

  frmDescontoEncerramentoOS := TfrmDescontoEncerramentoOS.Create(self);

  if frmDescontoEncerramentoOS.ShowModal = mrOk then
  begin

    if not (dmMProvider.cdsOrdemServico.State in [dsEdit, dsInsert]) then
      dmMProvider.cdsOrdemServico.Edit;

    dmMProvider.cdsOrdemServicoVALOR_OUTROS.Value   := frmDescontoEncerramentoOS.edtDesconto.Value;
    dmMProvider.cdsOrdemServicoVALOR_TOTAL_OS.Value := frmDescontoEncerramentoOS.edtValorTotalOS.Value;

  end;

  FreeAndNil(frmDescontoEncerramentoOS);

end;

procedure TfrmEncerramentoOS.imgSairClick(Sender: TObject);
begin

  Close

end;

procedure TfrmEncerramentoOS.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

end.
