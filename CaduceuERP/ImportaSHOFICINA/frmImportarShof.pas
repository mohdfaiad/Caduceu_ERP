unit frmImportarShof;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmImportarShoficina = class(TForm)
    PageControl1: TPageControl;
    tbsGenesis: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    tbdResultados: TTabSheet;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Label6: TLabel;
    Label7: TLabel;
    TabSheet1: TTabSheet;
    Button11: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarShoficina: TfrmImportarShoficina;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSProcedure, dataShoficina,
  uFuncoes, dataMSource;

procedure TfrmImportarShoficina.Button10Click(Sender: TObject);
var
  iContador:integer;
begin

  try

    iContador := 0;

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmShoficina.fdqOS.Open;
    dmShoficina.fdqOS.FetchAll;
    dmShoficina.fdqOS.First;

    while not dmShoficina.fdqOS.Eof do
    begin

      button10.Caption := IntToStr(dmShoficina.fdqOS.RecNo) + '/' + IntToStr(dmShoficina.fdqOS.RecordCount);
      Application.ProcessMessages;

      dmMProvider.cdsClientes.Close;
      dmMProvider.cdsClientes.ProviderName := 'dspClientes';

      dmDBEXMaster.fdqClientes.SQL.Clear;
      dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
      dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
      dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('WHERE CLIENTES.CLIENTE_SH = ' +  IntToStr(dmShoficina.fdqOSCOD_CLIENTE.Value));

      dmMProvider.cdsClientes.Open;
      dmMProvider.cdsClientes.ProviderName := '';

      if not dmMProvider.cdsClientes.IsEmpty then
      begin

        label7.Caption := IntToStr(dmShoficina.fdqOSCOD_CLIENTE.Value);
        Application.ProcessMessages;

        dmMProvider.cdsEquipamentos.Close;
        dmMProvider.cdsEquipamentos.ProviderName := 'dspEquipamentos';

        dmDBEXMaster.fdqEquipamentos.SQL.Clear;
        dmDBEXMaster.fdqEquipamentos.SQL.Add('select * from equipamentos');
        dmDBEXMaster.fdqEquipamentos.SQL.Add('where CODIGO_EQUIPAMENTO = ' + IntToStr(dmShoficina.fdqOSCOD_EQUIP.Value));

        dmMProvider.cdsEquipamentos.Open;
        dmMProvider.cdsEquipamentos.ProviderName := '';

        if not dmMProvider.cdsEquipamentos.IsEmpty then
        begin

          dmShoficina.fdqHist_OS.Close;
          dmShoficina.fdqHist_OS.SQL.Clear;
          dmShoficina.fdqHist_OS.SQL.Add('select * from ordems_contato');
          dmShoficina.fdqHist_OS.SQL.Add('where cod_ordem = ' + IntToStr(dmShoficina.fdqOSCODIGO.Value));
          dmShoficina.fdqHist_OS.Open;
          dmShoficina.fdqHist_OS.FetchAll;

          dmShoficina.fdqPecas_SH.Close;
          dmShoficina.fdqPecas_SH.SQL.Clear;
          dmShoficina.fdqPecas_SH.SQL.Add('select * from os_pecas');
          dmShoficina.fdqPecas_SH.SQL.Add('where cod_os = ' + IntToStr(dmShoficina.fdqOSCODIGO.Value));
          dmShoficina.fdqPecas_SH.Open;
          dmShoficina.fdqPecas_SH.FetchAll;

          dmShoficina.fdqServicos_SH.Close;
          dmShoficina.fdqServicos_SH.SQL.Clear;
          dmShoficina.fdqServicos_SH.SQL.Add('select * from os_servicos');
          dmShoficina.fdqServicos_SH.SQL.Add('where os_num = ' + IntToStr(dmShoficina.fdqOSCODIGO.Value));
          dmShoficina.fdqServicos_SH.Open;
          dmShoficina.fdqServicos_SH.FetchAll;

          dmMSProcedure.fdspOrdemServico.Params[0].Value  := 0;
          dmMSProcedure.fdspOrdemServico.Params[1].Value  := dmShoficina.fdqOSCODIGO.Value;
          dmMSProcedure.fdspOrdemServico.Params[2].Value  := dmShoficina.fdqOSSITUACAO.Value;
          dmMSProcedure.fdspOrdemServico.Params[3].Value  := dmMProvider.cdsClientesCLIENTE.Value;
          dmMSProcedure.fdspOrdemServico.Params[4].Value  := dmShoficina.fdqOSENTRADA.AsDateTime;
          dmMSProcedure.fdspOrdemServico.Params[5].Value  := StrToTime(FormatDateTime('HH:mm:ss', dmShoficina.fdqOSENTRADA.AsDateTime));
          dmMSProcedure.fdspOrdemServico.Params[6].Value  := dmShoficina.fdqOSPRONTO.AsDateTime;
          dmMSProcedure.fdspOrdemServico.Params[7].Value  := StrToTime(FormatDateTime('HH:mm:ss', dmShoficina.fdqOSPRONTO.AsDateTime));
          dmMSProcedure.fdspOrdemServico.Params[8].Value  := dmShoficina.fdqOSSAIDA.AsDateTime;
          dmMSProcedure.fdspOrdemServico.Params[9].Value  := StrToTime(FormatDateTime('HH:mm:ss',dmShoficina.fdqOSSAIDA.AsDateTime));
          dmMSProcedure.fdspOrdemServico.Params[10].Value := dmShoficina.fdqOSGARANTIA.AsDateTime;
          dmMSProcedure.fdspOrdemServico.Params[11].Value := StrToTime(FormatDateTime('HH:mm:ss',dmShoficina.fdqOSGARANTIA.AsDateTime));
          dmMSProcedure.fdspOrdemServico.Params[12].Value := dmShoficina.fdqOSV_MAO.Value;
          dmMSProcedure.fdspOrdemServico.Params[13].Value := dmShoficina.fdqOSV_PECAS.Value;
          dmMSProcedure.fdspOrdemServico.Params[14].Value := dmShoficina.fdqOSV_DESLOCA.Value;
          dmMSProcedure.fdspOrdemServico.Params[15].Value := dmShoficina.fdqOSV_TERCEIRO.Value;
          dmMSProcedure.fdspOrdemServico.Params[16].Value := dmShoficina.fdqOSV_OUTROS.Value;
          dmMSProcedure.fdspOrdemServico.Params[17].Value := dmMProvider.cdsEquipamentosCODIGO_EQUIPAMENTO.Value;
          dmMSProcedure.fdspOrdemServico.Params[18].Value := dmShoficina.fdqOSAPARELHO.Value;
          dmMSProcedure.fdspOrdemServico.Params[19].Value := dmShoficina.fdqOSMARCA.Value;
          dmMSProcedure.fdspOrdemServico.Params[20].Value := dmShoficina.fdqOSMODELO.Value;
          dmMSProcedure.fdspOrdemServico.Params[21].Value := dmShoficina.fdqOSSERIE.Value;
          dmMSProcedure.fdspOrdemServico.Params[22].Value := dmShoficina.fdqOSPATRIMONIO.Value;
          dmMSProcedure.fdspOrdemServico.Params[23].Value := dmShoficina.fdqOSACESSORIO.Value;
          dmMSProcedure.fdspOrdemServico.Params[24].Value := dmShoficina.fdqOSDEFEITO.Value;
          dmMSProcedure.fdspOrdemServico.Params[25].Value := dmShoficina.fdqOSOBS_SERVICO.Value;
          dmMSProcedure.fdspOrdemServico.Params[26].Value := dmShoficina.fdqOSLAUDO.Value;
          dmMSProcedure.fdspOrdemServico.Params[27].Value := dmShoficina.fdqOSOBS_APARELHO.Value;
          dmMSProcedure.fdspOrdemServico.Params[28].Value := dmShoficina.fdqOSKILOMET.Value;
          dmMSProcedure.fdspOrdemServico.Params[29].Value := dmShoficina.fdqOSNUM_NF_PED.Value;

          if dmShoficina.fdqOSEM_USO.Value then
            dmMSProcedure.fdspOrdemServico.Params[30].Value := 1
          else
            dmMSProcedure.fdspOrdemServico.Params[30].Value := 0;

          if dmShoficina.fdqOSNF_NUMERO.Value > 0 then
            dmMSProcedure.fdspOrdemServico.Params[31].Value := dmShoficina.fdqOSNF_NUMERO.Value;

          if dmShoficina.fdqOSOS_REABERTA.Value then
            dmMSProcedure.fdspOrdemServico.Params[32].Value := 1
          else
            dmMSProcedure.fdspOrdemServico.Params[32].Value := 0;

          dmMSProcedure.fdspOrdemServico.Params[33].Value := dmShoficina.fdqOSOS_OUTROS.Value;
          dmMSProcedure.fdspOrdemServico.Params[34].Value := dmShoficina.fdqOSOS_OUTROS_EMIT.Value;
          dmMSProcedure.fdspOrdemServico.Params[35].Value := dmShoficina.fdqOSOS_SINAL.Value;
          dmMSProcedure.fdspOrdemServico.Params[36].Value := dmShoficina.fdqOSPRIOR.Value;

          if dmShoficina.fdqOSOS_NF_REMESSA.Value > 0 then
            dmMSProcedure.fdspOrdemServico.Params[37].Value := dmShoficina.fdqOSOS_NF_REMESSA.AsString;

          dmMSProcedure.fdspOrdemServico.Params[38].Value := dmShoficina.fdqOSOS_NF_VALOR.Value;

          if dmShoficina.fdqOSOS_NF_EMIT.Value > 0 then
            dmMSProcedure.fdspOrdemServico.Params[39].Value := dmShoficina.fdqOSOS_NF_EMIT.AsString;

