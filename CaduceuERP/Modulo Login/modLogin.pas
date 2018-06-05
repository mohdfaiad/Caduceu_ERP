unit modLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, IniFiles, Vcl.ActnList, WinApi.Winsock, SqlExpr,
  ShellApi, System.Actions, Vcl.Imaging.pngimage;


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
    lblVersao: TLabel;
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ifArqIni:TIniFile;
    function CopiarArquivo(Origem, Destino: String;pTipoAcesso:smallint): Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, uConstantes_Padrao, uFuncoes,
  modProdutoEntraSaiPromocao;


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

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
var
  sSenha, sContraSenha, sSTemp, sLinha, sValidarSenha,sNome_Computador :string;
  ssenha1, sCmd, sPath:string;
  resultado:PAnsiChar;
begin

  lblMsg.Caption  := '';
  lblMsg.Caption  := 'Estabelecendo conex�o...aguarde....' + #13;
  Application.ProcessMessages;

  { armazena nome de usuario e senha  }

  dmDBEXMaster.sNomeUsuario       := edtUsuario.Text;

  if UpperCase(edtUsuario.Text) <> 'SYSDBA' then
    dmDBEXMaster.sSenha             := EnDecryptString(string(edtSenha.Text), 236)
  else
    dmDBEXMaster.sSenha     := edtSenha.Text;

  { limpa as configura��es da conex�o }

  dmDBEXMaster.Conectar;

  dmDBEXMaster.sIP_Servidor := ifArqIni.ReadString('Servidor', 'TCPIP', '');

  try

    lblMsg.Caption := lblMsg.Caption + 'Verificando usu�rio / senha...aguarde...' + #13;
    Application.ProcessMessages;

    { verifica se foi informado o usu�rio mestre do bd  }

    if UpperCase(edtUsuario.Text) <> 'SYSDBA' then
    begin

      dmMProvider.cdsUsuarios.Close;
      dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';

      dmDBEXMaster.fdqUsuarios.SQL.Clear;
      dmDBEXMaster.fdqUsuarios.SQL.Add('SELECT * FROM USUARIOS');
      dmDBEXMaster.fdqUsuarios.SQL.Add('WHERE LOGIN = ' + QuotedStr(edtUsuario.Text));
      dmDBEXMaster.fdqUsuarios.SQL.Add('AND ATIVO = 1');

      dmMProvider.cdsUsuarios.Open;
      dmMProvider.cdsUsuarios.ProviderName := '';

      if dmMProvider.cdsUsuarios.IsEmpty then
      begin

        lblMsg.Caption    := lblMsg.Caption + 'Usu�rio n�o habilitado no sistema' + #13;
        Application.ProcessMessages;
        edtUsuario.SetFocus;
        edtUsuario.SelectAll;

        ModalResult                   := mrNone;
        exit;

      end
      else
      begin

        dmDBEXMaster.sSenha             := EnDecryptString(string(edtSenha.Text), 236);

        if (dmDBEXMaster.sSenha) <> (dmMProvider.cdsUsuariosSENHA.AsString) then
        begin

          lblMsg.Caption  := lblMsg.Caption + 'Senha informada n�o confere com o cadastrado' + #13;
          Application.ProcessMessages;
          edtSenha.SetFocus;
          edtSenha.SelectAll;

          ModalResult     := mrNone;

          exit;

        end;


      end;

      dmDBEXMaster.iIdUsuario         := dmMProvider.cdsUsuariosUSUARIO.AsInteger;

    end
    else
    begin

      dmDBEXMaster.iIdUsuario := 999999;
      dmDBEXMaster.sSenha     := edtSenha.Text;
      lblMsg.Caption          := lblMsg.Caption + 'Desviando da autentica��o de usu�rio e senha' + #13;

    end;

    lblMsg.Caption  := lblMsg.Caption + 'Tentando conex�o...(n�o interrompa)' + #13;
    Application.ProcessMessages;

    dmMProvider.AbrirTabelaFilial;

    { verifica se a Filial existe }

    lblMsg.Caption  := lblMsg.Caption + 'Conex�o estabelecida' + #13;
    Application.ProcessMessages;

    if dmMProvider.cdsFilial.IsEmpty then
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

      edtNomeLoja.Text            := dmMProvider.cdsFilialRAZAOSOCIAL.AsString;
      dmDBEXMaster.sRSocialFilial := edtNomeLoja.Text;

      Application.ProcessMessages;

      { grava dados da loja pra prox login  }

      ifArqIni.WriteString('Loja','Codigo',edtLoja.Text);
      ifArqIni.WriteString('Loja','RSocial',edtNomeLoja.Text);
      ifArqIni.WriteString('Loja','cnpj',dmMProvider.cdsFilialCNPJ.Value);

      { grava usuario que efetuou login }

      ifArqIni.WriteString('Login','UltimoLogin',edtUsuario.Text);

      dmDBEXMaster.sNomeUsuario   := edtUsuario.Text;
      dmDBEXMaster.iIdFilial      := StrToInt(edtLoja.Text);

      dmMProvider.cdsConfiguracoes.Close;
      dmMProvider.cdsConfiguracoes.ProviderName := 'dspConfiguracoes';

      dmMProvider.cdsConfiguracoes.Open;
      dmMProvider.cdsConfiguracoes.ProviderName := '';

      dmDBEXMaster.sPath_Atualizacao      := dmMProvider.cdsConfiguracoesPATH_ATUALIZACAO.Value;

      { Pega data e hora do sevidor  }
      dmMSProcedure.fdspDataHoraServidor.ExecProc;
      dmDBEXMaster.dDataHoraServidor := dmMSProcedure.fdspDataHoraServidor.ParamByName('DATA_HORA_ATUAL').Value;

      { atualiza data/hora local com servidor }
      AlterarDataHoraLocal(dmDBEXMaster.dDataHoraServidor);

      lblMsg.Caption := 'Verificando atualiza��es dispon�veis...(n�o interrompa esse processo)' + #13;
      Application.ProcessMessages;

      btnConfirmar.Enabled  := False;
      btnCancelar.Enabled   := false;

      sPath := dmDBEXMaster.sPath_Atualizacao;

      if Copy(sPath,Length(Trim(sPath)),1) = '\' then
        sPath  := Copy(sPath,1,Length(Trim(sPath))-1);

      if not (DirectoryExists(sPath)) then
      begin

        lblMsg.Caption := lblMsg.Caption + 'Pasta para atualiza��o n�o encontrada...' + #13
                                         + 'Atualiza��es n�o ser�o verificadas/realizadas!' + #13;
        Application.ProcessMessages;
        sleep(6000);

      end
      else
        Live_Update;

      lblMsg.Caption := lblMsg.Caption + 'Verificando promo��es a serem encerradas...' + #13;
      Application.ProcessMessages;

      dmMProvider.cdsSel_Prod_E_S_Promo.Close;
      dmMProvider.cdsSel_Prod_E_S_Promo.ProviderName := 'dspSel_Prod_E_S_Promo';

      dmDBEXMaster.fdqSel_Prod_E_S_Promo.ParamByName('IP_DATA').Value   := Date;
      dmDBEXMaster.fdqSel_Prod_E_S_Promo.ParamByName('IP_FILIAL').Value := dmDBEXMaster.iIdFilial;
      dmDBEXMaster.fdqSel_Prod_E_S_Promo.ParamByName('IP_STATUS').Value := 1;

      dmMProvider.cdsSel_Prod_E_S_Promo.Open;
      dmMProvider.cdsSel_Prod_E_S_Promo.ProviderName := '';

      if not dmMProvider.cdsSel_Prod_E_S_Promo.IsEmpty then
      begin

        frmProdutoEntraSaiPromocao      := TfrmProdutoEntraSaiPromocao.Create(self);

        frmProdutoEntraSaiPromocao.Tag  := 1;
        frmProdutoEntraSaiPromocao.ShowModal;

        FreeAndNil(frmProdutoEntraSaiPromocao);

      end;

      lblMsg.Caption := lblMsg.Caption + 'Verificando promo��es a serem executadas...' + #13;
      Application.ProcessMessages;

      dmMProvider.cdsSel_Prod_E_S_Promo.Close;
      dmMProvider.cdsSel_Prod_E_S_Promo.ProviderName := 'dspSel_Prod_E_S_Promo';

      dmDBEXMaster.fdqSel_Prod_E_S_Promo.ParamByName('IP_DATA').Value   := Date;
      dmDBEXMaster.fdqSel_Prod_E_S_Promo.ParamByName('IP_FILIAL').Value := dmDBEXMaster.iIdFilial;
      dmDBEXMaster.fdqSel_Prod_E_S_Promo.ParamByName('IP_STATUS').Value := 0;

      dmMProvider.cdsSel_Prod_E_S_Promo.Open;
      dmMProvider.cdsSel_Prod_E_S_Promo.ProviderName := '';

      if not dmMProvider.cdsSel_Prod_E_S_Promo.IsEmpty then
      begin

        frmProdutoEntraSaiPromocao      := TfrmProdutoEntraSaiPromocao.Create(self);

        frmProdutoEntraSaiPromocao.Tag  := 0;
        frmProdutoEntraSaiPromocao.ShowModal;

        FreeAndNil(frmProdutoEntraSaiPromocao);

      end;

      if not dmMProvider.cdsSel_Prod_E_S_Promo.IsEmpty then
      begin

        MessageBox(Application.Handle, Pchar(dmDBEXMaster.sNomeUsuario +
          ', ser� necess�rio gerar os arquivo para os caixas e para balan�a' + #13
          + 'se hover produtos pes�veis!'), 'Informa��o', mb_ok +
          MB_ICONINFORMATION);

      end;

      btnConfirmar.Enabled  := true;
      btnCancelar.Enabled   := true;

      sLinha := ExtractFilePath(Application.ExeName)
                + 'PrcCaduc.exe '
                + edtUsuario.Text + ' '
                + dmDBEXMaster.sSenha + ' '
                + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                + IntToStr(dmDBEXMaster.iIdFilial);


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

