unit modAutomacaoDJPDV;

interface

uses SysUtils, Windows, Forms, IniFiles, Classes, StrUtils, CheckLst, Db,
  variants, Dialogs;

procedure ExportarProdutosDJPDV(sArquivo, sPath: string; iFilial, pGeralAlterados, pTipoCodigoIntegracao: integer);
procedure ExportarClienteDJPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarBarrasDJPDV(sArquivo, sPath: string; iFilial, pTipoCodigoIntegracao: integer);
procedure ImportarVendaDJPdv(iFilial, pNumCx: integer; bCfgCxs: TCheckListBox; pAutomacao:boolean; pData:TDateTime);
function RelacionaProdutoDJ_Gen(pProduto:integer):string;
procedure ExportarPISDJPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarCOFINSDJPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarCEST(pArquivo, sPath:string);

implementation

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, modAutomacao,
  uConstantes_Padrao, uFuncoes, uFuncoes_BD, dataMDJPdv;

procedure ExportarProdutosDJPDV(sArquivo, sPath: string; iFilial, pGeralAlterados,pTipoCodigoIntegracao: integer);
var
  txtArq: TextFile;
  sLinha, sBarras, sInfoTabBarras, sBarras_Temp, sDescricao, sArqLogBarras, sProduto: string;
  sLog_Barras:TStringList;
begin

  sLog_Barras             := TStringList.Create;

  // arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmMProvider.cdsSelProdExpPdv.ProviderName := 'dspSelProdExpPdv';

  dmDBEXMaster.fdqSelProdExpPdv.Params[0].Value := iFilial;
  dmDBEXMaster.fdqSelProdExpPdv.Params[1].Value := pGeralAlterados;
  dmDBEXMaster.fdqSelProdExpPdv.Params[2].Value := 0;//pTipoCodigoIntegracao;

  dmMProvider.cdsSelProdExpPdv.Open;
  dmMProvider.cdsSelProdExpPdv.ProviderName     := '';

  LimparMSG_ERRO(frmAutomacao.lblMsg, nil);

  if dmMProvider.cdsSelProdExpPdv.IsEmpty then
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + MSG_ARQ_EXP_PRO_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok);
    exit;

  end

  else
  begin

    FormatSettings.DecimalSeparator       := ',';

    frmAutomacao.pgbProgressoArquivo.Max  := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value;
          Application.ProcessMessages;

          sDescricao                                := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value);

          if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
          begin

            if dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1 then
            begin

              sBarras_Temp  := Trim(dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value);
              sDescricao    := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value)

            end
            else
              sBarras_Temp  := Trim(dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value);

          end
          else
            sBarras_Temp  := Trim(dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value);

          if ValidaEAN(Trim(sBarras_Temp)) then
          begin

            case dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value of
              0:begin

                  if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 1 then
                  begin

                    if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
                      sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(Copy(sBarras_Temp, 1, 12)))])
                    else

//                            sBarras := Format('%-20.20s',[FormatFloat('00000000000000',StrToFloat(Copy(sBarras_Temp, 1, 12)))]);
                      sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(Copy(sBarras_Temp, 1, 12)))]);

                  end
                  else
//                    sBarras := FormatFloat('00000000000000000000', StrToFloat(sBarras_Temp))
//                          sBarras := Format('%-20.20s',[FormatFloat('00000000000000', StrToFloat(sBarras_Temp))]);
                    sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(sBarras_Temp))]);

                end;
              else
              begin

                if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
                  sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(Copy(sBarras_Temp, 1, 12)))])
                else
