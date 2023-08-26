unit uDTMVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TdtmVendas = class(TDataModule)
    QryCliente: TZQuery;
    QryClienteclienteId: TIntegerField;

    QryClientenome: TWideStringField;

    QryProdutosprodutoId: TIntegerField;
    QryProdutosnome: TWideStringField;
    QryProdutosvalor: TFloatField;
    QryProdutosquantidade: TFloatField;

     QryProdutos: TZQuery;
    cdsItensVenda: TClientDataSet;
    dtsItensVenda: TDataSource;
    dtsCliente: TDataSource;
    dtsProduto: TDataSource;
    cdsItensVendaprodutoId: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaquantidade: TFloatField;
    cdsItensVendavalorUnitario: TFloatField;
    cdsItensVendavalorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendas: TdtmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDTMConexao;

{$R *.dfm}

procedure TdtmVendas.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;

  QryCliente.Open;
  QryProdutos.Open;
end;

procedure TdtmVendas.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;
  QryCliente.Close;
  QryProdutos.Close;
end;

end.
