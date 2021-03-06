unit modLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, IniFiles, Vcl.ActnList, WinApi.Winsock, SqlExpr,
  ShellApi, System.Actions;


type
  TfrmLogin = class(TForm)
    imgFundo: TImage;
    lblLoja: TLabel;
    lblData: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtLoja: TEdit;
    edtData: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtNomeLoja: TEdit;
    lblMsg: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pgbProgressoCopia: TProgressBar;
    actGenesis: TActionList;
    actDesconectarUsuario: TAction;
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataKeyPress(Sender: TObject; var Key: Char);
    procedure edtUsuarioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Live_Update;
    procedure edtSenhaExit(Sender: TObject);
    procedure actDesconectarUsuarioExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ifArqIni:TIniFile;
    function CopiaArquivo(Origem, Destino: String;pTipoAcesso:smallint): Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, modCompromissos, modProdutoEntraSaiPromocao, uConstantes_Padrao, uFuncoes, uFuncoes_BD;


function GetHostName(strIPAddress : String) : PAnsiChar;
//
// Retorna o Host onde seu TCP/IP est� conectado
// Requer a Winsock declarada na clausula uses da unit
//
var
  strHost         : PAnsiChar;
  pszIPAddress    : PAnsiChar ;
  pReturnedHostEnt: PHostEnt;
  InternetAddr    : u_long;
  GInitData       : TWSADATA;
begin

  strHost := '';

  if WSAStartup($101, GInitData) = 0 then
  begin

    pszIPAddress      := PAnsiChar(StrAlloc( Length( strIPAddress ) + 1 ));
    StrPCopy( pszIPAddress, strIPAddress );

    InternetAddr      := Inet_Addr(pszIPAddress);
    StrDispose( pszIPAddress );

    pReturnedHostEnt  := GetHostByAddr( PChar(@InternetAddr),4, PF_INET );

    try

      strHost := pReturnedHostEnt^.h_name;
      WSACleanup;

      Result  := strHost;

    except

      Result := 'Host inv�lido ou n�o encontrado';

    end;

  end;

end ;

//function GetHostName(strIPAddress : String) : PAnsiChar;external 'dfg_gen.dll';

procedure TfrmLogin.actDesconectarUsuarioExecute(Sender: TObject);
var
  sUsuarioDesconectar, sUsuario, sSenha:string;
begin

  frmDesconectarUsuario := TfrmDesconectarUsuario.Create(self);
  if frmDesconectarUsuario.ShowModal  = mrOk then
  begin

    sUsuarioDesconectar := frmDesconectarUsuario.edtUsuarioADesconectar.Text;
    sUsuario            := frmDesconectarUsuario.edtUsuario.Text;
    sSenha              := frmDesconectarUsuario.edtSenha.Text;

    dmDBEXMaster.sqcMaster.Params.Clear;
    dmDBEXMaster.sqcMaster.Params.Values['DRIVERNAME']  := 'Firebird';
    dmDBEXMaster.sqcMaster.Params.Values['DATABASE']    := ifArqIni.ReadString('Servidor', 'TCPIP', '') + ':' + ifArqIni.ReadString('Servidor', 'Path', 'C:\');
    dmDBEXMaster.sqcMaster.LoginPrompt                  := False;
    dmDBEXMaster.sqcMaster.Params.Values['USER_NAME']   := 'SYSDBA';
    dmDBEXMaster.sqcMaster.Params.Values['PASSWORD']    := 'masterkey';
    dmDBEXMaster.sqcMaster.Params.Values['SQLDIALECT']  := '3';
    dmDBEXMaster.sqcMaster.Open;

    dmDBEXMaster.sqqUsuario.Close;
    dmDBEXMaster.sqqUsuario.SQL.Clear;
    dmDBEXMaster.sqqUsuario.SQL.Add('SELECT * FROM USUARIOS');
    dmDBEXMaster.sqqUsuario.SQL.Add('WHERE LOGIN = ' + QuotedStr(sUsuario));
    dmDBEXMaster.sqqUsuario.Open;

    if not dmDBEXMaster.sqqUsuario.IsEmpty then
    begin

      dmDBEXMaster.sqqMasterPesq.Close;
      dmDBEXMaster.sqqMasterPesq.SQL.Clear;
      dmDBEXMaster.sqqMasterPesq.SQL.Add('SELECT * FROM MON$ATTACHMENTS');
      dmDBEXMaster.sqqMasterPesq.SQL.Add('WHERE MON$USER = ' + QuotedStr(sUsuarioDesconectar));
      dmDBEXMaster.sqqMasterPesq.Open;

      if not dmDBEXMaster.sqqMasterPesq.IsEmpty then
      begin

        dmSSPMaster.sspMaster.StoredProcName := 'EXECUTA_SQL';
        dmSSPMaster.sspMaster.ParamByName('I_SQL').Value := 'DELETE FROM MON$ATTACHMENTS  where MON$USER = '+ QuotedStr(sUsuarioDesconectar);
        dmSSPMaster.sspMaster.ExecProc;

        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_DATA').Value             := date;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_USUARIO').Value          := dmDBEXMaster.sqqUsuario.FieldByName('USUARIO').Value;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_HORA').Value             := Time;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_NOME_COMPUTADOR').Value  := dmDBEXMaster.sNome_Computador;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_ENDERECO_IP').Value      := dmDBEXMaster.sIP_Local;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_HISTORICO').Value        := 'DESCONECTOU O USUARIO: ' + sUsuarioDesconectar;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_OPERACAO').Value         := 3;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_NOME_TABELA').Value      := 'MON$ATTACHMENTS';

        dmSSPMaster.sspMan_Tab_Log.ExecProc;

      end
      else
      begin

        lblMsg.Caption  := 'Usu�rio informado n�o conetado: ' + sUsuarioDesconectar + #13;
        Application.ProcessMessages;

      end;

      dmDBEXMaster.sqcMaster.Close;

    end
    else
    begin

      lblMsg.Caption  := 'Usu�rio informado inexistente: ' +sUsuario + #13;
      Application.ProcessMessages;

    end;

    dmDBEXMaster.sqcMaster.Close;

  end;