//                        sBarras := Format('%-20.20s',[FormatFloat('00000000000000', StrToFloat(sBarras_Temp))]);
                  sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(sBarras_Temp))]);

              end;

            end;

            if Length(Trim(sBarras)) = 11  then
              sBarras := Format('%-20.20s',[FormatFloat('000000000000',StrToFloat(sBarras))]);

            if Length(Trim(sBarras)) = 11  then
              sBarras := Format('%-20.20s',[FormatFloat('000000000000',StrToFloat(sBarras))]);

            if dmMProvider.cdsBarrasGERADO.Value = 1 then
              sLinha := FormatFloat('00000000000000000000', dmMProvider.cdsProdutosPRODUTO.Value)
            else
              sLinha := Format('%-20.20s',[' ']);

            if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
              sLinha := FormatFloat('00000000000000000000', dmMProvider.cdsSelProdExpPdvOP_PRODUTO.Value)
            else
              sLinha := Format('%-20.20s',[sBarras]);

            sLinha := sLinha + sBarras
                      + Format('%-40.40s',[sDescricao])
                      + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdvOP_COMPLEMENTO.Value])
                      + Format('%-4.4s',[dmMProvider.cdsSelProdExpPdvOP_UNIDADE.Value]);

            case dmMProvider.cdsSelProdExpPdvOP_PROMOCAO.Value of
              0:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
                  begin

                    if(dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1)  then
                      sLinha    := sLinha + FormatFloat('000000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 1000)
                    else
                      sLinha    := sLinha + FormatFloat('000000000000',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * 1000)));

                  end
                  else
                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value  * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 1000));

                end;
              1:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1) and (dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1) then
                    sLinha    := sLinha + FormatFloat('000000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 1000)
                  else if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * 1000)))
                  else
                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 1000));

                end;

            end;

            sLinha := sLinha + '000000'                                           //desconto promocional
                        + Format('%-1.1s',[dmMProvider.cdsSelProdExpPdvOP_CODIGO_ECF.Value])
                        + Format('%-4.4s',[FormatFloat('0000',dmMProvider.cdsSelProdExpPdvOP_ALIQUOTA_ICMS.Value * 100)])
                        + Format('%-65.65s',[' ']);                               //observa��o referente ao produto

            if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
              sLinha := sLinha + 'S'                                              //calcula quantidade produto pesavel
            else
              sLinha := sLinha + 'N';

            if dmMProvider.cdsSelProdExpPdvOP_PERMITE_VENDA_FRAC.Value = 1 then
              sLinha := sLinha + 'S'                                              //permite venda fracionada
            else
              sLinha := sLinha + 'N';

            sLinha := sLinha
                        + 'N'                                                     //permite digitar quantidade
                        + 'N'                                                     //usa configura��o do ECF para arredondamento ou truncamento
                        + 'N';                                                    //produ��o pr�pria


            if dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value > 0 then
            begin

              sLinha := sLinha + FormatFloat('000000', dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value)
                               + Format('%-30.30s',[dmMProvider.cdsSelProdExpPdvOP_DESCRICAO_GRUPO.Value])
            end
            else
            begin

              sLinha := sLinha + '0     '
                               + Format('%-30.30s',[' ']);

            end;

            sLinha := sLinha + '0     '                                           //codigo departamento
                             + Format('%-30.30s',[' '])                           //descri��o departamento
                             + '0     '                                           //chave estrangeira tabela marca
                             + Format('%-30.30s',[' '])                           //descri��o tabel marca
                             + '0     '                                           //c�digo vasilhame
                             + Format('%-30.30s',[' '])                           //descri��o vasilhame
                             + '0     ';                                          //c�digo da anima��o

            if dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value = 1 then
              sLinha := sLinha + '000000'                                         //permite venda
            else
              sLinha := sLinha + FormatFloat('000000',dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value);

            sLinha := sLinha + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdvOP_NCM.Value]);

            sLinha := sLinha + '0     ';                                         //codigo do tipo de descricao adcional

            if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 0 then
            begin

              sLinha := sLinha + Format('%20.20s',[FloatToStr(StrToFloat(Trim(dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value)))])      //gtin contabil
                        + Format('%-20.20s',[' '])                                //ext IPI
                        + Format('%20.20s',[FloatToStr(StrToFloat(Trim(dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value)))]);            //gtin tributavel

            end

            else
            begin

              sLinha := sLinha + Format('%-20.20s',[' '])                         //gtin contabil
                        + Format('%-20.20s',[' '])                                //ext IPI
                        + Format('%-20.20s',[' ']);                               //gtin tributavel

            end;

            sLinha := sLinha + '0     '                                                               //chave estrangeira tabela de icms para nfe
                        + '0     '                                                                    //chave estrangeira tabela de ipi para nfe
                        + '0     '                                                                    //chave estrangeira tabela de issqn para nfe
                        + '0     '                                                                    //chave estrangeira tabela de imposto de importacaopara nfe
                        + Format('%6.6s',[IntToStr(dmMProvider.cdsSelProdExpPdvOP_CST_PIS.Value)])    //chave estrangeira tabela de pis para nfe
                        + '0     '                                                                    //chave estrangeira tabela de pis st para nfe
                        + Format('%6.6s',[IntToStr(dmMProvider.cdsSelProdExpPdvOP_CST_COFINS.Value)]) //chave estrangeira tabela de cofins para nfe
                        + '0     '                                                                    //chave estrangeira tabela de cofins st para nfe
                        + 'N';                                                                        //S = produto � KIT / N = produto n�o � KIT

            if dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value < 0 then
              sLinha := sLinha + FormatFloat('00000000000', dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value * 1000)
            else
              sLinha := sLinha + FormatFloat('000000000000', dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value * 1000);

            sLinha := sLinha + '000'                                              //prazo para devolu��o do item
                        + Format('%-7.7s',[dmMProvider.cdsSelProdExpPdvOP_CEST.Value])
                        + 'N';                                                    //S = controla estoque / N = n�o controla estoque
            if Length(Trim(dmMProvider.cdsSelProdExpPdvOP_CODIGO_ANP.Value)) > 0 then
              sLinha := sLinha +FormatFloat('000000000', StrToIntDef(dmMProvider.cdsSelProdExpPdvOP_CODIGO_ANP.Value,0))
            else
              sLinha := sLinha + Format('%-9.9s',[' ']);

            WriteLn(txtArq, sLinha);

          end
          else
            sLog_Barras.Add('GTIN inv�lido: '  + sBarras_Temp + ' / ' + sDescricao);

          Next;

        until eof;
        CloseFile(txtArq);

      end;

    end;

  end;

  if sLog_Barras.Count > 0 then
  begin

    sLog_Barras.Add('===>>>> esses itens n�o ir�o para o caixa');

    sArqLogBarras := ExtractFilepath(Application.ExeName)
                      + 'Temp\Log_GTIN_' + FormatDateTime('ddmmyyyy',Date) + '_' + FormatDateTime('hhmmss',Time) + '.txt';

    sLog_Barras.SaveToFile(sArqLogBarras);

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Foi gerado um log com erros. Verifique: '
        + sArqLogBarras ), 'Aten��o!', mb_IconWarning + mb_Ok);

  end;


  if DirectoryExists(sPath) then
    CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False)
  else
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                            + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
    frmAutomacao.pgbProgressoArquivo.Position := 0;

    exit;

  end;

  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                          + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

  frmAutomacao.pgbProgressoArquivo.Position := 0;

//  ExportarBarrasDJPDV(dmMProvider.cdsParamIntegraPDVARQUIVO_COD_BARRAS.Value, sPath, iFilial, dmMProvider.cdsParamIntegraPDVTIPO_CODIGO_INTEGRACAO.Value);

  FormatSettings.DecimalSeparator := '.';

end;

