unit cAtualizacaoTabelaMSSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     cAtualizacaoBancoDeDados,
     cCadUsuario;

type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)

  private
    function  TabelaExiste(aNomeTabela:String):Boolean;
    procedure Categoria;
    procedure Cliente;
    procedure Produto;
    procedure Vendas;
    procedure VendasItens;
    procedure Usuario;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;
    procedure releaseConexao(base : string);

  protected

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
  end;

implementation

{ TAtualizacaoTableMSSQL }

constructor TAtualizacaoTableMSSQL.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
  Categoria;
  Cliente;
  Produto;
  Vendas;
  VendasItens;
  Usuario;
  AcaoAcesso;
  UsuariosAcaoAcesso;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin
  inherited;
end;

function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela: String): Boolean;
Var Qry:TZQuery;
registro : integer;
novaConexao : TZConnection;
Begin

  Try
    Result:=False;
    registro := 0;
    releaseConexao('information_schema');

  try
    Qry:=TZQuery.Create(nil);
    Qry.Connection:= ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('Select TABLE_ID as ID from INNODB_SYS_TABLES where NAME = :NomeTabela');
    Qry.ParamByName('NomeTabela').AsString:= 'vendas/'+aNomeTabela;
    Qry.Open;
   registro := Qry.FieldByName('ID').AsInteger;

   Except On E : Exception do
   begin
        showMessage(E.Message);
   end;

   end;



    if registro > 0 then
       Result:=True;

  Finally

    Qry.Close;
 //   FreeAndNil(novaConexao);

    if Assigned(Qry) then
       FreeAndNil(Qry);

       



  End;



end;

procedure TAtualizacaoTableMSSQL.releaseConexao(base : string);
begin
with ConexaoDB do
begin
Disconnect;
Database := base;
Connect;

end;



end;


procedure TAtualizacaoTableMSSQL.AcaoAcesso;
begin

    ExecutaDiretoBancoDeDados(
      'CREATE TABLE IF NOT EXISTS acaoAcesso ( '+
      '	 acaoAcessoId int (11) not null, '+
      '	 descricao varchar(100) not null, '+
      '	 chave varchar(60) not null, '+
      '	 PRIMARY KEY (acaoAcessoId) '+
      '	) '
    );

end;

procedure TAtualizacaoTableMSSQL.Categoria;
begin

    ExecutaDiretoBancoDeDados(
      'CREATE TABLE IF NOT EXISTS categorias(  '+
      '   categoriaId int (11) NOT NULL, '+
      '   descricao  varchar(30) NULL, '+
      '   PRIMARY KEY (categoriaId) '+
      ') '
    );

end;

procedure TAtualizacaoTableMSSQL.Cliente;
begin

    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE IF NOT EXISTS clientes(   '+
      '		clienteId int(11) NOT NULL,    '+
      '		nome varchar(60) NULL,   '+
      '		endereco varchar(60) null,  '+
      '		cidade varchar(50) null,   '+
      '		bairro varchar(40) null,  '+
      '		estado varchar(2) null,  '+
      '		cep varchar(10) null,   '+
      '		telefone varchar(14) null, '+
      '		email varchar(100) null,  '+
      '		dataNascimento datetime null,   '+
      '		PRIMARY KEY (clienteId)  '+
      '	)  '
    );

end;

procedure TAtualizacaoTableMSSQL.Produto;
begin

    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE IF NOT EXISTS produtos(  '+
      '		produtoId int(11) NOT NULL, '+
      '		nome varchar(60) NULL, '+
      '		descricao varchar(255) null, '+
      '		valor decimal(18,5) default 0.00000 null, '+
      '		quantidade decimal(18,5) default 0.00000 null, '+
      '		categoriaId int null, '+
      '		PRIMARY KEY (produtoId), '+
      '		CONSTRAINT FK_ProdutosCategorias '+
      '		FOREIGN KEY (categoriaId) references categorias(categoriaId) '+
      '	) '
    );

end;

procedure TAtualizacaoTableMSSQL.Vendas;
begin
;
    ExecutaDiretoBancoDeDados(
      '	CREATE TABLE IF NOT EXISTS vendas (  '+
      '	  vendaId int(11) not null, '+
      '	  clienteId int not null, '+
      '	  dataVenda datetime default TIME_STAMP, '+
      '	  totalVenda decimal(18,5) default 0.00000, '+

      '	  PRIMARY KEY (vendaId), '+
      '	  CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId) '+
      '		REFERENCES clientes(clienteId) '+
      '	) '
    );

end;

procedure TAtualizacaoTableMSSQL.VendasItens;
begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE IF NOT EXISTS vendasItens (   '+
      ' 	vendaId int not null,  '+
      '	  produtoId int not null,  '+
      '	  valorUnitario decimal (18,5) default 0.00000,  '+
      '	  quantidade decimal (18,5) default 0.00000,  '+
      '	  totalProduto decimal (18,5) default 0.00000,  '+

      '	  PRIMARY KEY (vendaId,produtoId),  '+
      '	  CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)  '+
      '		REFERENCES produtos(produtoId)  '+
      '	)  '
    );

end;

procedure TAtualizacaoTableMSSQL.Usuario;
Var oUsuario:TUsuario;
begin

    ExecutaDiretoBancoDeDados(
      'CREATE TABLE IF NOT EXISTS usuarios ( '+
      '	 usuarioId int(11) not null, '+
      '	 nome varchar(50) not null, '+
      '	 senha varchar(40) not null, '+
      '	 PRIMARY KEY (usuarioId) '+
      '	) '
    );


  Try
    oUsuario:=TUsuario.Create(ConexaoDB);
    oUsuario.nome:='ADMIN';
    oUsuario.senha:='mudar@123';
    if not oUsuario.UsuarioExiste(oUsuario.nome) then
      oUsuario.Inserir;
  Finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  End;

end;


procedure TAtualizacaoTableMSSQL.UsuariosAcaoAcesso;
begin

   // releaseConexao('vendas');
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE IF NOT EXISTS usuariosAcaoAcesso( '+
      '	 usuarioId int(11) NOT NULL, '+
      '	 acaoAcessoId int(11) NOT NULL, '+
      '	 ativo TINYINT not null default 1, '+
      '	 PRIMARY KEY (usuarioId), '+
      '	 CONSTRAINT FK_UsuarioAcaoAcessoUsuario '+
      '	 FOREIGN KEY (usuarioId) references usuarios(usuarioId), '+
      '	 CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso '+
      '	 FOREIGN KEY (acaoAcessoId) references acaoAcesso(acaoAcessoId) '+
      '	) '
    );


end;

end.