//          dmMSProcedure.fdspOrdemServico.Params[40].Value := dmShoficina.fdqOSOS_GARANTIDOR.Value;
          dmMSProcedure.fdspOrdemServico.Params[41].Value := dmShoficina.fdqOSOS_GARANTIDOR_SN.Value;
          dmMSProcedure.fdspOrdemServico.Params[42].Value := dmShoficina.fdqOSV_FRETE.Value;
          dmMSProcedure.fdspOrdemServico.Params[43].Value := dmShoficina.fdqOSV_SEGURO.Value;
          dmMSProcedure.fdspOrdemServico.Params[44].Value := dmShoficina.fdqOSUSER_MICRO.Value;
          dmMSProcedure.fdspOrdemServico.Params[45].Value := dmShoficina.fdqOSORCA_FORMAS.Value;
          dmMSProcedure.fdspOrdemServico.Params[46].Value := dmShoficina.fdqOSALERTA_ABANDONO.AsDateTime;
          dmMSProcedure.fdspOrdemServico.Params[47].Value := StrToTime(FormatDateTime('HH:mm:ss',dmShoficina.fdqOSALERTA_ABANDONO.AsDateTime));

          if dmShoficina.fdmFuncionarios.Locate('ID_SHOFICINA',dmShoficina.fdqOSTECNICO_FIXO.Value, []) then
            dmMSProcedure.fdspOrdemServico.Params[48].Value := dmShoficina.fdmFuncionariosID_GENESIS.Value;

          dmMSProcedure.fdspOrdemServico.Params[49].Value := dmShoficina.fdqOSOS_FABRICANTE.Value;
          dmMSProcedure.fdspOrdemServico.Params[50].Value := dmShoficina.fdqOSNFC_NUMERO.Value;
          dmMSProcedure.fdspOrdemServico.Params[51].Value := dmShoficina.fdqOSPREVISTO.AsDateTime;
          dmMSProcedure.fdspOrdemServico.Params[52].Value := StrToTime(FormatDateTime('HH:mm:ss',dmShoficina.fdqOSPREVISTO.AsDateTime));
          dmMSProcedure.fdspOrdemServico.Params[53].Value := (dmShoficina.fdqOSV_MAO.Value + dmShoficina.fdqOSV_PECAS.Value
                                                              + dmShoficina.fdqOSV_DESLOCA.Value
                                                              + dmShoficina.fdqOSV_TERCEIRO.Value
                                                              + dmShoficina.fdqOSV_OUTROS.Value) - dmShoficina.fdqOSOS_SINAL.Value;
          dmMSProcedure.fdspOrdemServico.Params[54].Value := 0;
          dmMSProcedure.fdspOrdemServico.Params[56].Value := dmMProvider.cdsClientesRAZAOSOCIAL.Value;
          dmMSProcedure.fdspOrdemServico.Params[57].Value := Copy(Trim(dmMProvider.cdsClientesCNPJ.Value),1,15);
          dmMSProcedure.fdspOrdemServico.Params[58].Value := dmMProvider.cdsClientesINSCRICAO.Value;
          dmMSProcedure.fdspOrdemServico.Params[59].Value := dmMProvider.cdsClientesENDERECO.Value;

          if dmMProvider.cdsClientesNUMERO.Value > 0 then
            dmMSProcedure.fdspOrdemServico.Params[60].Value := dmMProvider.cdsClientesNUMERO.AsString;

          dmMSProcedure.fdspOrdemServico.Params[61].Value := dmMProvider.cdsClientesCEP.Value;
          dmMSProcedure.fdspOrdemServico.Params[62].Value := dmMProvider.cdsClientesBAIRRO.Value;
          dmMSProcedure.fdspOrdemServico.Params[63].Value := Copy(Trim(dmMProvider.cdsClientesNOME_CIDADE.Value),30);
          dmMSProcedure.fdspOrdemServico.Params[64].Value := Copy(Trim(dmMProvider.cdsClientesDDD.Value),1,3);
          dmMSProcedure.fdspOrdemServico.Params[65].Value := Copy(LimparCpnjInscricao(dmMProvider.cdsClientesTELEFONE1.Value),1,2);
          dmMSProcedure.fdspOrdemServico.Params[66].Value := dmMProvider.cdsClientesEMAIL.Value;
          dmMSProcedure.fdspOrdemServico.Params[67].Value := dmMProvider.cdsClientesESTADO.Value;
          dmMSProcedure.fdspOrdemServico.Params[68].Value := Copy(dmMProvider.cdsClientesCONTATO.Value,1,20);
          dmMSProcedure.fdspOrdemServico.ExecProc;

          while not dmShoficina.fdqHist_OS.Eof do
          begin

            dmMSProcedure.fdspHistorico_OS.Params[0].Value := 0;
            dmMSProcedure.fdspHistorico_OS.Params[1].Value := dmShoficina.fdqHist_OSCODIGO.Value;
            dmMSProcedure.fdspHistorico_OS.Params[2].Value := dmShoficina.fdqHist_OSCOD_ORDEM.Value;
            dmMSProcedure.fdspHistorico_OS.Params[3].Value := dmShoficina.fdqHist_OSDESCRICAO.Value;
            dmMSProcedure.fdspHistorico_OS.Params[4].Value := dmShoficina.fdqHist_OSUSUARIO.Value;
            dmMSProcedure.fdspHistorico_OS.Params[5].Value := dmShoficina.fdqHist_OSDATA_CADASTRO.AsDateTime;
            dmMSProcedure.fdspHistorico_OS.Params[6].Value := dmShoficina.fdqHist_OSDATA_CADASTRO.AsDateTime;
            dmMSProcedure.fdspHistorico_OS.Params[7].Value := 0;

            dmMSProcedure.fdspHistorico_OS.ExecProc;
            dmShoficina.fdqHist_OS.Next;

          end;

          while not dmShoficina.fdqServicos_SH.Eof do
          begin

            dmMSProcedure.fdspItensOSServicos.Params[0].Value  := 0;
            dmMSProcedure.fdspItensOSServicos.Params[1].Value  := -1;
            dmMSProcedure.fdspItensOSServicos.Params[2].Value  := dmShoficina.fdqServicos_SHOS_NUM.Value;
            dmMSProcedure.fdspItensOSServicos.Params[3].Value  := dmShoficina.fdqServicos_SHDESCRICAO.Value;
            dmMSProcedure.fdspItensOSServicos.Params[4].Value  := dmShoficina.fdqServicos_SHCUSTO.Value;
            dmMSProcedure.fdspItensOSServicos.Params[5].Value  := dmShoficina.fdqServicos_SHINICIO.AsDateTime;
            dmMSProcedure.fdspItensOSServicos.Params[6].Value  := dmShoficina.fdqServicos_SHINICIO.AsDateTime;
            dmMSProcedure.fdspItensOSServicos.Params[7].Value  := dmShoficina.fdqServicos_SHFIM.AsDateTime;
            dmMSProcedure.fdspItensOSServicos.Params[8].Value  := dmShoficina.fdqServicos_SHFIM.AsDateTime;

            if dmShoficina.fdmFuncionarios.Locate('ID_SHOFICINA',dmShoficina.fdqServicos_SHTECNICO.Value, []) then
              dmMSProcedure.fdspItensOSServicos.Params[9].Value := dmShoficina.fdqServicos_SHTECNICO.Value;

            if dmShoficina.fdqServicos_SHCOD_SERV.Value > 0 then
              dmMSProcedure.fdspItensOSServicos.Params[10].Value := 2
            else
              dmMSProcedure.fdspItensOSServicos.Params[10].Value := 1;

            dmMSProcedure.fdspItensOSServicos.Params[11].Value := 0;
            dmMSProcedure.fdspItensOSServicos.Params[12].Value := dmShoficina.fdqServicos_SHQTD.Value;
            dmMSProcedure.fdspItensOSServicos.Params[13].Value := dmShoficina.fdqServicos_SHTOTAL.Value;
            dmMSProcedure.fdspItensOSServicos.Params[14].Value := dmShoficina.fdqServicos_SHXPED.Value;
            dmMSProcedure.fdspItensOSServicos.Params[15].Value := dmShoficina.fdqServicos_SHNITEMPED.Value;
            dmMSProcedure.fdspItensOSServicos.Params[16].Value := dmShoficina.fdqServicos_SHTIPO.Value;
            dmMSProcedure.fdspItensOSServicos.ExecProc;

            dmShoficina.fdqServicos_SH.Next;

          end;

          while not dmShoficina.fdqPecas_SH.Eof do
          begin

            dmMSProcedure.fdspItensOSPecas.Params[0].Value  := 0;
            dmMSProcedure.fdspItensOSPecas.Params[1].Value  := -1;
            dmMSProcedure.fdspItensOSPecas.Params[2].Value  := dmShoficina.fdqPecas_SHCOD_OS.Value;
            dmMSProcedure.fdspItensOSPecas.Params[3].Value  := 0;
            dmMSProcedure.fdspItensOSPecas.Params[4].Value  := dmShoficina.fdqPecas_SHDESCRICAO.Value;
            dmMSProcedure.fdspItensOSPecas.Params[5].Value  := dmShoficina.fdqPecas_SHVALOR.Value;

            if dmShoficina.fdmFuncionarios.Locate('ID_SHOFICINA',dmShoficina.fdqPecas_SHTECNICO.Value, []) then
              dmMSProcedure.fdspItensOSPecas.Params[6].Value := dmShoficina.fdqPecas_SHTECNICO.Value
            else
              dmMSProcedure.fdspItensOSPecas.Params[6].Value := null;

            dmMSProcedure.fdspItensOSPecas.Params[7].Value  := dmShoficina.fdqPecas_SHQTD.Value;
            dmMSProcedure.fdspItensOSPecas.Params[8].Value  := dmShoficina.fdqPecas_SHDIA.AsDateTime;
            dmMSProcedure.fdspItensOSPecas.Params[9].Value  := dmShoficina.fdqPecas_SHXPED.Value;
            dmMSProcedure.fdspItensOSPecas.Params[10].Value := dmShoficina.fdqPecas_SHNITEMPED.Value;
            dmMSProcedure.fdspItensOSPecas.Params[11].Value := dmShoficina.fdqPecas_SHSERIAIS_IN.Value;
            dmMSProcedure.fdspItensOSPecas.Params[12].Value := dmShoficina.fdqPecas_SHCOD_BAIXA.Value;

            if dmShoficina.fdqPecas_SHCOD_PECA.Value > 0then
              dmMSProcedure.fdspItensOSPecas.Params[13].Value := 5
            else
              dmMSProcedure.fdspItensOSPecas.Params[13].Value := 3;

            dmMSProcedure.fdspItensOSPecas.ExecProc;
            dmShoficina.fdqPecas_SH.Next;

          end;

          inc(iContador);

        end;

      end;

      dmShoficina.fdqOS.Next;

    end;

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select max(ORDEM_DE_SERVICO) as ultima_os from ORDEM_DE_SERVICO');
    dmDBEXMaster.fdqMasterPesquisa.Open;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;
    dmMSProcedure.fdspMaster.Params[0].Value := 'ALTER SEQUENCE GNR_ORDEM_DE_SERVICO_ID RESTART WITH ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ultima_os').AsInteger);
    dmMSProcedure.fdspMaster.ExecProc;

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select max(historico_ordem) as ultimo_historico from HISTORICO_ORDEM_SERVICO');
    dmDBEXMaster.fdqMasterPesquisa.Open;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;
    dmMSProcedure.fdspMaster.Params[0].Value := 'ALTER SEQUENCE GNR_HISTORICO_ORDEM_SERVICO_ID RESTART WITH ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ultimo_historico').AsInteger);
    dmMSProcedure.fdspMaster.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    LABEL6.Caption := 'foram inclu�das: ' + IntToStr(iContador) + ' OS';
    Application.ProcessMessages;

  except

    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      ShowMessage(Tratar_Erro_Conexao(E));

    end;

  end;