procedure ExportarClienteDJPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  // arquivo de clinte
  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMProvider.cdsSelCliExportacao.Close;
  dmMProvider.cdsSelCliExportacao.ProviderName  := 'dspSelCliExportacao';

  dmMProvider.cdsSelCliExportacao.Open;
  dmMProvider.cdsSelCliExportacao.ProviderName  := '';

  LimparMSG_ERRO(frmAutomacao.lblMsg, nil);

  FormatSettings.DecimalSeparator := '.';

  if dmMProvider.cdsSelCliExportacao.RecordCount <= 0 then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 +  MSG_ARQ_EXP_CLI_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelCliExportacao.RecordCount;

    with dmMProvider.cdsSelCliExportacao do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);

        if frmAutomacao.chkLimparCadastro.Checked then
          WriteLn(txtArq, 'LIMPAR');

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelCliExportacao.RecNo;
          frmAutomacao.pnlConteudo.Caption          := Trim(dmMProvider.cdsSelCliExportacaoOP_RAZAO_SOCIAL.Value);
          Application.ProcessMessages;

          if ValidarCnpjCpf(LimparCpnjInscricao(dmMProvider.cdsSelCliExportacaoOP_CNPJ.Value)) then
          begin

            sLinha := Format('%-20.20s',[IntToStr(dmMProvider.cdsSelCliExportacaoOP_CLIENTE.Value)]);

            case dmMProvider.cdsSelCliExportacaoOP_TIPO.Value of
              0:sLinha := sLinha + 'F';
              1:sLinha := sLinha + 'J';
            end;

            sLinha := sLinha + Format('%-50.50s',[dmMProvider.cdsSelCliExportacaoOP_RAZAO_SOCIAL.Value])
                        + Format('%-30.30s',[dmMProvider.cdsSelCliExportacaoOP_FANTASIA.Value])
                        + FormatDateTime('ddmmyyyy',dmMProvider.cdsSelCliExportacaoOP_CADASTRO.Value)
                        + FormatDateTime('ddmmyyyy',dmMProvider.cdsSelCliExportacaoOP_NASCIMENTO.Value);

            if dmMProvider.cdsSelCliExportacaoOP_ULTIMA_COMPRA.Value > 0 then
              sLinha := sLinha + FormatDateTime('ddmmyyyyhhmm',dmMProvider.cdsSelCliExportacaoOP_ULTIMA_COMPRA.Value)
            else
              sLinha := sLinha + Format('%-12.12s',[' ']);                        //data ultima compra

            sLinha := sLinha + Format('%-12.12s',[' '])                          //data ultima altera��o do cadastro
                        + Format('%-14.14s',[Trim(dmMProvider.cdsSelCliExportacaoOP_DDD.Value) + Trim(dmMProvider.cdsSelCliExportacaoOP_TELEFONE1.Value)])
                        + Format('%-14.14s',[' '])                                //telefone celular/fax
                        + Format('%-50.50s',[Trim(dmMProvider.cdsSelCliExportacaoOP_EMAIL.Value)])
                        + Format('%-50.50s',[Trim(dmMProvider.cdsSelCliExportacaoOP_ENDERECO.Value)])
                        + FormatFloat('000000',dmMProvider.cdsSelCliExportacaoOP_NUMERO.Value)
                        + Format('%-30.30s',[Trim(dmMProvider.cdsSelCliExportacaoOP_COMPLEMENTO.Value)])
                        + Format('%-30.30s',[Trim(dmMProvider.cdsSelCliExportacaoOP_BAIRRO.Value)])
                        + Format('%-30.30s',[Trim(dmMProvider.cdsSelCliExportacaoOP_NOME_CIDADE.Value)])
                        + Format('%-2.2s',[Trim(dmMProvider.cdsSelCliExportacaoOP_ESTADO.Value)])
                        + Format('%-9.9s',[Trim(dmMProvider.cdsSelCliExportacaoOP_CEP.Value)])
                        + Format('%-80.80s',[' '])                                // observacao para entrega
                        + Format('%-20.20s',[Trim(dmMProvider.cdsSelCliExportacaoOP_INSCRICAO.Value)])
                        + Format('%-20.20s',[Trim(dmMProvider.cdsSelCliExportacaoOP_CNPJ.Value)])
                        + Format('%-65.65s',[' '])                                // observacao para exibir no momento da venda
                        + Format('%-80.80s',[' ']);                               // observacoes diversas sobre o cliente
            case dmMProvider.cdsSelCliExportacaoOP_STATUS.Value of
              0:sLinha := sLinha + '9';                                           // cliente VIP
              1:sLinha := sLinha + '0';                                           // cliente bloqueado
            end;

            if dmMProvider.cdsSelCliExportacaoOP_LIMITE_CREDITO.Value < 0 then
              sLinha := sLinha + FormatFloat('000000000',dmMProvider.cdsSelCliExportacaoOP_LIMITE_CREDITO.Value *100)
            else
              sLinha := sLinha + FormatFloat('0000000000',dmMProvider.cdsSelCliExportacaoOP_LIMITE_CREDITO.Value * 100);

            sLinha := sLinha + Format('%-16.16s',[' '])                           // senha para libera��o do cliente
                        + '0     '                                                // c�digo da classe
                        + Format('%-30.30s',[' '])                                // descri��o da classe
                        + '0     '                                                // c�digo do convenio
                        + Format('%-30.30s',[' '])                                // descri��o do convenio
                        + '0     ';                                               // c�digo da anima��o
            case dmMProvider.cdsSelCliExportacaoOP_ATIVO.Value of
              0:sLinha := sLinha + '-00001';
              1:sLinha := sLinha + FormatFloat('000000',dmMProvider.cdsSelCliExportacaoOP_ATIVO.Value);
            end;

            WriteLn(txtArq, sLinha);

          end;

          Next;

        until eof;

        CloseFile(txtArq);

      end;

    end;

    if DirectoryExists(sPath) then
      CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False)
    else
    begin

      Application.MessageBox (PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
      exit;

    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'O arquivo de CLIENTES foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    FormatSettings.DecimalSeparator           := ',';

  end;

end;
procedure ImportarVendaDJPdv(iFilial, pNumCx: integer; bCfgCxs: TCheckListBox; pAutomacao:boolean; pData:TDateTime);
var
  ifTemp_RZ:TIniFile;
  tsSecoes_Temp_RZ:TStringList;
  i, iEcf:integer;
  cPercDesconto, cPercAcrescimo:currency;
  sCnpj_Cpf:string;
begin

  if pAutomacao then
    frmAutomacao.pgbProgressoGeralImp.Max   := dmMDJPdv.cdsReducaoZ.RecordCount;

  dmMDJPdv.cdsReducaoZ.First;

  ForceDirectories(ExtractFilePath(ParamStr(0))+ 'Temp\');

  while not dmMDJPdv.cdsReducaoZ.Eof do
  begin

    if pAutomacao then
    begin

      frmAutomacao.pgbProgressoGeralImp.Position := dmMDJPdv.cdsReducaoZ.RecNo;
      frmAutomacao.lblMsgProgresso.Visible := True;
      frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMDJPdv.cdsReducaoZ.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoGeralImp.Max);
      Application.ProcessMessages;

    end;

    dmMDJPdv.cdsReducaoZDADOS.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Temp\Temp_RZ.ini');

    if FileExists(ExtractFilePath(ParamStr(0)) + 'Temp\Temp_RZ.ini') then
    begin

      ifTemp_RZ := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Temp\Temp_RZ.ini');

      dmMProvider.fdmImpReg60M.Append;
      dmMProvider.fdmImpReg60MDATA_EMISSAO.Value      := dmMDJPdv.cdsReducaoZDATA_MOVIMENTO.Value;
      dmMProvider.fdmImpReg60MSERIE_ECF.Value         := ifTemp_RZ.ReadString('ECF','NumSerie','0');
      dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value      := pNumCx;
      dmMProvider.fdmImpReg60MCOO_INICIAL.Value       := ifTemp_RZ.ReadInteger('ECF','NumCOOInicial',1);
      dmMProvider.fdmImpReg60MCOO_FINAL.Value         := ifTemp_RZ.ReadInteger('ECF','NumCOO',1);
      dmMProvider.fdmImpReg60MCRZ.Value               := dmMDJPdv.cdsReducaoZCRZ.Value;
      dmMProvider.fdmImpReg60MCRO.Value               := dmMDJPdv.cdsReducaoZCRO.Value;
      dmMProvider.fdmImpReg60MVENDA_BRUTA.Value       := dmMDJPdv.cdsReducaoZVENDA_BRUTA.Value;
      dmMProvider.fdmImpReg60MVALOR_GT.Value          := dmMDJPdv.cdsReducaoZGRANDE_TOTAL.Value;
      dmMProvider.fdmImpReg60MMODELO_DOCUMENTO.Value  := dmMProvider.cdsConfigECFCODIGO_MODELO_DOCUMENTO.Value;

      if ifTemp_RZ.SectionExists('Aliquotas') then
      begin

        tsSecoes_Temp_RZ := TStringList.Create;
        ifTemp_RZ.ReadSection('Aliquotas', tsSecoes_Temp_RZ);

        for I := 0 to (tsSecoes_Temp_RZ.Count -1) do
        begin

          dmMProvider.fdmImpReg60A.Append;
          dmMProvider.fdmImpReg60ADATA_EMISSAO.Value      := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
          dmMProvider.fdmImpReg60AALIQUOTA.Value          := Copy(tsSecoes_Temp_RZ[i],4,4);
          dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value    := ifTemp_RZ.ReadFloat('Aliquotas',tsSecoes_Temp_RZ[i],0);
          dmMProvider.fdmImpReg60ASERIE_ECF.Value         := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
          dmMProvider.fdmImpReg60ACRZ.Value               := dmMProvider.fdmImpReg60MCRZ.Value;
          dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value      := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
          dmMProvider.fdmImpReg60AGT.Value                := dmMProvider.fdmImpReg60MVALOR_GT.Value;
          dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value  := Copy(tsSecoes_Temp_RZ[i],1,2);
          dmMProvider.fdmImpReg60A.Post;

        end;

      end;

      //Substitui��o
      dmMProvider.fdmImpReg60A.Append;
      dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
      dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'F';
      dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := ifTemp_RZ.ReadFloat('OutrasICMS','TotalSubstituicaoTributaria',0);
      dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
      dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
      dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
      dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
      dmMProvider.fdmImpReg60A.Post;

      //Isentas
      dmMProvider.fdmImpReg60A.Append;
      dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
      dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'I';
      dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := ifTemp_RZ.ReadFloat('OutrasICMS','TotalIsencao',0);
      dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
      dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
      dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
      dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
      dmMProvider.fdmImpReg60A.Post;

      //N�o tributadas
      dmMProvider.fdmImpReg60A.Append;
      dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
      dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'N';
      dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := ifTemp_RZ.ReadFloat('OutrasICMS','TotalNaoTributado',0);
      dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
      dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
      dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
      dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
      dmMProvider.fdmImpReg60A.Post;

      //Canselamentos
      dmMProvider.fdmImpReg60A.Append;
      dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
      dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'CANC';
      dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := ifTemp_RZ.ReadFloat('Totalizadores','TotalCancelamentos',0);
      dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
      dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
      dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
      dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
      dmMProvider.fdmImpReg60A.Post;

      //Descontos
      dmMProvider.fdmImpReg60A.Append;
      dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
      dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'DESC';
      dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := ifTemp_RZ.ReadFloat('Totalizadores','TotalDescontos',0);
      dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
      dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
      dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
      dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
      dmMProvider.fdmImpReg60A.Post;

      dmMDJPdv.cdsCupom.Close;
      dmMDJPdv.cdsCupom.ProviderName := 'dspCupom';

      dmMDJPdv.fdqTerminal.Close;
      dmMDJPdv.fdqTerminal.SQL.Clear;
      dmMDJPdv.fdqTerminal.SQL.Add('select * from terminal');
      dmMDJPdv.fdqTerminal.SQL.Add('where codecf = ' + IntToStr(dmMDJPdv.cdsReducaoZCODECF.Value));
      dmMDJPdv.fdqTerminal.Open;

      dmMDJPdv.fdqCupom.SQL.Clear;
      dmMDJPdv.fdqCupom.SQL.Add('select * from documento');
      dmMDJPdv.fdqCupom.SQL.Add('where codloja = ' + IntToStr(iFilial));
      dmMDJPdv.fdqCupom.SQL.Add('and datahora_inicio between ' + QuotedStr(FormatDateTime('MM/DD/YYYY', pData) + ' 00:01')+ ' and ' + QuotedStr(FormatDateTime('MM/DD/YYYY', pData) + ' 23:59'));
      dmMDJPdv.fdqCupom.SQL.Add('and denominacao = ' + QuotedStr('RV'));
      dmMDJPdv.fdqCupom.SQL.Add('and codterminal = ' + IntToStr(dmMDJPdv.fdqTerminalCODTERMINAL.Value));
      dmMDJPdv.fdqCupom.SQL.Add('order by coo');

      dmMDJPdv.cdsCupom.Open;
      dmMDJPdv.cdsCupom.ProviderName := 'dspCupom';

      if pAutomacao then
        frmAutomacao.pgbProgressoImportacao.Max := dmMDJPdv.cdsCupom.RecordCount;

      while not dmMDJPdv.cdsCupom.Eof do
      begin

        cPercDesconto   := 0;
        cPercAcrescimo  := 0;

        if pAutomacao then
        begin

          frmAutomacao.pgbProgressoImportacao.Position := dmMDJPdv.cdsCupom.RecNo;
          frmAutomacao.lblMsgProgresso.Visible := True;
          frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMDJPdv.cdsCupom.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max)+ #13
                                                                                         + IntToStr(dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value) + '/' + dmMProvider.fdmImpReg60MSERIE_ECF.Value  ;
          Application.ProcessMessages;

        end;

        if dmMDJPdv.cdsCupomDESCONTO_ACRESCIMO.Value < 0 then
          cPercDesconto := TruncVal(((dmMDJPdv.cdsCupomDESCONTO_ACRESCIMO.Value * (-1)) / dmMDJPdv.cdsCupomSUBTOTAL.Value) * 100,2)
        else if dmMDJPdv.cdsCupomDESCONTO_ACRESCIMO.Value > 0 then
          cPercAcrescimo := TruncVal((dmMDJPdv.cdsCupomDESCONTO_ACRESCIMO.Value / dmMDJPdv.cdsCupomSUBTOTAL.Value) * 100,2);

        dmMDJPdv.cdsItemCupom.Close;
        dmMDJPdv.cdsItemCupom.ProviderName := 'dspItemCupom';

        dmMDJPdv.fdqItemCupom.SQL.Clear;
        dmMDJPdv.fdqItemCupom.SQL.Add('select * from doc_item');
        dmMDJPdv.fdqItemCupom.SQL.Add('where coo = ' + IntToStr(dmMDJPdv.cdsCupomCOO.Value));
        dmMDJPdv.fdqItemCupom.SQL.Add('and contador = ' + IntToStr(dmMDJPdv.cdsCupomCONTADOR.Value));
        dmMDJPdv.fdqItemCupom.SQL.Add('and codterminal = ' + IntToStr(dmMDJPdv.cdsCupomCODTERMINAL.Value));

        dmMDJPdv.cdsItemCupom.Open;
        dmMDJPdv.cdsItemCupom.ProviderName := '';

        while not dmMDJPdv.cdsItemCupom.Eof do
        begin

          if dmMDJPdv.cdsItemCupomCANCELADO.Value = 'N' then
          begin

            dmMProvider.fdmImpCupom.Append;
            dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMDJPdv.fdqTerminalCODECF.Value;
            dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMDJPdv.cdsItemCupomCOO.Value;
            dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpCupomCFOP.Value         := '5102';

            dmMProvider.cdsTributacao.Close;
            dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

            dmDBEXMaster.fdqTributacao.SQL.Clear;
            dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');

            if (dmMDJPdv.cdsItemCupomSITU_TRIBUTA.Value = 'T') then
            begin

              dmDBEXMaster.fdqTributacao.SQL.Add('WHERE ALIQUOTA = ' + FloatToStr(dmMDJPdv.cdsItemCupomICMS.Value));
              dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := FormatFloat('0000',dmMDJPdv.cdsItemCupomICMS.Value * 100);

            end
            else
            begin

              dmDBEXMaster.fdqTributacao.SQL.Add('WHERE CODIGOECF = ' + QuoTedStr(dmMDJPdv.cdsItemCupomSITU_TRIBUTA.Value));
              dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := dmMDJPdv.cdsItemCupomSITU_TRIBUTA.Value;

              if dmMDJPdv.cdsItemCupomSITU_TRIBUTA.Value = 'F' then
                dmMProvider.fdmImpCupomCFOP.Value           := '5405';

            end;

            dmMProvider.cdsTributacao.Open;
            dmMProvider.cdsTributacao.ProviderName          := '';

            dmMProvider.fdmImpCupomTRIBUTACAO.Value         := dmMProvider.cdsTributacaoTRIBUTACAO.AsInteger;
            dmMProvider.fdmImpCupomEMISSAO.Value            := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpCupomBARRAS.Value             := RelacionaProdutoDJ_Gen(dmMDJPdv.cdsItemCupomCODPRODUTO.Value);
            dmMProvider.fdmImpCupomQUANTIDADE.Value         := dmMDJPdv.cdsItemCupomQTD.Value;

            if dmMDJPdv.cdsItemCupomDESCONTO_ACRESCIMO.Value < 0 then
            begin

              dmMProvider.fdmImpCupomSUB_TOTAL.Value        := (dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value) - (dmMDJPdv.cdsItemCupomDESCONTO_ACRESCIMO.Value * (-1));
              dmMProvider.fdmImpCupomVALOR_DESCONTO.Value   := (dmMDJPdv.cdsItemCupomDESCONTO_ACRESCIMO.Value * (-1));
              dmMProvider.fdmImpCupomVALOR_ACRESCIMO.Value  := 0;

            end
            else if dmMDJPdv.cdsItemCupomDESCONTO_ACRESCIMO.Value > 0 then
            begin

              dmMProvider.fdmImpCupomSUB_TOTAL.Value        := (dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value) + dmMDJPdv.cdsItemCupomDESCONTO_ACRESCIMO.Value;
              dmMProvider.fdmImpCupomVALOR_DESCONTO.Value   := 0;
              dmMProvider.fdmImpCupomVALOR_ACRESCIMO.Value  := (dmMDJPdv.cdsItemCupomDESCONTO_ACRESCIMO.Value);

            end
            else
            begin

              if cPercDesconto > 0 then
              begin

                dmMProvider.fdmImpCupomSUB_TOTAL.Value        :=Arredondar((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value),2) - (((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value) * (cPercDesconto / 100)));
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value   := (((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value) * ( cPercDesconto / 100)));
                dmMProvider.fdmImpCupomVALOR_ACRESCIMO.Value  := 0;

              end
              else if cPercAcrescimo > 0 then
              begin

                dmMProvider.fdmImpCupomSUB_TOTAL.Value        := Arredondar((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value),2) + (((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value) *(cPercAcrescimo / 100)));
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value   := 0;
                dmMProvider.fdmImpCupomVALOR_ACRESCIMO.Value  := (((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value) * (cPercAcrescimo / 100)));

              end
              else
              begin

                dmMProvider.fdmImpCupomSUB_TOTAL.Value        := Arredondar((dmMDJPdv.cdsItemCupomQTD.Value * dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value),2);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value   := 0;
                dmMProvider.fdmImpCupomVALOR_ACRESCIMO.Value  := 0;

              end;

            end;

            dmMProvider.fdmImpCupomVALOR_UNITARIO.Value     := dmMDJPdv.cdsItemCupomPRECO_UNITARIO.Value;

            dmMProvider.fdmImpCupomHORA_ABERTURA.Value := StrToTime(FormatDateTime('HH:MM:SS',dmMDJPdv.cdsCupomDATAHORA_INICIO.AsDateTime));
            dmMProvider.fdmImpCupomNUMERO_ITEM.Value        := dmMDJPdv.cdsItemCupomSEQUENCIA.Value;

            if dmMDJPdv.cdsCupomCANCELADO.Value = 'N' then
              dmMProvider.fdmImpCupomSITUACAO.Value := 0
            else
              dmMProvider.fdmImpCupomSITUACAO.Value := 1;

          end;

          dmMDJPdv.cdsItemCupom.Next;

        end;

        // se o sistema estiver configurado para importar CRE
        case dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger  of
          1:begin

              //verifica se foi informado cliente no cupom
              if dmMDJPdv.cdsCupomCODCLIENTE.Value > 0 then
              begin

                //consulta a forma de pagamento do cupom
                dmMDJPdv.cdsFinalizaroaCupom.Close;
                dmMDJPdv.cdsFinalizaroaCupom.ProviderName := 'dspFinalizaroaCupom';

                dmMDJPdv.fdqFinalizaroaCupom.SQL.Clear;
                dmMDJPdv.fdqFinalizaroaCupom.SQL.Add('select * from doc_pagto');
                dmMDJPdv.fdqFinalizaroaCupom.SQL.Add('where coo = ' + IntToStr(dmMDJPdv.cdsCupomCOO.Value));

                dmMDJPdv.cdsFinalizaroaCupom.Open;
                dmMDJPdv.cdsFinalizaroaCupom.ProviderName := '';

                while not dmMDJPdv.cdsFinalizaroaCupom.Eof do
                begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('where codigoecf = ' + QuotedStr(trim(dmMDJPdv.cdsFinalizaroaCupomCODFORMAPAGTO.Value)));

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

                  while not dmMProvider.cdsFormasPagamento.Eof do
                  begin

                    //verifica a forma de pagamento no retagurada para ver
                    //se est� configurada como a prazo
                    if dmMProvider.cdsFormasPagamentoTIPO.Value = 10 then
                    begin

                      //captura o cnpj/cpf do cliente
                      sCnpj_Cpf := LimparCpnjInscricao(dmMDJPdv.cdsCupomDOCUMENTO_CLI.Value);

                      if Length(Trim(sCnpj_Cpf)) > 0 then
                      begin

                        dmMProvider.cdsPesqClientes.Close;
                        dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                        dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                        dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                        dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ = ' + QuotedStr(sCnpj_Cpf));

                        dmMProvider.cdsPesqClientes.Open;
                        dmMProvider.cdsPesqClientes.ProviderName := '';

                        if not dmMProvider.cdsPesqClientes.IsEmpty then
                        begin

                          dmMProvider.fdmImpFinanceiro.Append;
                          dmMProvider.fdmImpFinanceiroIP_CRE.AsInteger                    := -1;
                          dmMProvider.fdmImpFinanceiroIP_FILIAL.AsInteger                 := dmDBEXMaster.iIdFilial;
                          dmMProvider.fdmImpFinanceiroIP_DOCUMENTO.Value                  := IntToStr(dmMDJPdv.cdsCupomCOO.Value);
                          dmMProvider.fdmImpFinanceiroIP_SITUACAO.AsInteger               := 0;
                          dmMProvider.fdmImpFinanceiroIP_DATA_ENTRADA.AsDateTime          := Date;
                          dmMProvider.fdmImpFinanceiroIP_SACADO.AsInteger                 := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                          dmMProvider.fdmImpFinanceiroIP_TIPO.AsInteger                   := 0;
                          dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime          := dmMDJPdv.cdsCupomDATAHORA_INICIO.AsDateTime;
                          dmMProvider.fdmImpFinanceiroIP_DATA_VENCIMENTO.AsDateTime       := dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime + 30;
                          dmMProvider.fdmImpFinanceiroIP_MOEDA.AsInteger                  := 0;
                          dmMProvider.fdmImpFinanceiroIP_VALOR.Value                      := dmMDJPdv.cdsFinalizaroaCupomVALOR_PAGO.Value;

                          case dmMProvider.cdsConfiguracoesTIPOMULTA.AsInteger of
                            0:dmMProvider.fdmImpFinanceiroIP_MORA_DIARIA.AsCurrency       := dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency;
                            1:dmMProvider.fdmImpFinanceiroIP_MORA_DIARIA.AsCurrency       := dmMProvider.fdmImpFinanceiroIP_VALOR.AsCurrency *(dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency / 100);
                          end;

                          dmMProvider.fdmImpFinanceiroIP_DESCONTO.AsCurrency              := 0;
                          dmMProvider.fdmImpFinanceiroIP_DATA_DESCONTO.AsVariant          := null;
                          dmMProvider.fdmImpFinanceiroIP_HISTORICO.AsString               := 'LANCAMENTO POR IMPORTACAO DE VENDA, CF: ' + dmMProvider.fdmImpFinanceiroIP_DOCUMENTO.AsString;
                          dmMProvider.fdmImpFinanceiroIP_NOSSO_NUMERO.AsString            := '0';
                          dmMProvider.fdmImpFinanceiroIP_VENCIMENTO_PRORROGADO. AsVariant := null;
                          dmMProvider.fdmImpFinanceiroIP_POSICAO.AsInteger                := 0;
                          dmMProvider.fdmImpFinanceiroIP_DATA_ENTRADA_NO_BANCO.AsVariant  := null;
                          dmMProvider.fdmImpFinanceiroIP_DATA_BAIXA.AsVariant             := null;
                          dmMProvider.fdmImpFinanceiroIP_DESCONTO_CONCEDIDO.Value         := 0;
                          dmMProvider.fdmImpFinanceiroIP_ABATIMENTOS.Value                := 0;
                          dmMProvider.fdmImpFinanceiroIP_OUTRAS_DESPESAS.Value            := 0;
                          dmMProvider.fdmImpFinanceiroIP_VALOR_PAGO.Value                 := 0;
                          dmMProvider.fdmImpFinanceiroIP_TARIFAS_BANCARIAS.Value          := 0;
                          dmMProvider.fdmImpFinanceiroIP_JUROS_RECEBIDOS.Value            := 0;
                          dmMProvider.fdmImpFinanceiroIP_OUTROS_CREDITOS.Value            := 0;
                          dmMProvider.fdmImpFinanceiroIP_PLANO_CONTAS.AsVariant           := dmMProvider.cdsFormasPagamentoPLANODECONTAS.AsInteger;
                          dmMProvider.fdmImpFinanceiroIP_SUB_CONTA.AsVariant              := dmMProvider.cdsFormasPagamentoITEMPLANODECONTAS.AsInteger;
                          dmMProvider.fdmImpFinanceiroIP_TIPO_OCORRENCIA.Value            := 0;
                          dmMProvider.fdmImpFinanceiroIP_TIPO_AVISO.Value                 := 0;
                          dmMProvider.fdmImpFinanceiroIP_OCORRENCIA.Value                 := ' ';
                          dmMProvider.fdmImpFinanceiroIP_AVISO_COBRANCA.Value             := ' ';
                          dmMProvider.fdmImpFinanceiroIP_LANCAMENTO.AsVariant             := dmMProvider.cdsFormasPagamentoLANCAMENTO.AsInteger;
                          dmMProvider.fdmImpFinanceiroIP_TIPO_COBRANCA.Value              := 0;
                          dmMProvider.fdmImpFinanceiroIP_CONTA_CORRENTE.AsVariant         := null;
                          dmMProvider.fdmImpFinanceiroIP_CARTEIRA.Value                   := ' ';
                          dmMProvider.fdmImpFinanceiroIP_TIPO_PARCELA.Value               := 0;
                          dmMProvider.fdmImpFinanceiroIP_PEDIDO_DE_VENDA.AsVariant        := null;
                          dmMProvider.fdmImpFinanceiroIP_PEDIDO_EXTERNO.AsVariant         := null;
                          dmMProvider.fdmImpFinanceiroIP_DATA.Value                       := Date;
                          dmMProvider.fdmImpFinanceiroIP_PERCENTUAL.Value                 := 0;
                          dmMProvider.fdmImpFinanceiroIP_REDUCAO.Value                    := 0;
                          dmMProvider.fdmImpFinanceiroIP_VALOR_COMISSAO.Value             := 0;
                          dmMProvider.fdmImpFinanceiroIP_NF_SAIDA.AsVariant               := null;
                          dmMProvider.fdmImpFinanceiroIP_OBSERVACOES.Value                := ' ';
                          dmMProvider.fdmImpFinanceiroIP_VALOR_CHQ_DEVOLVIDO.Value        := 0;
                          dmMProvider.fdmImpFinanceiroIP_SEQUENCIAL.Value                 := 0;
                          dmMProvider.fdmImpFinanceiroIP_OUTROS_DEBITOS.Value             := 0;
                          dmMProvider.fdmImpFinanceiroIP_MODELO_DOCUMENTO.Value           := '2D';
                          dmMProvider.fdmImpFinanceiro.Post;

                        end;

                      end;

                    end;

                    dmMProvider.cdsFormasPagamento.Next;

                  end;

                  dmMDJPdv.cdsFinalizaroaCupom.Next;

                end;

              end;

            end;
        end;

        dmMDJPdv.cdsCupom.Next;

      end;

      dmMDJPdv.cdsReducaoZ.Next;

    end;

  end;

