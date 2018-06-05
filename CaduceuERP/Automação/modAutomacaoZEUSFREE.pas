unit modAutomacaoZEUSFREE;

interface

uses SysUtils, Windows, Forms, IniFiles, Classes, StrUtils, CheckLst, Db,
  variants, Dialogs;

procedure ExportarProdutosZEUS_FE(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);
procedure ExportarClienteZEUS_FE(sArquivo, sPath: string; iFilial: integer);
procedure ExportarGrupoProdutoZEUS_FE(sArquivo, sPath: string; iFilial: integer);
procedure ExportarPrecoQuantidade(sArquivo, sPath: string; iFilial: integer);
procedure ExportarVendedoresZEUS_FE(sArquivo, sPath: string; iFilial: integer);
procedure ImportarVendaZEUS_FE(sArquivo, sPath: string; iFilial, pNumCx: integer; bCfgCxs: TCheckListBox; pTabelaZ:smallint; pAutomacao:boolean; pData:TDateTime);

implementation

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, modAutomacao,
  uConstantes_Padrao, uFuncoes, datamZeus, uFuncoes_BD;

procedure ExportarProdutosZEUS_FE(sArquivo, sPath: string;
  iFilial, pGeralAlterados: integer);
var
  txtArq, txtArqTermConsulta: TextFile;
  sLinha, sLinhaTC, sBarras, sStatusProduto, sBarras_Temp, sDescricao, sArqLogBarras: string;
  sLog_Barras:TStringList;
  cTotal_Carga_Tributaria, cPreco_personalizado:currency;
