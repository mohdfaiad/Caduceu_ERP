unit modItemPecasAvulsas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvEdit, JvValidateEdit, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmIncluirPecaAvulsa = class(TForm)
    imgIncluir: TImage;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpInformacoesGerais: TGroupBox;
    grpQuantidade: TGroupBox;
    edtQuantidade: TJvValidateEdit;
    grpValorUnitario: TGroupBox;
    edtValorUnitario: TJvValidateEdit;
    grpTecnicoResponsavel: TGroupBox;
    cboTecnicoResponsavel: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    edtDescricaoPeca: TEdit;
    procedure imgSairClick(Sender: TObject);
    procedure imgIncluirClick(Sender: TObject);
    procedure edtDescricaoPecaEnter(Sender: TObject);
    procedure edtDescricaoPecaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoPecaKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure LimparMSG_ERRO;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluirPecaAvulsa: TfrmIncluirPecaAvulsa;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;

procedure TfrmIncluirPecaAvulsa.edtDescricaoPecaEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmIncluirPecaAvulsa.edtDescricaoPecaKeyDown(Sender: TObject;
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

procedure TfrmIncluirPecaAvulsa.edtDescricaoPecaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmIncluirPecaAvulsa.edtQuantidadeKeyPress(Sender: TObject;
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

procedure TfrmIncluirPecaAvulsa.imgIncluirClick(Sender: TObject);
begin

  LimparMSG_ERRO;

  if cboTecnicoResponsavel.KeyValue <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;

    cboTecnicoResponsavel.SetFocus;

  end
  else
  begin

    if not dmMProvider.cdsItens_OS_Pecas.Active then
      dmMProvider.cdsItens_OS_Pecas.Open;

    dmMProvider.cdsItens_OS_Pecas.Append;
    dmMProvider.cdsItens_OS_PecasCODIGO_PECA.Value    := -1;
    dmMProvider.cdsItens_OS_PecasDESCRICAO.Value      := edtDescricaoPeca.Text;
    dmMProvider.cdsItens_OS_PecasVALOR_UNITARIO.Value := edtValorUnitario.Value;
    dmMProvider.cdsItens_OS_PecasFUNCIONARIO.Value    := dmMProvider.cdsFuncionariosFUNCIONARIO.Value;
    dmMProvider.cdsItens_OS_PecasQUANTIDADE.Value     := edtQuantidade.Value;
    dmMProvider.cdsItens_OS_PecasDIA.AsDateTime       := now;
    dmMProvider.cdsItens_OS_PecasTIPO.Value           := 4;
    dmMProvider.cdsItens_OS_PecasVALOR_TOTAL.Value    := (dmMProvider.cdsItens_OS_PecasQUANTIDADE.Value * dmMProvider.cdsItens_OS_PecasVALOR_UNITARIO.Value);

    ModalResult := mrOk

  end;


end;

procedure TfrmIncluirPecaAvulsa.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmIncluirPecaAvulsa.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

end.