end;

function RelacionaProdutoDJ_Gen(pProduto:integer):string;
begin

  dmMDJPdv.fdqPesqProdutoDJPdv.Close;
  dmMDJPdv.fdqPesqProdutoDJPdv.SQL.Clear;
  dmMDJPdv.fdqPesqProdutoDJPdv.SQL.Add('select * from produto');
  dmMDJPdv.fdqPesqProdutoDJPdv.SQL.Add('where codproduto = ' + IntToStr(pProduto));
  dmMDJPdv.fdqPesqProdutoDJPdv.Open;

  dmMProvider.cdsBarras.Close;
  dmMProvider.cdsBarras.ProviderName := 'dspBarras';

  dmDBEXMaster.fdqBarras.SQL.Clear;
  dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
  dmDBEXMaster.fdqBarras.SQL.Add('where produto = ' + IntToStr(StrToInt(dmMDJPdv.fdqPesqProdutoDJPdvCODEXTERNO.Value)));

  dmMProvider.cdsBarras.Open;
  dmMProvider.cdsBarras.ProviderName := '';

  Result := dmMProvider.cdsBarrasBARRAS.Value;

end;

procedure ExportarBarrasDJPDV(sArquivo, sPath: string; iFilial, pTipoCodigoIntegracao: integer);
var
  txtArq: TextFile;
  sLinha, sBarras, sBarras_Temp, sArqLogBarras, sProduto: string;
  sLog_Barras:TStringList;