end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
var
  wDia, wMes, wAno: Word;
  sSenha, sContraSenha, sSTemp, sDias_Nao_Importados, sLinha, sValidarSenha,sNome_Computador :string;
  bGerarCarga :integer;
  ssenha1, sCmd, sPath:string;
  resultado:PAnsiChar;
begin

  bGerarCarga := -1;

  lblMsg.Caption  := '';
  lblMsg.Caption  := 'Estabelecendo conex�o...aguarde....' + #13;
  Application.ProcessMessages;

  { armazena nome de usuario e senha  }

  dmDBEXMaster.sNomeUsuario       := edtUsuario.Text;

  if UpperCase(edtUsuario.Text) <> 'SYSDBA' then
  begin

    dmDBEXMaster.sqcMaster.Params.Clear;
    dmDBEXMaster.sqcMaster.Params.Values['DRIVERNAME']  := 'Firebird';
    dmDBEXMaster.sqcMaster.Params.Values['DATABASE']    := ifArqIni.ReadString('Servidor', 'TCPIP', '') + ':' + ifArqIni.ReadString('Servidor', 'Path', 'C:\');
    dmDBEXMaster.sqcMaster.LoginPrompt                  := False;
    dmDBEXMaster.sqcMaster.Params.Values['USER_NAME']   := 'SYSDBA';
    dmDBEXMaster.sqcMaster.Params.Values['PASSWORD']    := 'masterkey';
    dmDBEXMaster.sqcMaster.Params.Values['SQLDIALECT']  := '3';

    dmDBEXMaster.sqqUsuario_Conectado.Close;
    dmDBEXMaster.sqqUsuario_Conectado.SQL.Clear;
    dmDBEXMaster.sqqUsuario_Conectado.SQL.Add('SELECT MON$USER AS LOGIN, MON$REMOTE_PROCESS AS APLICACAO, MON$REMOTE_ADDRESS AS NOME_COMPUTADOR FROM MON$ATTACHMENTS WHERE MON$USER = ' + QuotedStr(edtUsuario.Text));
    dmDBEXMaster.sqqUsuario_Conectado.Open;

    if not dmDBEXMaster.sqqUsuario_Conectado.IsEmpty then
    begin

      dmSSPMaster.sspMaster.StoredProcName := 'EXECUTA_SQL';
      dmSSPMaster.sspMaster.ParamByName('I_SQL').Value := 'DELETE FROM MON$ATTACHMENTS  where MON$USER = '+ QuotedStr(edtUsuario.Text);
      dmSSPMaster.sspMaster.ExecProc;
    {

      sNome_Computador := String(GetHostName(dmDBEXMaster.sqqUsuario_Conectado.FieldByName('NOME_COMPUTADOR').AsString));

      lblMsg.Caption  := 'Usu�rio: ' + edtUsuario.Text + ', j� est� logado no sistema' + #13;
      lblMsg.Caption  := lblMsg.Caption + 'Pelo processo: ' + dmDBEXMaster.sqqUsuario_Conectado.FieldByName('APLICACAO').Value + #13;
      lblMsg.Caption  := lblMsg.Caption + 'Local: ' + dmDBEXMaster.sqqUsuario_Conectado.FieldByName('NOME_COMPUTADOR').Value
                                                    + '/' + String(sNome_Computador);

      edtUsuario.SetFocus;
      dmDBEXMaster.sqqUsuario_Conectado.Close;
      dmDBEXMaster.sqcMaster.Close;
      exit;
    }
    end;

    dmDBEXMaster.sqqUsuario_Conectado.Close;
    dmDBEXMaster.sqcMaster.Close;

    dmCDSMaster.cdsLogin.Append;

    dmCDSMaster.cdsLoginSENHA.Value := Copy(EnDecryptString(string(edtSenha.Text), 236),1,10);
    dmDBEXMaster.sSenha             := dmCDSMaster.cdsLoginSENHA.Value;
//    dmDBEXMaster.sSenha           := Copy(Crypt('C',edtSenha.Text),1,10);



  end
  else
    dmDBEXMaster.sSenha           := edtSenha.Text;

  dmDBEXMaster.iTipo_Acesso           := ifArqIni.ReadInteger('Atualizacao', 'TIPO_ACESSO', 0);
  dmDBEXMaster.sNome_Computador_Comp  := ifArqIni.ReadString('Atualizacao', 'NOME_COMPUTADOR', '');
  dmDBEXMaster.sUsuario_Comp          := ifArqIni.ReadString('Atualizacao', 'USUARIO', '');
  dmDBEXMaster.sSenha_Comp            := ifArqIni.ReadString('Atualizacao', 'SENHA', '');
  dmDBEXMaster.sPath_Atualizacao      := ifArqIni.ReadString('Atualizacao', 'PASTA', '');

  { limpa as configura��es da conex�o }

  dmDBEXMaster.sqcMaster.Params.Clear;

  { Carrega congura��es }

  dmDBEXMaster.sqcMaster.Params.Values['DRIVERNAME']  := 'Firebird';
  dmDBEXMaster.sqcMaster.Params.Values['DATABASE']    := ifArqIni.ReadString('Servidor', 'TCPIP', '') + ':' + ifArqIni.ReadString('Servidor', 'Path', 'C:\');
  dmDBEXMaster.sqcMaster.LoginPrompt                  := False;
  dmDBEXMaster.sqcMaster.Params.Values['USER_NAME']   := edtUsuario.Text;
  dmDBEXMaster.sqcMaster.Params.Values['SQLDIALECT']  := '3';

  dmDBEXMaster.sIP_Servidor                           := ifArqIni.ReadString('Servidor', 'TCPIP', '');

  try

    lblMsg.Caption := lblMsg.Caption + 'Verificando usu�rio / senha...aguarde...' + #13;
    Application.ProcessMessages;

    { verifica se foi informado o usu�rio mestre do bd  }

    if UpperCase(edtUsuario.Text) <> 'SYSDBA' then
    begin

      dmDBEXMaster.sqcMaster.Params.Values['PASSWORD'] := dmDBEXMaster.sSenha;

      dmDBEXMaster.sqqUsuario.Close;
      dmDBEXMaster.sqqUsuario.SQL.Clear;
      dmDBEXMaster.sqqUsuario.SQL.Add('SELECT * FROM USUARIOS');
      dmDBEXMaster.sqqUsuario.SQL.Add('WHERE LOGIN = ' + QuotedStr(edtUsuario.Text));
      dmDBEXMaster.sqqUsuario.Open;

      if dmDBEXMaster.sqqUsuario.IsEmpty then
      begin

        lblMsg.Caption    := lblMsg.Caption + 'Usu�rio n�o habilitado no sistema' + #13;
        Application.ProcessMessages;
        edtUsuario.SetFocus;
        edtUsuario.SelectAll;

        ModalResult                   := mrNone;

      end
      else
      begin

        dmCDSMaster.cdsLogin.Append;
        dmCDSMaster.cdsLoginSENHA.Value := Copy(EnDecryptString(string(edtSenha.Text), 236),1,10);
        dmDBEXMaster.sSenha             := dmCDSMaster.cdsLoginSENHA.Value;

//        if Crypt('C',edtSenha.Text) <> (dmDBEXMaster.sqqUsuario.FieldByName('SENHA').AsString) then
        if (dmDBEXMaster.sSenha) <> (dmDBEXMaster.sqqUsuario.FieldByName('SENHA').AsString) then
        begin

          lblMsg.Caption  := lblMsg.Caption + 'Senha informada n�o confere com o cadastrado' + #13;
          Application.ProcessMessages;
          edtSenha.SetFocus;
          edtSenha.SelectAll;

          ModalResult     := mrNone;

          exit;

        end;


      end;

      dmDBEXMaster.iIdUsuario         := dmDBEXMaster.sqqUsuario.FieldByName('USUARIO').AsInteger;

    end
    else
    begin

      dmDBEXMaster.iIdUsuario                           := 999999;
      dmDBEXMaster.sqcMaster.Params.Values['PASSWORD']  := edtSenha.Text;
      lblMsg.Caption                                    := lblMsg.Caption + 'Desviando da autentica��o de usu�rio e senha' + #13;

    end;

    lblMsg.Caption  := lblMsg.Caption + 'Tentando conex�o...(n�o interrompa)' + #13;
    Application.ProcessMessages;

    dmDBEXMaster.sqqFilial.Close;
    dmDBEXMaster.sqqFilial.SQL.Clear;
    dmDBEXMaster.sqqFilial.SQL.Add('SELECT * FROM FILIAL');
    dmDBEXMaster.sqqFilial.SQL.Add('WHERE FILIAL = ' + edtLoja.Text);
    dmDBEXMaster.sqqFilial.OPen;

    { verifica se a Filial existe }

    lblMsg.Caption  := lblMsg.Caption + 'Conex�o estabelecida' + #13;
    Application.ProcessMessages;

    if dmDBEXMaster.sqqFilial.IsEmpty then
    begin

      lblMsg.Caption := lblMsg.Caption + 'Loja n�o configurada no sistema' + #13;
      Application.ProcessMessages;

      { aguarda um per�odo para redmensionar a tela }

      sleep(3000);

      { limpa campo de usu�rio e senha  }

      edtUsuario.Clear;
      edtSenha.Clear;

      { posiciona o cursor no campo usu�rio }

      edtUsuario.SetFocus;

      { limpa a lista de detalhes da conex�o  }

      lblMsg.Caption  := '';
      Application.ProcessMessages;

      ModalResult     := mrNone;

    end
    else
    begin

      edtNomeLoja.Text            := dmDBEXMaster.sqqFilial.FieldbyName('RAZAOSOCIAL').AsString;
      dmDBEXMaster.sRSocialFilial := edtNomeLoja.Text;

      Application.ProcessMessages;

      { grava dados da loja pra prox login  }

      ifArqIni.WriteString('Loja','Codigo',edtLoja.Text);
      ifArqIni.WriteString('Loja','RSocial',edtNomeLoja.Text);

      { grava usuario que efetuou login }

      ifArqIni.WriteString('Login','UltimoLogin',edtUsuario.Text);

      dmDBEXMaster.sNomeUsuario   := edtUsuario.Text;
      dmDBEXMaster.iIdFilial      := StrToInt(edtLoja.Text);

      dmSSPMaster.sspMaster.StoredProcName                := 'EXECUTA_SQL';

      if Tag = -1 then
      begin

        dmSSPMaster.sspMaster.ParamByName('I_SQL').Value  := 'UPDATE CONFIGURACOES SET DDP = NULL, DPR = NULL, FLAGDPR = 0';
        dmSSPMaster.sspMaster.ExecProc;

      end;

      dmDBEXMaster.sqqConfig.Open;

      { Pega data e hora do sevidor  }
      dmSSPMaster.sspDataHoraServidor.ExecProc;
      dmDBEXMaster.dDataHoraServidor := dmSSPMaster.sspDataHoraServidor.ParamByName('DATA_HORA_ATUAL').Value;

      { atualiza data/hora local com servidor }

      AlterarDataHoraLocal(dmDBEXMaster.dDataHoraServidor);

      DecodeDate(Date, wAno, wMes, wDia);

      sSTemp        := FormatFloat('00', wDia)
                      + FormatFloat('00', wMes)
                      + FormatFloat('00', wAno - 2000);

      sContraSenha  := IntToHex((StrToInt(sSTemp) * 5), 8);

      if not dmDBEXMaster.sqqConfig.FieldByName('DPR').IsNull then
        dmDBEXMaster.dDataLicen�a := dmDBEXMaster.sqqConfig.FieldByName('DPR').Value
      else
      begin

        dmSSPMaster.sspMaster.ParamByName('I_SQL').Value  := 'UPDATE CONFIGURACOES SET DPR = '
              + QuotedStr(FormatDateTime('mm/dd/yy',date+30));
        dmSSPMaster.sspMaster.ExecProc;
        dmDBEXMaster.sqqConfig.Close;
        dmDBEXMaster.sqqConfig.Open;
        dmDBEXMaster.dDataLicen�a := dmDBEXMaster.sqqConfig.FieldByName('DPR').Value

      end;

      if (dmDBEXMaster.sqqConfig.FieldByName('FLAGDPR').Value = 1)
        and (Date >= dmDBEXMaster.sqqConfig.FieldByName('DPR').Value)
        and (dmDBEXMaster.sqqConfig.FieldByName('DDP').IsNull) then
      begin

        dmSSPMaster.sspMaster.ParamByName('I_SQL').Value  := 'UPDATE CONFIGURACOES SET DDP = '
//              + QuotedStr(Crypt('C',(DateToStr(EncodeDate(wAno, wMes, wDia)))));
              + QuotedStr(EnDecryptString(DateToStr(EncodeDate(wAno, wMes, wDia)),236));
        dmSSPMaster.sspMaster.ExecProc;

        sSenha := InputBox('Valida��o', 'Informe a senha para libera��o:', '');

        if Copy(sSenha, 1, length(sSenha) - 2) <> sContraSenha then
        begin

          Application.MessageBox(PChar('Senha n�o confere! Prazo de validade expirado. Imposs�vel continuar!!!'
            + #13#13
            + 'Entre em contato com o suporte: '
            + #13 + #13
            + dmDBEXMaster.sqqConfig.FieldByName('SUPORTECONTATO').AsString),
            'Aten��o!', mb_IconError + mb_Ok);
            Application.Terminate;

        end
        else
        begin

          dmSSPMaster.sspMaster.ParamByName('I_SQL').Value  := 'UPDATE CONFIGURACOES SET DDP = NULL, DPR = '
                + QuotedStr(DateToStr((Date + StrToInt(Copy(sSenha, (length(sSenha) - 1), 2)) - 15)));
          dmSSPMaster.sspMaster.ExecProc;

        end;

      end
      else if (dmDBEXMaster.sqqConfig.FieldByName('FLAGDPR').Value = 1)
        and (Date < dmDBEXMaster.sqqConfig.FieldByName('DPR').Value)
        and not (dmDBEXMaster.sqqConfig.FieldByName('DDP').IsNull) then
      begin

        Application.MessageBox(PChar('Foi detectado diverg�ncia entre datas. O Sistema ser� paralizado!'
          + #13#13 + 'Entre em contato com o suporte: ' + #13 + #13 +
            dmDBEXMaster.sqqConfig.FieldByName('SUPORTECONTATO').AsString),
            'Aten��o!', mb_IconError + mb_Ok);

        ExcluirArquivosCuringa(Extractfilepath(Application.ExeName), '*.exe', False);
        Application.Terminate;
        exit;

      end
      else if (dmDBEXMaster.sqqConfig.FieldByName('FLAGDPR').Value = 2) then
      begin

        dmSSPMaster.sspMaster.ParamByName('I_SQL').Value  := 'UPDATE CONFIGURACOES SET FLAGDPR = 1, DDP = NULL ,DPR = '
          + QuotedStr(DateToStr(EncodeDate(wAno, wMes, wDia)));
        dmSSPMaster.sspMaster.ExecProc;

      end
      else if not (dmDBEXMaster.sqqConfig.FieldByName('DDP').IsNull) then
      begin

        Application.MessageBox(PChar('Licen�a de uso expirada. O Sistema ser� paralizado!'
          + #13#13 + 'Entre em contato com o suporte: ' + #13 + #13 +
            dmDBEXMaster.sqqConfig.FieldByName('SUPORTECONTATO').AsString),
            'Aten��o!', mb_IconError + mb_Ok);
        Application.Terminate;
        exit;

      end;

      if Trim(ifArqIni.ReadString('Loja', 'cnpj', '')) = '' then
      begin

        if FileExists(dmDBEXMaster.sPath_Atualizacao + 'Transferencia.gen') then
          if VersaoExe(dmDBEXMaster.sPath_Atualizacao +  'Transferencia.gen') <> VersaoExe(ExtractFilePath(Application.ExeName) + 'Transferencia.gen') then
          begin

            pgbProgressoCopia.Visible   := True;
            pgbProgressoCopia.Position  := 0;

            lblMsg.Caption := lblMsg.Caption +  'Aguarde..realizando atualiza��o..m�dulo de transfer�ncia' + #13;
            Application.ProcessMessages;

            CopiaArquivo(dmDBEXMaster.sPath_Atualizacao +  'Transferencia.gen', ExtractFilePath(Application.ExeName) + 'Transferencia.gen', dmDBEXMaster.iTipo_Acesso);

            pgbProgressoCopia.Position  := 0;
            pgbProgressoCopia.Visible   := False;
            Application.ProcessMessages;

          end;

        sLinha := ExtractFilePath(Application.ExeName)
          + 'Transferencia.gen '
          + edtUsuario.Text + ' '
          + dmDBEXMaster.sSenha + ' '
          + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
          + IntToStr(dmDBEXMaster.iIdFilial);

          {
          cria um processo para chamaar a tela
          de manuten��o de estados
          }
      end
      else
      begin

        lblMsg.Caption := 'Verificando atualiza��es dispon�veis...(n�o interrompa esse processo)' + #13;
        Application.ProcessMessages;

        btnConfirmar.Enabled  := False;
        btnCancelar.Enabled   := false;

        if dmDBEXMaster.iTipo_Acesso = 1 then
        begin

          sPath := '\\' + dmDBEXMaster.sNome_Computador_Comp
                        + '\' + dmDBEXMaster.sPath_Atualizacao + '\';

          sCmd := 'NET USE \\' + dmDBEXMaster.sNome_Computador_Comp
                               + '\' + dmDBEXMaster.sPath_Atualizacao
                               + ' /USER:' + dmDBEXMaster.sUsuario_Comp
                               + ' ' + dmDBEXMaster.sSenha_Comp
                               + ' /PERSISTENT:yes';

          CriarProcessoSimples(sCmd);

          dmDBEXMaster.sPath_Atualizacao := sPath;
          Live_Update;

        end
        else if dmDBEXMaster.iTipo_Acesso = 0 then
        begin

          sPath := dmDBEXMaster.sPath_Atualizacao;

          if not (DirectoryExists(sPath)) then
          begin

            lblMsg.Caption := lblMsg.Caption + 'Pasta para atualiza��o n�o encontrada...' + #13
                                             + 'Atualiza��es n�o ser�o verificadas/realizadas!';
            Application.ProcessMessages;
            sleep(6000);

          end
          else
            Live_Update;

        end;

        lblMsg.Caption := lblMsg.Caption + 'Verificando promo��es a serem encerradas...' + #13;
        Application.ProcessMessages;

        dmDBEXMaster.sqqSel_Prod_E_S_Promo.Close;
        dmDBEXMaster.sqqSel_Prod_E_S_Promo.ParamByName('IP_DATA').Value   := Date;
        dmDBEXMaster.sqqSel_Prod_E_S_Promo.ParamByName('IP_FILIAL').Value := dmDBEXMaster.iIdFilial;
        dmDBEXMaster.sqqSel_Prod_E_S_Promo.ParamByName('IP_STATUS').Value := 1;

        dmDBEXMaster.sqqSel_Prod_E_S_Promo.Open;

        if not dmDBEXMaster.sqqSel_Prod_E_S_Promo.IsEmpty then
        begin

          bGerarCarga := 0;

          frmProdutoEntraSaiPromocao      := TfrmProdutoEntraSaiPromocao.Create(self);

          frmProdutoEntraSaiPromocao.Tag  := 1;
          frmProdutoEntraSaiPromocao.ShowModal;

          FreeAndNil(frmProdutoEntraSaiPromocao);

        end;

        lblMsg.Caption := lblMsg.Caption + 'Verificando promo��es a serem executadas...' + #13;
        Application.ProcessMessages;

        dmDBEXMaster.sqqSel_Prod_E_S_Promo.Close;
        dmDBEXMaster.sqqSel_Prod_E_S_Promo.ParamByName('IP_DATA').Value   := Date;
        dmDBEXMaster.sqqSel_Prod_E_S_Promo.ParamByName('IP_FILIAL').Value := dmDBEXMaster.iIdFilial;
        dmDBEXMaster.sqqSel_Prod_E_S_Promo.ParamByName('IP_STATUS').Value := 0;

        dmDBEXMaster.sqqSel_Prod_E_S_Promo.Open;


        if not dmDBEXMaster.sqqSel_Prod_E_S_Promo.IsEmpty then
        begin

          bGerarCarga := 0;

          frmProdutoEntraSaiPromocao      := TfrmProdutoEntraSaiPromocao.Create(self);

          frmProdutoEntraSaiPromocao.Tag  := 0;
          frmProdutoEntraSaiPromocao.ShowModal;

          FreeAndNil(frmProdutoEntraSaiPromocao);

        end;

        if bGerarCarga = 0 then
        begin

          bGerarCarga := -1;

          MessageBox(Application.Handle, Pchar(dmDBEXMaster.sNomeUsuario +
            ', ser� necess�rio gerar os arquivo para os caixas e para balan�a' + #13
            + 'se hover produtos pes�veis!'), 'Informa��o', mb_ok +
            MB_ICONINFORMATION);

        end;

        btnConfirmar.Enabled  := true;
        btnCancelar.Enabled   := true;

        sLinha := ExtractFilePath(Application.ExeName)
          + 'Prc_gac.gen '
          + edtUsuario.Text + ' '
          + dmDBEXMaster.sSenha + ' '
          + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
          + IntToStr(dmDBEXMaster.iIdFilial);

      end;

      CriarProcessoSimples(sLinha);

    end;

  except
    //testa se houve erro de usu�rio e senha
    on E: Exception do
    begin

      btnConfirmar.Enabled  := true;
      btnCancelar.Enabled   := true;

      //mostra mensagem de erro
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + #13;
      lblMsg.Caption := lblMsg.Caption + e.Message + #13;
      lblMsg.Caption := lblMsg.Caption + TratarMsgErroFB(e.Message);
      lblMsg.Caption := lblMsg.Caption + '......Conex�o Abortada!';

      Application.ProcessMessages;

      //limpa campo de usua�rio e senha
      edtUsuario.Clear;
      edtSenha.Clear;

      //posiciona o cursor no campo usu�rio
      edtUsuario.SetFocus;

      ModalResult := mrNone;


    end;

  end;

end;

function TfrmLogin.CopiaArquivo(Origem, Destino: String;pTipoAcesso:smallint): Boolean;
const
  TamanhoBuffer = 50000;
var
  ArqOrigem,ArqDestino: TFileStream;
  pBuf: Pointer;
  cnt: Integer;
  totCnt, TamanhoOrigem: Int64;
begin

  Result := True;
  totCnt := 0;

  try

    ArqOrigem := TFileStream.Create(Origem, fmOpenRead or fmShareDenyWrite);

  except

    on E: Exception do
    begin

      Result := False;
      Exit;

    end;

  end;

  TamanhoOrigem := ArqOrigem.size;

  with pgbProgressoCopia do
  begin

    Position := 0;

  end;

  try

    try

      ArqDestino := TFileStream.Create(Destino, fmCreate or fmShareExclusive);

    except
      on E: Exception do
      begin

        Result := False;
        Exit;

      end;

    end;

    try

      GetMem(pBuf, TamanhoBuffer);

      try

        cnt := ArqOrigem.Read(pBuf^, TamanhoBuffer);
        cnt := ArqDestino.Write(pBuf^, cnt);
        totCnt := totCnt + cnt;

        while (cnt > 0) do
        begin

          cnt                         := ArqOrigem.Read(pBuf^, TamanhoBuffer);
          cnt                         := ArqDestino.Write(pBuf^, cnt);
          totcnt                      := totcnt + cnt;
          pgbProgressoCopia.Position  := Round((totCnt / TamanhoOrigem) * 100);
          Application.ProcessMessages;

        end;

      finally

        FreeMem(pBuf, TamanhoBuffer);

      end;

    finally

      ArqDestino.Free;

    end;

  finally

    ArqOrigem.Free;

  end;


end;

procedure TfrmLogin.edtDataKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmLogin.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TfrmLogin.edtLojaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmLogin.edtSenhaExit(Sender: TObject);
var
  wDia, wMes, wAno:Word;
  sData, sSenha:string;
  iSenha:integer;

begin

  DecodeDate(Date, wAno, wMes, wDia);

  sData   := FormatFloat('00',wDia) + FormatFloat('00',wMes) + FormatFloat('00',wAno);
  iSenha  := (StrToInt(sData) * 3);

  if (edtSenha.Text = 'masterkey') and (edtUsuario.Text = 'SYSDBA') then
  begin

    sSenha := InputBox(#13 + 'Informe a contra-senha', #13 + 'Contra-senha: ','');

    if length(sSenha) > 0 then
    begin
      try

        if StrToInt(sSenha) <> iSenha then
        begin

          ShowMessage('Contra-senha n�o confere');
          edtSenha.Clear;
          edtSenha.SetFocus;

        end;

      except

        ShowMessage('Contra-senha inv�lida');
        edtSenha.Clear;
        edtSenha.SetFocus;

      end;
    end
    else
    begin

      edtSenha.Clear;
      edtSenha.SetFocus;

    end;

  end;

end;

procedure TfrmLogin.edtUsuarioChange(Sender: TObject);
begin

  btnConfirmar.Enabled := (Trim(edtUsuario.Text) <> '') and (Trim(edtSenha.Text) <> '');

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

  dmCDSMaster.cdsLogin.CreateDataSet;
  dmCDSMaster.cdsLogin.Open;

  dmDBEXMaster.sNome_Computador := pubNomeComputador;
  dmDBEXMaster.sIP_Local        := RetornarIP;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin

  //verifica se o arquivo de configura��es existe
  if VerificarExisteArquivo(ExtractFilePath(Application.ExeName) + 'Config.ini') then
  begin

    edtData.Text      := FormatDateTime('dd/mm/yyyy',Date);
    ifArqIni          := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

    edtLoja.Text      := ifArqIni.ReadString('Loja', 'Codigo', '1');
    edtNomeLoja.Text  := ifArqIni.ReadString('Loja', 'RSocial', '');
    edtUsuario.Text   := ifArqIni.ReadString('Login', 'UltimoLogin', '');


    //carrega configura��es do servidor do BD
    dmDBEXMaster.sServidorBD      := ifArqIni.ReadString('Servidor','TCPIP','LocalHost');

    //carrega configura��o do Path onde o arquivo se encontra
    dmDBEXMaster.sPathArquivoBD   := ifArqIni.ReadString('Servidor','Path','C:\APLICAIVOS\GENESISAC\BD\GENESIS.FDB');

    //verifica se o servidor � local
    if (UpperCase(dmDBEXMaster.sServidorBD) = 'LOCALHOST') or (dmDBEXMaster.sServidorBD = '127.0.0.1') then
    begin

      //verifica se o arquivo existe
      if not VerificarExisteArquivo(dmDBEXMaster.sPathArquivoBD) then
      begin

        lblMsg.Caption  := 'O arquivo '+dmDBEXMaster.sPathArquivoBD
                            + ' n�o foi encontrado!'
                            + ' Verifique o arquivo de configura��es';
        Application.ProcessMessages;
        exit;

      end;
    end;

    //carrega identifica��o da loja
    dmDBEXMaster.iIdFilial        := ifArqIni.ReadInteger('Loja','Codigo',0);
    dmDBEXMaster.sRSocialFilial   := ifArqIni.ReadString('Loja','RSocial','');

    if dmDBEXMaster.sRSocialFilial <> '' then
    begin

      {

      verifica se o nome de usuario est� preenchido
      se verdadeiro posiciona o cursor no campo de senha

      }

      if edtUsuario.Text <> '' then
        edtSenha.SetFocus
      else
        edtUsuario.SetFocus;
    end
    else
      edtLoja.SetFocus;

  end
  else
  begin

    lblMsg.Caption  := 'O arquivo '+ExtractFilePath(Application.ExeName)
                        + 'Config.ini n�o foi encontrado! ' +#13
                        + 'Verifique o arquivo de configura��es';
    Application.ProcessMessages;

  end;


end;

procedure TfrmLogin.Live_Update;
var
  sVersaoLive, sVersaoAtual, TempNome, sVersao: string;
  F: TSearchRec;
  FHandle, Ret, iContadorAtualizacao: Integer;
  bAtualizou:boolean;
begin

  dmDBEXMaster.sqqMasterPesq.Close;
  dmDBEXMaster.sqqMasterPesq.SQL.Clear;
  dmDBEXMaster.sqqMasterPesq.SQL.Add('SELECT * FROM CTRL_UPDATE');
  dmDBEXMaster.sqqMasterPesq.SQL.Add('WHERE NOME_COMPUTADOR = ' + QuotedStr(pubNomeComputador));
  dmDBEXMaster.sqqMasterPesq.Open;

  bAtualizou            := False;

  if dmDBEXMaster.sqqMasterPesq.IsEmpty then
  begin

    bAtualizou := True;

    iContadorAtualizacao  := 0;
    dmCDSMaster.cdsLiveUpdate.Close;
    dmCDSMaster.cdsLiveUpdate.CreateDataSet;
    dmCDSMaster.cdsLiveUpdate.IndexFieldNames := 'ARQUIVO';

    dmCDSMaster.cdsLiveUpdate.Open;

    if dmCDSMaster.cdsLiveUpdate.IsEmpty then
    begin

      //pega todos os arquivos executaveis da pasta Live Update
      Ret   := FindFirst(dmDBEXMaster.sPath_Atualizacao + '*.gen', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          if F.Name <> ExtractFileName(Application.ExeName) then
          begin

            {
              Grava atualiza nomes e vers�es dos execut�veis
            }

            sVersao := VersaoExe(dmDBEXMaster.sPath_Atualizacao + TempNome);

            FHandle := FileOpen(F.Name, 1);

            dmCDSMaster.cdsLiveUpdate.Append;
            dmCDSMaster.cdsLiveUpdateARQUIVO.Value  := F.Name;
            dmCDSMaster.cdsLiveUpdateVERSAO.Value   := sVersao;
            dmCDSMaster.cdsLiveUpdate.Post;

            FileClose(FHandle);

          end;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

    end;

    if FileExists(ExtractFilePath(Application.ExeName)+'GenesisAC.chm') then
    begin

      dmCDSMaster.cdsLiveUpdate.Append;
      dmCDSMaster.cdsLiveUpdateARQUIVO.Value := 'GenesisAC.chm';
      dmCDSMaster.cdsLiveUpdateVERSAO.Value  := DateToStr(FileDateToDateTime(FileAge('genesisac.chm')));
      dmCDSMaster.cdsLiveUpdate.Post;

    end
    else
    begin

      dmCDSMaster.cdsLiveUpdate.Append;
      dmCDSMaster.cdsLiveUpdateARQUIVO.Value := 'GenesisAC.chm';
      dmCDSMaster.cdsLiveUpdateVERSAO.Value  := '0';
      dmCDSMaster.cdsLiveUpdate.Post;

    end;

    dmCDSMaster.cdsLiveUpdate.First;

    dmCDSMaster.cdsVersaoAtual.Close;
    dmCDSMaster.cdsVersaoAtual.CreateDataSet;
    dmCDSMaster.cdsVersaoAtual.IndexFieldNames := 'ARQUIVO';

    dmCDSMaster.cdsVersaoAtual.Open;

    if dmCDSMaster.cdsVersaoAtual.IsEmpty then
    begin

      //pega todos os arquivos executaveis da pasta Live Update
      Ret   := FindFirst(ExtractFilePath(Application.ExeName) + '*.gen', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          if F.Name <> ExtractFileName(Application.ExeName) then
          begin

            {
              Grava atualiza nomes e vers�es dos execut�veis
            }

            sVersao := VersaoExe(ExtractFilePath(Application.ExeName) + TempNome);

            FHandle := FileOpen(F.Name, 1);

            dmCDSMaster.cdsVersaoAtual.Append;
            dmCDSMaster.cdsVersaoAtualARQUIVO.Value  := F.Name;
            dmCDSMaster.cdsVersaoAtualVERSAO.Value   := sVersao;
            dmCDSMaster.cdsVersaoAtual.Post;

            FileClose(FHandle);

          end;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

    end;

    if FileExists(dmDBEXMaster.sPath_Atualizacao+'GenesisAC.chm') then
    begin

      dmCDSMaster.cdsVersaoAtual.Append;
      dmCDSMaster.cdsVersaoAtualARQUIVO.Value := 'GenesisAC.chm';
      dmCDSMaster.cdsVersaoAtualVERSAO.Value  := DateToStr(FileDateToDateTime(FileAge(dmDBEXMaster.sPath_Atualizacao+'GenesisAC.chm')));
      dmCDSMaster.cdsVersaoAtual.Post;

    end
    else
    begin

      dmCDSMaster.cdsVersaoAtual.Append;
      dmCDSMaster.cdsVersaoAtualARQUIVO.Value := 'GenesisAC.chm';
      dmCDSMaster.cdsVersaoAtualVERSAO.Value  := '0';
      dmCDSMaster.cdsVersaoAtual.Post;

    end;

    dmCDSMaster.cdsVersaoAtual.First;

    while not dmCDSMaster.cdsLiveUpdate.Eof do
    begin

      lblMsg.Caption := 'Verificando atualiza��es dispon�veis...'
                          + IntToStr(dmCDSMaster.cdsLiveUpdate.RecNo)
                          + ' de ' + IntToStr(dmCDSMaster.cdsLiveUpdate.RecordCount) + #13
                          + '(n�o interrompa esse processo)';
;
      Application.ProcessMessages;

      if dmCDSMaster.cdsVersaoAtual.Locate('arquivo',dmCDSMaster.cdsLiveUpdateARQUIVO.Value,[]) then
      begin

        if dmCDSMaster.cdsLiveUpdateARQUIVO.Value = 'GenesisAC.chm' then
          lblMsg.Caption := 'Aguarde..realizando atualiza��o..' + dmCDSMaster.cdsLiveUpdateARQUIVO.Value + #13;

        if dmCDSMaster.cdsLiveUpdateVERSAO.Value <> dmCDSMaster.cdsVersaoAtualVERSAO.Value then
        begin

          Inc(iContadorAtualizacao);

          pgbProgressoCopia.Visible   := True;

          pgbProgressoCopia.Position  := 0;

          lblMsg.Caption := 'Aguarde..realizando atualiza��o..' + dmCDSMaster.cdsLiveUpdateARQUIVO.Value + #13;
          Application.ProcessMessages;

          bAtualizou := CopiaArquivo(dmDBEXMaster.sPath_Atualizacao +  dmCDSMaster.cdsLiveUpdateARQUIVO.Value, ExtractFilePath(Application.ExeName) + dmCDSMaster.cdsLiveUpdateARQUIVO.Value, dmDBEXMaster.iTipo_Acesso);

        end;

      end
      else
      begin

        Inc(iContadorAtualizacao);
        pgbProgressoCopia.Visible   := True;
        pgbProgressoCopia.Position  := 0;
        lblMsg.Caption := 'Aguarde..realizando atualiza��o..' +dmCDSMaster.cdsLiveUpdateARQUIVO.Value + #13;
        Application.ProcessMessages;

        bAtualizou := CopiaArquivo(dmDBEXMaster.sPath_Atualizacao +  dmCDSMaster.cdsLiveUpdateARQUIVO.Value, ExtractFilePath(Application.ExeName) + dmCDSMaster.cdsLiveUpdateARQUIVO.Value, dmDBEXMaster.iTipo_Acesso);

      end;

      dmCDSMaster.cdsLiveUpdate.Next;

    end;

    pgbProgressoCopia.Visible  := False;
    pgbProgressoCopia.Position := 0;

  end;

  if bAtualizou then
  begin

    lblMsg.Caption := 'Atualiza��o efetuada com sucesso! / '
                        + IntToStr(iContadorAtualizacao)
                        + ' arquivos'+ #13;
    Application.ProcessMessages;
    bAtualizou := False;

    dmSSPMaster.sspMan_Tab_Ctrl_Update.ParamByName('IP_NOME_COMPUTADOR').Value  := pubNomeComputador;
    dmSSPMaster.sspMan_Tab_Ctrl_Update.ParamByName('IP_NUMERO_IP').Value        := RetornarIP;
    dmSSPMaster.sspMan_Tab_Ctrl_Update.ParamByName('IP_DATA').Value             := Date;
    dmSSPMaster.sspMan_Tab_Ctrl_Update.ParamByName('IP_HORA').Value             := Time;
    dmSSPMaster.sspMan_Tab_Ctrl_Update.ExecProc;

  end
  else
  begin

    lblMsg.Caption := lblMsg.Caption + 'N�o h� atualiza��es a serem realizadas!' + #13;
    Application.ProcessMessages;

  end;

end;

end.
