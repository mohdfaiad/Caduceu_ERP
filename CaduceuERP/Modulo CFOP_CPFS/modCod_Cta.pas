unit modCod_Cta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, ACBrBase, ACBrValidador;

type
  TfrmPlanoContaContabeis = class(TForm)
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    imgConfirmar: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblNomeContaContabil: TLabel;
    lblDataInclusaoAlteracao: TLabel;
    lblNumeroContaContabil: TLabel;
    edtDataInclusaoAlteracao: TDBEdit;
    edtNumeroContaContabil: TDBEdit;
    edtNomeConta: TDBEdit;
    rdgTipoConta: TDBRadioGroup;
    rdgNaturezadaConta: TDBRadioGroup;
    edtNivelConta: TDBEdit;
    edtContareferenciadaRFB: TDBEdit;
    edtCNPJEstabelecimento: TDBEdit;
    lblCNPJEStabelecimento: TLabel;
    lblContaRelaPlanoContasReferRFB: TLabel;
    lblNivelConta: TLabel;
    ACBrValidador1: TACBrValidador;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure edtNumeroContaContabilEnter(Sender: TObject);
    procedure edtNumeroContaContabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataInclusaoAlteracaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNivelContaKeyPress(Sender: TObject; var Key: Char);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtNumeroContaContabilExit(Sender: TObject);
  private
    { Private declarations }
    function validarcampos_obrigatorios:boolean;
  public
    { Public declarations }
  end;

var
  frmPlanoContaContabeis: TfrmPlanoContaContabeis;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, uConstantes_Padrao, uFuncoes, uFuncoes_BD,
  dataMSource;

procedure TfrmPlanoContaContabeis.edtDataInclusaoAlteracaoKeyPress(
  Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmPlanoContaContabeis.edtNivelContaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;

end;

procedure TfrmPlanoContaContabeis.edtNumeroContaContabilEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmPlanoContaContabeis.edtNumeroContaContabilExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);
  MudarCorEdit(sender);

end;

procedure TfrmPlanoContaContabeis.edtNumeroContaContabilKeyDown(Sender: TObject;
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

procedure TfrmPlanoContaContabeis.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                             := COR_PADRAO_TELAS;

end;

procedure TfrmPlanoContaContabeis.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if not validarcampos_obrigatorios then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;

  end
  else
  begin

    if rdgTipoConta.ItemIndex < 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' TIPO DA CONTA';
      Application.ProcessMessages;

    end
    else if rdgNaturezadaConta.ItemIndex < 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' NATUREZA DA CONTA';
      Application.ProcessMessages;

    end
    else
      ModalResult := mrOk;

  end;

end;

procedure TfrmPlanoContaContabeis.imgSairClick(Sender: TObject);
begin

  ModalResult := mrClose;

end;

function TfrmPlanoContaContabeis.validarcampos_obrigatorios: boolean;
begin

  result := False;

  if length(Trim(edtNumeroContaContabil.Text)) > 0 then
    if length(Trim(edtNomeConta.Text)) > 0 then
      if Length(trim(edtNivelConta.Text)) > 0 then
        if length(Trim(edtCNPJEstabelecimento.Text)) > 0 then
        begin

          ACBrValidador1.TipoDocto := docCNPJ;
          ACBrValidador1.Documento := Trim(edtCNPJEstabelecimento.Text);

          Result := ACBrValidador1.Validar;

        end
        else
          result := true
      else
        edtNivelConta.SetFocus
    else
      edtNomeConta.SetFocus
  else
    edtNumeroContaContabil.SetFocus;

end;

end.
