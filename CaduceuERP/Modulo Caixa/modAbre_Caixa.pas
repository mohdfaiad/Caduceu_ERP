unit modAbre_Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmAbreCaixa = class(TForm)
    imgConfirmar: TImage;
    imgCancelar: TImage;
    grpValorFundoCaixa: TGroupBox;
    edtValor_Abertura: TEdit;
    grpFuncionario: TGroupBox;
    lblFuncionario: TLabel;
    lblSenha: TLabel;
    edtSenha: TEdit;
    cboFuncionario: TDBLookupComboBox;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtValor_AberturaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValor_AberturaEnter(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaExit(Sender: TObject);
    procedure LimparMsgErro;
    procedure edtValor_AberturaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbreCaixa: TfrmAbreCaixa;

implementation

{$R *.dfm}

uses uFuncoes, dataMSource, dataMProvider, dataDBEXMaster;

procedure TfrmAbreCaixa.cboFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmAbreCaixa.edtSenhaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  LimparMsgErro;

  if dmMProvider.cdsFuncionariosSENHA.Text <> edtSenha.Text then
  begin


    lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
    Application.ProcessMessages;
    edtSenha.SetFocus;

  end;

end;

procedure TfrmAbreCaixa.edtSenhaKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmAbreCaixa.edtValor_AberturaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmAbreCaixa.edtValor_AberturaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  edtValor_Abertura.Text := FormatFloat('#,##0.00',StrToFloat(RetirarVirgula(edtValor_Abertura.Text)));

end;

procedure TfrmAbreCaixa.edtValor_AberturaKeyPress(Sender: TObject;
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

procedure TfrmAbreCaixa.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);

  dmMProvider.cdsFuncionarios.Close;
  dmMProvider.cdsFuncionarios.ProviderName := 'dspFuncionarios';

  dmDBEXMaster.fdqFuncionarios.SQL.Clear;
  dmDBEXMaster.fdqFuncionarios.SQL.Add('select * from funcionario');
  dmDBEXMaster.fdqFuncionarios.SQL.Add('order by nome');

  dmMProvider.cdsFuncionarios.Open;
  dmMProvider.cdsFuncionarios.ProviderName := '';


end;

procedure TfrmAbreCaixa.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmAbreCaixa.imgConfirmarClick(Sender: TObject);
begin

  if dmMProvider.cdsFuncionariosSENHA.Text <> edtSenha.Text then
  begin

    lblMsg.Caption := 'Senha informada n�o confere com o cadastro!';
    Application.ProcessMessages;
    edtSenha.SetFocus;

  end
  else
    ModalResult := mrOk;

end;

procedure TfrmAbreCaixa.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

end.