begin

  sLog_Barras             := TStringList.Create;

  // arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmMProvider.cdsSelProdExpPdv.ProviderName := 'dspSelProdExpPdv';

  dmDBEXMaster.fdqSelProdExpPdv.Params[0].Value := iFilial;
  dmDBEXMaster.fdqSelProdExpPdv.Params[1].Value := 0;
  dmDBEXMaster.fdqSelProdExpPdv.Params[2].Value := 0;

  dmMProvider.cdsSelProdExpPdv.Open;
  dmMProvider.cdsSelProdExpPdv.ProviderName     := '';

  LimparMSG_ERRO(frmAutomacao.lblMsg, nil);

  if dmMProvider.cdsSelProdExpPdv.IsEmpty then
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + MSG_ARQ_EXP_PRO_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok);
    exit;

  end

  else
  begin

    FormatSettings.DecimalSeparator       := ',';

    frmAutomacao.pgbProgressoArquivo.Max  := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);

        ReWrite(txtArq);

        if frmAutomacao.chkLimparCadastro.Checked then
          WriteLn(txtArq, 'LIMPAR');

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;
          Application.ProcessMessages;

          sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;

          if ValidaEAN(Trim(sBarras_Temp)) then
          begin

            case dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value of
              0:begin

                  if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 1 then
                  begin

                    if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
                      sBarras := Format('%-20.20s',[FormatFloat('0000',StrToFloat(Copy(sBarras_Temp, 1, 12)))])
                    else
                      sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(Copy(sBarras_Temp, 1, 12)))]);

                  end
                  else
                    sBarras := Format('%-20.20s',[FormatFloat('00000000000000', StrToFloat(sBarras_Temp))]);

                end;
              else
              begin

                if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 1 then
                begin

                  if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
                    sBarras := Format('%-20.20s',[FormatFloat('0000',StrToFloat(Copy(sBarras_Temp, 1, 12)))])
                  else
                    sBarras := Format('%-20.20s',[FloatToStr(StrToFloat(sBarras_Temp))]);

                end
                else
                  sBarras := Format('%-20.20s',[FormatFloat('00000000000000', StrToFloat(sBarras_Temp))]);

              end;

            end;

            sLinha := sBarras + Format('%20.20s',[IntToStr(dmMProvider.cdsSelProdExpPdvOP_PRODUTO.Value)]) + ' ' + '00000' + FormatFloat('0000000', dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value * 100);

            WriteLn(txtArq, sLinha);

          end
          else
            sLog_Barras.Add('GTIN inv�lido: '  + sBarras_Temp);

          Next;


        until eof;
        CloseFile(txtArq);

        end;

      end;

    end;

    if sLog_Barras.Count > 0 then
    begin

      sLog_Barras.Add('===>>>> esses itens n�o ir�o para o caixa');

      sArqLogBarras := ExtractFilepath(Application.ExeName)
                        + 'Temp\Log_GTIN_' + FormatDateTime('ddmmyyyy',Date) + '_' + FormatDateTime('hhmmss',Time) + '.txt';

      sLog_Barras.SaveToFile(sArqLogBarras);

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Foi gerado um log com erros. Verifique: '
          + sArqLogBarras ), 'Aten��o!', mb_IconWarning + mb_Ok);

    end;


