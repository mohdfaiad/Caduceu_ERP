unit modUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdActns, System.Actions, Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.IBBase, Db, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.FB,
  FireDAC.Comp.UI, midaslib, FireDAC.Phys.IBWrapper;

type
  TfrmUsuarios = class(TForm)
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    pgcUsuarios: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    tdsCadastro: TTabSheet;
    grpCadastro: TGroupBox;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lblConfirmarSenha: TLabel;
    edtUsuario: TDBEdit;
    edtNome: TDBEdit;
    edtLogin: TDBEdit;
    edtSenha: TDBEdit;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgNovo: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    imgSalvar: TImage;
    imgExcluir: TImage;
    imgEditar: TImage;
    imgSair: TImage;
    lblF3: TLabel;
    lblF4: TLabel;
    lblF5: TLabel;
    lblF6: TLabel;
    ActionList1: TActionList;
    actEditar: TAction;
    actDesfazer: TAction;
    WindowClose1: TWindowClose;
    actMinimizar: TAction;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    edtConfirmarSenha: TEdit;
    chkSuperUsuario: TDBCheckBox;
    chkAtivo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtLoginExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtConfirmarSenhaExit(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    function AbrirTabelaUsuarios(pOpcao:smallint; pConteudo:string):boolean;
    procedure Tratar_Erro_Conexao(pE: exception);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure actMinimizarExecute(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure actEditarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkSuperUsuarioClick(Sender: TObject);
    procedure chkAtivoClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparMSG_ERRO;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses uConstantes_Padrao, uFuncoes, dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure;

function TfrmUsuarios.AbrirTabelaUsuarios(pOpcao: smallint;
  pConteudo: string): boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsUsuarios.Close;
  dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';;
  dmDBEXMaster.fdqUsuarios.SQL.Clear;
  dmDBEXMaster.fdqUsuarios.SQL.Add('SELECT * FROM USUARIOS');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_Usuarios(pOpcao,pConteudo);

  dmDBEXMaster.fdqUsuarios.SQL.Add(sWhere);
  dmDBEXMaster.fdqUsuarios.SQL.Add('ORDER BY NOME');

  try

    dmMProvider.cdsUsuarios.Open;
    dmMProvider.cdsUsuarios.ProviderName := '';

    if (dmMProvider.cdsUsuarios.IsEmpty) and (pOpcao <> 3) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + Trim(edtConteudoPesquisa.Text);
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsUsuarios.IsEmpty;

   except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;


end;

procedure TfrmUsuarios.actDesfazerExecute(Sender: TObject);
begin

  if dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert] then
  begin

    dmMProvider.cdsUsuarios.Cancel;
    HabilitaDesabilitaControles(False);

  end;

end;

procedure TfrmUsuarios.actEditarExecute(Sender: TObject);
begin

  if dmMProvider.cdsUsuarios.Active then
  begin

    if not (dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert]) then
    begin

      dmMProvider.cdsUsuarios.Edit;
      HabilitaDesabilitaControles(True);
      edtNome.SetFocus;

    end;

  end;

end;

