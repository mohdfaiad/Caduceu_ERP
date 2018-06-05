unit modLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, IniFiles;

type
  TfrmLoginPV = class(TForm)
    grpLogin: TGroupBox;
    lblLoja: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtLoja: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtNomeLoja: TEdit;
    grmMensagens: TGroupBox;
    imgConfirmar: TImage;
    imgCancelar: TImage;
    memMensagens: TMemo;
    procedure imgCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ifArqIni:TIniFile;
  public
    { Public declarations }
  end;

var
  frmLoginPV: TfrmLoginPV;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, modPedido, uConstantes_Padrao, uFuncoes, datamZeus,
  dataMDJPdv;

procedure TfrmLoginPV.edtLojaEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmLoginPV.edtLojaKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLoginPV.edtLojaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmLoginPV.edtSenhaExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

   if (length(Trim(edtLoja.Text)) > 0) and (length(Trim(edtUsuario.Text)) > 0) and (length(Trim(edtSenha.Text)) > 0) then
    imgConfirmarClick(self);


end;

procedure TfrmLoginPV.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FreeAndNil(ifArqIni);

end;

procedure TfrmLoginPV.FormCreate(Sender: TObject);
begin

  Color             := COR_PADRAO_TELAS;
  DesabilitarBotaoFecharForm(handle);

  edtLoja.Text      := InttoStr(dmMProvider.cdsConfig_iniLOJA.Value);
  edtNomeLoja.Text  := dmMProvider.cdsConfig_iniNOME_LOJA.Value;
  ifArqIni          := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  edtUsuario.Text   := dmMProvider.cdsConfig_iniULTIMO_USUARIO.Value;

end;

