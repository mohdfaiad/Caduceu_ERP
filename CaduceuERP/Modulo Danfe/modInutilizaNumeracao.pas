unit modInutilizaNumeracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmInutilizacaoNumeracao = class(TForm)
    grpInutilizacao: TGroupBox;
    imgSair: TImage;
    imgConfirmar: TImage;
    lblNumeroInicial: TLabel;
    lblNumeroFinal: TLabel;
    grpJustificativa: TGroupBox;
    memJustificativa: TMemo;
    edtNumeroInicial: TEdit;
    edtNumeroFinal: TEdit;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    lblAno: TLabel;
    cboAno: TComboBox;
    procedure imgSairClick(Sender: TObject);
    procedure memJustificativaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroInicialEnter(Sender: TObject);
    procedure edtNumeroInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNumeroInicialKeyPress(Sender: TObject; var Key: Char);
    procedure imgConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInutilizacaoNumeracao: TfrmInutilizacaoNumeracao;

implementation

{$R *.dfm}

uses uConstantes_Padrao, uFuncoes, dataDBEXMaster;

procedure TfrmInutilizacaoNumeracao.edtNumeroInicialEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmInutilizacaoNumeracao.edtNumeroInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmInutilizacaoNumeracao.edtNumeroInicialKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmInutilizacaoNumeracao.FormCreate(Sender: TObject);
var
  i:integer;
  sAno:string;
begin

  DesabilitarBotaoFecharForm(Handle);

  sAno := RetornaDiaMesAno(0); //0 = ano com 4 digitos

  for i := 0 to 1 do
  begin

    if cboAno.Items.Count = 0 then
      cboAno.Items.Add(IntToStr(StrToInt(sAno) - 1))
    else
      cboAno.Items.Add(sAno);

  end;

end;

procedure TfrmInutilizacaoNumeracao.imgConfirmarClick(Sender: TObject);
begin

  if Length(Trim(edtNumeroInicial.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtNumeroInicial.SetFocus;

  end
  else if Length(Trim(edtNumeroFinal.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtNumeroFinal.SetFocus;

  end
  else if Length(Trim(memJustificativa.Text)) < 15 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_TAMANHO_MINIMO + ' (m�nimo de 15 caracteres)';
    memJustificativa.SetFocus;

  end
  else if Length(Trim(cboAno.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    cboAno.SetFocus;

  end
  else
    ModalResult := mrOk;

end;

procedure TfrmInutilizacaoNumeracao.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmInutilizacaoNumeracao.memJustificativaKeyPress(Sender: TObject; var Key: Char);
begin

  Key := UpCase(Key);

end;

end.