end;

procedure TfrmImportarShoficina.Button11Click(Sender: TObject);
begin

  dmShoficina.fdcShoficina.Params.Clear;
  dmShoficina.fdcShoficina.Params.DriverID  := 'MSAcc';
  dmShoficina.fdcShoficina.Params.Database  := Edit1.Text;
  dmShoficina.fdcShoficina.Params.Password  := '!(&&!!)&';
  dmShoficina.fdcShoficina.Open;

end;

procedure TfrmImportarShoficina.Button1Click(Sender: TObject);
var
  iContador:integer;
  sTelefone:string;
begin

  try

    iContador := 0;

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmShoficina.fdqClientesSH.Open;
    dmShoficina.fdqClientesSH.FetchAll;
    dmShoficina.fdqClientesSH.First;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;

    while not dmShoficina.fdqClientesSH.Eof do
    begin

      button1.Caption := IntToStr(dmShoficina.fdqClientesSH.RecNo) + '/' + IntToStr(dmShoficina.fdqClientesSH.RecordCount);
      Application.ProcessMessages;

      dmMSProcedure.fdspClientes.Params[0].Value  := 0;
      dmMSProcedure.fdspClientes.Params[1].Value  := 0; //codigo
      dmMSProcedure.fdspClientes.Params[2].Value  := UpperCase(Copy(RetirarAcentuacaoString(dmShoficina.fdqClientesSHNOME.Value),1,40)) ;
      dmMSProcedure.fdspClientes.Params[3].Value  := UpperCase(Copy(AbreviaNome(dmShoficina.fdqClientesSHNOME.Value),1,30));
      dmMSProcedure.fdspClientes.Params[4].Value  := LimparCpnjInscricao(dmShoficina.fdqClientesSHCPF_CNPJ.Value);

      dmMProvider.cdsClientes.Close;
      dmMProvider.cdsClientes.ProviderName := 'dspClientes';

      dmDBEXMaster.fdqClientes.SQL.Clear;
      dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
      dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
      dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('WHERE CLIENTES.CNPJ = ' + QuotedStr(LimparCpnjInscricao(dmShoficina.fdqClientesSHCPF_CNPJ.Value)));

      dmMProvider.cdsClientes.Open;
      dmMProvider.cdsClientes.ProviderName := '';

      if dmMProvider.cdsClientes.IsEmpty then
      begin

        if Length(Trim(LimparCpnjInscricao(dmShoficina.fdqClientesSHIE_RG.Value))) <= 0 then
          dmMSProcedure.fdspClientes.Params[5].Value  := 'ISENTO'
        else
          dmMSProcedure.fdspClientes.Params[5].Value  := LimparCpnjInscricao(dmShoficina.fdqClientesSHIE_RG.Value);

        dmMSProcedure.fdspClientes.Params[6].Value  := dmShoficina.fdqClientesSHCADASTRADO.AsDateTime;
        dmMSProcedure.fdspClientes.Params[7].Value  := UpperCase(Copy(RetirarAcentuacaoString(dmShoficina.fdqClientesSHENDERECO.Value),1,40));

        if Length(Trim(dmShoficina.fdqClientesSHNUMERO.Value)) > 0 then
          dmMSProcedure.fdspClientes.Params[7].Value := Format('%-40.40',[dmMSProcedure.fdspClientes.Params[7].Value + ', ' + Trim(dmShoficina.fdqClientesSHNUMERO.Value)]);

        dmMSProcedure.fdspClientes.Params[8].Value  := null;

        dmMSProcedure.fdspClientes.Params[9].Value  := LimparCpnjInscricao(dmShoficina.fdqClientesSHCEP.Value);
        dmMSProcedure.fdspClientes.Params[10].Value := UpperCase(Copy(LimparCpnjInscricao(dmShoficina.fdqClientesSHBAIRRO.Value),1,30));

        dmDBEXMaster.fdqEstados.Close;
        dmDBEXMaster.fdqEstados.SQL.Clear;
        dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');
        dmDBEXMaster.fdqEstados.SQL.Add('WHERE SIGLA = ' + QuotedStr(Trim(dmShoficina.fdqClientesSHUF.Value)));
        dmDBEXMaster.fdqEstados.Open;

        if not dmDBEXMaster.fdqEstados.IsEmpty then
          dmMSProcedure.fdspClientes.Params[11].Value := dmShoficina.fdqClientesSHUF.Value
        else
          dmMSProcedure.fdspClientes.Params[11].Value := 'ES';

        if Length(Trim(dmMSProcedure.fdspClientes.Params[4].Value)) = 11 then
          dmMSProcedure.fdspClientes.Params[12].Value := 0
        else
          dmMSProcedure.fdspClientes.Params[12].Value := 1;

        dmMSProcedure.fdspClientes.Params[13].Value := UpperCase(Copy(RetirarAcentuacaoString(dmShoficina.fdqClientesSHCOMPLEM.Value),1,30));
        dmMSProcedure.fdspClientes.Params[14].Value := UpperCase(Copy(RetirarAcentuacaoString(dmShoficina.fdqClientesSHCONTATO.Value),1,30));
        dmMSProcedure.fdspClientes.Params[15].Value := null;
        dmMSProcedure.fdspClientes.Params[16].Value := copy(Trim(dmShoficina.fdqClientesSHEMAIL.Value),1,50);
        dmMSProcedure.fdspClientes.Params[17].Value := UpperCase(RetirarAcentuacaoString(dmShoficina.fdqClientesSHOBSERVACAO.Value));

        sTelefone := Trim(LimparCpnjInscricao(dmShoficina.fdqClientesSHTELEFONE.Value));

        if Length(sTelefone) = 8 then
        begin

          dmMSProcedure.fdspClientes.Params[18].Value := null;
          dmMSProcedure.fdspClientes.Params[19].Value := sTelefone;

        end
        else if Length(sTelefone) = 10 then
        begin

          dmMSProcedure.fdspClientes.Params[18].Value := Copy(sTelefone,1,2);
          dmMSProcedure.fdspClientes.Params[19].Value := Copy(sTelefone,3,8);
          dmMSProcedure.fdspClientes.Params[20].Value := null;

        end
        else if Length(sTelefone) = 16 then
        begin

          dmMSProcedure.fdspClientes.Params[18].Value := null;
          dmMSProcedure.fdspClientes.Params[19].Value := Copy(sTelefone,1,8);
          dmMSProcedure.fdspClientes.Params[20].Value := Copy(sTelefone,9,8);

        end
        else
        begin

          dmMSProcedure.fdspClientes.Params[18].Value := null;
          dmMSProcedure.fdspClientes.Params[19].Value := null;
          dmMSProcedure.fdspClientes.Params[20].Value := null;

        end;

        dmMSProcedure.fdspClientes.Params[21].Value := null;

        sTelefone := Trim(LimparCpnjInscricao(dmShoficina.fdqClientesSHFAX.Value));

        if Length(sTelefone) = 8 then
          dmMSProcedure.fdspClientes.Params[22].Value := sTelefone
        else if Length(sTelefone) = 10 then
          dmMSProcedure.fdspClientes.Params[22].Value := Copy(sTelefone,3,8)
        else if Length(sTelefone) = 16 then
          dmMSProcedure.fdspClientes.Params[22].Value := Copy(sTelefone,1,8)
        else
          dmMSProcedure.fdspClientes.Params[22].Value := null;

        dmMSProcedure.fdspClientes.Params[23].Value := null;
        dmMSProcedure.fdspClientes.Params[24].Value := 0;
        dmMSProcedure.fdspClientes.Params[25].Value := 0;
        dmMSProcedure.fdspClientes.Params[26].Value := 0;
        dmMSProcedure.fdspClientes.Params[27].Value := 0;
        dmMSProcedure.fdspClientes.Params[28].Value := null;
        dmMSProcedure.fdspClientes.Params[29].Value := dmMSProcedure.fdspClientes.Params[7].Value;
        dmMSProcedure.fdspClientes.Params[30].Value := null;
        dmMSProcedure.fdspClientes.Params[31].Value := dmMSProcedure.fdspClientes.Params[9].Value;
        dmMSProcedure.fdspClientes.Params[32].Value := dmMSProcedure.fdspClientes.Params[10].Value;
        dmMSProcedure.fdspClientes.Params[33].Value := dmMSProcedure.fdspClientes.Params[11].Value;
        dmMSProcedure.fdspClientes.Params[34].Value := dmMSProcedure.fdspClientes.Params[7].Value;
        dmMSProcedure.fdspClientes.Params[35].Value := null;
        dmMSProcedure.fdspClientes.Params[36].Value := dmMSProcedure.fdspClientes.Params[9].Value;
        dmMSProcedure.fdspClientes.Params[37].Value := dmMSProcedure.fdspClientes.Params[10].Value;
        dmMSProcedure.fdspClientes.Params[38].Value := dmMSProcedure.fdspClientes.Params[11].Value;

        dmMSProcedure.fdspClientes.Params[39].Value := null;
        dmMSProcedure.fdspClientes.Params[40].Value := null;
        dmMSProcedure.fdspClientes.Params[41].Value := 0;
        dmMSProcedure.fdspClientes.Params[42].Value := null;
        dmMSProcedure.fdspClientes.Params[43].Value := null;
        dmMSProcedure.fdspClientes.Params[44].Value := null;
        dmMSProcedure.fdspClientes.Params[45].Value := null;
        dmMSProcedure.fdspClientes.Params[46].Value := 0;
        dmMSProcedure.fdspClientes.Params[47].Value := null;
        dmMSProcedure.fdspClientes.Params[48].Value := null;
        dmMSProcedure.fdspClientes.Params[49].Value := 0;
        dmMSProcedure.fdspClientes.Params[50].Value := null;

        dmDBEXMaster.fdqCidades.Close;
        dmDBEXMaster.fdqCidades.SQL.Clear;;
        dmDBEXMaster.fdqCidades.SQL.Add('SELECT * FROM CIDADES');
        dmDBEXMaster.fdqCidades.SQL.Add('WHERE nome = ' + QuotedStr(dmShoficina.fdqClientesSHCIDADE.Value) );
        dmDBEXMaster.fdqCidades.Open;

        if not dmDBEXMaster.fdqCidades.IsEmpty then
          dmMSProcedure.fdspClientes.Params[51].Value := dmDBEXMaster.fdqCidades.FieldByName('CIDADE').Value
        else
          dmMSProcedure.fdspClientes.Params[51].Value := null;

        dmMSProcedure.fdspClientes.Params[52].Value := dmMSProcedure.fdspClientes.Params[51].Value;
        dmMSProcedure.fdspClientes.Params[53].Value := dmMSProcedure.fdspClientes.Params[51].Value;
        dmMSProcedure.fdspClientes.Params[54].Value := 1;
        dmMSProcedure.fdspClientes.Params[55].Value := null;
        dmMSProcedure.fdspClientes.Params[56].Value := null;
        dmMSProcedure.fdspClientes.Params[57].Value := null;
        dmMSProcedure.fdspClientes.Params[58].Value := null;
        dmMSProcedure.fdspClientes.Params[59].Value := null;
        dmMSProcedure.fdspClientes.Params[60].Value := null;
        dmMSProcedure.fdspClientes.Params[61].Value := null;
        dmMSProcedure.fdspClientes.Params[62].Value := null;
        dmMSProcedure.fdspClientes.Params[63].Value := null;
        dmMSProcedure.fdspClientes.Params[64].Value := null;
        dmMSProcedure.fdspClientes.Params[65].Value := null;
        dmMSProcedure.fdspClientes.Params[66].Value := null;
        dmMSProcedure.fdspClientes.Params[67].Value := null;
        dmMSProcedure.fdspClientes.Params[68].Value := 0;
        dmMSProcedure.fdspClientes.Params[69].Value := 0;
        dmMSProcedure.fdspClientes.Params[70].Value := null;
        dmMSProcedure.fdspClientes.Params[71].Value := 0;
        dmMSProcedure.fdspClientes.Params[72].Value := 0;
        dmMSProcedure.fdspClientes.Params[73].Value := null;
        dmMSProcedure.fdspClientes.Params[74].Value := null;
        dmMSProcedure.fdspClientes.Params[75].Value := 0;
        dmMSProcedure.fdspClientes.Params[76].Value := null;
        dmMSProcedure.fdspClientes.Params[77].Value := null;
        dmMSProcedure.fdspClientes.Params[78].Value := null;
        dmMSProcedure.fdspClientes.Params[79].Value := null;
        dmMSProcedure.fdspClientes.Params[80].Value := null;
        dmMSProcedure.fdspClientes.Params[81].Value := null;
        dmMSProcedure.fdspClientes.Params[82].Value := null;
        dmMSProcedure.fdspClientes.Params[83].Value := null;
        dmMSProcedure.fdspClientes.Params[84].Value := null;
        dmMSProcedure.fdspClientes.Params[85].Value := 1;
        dmMSProcedure.fdspClientes.Params[86].Value := null;
        dmMSProcedure.fdspClientes.Params[87].Value := 0;
        dmMSProcedure.fdspClientes.Params[88].Value := 0;
        dmMSProcedure.fdspClientes.Params[89].Value := null;
        dmMSProcedure.fdspClientes.Params[90].Value := null;
        dmMSProcedure.fdspClientes.Params[91].Value := null;
        dmMSProcedure.fdspClientes.Params[92].Value := 0;
        dmMSProcedure.fdspClientes.Params[93].Value := 1058;
        dmMSProcedure.fdspClientes.Params[94].Value := null;
        dmMSProcedure.fdspClientes.Params[95].Value := 0;
        dmMSProcedure.fdspClientes.Params[96].Value := 0;
        dmMSProcedure.fdspClientes.Params[97].Value := dmShoficina.fdqClientesSHCODIGO.Value;

        dmMSProcedure.fdspClientes.ExecProc;

        if dmMSProcedure.fdspClientes.Params[98].AsInteger > 0 then
          inc(iContador);

      end
      else
      begin

        dmMSProcedure.fdspMaster.Params[0].Value := 'update clientes set cliente_sh = ' + IntToStr(dmShoficina.fdqClientesSHCODIGO.Value)
                                                    + ' where cliente = ' + IntToStr(dmMProvider.cdsClientesCLIENTE.Value);
        dmMSProcedure.fdspMaster.ExecProc;

      end;

      dmShoficina.fdqClientesSH.Next

    end;

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select max(cliente) as ultimo_cliente from clientes');
    dmDBEXMaster.fdqMasterPesquisa.Open;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;
    dmMSProcedure.fdspMaster.Params[0].Value := 'ALTER SEQUENCE GNR_CLIENTE RESTART WITH ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ultimo_cliente').AsInteger);
    dmMSProcedure.fdspMaster.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    LABEL1.Caption := 'foram inclu�dos: ' + IntToStr(iContador) + ' clientes';
    Application.ProcessMessages;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      ShowMessage(Tratar_Erro_Conexao(E));

    end;

  end;