{    if DirectoryExists(sPath) then
    begin

      CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False);

      if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
        CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC'), PChar(sPath + sArquivo + '_TC'), False)

    end
    else
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                              + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
      frmAutomacao.pgbProgressoArquivo.Position := 0;

      exit;

    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                            + 'O arquivo de BARRAS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);
}
    frmAutomacao.pgbProgressoArquivo.Position := 0;

    FormatSettings.DecimalSeparator := '.';

end;
procedure ExportarPISDJPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMDJPdv.fdmTemp_PIS.Close;
  dmMDJPdv.fdmTemp_PIS.Open;

  dmMDJPdv.cdsCST_PIS.Close;
  dmMDJPdv.cdsCST_PIS.ProviderName := 'dspCST_PIS';

  dmMDJPdv.fdqCST_PIS.SQL.Clear;
  dmMDJPdv.fdqCST_PIS.SQL.Add('select distinct pis.*, pro.aliquota_pis from cst_pis_pasep pis');
  dmMDJPdv.fdqCST_PIS.SQL.Add('join produto pro');
  dmMDJPdv.fdqCST_PIS.SQL.Add('on(pro.cst_pis = pis.cst_pis_pasep)');

  dmMDJPdv.cdsCST_PIS.Open;
  dmMDJPdv.cdsCST_PIS.ProviderName     := '';

  LimparMSG_ERRO(frmAutomacao.lblMsg, nil);

  frmAutomacao.pgbProgressoArquivo.Max  := dmMDJPdv.cdsCST_PIS.RecordCount;

  with dmMDJPdv.cdsCST_PIS do
  begin

    First;

    if not eof then
    begin

      AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);

      ReWrite(txtArq);

      if frmAutomacao.chkLimparCadastro.Checked then
        WriteLn(txtArq, 'LIMPAR');

      repeat

        if not dmMDJPdv.fdmTemp_PIS.Locate('CST',dmMDJPdv.cdsCST_PISCST_PIS_PASEP.Value,[]) then
        begin

          dmMDJPdv.fdmTemp_PIS.Append;
          dmMDJPdv.fdmTemp_PISCST.Value := dmMDJPdv.cdsCST_PISCST_PIS_PASEP.Value;
          dmMDJPdv.fdmTemp_PIS.Post;

          frmAutomacao.pgbProgressoArquivo.Position := dmMDJPdv.cdsCST_PIS.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMDJPdv.cdsCST_PISDESCRICAO.Value;
          Application.ProcessMessages;


          sLinha := Format('%6.6s',[IntToStr(dmMDJPdv.cdsCST_PISCST_PIS_PASEP.Value)])
                    + Format('%-60.60s',[dmMDJPdv.cdsCST_PISDESCRICAO.Value])
                    + Format('%2.2s',[IntToStr(dmMDJPdv.cdsCST_PISCST_PIS_PASEP.Value)])
                    + 'P'                 //tipo de cofins (p=percentual / v= valor)
                    + FormatFloat('0000',dmMDJPdv.cdsCST_PISALIQUOTA_PIS.Value )
                    + '10000'             // %
                    + '0000000000';       // Valor do COFINS. (Se calculado por Valor, sen�o informar 0) Com 2 casas decimais.

          WriteLn(txtArq, sLinha);

        end;

        Next;

      until eof;
      CloseFile(txtArq);

    end;

  end;

  if DirectoryExists(sPath) then
    CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False)
  else
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                            + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
    frmAutomacao.pgbProgressoArquivo.Position := 0;

    exit;

  end;

  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                          + 'O arquivo de INF. PIS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

  frmAutomacao.pgbProgressoArquivo.Position := 0;

  FormatSettings.DecimalSeparator := '.';