procedure TfrmUsuarios.actExcluirExecute(Sender: TObject);
begin

  try

    HabilitaDesabilitaControles(False);
    pgcUsuarios.ActivePageIndex := 0;
    edtConfirmarSenha.Clear;

    dmDBEXMaster.FDIBSecurity1.Protocol                            := ipTCPIP;
    dmDBEXMaster.FDIBSecurity1.UserName                            := 'SYSDBA';
    dmDBEXMaster.FDIBSecurity1.Password                            := 'masterkey';

    dmDBEXMaster.FDIBSecurity1.AUserName                           := dmMProvider.cdsUsuariosLOGIN.Value;
    dmDBEXMaster.FDIBSecurity1.APassword                           := Copy(Crypt('C',dmMProvider.cdsUsuariosSENHA.Value),1,10);
    dmDBEXMaster.FDIBSecurity1.AFirstName                          := dmMProvider.cdsUsuariosNOME.Value;

    dmDBEXMaster.FDIBSecurity1.DeleteUser;

    dmMSProcedure.fdspUsuarios.Params[0].Value        := -1;
    dmMSProcedure.fdspUsuarios.Params[1].Value        := -1;
    dmMSProcedure.fdspUsuarios.Params[2].Value        := dmMProvider.cdsUsuariosNOME.Value;
    dmMSProcedure.fdspUsuarios.Params[3].Value        := dmMProvider.cdsUsuariosLOGIN.Value;
    dmMSProcedure.fdspUsuarios.Params[4].Value        := dmDBEXMaster.FDIBSecurity1.APassword;
    dmMSProcedure.fdspUsuarios.Params[5].Value        := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspUsuarios.Params[6].Value        := '';//pubNomeComputador;
    dmMSProcedure.fdspUsuarios.Params[7].Value        := '';//RetornarIP;
    dmMSProcedure.fdspUsuarios.Params[8].Value        := dmMProvider.cdsUsuariosSUPER_USUARIO.Value;
    dmMSProcedure.fdspUsuarios.Params[9].Value        := dmMProvider.cdsUsuariosATIVO.Value;
    dmMSProcedure.fdspUsuarios.ExecProc;

    dmMProvider.cdsUsuarios.Delete;

    dmDBEXMaster.fdcMaster.Close;;

    HabilitaDesabilitaControles(False);

    LimparMSG_ERRO;

  except
    on E: exception do
    begin

      if Pos('not found',E.Message) > 0 then
      begin

        try

          dmMSProcedure.fdspUsuarios.Params[0].Value        := -1;
          dmMSProcedure.fdspUsuarios.Params[1].Value        := -1;
          dmMSProcedure.fdspUsuarios.Params[2].Value        := dmMProvider.cdsUsuariosNOME.Value;
          dmMSProcedure.fdspUsuarios.Params[3].Value        := dmMProvider.cdsUsuariosLOGIN.Value;
          dmMSProcedure.fdspUsuarios.Params[4].Value        := dmDBEXMaster.FDIBSecurity1.APassword;
          dmMSProcedure.fdspUsuarios.Params[5].Value        := dmDBEXMaster.iIdUsuario;
          dmMSProcedure.fdspUsuarios.Params[6].Value        := '';//pubNomeComputador;
          dmMSProcedure.fdspUsuarios.Params[7].Value        := '';//RetornarIP;
          dmMSProcedure.fdspUsuarios.Params[8].Value        := dmMProvider.cdsUsuariosSUPER_USUARIO.Value;
          dmMSProcedure.fdspUsuarios.Params[9].Value        := dmMProvider.cdsUsuariosATIVO.Value;
          dmMSProcedure.fdspUsuarios.ExecProc;

          dmMProvider.cdsUsuarios.Delete;

          dmDBEXMaster.fdcMaster.Close;;

          HabilitaDesabilitaControles(False);
          LimparMSG_ERRO;

        except

          on E: exception do
          begin
            Tratar_Erro_Conexao(E);
            dmDBEXMaster.fdcMaster.Rollback;
          end;

        end;

      end
      else
      begin

        Tratar_Erro_Conexao(E);
        dmDBEXMaster.fdcMaster.Rollback;

      end;

    end;

  end;

end;

procedure TfrmUsuarios.actIncluirExecute(Sender: TObject);
begin

  if not (dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert]) then
  begin

    HabilitaDesabilitaControles(True);
    pgcUsuarios.ActivePageIndex := 1;
    edtConfirmarSenha.Clear;

    AbrirTabelaUsuarios(3,'');
    dmMProvider.cdsUsuarios.Append;

    edtNome.SetFocus;

  end;

end;

procedure TfrmUsuarios.actMinimizarExecute(Sender: TObject);
begin

  Application.Minimize;

end;