begin

  sLog_Barras             := TStringList.Create;
  cTotal_Carga_Tributaria := 0;
  cPreco_personalizado    := 0;

  // arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmMProvider.cdsSelProdExpPdv.ProviderName := 'dspSelProdExpPdv';

  dmDBEXMaster.fdqSelProdExpPdv.Params[0].Value := dmDBEXMaster.iIdFilial;
  dmDBEXMaster.fdqSelProdExpPdv.Params[1].Value := pGeralAlterados;
  dmDBEXMaster.fdqSelProdExpPdv.Params[2].Value := 0;

  dmMProvider.cdsSelProdExpPdv.Open;
  dmMProvider.cdsSelProdExpPdv.ProviderName     := '';

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

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          AssignFile(txtArqTermConsulta, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC');

        ReWrite(txtArq);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          ReWrite(txtArqTermConsulta);

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value;
          Application.ProcessMessages;

          sDescricao                                := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value);

          if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
          begin

            if dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1 then
            begin

              sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;
              sDescricao    := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value)

            end
            else
              sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;

          end
          else
            sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;


          if ValidaEAN(Trim(sBarras_Temp)) then
          begin

            case dmMProvider.cdsSelProdExpPdvOP_STATUS.Value of
              0:sStatusProduto := '000';
              1:sStatusProduto := '008';
            end;

            case dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value of
              0:begin

                  if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 1 then
                    sBarras := FormatFloat('00000000000000000',StrToFloat(Copy(sBarras_Temp, 1, 12)))
                  else
                    sBarras := FormatFloat('00000000000000000', StrToFloat(sBarras_Temp))

                end;
            else
              sBarras := FormatFloat('00000000000000000', StrToFloat(sBarras_Temp))

            end;

            sLinhaTC := sBarras + Format('%-44.44s',[sDescricao]);

            sLinha := FormatDateTime('ddmmyy', Date) + sStatusProduto
            // 000-registro normal, 008-registro marcado como alterado,
            // 065-registro marcado como local (do PDV)
                      + sBarras + Format('%-44.44s',[sDescricao]);


            if Copy(dmMProvider.cdsSelProdExpPdvOP_CST.Value,1,1) <> '0' then
              cTotal_Carga_Tributaria := (dmMProvider.cdsSelProdExpPdvOP_ALIQ_MED_IMP.Value)
            else
              cTotal_Carga_Tributaria := (dmMProvider.cdsSelProdExpPdvOP_ALIQ_MED_NAC.Value);

            case dmMProvider.cdsSelProdExpPdvOP_PROMOCAO.Value of
              0:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
                  begin

                    if(dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1)  then
                    begin

                      sLinha    := sLinha + FormatFloat('00000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 100);
                      sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value)])

                    end
                    else
                    begin

                      sLinha    := sLinha + FormatFloat('00000000000',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * 100)));
                      sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value)]);

                    end;

                  end
                  else
                  begin

                    sLinha    := sLinha + FormatFloat('00000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value  * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value)))]);

                  end;


                end;
              1:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1) and (dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1) then
                  begin

                    sLinha    := sLinha + FormatFloat('00000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 100);
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value)]);

                  end
                  else if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
                  begin

                    sLinha    := sLinha + FormatFloat('00000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * 100)));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value)]);

                  end
                  else
                  begin

                    sLinha    := sLinha + FormatFloat('00000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value)))]);

                  end;

                end;

            end;

            if dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value > 0 then
              sLinha := sLinha + FormatFloat('000', dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value)
            else
              sLinha := sLinha + '999';

            sLinha := sLinha  + '0'                 // codigo de autentica��o da mercadoria
                              + FormatFloat('00', StrToFloatDef(dmMProvider.cdsSelProdExpPdvOP_CODIGO_ECF.Value, 1))
                              + '00000'             // percentagem de desconto na venda
                              + '00000'             // percentagem de comiss�o do tipo 1 do vendedor
                              + '00000'             // percentagem de comiss�o do tipo 2 do vendedor
                              + '000'               // codigo da tecla para venda r�pida
                              + '00000000000000000' // c�digo da mercadoria associada
                              + '0';                // indicador de pr~e�o indexado 0-normal 1-pre�o em moeda alternativa

            //Indicador de proibi��o de venda de quantidade fracion�ria
            case dmMProvider.cdsSelProdExpPdvOP_PESADO.Value of
              0:if dmMProvider.cdsSelProdExpPdvOP_PERMITE_VENDA_FRAC.Value = 1 then
                  sLinha := sLinha + '0'
                 else
                  sLinha := sLinha + '1';
              1: sLinha := sLinha + '0'
            end;

            // indicador de permiss�o de venda da mercadoria
            if dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value = 0 then
              sLinha := sLinha + '1'
            else
              sLinha := sLinha + '0';    //inicio  125
                                        { 0: mercadoria pode ser vendida
                                          1: mercadoria n�o pode ser vendida
                                          2: solicita autoriza��o pela fun��o 3742 (CodFon 181)
                                          3: solicita autoriza��o pela fun��o 3743 (CodFon 181)
                                          4: solicita autoriza��o pela fun��o 3744 (CodFon 181)
                                          5: solicita autoriza��o pela fun��o 3745 (CodFon 181)
                                          6: solicita autoriza��o pela fun��o 3746 (CodFon 181)
                                          7: solicita autoriza��o pela fun��o 3747 (CodFon 181) }
            sLinha := sLinha  + '0'     //Controle de digita��o de quantidade antes do registro do item:
                                        // 0: permitido
                                        // 1: n�o permitido (quantidade unit�ria obrigat�ria)

                              + '0'     // Controle de digita��o da tecla ENTRA para repetir o �ltimo produto:
                                        // 0: permitida
                                        // 1: n�o permitida (c�digo deve ser lido/digitado)
                              + '00000';// porcentagem da redu��o da base de calculo

            //Indicador de mercadoria com peso vari�vel
            //novo tratamento 11/10/2016
            sLinha := sLinha + IntToStr(dmMProvider.cdsSelProdExpPdvOP_PESADO.Value);
            {antigo - 11/10/2016

            case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PESADO').AsInteger of
              0: if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PERMITE_VENDA_FRAC').AsInteger = 1 then
                  sLinha := sLinha + '1'
                 else
                  sLinha := sLinha + '0';
              1: sLinha := sLinha + '1'
            end;
            }

            // in�cio indicadores de movimento (obs. n�o entendi nada)
            // venda tipo 1
            sLinha := sLinha  + '000000000'     // quantidade de mercadoria vendida
                              + '000000000000'  // valor vendido

                                                // venda tipo 2
                              + '000000000'     // quantidade de mercadoria vendida
                              + '000000000000'  // valor vendido

                                                // movimento acumulado do periodo
                                                // venda tipo 1
                              + '000000000'     // quantidade de mercadoria vendida
                              + '000000000000'  // valor vendido

                                                // venda tipo 2
                              + '000000000'     // quantidade de mercadoria vendida
                              + '000000000000'  // valor vendido

                                                // controle de estoque
                              + '000000000'     // saldo inicial
                              + '000000000'     // quantidade entrada
                              + '000000000'     // quantidade saida
                              + '000000000000'  // custo unitario

                              + '0'             // Indicador de controle da impressora remota:
                                                // 0: vendas desta mercadoria n�o devem ser enviadas � impressora remota
                                                // 1: vendas desta mercadoria devem ser enviadas � impressora remota

                              + '00000000000000000' // Indicador de controle da impressora remota:
                                                    // 0: vendas desta mercadoria n�o devem ser enviadas � impressora remota
                                                    // 1: vendas desta mercadoria devem ser enviadas � impressora remota

                              + '0'                 // Indicador de pre�o codificado:
                                                    // 0: esta mercadoria n�o est� com pre�o codificado
                                                    // 1: o Campo de pre�o unit�rio deve ser interpretado como um c�digo de pre�o Codif.

                                                    // Informa��es para controle do estoque m�nimo:
                              + '000000000'         // quantidade m�dia vendida por per�odo
                              + '000000000'         // quantidade vendida no periodo atual
                              + '000'               // fator de seguran�a a ser aplicado sobre a venda m�dia
                                                    // para a determina��o da quantidade m�nima em estoque

                              + '0';                // Indicador de restri��o de pagamento nas vendas:
                                                    // 0: n�o h� restri��o
                                                    // 1: as vendas desta mercadoria n�o podem ser pagas com finalizadoras
                                                    // cadastradas com restri��o

            // Pre�os alternativos da mercadoria

            sLinha := sLinha + FormatFloat('00000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));

            if (dmMProvider.cdsConfiguracoesDESCONTO_PERSONALIZADO.Value > 0) and (dmMProvider.cdsSelProdExpPdvOP_DESCONTO_PER.Value = 1) then
            begin

              cPreco_personalizado  := (dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value);
              cPreco_personalizado  := cPreco_personalizado - (cPreco_personalizado  * (dmMProvider.cdsConfiguracoesDESCONTO_PERSONALIZADO.Value / 100));
              cPreco_personalizado  := cPreco_personalizado * 100;

              sLinha := sLinha + FormatFloat('00000000000',cPreco_personalizado);

            end
            else
              sLinha := sLinha + '00000000000' // pre�o 3

              + '00000000000'       // pre�o 4

              + '01'                // Modo do pre�o (ver Sele��o de pre�o de mercadoria, abaixo)
              + '000000'            // Data de validade associada ao modo do pre�o (DDMMAA)
              + '0000'              // Hora de validade associada ao modo do pre�o (HHMM)
              + '000000'            // Data da �ltima compra (DDMMAA)
              + '000000'            // Data do �ltimo reajuste de pre�o (DDMMAA)
              + '000'               // Margem te�rica da mercadoria (percentual)
              + '000000000'         // Embalagem (quantidade de itens por embalagem de compra)
              + '0000000000000000'  // C�digo do fornecedor
              + '000000000000'      // Custo unit�rio, em moeda alternativa

                                    // Movimento do dia (continua��o)
              + '000000000000'      // - valor vendido em vendas do tipo 1, em moeda alternativa
              + '000000000000'      // - valor vendido em vendas do tipo 2, em moeda alternativa

                                    // Movimento do dia de custo das mercadorias vendidas:
              + '000000000000'      // Valor do CMV acumulado
              + '000000000000';     // Valor do CMV acumulado, em moeda alternativa

              if Length(Trim(dmMProvider.cdsSelProdExpPdvOP_NCM.Value)) > 0 then
              begin

                sLinha := sLinha + FormatFloat('000000000',StrToFloat(Trim(dmMProvider.cdsSelProdExpPdvOP_NCM.Value)))  // - ncm
                                 + FormatFloat('000000000',StrToFloat(Trim(dmMProvider.cdsSelProdExpPdvOP_NCM.Value))); // - genero ncm

              end
              else
              begin

                sLinha := sLinha + '000000000'    // - ncm
                                 + '000000000';   // - genero ncm

              end;

              sLinha := sLinha  + '000000'        // Valor do CMV acumulado, em moeda alternativa

                                                  // Movimento acumulado do per�odo de custo das mercadorias
                                + '000000000000'  // Valor do CMV acumulado
                                + '000000000000'  // Valor do CMV acumulado, em moeda alternativa

                                                  // Indicador de tratamento como vasilhame:
                                + '0'             // 0: esta mercadoria n�o deve ser tratada como vasilhame
                                                  // 1: esta mercadoria deve ser tratada como vasilhame

                                + '00000'         // aliquota de icms
                                + '00000000000'   // Pre�o alternativo da mercadoria (pre�o 5) � Ver A06AE
                                + '000000000'     // Quantidade de b�nus para cada unidade desta mercadoria que for vendida (ver Campo A06CA)
                                + '00'            // C�digo de situa��o tribut�ria (para emiss�o de Nota Fiscal)
                                + '0'             // 519 Tipo de b�nus/emiss�o de cupom complementar (ver Campo

                                + '00'            {Segundo tipo de b�nus/emiss�o de cupom complementar
                                                  (ver Campo A06BY) (CodFon 110)
                                                  Obs.: Se este Campo tiver conte�do diferente de zero ser�
                                                  usado, sobrepondo-se ao Campo A06CA. }

                                                  // Movimento do dia (continua��o):
                                                  // Venda do tipo 3:
                                + '000000000'     // quantidade de mercadorias vendidas
                                + '000000000000'  // valor vendido
                                + '000000000000'  // valor vendido em moeda alternativa

                                                  // Venda do tipo 4
                                + '000000000'     // quantidade de mercadorias vendidas
                                + '000000000000'  // valor vendido
                                + '000000000000'  // valor vendido em moeda alternativa

                                                  // Venda do tipo 5
                                + '000000000'     // quantidade de mercadorias vendidas
                                + '000000000000'  // valor vendido
                                + '000000000000'  // valor vendido em moeda alternativa
                                + '000000000'     // codigo anp
                                + '0'             // indicador de mercadoria com peso verificado
                                + '000000000'     // peso unitario, para usoa quando mercadoria tiver peso verificado
                                + '00000'         // percetual de tolerancia de diferen�a de peso, para uso quando mercadoria tiver peso verificado
                                + Format('%-2.2s', [RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_UNIDADE.Value)]) // 645 - 2 - unidade tributaria para emissao de nfe
                                + '000000000'     // quantidade tributaria paraemissao de nf
                                + '0000000'       // cfop para emissao de nf
                                + FormatFloat('000',StrToFloat(dmMProvider.cdsSelProdExpPdvOP_CST.Value)) // C�digo de situa��o tribut�ria (para emiss�o de Nota Fiscal)
                                + '0'             // Indicador de "item exclusivo na venda" (produto deve ser o �nico na opera��o)
                                + '0'             // Indicador de "item deve ter dupla leitura"
                                + Format('%-12.12s', [' ']); // 668 12 - C�digo do servi�o para emiss�o de RPS/NFS

              if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_ORIGEM_MERCADORIA').Value <> 0 then
                sLinha := sLinha + FormatFloat('00000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CARGA_IMP_FEDERAL').AsCurrency * 100)
              else
                sLinha := sLinha + FormatFloat('00000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CARGA_NAC_FEDERAL').AsCurrency * 100);

              sLinha := sLinha  + FormatFloat('00000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CARGA_ESTADUAL').AsCurrency * 100)
                                + FormatFloat('00000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CARGA_MUNICIPAL').AsCurrency * 100)
                                + '0'           // Indicador de que produto � �especial� para efeito de fideliza��o
                                + '0'           // Indicador de que produto � �especial� para efeito de premia��o
                                + '0'           // Indicador de que o produto � rastreado (Vers�o 1.xx.xx.231)
                                + Format('%-7.7s', [dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CEST').AsString]) //698 - 7
                                + Format('%-15.15s', [' ']) //705 - 15 - reservado
                                                // Informa��es complementares sobre a sele��o do pre�o durante uma transa��o de venda
                                + '000000000'   // quantidade m�xima da mercadoria na transa��o para que
                                                // valha o pre�o promocional
                                + '000000000000'// valor total m�nimo da transa��o para que valha o pre�o promocional
                                                // Informa��es sobre garantia estendida:
                                + '0000'        // grupo de garantia estendida a que pertence a
                                                // mercadoria (zerado se n�o pertencer a nenhum grupo)
                                + '00'          // tempo de garantia dado pelo fabricante (em meses)
                                + '00000000000' // Custo cont�bil da mercadoria
                                + '000000000'   // Quantidade m�xima permitida por item de venda
                                + '000000000'   // Multiplicador de pontos pelo valor l�quido do item
                                                // (programa de fideliza��o)
                                + '000000000';  // Pontos a serem atribu�dos por quantidade vendida
                                                // (programa de fideliza��o)

              if  dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value = 0 then //simples nacional
                sLinha := sLinha + IntToStr(dmMProvider.cdsSelProdExpPdvOP_ORIGEM_MERCADORIA.Value) + FormatFloat('000',StrToFloat(dmMProvider.cdsSelProdExpPdvOP_CST.Value)) // C�digo de situa��o tribut�ria (para emiss�o de Nota Fiscal)
              else
                sLinha := sLinha + IntToStr(dmMProvider.cdsSelProdExpPdvOP_ORIGEM_MERCADORIA.Value) + Copy(dmMProvider.cdsSelProdExpPdvOP_CST.Value,2,2); // C�digo de situa��o tribut�ria (para emiss�o de Nota Fiscal)

              sLinha := sLinha  + Format('%-2.2s', [RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_UNIDADE.Value)])
                                + '0'     // 791-1 - Indicador de produto isento de PIS/Cofins:
                                + '00000' { Par�metros para sele��o e uso dos v�rios pre�os da mercadoria. Cada par�metro abaixo habilita o tipo de venda correspondente a imprimir uma mensagem do tipo �de 9,99 por 8,88 xxx�, quando do registro do item (os textos �de�, �por� e �xxx� podem ser alterados no prefixo 910003 do arquivo de textos). O pre�o DE � o da posi��o indicada no Campo A06CO: (somar os valores dos par�metros para compor o Campo):
                                            1� par�metro � Nas vendas do tipo 1:
                                            0: n�o imprime
                                            1: imprime
                                            2� par�metro � Nas vendas do tipo 2:
                                            0: n�o imprime
                                            2: imprime
                                            3� par�metro � Nas vendas do tipo 3:
                                            0: n�o imprime
                                            4: imprime
                                            4� par�metro � Nas vendas do tipo 4:
                                            0: n�o imprime
                                            8: imprime
                                            5� par�metro � Nas vendas do tipo 5:
                                            0: n�o imprime
                                            16: imprime
                                            6� par�metro � Linha parametrizada no arquivo de textos, prefixo 910003, registro 154 (impressoras IZ) ou 164 (demais impressoras):
                                            0: n�o imprime
                                            32: imprime
                                            7� par�metro � Uso do desconto cadastrado em A06AI:
                                            0: sim
                                            64: n�o (usa o cadastrado em A05AJ).
                                            8� par�metro � PDV deve ignorar os campos de porcentagem de comiss�o da mercadoria (A06AJ e A06AK) (Vers�o 1.6.7.26):
                                            0: n�o
                                            128: sim. O efeito desta implementa��o � fazer com que o porcentual de comiss�o do departamento (campo A05AK ou campo A05AL) prevale�a. A situa��o normal � prevalecer o campo da mercadoria, sob qualquer condi��o
                                            9� par�metro � Faz com que o PDV ignore o campo de porcentagem de acr�scimo daquela mercadoria (A06DF), usando o porcentual de acr�scimo do departamento (A05BN).
                                            0:n�o
                                            256: sim
                                            10� par�metro � uso do campo A06DG como porcentual de desconto:
                                            0:n�o
                                            512: sim � equivalente a ignorar os campos A06AI e Ap5AJ}
                                + '0'     // Posi��o do pre�o da mercadoria, quando A06CN
                                          // indicar seu uso (de 0 a 4, para usar o
                                          // Pre�o 1 a 5, respectivamente)
                                + '00000' // 798/5 - Tipo de Pre�o

                                + Format('%19.19s', [' '])  // Informa��o complementar (retorna no Campo M03BP, M36BP ou M25BQ)
                                + '000000000'               // 822/9 - B�nus negativo
                                + Format('%7.7s', [' '])    // Segunda Informa��o Complementar (retorna no Campo M03BX, M36BX ou M25BZ)
                                + Format('%2.2s', [' '])    // Terceira Informa��o Complementar (retorna no Campo M03BY, M36BY ou M25CA)
                                + '000000000'               // C�digo do departamento a que pertence a mercadoria. Se valor igual a zeros, prevalece o conte�do do Campo A06AF.
                                + '00'                      // �ndice dentro da promo��o
                                + '000000'                  // C�digo da promo��o para vendas do tipo 1
                                + '000000'                  // C�digo da promo��o para vendas do tipo 2
                                + '000000'                  // C�digo da promo��o para vendas do tipo 3
                                + '000000'                  // C�digo da promo��o para vendas do tipo 4
                                + '000000'                  // C�digo da promo��o para vendas do tipo 5
                                + '0'                       // Indicador de proibi��o de desconto a funcion�rio:
                                + '0'                       // Exig�ncia de identifica��o do vendedor para registrar a mercadoria
                                + '0'                       // Venda do produto deve deduzir o peso tara cadastrado em A00DBG,
                                                            // quando quantidade obtida de balan�a conectada ao PDV
                                + '000'                     { C�digo do grupo de informa��es a capturar. Ao registrar
                                                              uma mercadoria que tenha o novo campo diferente de zero,
                                                              o programa do PDV procurar�, no arquivo 18, registros
                                                              com a chave de 9xx-CCC-000 a 9xx-CCC-099, e interpretar�
                                                              o texto obtido como sendo a especifica��o do campo
                                                              a capturar}

                                + dmMProvider.cdsConfiguracoesPDV_TRUNCA_ARREDONDA.Value //Indicador de arredondamento do produto:

                                + '0'     // 888/1 - Indicador de fabrica��o pr�pria:
                                + '0'     // Indicador de que o PDV deve coletar o n�mero de s�rie quando o item for vendido
                                + '0'     // Indicador de que a mercadoria � �alco�lica�
                                + '00000' // Porcentagem de acr�scimo
                                + '00000' // Porcentagem m�xima de desconto
                                + FormatFloat('00000', cTotal_Carga_Tributaria * 100) // Porcentagem de carga tribut�ria
                                + '00'    { Indicador de tipo de tratamento: se for diferente de zero, o PDV adotar� o tratamento correspondente ao indicador.
                                             00 Cupom
                                             01 NF Servi�o
                                             02 Relat�rio Gerencial (Entrega)
                                             03 NF Venda
                                             04 NF �nica}
                                + '0'     // 908/1 - Indicador de "mercadoria j� conferida".
                                + '0'     // Indicador de "mercadoria deve emitir documento auxiliar"
                                + '000'   // Indicador da defini��o de campos a coletar quando a mercadoria for registrada.
                                          // Se este campo for diferente de zero, o PDV buscar� no arquivo 18 (prefixo 962) a defini��o
                                          // dos campos a coletar, usando este campo como parte da chave.
                                + '000'   // 913/3 - N�mero de dias associado a programa de fideliza��o
                                + '00000' // Flags associados a programa de fideliza��o
                                + '0';    // Indicador de inibi��o de tratamento do campo A06AZ: se este indicador for
                                          // diferente de zero, o campo A06AZ n�o � usado como c�digo alternativo (Vers�o 1.xx.xx.253)

            WriteLn(txtArq, sLinha);
            if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
              WriteLn(txtArqTermConsulta, sLinhaTC);

          end
          else
            sLog_Barras.Add('GTIN inv�lido: '  + sBarras_Temp + ' / ' + sDescricao);
          Next;

        until eof;
        CloseFile(txtArq);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          CloseFile(txtArqTermConsulta);

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
                            + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;

  FormatSettings.DecimalSeparator := '.';

end;

procedure ExportarClienteZEUS_FE(sArquivo, sPath: string; iFilial: integer);
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

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelCliExportacao.RecNo;
          frmAutomacao.pnlConteudo.Caption          := Trim(dmMProvider.cdsSelCliExportacaoOP_RAZAO_SOCIAL.Value);
          Application.ProcessMessages;

          if ValidarCnpjCpf(LimparCpnjInscricao(dmMProvider.cdsSelCliExportacaoOP_CNPJ.Value)) then
          begin

            sLinha := FormatDateTime('ddmmyy', dmMProvider.cdsSelCliExportacaoOP_CADASTRO.Value)
                      + '000' // controle 000 - registro normal / 008 - registro alterado / 064- registro local
                      + FormatFloat('0000000000000000', dmMProvider.cdsSelCliExportacaoOP_CLIENTE.Value)
                      + FormatFloat('00', dmMProvider.cdsSelCliExportacaoOP_STATUS.Value);

            if dmMProvider.cdsSelCliExportacaoOP_LIMITE_CREDITO.Value < 0 then
              sLinha := sLinha + FormatFloat('00000000000', (dmMProvider.cdsSelCliExportacaoOP_LIMITE_CREDITO.Value * 100))
            else
              sLinha := sLinha + FormatFloat('000000000000', (dmMProvider.cdsSelCliExportacaoOP_LIMITE_CREDITO.Value * 100));

            if dmMProvider.cdsSelCliExportacaoOP_SALDO_DEVEDOR.Value < 0 then
              sLinha := sLinha + FormatFloat('00000000000', (dmMProvider.cdsSelCliExportacaoOP_SALDO_DEVEDOR.Value * 100))
            else
              sLinha := sLinha + FormatFloat('000000000000', (dmMProvider.cdsSelCliExportacaoOP_SALDO_DEVEDOR.Value * 100));

            sLinha := sLinha  + Format('%-44.44s', [Trim(dmMProvider.cdsSelCliExportacaoOP_RAZAO_SOCIAL.Value)])
                      + Format('%-60.60s', [Trim(dmMProvider.cdsSelCliExportacaoOP_ENDERECO.Value)
                      + ', ' + IntToStr (dmMProvider.cdsSelCliExportacaoOP_NUMERO.Value)])
                      + Format('%-15.15s', [LimparCpnjInscricao(dmMProvider.cdsSelCliExportacaoOP_CNPJ.Value)])
                      + Format('%-16.16s', [dmMProvider.cdsSelCliExportacaoOP_INSCRICAO.AsString])
                      + Format('%-32.32s', [dmMProvider.cdsSelCliExportacaoOP_BAIRRO.AsString])
                      + Format('%-10.10s', [dmMProvider.cdsSelCliExportacaoOP_CEP.AsString])
                      + Format('%-44.44s', [dmMProvider.cdsSelCliExportacaoOP_NOME_CIDADE.AsString])
                      + Format('%-2.2s', [dmMProvider.cdsSelCliExportacaoOP_ESTADO.AsString])
                      + Format('%-20.20s', [dmMProvider.cdsSelCliExportacaoOP_DDD.AsString
                      + ' ' + Trim(SomenteNumeros(dmMProvider.cdsSelCliExportacaoOP_TELEFONE1.AsString))])
            {
              Indicadores para proibi��o do cliente por tipo de venda:

              0: cliente pode ser aceito normalmente
              1: cliente n�o pode ser aceito.
              2: cliente pode ser aceito somente com autoriza��o do supervisor
              }
                      + IntToStr(dmMProvider.cdsSelCliExportacaoOP_STATUS.AsInteger) // Proibi��o para venda do tipo 1
                      + IntToStr(dmMProvider.cdsSelCliExportacaoOP_STATUS.AsInteger)
            // Proibi��o para venda do tipo 2
                      + IntToStr(dmMProvider.cdsSelCliExportacaoOP_STATUS.AsInteger)
            // Proibi��o para venda do tipo 3
                      + IntToStr(dmMProvider.cdsSelCliExportacaoOP_STATUS.AsInteger)
            // Proibi��o para venda do tipo 4
                      + IntToStr(dmMProvider.cdsSelCliExportacaoOP_STATUS.AsInteger)
            // Proibi��o para venda do tipo 5

            {

              Calcula pontos para o cliente:
              0 � sim, usando o fator de acr�scimo definido no arquivo de textos, chave 922-000-003
              1 � n�o
              2 � sim, usando fator abaixo (A10AV)
              }
                      + '1' + '000000000' // Fator de acr�scimo de pontos para o cliente (programa de fideliza��o)
                      + '000000000' // Total de pontos dispon�vel para o cliente (programa de fideliza��o)
                      + Format('%-30.30s', [' ']) // Mensagem para cliente

            {

              Op��es para exibi��o de mensagens(somar os valores dos par�metros para compor o Campo) (CodFon 109):
              1� par�metro � Exibe a mensagem, independente da Situa��o do cliente, quando Campo tiver conte�do.
              0 � n�o
              1 � sim
              }
                      + '00000' + '00' // categoria do cliente
                      + Format('%-20.20s',[IntToStr(dmMProvider.cdsSelCliExportacaoOP_NUMERO_COBR.AsInteger)])  //N�mero (do endere�o)
                      + Format('%-30.30s',[dmMProvider.cdsSelCliExportacaoOP_COMPLEMENTO.AsString])             //Complemento (do endere�o)
                      + FormatFloat('000000000',dmMProvider.cdsSelCliExportacaoOP_COD_MUNICIPIO.AsInteger)      //C�digo do munic�pio (tabela IBGE)
                      + Format('%-9.9s',[' '])  //C�digo do munic�pio (tabela IBGE)
                      + Format('%-9.9s',[' '])  //C�digo no SUFRAMA
                      + Format('%-2.2s',[' ']); //Unidade da Federa��o, se for �rg�o p�blico estadual (em branco se n�o for �rg�o p�blico)
            if UpperCase(dmMProvider.cdsSelCliExportacaoOP_INSCRICAO.AsString) = 'ISENTO' then
              sLinha := sLinha + '1'    //Flag de isen��o de Inscri��o Estadual (0 significa normal, 1 significa isento)
            else
              sLinha := sLinha + '0';

            sLinha := sLinha + Format('%-2.2s',[' '])   //Categoria do cliente para filtrar finalizadoras e planos de pagamentos
                      + Format('%-100.100s',[' '])      //Indicadores de categorias a que o cliente pertence. Cada uma das 100 posi��es
                                                        //corresponde a uma categoria, com o seguinte significado:
                                                        //0=cliente n�o pertence � categoria;
                                                        //1=cliente pertence � categoria.
                                                        //Se pelo menos uma dessas 100 posi��es for diferente de zero, ent�o uma promo��o
                                                        //somente poder� ser aplicada se seu campo A21BD permitir pelo menos uma das
                                                        //categorias do cliente. Se todos os indicadores deste campo estiverem zerados, a
                                                        //categoria validada contra o campo A21BD ser� a determinada pelo campo A10AZ.
                      + Format('%-8.8s',[' '])          //Data de nascimento
                      + Format('%-3.3s',[' '])          //C�digo do texto que deve ser exibido
                      + Format('%-1.1s',[' '])          //Indicador de que o registro � o que realizou a �ltima compra
                      + Format('%-10.10s',[' ']);       //senha codificada do cliente

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

procedure ExportarPrecoQuantidade(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  // arquivo de pre�o por quantidade
  frmAutomacao.edtPastaDestinoPDV.Text      := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text  := sArquivo;

  dmMProvider.cdsSelPrecoQtdExp.Close;
  dmMProvider.cdsSelPrecoQtdExp.Providername := 'dspSelPrecoQtdExp';

  dmMProvider.cdsSelPrecoQtdExp.Open;
  dmMProvider.cdsSelPrecoQtdExp.Providername := '';

  FormatSettings.DecimalSeparator := '.';

  if dmMProvider.cdsSelPrecoQtdExp.RecordCount <= 0 then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + MSG_ARQ_EXP_PRQT_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelPrecoQtdExp.RecordCount;

    with dmMProvider.cdsSelPrecoQtdExp do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelPrecoQtdExp.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsSelPrecoQtdExpOP_BARRAS.Value;
          Application.ProcessMessages;

          sLinha := '000000'
                    + '000' //normal / alterado
                    + '00'//00 - mercadoria/01-departamento
                    + FormatFloat('00000000000000000',StrtoFloat(dmMProvider.cdsSelPrecoQtdExpOP_BARRAS.Value))
                    + '1'//tipo de venda
                    + FormatFloat('000000000',(dmMProvider.cdsSelPrecoQtdExpOP_QUANTIDADE.AsCurrency * 1000))
                    + '000'//complemento
                    + '00000'
                    + FormatFloat('00000000000',(dmMProvider.cdsSelPrecoQtdExpOP_PRECO_UNITARIO.AsCurrency * 100))
                    + FormatFloat('00000',(dmMProvider.cdsSelPrecoQtdExpOP_PERCENTUAL_DESCONTO.AsCurrency * 100));

          WriteLn(txtArq, sLinha);

        Next;

      until eof;

      CloseFile(txtArq);

    end;

    if DirectoryExists(sPath) then
      CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False)
    else
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
            + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
      exit;

    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 +
          'O arquivo de PRE�O X QUANTIDADE foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    FormatSettings.DecimalSeparator           := ',';

  end;

  dmMProvider.cdsSelPrecoQtdExp.Close;

end;
end;

procedure ExportarGrupoProdutoZEUS_FE(sArquivo, sPath: string;
  iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  // arquivo de pre�o por quantidade
  frmAutomacao.edtPastaDestinoPDV.Text      := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text  := sArquivo;

  FormatSettings.DecimalSeparator := '.';

  dmMProvider.cdsGrupo.Close;
  dmMProvider.cdsGrupo.ProviderName := 'dspGrupo';

  dmDBEXMaster.fdqGrupo.SQL.Clear;
  dmDBEXMaster.fdqGrupo.SQL.Add('select * from grupo');

  dmMProvider.cdsGrupo.Open;
  dmMProvider.cdsGrupo.ProviderName := '';

  if dmMProvider.cdsGrupo.RecordCount <= 0 then
  begin
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 +
          MSG_ARQ_EXP_PRQT_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsGrupo.RecordCount;

    with dmMProvider.cdsGrupo do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsGrupo.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsGrupoNOME.AsString;
          Application.ProcessMessages;

          sLinha := '000000'
                    + '000' //normal / alterado
                    + FormatFloat('000',dmMProvider.cdsGrupoGRUPO.Value)
                    + Format('%-20.20s',[dmMProvider.cdsGrupoNOME.Value])
                    + '000' //grupo do departamento
                    + '000' //faixa de pre�o do departamento
                    + '000'; //codigo tecla do departamento

          if dmMProvider.cdsGrupoTRIBUTACAO.Value > 0 then
          begin

            dmMProvider.cdsTributacao.Close;
            dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

            dmDBEXMaster.fdqTributacao.SQL.Clear;
            dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
            dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.cdsGrupoTRIBUTACAO.Value));
            dmDBEXMaster.fdqTributacao.SQL.Add('ORDER BY NOME');

            dmMProvider.cdsTributacao.Open;
            dmMProvider.cdsTributacao.ProviderName := '';

            if not dmMProvider.cdsTributacao.IsEmpty then
              sLinha := sLinha + Format('%-2.2s',[dmMProvider.cdsTributacaoCODIGOECF.Value])
            else
              sLinha := sLinha + '00';

          end
          else
            sLinha := sLinha + '00';

          sLinha := sLinha + '0' //numero de autntica��es do departamento
                    + '00000'    //porcentagem de desconto
                    + '00000'    //porcentagem de comissao vendedor venda tipo 1
                    + '00000';  //porcentagem de comissao vendedor venda tipo 2

          if dmMProvider.cdsGrupoTRIBUTACAO.Value > 0 then
          begin

            dmMProvider.cdsTributacao.Close;
            dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

            dmDBEXMaster.fdqTributacao.SQL.Clear;
            dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
            dmDBEXMaster.fdqTributacao.SQL.Add('WHERE TRIBUTACAO = ' + IntToStr(dmMProvider.cdsGrupoTRIBUTACAO.Value));
            dmDBEXMaster.fdqTributacao.SQL.Add('ORDER BY NOME');

            dmMProvider.cdsTributacao.Open;
            dmMProvider.cdsTributacao.ProviderName := '';

            if not dmMProvider.cdsTributacao.IsEmpty then
              sLinha := sLinha + FormatFloat('00000',dmMProvider.cdsTributacaoALIQUOTA.Value * 100)
            else
              sLinha := sLinha + '00000';

          end
          else
            sLinha := sLinha + '00000';

          sLinha := sLinha + '00000'                    //porcentagem de red base calculo
                           + Format('%-42.42s',[' '])   //reservado
                           + Format('%-42.42s',[' '])   //reservado
                           + '0'                        //0 vendas n�o devem ser enviadas � impressora remota / 1 vendas devem ser enviadas � impressora remota
                           + '0'                        //0 n�o h� restri��o / 1 as mercadorias deste departamento n�o podem ser pagas com finalizadoras cadastradas com restri��o
                           + '00000'                    //Porcentagem de desconto a funcion�rio das mercadorias deste departamento
                           + Format('%-120.120s',[' ']) //reservado
                           + '000000000000'             //Valor limite para as mercadorias pesadas deste departamento
                           + Format('%-222.222s',[' ']) //reservado
                           + '0000'                     //0 n�o h� tratamento para desconto autom�tico / 1 PDV registra desconto automaticamente, usando o porcentual do campo
                           + '00'                       { 00: n�o h� restri��o � digita��o de quantidade para as mercadorias deste departamento
                                                          01: h� restri��o � digita��o de quantidade para as mercadorias deste departamento (PDV s� aceita quantidade unit�ria)
                                                          Obs.:Par�metro n�o verificado se item registrado por tratamento do arquivo 23 (pre�os em fun��o da quantidade vendida).}
                           + '000000000'                //Multiplicador de pontos pelo valor l�quido dos itens vendidos desse departamento (programa de fideliza��o)
                           + '000000000000'             { Valor m�ximo permitido para o valor total de cada item registrado, que perten�a a este departamento
                                                          N�o verificado se item registrado por tratamento do arquivo 23 (pre�os em fun��o da quantidade vendida).}
                           + '000000000'                //C�digo do departamento. Se valor igual a zeros, prevalece o conte�do do campo A05AC.
                           + '00000'                    //Desconto para vendas do tipo 1. Substitui o campo A05AJ quando habilitado em A00DMQF
                           + '00000'                    //Desconto para vendas do tipo 2. Substitui o campo A05AJ quando habilitado em A00DMQF
                           + '00000'                    //Desconto para vendas do tipo 3. Substitui o campo A05AJ quando habilitado em A00DMQF.
                           + '00000'                    //Desconto para vendas do tipo 4. Substitui o campo A05AJ quando habilitado em A00DMQF.
                           + '00000'                    //Desconto para vendas do tipo 5. Substitui o campo A05AJ quando habilitado em A00DMQF.
                           + '000000000'                //C�digo do departamento pai (Vers�o 1.8.18.15)
                           + '00000';                   //Porcentagem de acr�scimo (Vers�o 1.8.18.15)

          WriteLn(txtArq, sLinha);

          Next;

          if eof then
          begin


            sLinha := '000000'
                      + '000' //normal / alterado
                      + '999'
                      + Format('%-20.20s',['SEM GRUPO/DEPTO'])
                      + '000' //grupo do departamento
                      + '000' //faixa de pre�o do departamento
                      + '000' //codigo tecla do departamento
                      + '00'
                      + '0' //numero de autntica��es do departamento
                      + '00000'     //porcentagem de desconto
                      + '00000'     //porcentagem de comissao vendedor venda tipo 1
                      + '00000'     //porcentagem de comissao vendedor venda tipo 2
                      + '00000'     //porcentagem de redu��o da base de calc
                      + '00000'     //aliquota de icms
                      + Format('%-42.42s',[' '])   //reservado
                      + Format('%-42.42s',[' '])   //reservado
                      + '0'                        //0 vendas n�o devem ser enviadas � impressora remota / 1 vendas devem ser enviadas � impressora remota
                      + '0'                        //0 n�o h� restri��o / 1 as mercadorias deste departamento n�o podem ser pagas com finalizadoras cadastradas com restri��o
                      + '00000'                    //Porcentagem de desconto a funcion�rio das mercadorias deste departamento
                      + Format('%-120.120s',[' ']) //reservado
                      + '000000000000'             //Valor limite para as mercadorias pesadas deste departamento
                      + Format('%-222.222s',[' ']) //reservado
                      + '0000'                     //0 n�o h� tratamento para desconto autom�tico / 1 PDV registra desconto automaticamente, usando o porcentual do campo
                      + '00'                       { 00: n�o h� restri��o � digita��o de quantidade para as mercadorias deste departamento
                                                     01: h� restri��o � digita��o de quantidade para as mercadorias deste departamento (PDV s� aceita quantidade unit�ria)
                                                     Obs.:Par�metro n�o verificado se item registrado por tratamento do arquivo 23 (pre�os em fun��o da quantidade vendida).}
                      + '000000000'                //Multiplicador de pontos pelo valor l�quido dos itens vendidos desse departamento (programa de fideliza��o)
                      + '000000000000'             { Valor m�ximo permitido para o valor total de cada item registrado, que perten�a a este departamento
                                                     N�o verificado se item registrado por tratamento do arquivo 23 (pre�os em fun��o da quantidade vendida).}
                      + '000000000'                //C�digo do departamento. Se valor igual a zeros, prevalece o conte�do do campo A05AC.
                      + '00000'                    //Desconto para vendas do tipo 1. Substitui o campo A05AJ quando habilitado em A00DMQF
                      + '00000'                    //Desconto para vendas do tipo 2. Substitui o campo A05AJ quando habilitado em A00DMQF
                      + '00000'                    //Desconto para vendas do tipo 3. Substitui o campo A05AJ quando habilitado em A00DMQF.
                      + '00000'                    //Desconto para vendas do tipo 4. Substitui o campo A05AJ quando habilitado em A00DMQF.
                      + '00000'                    //Desconto para vendas do tipo 5. Substitui o campo A05AJ quando habilitado em A00DMQF.
                      + '000000000'                //C�digo do departamento pai (Vers�o 1.8.18.15)
                      + '00000';                   //Porcentagem de acr�scimo (Vers�o 1.8.18.15)

            WriteLn(txtArq, sLinha);

          end;

        until eof;

        CloseFile(txtArq);

      end;

      if DirectoryExists(sPath) then
        CopyFile(PChar(ExtractFilepath(Application.ExeName)  + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False)
      else
      begin

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
              + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!', mb_IconWarning + mb_Ok);
        exit;

      end;

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 +
            'O arquivo de DEPARTAMENTOS foi gerado com sucesso!'), 'Aten��o!', mb_IconInformation + mb_Ok);

      frmAutomacao.pgbProgressoArquivo.Position := 0;

      FormatSettings.DecimalSeparator := ',';

    end;

  end;