end;
procedure ExportarCOFINSDJPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMDJPdv.fdmTemp_COFINS.Close;
  dmMDJPdv.fdmTemp_COFINS.Open;

  dmMDJPdv.cdsCST_COFINS.Close;
  dmMDJPdv.cdsCST_COFINS.ProviderName := 'dspCST_COFINS';

  dmMDJPdv.fdqCST_COFINS.SQL.Clear;
  dmMDJPdv.fdqCST_COFINS.SQL.Add('select distinct cofins.*, pro.aliquota_cofins from cst_cofins cofins');
  dmMDJPdv.fdqCST_COFINS.SQL.Add('join produto pro');
  dmMDJPdv.fdqCST_COFINS.SQL.Add('on(pro.cst_cofins = cofins.cst_cofins)');

  dmMDJPdv.cdsCST_COFINS.Open;
  dmMDJPdv.cdsCST_COFINS.ProviderName     := '';

  LimparMSG_ERRO(frmAutomacao.lblMsg, nil);

  frmAutomacao.pgbProgressoArquivo.Max  := dmMDJPdv.cdsCST_COFINS.RecordCount;

  with dmMDJPdv.cdsCST_COFINS do
  begin

    First;

    if not eof then
    begin

      AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);

      ReWrite(txtArq);

      if frmAutomacao.chkLimparCadastro.Checked then
        WriteLn(txtArq, 'LIMPAR');

      repeat

        if not dmMDJPdv.fdmTemp_COFINS.Locate('CST',dmMDJPdv.cdsCST_COFINSCST_COFINS.Value,[]) then
        begin

          dmMDJPdv.fdmTemp_COFINS.Append;
          dmMDJPdv.fdmTemp_COFINSCST.Value := dmMDJPdv.cdsCST_COFINSCST_COFINS.Value;
          dmMDJPdv.fdmTemp_COFINS.Post;

          frmAutomacao.pgbProgressoArquivo.Position := dmMDJPdv.cdsCST_COFINS.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMDJPdv.cdsCST_COFINSDESCRICAO.Value;
          Application.ProcessMessages;


          sLinha := Format('%6.6s',[IntToStr(dmMDJPdv.cdsCST_COFINSCST_COFINS.Value)])
                    + Format('%-60.60s',[dmMDJPdv.cdsCST_COFINSDESCRICAO.Value])
                    + Format('%2.2s',[IntToStr(dmMDJPdv.cdsCST_COFINSCST_COFINS.Value)])
                    + 'P'                 //tipo de cofins (p=percentual / v= valor)
                    + FormatFloat('0000',dmMDJPdv.cdsCST_COFINSALIQUOTA_COFINS.Value )
                    + '10000'             // %
                    + '0000000000';       // Valor do COFINS. (Se calculado por Valor, sen�o informar 0) Com 2 casas decimais.

          WriteLn(txtArq, sLinha);

        end;

        Next;

      until eof;
      CloseFile(txtArq);

    end;

  end;

  if DirectoryExists(sPath) then
    CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False)
  else
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                            + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
    frmAutomacao.pgbProgressoArquivo.Position := 0;

    exit;

  end;

  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                          + 'O arquivo de INF. COFINS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

  frmAutomacao.pgbProgressoArquivo.Position := 0;

  FormatSettings.DecimalSeparator := '.';