procedure TfrmUsuarios.actSalvarExecute(Sender: TObject);
begin

  if dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert] then
  begin

    if edtSenha.Text <> edtConfirmarSenha.Text then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTIR_NOVA_SENHA;
      Application.ProcessMessages;
      edtSenha.SetFocus;

    end
    else
    begin

      try

        dmDBEXMaster.fdcMaster.StartTransaction;

        dmDBEXMaster.FDIBSecurity1.Protocol                            := ipTCPIP;
        dmDBEXMaster.FDIBSecurity1.UserName                            := 'SYSDBA';
        dmDBEXMaster.FDIBSecurity1.Password                            := 'masterkey';

        dmDBEXMaster.FDIBSecurity1.AUserName                           := dmMProvider.cdsUsuariosLOGIN.Value;
        dmDBEXMaster.FDIBSecurity1.APassword                           := EnDecryptString(edtSenha.text,236);
        dmDBEXMaster.FDIBSecurity1.AFirstName                          := dmMProvider.cdsUsuariosNOME.Value;

        if dmMProvider.cdsUsuarios.State in [dsEdit] then
          dmDBEXMaster.FDIBSecurity1.ModifyUser
        else
          dmDBEXMaster.FDIBSecurity1.AddUser;

        dmMSProcedure.fdspUsuarios.Params[0].Value        := 0;

        if dmMProvider.cdsUsuariosUSUARIO.Value > 0 then
          dmMSProcedure.fdspUsuarios.Params[1].Value      := dmMProvider.cdsUsuariosUSUARIO.Value
        else
          dmMSProcedure.fdspUsuarios.Params[1].Value      := -1;

        dmMSProcedure.fdspUsuarios.Params[2].Value        := dmMProvider.cdsUsuariosNOME.Value;
        dmMSProcedure.fdspUsuarios.Params[3].Value        := dmMProvider.cdsUsuariosLOGIN.Value;
        dmMSProcedure.fdspUsuarios.Params[4].Value        := EnDecryptString(edtSenha.text,236);
        dmMSProcedure.fdspUsuarios.Params[5].Value        := dmDBEXMaster.iIdUsuario;
        dmMSProcedure.fdspUsuarios.Params[6].Value        := '';//pubNomeComputador;
        dmMSProcedure.fdspUsuarios.Params[7].Value        := '';//RetornarIP;
        dmMSProcedure.fdspUsuarios.Params[8].Value        := dmMProvider.cdsUsuariosSUPER_USUARIO.Value;
        dmMSProcedure.fdspUsuarios.Params[9].Value        := dmMProvider.cdsUsuariosATIVO.Value;
        dmMSProcedure.fdspUsuarios.Params[10].Value       := dmMProvider.cdsUsuariosAUTORIZA_FAT.Value;
        dmMSProcedure.fdspUsuarios.ExecProc;

        if dmMSProcedure.fdspUsuarios.Params[14].Value > 0 then
          dmMProvider.cdsUsuariosUSUARIO.Value            := dmMSProcedure.fdspUsuarios.Params[14].Value;

        dmMProvider.cdsUsuarios.Post;

        dmDBEXMaster.fdcMaster.Commit;
        dmDBEXMaster.fdcMaster.Close;;

        HabilitaDesabilitaControles(False);

      except

        on E: exception do
        begin

          if Pos('RDB',E.Message) > 0 then
          begin

            dmDBEXMaster.FDIBSecurity1.ModifyUser;

            dmDBEXMaster.fdqMasterPesquisa.Close;
            dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;;
            dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT * FROM USUARIOS');
            dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where login = ' + QuotedStr(dmMProvider.cdsUsuariosLOGIN.Value));
            dmDBEXMaster.fdqMasterPesquisa.Open;

            if not (dmDBEXMaster.fdqMasterPesquisa.IsEmpty) then
              dmMSProcedure.fdspUsuarios.Params[1].Value     := dmMProvider.cdsUsuariosUSUARIO.Value
            else
              dmMSProcedure.fdspUsuarios.Params[1].Value     := - 1;

            dmDBEXMaster.fdqMasterPesquisa.Close;

            dmMSProcedure.fdspUsuarios.Params[0].Value        := 0;
            dmMSProcedure.fdspUsuarios.Params[2].Value        := dmMProvider.cdsUsuariosNOME.Value;
            dmMSProcedure.fdspUsuarios.Params[3].Value        := dmMProvider.cdsUsuariosLOGIN.Value;
            dmMSProcedure.fdspUsuarios.Params[4].Value        := dmDBEXMaster.FDIBSecurity1.APassword;
            dmMSProcedure.fdspUsuarios.Params[5].Value        := dmDBEXMaster.iIdUsuario;
            dmMSProcedure.fdspUsuarios.Params[6].Value        := '';//pubNomeComputador;
            dmMSProcedure.fdspUsuarios.Params[7].Value        := '';//RetornarIP;
            dmMSProcedure.fdspUsuarios.Params[8].Value        := dmMProvider.cdsUsuariosSUPER_USUARIO.Value;
            dmMSProcedure.fdspUsuarios.Params[9].Value        := dmMProvider.cdsUsuariosATIVO.Value;
            dmMSProcedure.fdspUsuarios.Params[10].Value       := dmMProvider.cdsUsuariosAUTORIZA_FAT.Value;
            dmMSProcedure.fdspUsuarios.ExecProc;

            if dmMSProcedure.fdspUsuarios.Params[14].AsInteger > 0 then
              dmMProvider.cdsUsuariosUSUARIO.Value             := dmMSProcedure.fdspUsuarios.Params[14].Value;

            if dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert] then
              dmMProvider.cdsUsuarios.Post;

            dmDBEXMaster.fdcMaster.Commit;
            dmDBEXMaster.fdcMaster.Close;;

            HabilitaDesabilitaControles(False);

          end
          else if Pos('not found',E.Message) > 0 then
          begin

            dmDBEXMaster.FDIBSecurity1.Protocol                            := ipTCPIP;
            dmDBEXMaster.FDIBSecurity1.UserName                            := 'SYSDBA';
            dmDBEXMaster.FDIBSecurity1.Password                            := 'masterkey';

            dmDBEXMaster.FDIBSecurity1.AUserName                           := dmMProvider.cdsUsuariosLOGIN.Value;
            dmDBEXMaster.FDIBSecurity1.APassword                           := EnDecryptString(edtSenha.text,236);
            dmDBEXMaster.FDIBSecurity1.AFirstName                          := dmMProvider.cdsUsuariosNOME.Value;

            dmDBEXMaster.FDIBSecurity1.AddUser;

            HabilitaDesabilitaControles(False);

          end

          else
          begin

            Tratar_Erro_Conexao(E);
            dmDBEXMaster.fdcMaster.Rollback;

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmUsuarios.chkSuperUsuarioClick(Sender: TObject);
begin

  if dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert] then
  begin

    if chkSuperUsuario.Checked then
      dmMProvider.cdsUsuariosSUPER_USUARIO.Value := 1
    else
      dmMProvider.cdsUsuariosSUPER_USUARIO.Value := 0;

  end;