end;

procedure ExportarVendedoresZEUS_FE(sArquivo, sPath: string; iFilial: integer);
begin

end;

procedure ImportarVendaZEUS_FE(sArquivo, sPath: string; iFilial, pNumCx: integer; bCfgCxs: TCheckListBox; pTabelaZ:smallint; pAutomacao:boolean; pData:TDateTime);
var
  tsArquivo: TStringList;
  i, iTipoRegistro, iHora: integer;
  sLinha, sBarras, sFinalizadora, sCliente: string;

begin

  case pTabelaZ of
    5:begin

        iTipoRegistro := 0;
        iHora         := 0;
        tsArquivo     := TStringList.Create;

      //  tsArquivo.LoadFromFile(sPath + sArquivo);

        if pAutomacao then
          frmAutomacao.pgbProgressoGeralImp.Max   := dmMZeus.cdsZan_M05.RecordCount;

        //M�dulo Fiscal � 1� parte
        while not dmMZeus.cdsZan_M05.Eof do
        begin

          if pAutomacao then
          begin

            frmAutomacao.pgbProgressoGeralImp.Position := dmMZeus.cdsZan_M05.RecNo;
            frmAutomacao.lblMsgProgresso.Visible := True;
            frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMZeus.cdsZan_M05.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoGeralImp.Max);
            Application.ProcessMessages;

          end;

          // Item vendido em cupom fiscal
          dmMZeus.cdsZan_M03.Close;
          dmMZeus.cdsZan_M03.ProviderName := 'dspZan_M03';

          dmMZeus.fdqZan_M03.SQL.Clear;
          dmMZeus.fdqZan_M03.SQL.Add('select * from zan_m03');
          //data do movimento
          dmMZeus.fdqZan_M03.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
          //loja
          dmMZeus.fdqZan_M03.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
          //serie ecf
          dmMZeus.fdqZan_M03.SQL.Add('and m00ac = ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value));
          //CRZ
          dmMZeus.fdqZan_M03.SQL.Add('and m03cv = ' + IntToStr(dmMZeus.cdsZan_M05M05BH.AsInteger));

          dmMZeus.cdsZan_M03.Open;
          dmMZeus.cdsZan_M03.ProviderName := '';

          if pAutomacao then
            frmAutomacao.pgbProgressoImportacao.Max := dmMZeus.cdsZan_M03.RecordCount;

          while not dmMZeus.cdsZan_M03.Eof do
          begin

            if pAutomacao then
            begin

              frmAutomacao.pgbProgressoImportacao.Position := dmMZeus.cdsZan_M03.RecNo;
              frmAutomacao.lblMsgProgresso.Visible := True;
              frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMZeus.cdsZan_M03.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max)+ #13
                                                                                             + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + '/' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value ;
              Application.ProcessMessages;

            end;

            //n�mero da fun��o
            if (dmMZeus.cdsZan_M03M03AE.Value <> 147) and (dmMZeus.cdsZan_M03M03AE.Value <> 1147) then
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                if Length(Trim(dmMZeus.cdsZan_M03M03AH.AsString)) <= 13 then
                begin

                  if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger = 0 then
                  begin

                    sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                    if Length(sBarras) < 8 then
                      sBarras := GerarCodigodeBarras(FormatFloat('000000000000',StrToFloat(Copy(Trim(dmMZeus.cdsZan_M03M03AH.AsString), 1,(Length(dmMZeus.cdsZan_M03M03AH.AsString))))))
                    else
                      sBarras := FormatFloat('0000000000000', StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                  end
                  else
                    sBarras := FormatFloat('0000000000000',StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                end
                else
                  sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                dmMProvider.fdmImpCupom.Append;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMZeus.cdsZan_M03M00AC.AsInteger;
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMZeus.cdsZan_M03M00AD.AsInteger;
                dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value         := '5102';

                dmMProvider.cdsTributacao.Close;
                dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

                dmDBEXMaster.fdqTributacao.SQL.Clear;
                dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');

                if (dmMZeus.cdsZan_M03M03AY.Value > 0) then
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE ALIQUOTA = ' + FloatToStr(dmMZeus.cdsZan_M03M03AY.Value))
                else
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE CODIGOECF = ' + QuoTedStr(FormatFloat('00',dmMZeus.cdsZan_M03M03AJ.Value)));

                dmMProvider.cdsTributacao.Open;
                dmMProvider.cdsTributacao.ProviderName := '';

                dmMProvider.fdmImpCupomTRIBUTACAO.Value   := dmMProvider.cdsTributacaoTRIBUTACAO.AsInteger;

                //al�quota
                if (dmMZeus.cdsZan_M03M03AY.Value > 0) then
                begin

                  //c�digo da tributa��o
                  if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                  begin

                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                    dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                  end
                  else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                  else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                  else
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value * 100);

                end
                else
                begin

                  if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                  begin

                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                    dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                  end
                  else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                  else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                  else
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value * 100);

                end;

                dmMProvider.fdmImpCupomEMISSAO.Value            := dmMZeus.cdsZan_M03M00AF.AsDateTime;
                dmMProvider.fdmImpCupomBARRAS.Value             := sBarras;
                dmMProvider.fdmImpCupomQUANTIDADE.Value         := dmMZeus.cdsZan_M03M03AO.Value;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value          := dmMZeus.cdsZan_M03M03AP.Value - dmMZeus.cdsZan_M03M03AQ.Value;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value     :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value     := dmMZeus.cdsZan_M03M03AQ.Value;
      //          dmMProvider.fdmImpCupomSUB_TOTAL.Value          := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
                dmMProvider.fdmImpCupomHORA_ABERTURA.AsDateTime := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),1,2) //inclu�do em 07/11/2016
                                                                    + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),3,2),0);
                dmMProvider.fdmImpCupomNUMERO_ITEM.Value      := dmMZeus.cdsZan_M03M03CD.Value;

                dmMZeus.cdsZan_M01.Close;
                dmMZeus.cdsZan_M01.ProviderName := 'dspZan_M01';

                dmMZeus.fdqZan_M01.SQL.Clear;
                dmMZeus.fdqZan_M01.SQL.Add('select * from Zan_M01');
                dmMZeus.fdqZan_M01.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', dmMZeus.cdsZan_M03M00AF.AsDateTime)));
                dmMZeus.fdqZan_M01.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.AsInteger));
                dmMZeus.fdqZan_M01.SQL.Add('and m00ac = ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value));

                dmMZeus.cdsZan_M01.Open;
                dmMZeus.cdsZan_M01.ProviderName := '';

                if dmMZeus.cdsZan_M01cupom_cancelamento.Value <= 0 then
                  dmMProvider.fdmImpCupomSITUACAO.Value := 0
                else
                  dmMProvider.fdmImpCupomSITUACAO.Value := 1;

              end;

            end;
            {else if (dmMZeus.cdsZan_M03M03AE.Value = 147) then
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                if Length(Trim(dmMZeus.cdsZan_M03M03AH.AsString)) <= 13 then
                begin

                  if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger = 0 then
                  begin

                    sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                    if Length(sBarras) < 8 then
                      sBarras := GerarCodigodeBarras(Copy(Trim(dmMZeus.cdsZan_M03M03AH.AsString), 1,(Length(dmMZeus.cdsZan_M03M03AH.AsString) - 1)))
                    else
                      sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);

                  end
                  else
                    sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);
                end
                else
                  sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);

                dmMProvider.fdmImpCupom.Append;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMZeus.cdsZan_M03M00AC.AsInteger;
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMZeus.cdsZan_M03M00AD.AsInteger;
                dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value         := '5102';

                if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                begin

                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                  dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                end
                else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                else
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value);

                dmMProvider.fdmImpCupomEMISSAO.Value              := dmMZeus.cdsZan_M03M00AF.AsDateTime;
                dmMProvider.fdmImpCupomBARRAS.Value               := sBarras;
                dmMProvider.fdmImpCupomQUANTIDADE.Value           := dmMZeus.cdsZan_M03M03AO.Value;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value            := dmMZeus.cdsZan_M03M03AP.Value;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value       :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value       := dmMZeus.cdsZan_M03M03AQ.Value / 100;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value            := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
                dmMProvider.fdmImpCupomHORA_ABERTURA.Value        := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),1,2) //inclu�do em 07/11/2016
                                                                      + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),3,2),0);
                dmMProvider.fdmImpCupomNUMERO_ITEM.Value          := dmMZeus.cdsZan_M03M03CD.Value;
                dmMProvider.fdmImpCupomQUANTIDADE_CANCELADA.Value := StrToFloatDef(Copy(sLinha, 91, 9), 0)    / 1000;
                dmMProvider.fdmImpCupomVALOR_CANCELADO.Value      := StrToFloatDef(Copy(sLinha, 100, 12), 0)  / 100;
                dmMProvider.fdmImpCupomSITUACAO.Value             := 1

              end;

            end;}

          {
          dmMZeus.cdsZan_M01.Close;
          dmMZeus.cdsZan_M01.ProviderName := 'dspZan_M01';

          dmMZeus.fdqZan_M01.SQL.Clear;
          dmMZeus.fdqZan_M01.SQL.Add('select * from zan_m01');
          //data do movimento
          dmMZeus.fdqZan_M01.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', frmAutomacao.dtpMovimentoImportacao.Date)));
          //loja
          dmMZeus.fdqZan_M01.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
          //CRZ
          dmMZeus.fdqZan_M01.SQL.Add('and m01bs = ' + IntToStr(dmMZeus.cdsZan_M05M05BH.AsInteger));

          dmMZeus.cdsZan_M01.Open;
          dmMZeus.cdsZan_M01.ProviderName := '';

          frmAutomacao.pgbProgressoImportacao.Max := dmMZeus.cdsZan_M01.RecordCount;

          if not dmMZeus.cdsZan_M01.IsEmpty then
          begin

            frmAutomacao.pgbProgressoImportacao.Position := i;

            frmAutomacao.lblMsgProgresso.Visible := True;
            frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(i+1) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max);
            Application.ProcessMessages;

            dmMProvider.fdmImpCupom.Close;
            dmMProvider.fdmImpCupom.Open;

            if dmMZeus.cdsZan_M01M01AG.AsInteger = 147 then  //tipo de venda
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M01M00AC.AsInteger)) then
              begin

                dmMProvider.fdmImpCupom.First;

                if dmMProvider.fdmImpCupom.Locate('SERIE_ECF;NUMERO_CUPOM',VarArrayOf([dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value,StrToInt(Copy(sLinha, 487, 6))]),[loPartialKey, loCaseinsensitive]) then
                begin

                  while not dmMProvider.fdmImpCupom.Eof do
                  begin

                    if (dmMProvider.fdmImpCupomSERIE_ECF.Value = dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value) and (dmMProvider.fdmImpCupomNUMERO_CUPOM.Value = StrToInt(Copy(sLinha, 487, 6)))then
                    begin

                      dmMProvider.fdmImpCupom.edit;
                      dmMProvider.fdmImpCupomSITUACAO.Value := 2;
                      dmMProvider.fdmImpCupom.post;
                      dmMProvider.fdmImpCupom.next;

                    end
                    else
                      break;

                  end;
                end;


                 end;}

            //Finalizadora utilizada em cupom fiscal
            dmMZeus.cdsZan_M02.Close;
            dmMZeus.cdsZan_M02.ProviderName := 'dspZan_M02';

            dmMZeus.fdqZan_M02.SQL.Clear;
            dmMZeus.fdqZan_M02.SQL.Add('select * from zan_m02');
            //data do movimento
            dmMZeus.fdqZan_M02.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M02.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M02.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M02.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M02.Open;
            dmMZeus.cdsZan_M02.ProviderName := '';

            sFinalizadora := IntToStr(dmMZeus.cdsZan_M02M02AI.Value);

            dmMProvider.fdmFinalizadoras.Append;
            dmMProvider.fdmFinalizadorasCOD_FINALIZADORA.Value  := FormatFloat('00',dmMZeus.cdsZan_M02M02AI.Value);
            dmMProvider.fdmFinalizadorasVALOR.Value             := dmMZeus.cdsZan_M02M02AK.Value;
            dmMProvider.fdmFinalizadoras.Post;

            case dmMProvider.cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.Value of
              1:begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

                  if not dmMProvider.cdsFormasPagamento.IsEmpty then
                  begin

                    case dmMProvider.cdsFormasPagamentoTIPO.Value of
                      2:begin // cheque

                          dmMProvider.fdmImpCheque.Append;

                          if Length(Trim(dmMZeus.cdsZan_M02M02AM.Value)) <= 6 then
                          begin

                            sCliente := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M02M02AM.Value)));

                            if sCliente <> '0' then
                            begin

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                              dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := '';

                            end;

                          end
                          else if Length(Trim(dmMZeus.cdsZan_M02M02AM.Value))  > 6 then
                          begin

                            sCliente := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M02M02AM.Value)));

                            if sCliente <> '0' then
                            begin

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                              dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := '';

                            end;

                          end;

                          if not dmMProvider.cdsPesqClientes.IsEmpty then
                          begin

                            dmMProvider.fdmImpCheque.Append;
                            dmMProvider.fdmImpChequeCLIENTE.Value         := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                            dmMProvider.fdmImpChequeDATA.Value            := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;
                            dmMProvider.fdmImpChequeCUPOM.Value           := dmMProvider.fdmImpCupomNUMERO_CUPOM.AsInteger;
                            dmMProvider.fdmImpChequeVALOR.Value           := dmMZeus.cdsZan_M02M02AK.Value;
                            dmMProvider.fdmImpChequePL_CONTAS.Value       := dmMProvider.cdsFormasPagamentoPLANODECONTAS.AsInteger;
                            dmMProvider.fdmImpChequeITEM_PL_CONTAS.Value  := dmMProvider.cdsFormasPagamentoITEMPLANODECONTAS.AsInteger;
                            dmMProvider.fdmImpChequeLANCAMENTO.Value      := dmMProvider.cdsFormasPagamentoLANCAMENTO.AsInteger;

                            if dmMZeus.cdsZan_M02M02AS.AsDateTime > 0 then
                              dmMProvider.fdmImpChequeVENCIMENTO.AsDateTime  := dmMZeus.cdsZan_M02M02AS.AsDateTime
                            else
                              dmMProvider.fdmImpChequeVENCIMENTO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            if Copy(dmMZeus.cdsZan_M02M02BO.Value, Length(Trim(dmMZeus.cdsZan_M02M02BO.Value)), 1) = '2' then
                            begin // digita��o da linha cmc7

                              dmMProvider.fdmImpChequeBANCO.Value         := StrToIntDef(Copy(dmMZeus.cdsZan_M02M02BO.Value,1,3),0); //StrToInt(Copy(sLinha, 362, 3));
                              dmMProvider.fdmImpChequeAGENCIA.AsString    := Copy(dmMZeus.cdsZan_M02M02BO.Value,4,4);//Copy(sLinha, 365, 4);
                              dmMProvider.fdmImpChequeCONTA.AsString      := Copy(dmMZeus.cdsZan_M02M02BO.Value,23,24);//FloatToStr(StrToFloat(Trim(Copy(sLinha, 384, 24))));
                              dmMProvider.fdmImpChequeCHEQUE.AsString     := Copy(dmMZeus.cdsZan_M02M02BO.Value,11,6);//Copy(sLinha, 373, 6);
                              dmMProvider.fdmImpChequeEMISSAO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            end
                            else if Copy(dmMZeus.cdsZan_M02M02BO.Value, Length(Trim(dmMZeus.cdsZan_M02M02BO.Value)), 1) = '1' then
                            begin // digita��o da 1 linha

                              dmMProvider.fdmImpChequeBANCO.AsInteger     := StrToIntDef(Copy(dmMZeus.cdsZan_M02M02BO.Value,4,3),0); //StrToInt(Copy(sLinha, 365, 3));
                              dmMProvider.fdmImpChequeAGENCIA.AsString    := Copy(dmMZeus.cdsZan_M02M02BO.Value,8,4); //Copy(sLinha, 368, 4);
                              dmMProvider.fdmImpChequeCONTA.AsString      := Copy(dmMZeus.cdsZan_M02M02BO.Value,11,12); //FloatToStr(StrToFloat(Copy(sLinha, 372, 12)));
                              dmMProvider.fdmImpChequeCHEQUE.AsString     := Copy(dmMZeus.cdsZan_M02M02BO.Value,23,24); //FloatToStr(StrToFloat(Trim(Copy(sLinha, 384, 24))));
                              dmMProvider.fdmImpChequeEMISSAO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            end;

                          end;

                        end;

                    end;

                  end;

                end;

            end;

            // Altera��o de situa��o do pedido (uso interno)
            dmMZeus.cdsZan_M20.Close;
            dmMZeus.cdsZan_M20.ProviderName := 'dspZan_M20';

            dmMZeus.fdqZan_M20.SQL.Clear;
            dmMZeus.fdqZan_M20.SQL.Add('select * from zan_m20');
            //data do movimento
            dmMZeus.fdqZan_M20.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M20.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M20.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M20.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M20.Open;
            dmMZeus.cdsZan_M20.ProviderName := '';

            //if StrToIntDef(Copy(sLinha, 41, 11),0) > 0 then
            if StrToFloatDef(dmMZeus.cdsZan_M20M20AH.Value,0) > 0 then
            begin

              dmMProvider.fdmPedidoZeus.Append;
              dmMProvider.fdmPedidoZeusNUMERO_PEDIDO.Value    := StrToInt(dmMZeus.cdsZan_M20M20AH.Value); //StrToInt(Copy(sLinha, 41, 11));
              dmMProvider.fdmPedidoZeusSTATUS_PEDIDO.Value    := dmMZeus.cdsZan_M20M20AI.Value; //StrToInt(Copy(sLinha, 52, 1));
              dmMProvider.fdmPedidoZeus.Post;

              if not dmMProvider.fdmFinalizadoras.IsEmpty then
              begin

                dmMProvider.fdmFinalizadoras.First;

                while not dmMProvider.fdmFinalizadoras.Eof do
                begin

                  dmMProvider.fdmFinalizadoraPedido.Append;
                  dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value := dmMProvider.fdmFinalizadorasCOD_FINALIZADORA.Value;
                  dmMProvider.fdmFinalizadoraPedidoVALOR.Value            := dmMProvider.fdmFinalizadorasVALOR.Value;
                  dmMProvider.fdmFinalizadoraPedidoCODIGO_PEDIDO.Value    := dmMProvider.fdmPedidoZeusNUMERO_PEDIDO.Value;
                  dmMProvider.fdmFinalizadoraPedido.Post;;

                  dmMProvider.fdmFinalizadoras.Next;

                end;

              end;

            end;

            case dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger  of
              1:begin

                  //Movimenta��o de limite de cr�dito
                  dmMZeus.cdsZan_M33.Close;
                  dmMZeus.cdsZan_M33.ProviderName := 'dspZan_M33';

                  dmMZeus.fdqZan_M33.SQL.Clear;
                  dmMZeus.fdqZan_M33.SQL.Add('select * from zan_m33');
                  //data do movimento
                  dmMZeus.fdqZan_M33.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
                  //loja
                  dmMZeus.fdqZan_M33.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
                  //numero do equipamento
                  dmMZeus.fdqZan_M33.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
                  //COO
                  dmMZeus.fdqZan_M33.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

                  dmMZeus.cdsZan_M33.Open;
                  dmMZeus.cdsZan_M33.ProviderName := '';

                  if not dmMZeus.cdsZan_M33.IsEmpty then
                  begin

                    dmMProvider.cdsFormasPagamento.Close;
                    dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                    dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                    dmDBEXMaster.fdqFormasPagamento.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                    dmDBEXMaster.fdqFormasPagamento.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);

                    dmMProvider.cdsFormasPagamento.Open;
                    dmMProvider.cdsFormasPagamento.ProviderName := '';

                    if not dmMProvider.cdsFormasPagamento.IsEmpty then
                    begin

                      case dmMProvider.cdsFormasPagamentoTIPO.AsInteger of
                        10:begin

          //                  sCliente := FloatToStr(StrToFloat(Copy(sLinha, 36, 16)));
                              sCliente := FloatToStr(StrToFloatDef(dmMZeus.cdsZan_M33M33AH.Value,0));

                              if Length(sCliente) <= 6 then
                              begin

                                if sCliente <> '0' then
                                begin

                                  dmMProvider.cdsPesqClientes.Close;
                                  dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                                  dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);

                                  dmMProvider.cdsPesqClientes.Open;
                                  dmMProvider.cdsPesqClientes.ProviderName := '';

                                end;

                              end
                              else if Length(FloatToStr(StrToFloat(sCliente))) > 6 then
                              begin

                                if Length(FloatToStr(StrToFloat(sCliente))) < 14 then
                                  sCliente := FormatFloat('00000000000',StrToFloat(sCliente));

                                if sCliente <> '0' then
                                begin

                                  dmMProvider.cdsPesqClientes.Close;
                                  dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                                  dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));

                                  dmMProvider.cdsPesqClientes.Open;
                                  dmMProvider.cdsPesqClientes.ProviderName := '';

                                end;

                              end;

                              if not dmMProvider.cdsPesqClientes.IsEmpty then
                              begin

                                dmMProvider.fdmImpFinanceiro.Append;
                                dmMProvider.fdmImpFinanceiroIP_CRE.AsInteger                    := -1;
                                dmMProvider.fdmImpFinanceiroIP_FILIAL.AsInteger                 := dmDBEXMaster.iIdFilial;
                                dmMProvider.fdmImpFinanceiroIP_DOCUMENTO.Value                  := IntToStr(dmMZeus.cdsZan_M33M00AD.Value); // Copy(sLinha, 16, 6);
                                dmMProvider.fdmImpFinanceiroIP_SITUACAO.AsInteger               := 0;
                                dmMProvider.fdmImpFinanceiroIP_DATA_ENTRADA.AsDateTime          := Date;
                                dmMProvider.fdmImpFinanceiroIP_SACADO.AsInteger                 := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                                dmMProvider.fdmImpFinanceiroIP_TIPO.AsInteger                   := 0;
                                dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime          := dmMZeus.cdsZan_M33M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
                                dmMProvider.fdmImpFinanceiroIP_DATA_VENCIMENTO.AsDateTime       := dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime + 30;
                                dmMProvider.fdmImpFinanceiroIP_MOEDA.AsInteger                  := 0;
                                dmMProvider.fdmImpFinanceiroIP_VALOR.Value                      := dmMZeus.cdsZan_M33M33AJ.Value; //StrToFloat(Copy(sLinha, 53, 12)) / 100;

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

                    end;

                  end;

              end;

            end;

            //Item cxancelado em cupom fiscal
            dmMZeus.cdsZan_M36.Close;
            dmMZeus.cdsZan_M36.ProviderName := 'dspZan_M36';

            dmMZeus.fdqZan_M36.SQL.Clear;
            dmMZeus.fdqZan_M36.SQL.Add('select * from zan_m36');
            //data do movimento
            dmMZeus.fdqZan_M36.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M36.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M36.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M36.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M36.Open;
            dmMZeus.cdsZan_M36.ProviderName := '';

            if not dmMZeus.cdsZan_M36.IsEmpty then
            begin

          //    if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 12, 4), 1))) then
              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                dmMProvider.fdmImpCupom.Edit;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value   := dmMZeus.cdsZan_M36M00AC.Value; //StrToIntDef(Copy(sLinha, 12, 4), 1);
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value   := dmMZeus.cdsZan_M36M00Ad.Value;
                dmMProvider.fdmImpCupomSERIE_ECF.Value      := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value           := '';
                dmMProvider.fdmImpCupomTRIBUTACAO.Value     := 0;
                dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := '';
                dmMProvider.fdmImpCupomCFOP.Value           := '';
                dmMProvider.fdmImpCupomEMISSAO.Value        := dmMZeus.cdsZan_M36M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
                dmMProvider.fdmImpCupomBARRAS.Value         := '';
                dmMProvider.fdmImpCupomQUANTIDADE.Value     := dmMZeus.cdsZan_M36M36AO.AsCurrency; //StrToFloatDef(Copy(sLinha, 75, 9), 1) / 1000;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value      := dmMZeus.cdsZan_M36M36AP.Value;  //StrToFloatDef(Copy(sLinha, 84, 12), 1) / 100;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value := dmMZeus.cdsZan_M36M36AQ.Value;  //StrToFloatDef(Copy(sLinha, 96, 12), 1) / 100;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value      := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;

      {          //if StrToInt(Copy(sLinha, 124, 2)) > 24 then
                if dmMZeus.cdsZan_M36M36AS.Value > 24 then
                begin

                  if dmMZeus.cdsZan_M36M36AS.Value = 92 then
                    iHora := (dmMZeus.cdsZan_M36M36AS.Value - 68) div 2
                     // meio dia
                  else
                    iHora := (dmMZeus.cdsZan_M36M36AS.Value - 68);

                  dmMProvider.fdmImpCupomHORA_ABERTURA.Value := StrToTime(IntToStr(iHora) + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value), 3, 2));

                end
                else
                  dmMProvider.fdmImpCupomHORA_ABERTURA.Value  := StrToTime(FormatDateTime('hh:mm',dmMZeus.cdsZan_M36M36AS.Value));
      }

                dmMProvider.fdmImpCupomHORA_ABERTURA.AsDateTime := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value),1,2) //inclu�do em 23/12/2016
                                                                    + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value),3,2),0);

                dmMProvider.fdmImpCupomNUMERO_ITEM.Value  := dmMZeus.cdsZan_M36M36CD.Value; //StrToIntDef(Copy(sLinha, 429, 4), 1);
                dmMProvider.fdmImpCupomSITUACAO.Value     := 1;

              end;

            end;

            dmMZeus.cdsZan_M03.Next;

          end;

          if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M05M00AC.AsInteger)) then
          begin

            dmMProvider.fdmImpReg60M.Append;
            dmMProvider.fdmImpReg60MDATA_EMISSAO.Value      := dmMZeus.cdsZan_M05M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
            dmMProvider.fdmImpReg60MSERIE_ECF.Value         := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
            dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value      := dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger;
            dmMProvider.fdmImpReg60MCOO_INICIAL.Value       := dmMZeus.cdsZan_M05M05AJ.Value; //StrToIntDef(Copy(sLinha, 41, 6), 1);
            dmMProvider.fdmImpReg60MCOO_FINAL.Value         := dmMZeus.cdsZan_M05M00AD.Value;// StrToIntDef(Copy(sLinha, 16, 6), 1);
            dmMProvider.fdmImpReg60MCRZ.Value               := dmMZeus.cdsZan_M05M05AK.Value;// StrToIntDef(Copy(sLinha, 47, 6), 1);
            dmMProvider.fdmImpReg60MCRO.Value               := dmMZeus.cdsZan_M05M05BE.Value;// StrToIntDef(Copy(sLinha, 275, 4), 1);
            dmMProvider.fdmImpReg60MVENDA_BRUTA.Value       := dmMZeus.cdsZan_M05M05AN.Value - dmMZeus.cdsZan_M05M05AM.Value;// ((StrToFloat(Copy(sLinha, 75, 16)) / 100) - (StrToFloat(Copy(sLinha, 59, 16)) / 100));
            dmMProvider.fdmImpReg60MVALOR_GT.Value          := dmMZeus.cdsZan_M05M05AN.Value;// (StrToFloat(Copy(sLinha, 75, 16)) / 100);
            dmMProvider.fdmImpReg60MMODELO_DOCUMENTO.Value  := '2D';

            // cancelamentos
            if dmMZeus.cdsZan_M05M05AO.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'CANC';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05AO.Value;// StrToFloat(Copy(sLinha, 91, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // descontos
            if dmMZeus.cdsZan_M05M05AP.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'DESC';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05AP.Value;// StrToFloat(Copy(sLinha, 103, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // substitui��o
            if dmMZeus.cdsZan_M05M05AS.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'F';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05AS.Value;// StrToFloat(Copy(sLinha, 139, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // isentas
            if dmMZeus.cdsZan_M05M05AT.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'I';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05AT.Value;// StrToFloat(Copy(sLinha, 151, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // n�o tributadas
            if dmMZeus.cdsZan_M05M05AU.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'N';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05AU.Value;// StrToFloat(Copy(sLinha, 163, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

          end;

          // primeira aliq
          if dmMZeus.cdsZan_M05M05XAJ.Value> 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAJ.Value * 100);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAK.Value; //StrToFloat(Copy(sLinha, 46, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '01';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // segunda aliq
        //      if StrToFloat(Copy(sLinha, 59, 4)) > 0 then
          if dmMZeus.cdsZan_M05M05XAL.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAL.Value * 100); //Copy(sLinha, 59, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAM.Value; //StrToFloat(Copy(sLinha, 63, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '02';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // terceira aliq
        //      if StrToFloat(Copy(sLinha, 76, 4)) > 0 then
          if dmMZeus.cdsZan_M05M05XAN.Value > 0 then

          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAN.Value * 100); //Copy(sLinha, 76, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAO.Value; //StrToFloat(Copy(sLinha, 80, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '03';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // quarta aliq
          if dmMZeus.cdsZan_M05M05XAP.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAP.Value * 100); //Copy(sLinha, 93, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAQ.Value; //StrToFloat(Copy(sLinha, 97, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '04';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // quinta aliq
          if dmMZeus.cdsZan_M05M05XAR.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAR.Value * 100); //Copy(sLinha, 110, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAS.Value; //StrToFloat(Copy(sLinha, 114, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '05';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // sexta aliq
          if dmMZeus.cdsZan_M05M05XAT.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAT.Value * 100); //Copy(sLinha, 127, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAU.Value; //StrToFloat(Copy(sLinha, 131, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '06';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // setima aliq
          if dmMZeus.cdsZan_M05M05XAV.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAV.Value * 100); //Copy(sLinha, 144, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAW.Value; //StrToFloat(Copy(sLinha, 148, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '07';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // oitava aliq
          if dmMZeus.cdsZan_M05M05XAX.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAX.Value * 100); //Copy(sLinha, 161, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XAY.Value; //StrToFloat(Copy(sLinha, 165, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '08';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // nota aliq
          if dmMZeus.cdsZan_M05M05XAZ.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XAZ.Value * 100); //Copy(sLinha, 178, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XBA.Value; //StrToFloat(Copy(sLinha, 182, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '09';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // decima aliq
          if dmMZeus.cdsZan_M05M05XBB.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M05M05XBB.Value * 100); //Copy(sLinha, 195, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M05M05XBC.Value; //StrToFloat(Copy(sLinha, 199, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '10';
            dmMProvider.fdmImpReg60A.Post;

          end;

          dmMZeus.cdsZan_M05.Next;

        end;

        if dmMProvider.fdmImpCupom.State in [dsEdit, dsInsert] then
          dmMProvider.fdmImpCupom.Post;

        Application.ProcessMessages;

      end;
   46:begin

        iTipoRegistro := 0;
        iHora         := 0;
        tsArquivo     := TStringList.Create;

      //  tsArquivo.LoadFromFile(sPath + sArquivo);

        dmMProvider.fdmImpCupom.Close;
        dmMProvider.fdmImpCupom.Open;

        dmMProvider.fdmImpCheque.Close;
        dmMProvider.fdmImpCheque.Open;

        dmMProvider.fdmImpReg60M.Close;
        dmMProvider.fdmImpReg60M.Open;

        dmMProvider.fdmPedidoZeus.Close;
        dmMProvider.fdmPedidoZeus.Open;

        dmMProvider.fdmFinalizadoras.Close;
        dmMProvider.fdmFinalizadoras.Open;

        dmMProvider.fdmFinalizadoraPedido.Close;
        dmMProvider.fdmFinalizadoraPedido.Open;

        dmMProvider.fdmImpReg60M.Close;
        dmMProvider.fdmImpReg60M.Open;

        dmMProvider.fdmImpReg60A.Close;
        dmMProvider.fdmImpReg60A.Open;

        if pAutomacao then
          frmAutomacao.pgbProgressoGeralImp.Max   := dmMZeus.cdsZan_M46.RecordCount;

        //M�dulo Fiscal � 1� parte
        while not dmMZeus.cdsZan_M46.Eof do
        begin

          if pAutomacao then
          begin

            frmAutomacao.pgbProgressoGeralImp.Position  := dmMZeus.cdsZan_M46.RecNo;
            frmAutomacao.lblMsgProgresso.Visible        := True;
            frmAutomacao.lblMsgProgresso.Caption        := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMZeus.cdsZan_M46.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoGeralImp.Max);
            Application.ProcessMessages;

          end;

          // Item vendido em cupom fiscal
          dmMZeus.cdsZan_M03.Close;
          dmMZeus.cdsZan_M03.ProviderName := 'dspZan_M03';

          dmMZeus.fdqZan_M03.SQL.Clear;
          dmMZeus.fdqZan_M03.SQL.Add('select * from zan_m03');
          //data do movimento
          dmMZeus.fdqZan_M03.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
          //loja
          dmMZeus.fdqZan_M03.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
          //numero caixa
          dmMZeus.fdqZan_M03.SQL.Add('and m00ac = ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value));
          //CRZ
          dmMZeus.fdqZan_M03.SQL.Add('and m03cv = ' + IntToStr(dmMZeus.cdsZan_M46M46BH.AsInteger));

          dmMZeus.cdsZan_M03.Open;
          dmMZeus.cdsZan_M03.ProviderName := '';

          if pAutomacao then
            frmAutomacao.pgbProgressoImportacao.Max := dmMZeus.cdsZan_M03.RecordCount;

          while not dmMZeus.cdsZan_M03.Eof do
          begin

            if pAutomacao then
            begin

              frmAutomacao.pgbProgressoImportacao.Position := dmMZeus.cdsZan_M03.RecNo;
              frmAutomacao.lblMsgProgresso.Visible := True;
              frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMZeus.cdsZan_M03.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max)+ #13
                                                                                             + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + '/' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value ;
              Application.ProcessMessages;

            end;

            //n�mero da fun��o
            if (dmMZeus.cdsZan_M03M03AE.Value <> 147) and (dmMZeus.cdsZan_M03M03AE.Value <> 1147) then
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                if Length(Trim(dmMZeus.cdsZan_M03M03AH.AsString)) <= 13 then
                begin

                  if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger = 0 then
                  begin

                    sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                    if Length(sBarras) < 8 then
                      sBarras := GerarCodigodeBarras(FormatFloat('000000000000',StrToFloat(Copy(Trim(dmMZeus.cdsZan_M03M03AH.AsString), 1,(Length(dmMZeus.cdsZan_M03M03AH.AsString))))))
                    else
                      sBarras := FormatFloat('0000000000000', StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                  end
                  else
                    sBarras := FormatFloat('0000000000000',StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                end
                else
                  sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                dmMProvider.fdmImpCupom.Append;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMZeus.cdsZan_M03M00AC.AsInteger;
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMZeus.cdsZan_M03M00AD.AsInteger;
                dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value         := '5102';

                dmMProvider.cdsTributacao.Close;
                dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

                dmDBEXMaster.fdqTributacao.SQL.Clear;
                dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');

                if (dmMZeus.cdsZan_M03M03AY.Value > 0) then
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE ALIQUOTA = ' + FloatToStr(dmMZeus.cdsZan_M03M03AY.Value))
                else
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE CODIGOECF = ' + QuoTedStr(FormatFloat('00',dmMZeus.cdsZan_M03M03AJ.Value)));

                dmMProvider.cdsTributacao.Open;
                dmMProvider.cdsTributacao.ProviderName := '';

                dmMProvider.fdmImpCupomTRIBUTACAO.Value   := dmMProvider.cdsTributacaoTRIBUTACAO.AsInteger;

                //al�quota
                if (dmMZeus.cdsZan_M03M03AY.Value > 0) then
                begin

                  //c�digo da tributa��o
                  if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                  begin

                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                    dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                  end
                  else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                  else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                  else
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value * 100);

                end
                else
                begin

                  if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                  begin

                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                    dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                  end
                  else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                  else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                  else
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value * 100);

                end;

                dmMProvider.fdmImpCupomEMISSAO.Value            := dmMZeus.cdsZan_M03M00AF.AsDateTime;
                dmMProvider.fdmImpCupomBARRAS.Value             := sBarras;
                dmMProvider.fdmImpCupomQUANTIDADE.Value         := dmMZeus.cdsZan_M03M03AO.Value;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value          := dmMZeus.cdsZan_M03M03AP.Value - dmMZeus.cdsZan_M03M03AQ.Value;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value     :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value     := dmMZeus.cdsZan_M03M03AQ.Value;
      //          dmMProvider.fdmImpCupomSUB_TOTAL.Value          := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
                dmMProvider.fdmImpCupomHORA_ABERTURA.AsDateTime := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),1,2) //inclu�do em 07/11/2016
                                                                    + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),3,2),0);
                dmMProvider.fdmImpCupomNUMERO_ITEM.Value      := dmMZeus.cdsZan_M03M03CD.Value;

                dmMZeus.cdsZan_M01.Close;
                dmMZeus.cdsZan_M01.ProviderName := 'dspZan_M01';

                dmMZeus.fdqZan_M01.SQL.Clear;
                dmMZeus.fdqZan_M01.SQL.Add('select * from Zan_M01');
                dmMZeus.fdqZan_M01.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', dmMZeus.cdsZan_M03M00AF.AsDateTime)));
                dmMZeus.fdqZan_M01.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.AsInteger));
                dmMZeus.fdqZan_M01.SQL.Add('and m00ac = ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value));

                dmMZeus.cdsZan_M01.Open;
                dmMZeus.cdsZan_M01.ProviderName := '';

                if dmMZeus.cdsZan_M01cupom_cancelamento.Value <= 0 then
                  dmMProvider.fdmImpCupomSITUACAO.Value := 0
                else
                  dmMProvider.fdmImpCupomSITUACAO.Value := 1;

              end;

            end;
            {else if (dmMZeus.cdsZan_M03M03AE.Value = 147) then
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                if Length(Trim(dmMZeus.cdsZan_M03M03AH.AsString)) <= 13 then
                begin

                  if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger = 0 then
                  begin

                    sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                    if Length(sBarras) < 8 then
                      sBarras := GerarCodigodeBarras(Copy(Trim(dmMZeus.cdsZan_M03M03AH.AsString), 1,(Length(dmMZeus.cdsZan_M03M03AH.AsString) - 1)))
                    else
                      sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);

                  end
                  else
                    sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);
                end
                else
                  sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);

                dmMProvider.fdmImpCupom.Append;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMZeus.cdsZan_M03M00AC.AsInteger;
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMZeus.cdsZan_M03M00AD.AsInteger;
                dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value         := '5102';

                if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                begin

                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                  dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                end
                else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                else
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value);

                dmMProvider.fdmImpCupomEMISSAO.Value              := dmMZeus.cdsZan_M03M00AF.AsDateTime;
                dmMProvider.fdmImpCupomBARRAS.Value               := sBarras;
                dmMProvider.fdmImpCupomQUANTIDADE.Value           := dmMZeus.cdsZan_M03M03AO.Value;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value            := dmMZeus.cdsZan_M03M03AP.Value;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value       :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value       := dmMZeus.cdsZan_M03M03AQ.Value / 100;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value            := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
                dmMProvider.fdmImpCupomHORA_ABERTURA.Value        := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),1,2) //inclu�do em 07/11/2016
                                                                      + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),3,2),0);
                dmMProvider.fdmImpCupomNUMERO_ITEM.Value          := dmMZeus.cdsZan_M03M03CD.Value;
                dmMProvider.fdmImpCupomQUANTIDADE_CANCELADA.Value := StrToFloatDef(Copy(sLinha, 91, 9), 0)    / 1000;
                dmMProvider.fdmImpCupomVALOR_CANCELADO.Value      := StrToFloatDef(Copy(sLinha, 100, 12), 0)  / 100;
                dmMProvider.fdmImpCupomSITUACAO.Value             := 1

              end;

            end;}

          {
          dmMZeus.cdsZan_M01.Close;
          dmMZeus.cdsZan_M01.ProviderName := 'dspZan_M01';

          dmMZeus.fdqZan_M01.SQL.Clear;
          dmMZeus.fdqZan_M01.SQL.Add('select * from zan_m01');
          //data do movimento
          dmMZeus.fdqZan_M01.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', frmAutomacao.dtpMovimentoImportacao.Date)));
          //loja
          dmMZeus.fdqZan_M01.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
          //CRZ
          dmMZeus.fdqZan_M01.SQL.Add('and m01bs = ' + IntToStr(dmMZeus.cdsZan_M05M05BH.AsInteger));

          dmMZeus.cdsZan_M01.Open;
          dmMZeus.cdsZan_M01.ProviderName := '';

          frmAutomacao.pgbProgressoImportacao.Max := dmMZeus.cdsZan_M01.RecordCount;

          if not dmMZeus.cdsZan_M01.IsEmpty then
          begin

            frmAutomacao.pgbProgressoImportacao.Position := i;

            frmAutomacao.lblMsgProgresso.Visible := True;
            frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(i+1) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max);
            Application.ProcessMessages;

            dmMProvider.fdmImpCupom.Close;
            dmMProvider.fdmImpCupom.Open;

            if dmMZeus.cdsZan_M01M01AG.AsInteger = 147 then  //tipo de venda
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M01M00AC.AsInteger)) then
              begin

                dmMProvider.fdmImpCupom.First;

                if dmMProvider.fdmImpCupom.Locate('SERIE_ECF;NUMERO_CUPOM',VarArrayOf([dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value,StrToInt(Copy(sLinha, 487, 6))]),[loPartialKey, loCaseinsensitive]) then
                begin

                  while not dmMProvider.fdmImpCupom.Eof do
                  begin

                    if (dmMProvider.fdmImpCupomSERIE_ECF.Value = dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value) and (dmMProvider.fdmImpCupomNUMERO_CUPOM.Value = StrToInt(Copy(sLinha, 487, 6)))then
                    begin

                      dmMProvider.fdmImpCupom.edit;
                      dmMProvider.fdmImpCupomSITUACAO.Value := 2;
                      dmMProvider.fdmImpCupom.post;
                      dmMProvider.fdmImpCupom.next;

                    end
                    else
                      break;

                  end;
                end;


                 end;}

            //Finalizadora utilizada em cupom fiscal
            dmMZeus.cdsZan_M02.Close;
            dmMZeus.cdsZan_M02.ProviderName := 'dspZan_M02';

            dmMZeus.fdqZan_M02.SQL.Clear;
            dmMZeus.fdqZan_M02.SQL.Add('select * from zan_m02');
            //data do movimento
            dmMZeus.fdqZan_M02.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M02.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M02.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M02.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M02.Open;
            dmMZeus.cdsZan_M02.ProviderName := '';

            sFinalizadora := IntToStr(dmMZeus.cdsZan_M02M02AI.Value);

            dmMProvider.fdmFinalizadoras.Append;
            dmMProvider.fdmFinalizadorasCOD_FINALIZADORA.Value  := FormatFloat('00',dmMZeus.cdsZan_M02M02AI.Value);
            dmMProvider.fdmFinalizadorasVALOR.Value             := dmMZeus.cdsZan_M02M02AK.Value;
            dmMProvider.fdmFinalizadoras.Post;

            case dmMProvider.cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.Value of
              1:begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

                  if not dmMProvider.cdsFormasPagamento.IsEmpty then
                  begin

                    case dmMProvider.cdsFormasPagamentoTIPO.Value of
                      2:begin // cheque

                          dmMProvider.fdmImpCheque.Append;

                          if Length(Trim(dmMZeus.cdsZan_M02M02AM.Value)) <= 6 then
                          begin

                            sCliente := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M02M02AM.Value)));

                            if sCliente <> '0' then
                            begin

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                              dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := '';

                            end;

                          end
                          else if Length(Trim(dmMZeus.cdsZan_M02M02AM.Value))  > 6 then
                          begin

                            sCliente := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M02M02AM.Value)));

                            if sCliente <> '0' then
                            begin

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                              dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := '';

                            end;

                          end;

                          if not dmMProvider.cdsPesqClientes.IsEmpty then
                          begin

                            dmMProvider.fdmImpCheque.Append;
                            dmMProvider.fdmImpChequeCLIENTE.Value         := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                            dmMProvider.fdmImpChequeDATA.Value            := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;
                            dmMProvider.fdmImpChequeCUPOM.Value           := dmMProvider.fdmImpCupomNUMERO_CUPOM.AsInteger;
                            dmMProvider.fdmImpChequeVALOR.Value           := dmMZeus.cdsZan_M02M02AK.Value;
                            dmMProvider.fdmImpChequePL_CONTAS.Value       := dmMProvider.cdsFormasPagamentoPLANODECONTAS.AsInteger;
                            dmMProvider.fdmImpChequeITEM_PL_CONTAS.Value  := dmMProvider.cdsFormasPagamentoITEMPLANODECONTAS.AsInteger;
                            dmMProvider.fdmImpChequeLANCAMENTO.Value      := dmMProvider.cdsFormasPagamentoLANCAMENTO.AsInteger;

                            if dmMZeus.cdsZan_M02M02AS.AsDateTime > 0 then
                              dmMProvider.fdmImpChequeVENCIMENTO.AsDateTime  := dmMZeus.cdsZan_M02M02AS.AsDateTime
                            else
                              dmMProvider.fdmImpChequeVENCIMENTO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            if Copy(dmMZeus.cdsZan_M02M02BO.Value, Length(Trim(dmMZeus.cdsZan_M02M02BO.Value)), 1) = '2' then
                            begin // digita��o da linha cmc7

                              dmMProvider.fdmImpChequeBANCO.Value         := StrToIntDef(Copy(dmMZeus.cdsZan_M02M02BO.Value,1,3),0); //StrToInt(Copy(sLinha, 362, 3));
                              dmMProvider.fdmImpChequeAGENCIA.AsString    := Copy(dmMZeus.cdsZan_M02M02BO.Value,4,4);//Copy(sLinha, 365, 4);
                              dmMProvider.fdmImpChequeCONTA.AsString      := Copy(dmMZeus.cdsZan_M02M02BO.Value,23,24);//FloatToStr(StrToFloat(Trim(Copy(sLinha, 384, 24))));
                              dmMProvider.fdmImpChequeCHEQUE.AsString     := Copy(dmMZeus.cdsZan_M02M02BO.Value,11,6);//Copy(sLinha, 373, 6);
                              dmMProvider.fdmImpChequeEMISSAO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            end
                            else if Copy(dmMZeus.cdsZan_M02M02BO.Value, Length(Trim(dmMZeus.cdsZan_M02M02BO.Value)), 1) = '1' then
                            begin // digita��o da 1 linha

                              dmMProvider.fdmImpChequeBANCO.AsInteger     := StrToIntDef(Copy(dmMZeus.cdsZan_M02M02BO.Value,4,3),0); //StrToInt(Copy(sLinha, 365, 3));
                              dmMProvider.fdmImpChequeAGENCIA.AsString    := Copy(dmMZeus.cdsZan_M02M02BO.Value,8,4); //Copy(sLinha, 368, 4);
                              dmMProvider.fdmImpChequeCONTA.AsString      := Copy(dmMZeus.cdsZan_M02M02BO.Value,11,12); //FloatToStr(StrToFloat(Copy(sLinha, 372, 12)));
                              dmMProvider.fdmImpChequeCHEQUE.AsString     := Copy(dmMZeus.cdsZan_M02M02BO.Value,23,24); //FloatToStr(StrToFloat(Trim(Copy(sLinha, 384, 24))));
                              dmMProvider.fdmImpChequeEMISSAO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            end;

                          end;

                        end;

                    end;

                  end;

                end;

            end;

            // Altera��o de situa��o do pedido (uso interno)
            dmMZeus.cdsZan_M20.Close;
            dmMZeus.cdsZan_M20.ProviderName := 'dspZan_M20';

            dmMZeus.fdqZan_M20.SQL.Clear;
            dmMZeus.fdqZan_M20.SQL.Add('select * from zan_m20');
            //data do movimento
            dmMZeus.fdqZan_M20.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M20.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M20.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M20.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M20.Open;
            dmMZeus.cdsZan_M20.ProviderName := '';

            //if StrToIntDef(Copy(sLinha, 41, 11),0) > 0 then
            if StrToFloatDef(dmMZeus.cdsZan_M20M20AH.Value,0) > 0 then
            begin

              dmMProvider.fdmPedidoZeus.Append;
              dmMProvider.fdmPedidoZeusNUMERO_PEDIDO.Value    := StrToInt(dmMZeus.cdsZan_M20M20AH.Value); //StrToInt(Copy(sLinha, 41, 11));
              dmMProvider.fdmPedidoZeusSTATUS_PEDIDO.Value    := dmMZeus.cdsZan_M20M20AI.Value; //StrToInt(Copy(sLinha, 52, 1));
              dmMProvider.fdmPedidoZeus.Post;

              if not dmMProvider.fdmFinalizadoras.IsEmpty then
              begin

                dmMProvider.fdmFinalizadoras.First;

                while not dmMProvider.fdmFinalizadoras.Eof do
                begin

                  dmMProvider.fdmFinalizadoraPedido.Append;
                  dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value := dmMProvider.fdmFinalizadorasCOD_FINALIZADORA.Value;
                  dmMProvider.fdmFinalizadoraPedidoVALOR.Value            := dmMProvider.fdmFinalizadorasVALOR.Value;
                  dmMProvider.fdmFinalizadoraPedidoCODIGO_PEDIDO.Value    := dmMProvider.fdmPedidoZeusNUMERO_PEDIDO.Value;
                  dmMProvider.fdmFinalizadoraPedido.Post;;

                  dmMProvider.fdmFinalizadoras.Next;

                end;

              end;

            end;

            case dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger  of
              1:begin

                  //Movimenta��o de limite de cr�dito
                  dmMZeus.cdsZan_M33.Close;
                  dmMZeus.cdsZan_M33.ProviderName := 'dspZan_M33';

                  dmMZeus.fdqZan_M33.SQL.Clear;
                  dmMZeus.fdqZan_M33.SQL.Add('select * from zan_m33');
                  //data do movimento
                  dmMZeus.fdqZan_M33.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
                  //loja
                  dmMZeus.fdqZan_M33.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
                  //numero do equipamento
                  dmMZeus.fdqZan_M33.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
                  //COO
                  dmMZeus.fdqZan_M33.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

                  dmMZeus.cdsZan_M33.Open;
                  dmMZeus.cdsZan_M33.ProviderName := '';

                  if not dmMZeus.cdsZan_M33.IsEmpty then
                  begin

                    dmMProvider.cdsFormasPagamento.Close;
                    dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                    dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                    dmDBEXMaster.fdqFormasPagamento.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                    dmDBEXMaster.fdqFormasPagamento.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);

                    dmMProvider.cdsFormasPagamento.Open;
                    dmMProvider.cdsFormasPagamento.ProviderName := '';

                    if not dmMProvider.cdsFormasPagamento.IsEmpty then
                    begin

                      case dmMProvider.cdsFormasPagamentoTIPO.AsInteger of
                        10:begin

          //                  sCliente := FloatToStr(StrToFloat(Copy(sLinha, 36, 16)));
                              sCliente := FloatToStr(StrToFloatDef(dmMZeus.cdsZan_M33M33AH.Value,0));

                              if Length(sCliente) <= 6 then
                              begin

                                if sCliente <> '0' then
                                begin

                                  dmMProvider.cdsPesqClientes.Close;
                                  dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                                  dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);

                                  dmMProvider.cdsPesqClientes.Open;
                                  dmMProvider.cdsPesqClientes.ProviderName := '';

                                end;

                              end
                              else if Length(FloatToStr(StrToFloat(sCliente))) > 6 then
                              begin

                                if Length(FloatToStr(StrToFloat(sCliente))) < 14 then
                                  sCliente := FormatFloat('00000000000',StrToFloat(sCliente));

                                if sCliente <> '0' then
                                begin

                                  dmMProvider.cdsPesqClientes.Close;
                                  dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                                  dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));

                                  dmMProvider.cdsPesqClientes.Open;
                                  dmMProvider.cdsPesqClientes.ProviderName := '';

                                end;

                              end;

                              if not dmMProvider.cdsPesqClientes.IsEmpty then
                              begin

                                dmMProvider.fdmImpFinanceiro.Append;
                                dmMProvider.fdmImpFinanceiroIP_CRE.AsInteger                    := -1;
                                dmMProvider.fdmImpFinanceiroIP_FILIAL.AsInteger                 := dmDBEXMaster.iIdFilial;
                                dmMProvider.fdmImpFinanceiroIP_DOCUMENTO.Value                  := IntToStr(dmMZeus.cdsZan_M33M00AD.Value); // Copy(sLinha, 16, 6);
                                dmMProvider.fdmImpFinanceiroIP_SITUACAO.AsInteger               := 0;
                                dmMProvider.fdmImpFinanceiroIP_DATA_ENTRADA.AsDateTime          := Date;
                                dmMProvider.fdmImpFinanceiroIP_SACADO.AsInteger                 := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                                dmMProvider.fdmImpFinanceiroIP_TIPO.AsInteger                   := 0;
                                dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime          := dmMZeus.cdsZan_M33M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
                                dmMProvider.fdmImpFinanceiroIP_DATA_VENCIMENTO.AsDateTime       := dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime + 30;
                                dmMProvider.fdmImpFinanceiroIP_MOEDA.AsInteger                  := 0;
                                dmMProvider.fdmImpFinanceiroIP_VALOR.Value                      := dmMZeus.cdsZan_M33M33AJ.Value; //StrToFloat(Copy(sLinha, 53, 12)) / 100;

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

                    end;

                  end;

              end;

            end;

            //Movimenta��o de limite de cr�dito
            dmMZeus.cdsZan_M36.Close;
            dmMZeus.cdsZan_M36.ProviderName := 'dspZan_M36';

            dmMZeus.fdqZan_M36.SQL.Clear;
            dmMZeus.fdqZan_M36.SQL.Add('select * from zan_m36');
            //data do movimento
            dmMZeus.fdqZan_M36.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M36.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M36.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M36.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M36.Open;
            dmMZeus.cdsZan_M36.ProviderName := '';

            if not dmMZeus.cdsZan_M36.IsEmpty then
            begin

          //    if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 12, 4), 1))) then
              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                dmMProvider.fdmImpCupom.Edit;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value   := dmMZeus.cdsZan_M36M00AC.Value; //StrToIntDef(Copy(sLinha, 12, 4), 1);
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value   := dmMZeus.cdsZan_M36M00Ad.Value;
                dmMProvider.fdmImpCupomSERIE_ECF.Value      := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value           := '';
                dmMProvider.fdmImpCupomTRIBUTACAO.Value     := 0;
                dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := '';
                dmMProvider.fdmImpCupomCFOP.Value           := '';
                dmMProvider.fdmImpCupomEMISSAO.Value        := dmMZeus.cdsZan_M36M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
                dmMProvider.fdmImpCupomBARRAS.Value         := '';
                dmMProvider.fdmImpCupomQUANTIDADE.Value     := dmMZeus.cdsZan_M36M36AO.AsCurrency; //StrToFloatDef(Copy(sLinha, 75, 9), 1) / 1000;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value      := dmMZeus.cdsZan_M36M36AP.Value;  //StrToFloatDef(Copy(sLinha, 84, 12), 1) / 100;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value := dmMZeus.cdsZan_M36M36AQ.Value;  //StrToFloatDef(Copy(sLinha, 96, 12), 1) / 100;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value      := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;

      {          //if StrToInt(Copy(sLinha, 124, 2)) > 24 then
                if dmMZeus.cdsZan_M36M36AS.Value > 24 then
                begin

                  if dmMZeus.cdsZan_M36M36AS.Value = 92 then
                    iHora := (dmMZeus.cdsZan_M36M36AS.Value - 68) div 2
                     // meio dia
                  else
                    iHora := (dmMZeus.cdsZan_M36M36AS.Value - 68);

                  dmMProvider.fdmImpCupomHORA_ABERTURA.Value := StrToTime(IntToStr(iHora) + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value), 3, 2));

                end
                else
                  dmMProvider.fdmImpCupomHORA_ABERTURA.Value  := StrToTime(FormatDateTime('hh:mm',dmMZeus.cdsZan_M36M36AS.Value));
      }

                dmMProvider.fdmImpCupomHORA_ABERTURA.AsDateTime := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value),1,2) //inclu�do em 23/12/2016
                                                                    + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value),3,2),0);

                dmMProvider.fdmImpCupomNUMERO_ITEM.Value  := dmMZeus.cdsZan_M36M36CD.Value; //StrToIntDef(Copy(sLinha, 429, 4), 1);
                dmMProvider.fdmImpCupomSITUACAO.Value     := 1;

              end;

            end;

            dmMZeus.cdsZan_M03.Next;

          end;

          if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M46M00AC.AsInteger)) then
          begin

            dmMProvider.fdmImpReg60M.Append;
            dmMProvider.fdmImpReg60MDATA_EMISSAO.Value      := dmMZeus.cdsZan_M46M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
            dmMProvider.fdmImpReg60MSERIE_ECF.Value         := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
            dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value      := dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger;
            dmMProvider.fdmImpReg60MCOO_INICIAL.Value       := dmMZeus.cdsZan_M46M46AJ.Value; //StrToIntDef(Copy(sLinha, 41, 6), 1);
            dmMProvider.fdmImpReg60MCOO_FINAL.Value         := dmMZeus.cdsZan_M46M00AD.Value;// StrToIntDef(Copy(sLinha, 16, 6), 1);
            dmMProvider.fdmImpReg60MCRZ.Value               := dmMZeus.cdsZan_M46M46BH.Value;// StrToIntDef(Copy(sLinha, 47, 6), 1);
            dmMProvider.fdmImpReg60MCRO.Value               := dmMZeus.cdsZan_M46M46BE.Value;// StrToIntDef(Copy(sLinha, 275, 4), 1);
            dmMProvider.fdmImpReg60MVENDA_BRUTA.Value       := dmMZeus.cdsZan_M46M46AN.Value - dmMZeus.cdsZan_M46M46AM.Value;// ((StrToFloat(Copy(sLinha, 75, 16)) / 100) - (StrToFloat(Copy(sLinha, 59, 16)) / 100));
            dmMProvider.fdmImpReg60MVALOR_GT.Value          := dmMZeus.cdsZan_M46M46AN.Value;// (StrToFloat(Copy(sLinha, 75, 16)) / 100);
            dmMProvider.fdmImpReg60MMODELO_DOCUMENTO.Value  := '2D';

            // cancelamentos
            if dmMZeus.cdsZan_M46M46AO.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'CANC';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46AO.Value;// StrToFloat(Copy(sLinha, 91, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // descontos
            if dmMZeus.cdsZan_M46M46AP.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'DESC';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46AP.Value;// StrToFloat(Copy(sLinha, 103, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // substitui��o
            if dmMZeus.cdsZan_M46M46AS.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'F';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46AS.Value;// StrToFloat(Copy(sLinha, 139, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // isentas
            if dmMZeus.cdsZan_M46M46AT.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'I';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46AT.Value;// StrToFloat(Copy(sLinha, 151, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // n�o tributadas
            if dmMZeus.cdsZan_M46M46AU.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'N';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46AU.Value;// StrToFloat(Copy(sLinha, 163, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

          end;

          // primeira aliq
          if dmMZeus.cdsZan_M46M46XAJ.Value> 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAJ.Value * 100);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAK.Value; //StrToFloat(Copy(sLinha, 46, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '01';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // segunda aliq
        //      if StrToFloat(Copy(sLinha, 59, 4)) > 0 then
          if dmMZeus.cdsZan_M46M46XAL.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAL.Value * 100); //Copy(sLinha, 59, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAM.Value; //StrToFloat(Copy(sLinha, 63, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '02';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // terceira aliq
        //      if StrToFloat(Copy(sLinha, 76, 4)) > 0 then
          if dmMZeus.cdsZan_M46M46XAN.Value > 0 then

          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAN.Value * 100); //Copy(sLinha, 76, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAO.Value; //StrToFloat(Copy(sLinha, 80, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '03';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // quarta aliq
          if dmMZeus.cdsZan_M46M46XAP.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAP.Value * 100); //Copy(sLinha, 93, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAQ.Value; //StrToFloat(Copy(sLinha, 97, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '04';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // quinta aliq
          if dmMZeus.cdsZan_M46M46XAR.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAR.Value * 100); //Copy(sLinha, 110, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAS.Value; //StrToFloat(Copy(sLinha, 114, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '05';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // sexta aliq
          if dmMZeus.cdsZan_M46M46XAT.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAT.Value * 100); //Copy(sLinha, 127, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAU.Value; //StrToFloat(Copy(sLinha, 131, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '06';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // setima aliq
          if dmMZeus.cdsZan_M46M46XAV.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAV.Value * 100); //Copy(sLinha, 144, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAW.Value; //StrToFloat(Copy(sLinha, 148, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '07';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // oitava aliq
          if dmMZeus.cdsZan_M46M46XAX.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAX.Value * 100); //Copy(sLinha, 161, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XAY.Value; //StrToFloat(Copy(sLinha, 165, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '08';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // nota aliq
          if dmMZeus.cdsZan_M46M46XAZ.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XAZ.Value * 100); //Copy(sLinha, 178, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XBA.Value; //StrToFloat(Copy(sLinha, 182, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '09';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // decima aliq
          if dmMZeus.cdsZan_M46M46XBB.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M46M46XBB.Value * 100); //Copy(sLinha, 195, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M46M46XBC.Value; //StrToFloat(Copy(sLinha, 199, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '10';
            dmMProvider.fdmImpReg60A.Post;

          end;

          dmMZeus.cdsZan_M46.Next;

        end;

        if dmMProvider.fdmImpCupom.State in [dsEdit, dsInsert] then
          dmMProvider.fdmImpCupom.Post;

        Application.ProcessMessages;

      end;
   51:begin

        iTipoRegistro := 0;
        iHora         := 0;
        tsArquivo     := TStringList.Create;

      //  tsArquivo.LoadFromFile(sPath + sArquivo);

        if pAutomacao then
          frmAutomacao.pgbProgressoGeralImp.Max   := dmMZeus.cdsZan_M0_51.RecordCount;

        //M�dulo Fiscal � 1� parte
        while not dmMZeus.cdsZan_M0_51.Eof do
        begin

          if pAutomacao then
          begin

            frmAutomacao.pgbProgressoGeralImp.Position := dmMZeus.cdsZan_M0_51.RecNo;
            frmAutomacao.lblMsgProgresso.Visible := True;
            frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMZeus.cdsZan_M0_51.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoGeralImp.Max);
            Application.ProcessMessages;

          end;

          // Item vendido em cupom fiscal
          dmMZeus.cdsZan_M03.Close;
          dmMZeus.cdsZan_M03.ProviderName := 'dspZan_M03';

          dmMZeus.fdqZan_M03.SQL.Clear;
          dmMZeus.fdqZan_M03.SQL.Add('select * from zan_m03');
          //data do movimento
          dmMZeus.fdqZan_M03.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
          //loja
          dmMZeus.fdqZan_M03.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
          //serie ecf
          dmMZeus.fdqZan_M03.SQL.Add('and m00ac = ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value));
//          //CRZ
//          dmMZeus.fdqZan_M03.SQL.Add('and m03cv = ' + IntToStr(dmMZeus.cdsZan_M0_51M05AK.AsInteger));

          dmMZeus.cdsZan_M03.Open;
          dmMZeus.cdsZan_M03.ProviderName := '';

          if pAutomacao then
            frmAutomacao.pgbProgressoImportacao.Max := dmMZeus.cdsZan_M03.RecordCount;

          while not dmMZeus.cdsZan_M03.Eof do
          begin

            if pAutomacao then
            begin

              frmAutomacao.pgbProgressoImportacao.Position := dmMZeus.cdsZan_M03.RecNo;
              frmAutomacao.lblMsgProgresso.Visible := True;
              frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(dmMZeus.cdsZan_M03.RecNo) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max)+ #13
                                                                                             + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value) + '/' + dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value ;
              Application.ProcessMessages;

            end;

            //n�mero da fun��o
            if (dmMZeus.cdsZan_M03M03AE.Value <> 147) and (dmMZeus.cdsZan_M03M03AE.Value <> 1147) then
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                if Length(Trim(dmMZeus.cdsZan_M03M03AH.AsString)) <= 13 then
                begin

                  if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger = 0 then
                  begin

                    sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                    if Length(sBarras) < 8 then
                      sBarras := GerarCodigodeBarras(FormatFloat('000000000000',StrToFloat(Copy(Trim(dmMZeus.cdsZan_M03M03AH.AsString), 1,(Length(dmMZeus.cdsZan_M03M03AH.AsString))))))
                    else
                      sBarras := FormatFloat('0000000000000', StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                  end
                  else
                    sBarras := FormatFloat('0000000000000',StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                end
                else
                  sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                dmMProvider.fdmImpCupom.Append;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMZeus.cdsZan_M03M00AC.AsInteger;
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMZeus.cdsZan_M03M00AD.AsInteger;
                dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value         := '5102';

                dmMProvider.cdsTributacao.Close;
                dmMProvider.cdsTributacao.ProviderName := 'dspTributacao';

                dmDBEXMaster.fdqTributacao.SQL.Clear;
                dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');

                if (dmMZeus.cdsZan_M03M03AY.Value > 0) then
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE ALIQUOTA = ' + FloatToStr(dmMZeus.cdsZan_M03M03AY.Value))
                else
                  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE CODIGOECF = ' + QuoTedStr(FormatFloat('00',dmMZeus.cdsZan_M03M03AJ.Value)));

                dmMProvider.cdsTributacao.Open;
                dmMProvider.cdsTributacao.ProviderName := '';

                dmMProvider.fdmImpCupomTRIBUTACAO.Value   := dmMProvider.cdsTributacaoTRIBUTACAO.AsInteger;

                //al�quota
                if (dmMZeus.cdsZan_M03M03AY.Value > 0) then
                begin

                  //c�digo da tributa��o
                  if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                  begin

                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                    dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                  end
                  else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                  else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                  else
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value * 100);

                end
                else
                begin

                  if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                  begin

                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                    dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                  end
                  else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                  else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                  else
                    dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value * 100);

                end;

                dmMProvider.fdmImpCupomEMISSAO.Value            := dmMZeus.cdsZan_M03M00AF.AsDateTime;
                dmMProvider.fdmImpCupomBARRAS.Value             := sBarras;
                dmMProvider.fdmImpCupomQUANTIDADE.Value         := dmMZeus.cdsZan_M03M03AO.Value;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value          := dmMZeus.cdsZan_M03M03AP.Value - dmMZeus.cdsZan_M03M03AQ.Value;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value     :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value     := dmMZeus.cdsZan_M03M03AQ.Value;
      //          dmMProvider.fdmImpCupomSUB_TOTAL.Value          := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
                dmMProvider.fdmImpCupomHORA_ABERTURA.AsDateTime := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),1,2) //inclu�do em 07/11/2016
                                                                    + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),3,2),0);
                dmMProvider.fdmImpCupomNUMERO_ITEM.Value      := dmMZeus.cdsZan_M03M03CD.Value;

                dmMZeus.cdsZan_M01.Close;
                dmMZeus.cdsZan_M01.ProviderName := 'dspZan_M01';

                dmMZeus.fdqZan_M01.SQL.Clear;
                dmMZeus.fdqZan_M01.SQL.Add('select * from Zan_M01');
                dmMZeus.fdqZan_M01.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', dmMZeus.cdsZan_M03M00AF.AsDateTime)));
                dmMZeus.fdqZan_M01.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.AsInteger));
                dmMZeus.fdqZan_M01.SQL.Add('and m00ac = ' + IntToStr(dmMProvider.cdsConfigECFNUMERO_CAIXA.Value));

                dmMZeus.cdsZan_M01.Open;
                dmMZeus.cdsZan_M01.ProviderName := '';

                if dmMZeus.cdsZan_M01cupom_cancelamento.Value <= 0 then
                  dmMProvider.fdmImpCupomSITUACAO.Value := 0
                else
                  dmMProvider.fdmImpCupomSITUACAO.Value := 1;

              end;

            end;
            {else if (dmMZeus.cdsZan_M03M03AE.Value = 147) then
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                if Length(Trim(dmMZeus.cdsZan_M03M03AH.AsString)) <= 13 then
                begin

                  if dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.AsInteger = 0 then
                  begin

                    sBarras := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M03M03AH.AsString)));

                    if Length(sBarras) < 8 then
                      sBarras := GerarCodigodeBarras(Copy(Trim(dmMZeus.cdsZan_M03M03AH.AsString), 1,(Length(dmMZeus.cdsZan_M03M03AH.AsString) - 1)))
                    else
                      sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);

                  end
                  else
                    sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);
                end
                else
                  sBarras := Trim(dmMZeus.cdsZan_M03M03AH.AsString);

                dmMProvider.fdmImpCupom.Append;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value := dmMZeus.cdsZan_M03M00AC.AsInteger;
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value := dmMZeus.cdsZan_M03M00AD.AsInteger;
                dmMProvider.fdmImpCupomSERIE_ECF.Value    := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value         := '5102';

                if dmMZeus.cdsZan_M03M03AJ.Value = 4 then //substitui��o
                begin

                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := 'F';
                  dmMProvider.fdmImpCupomCFOP.Value           := '5405';

                end
                else if dmMZeus.cdsZan_M03M03AJ.Value = 5 then //isento
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'I'
                else if dmMZeus.cdsZan_M03M03AJ.Value =  6 then //n�o tributado
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := 'N'
                else
                  dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value := FormatFloat('0000',dmMZeus.cdsZan_M03M03AY.Value);

                dmMProvider.fdmImpCupomEMISSAO.Value              := dmMZeus.cdsZan_M03M00AF.AsDateTime;
                dmMProvider.fdmImpCupomBARRAS.Value               := sBarras;
                dmMProvider.fdmImpCupomQUANTIDADE.Value           := dmMZeus.cdsZan_M03M03AO.Value;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value            := dmMZeus.cdsZan_M03M03AP.Value;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value       :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value       := dmMZeus.cdsZan_M03M03AQ.Value / 100;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value            := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;
                dmMProvider.fdmImpCupomHORA_ABERTURA.Value        := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),1,2) //inclu�do em 07/11/2016
                                                                      + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M03M03AS.Value),3,2),0);
                dmMProvider.fdmImpCupomNUMERO_ITEM.Value          := dmMZeus.cdsZan_M03M03CD.Value;
                dmMProvider.fdmImpCupomQUANTIDADE_CANCELADA.Value := StrToFloatDef(Copy(sLinha, 91, 9), 0)    / 1000;
                dmMProvider.fdmImpCupomVALOR_CANCELADO.Value      := StrToFloatDef(Copy(sLinha, 100, 12), 0)  / 100;
                dmMProvider.fdmImpCupomSITUACAO.Value             := 1

              end;

            end;}

          {
          dmMZeus.cdsZan_M01.Close;
          dmMZeus.cdsZan_M01.ProviderName := 'dspZan_M01';

          dmMZeus.fdqZan_M01.SQL.Clear;
          dmMZeus.fdqZan_M01.SQL.Add('select * from zan_m01');
          //data do movimento
          dmMZeus.fdqZan_M01.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', frmAutomacao.dtpMovimentoImportacao.Date)));
          //loja
          dmMZeus.fdqZan_M01.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
          //CRZ
          dmMZeus.fdqZan_M01.SQL.Add('and m01bs = ' + IntToStr(dmMZeus.cdsZan_M05M05BH.AsInteger));

          dmMZeus.cdsZan_M01.Open;
          dmMZeus.cdsZan_M01.ProviderName := '';

          frmAutomacao.pgbProgressoImportacao.Max := dmMZeus.cdsZan_M01.RecordCount;

          if not dmMZeus.cdsZan_M01.IsEmpty then
          begin

            frmAutomacao.pgbProgressoImportacao.Position := i;

            frmAutomacao.lblMsgProgresso.Visible := True;
            frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(i+1) + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max);
            Application.ProcessMessages;

            dmMProvider.fdmImpCupom.Close;
            dmMProvider.fdmImpCupom.Open;

            if dmMZeus.cdsZan_M01M01AG.AsInteger = 147 then  //tipo de venda
            begin

              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M01M00AC.AsInteger)) then
              begin

                dmMProvider.fdmImpCupom.First;

                if dmMProvider.fdmImpCupom.Locate('SERIE_ECF;NUMERO_CUPOM',VarArrayOf([dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value,StrToInt(Copy(sLinha, 487, 6))]),[loPartialKey, loCaseinsensitive]) then
                begin

                  while not dmMProvider.fdmImpCupom.Eof do
                  begin

                    if (dmMProvider.fdmImpCupomSERIE_ECF.Value = dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.Value) and (dmMProvider.fdmImpCupomNUMERO_CUPOM.Value = StrToInt(Copy(sLinha, 487, 6)))then
                    begin

                      dmMProvider.fdmImpCupom.edit;
                      dmMProvider.fdmImpCupomSITUACAO.Value := 2;
                      dmMProvider.fdmImpCupom.post;
                      dmMProvider.fdmImpCupom.next;

                    end
                    else
                      break;

                  end;
                end;


                 end;}

            //Finalizadora utilizada em cupom fiscal
            dmMZeus.cdsZan_M02.Close;
            dmMZeus.cdsZan_M02.ProviderName := 'dspZan_M02';

            dmMZeus.fdqZan_M02.SQL.Clear;
            dmMZeus.fdqZan_M02.SQL.Add('select * from zan_m02');
            //data do movimento
            dmMZeus.fdqZan_M02.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M02.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M02.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M02.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M02.Open;
            dmMZeus.cdsZan_M02.ProviderName := '';

            sFinalizadora := IntToStr(dmMZeus.cdsZan_M02M02AI.Value);

            dmMProvider.fdmFinalizadoras.Append;
            dmMProvider.fdmFinalizadorasCOD_FINALIZADORA.Value  := FormatFloat('00',dmMZeus.cdsZan_M02M02AI.Value);
            dmMProvider.fdmFinalizadorasVALOR.Value             := dmMZeus.cdsZan_M02M02AK.Value;
            dmMProvider.fdmFinalizadoras.Post;

            case dmMProvider.cdsConfig_financeiroIMPORTAR_CHEQUES_PDV.Value of
              1:begin

                  dmMProvider.cdsFormasPagamento.Close;
                  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                  dmDBEXMaster.fdqFormasPagamento.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);

                  dmMProvider.cdsFormasPagamento.Open;
                  dmMProvider.cdsFormasPagamento.ProviderName := '';

                  if not dmMProvider.cdsFormasPagamento.IsEmpty then
                  begin

                    case dmMProvider.cdsFormasPagamentoTIPO.Value of
                      2:begin // cheque

                          dmMProvider.fdmImpCheque.Append;

                          if Length(Trim(dmMZeus.cdsZan_M02M02AM.Value)) <= 6 then
                          begin

                            sCliente := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M02M02AM.Value)));

                            if sCliente <> '0' then
                            begin

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                              dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := '';

                            end;

                          end
                          else if Length(Trim(dmMZeus.cdsZan_M02M02AM.Value))  > 6 then
                          begin

                            sCliente := FloatToStr(StrToFloat(Trim(dmMZeus.cdsZan_M02M02AM.Value)));

                            if sCliente <> '0' then
                            begin

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                              dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                              dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));

                              dmMProvider.cdsPesqClientes.Close;
                              dmMProvider.cdsPesqClientes.ProviderName := '';

                            end;

                          end;

                          if not dmMProvider.cdsPesqClientes.IsEmpty then
                          begin

                            dmMProvider.fdmImpCheque.Append;
                            dmMProvider.fdmImpChequeCLIENTE.Value         := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                            dmMProvider.fdmImpChequeDATA.Value            := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;
                            dmMProvider.fdmImpChequeCUPOM.Value           := dmMProvider.fdmImpCupomNUMERO_CUPOM.AsInteger;
                            dmMProvider.fdmImpChequeVALOR.Value           := dmMZeus.cdsZan_M02M02AK.Value;
                            dmMProvider.fdmImpChequePL_CONTAS.Value       := dmMProvider.cdsFormasPagamentoPLANODECONTAS.AsInteger;
                            dmMProvider.fdmImpChequeITEM_PL_CONTAS.Value  := dmMProvider.cdsFormasPagamentoITEMPLANODECONTAS.AsInteger;
                            dmMProvider.fdmImpChequeLANCAMENTO.Value      := dmMProvider.cdsFormasPagamentoLANCAMENTO.AsInteger;

                            if dmMZeus.cdsZan_M02M02AS.AsDateTime > 0 then
                              dmMProvider.fdmImpChequeVENCIMENTO.AsDateTime  := dmMZeus.cdsZan_M02M02AS.AsDateTime
                            else
                              dmMProvider.fdmImpChequeVENCIMENTO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            if Copy(dmMZeus.cdsZan_M02M02BO.Value, Length(Trim(dmMZeus.cdsZan_M02M02BO.Value)), 1) = '2' then
                            begin // digita��o da linha cmc7

                              dmMProvider.fdmImpChequeBANCO.Value         := StrToIntDef(Copy(dmMZeus.cdsZan_M02M02BO.Value,1,3),0); //StrToInt(Copy(sLinha, 362, 3));
                              dmMProvider.fdmImpChequeAGENCIA.AsString    := Copy(dmMZeus.cdsZan_M02M02BO.Value,4,4);//Copy(sLinha, 365, 4);
                              dmMProvider.fdmImpChequeCONTA.AsString      := Copy(dmMZeus.cdsZan_M02M02BO.Value,23,24);//FloatToStr(StrToFloat(Trim(Copy(sLinha, 384, 24))));
                              dmMProvider.fdmImpChequeCHEQUE.AsString     := Copy(dmMZeus.cdsZan_M02M02BO.Value,11,6);//Copy(sLinha, 373, 6);
                              dmMProvider.fdmImpChequeEMISSAO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            end
                            else if Copy(dmMZeus.cdsZan_M02M02BO.Value, Length(Trim(dmMZeus.cdsZan_M02M02BO.Value)), 1) = '1' then
                            begin // digita��o da 1 linha

                              dmMProvider.fdmImpChequeBANCO.AsInteger     := StrToIntDef(Copy(dmMZeus.cdsZan_M02M02BO.Value,4,3),0); //StrToInt(Copy(sLinha, 365, 3));
                              dmMProvider.fdmImpChequeAGENCIA.AsString    := Copy(dmMZeus.cdsZan_M02M02BO.Value,8,4); //Copy(sLinha, 368, 4);
                              dmMProvider.fdmImpChequeCONTA.AsString      := Copy(dmMZeus.cdsZan_M02M02BO.Value,11,12); //FloatToStr(StrToFloat(Copy(sLinha, 372, 12)));
                              dmMProvider.fdmImpChequeCHEQUE.AsString     := Copy(dmMZeus.cdsZan_M02M02BO.Value,23,24); //FloatToStr(StrToFloat(Trim(Copy(sLinha, 384, 24))));
                              dmMProvider.fdmImpChequeEMISSAO.AsDateTime  := dmMProvider.fdmImpCupomEMISSAO.AsDateTime;

                            end;

                          end;

                        end;

                    end;

                  end;

                end;

            end;

            // Altera��o de situa��o do pedido (uso interno)
            dmMZeus.cdsZan_M20.Close;
            dmMZeus.cdsZan_M20.ProviderName := 'dspZan_M20';

            dmMZeus.fdqZan_M20.SQL.Clear;
            dmMZeus.fdqZan_M20.SQL.Add('select * from zan_m20');
            //data do movimento
            dmMZeus.fdqZan_M20.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M20.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M20.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M20.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M20.Open;
            dmMZeus.cdsZan_M20.ProviderName := '';

            //if StrToIntDef(Copy(sLinha, 41, 11),0) > 0 then
            if StrToFloatDef(dmMZeus.cdsZan_M20M20AH.Value,0) > 0 then
            begin

              dmMProvider.fdmPedidoZeus.Append;
              dmMProvider.fdmPedidoZeusNUMERO_PEDIDO.Value    := StrToInt(dmMZeus.cdsZan_M20M20AH.Value); //StrToInt(Copy(sLinha, 41, 11));
              dmMProvider.fdmPedidoZeusSTATUS_PEDIDO.Value    := dmMZeus.cdsZan_M20M20AI.Value; //StrToInt(Copy(sLinha, 52, 1));
              dmMProvider.fdmPedidoZeus.Post;

              if not dmMProvider.fdmFinalizadoras.IsEmpty then
              begin

                dmMProvider.fdmFinalizadoras.First;

                while not dmMProvider.fdmFinalizadoras.Eof do
                begin

                  dmMProvider.fdmFinalizadoraPedido.Append;
                  dmMProvider.fdmFinalizadoraPedidoCOD_FINALIZADORA.Value := dmMProvider.fdmFinalizadorasCOD_FINALIZADORA.Value;
                  dmMProvider.fdmFinalizadoraPedidoVALOR.Value            := dmMProvider.fdmFinalizadorasVALOR.Value;
                  dmMProvider.fdmFinalizadoraPedidoCODIGO_PEDIDO.Value    := dmMProvider.fdmPedidoZeusNUMERO_PEDIDO.Value;
                  dmMProvider.fdmFinalizadoraPedido.Post;;

                  dmMProvider.fdmFinalizadoras.Next;

                end;

              end;

            end;

            case dmMProvider.cdsConfiguracoesINTEGRAR_IMPORTACAO_VENDA_CRE.AsInteger  of
              1:begin

                  //Movimenta��o de limite de cr�dito
                  dmMZeus.cdsZan_M33.Close;
                  dmMZeus.cdsZan_M33.ProviderName := 'dspZan_M33';

                  dmMZeus.fdqZan_M33.SQL.Clear;
                  dmMZeus.fdqZan_M33.SQL.Add('select * from zan_m33');
                  //data do movimento
                  dmMZeus.fdqZan_M33.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
                  //loja
                  dmMZeus.fdqZan_M33.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
                  //numero do equipamento
                  dmMZeus.fdqZan_M33.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
                  //COO
                  dmMZeus.fdqZan_M33.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

                  dmMZeus.cdsZan_M33.Open;
                  dmMZeus.cdsZan_M33.ProviderName := '';

                  if not dmMZeus.cdsZan_M33.IsEmpty then
                  begin

                    dmMProvider.cdsFormasPagamento.Close;
                    dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

                    dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
                    dmDBEXMaster.fdqFormasPagamento.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                    dmDBEXMaster.fdqFormasPagamento.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);

                    dmMProvider.cdsFormasPagamento.Open;
                    dmMProvider.cdsFormasPagamento.ProviderName := '';

                    if not dmMProvider.cdsFormasPagamento.IsEmpty then
                    begin

                      case dmMProvider.cdsFormasPagamentoTIPO.AsInteger of
                        10:begin

          //                  sCliente := FloatToStr(StrToFloat(Copy(sLinha, 36, 16)));
                              sCliente := FloatToStr(StrToFloatDef(dmMZeus.cdsZan_M33M33AH.Value,0));

                              if Length(sCliente) <= 6 then
                              begin

                                if sCliente <> '0' then
                                begin

                                  dmMProvider.cdsPesqClientes.Close;
                                  dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                                  dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);

                                  dmMProvider.cdsPesqClientes.Open;
                                  dmMProvider.cdsPesqClientes.ProviderName := '';

                                end;

                              end
                              else if Length(FloatToStr(StrToFloat(sCliente))) > 6 then
                              begin

                                if Length(FloatToStr(StrToFloat(sCliente))) < 14 then
                                  sCliente := FormatFloat('00000000000',StrToFloat(sCliente));

                                if sCliente <> '0' then
                                begin

                                  dmMProvider.cdsPesqClientes.Close;
                                  dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

                                  dmDBEXMaster.fdqPesqCliente.SQL.Clear;
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('SELECT * FROM CLIENTES');
                                  dmDBEXMaster.fdqPesqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));

                                  dmMProvider.cdsPesqClientes.Open;
                                  dmMProvider.cdsPesqClientes.ProviderName := '';

                                end;

                              end;

                              if not dmMProvider.cdsPesqClientes.IsEmpty then
                              begin

                                dmMProvider.fdmImpFinanceiro.Append;
                                dmMProvider.fdmImpFinanceiroIP_CRE.AsInteger                    := -1;
                                dmMProvider.fdmImpFinanceiroIP_FILIAL.AsInteger                 := dmDBEXMaster.iIdFilial;
                                dmMProvider.fdmImpFinanceiroIP_DOCUMENTO.Value                  := IntToStr(dmMZeus.cdsZan_M33M00AD.Value); // Copy(sLinha, 16, 6);
                                dmMProvider.fdmImpFinanceiroIP_SITUACAO.AsInteger               := 0;
                                dmMProvider.fdmImpFinanceiroIP_DATA_ENTRADA.AsDateTime          := Date;
                                dmMProvider.fdmImpFinanceiroIP_SACADO.AsInteger                 := dmMProvider.cdsPesqClientesCLIENTE.AsInteger;
                                dmMProvider.fdmImpFinanceiroIP_TIPO.AsInteger                   := 0;
                                dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime          := dmMZeus.cdsZan_M33M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
                                dmMProvider.fdmImpFinanceiroIP_DATA_VENCIMENTO.AsDateTime       := dmMProvider.fdmImpFinanceiroIP_DATA_EMISSAO.AsDateTime + 30;
                                dmMProvider.fdmImpFinanceiroIP_MOEDA.AsInteger                  := 0;
                                dmMProvider.fdmImpFinanceiroIP_VALOR.Value                      := dmMZeus.cdsZan_M33M33AJ.Value; //StrToFloat(Copy(sLinha, 53, 12)) / 100;

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

                    end;

                  end;

              end;

            end;

            //Movimenta��o de limite de cr�dito
            dmMZeus.cdsZan_M36.Close;
            dmMZeus.cdsZan_M36.ProviderName := 'dspZan_M36';

            dmMZeus.fdqZan_M36.SQL.Clear;
            dmMZeus.fdqZan_M36.SQL.Add('select * from zan_m36');
            //data do movimento
            dmMZeus.fdqZan_M36.SQL.Add('where m00af = ' + QuotedStr(FormatDateTime('mm/dd/yy', pData)));
            //loja
            dmMZeus.fdqZan_M36.SQL.Add('and m00za = ' + IntToStr(dmDBEXMaster.iIdFilial));
            //numero do equipamento
            dmMZeus.fdqZan_M36.SQL.Add('and m00ac = ' + IntToStr(dmMZeus.cdsZan_M03M00AC.Value));
            //COO
            dmMZeus.fdqZan_M36.SQL.Add('and m00ad = ' + IntToStr(dmMZeus.cdsZan_M03M00AD.Value));

            dmMZeus.cdsZan_M36.Open;
            dmMZeus.cdsZan_M36.ProviderName := '';

            if not dmMZeus.cdsZan_M36.IsEmpty then
            begin

          //    if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 12, 4), 1))) then
              if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M03M00AC.AsInteger)) then
              begin

                dmMProvider.fdmImpCupom.Edit;
                dmMProvider.fdmImpCupomNUMERO_CAIXA.Value   := dmMZeus.cdsZan_M36M00AC.Value; //StrToIntDef(Copy(sLinha, 12, 4), 1);
                dmMProvider.fdmImpCupomNUMERO_CUPOM.Value   := dmMZeus.cdsZan_M36M00Ad.Value;
                dmMProvider.fdmImpCupomSERIE_ECF.Value      := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
                dmMProvider.fdmImpCupomCFOP.Value           := '';
                dmMProvider.fdmImpCupomTRIBUTACAO.Value     := 0;
                dmMProvider.fdmImpCupomALIQUOTA_ICMS.Value  := '';
                dmMProvider.fdmImpCupomCFOP.Value           := '';
                dmMProvider.fdmImpCupomEMISSAO.Value        := dmMZeus.cdsZan_M36M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
                dmMProvider.fdmImpCupomBARRAS.Value         := '';
                dmMProvider.fdmImpCupomQUANTIDADE.Value     := dmMZeus.cdsZan_M36M36AO.AsCurrency; //StrToFloatDef(Copy(sLinha, 75, 9), 1) / 1000;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value      := dmMZeus.cdsZan_M36M36AP.Value;  //StrToFloatDef(Copy(sLinha, 84, 12), 1) / 100;
                dmMProvider.fdmImpCupomVALOR_UNITARIO.Value :=(dmMProvider.fdmImpCupomSUB_TOTAL.Value / dmMProvider.fdmImpCupomQUANTIDADE.Value);
                dmMProvider.fdmImpCupomVALOR_DESCONTO.Value := dmMZeus.cdsZan_M36M36AQ.Value;  //StrToFloatDef(Copy(sLinha, 96, 12), 1) / 100;
                dmMProvider.fdmImpCupomSUB_TOTAL.Value      := dmMProvider.fdmImpCupomSUB_TOTAL.Value - dmMProvider.fdmImpCupomVALOR_DESCONTO.Value;

      {          //if StrToInt(Copy(sLinha, 124, 2)) > 24 then
                if dmMZeus.cdsZan_M36M36AS.Value > 24 then
                begin

                  if dmMZeus.cdsZan_M36M36AS.Value = 92 then
                    iHora := (dmMZeus.cdsZan_M36M36AS.Value - 68) div 2
                     // meio dia
                  else
                    iHora := (dmMZeus.cdsZan_M36M36AS.Value - 68);

                  dmMProvider.fdmImpCupomHORA_ABERTURA.Value := StrToTime(IntToStr(iHora) + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value), 3, 2));

                end
                else
                  dmMProvider.fdmImpCupomHORA_ABERTURA.Value  := StrToTime(FormatDateTime('hh:mm',dmMZeus.cdsZan_M36M36AS.Value));
      }

                dmMProvider.fdmImpCupomHORA_ABERTURA.AsDateTime := StrToTimeDef(Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value),1,2) //inclu�do em 23/12/2016
                                                                    + ':' + Copy(FormatFloat('0000',dmMZeus.cdsZan_M36M36AS.Value),3,2),0);

                dmMProvider.fdmImpCupomNUMERO_ITEM.Value  := dmMZeus.cdsZan_M36M36CD.Value; //StrToIntDef(Copy(sLinha, 429, 4), 1);
                dmMProvider.fdmImpCupomSITUACAO.Value     := 1;

              end;

            end;

            dmMZeus.cdsZan_M03.Next;

          end;

          if ValidarNumeroCaixa(IntToStr(dmMZeus.cdsZan_M0_51M00AC.AsInteger)) then
          begin

            dmMProvider.fdmImpReg60M.Append;
            dmMProvider.fdmImpReg60MDATA_EMISSAO.Value      := dmMZeus.cdsZan_M0_51M00AF.AsDateTime; //StrToDate(Copy(sLinha, 26, 2) + '/' + Copy(sLinha, 28, 2) + '/' + Copy(sLinha, 30, 2));
            dmMProvider.fdmImpReg60MSERIE_ECF.Value         := dmMProvider.cdsConfigECFNUMERO_SERIE_ECF.AsString;
            dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value      := dmMProvider.cdsConfigECFNUMERO_CAIXA.AsInteger;
            dmMProvider.fdmImpReg60MCOO_INICIAL.Value       := dmMZeus.cdsZan_M0_51M05AJ.Value; //StrToIntDef(Copy(sLinha, 41, 6), 1);
            dmMProvider.fdmImpReg60MCOO_FINAL.Value         := dmMZeus.cdsZan_M0_51M00AD.Value;// StrToIntDef(Copy(sLinha, 16, 6), 1);
            dmMProvider.fdmImpReg60MCRZ.Value               := dmMZeus.cdsZan_M0_51M05AK.Value;// StrToIntDef(Copy(sLinha, 47, 6), 1);
            dmMProvider.fdmImpReg60MCRO.Value               := dmMZeus.cdsZan_M0_51M05BE.Value;// StrToIntDef(Copy(sLinha, 275, 4), 1);
            dmMProvider.fdmImpReg60MVENDA_BRUTA.Value       := dmMZeus.cdsZan_M0_51M05AN.Value - dmMZeus.cdsZan_M0_51M05AM.Value;// ((StrToFloat(Copy(sLinha, 75, 16)) / 100) - (StrToFloat(Copy(sLinha, 59, 16)) / 100));
            dmMProvider.fdmImpReg60MVALOR_GT.Value          := dmMZeus.cdsZan_M0_51M05AN.Value;// (StrToFloat(Copy(sLinha, 75, 16)) / 100);
            dmMProvider.fdmImpReg60MMODELO_DOCUMENTO.Value  := '2D';

            // cancelamentos
            if dmMZeus.cdsZan_M0_51M05AO.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'CANC';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05AO.Value;// StrToFloat(Copy(sLinha, 91, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // descontos
            if dmMZeus.cdsZan_M0_51M05AP.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'DESC';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05AP.Value;// StrToFloat(Copy(sLinha, 103, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // substitui��o
            if dmMZeus.cdsZan_M0_51M05AS.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'F';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05AS.Value;// StrToFloat(Copy(sLinha, 139, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // isentas
            if dmMZeus.cdsZan_M0_51M05AT.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'I';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05AT.Value;// StrToFloat(Copy(sLinha, 151, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

            // n�o tributadas
            if dmMZeus.cdsZan_M0_51M05AU.Value > 0 then
            begin

              dmMProvider.fdmImpReg60A.Append;
              dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
              dmMProvider.fdmImpReg60AALIQUOTA.Value        := 'N';
              dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05AU.Value;// StrToFloat(Copy(sLinha, 163, 12)) / 100;
              dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
              dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
              dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
              dmMProvider.fdmImpReg60A.Post;

            end;

          end;

          // primeira aliq
          if dmMZeus.cdsZan_M0_51M05XAJ.Value> 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAJ.Value * 100);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAK.Value; //StrToFloat(Copy(sLinha, 46, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '01';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // segunda aliq
        //      if StrToFloat(Copy(sLinha, 59, 4)) > 0 then
          if dmMZeus.cdsZan_M0_51M05XAL.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAL.Value * 100); //Copy(sLinha, 59, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAM.Value; //StrToFloat(Copy(sLinha, 63, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '02';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // terceira aliq
        //      if StrToFloat(Copy(sLinha, 76, 4)) > 0 then
          if dmMZeus.cdsZan_M0_51M05XAN.Value > 0 then

          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAN.Value * 100); //Copy(sLinha, 76, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAO.Value; //StrToFloat(Copy(sLinha, 80, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '03';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // quarta aliq
          if dmMZeus.cdsZan_M0_51M05XAP.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAP.Value * 100); //Copy(sLinha, 93, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAQ.Value; //StrToFloat(Copy(sLinha, 97, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '04';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // quinta aliq
          if dmMZeus.cdsZan_M0_51M05XAR.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAR.Value * 100); //Copy(sLinha, 110, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAS.Value; //StrToFloat(Copy(sLinha, 114, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '05';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // sexta aliq
          if dmMZeus.cdsZan_M0_51M05XAT.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAT.Value * 100); //Copy(sLinha, 127, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAU.Value; //StrToFloat(Copy(sLinha, 131, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '06';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // setima aliq
          if dmMZeus.cdsZan_M0_51M05XAV.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAV.Value * 100); //Copy(sLinha, 144, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAW.Value; //StrToFloat(Copy(sLinha, 148, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '07';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // oitava aliq
          if dmMZeus.cdsZan_M0_51M05XAX.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAX.Value * 100); //Copy(sLinha, 161, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XAY.Value; //StrToFloat(Copy(sLinha, 165, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '08';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // nota aliq
          if dmMZeus.cdsZan_M0_51M05XAZ.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XAZ.Value * 100); //Copy(sLinha, 178, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XBA.Value; //StrToFloat(Copy(sLinha, 182, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '09';
            dmMProvider.fdmImpReg60A.Post;

          end;

          // decima aliq
          if dmMZeus.cdsZan_M0_51M05XBB.Value > 0 then
          begin

            dmMProvider.fdmImpReg60A.Append;
            dmMProvider.fdmImpReg60ADATA_EMISSAO.Value    := dmMProvider.fdmImpReg60MDATA_EMISSAO.Value;
            dmMProvider.fdmImpReg60AALIQUOTA.Value        := FormatFloat('0000',dmMZeus.cdsZan_M0_51M05XBB.Value * 100); //Copy(sLinha, 195, 4);
            dmMProvider.fdmImpReg60AVALOR_ALIQUOTA.Value  := dmMZeus.cdsZan_M0_51M05XBC.Value; //StrToFloat(Copy(sLinha, 199, 12)) / 100;
            dmMProvider.fdmImpReg60ASERIE_ECF.Value       := dmMProvider.fdmImpReg60MSERIE_ECF.Value;
            dmMProvider.fdmImpReg60ACRZ.Value             := dmMProvider.fdmImpReg60MCRZ.Value;
            dmMProvider.fdmImpReg60ANUMERO_CAIXA.Value    := dmMProvider.fdmImpReg60MNUMERO_CAIXA.Value;
            dmMProvider.fdmImpReg60AGT.Value              := dmMProvider.fdmImpReg60MVALOR_GT.Value;
            dmMProvider.fdmImpReg60APOSICAO_ALIQUOTA.Value:= '10';
            dmMProvider.fdmImpReg60A.Post;

          end;

          dmMZeus.cdsZan_M0_51.Next;

        end;

        if dmMProvider.fdmImpCupom.State in [dsEdit, dsInsert] then
          dmMProvider.fdmImpCupom.Post;

        Application.ProcessMessages;

      end;

  end;

end;

end.