end;

procedure TfrmImportarShoficina.Button2Click(Sender: TObject);
var
  iContador:integer;
begin

  try

    iContador := 0;

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmShoficina.fdqEquipamentos.Open;
    dmShoficina.fdqEquipamentos.FetchAll;
    dmShoficina.fdqEquipamentos.First;

    while not dmShoficina.fdqEquipamentos.Eof do
    begin

      button2.Caption := IntToStr(dmShoficina.fdqEquipamentos.RecNo) + '/' + IntToStr(dmShoficina.fdqEquipamentos.RecordCount);
      Application.ProcessMessages;

      dmMProvider.cdsClientes.Close;
      dmMProvider.cdsClientes.ProviderName := 'dspClientes';

      dmDBEXMaster.fdqClientes.SQL.Clear;
      dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
      dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
      dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
      dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');
      dmDBEXMaster.fdqClientes.SQL.Add('WHERE CLIENTES.CLIENTE_SH = ' +  IntToStr(dmShoficina.fdqEquipamentosCOD_CLIENTE.Value));

      dmMProvider.cdsClientes.Open;
      dmMProvider.cdsClientes.ProviderName := '';

      if not dmMProvider.cdsClientes.IsEmpty then
      begin

        dmMSProcedure.fdspEquipamentos.Params[0].Value  := 0;
        dmMSProcedure.fdspEquipamentos.Params[1].Value  := dmMProvider.cdsClientesCLIENTE.Value;
        dmMSProcedure.fdspEquipamentos.Params[2].Value  := dmShoficina.fdqEquipamentosCODIGO.Value;
        dmMSProcedure.fdspEquipamentos.Params[3].Value  := UpperCase(dmShoficina.fdqEquipamentosDESCRICAO.Value);
        dmMSProcedure.fdspEquipamentos.Params[4].Value  := UpperCase(dmShoficina.fdqEquipamentosMARCA.Value);
        dmMSProcedure.fdspEquipamentos.Params[5].Value  := UpperCase(dmShoficina.fdqEquipamentosMODELO.Value);
        dmMSProcedure.fdspEquipamentos.Params[6].Value  := dmShoficina.fdqEquipamentosSERIE.Value;
        dmMSProcedure.fdspEquipamentos.Params[7].Value  := dmShoficina.fdqEquipamentosPAT.Value;
        dmMSProcedure.fdspEquipamentos.Params[8].Value  := UpperCase(dmShoficina.fdqEquipamentosOBSERVACOES.Value);
        dmMSProcedure.fdspEquipamentos.Params[10].Value := dmShoficina.fdqEquipamentosREVENDA.Value;
        dmMSProcedure.fdspEquipamentos.Params[11].Value := dmShoficina.fdqEquipamentosNUM_NF.Value;
        dmMSProcedure.fdspEquipamentos.Params[12].Value := dmShoficina.fdqEquipamentosNUM_CERTGAR.Value;
        dmMSProcedure.fdspEquipamentos.Params[13].Value := Date;
        dmMSProcedure.fdspEquipamentos.Params[14].Value := Time;
        dmMSProcedure.fdspEquipamentos.Params[15].Value := dmDBEXMaster.iIdUsuario;
        dmMSProcedure.fdspEquipamentos.Params[16].Value := pubNomeComputador;
        dmMSProcedure.fdspEquipamentos.Params[17].Value := RetornarIP;
        dmMSProcedure.fdspEquipamentos.ExecProc;

        inc(iContador);

      end;

      dmShoficina.fdqEquipamentos.Next;

    end;

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select max(codigo_equipamento) as ultimo_equipamento from equipamentos');
    dmDBEXMaster.fdqMasterPesquisa.Open;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;
    dmMSProcedure.fdspMaster.Params[0].Value := 'ALTER SEQUENCE GNR_EQUIPAMENTOS_ID RESTART WITH ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ultimo_equipamento').AsInteger);
    dmMSProcedure.fdspMaster.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    LABEL2.Caption := 'foram inclu�dos: ' + IntToStr(iContador) + ' equipamentos';
    Application.ProcessMessages;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmImportarShoficina.Button3Click(Sender: TObject);
