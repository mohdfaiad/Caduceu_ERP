unit modAutomacaoFILIZOLA;

interface

uses SysUtils, Windows, Forms;

procedure ExportarProdutoTSC_Smart(sArquivo, sPath: string; iFilial: integer);
procedure ExportarSetorTSC_Smart(sArquivo, sPath: string; iFilial: integer);
procedure ExportarReceitasTSC_Smart(sArquivo, sPath: string; iFilial: integer);
procedure ExportarInfNutricionalTSC_Smart(sArquivo, sPath: string; iFilial:integer);

implementation

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, modAutomacao,
  uConstantes_Padrao, uFuncoes, modAutomacaoTOLEDO;

procedure ExportarProdutoTSC_Smart(Sarquivo, Spath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  dmMProvider.cdsSelProdExpBalanca.Close;
  dmMProvider.cdsSelProdExpBalanca.ProviderName := 'dspSelProdExpBalanca';

  dmDBEXMaster.fdqSelProdExpBalanca.ParamByName('IP_FILIAL').AsInteger := dmDBEXMaster.iIdFilial;

  dmMProvider.cdsselProdExpBalanca.OPen;
  dmMProvider.cdsSelProdExpBalanca.ProviderName := '';

  //arquivo de produto
  frmAutomacao.edtPastaExpBalanca.Text      := sPath;
  frmAutomacao.edtArqExpBalanca.Text        := sArquivo;

  if dmMProvider.cdsselProdExpBalanca.IsEmpty then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_PRO_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)

  else
  begin
    frmAutomacao.pgbProgressoArqBalanca.Max  := dmMProvider.cdsselProdExpBalanca.RecordCount;

    with dmMProvider.cdsselProdExpBalanca do
    begin

      First;

      if not EOF then
      begin
        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArqBalanca.Position  := dmMProvider.cdsselProdExpBalanca.RecNo;
          Application.ProcessMessages;

          if ValidarBarras(dmMProvider.cdsselProdExpBalanca.FieldByName('OP_BARRAS').AsString) then
          begin

            sLinha := Copy(dmMProvider.cdsselProdExpBalanca.FieldByName('OP_BARRAS').AsString, 8, 6);

            case dmMProvider.cdsselProdExpBalanca.FieldByName('OP_PESADO').AsInteger of
              0: sLinha := sLinha + 'U';
              1: sLinha := sLinha + 'P';
            end;

            sLinha := sLinha + Format('%-22.22s', [RetirarAcentuacaoString(dmMProvider.cdsselProdExpBalanca.FieldByName('OP_DESCRICAO_BALANCA').AsString)]);

            case dmMProvider.cdsselProdExpBalanca.FieldByName('OP_PROMOCAO').AsInteger of
              0: sLinha := sLinha + FormatFloat('0000000', dmMProvider.cdsselProdExpBalanca.FieldByName('OP_PRECO_VENDA').AsCurrency * 100);
              1: sLinha := sLinha + FormatFloat('0000000', dmMProvider.cdsselProdExpBalanca.FieldByName('OP_PRECO_PROMOCAO').AsCurrency * 100);
            end;

            sLinha := sLinha + FormatFloat('000', dmMProvider.cdsselProdExpBalanca.FieldByName('OP_VALIDADE').AsInteger);
            WriteLn(txtArq, sLinha);

          end;

          Next;

        until EOF;

        CloseFile(txtArq);

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

        frmAutomacao.pgbProgressoArqBalanca.Position := 0;

      end;
    end;
  end;