end;

procedure TfrmUsuarios.chkAtivoClick(Sender: TObject);
begin

  if dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert] then
  begin

    if chkAtivo.Checked then
      dmMProvider.cdsUsuariosATIVO.Value := 1
    else
      dmMProvider.cdsUsuariosATIVO.Value := 0;

  end;

end;

procedure TfrmUsuarios.edtConfirmarSenhaExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmUsuarios.edtConteudoPesquisaEnter(Sender: TObject);
begin

   pgcUsuarios.Pages[1].TabVisible := false;

   MudarCorEdit(Sender);

end;

procedure TfrmUsuarios.edtConteudoPesquisaExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    if AbrirTabelaUsuarios(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
      grdTabela.SetFocus;

    edtConteudoPesquisa.Clear;
    MudarCorEdit(Sender);

  end;

end;

procedure TfrmUsuarios.edtConteudoPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iDirecao: Integer;
begin

  // habilita movimenta��o dos campos com as setas acima/abaixo
  iDirecao := -1;

  case Key of

    VK_DOWN:iDirecao := 0; { Pr�ximo }
    VK_UP:iDirecao := 1; { Anterior }

  end;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;

end;

procedure TfrmUsuarios.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmUsuarios.edtLoginExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmUsuarios.edtNomeEnter(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmUsuarios.edtNomeExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmUsuarios.edtSenhaExit(Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                               := COR_PADRAO_TELAS;
  Caption                             := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  dmDBEXMaster.sNomeUsuario           := ParamStr(1);
  dmDBEXMaster.sSenha                 := paramstr(2);
  dmDBEXMaster.iIdUsuario             := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial              := StrToInt(ParamStr(4));

  pgcUsuarios.Pages[1].TabVisible     := False;
  pgcUsuarios.ActivePageIndex         := 0;

end;

procedure TfrmUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO;

  end;

end;

procedure TfrmUsuarios.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsUsuarios.IsEmpty then
  begin

    pgcUsuarios.Pages[1].TabVisible  := True;
    pgcUsuarios.ActivePageIndex      := 1;

  end;

end;

procedure TfrmUsuarios.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsUsuarios.IsEmpty then
  begin

    if not odd(dmMProvider.cdsUsuarios.RecNo) then
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := clWhite;

    end;

    grdTabela.Canvas.FillRect(Rect);
    grdTabela.DefaultDrawDataCell(Rect, Column.Field, State);

  end;


end;

procedure TfrmUsuarios.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(Self);

end;

procedure TfrmUsuarios.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpCadastro.Enabled := pOpcao;

end;


procedure TfrmUsuarios.lblF5Click(Sender: TObject);
begin

  if dmMProvider.cdsUsuarios.Active then
  begin

    if not (dmMProvider.cdsUsuarios.State in [dsEdit, dsInsert]) then
    begin

      LimparMSG_ERRO;

      lblMsg.Tag      := -1;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

    end;

  end;

end;

procedure TfrmUsuarios.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmUsuarios.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmUsuarios.Tratar_Erro_Conexao(pE: exception);
var
  sChave_Extrang:string;
begin

  if Pos('Unable',pE.Message) > 0then
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_CONEXAO_BANCO
  else if Pos('FOREIGN',pE.Message) > 0then
  begin

    sChave_Extrang := Trim(Copy(pE.Message,pos('ON TABLE',Uppercase(pE.Message))+ 10,Length(pE.Message)));

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ERRO_CHAVE_ESTRANGEIRA
                      + Copy(sChave_Extrang,1,pos('"',sChave_Extrang)-1);

  end
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + pE.Message;

  TocarSomAlerta(ord(SystemHand));

end;

procedure TfrmUsuarios.WindowClose1Execute(Sender: TObject);
begin

  close;

end;

end.
