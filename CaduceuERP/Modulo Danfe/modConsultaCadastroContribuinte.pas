unit modConsultaCadastroContribuinte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmConsultaCadastroContribuinte = class(TForm)
    imgConfirmar: TImage;
    grpInutilizacao: TGroupBox;
    lblUF: TLabel;
    lblCNPJ: TLabel;
    edtDocumento: TEdit;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    cboUF: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtDocumentoExit(Sender: TObject);
    procedure edtDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDocumentoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCadastroContribuinte: TfrmConsultaCadastroContribuinte;

implementation

{$R *.dfm}

uses dataDBEXMaster, uConstantes_Padrao, uFuncoes, dataMProvider;

procedure TfrmConsultaCadastroContribuinte.edtDocumentoEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmConsultaCadastroContribuinte.edtDocumentoExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO(lblMsg, nil);

  if length(Trim(cboUF.Text)) > 0 then
  begin

    if Length(Trim(edtDocumento.Text)) = 14 then
    begin

      if  ValidarCnpjCpf(LimparCpnjInscricao(Trim(edtDocumento.Text))) then
        dmDBEXMaster.fdqPesqCliente.SQL.Add('where cnpj =  '+ QuotedStr(LimparCpnjInscricao(Trim(edtDocumento.Text))))
      else
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO + FormatarCNPJCPF(Trim(edtDocumento.Text));
        edtDocumento.SetFocus;

      end;

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DOCUMENTO_INVALIDO + edtDocumento.Text;
      edtDocumento.SetFocus;

    end;

  end;

end;

procedure TfrmConsultaCadastroContribuinte.edtDocumentoKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmConsultaCadastroContribuinte.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);

  dmMProvider.AbrirTabelaEstados;

  dmMProvider.cdsEstados.First;

  while not dmMProvider.cdsEstados.Eof do
  begin

    cboUF.Items.Add(dmMProvider.cdsEstadosSIGLA.Value);

    dmMProvider.cdsEstados.Next;

  end;

end;

procedure TfrmConsultaCadastroContribuinte.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if Length(Trim(cboUF.Text)) < 2 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    cboUF.SetFocus;

  end
  else if Length(Trim(edtDocumento.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtDocumento.SetFocus;

  end
  else if Length(Trim(edtDocumento.Text)) <> 14 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_DOCUMENTO_INVALIDO + edtDocumento.Text;
    edtDocumento.SetFocus;

  end
  else
  begin

    if  ValidarCnpjCpf(LimparCpnjInscricao(Trim(edtDocumento.Text))) then
      ModalResult := mrOk
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO + FormatarCNPJCPF(Trim(edtDocumento.Text));
      edtDocumento.SetFocus;

    end;

  end;

end;

procedure TfrmConsultaCadastroContribuinte.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