end;
procedure ExportarSetorTSC_Smart(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  dmMProvider.cdsSelSetorExpBalanca.Close;
  dmMProvider.cdsSelSetorExpBalanca.ProviderName := 'dspSelSetorExpBalanca';

  dmDBEXMaster.fdqSelSetorExpBalanca.ParamByName('IP_FILIAL').AsInteger := dmDBEXMaster.iIdFilial;

  dmMProvider.cdsSelSetorExpBalanca.Open;
  dmMProvider.cdsSelSetorExpBalanca.ProviderName := '';

  frmAutomacao.edtPastaExpBalanca.Text      := sPath;
  frmAutomacao.edtArqExpBalanca.Text        := sArquivo;

  if dmMProvider.cdsSelSetorExpBalanca.IsEmpty then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_SET_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)

  else
  begin
    frmAutomacao.pgbProgressoArqBalanca.Max  := dmMProvider.cdsSelSetorExpBalanca.RecordCount;

    with dmMProvider.cdsSelSetorExpBalanca do
    begin
      First;
      if not EOF then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);

        repeat

          frmAutomacao.pgbProgressoArqBalanca.Position  := dmMProvider.cdsSelSetorExpBalanca.RecNo;
          Application.ProcessMessages;

          if ValidarBarras(dmMProvider.cdsSelSetorExpBalanca.FieldByName('OP_BARRAS').AsString) then
          begin

            sLinha := Format('%-12.12s',[RetirarAcentuacaoString(dmMProvider.cdsSelSetorExpBalanca.FieldByName('OP_NOME').AsString)]) +
            Copy(dmMProvider.cdsSelSetorExpBalanca.FieldByName('OP_BARRAS').AsString, 8, 6) +
              FormatFloat('0000', dmMProvider.cdsSelSetorExpBalanca.RecNo) +
              FormatFloat('000', dmMProvider.cdsSelSetorExpBalanca.FieldByName('OP_TECLA_ASSOCIADA').AsInteger);
            WriteLn(txtArq, sLinha);

          end;

          Next;

        until EOF;

        CloseFile(txtArq);

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'O arquivo de SETORES foi gerado com sucesso!'), 'Aten��o!',
          mb_IconInformation + mb_Ok);

        frmAutomacao.pgbProgressoArqBalanca.Position := 0;

      end;
    end;
  end;