var
  iContador:integer;
begin

  try

    iContador := 0;

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmShoficina.fdqSituacoesSH.Close;
    dmShoficina.fdqSituacoesSH.Open;
    dmShoficina.fdqSituacoesSH.FetchAll;
    dmShoficina.fdqSituacoesSH.First;

    while not dmShoficina.fdqSituacoesSH.Eof do
    begin

      button3.Caption := IntToStr(dmShoficina.fdqSituacoesSH.RecNo) + '/' + IntToStr(dmShoficina.fdqSituacoesSH.RecordCount);
      Application.ProcessMessages;

      dmMSProcedure.fdspSituacoes_OS.Params[0].Value  := 0;
      dmMSProcedure.fdspSituacoes_OS.Params[1].Value  := dmShoficina.fdqSituacoesSHCODIGO.Value;
      dmMSProcedure.fdspSituacoes_OS.Params[2].Value  := UpperCase(RetirarAcentuacaoString(dmShoficina.fdqSituacoesSHNOME.Value));

      if dmShoficina.fdqSituacoesSHETAPA1.Value then//abertura os
        dmMSProcedure.fdspSituacoes_OS.Params[3].Value  := 1
      else
        dmMSProcedure.fdspSituacoes_OS.Params[3].Value  := 0;

      if dmShoficina.fdqSituacoesSHETAPA2.Value then//oficina
        dmMSProcedure.fdspSituacoes_OS.Params[4].Value  := 1
      else
        dmMSProcedure.fdspSituacoes_OS.Params[4].Value  := 0;

      if dmShoficina.fdqSituacoesSHETAPA3.Value then//fechamento os
        dmMSProcedure.fdspSituacoes_OS.Params[5].Value  := 1
      else
        dmMSProcedure.fdspSituacoes_OS.Params[5].Value  := 0;

      if dmShoficina.fdqSituacoesSHETAPA3_PG.Value then//condic�a� de fechamento
        dmMSProcedure.fdspSituacoes_OS.Params[6].Value  := 1
      else
        dmMSProcedure.fdspSituacoes_OS.Params[6].Value  := 0;

      if dmShoficina.fdqSituacoesSHPRONTO.Value then//pronto
        dmMSProcedure.fdspSituacoes_OS.Params[7].Value  := 1
      else
        dmMSProcedure.fdspSituacoes_OS.Params[7].Value  := 0;

      dmMSProcedure.fdspSituacoes_OS.Params[8].Value  := Date;
      dmMSProcedure.fdspSituacoes_OS.Params[9].Value  := Time;
      dmMSProcedure.fdspSituacoes_OS.Params[10].Value := dmDBEXMaster.iIdUsuario;
      dmMSProcedure.fdspSituacoes_OS.Params[11].Value := pubNomeComputador;
      dmMSProcedure.fdspSituacoes_OS.Params[12].Value := RetornarIP;
  
      dmMSProcedure.fdspSituacoes_OS.ExecProc;
      inc(iContador);

      dmShoficina.fdqSituacoesSH.Next;

    end;

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select max(codigo_situacao) as ultima_situacao from SITUACOES_OS');
    dmDBEXMaster.fdqMasterPesquisa.Open;

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;
    dmMSProcedure.fdspMaster.Params[0].Value := 'ALTER SEQUENCE GNR_SITUACOES_OS_ID RESTART WITH ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('ultima_situacao').AsInteger);
    dmMSProcedure.fdspMaster.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    LABEL3.Caption := 'foram inclu�dos: ' + IntToStr(iContador) + ' situa��es';
    Application.ProcessMessages;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmImportarShoficina.Button4Click(Sender: TObject);
