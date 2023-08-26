unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uFrmAtualizaDB, cUsuarioLogado,
  Vcl.ComCtrls, ZDbcIntfs, cAtualizacaoBancoDeDados, RLReport, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,cFuncao,cAtualizacaoTabelaMSSQL;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    mnuFechar: TMenuItem;
    VENDA1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    CATEGORIA2: TMenuItem;
    FICHADECLIENTE1: TMenuItem;
    PRODUTOSPORCATEGORIA1: TMenuItem;
    USURIO1: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    StbPrincipal: TStatusBar;
    AOACESSO1: TMenuItem;
    USURIOSVSAES1: TMenuItem;
    N7: TMenuItem;
    pnlDashBoard: TPanel;
    PnlDireita: TPanel;
    pnlEsquerda: TPanel;
    Splitter1: TSplitter;
    pnlProdutoEstoque: TPanel;
    pnlVendasDaUltimaSemana: TPanel;
    Splitter2: TSplitter;
    pnlVendaPorClienteUltimaSemana: TPanel;
    Splitter3: TSplitter;
    pnl10ProdutosMaisVendidos: TPanel;
    DBChart1: TDBChart;
    DBChart2: TDBChart;
    DBChart3: TDBChart;
    DBChart4: TDBChart;
    tmrAtualizacaoDashBoard: TTimer;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    SAIR1: TMenuItem;
    Series1: TBarSeries;
    Series2: TPieSeries;
    Series3: TPieSeries;
    Series4: TFastLineSeries;
    N11: TMenuItem;
    CONFIG1: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDA1Click(Sender: TObject);
    procedure CATEGORIA2Click(Sender: TObject);
    procedure CLIENTE2Click(Sender: TObject);
    procedure FICHADECLIENTE1Click(Sender: TObject);
    procedure PRODUTO2Click(Sender: TObject);
    procedure PRODUTOSPORCATEGORIA1Click(Sender: TObject);
    procedure VENDAPORDATA1Click(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALTERARSENHA1Click(Sender: TObject);
    procedure AOACESSO1Click(Sender: TObject);
    procedure USURIOSVSAES1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pnlDashBoardClick(Sender: TObject);
    procedure tmrAtualizacaoDashBoardTimer(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);

  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    procedure AtualizarDashBoard;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado: TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto, uProVenda, uRelCategoria,
  uRelCadCliente, uRelCadClienteFicha, uRelCadProduto,
  uRelCadProdutoComGrupoCategoria, uSelecionarData, uRelVendaPorData,
  uCadUsuario, uLogin, uAlterarSenha, cArquivoIni, uCadAcaoAcesso,
  cAcaoAcesso, uUsuarioVsAcoes, uTelaHeranca, uDTMGrafico;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadCategoria,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.CATEGORIA2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCategoria,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadCliente,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.CLIENTE2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadCliente,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;



procedure TfrmPrincipal.FICHADECLIENTE1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadClienteFicha,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  PnlDireita.Width := Screen.Width div 2;
  pnlProdutoEstoque.Height := PnlDireita.Height div 2;
  pnlVendaPorClienteUltimaSemana.Height := pnlProdutoEstoque.Height;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
  FreeAndNil(DTMGrafico);

  if Assigned(oUsuarioLogado) then
     FreeAndNil(oUsuarioLogado);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not FileExists(TArquivoIni.ArquivoIni) then
  begin
    TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MYSQL');
    TArquivoIni.AtualizarIni('SERVER', 'HostName', 'localhost');
    TArquivoIni.AtualizarIni('SERVER', 'Port', '3306');
    TArquivoIni.AtualizarIni('SERVER', 'User', 'root');
    TArquivoIni.AtualizarIni('SERVER', 'Password', '');
    TArquivoIni.AtualizarIni('SERVER', 'Database', 'vendas');

    MessageDlg('Arquivo '+ TArquivoIni.ArquivoIni +' Criado com sucesso'+#13+' Configure o arquivo antes de inicializar aplica��o',MtInformation,[mbok],0);

    Application.Terminate;
  end
  else
  begin
    frmAtualizaDB:=TfrmAtualizaDB.Create(self);
    frmAtualizaDB.Show;
    frmAtualizaDB.Refresh;

    dtmPrincipal := TdtmPrincipal.Create(Self);

    with dtmPrincipal.ConexaoDB do
    begin
      Connected:=False;
      SQLHourGlass:=False;
      if TArquivoIni.LerIni('SERVER','TipoDataBase')='MYSQL' then
      Protocol := 'MariaDB-10'; //Protocolo do banco de dados
      LibraryLocation:= ExtractFilePath(Application.ExeName)+'libmysql.dll';    //'C:\Users\user\Documents\Embarcadero\Studio\Projects\NewKronos\Aplicacoes\Suporte\libpq.dll';
      HostName:=TArquivoIni.LerIni('SERVER','HostName'); //Instancia
      Port:=StrToInt(TArquivoIni.LerIni('SERVER','Port'));  //Porta
      User:=TArquivoIni.LerIni('SERVER','User');  //Usuario do Banco de Dados
      Password:=TArquivoIni.LerIni('SERVER','Password');  //Senha do Usu�rio do banco
      Database:= TArquivoIni.LerIni('SERVER','database');  //Nome do Banco de Dados
      AutoCommit:=True;
      TransactIsolationLevel:=tiReadCommitted;
      Connected:=true;
    end;


    AtualizacaoBancoDados(frmAtualizaDB);

    TAcaoAcesso.CriarAcoes(TfrmCadCategoria,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadCliente,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadProduto,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadUsuario,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmAlterarSenha,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmProVenda,DtmPrincipal.ConexaoDB);

    TAcaoAcesso.CriarAcoes(TfrmRelProVendaPorData,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadClienteFicha,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadCliente,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadProdutoComGrupoCategoria,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCadProduto,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCategoria,DtmPrincipal.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes,DtmPrincipal.ConexaoDB);



    TAcaoAcesso.PreencherUsuariosVsAcoes(DtmPrincipal.ConexaoDB);

    DTMGrafico:=TDTMGrafico.Create(self);
    AtualizarDashBoard;

    frmAtualizaDB.Free;

    TeclaEnter:= TMREnter.Create(Self);
    TeclaEnter.FocusEnabled:=true;
    TeclaEnter.FocusColor:=clInfoBk;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    oUsuarioLogado := TUsuarioLogado.Create;

    frmLogin:= TfrmLogin.Create(self);
    frmLogin.ShowModal;
  finally
    frmLogin.Release;
    StbPrincipal.Panels[0].Text:='USU�RIO: '+oUsuarioLogado.nome;
  end;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  //Close;
  Application.Terminate;
end;

procedure TfrmPrincipal.pnlDashBoardClick(Sender: TObject);
begin
  AtualizarDashBoard;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadProduto,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.PRODUTO2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadProduto,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.PRODUTOSPORCATEGORIA1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCadProdutoComGrupoCategoria,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.SAIR1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.tmrAtualizacaoDashBoardTimer(Sender: TObject);
begin
 AtualizarDashBoard;
end;

procedure TfrmPrincipal.USURIO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadUsuario,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.USURIOSVSAES1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmUsuarioVsAcoes,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.VENDA1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmProVenda,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.VENDAPORDATA1Click(Sender: TObject);
begin


  Try
    frmSelecionarData:=TfrmSelecionarData.Create(Self);
    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, frmSelecionarData.Name,DtmPrincipal.ConexaoDB) then
    begin
      frmSelecionarData.ShowModal;

      frmRelProVendaPorData:=TfrmRelProVendaPorData.Create(self);
      frmRelProVendaPorData.QryVendas.Close;
      frmRelProVendaPorData.QryVendas.ParamByName('DataInicio').AsDate:=frmSelecionarData.EdtDataInicio.Date;
      frmRelProVendaPorData.QryVendas.ParamByName('DataFim').AsDate:=frmSelecionarData.EdtDataFinal.Date;
      frmRelProVendaPorData.QryVendas.Open;
      frmRelProVendaPorData.Relatorio.PreviewModal;
    end
    else begin
       MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
    end;

  Finally
    if Assigned(frmSelecionarData) then
       frmSelecionarData.Release;
    if Assigned(frmRelProVendaPorData) then
       frmRelProVendaPorData.Release;
  End;
end;

procedure TfrmPrincipal.ALTERARSENHA1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmAlterarSenha,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.AOACESSO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadAcaoAcesso,oUsuarioLogado,dtmPrincipal.ConexaoDB);
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizaDB);
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin
  aForm.Refresh;


  try
    oAtualizarMSSQL:=TAtualizaBancoDadosMSSQL.Create(DtmPrincipal.ConexaoDB);
    oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
  finally
    if Assigned(oAtualizarMSSQL) then
       FreeAndNil(oAtualizarMSSQL);
  end;

end;


procedure TfrmPrincipal.AtualizarDashBoard;
begin
  Try

    Screen.Cursor:=crSQLWait;
    if DTMGrafico.QryProdutoEstoque.Active then
       DTMGrafico.QryProdutoEstoque.Close;


    if DTMGrafico.QryValorVendaPorCliente.Active then
       DTMGrafico.QryValorVendaPorCliente.Close;

    if DTMGrafico.QryVendasUltimasSemana.Active then
       DTMGrafico.QryVendasUltimasSemana.Close;

    if DTMGrafico.Qry10ProdutosMaisVendidos.Active then
       DTMGrafico.Qry10ProdutosMaisVendidos.Close;

    DTMGrafico.QryProdutoEstoque.Open;
    DTMGrafico.QryValorVendaPorCliente.Open;
    DTMGrafico.QryVendasUltimasSemana.Open;
    DTMGrafico.Qry10ProdutosMaisVendidos.Open;


  Finally
    Screen.Cursor:=crDefault;
  End;
end;


end.
