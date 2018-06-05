unit modItemServicoPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  Vcl.Imaging.pngimage,db, DateUtils, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit;

type
  TfrmItemServicoPadrao = class(TForm)
    grpServicoExecutado: TGroupBox;
    grpValorServico: TGroupBox;
    grpQuantidadeServico: TGroupBox;
    grpInicio: TGroupBox;
    grpFim: TGroupBox;
    cboServicoExecutado: TDBLookupComboBox;
    edtValorServico: TDBEdit;
    edtQuantidadeServico: TDBEdit;
    rdpFormaCobrancaServico: TDBRadioGroup;
    grpCustoTotal: TGroupBox;
    edtCustoTotal: TDBEdit;
    grpTecnicoResponsavel: TGroupBox;
    cboTecnicoResponsavel: TDBLookupComboBox;
    imgIncluir: TImage;
    imgSair: TImage;
    dtpInicio: TJvDBDatePickerEdit;
    dtpFim: TJvDBDatePickerEdit;
    dtpHoraInicio: TJvDBDateTimePicker;
    dtpHoraFim: TJvDBDateTimePicker;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    procedure rdpFormaCobrancaServicoClick(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtQuantidadeServicoEnter(Sender: TObject);
    procedure edtQuantidadeServicoExit(Sender: TObject);
    procedure edtValorServicoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboServicoExecutadoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpInicioExit(Sender: TObject);
    procedure cboServicoExecutadoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpInicioEnter(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTabelaServicos;
    function ValidarPeriodo:boolean;
    procedure LimparMSG_ERRO;
    procedure Tratar_Erro_Conexao(pE: exception);
  public
    { Public declarations }
  end;

var
  frmItemServicoPadrao: TfrmItemServicoPadrao;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes;

procedure TfrmItemServicoPadrao.AbrirTabelaServicos;
begin

  dmMProvider.cdsServicos.Close;
  dmMProvider.cdsServicos.ProviderName := 'dspServicos';

  dmDBEXMaster.fdqServicos.SQL.Clear;
  dmDBEXMaster.fdqServicos.SQL.Add('select * from servicos');
  dmDBEXMaster.fdqServicos.SQL.Add('order by descricao_1');

  dmMProvider.cdsServicos.Open;
  dmMProvider.cdsServicos.ProviderName := '';

end;

procedure TfrmItemServicoPadrao.cboServicoExecutadoExit(Sender: TObject);
begin

  dtpInicioExit(self);
  edtQuantidadeServicoExit(self);

end;

procedure TfrmItemServicoPadrao.cboServicoExecutadoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmItemServicoPadrao.dtpInicioEnter(Sender: TObject);
begin

   MudarCorEdit(sender);

end;

procedure TfrmItemServicoPadrao.dtpInicioExit(Sender: TObject);
var
  iHoras, iDiferenca_Dias:currency;
begin

  try

    LimparMSG_ERRO;
    MudarCorEdit(sender);

    if dmMProvider.cdsItens_OS_servico.State in [dsEdit,dsInsert] then
    begin

      if rdpFormaCobrancaServico.ItemIndex = 0 then
      begin

        dtpHoraInicio.Date  := dtpInicio.Date;
        dtpHoraFim.Date     := dtpFim.Date;

        if ValidarPeriodo then
        begin

          iDiferenca_Dias := dtpFim.Date - dtpInicio.Date;
          iHoras          := iDiferenca_Dias * 24;
          iHoras          := {iHoras + }StrToFloat(calcular_tempo(dtpHoraFim.DateTime,dtpHoraInicio.DateTime));

          dmMProvider.cdsItens_OS_servicoQUANTIDADE.Value   := iHoras;
          dmMProvider.cdsItens_OS_servicoVALOR_CUSTO.Value  := dmMProvider.cdsServicosVALOR.Value;
          dmMProvider.cdsItens_OS_servicoCUSTO_TOTAL.Value  := dmMProvider.cdsItens_OS_servicoQUANTIDADE.Value * dmMProvider.cdsItens_OS_servicoVALOR_CUSTO.Value

        end;

      end;

    end;
  except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmItemServicoPadrao.edtQuantidadeServicoEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmItemServicoPadrao.edtQuantidadeServicoExit(Sender: TObject);
var
  iHoras, iDiferenca_Dias:currency;
begin

   MudarCorEdit(Sender);

  try

    LimparMSG_ERRO;

    if dmMProvider.cdsItens_OS_servico.State in [dsEdit,dsInsert] then
    begin

      if rdpFormaCobrancaServico.ItemIndex = 1 then
      begin

        dmMProvider.cdsItens_OS_servicoVALOR_CUSTO.Value  := dmMProvider.cdsServicosVALOR.Value;
        dmMProvider.cdsItens_OS_servicoCUSTO_TOTAL.Value  := dmMProvider.cdsItens_OS_servicoQUANTIDADE.Value * dmMProvider.cdsItens_OS_servicoVALOR_CUSTO.Value

      end;

    end;
  except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmItemServicoPadrao.edtValorServicoKeyDown(Sender: TObject;
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

procedure TfrmItemServicoPadrao.edtValorServicoKeyPress(Sender: TObject;
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

procedure TfrmItemServicoPadrao.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);
  Color := COR_PADRAO_DIALOGOS;

  AbrirTabelaServicos;

end;

procedure TfrmItemServicoPadrao.FormShow(Sender: TObject);
begin

  if tag = 0 then
  begin

    dmMProvider.cdsItens_OS_servico.Append;
    dtpInicio.Date      := date;
    dtpHoraInicio.Date  := now;
    dtpFim.Date         := date;
    dtpHoraFim.Date     := now;

  end;

end;

procedure TfrmItemServicoPadrao.imgIncluirClick(Sender: TObject);
begin

  if dmMProvider.cdsItens_OS_servicoCODIGO_SERVICO.Value > 0 then
  begin

    if dmMProvider.cdsItens_OS_servicoFUNCIONARIO.Value <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;

      cboTecnicoResponsavel.SetFocus;

    end
    else if dmMProvider.cdsItens_OS_servicoCODIGO_SERVICO.Value <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;

      cboServicoExecutado.SetFocus;

    end
    else
      ModalResult := mrOk;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    cboServicoExecutado.SetFocus;

  end;


end;

procedure TfrmItemServicoPadrao.imgSairClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsItens_OS_servico) then
    dmMProvider.cdsItens_OS_servico.Cancel;

  Close;

end;

procedure TfrmItemServicoPadrao.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmItemServicoPadrao.rdpFormaCobrancaServicoClick(Sender: TObject);
begin

  grpQuantidadeServico.Enabled  := (rdpFormaCobrancaServico.ItemIndex = 1);
  grpInicio.Enabled             := (rdpFormaCobrancaServico.ItemIndex = 0);
  grpFim.Enabled                := grpInicio.Enabled;

  if rdpFormaCobrancaServico.ItemIndex = 1 then
  begin

    dmMProvider.cdsItens_OS_servicoQUANTIDADE.Value         := 1;
    dmMProvider.cdsItens_OS_servicoVALOR_CUSTO.Value        := dmMProvider.cdsServicosVALOR.Value;
    dmMProvider.cdsItens_OS_servicoCUSTO_TOTAL.Value        := dmMProvider.cdsItens_OS_servicoQUANTIDADE.Value * dmMProvider.cdsItens_OS_servicoVALOR_CUSTO.Value;
    dmMProvider.cdsItens_OS_servicoHORA_INICIO.Clear;
    dmMProvider.cdsItens_OS_servicoHORA_FIM.Clear;

  end
  else
  begin

    dmMProvider.cdsItens_OS_servicoCUSTO_TOTAL.Value  := 0;
    dtpInicio.Date                := date;
    dtpInicioExit(self);

  end;


end;

procedure TfrmItemServicoPadrao.Tratar_Erro_Conexao(pE: exception);
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
  else if Pos('is not a valid floating point',pE.Message) > 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_HORA_INICIAL_FINAL;
    dtpHoraFim.SetFocus;

  end
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + pE.Message;

  TocarSomAlerta(ord(SystemHand));

end;

function TfrmItemServicoPadrao.ValidarPeriodo: boolean;
begin

  Result := true;

  if dtpFim.Date < dtpInicio.Date then
  begin

    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_DATA_INICIAL_FINAL;
    Result          := false;

  end
  else if dtpFim.Date = dtpInicio.Date then
  begin

    if dtpHoraInicio.Time > dtpHoraFim.Time then
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_HORA_INICIAL_FINAL;
      dtpHoraFim.SetFocus;
      Result          := false;

    end;

  end;

end;

end.
