unit dataShoficina;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Phys.ODBCBase,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Stan.StorageXML;

type
  TdmShoficina = class(TDataModule)
    fdcShoficina: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    fdqClientesSH: TFDQuery;
    fdqUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    dtsUsuarios: TDataSource;
    fdqEquipamentos: TFDQuery;
    fdqSituacoesSH: TFDQuery;
    fdqFuncionarios: TFDQuery;
    dspFuncionarios: TDataSetProvider;
    cdsFuncionarios: TClientDataSet;
    dtsFuncionarios: TDataSource;
    cdsUsuariosCODIGO: TAutoIncField;
    cdsUsuariosNOME: TWideStringField;
    cdsUsuariosSENHA: TWideStringField;
    cdsFuncionariosCODIGO: TIntegerField;
    cdsFuncionariosNOME: TWideStringField;
    fdqOS: TFDQuery;
    fdqClientesSHCODIGO: TIntegerField;
    fdqClientesSHNOME: TWideStringField;
    fdqClientesSHGRUPO: TWideStringField;
    fdqClientesSHCONTATO: TWideStringField;
    fdqClientesSHCPF_CNPJ: TWideStringField;
    fdqClientesSHIE_RG: TWideStringField;
    fdqClientesSHENDERECO: TWideStringField;
    fdqClientesSHCEP: TWideStringField;
    fdqClientesSHBAIRRO: TWideStringField;
    fdqClientesSHCIDADE: TWideStringField;
    fdqClientesSHUF: TWideStringField;
    fdqClientesSHTELEFONE: TWideStringField;
    fdqClientesSHEMAIL: TWideStringField;
    fdqClientesSHOBSERVACAO: TWideMemoField;
    fdqClientesSHCELULAR: TWideStringField;
    fdqClientesSHSITE: TWideStringField;
    fdqClientesSHFAX: TWideStringField;
    fdqClientesSHANIVERSARIO: TSQLTimeStampField;
    fdqClientesSHSITUACAO: TSmallintField;
    fdqClientesSHCRM_VENDAS: TIntegerField;
    fdqClientesSHCRM_SERVICOS: TIntegerField;
    fdqClientesSHCRM_X1: TSingleField;
    fdqClientesSHCRM_X2: TSingleField;
    fdqClientesSHSENHAWEB: TWideStringField;
    fdqClientesSHGARANTIDOR: TBooleanField;
    fdqClientesSHULTIMA_VENDA: TSQLTimeStampField;
    fdqClientesSHCADASTRADO: TSQLTimeStampField;
    fdqClientesSHBLOQUEADO: TBooleanField;
    fdqClientesSHNFANTASIA: TWideStringField;
    fdqClientesSHCOD_PAIS: TIntegerField;
    fdqClientesSHNUMERO: TWideStringField;
    fdqClientesSHCOMPLEM: TWideStringField;
    fdqClientesSHTIPO_CLIENTE: TByteField;
    fdqClientesSHLIMITE: TCurrencyField;
    fdqClientesSHID_RADIO: TWideStringField;
    fdqClientesSHCOB_ENDERECO: TWideStringField;
    fdqClientesSHCOB_PAI: TWideStringField;
    fdqClientesSHCOB_MAE: TWideStringField;
    fdqClientesSHCOB_OBS: TWideMemoField;
    fdqClientesSHEMAIL_NFE: TWideStringField;
    fdqClientesSHVENDEDOR: TIntegerField;
    fdqClientesSHCAMPO_LIVRE_1: TWideStringField;
    fdqClientesSHCAMPO_LIVRE_2: TWideStringField;
    fdqClientesSHCAMPO_LIVRE_3: TWideStringField;
    fdqClientesSHSEXO: TByteField;
    fdqClientesSHINS_MUN: TWideStringField;
    fdqClientesSHSUFRAMA: TWideStringField;
    fdqClientesSHRADIO_NX: TWideStringField;
    fdqClientesSHidEstrangeiro: TWideStringField;
    fdqClientesSHcbindIEDest: TByteField;
    fdqClientesSHCOB_OBS_ALERT: TBooleanField;
    fdqEquipamentosCODIGO: TFDAutoIncField;
    fdqEquipamentosCOD_CLIENTE: TIntegerField;
    fdqEquipamentosDESCRICAO: TWideStringField;
    fdqEquipamentosMARCA: TWideStringField;
    fdqEquipamentosMODELO: TWideStringField;
    fdqEquipamentosSERIE: TWideStringField;
    fdqEquipamentosPAT: TWideStringField;
    fdqEquipamentosOBSERVACOES: TWideStringField;
    fdqEquipamentosDATA_COMPRA: TSQLTimeStampField;
    fdqEquipamentosREVENDA: TWideStringField;
    fdqEquipamentosNUM_NF: TWideStringField;
    fdqEquipamentosNUM_CERTGAR: TWideStringField;
    fdqEquipamentosCAMPO_BOOL: TBooleanField;
    fdqEquipamentosCAMPO_DOUBLE: TFloatField;
    fdqSituacoesSHCODIGO: TFDAutoIncField;
    fdqSituacoesSHNOME: TWideStringField;
    fdqSituacoesSHETAPA1: TBooleanField;
    fdqSituacoesSHETAPA2: TBooleanField;
    fdqSituacoesSHETAPA3: TBooleanField;
    fdqSituacoesSHETAPA3_PG: TBooleanField;
    fdqSituacoesSHPRONTO: TBooleanField;
    fdqSituacoesSHSUBGRUPO: TIntegerField;
    fdqSituacoesSHCOR_FONTE: TCurrencyField;
    fdqSituacoesSHCOR_FUNDO: TCurrencyField;
    fdqSituacoesSHPLANO_CONTA: TIntegerField;
    fdqOSCODIGO: TIntegerField;
    fdqOSCOD_CLIENTE: TIntegerField;
    fdqOSENTRADA: TSQLTimeStampField;
    fdqOSPRONTO: TSQLTimeStampField;
    fdqOSSAIDA: TSQLTimeStampField;
    fdqOSGARANTIA: TSQLTimeStampField;
    fdqOSSITUACAO: TIntegerField;
    fdqOSV_MAO: TCurrencyField;
    fdqOSV_PECAS: TCurrencyField;
    fdqOSV_DESLOCA: TCurrencyField;
    fdqOSV_TERCEIRO: TCurrencyField;
    fdqOSV_OUTROS: TCurrencyField;
    fdqOSCOD_EQUIP: TIntegerField;
    fdqOSAPARELHO: TWideStringField;
    fdqOSMARCA: TWideStringField;
    fdqOSMODELO: TWideStringField;
    fdqOSSERIE: TWideStringField;
    fdqOSPATRIMONIO: TWideStringField;
    fdqOSACESSORIO: TWideStringField;
    fdqOSDEFEITO: TWideMemoField;
    fdqOSOBS_SERVICO: TWideMemoField;
    fdqOSLAUDO: TWideMemoField;
    fdqOSOBS_APARELHO: TWideStringField;
    fdqOSKILOMET: TIntegerField;
    fdqOSNUM_NF_PED: TWideStringField;
    fdqOSEM_USO: TBooleanField;
    fdqOSNF_NUMERO: TIntegerField;
    fdqOSOS_REABERTA: TBooleanField;
    fdqOSOS_OUTROS: TFloatField;
    fdqOSOS_OUTROS_EMIT: TIntegerField;
    fdqOSOS_SINAL: TCurrencyField;
    fdqOSPRIOR: TByteField;
    fdqOSOS_NF_REMESSA: TIntegerField;
    fdqOSOS_NF_VALOR: TCurrencyField;
    fdqOSOS_NF_EMIT: TIntegerField;
    fdqOSOS_GARANTIDOR: TIntegerField;
    fdqOSOS_GARANTIDOR_SN: TWideStringField;
    fdqOSV_FRETE: TCurrencyField;
    fdqOSV_SEGURO: TCurrencyField;
    fdqOSWEB_CHAVE: TWideStringField;
    fdqOSWEB_SENHA: TWideStringField;
    fdqOSUSER_MICRO: TWideStringField;
    fdqOSORCA_FORMAS: TWideMemoField;
    fdqOSALERTA_ABANDONO: TSQLTimeStampField;
    fdqOSTECNICO_FIXO: TIntegerField;
    fdqOSOS_FABRICANTE: TWideStringField;
    fdqOSNFC_NUMERO: TIntegerField;
    fdqOSPREVISTO: TSQLTimeStampField;
    fdqOSATENDENTE: TIntegerField;
    fdmFuncionarios: TFDMemTable;
    fdmUsuarios: TFDMemTable;
    fdmFuncionariosID_GENESIS: TIntegerField;
    fdmFuncionariosID_SHOFICINA: TIntegerField;
    fdmUsuariosID_GENESIS: TIntegerField;
    fdmUsuariosID_SHOFICINA: TIntegerField;
    dtsUsu: TDataSource;
    dstFun: TDataSource;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    fdqHist_OS: TFDQuery;
    fdqHist_OSCODIGO: TFDAutoIncField;
    fdqHist_OSCOD_ORDEM: TIntegerField;
    fdqHist_OSDESCRICAO: TWideStringField;
    fdqHist_OSQUEM: TWideStringField;
    fdqHist_OSUSUARIO: TWideStringField;
    fdqHist_OSDATA_CADASTRO: TSQLTimeStampField;
    fdqPecas_SH: TFDQuery;
    fdqServicos_SH: TFDQuery;
    fdqPecas_SHCODIGO: TFDAutoIncField;
    fdqPecas_SHDESCRICAO: TWideStringField;
    fdqPecas_SHCOD_PECA: TIntegerField;
    fdqPecas_SHVALOR: TCurrencyField;
    fdqPecas_SHTECNICO: TIntegerField;
    fdqPecas_SHQTD: TFloatField;
    fdqPecas_SHDIA: TSQLTimeStampField;
    fdqPecas_SHCOD_OS: TIntegerField;
    fdqPecas_SHCUSTO: TCurrencyField;
    fdqPecas_SHXPED: TWideStringField;
    fdqPecas_SHNITEMPED: TWideStringField;
    fdqPecas_SHSERIAIS_IN: TWideMemoField;
    fdqPecas_SHCOD_BAIXA: TIntegerField;
    fdqServicos_SHCODIGO: TFDAutoIncField;
    fdqServicos_SHDESCRICAO: TWideStringField;
    fdqServicos_SHTOTAL: TCurrencyField;
    fdqServicos_SHINICIO: TSQLTimeStampField;
    fdqServicos_SHFIM: TSQLTimeStampField;
    fdqServicos_SHTECNICO: TIntegerField;
    fdqServicos_SHTIPO: TByteField;
    fdqServicos_SHOS_NUM: TIntegerField;
    fdqServicos_SHCOD_SERV: TIntegerField;
    fdqServicos_SHQTD: TCurrencyField;
    fdqServicos_SHCUSTO: TCurrencyField;
    fdqServicos_SHXPED: TWideStringField;
    fdqServicos_SHNITEMPED: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmShoficina: TdmShoficina;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmShoficina.DataModuleCreate(Sender: TObject);
begin

  fdcShoficina.Params.Database := 'C:\Sharmarq\Shoficina\Dados.MDB';

end;

end.