procedure TfrmLoginPV.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmLoginPV.imgConfirmarClick(Sender: TObject);
begin

  try

    if UpperCase(edtUsuario.Text) <> 'SYSDBA' then
    begin

      memMensagens.Clear;
      memMensagens.Lines.Add('Aguarde....validando usu�rio e senha!');

      dmMProvider.cdsUsuarios.Close;
      dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';

      dmDBEXMaster.fdqUsuarios.SQL.Clear;
      dmDBEXMaster.fdqUsuarios.SQL.Add('select * from usuarios');
      dmDBEXMaster.fdqUsuarios.SQL.Add('where login = ' + QuotedStr(edtUsuario.Text));
      dmDBEXMaster.fdqUsuarios.SQL.Add('and ativo = 1');

      dmMProvider.cdsUsuarios.Open;
      dmMProvider.cdsUsuarios.ProviderName := '';

      if dmMProvider.cdsUsuarios.IsEmpty then
      begin

        memMensagens.Lines.Add('Usu�rio n�o habilitado no sistema!');
        edtUsuario.SetFocus;
        edtSenha.Clear;
        exit;

      end
      else if dmMProvider.cdsUsuariosSENHA.Text <> EnDecryptString(string(edtSenha.Text), 236) then
      begin

        memMensagens.Lines.Add('Senha informada n�o confere com o cadastro!');
        edtSenha.SetFocus;
        edtSenha.Clear;
        exit;

      end;

    end
    else if length(Trim(edtSenha.Text)) > 0  then
    begin

      if edtSenha.Text <> 'masterkey' then
      begin

        memMensagens.Lines.Add('Verifique a senha informada!');
        edtSenha.SetFocus;
        edtSenha.Clear;
        exit;

      end;

    end;


    dmDBEXMaster.sNomeUsuario := edtUsuario.Text;
    memMensagens.Lines.Add('Aguarde... verificando loja!');

    dmMProvider.cdsFilial.Close;
    dmMProvider.cdsFilial.ProviderName := 'dspFilial';

    dmDBEXMaster.fdqFilial.SQL.Clear;
    dmDBEXMaster.fdqFilial.SQL.Add('SELECT FILIAL.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
    dmDBEXMaster.fdqFilial.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
    dmDBEXMaster.fdqFilial.SQL.Add('FROM FILIAL FILIAL');
    dmDBEXMaster.fdqFilial.SQL.Add('JOIN CIDADES CIDADES');
    dmDBEXMaster.fdqFilial.SQL.Add('ON(CIDADES.CIDADE = FILIAL.CIDADE)');
    dmDBEXMaster.fdqFilial.SQL.Add('JOIN ESTADOS ESTADOS');
    dmDBEXMaster.fdqFilial.SQL.Add('ON(ESTADOS.SIGLA = FILIAL.ESTADO)');
    dmDBEXMaster.fdqFilial.SQL.Add('where filial.filial = ' + edtLoja.Text);

    dmMProvider.cdsFilial.Open;
    dmMProvider.cdsFilial.ProviderName := '';

    if dmMProvider.cdsFilial.IsEmpty then
    begin

      memMensagens.Lines.Add('Loja n�o habilitada no sistema!');
      edtloja.SetFocus;
      edtSenha.Clear;
      exit;

    end
    else
      edtNomeLoja.Text := dmMProvider.cdsFilialRAZAOSOCIAL.Value;

    dmDBEXMaster.sNomeUsuario       := edtUsuario.Text;

    if UpperCase(edtSenha.Text) <> 'SYSDBA' then
    begin

      dmDBEXMaster.iIdUsuario         := dmMProvider.cdsUsuariosUSUARIO.Value;
      dmDBEXMaster.sSenha             := EnDecryptString(string(edtSenha.Text), 236)

    end
    else
    begin


      dmDBEXMaster.iIdUsuario         := 999999;
      dmDBEXMaster.sSenha             := edtSenha.Text;

    end;

    if not (dmMProvider.cdsConfiguracoesDDP.IsNull) then
    begin

      memMensagens.Lines.Add('Licen�a de uso expirada! Entre em contato com o suporte.');
      edtloja.SetFocus;
      edtSenha.Clear;
      exit;

    end;

    dmDBEXMaster.iIdFilial          := dmMProvider.cdsFilialFILIAL.Value;

    ifArqIni.WriteString('Loja','Codigo',edtLoja.Text);
    ifArqIni.WriteString('Loja','RSocial',edtNomeLoja.Text);
    ifArqIni.WriteString('Login','UltimoLogin',edtUsuario.Text);

    if not (dmMProvider.cdsCfgConexaoZeusRetail.IsEmpty) then
    begin

      case dmMProvider.cdsConfiguracoesMODELOPDV.Value of
        3:begin

            dmMZeus.fdcZeusRetail.Close;

            dmMZeus.fdcZeusRetail.Params.Clear;
            dmMZeus.fdcZeusRetail.Params.Values['DRIVERID'    ]   := 'MSSQL';

            case dmMProvider.cdsCfgConexaoZeusRetailTIPO_AUTENTICACAO.Value of
              0:dmMZeus.fdcZeusRetail.Params.Values['OSAUTHENT'   ]   := 'NO';
              1:dmMZeus.fdcZeusRetail.Params.Values['OSAUTHENT'   ]   := 'YES';
            end;

            dmMZeus.fdcZeusRetail.Params.Values['SERVER'      ]   := dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value;
            dmMZeus.fdcZeusRetail.Params.Values['DATABASE'    ]   := dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value;
            dmMZeus.fdcZeusRetail.Params.Values['USER_NAME'   ]   := dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value;
            dmMZeus.fdcZeusRetail.Params.Values['PASSWORD'    ]   := dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value;

            memMensagens.Lines.Add(dmDBEXMaster.sNomeUsuario + MSG_AGUARDE + 'conectando-se ao PAF-ECF');
            Application.ProcessMessages;

            dmMZeus.fdcZeusRetail.open;

            dmMZeus.fdcZeusRetail.Close;

            memMensagens.Lines.Add(dmDBEXMaster.sNomeUsuario + MSG_CONEXAO_BANCO_OK);
            Application.ProcessMessages;

          end;
        4:begin

            dmMDJPdv.fdcDJPdv.Close;

            dmMDJPdv.fdcDJPdv.Params.Clear;
            dmMDJPdv.fdcDJPdv.Params.Values['SERVER'       ]   := dmMProvider.cdsCfgConexaoZeusRetailIP_SERVIDOR.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['DATABASE'     ]   := dmMProvider.cdsCfgConexaoZeusRetailNOME_BANCO.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['USER_NAME'    ]   := dmMProvider.cdsCfgConexaoZeusRetailUSUARIO.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['PASSWORD'     ]   := dmMProvider.cdsCfgConexaoZeusRetailSENHA.Value;
            dmMDJPdv.fdcDJPdv.Params.Values['CHARACTERSET' ]   := 'ISO8859_1';

            if  UpperCase(dmMProvider.cdsCfgConexaoZeusRetailTIPO_SERVIDOR.Value) <> 'LOCAL'then
              dmMDJPdv.fdcDJPdv.Params.Values['PROTOCOL'  ]   := 'TCPIP'
            else
              dmMDJPdv.fdcDJPdv.Params.Values['PROTOCOL'  ]   := dmMProvider.cdsCfgConexaoZeusRetailTIPO_SERVIDOR.Value;

            dmMDJPdv.fdcDJPdv.Params.Values['PAGESIZE'     ]   := '16384';
            dmMDJPdv.fdcDJPdv.Params.Values['DRIVERID'     ]   := 'FB';

            dmMDJPdv.fdcDJPdv.Open;
            dmMDJPdv.fdcDJPdv.Close;

          end;

      end;

    end;

    ModalResult := mrOk;

  except
    on E: exception do
      memMensagens.Lines.Add(Tratar_Erro_Conexao(E));

  end;

end;

end.