end;
procedure ExportarCEST(pArquivo, sPath:string);
var
  tfArquivo: TextFile;
  nX, nY: SmallInt;
  tsCabecalho, tsArquivo: TStringLIst;
  sLinhaDados,sArquivo : String;
begin

  try

    dmMProvider.cdsTabelaCEST.Close;
    dmMProvider.cdsTabelaCEST.ProviderName := 'dspTabelaCEST';

    dmDBEXMaster.fdqTabelaCEST.SQL.Clear;
    dmDBEXMaster.fdqTabelaCEST.SQL.Add('select * from tab_cest where char_length(ncm) = 8');

    dmMProvider.cdsTabelaCEST.Open;
    dmMProvider.cdsTabelaCEST.ProviderName := '';

    frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
    frmAutomacao.edtArquivoExportadoPDV.Text      := pArquivo;

    LimparMSG_ERRO(frmAutomacao.lblMsg, nil);

    frmAutomacao.pgbProgressoArquivo.Max  := dmMProvider.cdsTabelaCEST.RecordCount;

    tsCabecalho := TStringList.Create;

    AssignFile(tfArquivo, ExtractFilepath(Application.ExeName) + 'Temp\' + pArquivo);
    ReWrite(tfArquivo);

    tsCabecalho := dmMProvider.cdsTabelaCEST.FieldList;
    nY          := tsCabecalho.Count-1;

    sLinhaDados := '';

    for nX := 0 to nY do
    begin

      if nX <> nY then
        sLinhaDados := sLinhaDados + dmMProvider.cdsTabelaCEST.FieldByName(tsCabecalho.Strings[nX]).DisplayLabel + ';'
      else
        sLinhaDados := sLinhaDados + dmMProvider.cdsTabelaCEST.FieldByName(tsCabecalho.Strings[nX]).DisplayLabel;

    end;

    WriteLn(tfArquivo, sLinhaDados);

    nY := dmMProvider.cdsTabelaCEST.FieldCount-1;

    while not dmMProvider.cdsTabelaCEST.Eof do
    begin

      sLinhaDados := '';

      frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsTabelaCEST.RecNo;
      frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsTabelaCESTDESCRICAO.Value;
      Application.ProcessMessages;

      for nX := 0 to nY do
      begin

        if nX <> nY then
          sLinhaDados := sLinhaDados + dmMProvider.cdsTabelaCEST.FieldByName(tsCabecalho.Strings[nX]).AsString +';'
        else
          sLinhaDados := sLinhaDados + dmMProvider.cdsTabelaCEST.FieldByName(tsCabecalho.Strings[nX]).AsString;

      end;

      WriteLn(tfArquivo, sLinhaDados);

      dmMProvider.cdsTabelaCEST.Next;

    end;

    CloseFile(tfArquivo);
    dmMProvider.cdsTabelaCEST.Close;

    if DirectoryExists(sPath) then
      CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + pArquivo), PChar(sPath + pArquivo), False)
    else
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                              + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
      frmAutomacao.pgbProgressoArquivo.Position := 0;

      exit;

    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                            + 'O tabela CEST foi gerada com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

    FormatSettings.DecimalSeparator := '.';

  except

    CloseFile(tfArquivo);
    dmMProvider.cdsTabelaCEST.Close;

  end;

end;

end.