begin

  dmShoficina.cdsFuncionarios.Open;
  dmShoficina.cdsFuncionarios.ProviderName := '';

end;

procedure TfrmImportarShoficina.Button5Click(Sender: TObject);
begin

  dmMProvider.cdsFuncionarios.Open;
  dmMProvider.cdsFuncionarios.ProviderName := '';

end;

procedure TfrmImportarShoficina.Button6Click(Sender: TObject);
begin

  dmShoficina.cdsUsuarios.Open;
  dmShoficina.cdsUsuarios.ProviderName := '';

end;

procedure TfrmImportarShoficina.Button7Click(Sender: TObject);
begin

  dmMProvider.cdsUsuarios.Open;
  dmMProvider.cdsUsuarios.ProviderName := '';

end;

procedure TfrmImportarShoficina.Button8Click(Sender: TObject);
begin

  dmShoficina.fdmFuncionarios.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Func.xml');

end;

procedure TfrmImportarShoficina.Button9Click(Sender: TObject);
begin

  dmShoficina.fdmFuncionarios.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Usu.xml');

end;

procedure TfrmImportarShoficina.FormCreate(Sender: TObject);
begin

  if FileExists(ExtractFilePath(ParamStr(0)) + 'Func.xml') then
    dmShoficina.fdmFuncionarios.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Func.xml');

  dmShoficina.fdmFuncionarios.Open;

  if FileExists(ExtractFilePath(ParamStr(0)) + 'Usu.xml') then
    dmShoficina.fdmUsuarios.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Usu.xml');

  dmShoficina.fdmUsuarios.Open;

end;

end.