function TfrmLogin.CopiarArquivo(Origem, Destino: String;pTipoAcesso:smallint): Boolean;
const
  TamanhoBuffer = 50000;
var
  ArqOrigem,ArqDestino: TFileStream;
  pBuf: Pointer;
  cnt: Integer;
  totCnt, TamanhoOrigem: Int64;
  tsLogCopia: TStringList;
begin

  Result := True;
  totCnt := 0;

  try

    ArqOrigem := TFileStream.Create(Origem, fmOpenRead or fmShareDenyWrite);

  except

    on E: Exception do
    begin

      tsLogCopia := tsLogCopia.Create;
      tsLogCopia.Add(e.Message);
      CriarPasta(ExtractFilePath(paramstr(0))+'Log\');
      tsLogCopia.SaveToFile(ExtractFilePath(paramstr(0))+'Log\erro_abrir_arquivo_origem.log');
      FreeAndNil(tsLogCopia);
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

        tsLogCopia := tsLogCopia.Create;
        tsLogCopia.Add(e.Message);
        CriarPasta(ExtractFilePath(paramstr(0))+'Log\');
        tsLogCopia.SaveToFile(ExtractFilePath(paramstr(0))+'Log\erro_abrir_arquivo_destino.log');
        FreeAndNil(tsLogCopia);

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

  lblVersao.Caption := PREFIXO_VERSAO +  RetornarVersao(Application.ExeName,1);

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
    dmDBEXMaster.sPathArquivoBD   := ifArqIni.ReadString('Servidor','Path','C:\APLICATIVOS\CADUCEU_ERP\BD\CADUCEU_ERP.FDB');

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

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT * FROM CTRL_UPDATE');
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE NOME_COMPUTADOR = ' + QuotedStr(pubNomeComputador));
  dmDBEXMaster.fdqMasterPesquisa.Open;

  bAtualizou            := False;

  if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
  begin

    dmMProvider.cdsLiveUpdate.Close;
    dmMProvider.cdsLiveUpdate.CreateDataSet;
    dmMProvider.cdsLiveUpdate.IndexFieldNames := 'ARQUIVO';

    bAtualizou                                := True;
    iContadorAtualizacao                      := 0;

    dmMProvider.cdsLiveUpdate.Open;

    if dmMProvider.cdsLiveUpdate.IsEmpty then
    begin

      CopiarDirImagens(dmDBEXMaster.sPath_Atualizacao +'Schemas\',ExtractFilePath(Application.ExeName) + 'Nfe\Arqs\');

      //pega todos os arquivos executaveis da pasta Live Update
      Ret   := FindFirst(dmDBEXMaster.sPath_Atualizacao + '*.exe', faAnyFile, F);

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

            dmMProvider.cdsLiveUpdate.Append;
            dmMProvider.cdsLiveUpdateARQUIVO.Value        := dmDBEXMaster.sPath_Atualizacao + F.Name;
            dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value     := F.Name;
            dmMProvider.cdsLiveUpdateVERSAO.Value         := sVersao;
            dmMProvider.cdsLiveUpdate.Post;

            FileClose(FHandle);

          end;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

      Ret   := FindFirst(dmDBEXMaster.sPath_Atualizacao + 'Rav\*.rav', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          sVersao := DataCriacaoArquivo(F.FindData.ftCreationTime);

          dmMProvider.cdsLiveUpdate.Append;
          dmMProvider.cdsLiveUpdateARQUIVO.Value        := dmDBEXMaster.sPath_Atualizacao + 'Rav\' + F.Name;
          dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value     := F.Name;
          dmMProvider.cdsLiveUpdateVERSAO.Value         := sVersao;
          dmMProvider.cdsLiveUpdate.Post;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

      Ret   := FindFirst(dmDBEXMaster.sPath_Atualizacao + 'DLLs\Diversos\*.dll', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          sVersao := DataCriacaoArquivo(F.FindData.ftCreationTime);

          dmMProvider.cdsLiveUpdate.Append;
          dmMProvider.cdsLiveUpdateARQUIVO.Value        := dmDBEXMaster.sPath_Atualizacao + 'DLLs\Diversos\' + F.Name;
          dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value     := F.Name;
          dmMProvider.cdsLiveUpdateVERSAO.Value         := sVersao;
          dmMProvider.cdsLiveUpdate.Post;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

      Ret   := FindFirst(dmDBEXMaster.sPath_Atualizacao + 'DLLs\OpenSSL\0.9.8.14\*.dll', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          sVersao := DataCriacaoArquivo(F.FindData.ftCreationTime);

          dmMProvider.cdsLiveUpdate.Append;
          dmMProvider.cdsLiveUpdateARQUIVO.Value        := dmDBEXMaster.sPath_Atualizacao + 'DLLs\OpenSSL\0.9.8.14\' + F.Name;
          dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value     := F.Name;
          dmMProvider.cdsLiveUpdateVERSAO.Value         := sVersao;
          dmMProvider.cdsLiveUpdate.Post;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

      Ret   := FindFirst(dmDBEXMaster.sPath_Atualizacao + 'DLLs\XMLSec\*.dll', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          sVersao := DataCriacaoArquivo(F.FindData.ftCreationTime);

          dmMProvider.cdsLiveUpdate.Append;
          dmMProvider.cdsLiveUpdateARQUIVO.Value        := dmDBEXMaster.sPath_Atualizacao + 'DLLs\XMLSec\' + F.Name;
          dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value     := F.Name;
          dmMProvider.cdsLiveUpdateVERSAO.Value         := sVersao;
          dmMProvider.cdsLiveUpdate.Post;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

    end;

    dmMProvider.cdsLiveUpdate.First;

    dmMProvider.cdsVersaoAtual.Close;
    dmMProvider.cdsVersaoAtual.CreateDataSet;
    dmMProvider.cdsVersaoAtual.IndexFieldNames := 'ARQUIVO';

    dmMProvider.cdsVersaoAtual.Open;

    if dmMProvider.cdsVersaoAtual.IsEmpty then
    begin

      //pega todos os arquivos executaveis da pasta Live Update
      Ret   := FindFirst(ExtractFilePath(Application.ExeName) + '*.exe', faAnyFile, F);

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

            dmMProvider.cdsVersaoAtual.Append;
            dmMProvider.cdsVersaoAtualARQUIVO.Value  := F.Name;
            dmMProvider.cdsVersaoAtualVERSAO.Value   := sVersao;
            dmMProvider.cdsVersaoAtual.Post;

            FileClose(FHandle);

          end;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

      Ret   := FindFirst(ExtractFilePath(Application.ExeName) + 'Rav\*.rav', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          sVersao := DataCriacaoArquivo(F.FindData.ftCreationTime);

          dmMProvider.cdsVersaoAtual.Append;
          dmMProvider.cdsVersaoAtualARQUIVO.Value  := F.Name;
          dmMProvider.cdsVersaoAtualVERSAO.Value   := sVersao;
          dmMProvider.cdsVersaoAtual.Post;

          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

      Ret   := FindFirst(ExtractFilePath(Application.ExeName) + '*.dll', faAnyFile, F);

      try

        while Ret = 0 do
        begin

          TempNome := F.Name;

          sVersao := DataCriacaoArquivo(F.FindData.ftCreationTime);

          dmMProvider.cdsVersaoAtual.Append;
          dmMProvider.cdsVersaoAtualARQUIVO.Value  := F.Name;
          dmMProvider.cdsVersaoAtualVERSAO.Value   := sVersao;
          dmMProvider.cdsVersaoAtual.Post;


          Ret := FindNext(F);

        end;

      finally
        FindClose(F);

      end;

    end;

    dmMProvider.cdsVersaoAtual.First;

    while not dmMProvider.cdsLiveUpdate.Eof do
    begin

      lblMsg.Caption := 'Verificando atualiza��es dispon�veis...'
                          + IntToStr(dmMProvider.cdsLiveUpdate.RecNo)
                          + ' de ' + IntToStr(dmMProvider.cdsLiveUpdate.RecordCount) + #13
                          + '(n�o interrompa esse processo)';

      Application.ProcessMessages;

      if dmMProvider.cdsVersaoAtual.Locate('arquivo',dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value,[]) then
      begin

        if dmMProvider.cdsLiveUpdateARQUIVO.Value = 'GenesisAC.chm' then
          lblMsg.Caption := 'Aguarde..realizando atualiza��o..' + dmMProvider.cdsLiveUpdateARQUIVO.Value + #13;

        if dmMProvider.cdsLiveUpdateVERSAO.Value <> dmMProvider.cdsVersaoAtualVERSAO.Value then
        begin

          Inc(iContadorAtualizacao);

          pgbProgressoCopia.Visible   := True;

          pgbProgressoCopia.Position  := 0;

          lblMsg.Caption := 'Aguarde..realizando atualiza��o..' + dmMProvider.cdsLiveUpdateARQUIVO.Value + #13;
          Application.ProcessMessages;

          if Pos('rav',ExtractFileExt(dmMProvider.cdsLiveUpdateARQUIVO.Value)) > 0 then
            bAtualizou := CopyFile(PwideChar(dmMProvider.cdsLiveUpdateARQUIVO.Value), PwideChar(ExtractFilePath(Application.ExeName) + 'Rav\' + dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value), True)
          else
            bAtualizou := CopiarArquivo(dmMProvider.cdsLiveUpdateARQUIVO.Value, ExtractFilePath(Application.ExeName) + dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value, dmDBEXMaster.iTipo_Acesso);
        end;

      end
      else
      begin

        Inc(iContadorAtualizacao);
        pgbProgressoCopia.Visible   := True;
        pgbProgressoCopia.Position  := 0;
        lblMsg.Caption := 'Aguarde..realizando atualiza��o..' +dmMProvider.cdsLiveUpdateARQUIVO.Value + #13;
        Application.ProcessMessages;

        if Pos('rav',ExtractFileExt(dmMProvider.cdsLiveUpdateARQUIVO.Value)) > 0 then
          bAtualizou := CopiarArquivo(dmMProvider.cdsLiveUpdateARQUIVO.Value, ExtractFilePath(Application.ExeName) + 'Rav\' + dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value, dmDBEXMaster.iTipo_Acesso)
        else
          bAtualizou := CopiarArquivo(dmMProvider.cdsLiveUpdateARQUIVO.Value, ExtractFilePath(Application.ExeName) + dmMProvider.cdsLiveUpdateNOME_ARQUIVO.Value, dmDBEXMaster.iTipo_Acesso);

      end;

      dmMProvider.cdsLiveUpdate.Next;

    end;

    pgbProgressoCopia.Visible  := False;
    pgbProgressoCopia.Position := 0;

  end;

  if bAtualizou then
  begin

    lblMsg.Caption := 'Atualiza��o efetuada com sucesso! / '  + IntToStr(iContadorAtualizacao)  + ' arquivos'+ #13;
    Application.ProcessMessages;
    bAtualizou := False;

    dmMSProcedure.fdspCtrl_Update.Params[0].Value := dmDBEXMaster.sNome_Computador;
    dmMSProcedure.fdspCtrl_Update.Params[1].Value := dmDBEXMaster.sIP_Local;
    dmMSProcedure.fdspCtrl_Update.Params[2].Value := Date;
    dmMSProcedure.fdspCtrl_Update.Params[3].Value := Time;
    dmMSProcedure.fdspCtrl_Update.ExecProc;

  end
  else
  begin

    lblMsg.Caption := lblMsg.Caption + 'N�o h� atualiza��es a serem realizadas!' + #13;
    Application.ProcessMessages;

    dmMSProcedure.fdspCtrl_Update.Params[0].Value := dmDBEXMaster.sNome_Computador;
    dmMSProcedure.fdspCtrl_Update.Params[1].Value := dmDBEXMaster.sIP_Local;
    dmMSProcedure.fdspCtrl_Update.Params[2].Value := Date;
    dmMSProcedure.fdspCtrl_Update.Params[3].Value := Time;
    dmMSProcedure.fdspCtrl_Update.ExecProc;

  end;

end;

end.