end;
procedure ExportarReceitasTSC_Smart(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  dmMProvider.cdsSelReceitaExpBalanca.Close;
  dmMProvider.cdsSelReceitaExpBalanca.ProviderName := 'dspSelReceitaExpBalanca';

  dmDBEXMaster.fdqSelReceitaExpBalanca.ParamByName('IP_FILIAL').AsInteger := dmDBEXMaster.iIdFilial;

  dmMProvider.cdsSelReceitaExpBalanca.Open;
  dmMProvider.cdsSelReceitaExpBalanca.ProviderName := '';

  frmAutomacao.edtPastaExpBalanca.Text      := sPath;
  frmAutomacao.edtArqExpBalanca.Text        := sArquivo;

  if dmMProvider.cdsSelReceitaExpBalanca.IsEmpty then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_REC_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)

  else
  begin
    frmAutomacao.pgbProgressoArqBalanca.Max  := dmMProvider.cdsSelReceitaExpBalanca.RecordCount;

    with dmMProvider.cdsSelReceitaExpBalanca do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);

        repeat

          frmAutomacao.pgbProgressoArqBalanca.Position  := dmMProvider.cdsSelReceitaExpBalanca.RecNo;
          Application.ProcessMessages;

          if ValidarBarras(dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_BARRAS').AsString) then
          begin

            sLinha := Format('%-12.12s',[dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_NOME_SETOR').AsString])
              + Copy(dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_BARRAS').AsString, 8, 6) +
              FormatFloat('000000', dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_PRODUCAO').AsInteger)
              + Format('%-56.56s', [dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_INGREDIENTE_1').AsString])
              + #13 + Format('%-56.56s', [dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_INGREDIENTE_2').AsString])
              + #13 + Format('%-56.56s', [dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_INGREDIENTE_3').AsString])
              + #13 + Format('%-56.56s', [dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_INGREDIENTE_4').AsString])
              + #13 + Format('%-56.56s', [dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_INGREDIENTE_5').AsString])
              + #13 + Format('%-56.56s', [dmMProvider.cdsSelReceitaExpBalanca.FieldByName('OP_INGREDIENTE_6').AsString]) + '@';
            WriteLn(txtArq, sLinha);

          end;

          Next;

        until EOF;

        CloseFile(txtArq);

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'O arquivo de RECEITAS foi gerado com sucesso!'), 'Aten��o!',
          mb_IconInformation + mb_Ok);

        frmAutomacao.pgbProgressoArqBalanca.Position := 0;

      end;
    end;
  end;
end;
procedure ExportarInfNutricionalTSC_Smart(sArquivo, sPath: string; iFilial:integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  dmMProvider.cdsSelInfNutriExpBal.Close;
  dmMProvider.cdsSelInfNutriExpBal.Open;

  frmAutomacao.edtPastaExpBalanca.Text      := sPath;
  frmAutomacao.edtArqExpBalanca.Text        := sArquivo;

  if dmMProvider.cdsSelInfNutriExpBal.IsEmpty  then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_INF_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  else
  begin
    frmAutomacao.pgbProgressoArqBalanca.Max  := dmMProvider.cdsSelInfNutriExpBal.RecordCount;

    with dmMProvider.cdsSelInfNutriExpBal do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);

        repeat

          frmAutomacao.pgbProgressoArqBalanca.Position  := dmMProvider.cdsSelInfNutriExpBal.RecNo;
          Application.ProcessMessages;

          sLinha := Copy(dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_BARRAS').AsString, 8, 6) +
          Format('%-35.35s', [RetirarAcentuacaoString(dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_PORCAO').AsString) + ' ' +
          FloatToStr(dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_QUANTIDADE').AsCurrency) +
            dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_UND_PORCAO').AsString + ' ' +
            FloatToStr(dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_PARTE_INT_MED_CAS').AsCurrency) +
            dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_PARTE_DEC_MED_CAS').AsString +
            Copy(dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_MEDIDA_CAS_UTIL').AsString, 4,
            Length(dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_MEDIDA_CAS_UTIL').AsString) - 3)]) +
          FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VALOR_ENERGETICO_KC').AsCurrency) +
          FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_ENERGETICO').AsCurrency);
          //verifica carboidratos menor que 1 grama
          case dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_MENOR_1G_CARBO').AsInteger of
            0: sLinha := sLinha + FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_CARBOIDRATOS').AsCurrency * 10);
            1: sLinha := sLinha + '65534';
          end;

          sLinha := sLinha + FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_CARBOIDRATOS').AsCurrency * 10);
          //verifica proteinas menor que 1 grama
          case dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_MENOR_1G_PROTEINA').AsInteger of
            0: sLinha := sLinha + FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_PROTEINAS').AsCurrency * 10);
            1: sLinha := sLinha + '65534';
          end;

          sLinha := sLinha + FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_PROTEINAS').AsCurrency) +
            FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_GORDURAS_TOT').AsCurrency * 10) +
            FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_GORD_TOT').AsCurrency) +
            FormatFloat('00000',dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_GORD_SATURADAS').AsCurrency * 10) +
            FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_GORD_SATURADAS').AsCurrency) +
            FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_GORDURAS_TRANS').AsCurrency * 10)
            + '0000';
          //verifica fibra alimentar menor que 1 gramas
          case dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_MENOR_1G_FIBRA').AsInteger of
            0: sLinha := sLinha + FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_FIBRA_ALIMENTAR').AsCurrency * 10);
            1: sLinha := sLinha + '65534';
          end;

          sLinha := sLinha + FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_FIBRA_ALIMENTAR').AsCurrency)
            + '******************';

          sLinha := sLinha + FormatFloat('00000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_SODIO').AsCurrency * 10)
            + FormatFloat('0000', dmMProvider.cdsSelInfNutriExpBal.FieldByName('OP_VD_SODIO').AsCurrency);
          WriteLn(txtArq, sLinha);
          Next;
        until EOF;

        CloseFile(txtArq);

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'O arquivo de INFORMA��ES NUTRICIONAIS foi gerado com sucesso!'), 'Aten��o!',
          mb_IconInformation + mb_Ok);

        frmAutomacao.pgbProgressoArqBalanca.Position := 0;
      end;

    end;
  end;
end;
end.
