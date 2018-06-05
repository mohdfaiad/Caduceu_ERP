program CaduceuERP;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  System.SysUtils,
  windows,
  midaslib,
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modLogin in 'Modulo Login\modLogin.pas' {frmLogin},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataSintegraSped in 'Data_Modulos\dataSintegraSped.pas' {dmSintegraSPED: TDataModule},
  modProdutoEntraSaiPromocao in '..\..\Formularios Genericos\modProdutoEntraSaiPromocao.pas' {frmProdutoEntraSaiPromocao};

{$R *.res}
var
  Hwnd: integer;

begin

  if Windows_em_Modo_seguranca then
    raise exception.Create('')
  else
  begin

    Hwnd := FindWindow('TApplication', 'GenesisAC');

    if Hwnd = 0 then
    begin

      Application.Initialize;
      TStyleManager.TrySetStyle('Windows10 Blue');
  Application.Title := 'Caduceu - ERP';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmSintegraSPED, dmSintegraSPED);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;

    end
    else
      // Esta funcao traz para frente (da o foco) para a janela
      // da aplicacao que ja esta rodando
      ShowWindow(Hwnd, SW_SHOWNORMAL);

  end;

end.
