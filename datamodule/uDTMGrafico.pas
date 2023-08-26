unit uDTMGrafico;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TDTMGrafico = class(TDataModule)
    QryProdutoEstoque: TZQuery;
    QryValorVendaPorCliente: TZQuery;
    Qry10ProdutosMaisVendidos: TZQuery;
    QryVendasUltimasSemana: TZQuery;
    QryProdutoEstoqueLabel: TWideStringField;
    QryProdutoEstoqueValue: TFloatField;
    QryValorVendaPorClienteLabel: TWideStringField;
    QryValorVendaPorClienteValue: TFloatField;
    Qry10ProdutosMaisVendidosLabel: TWideStringField;
    Qry10ProdutosMaisVendidosValue: TFloatField;
    QryVendasUltimasSemanaLabel: TWideStringField;
    QryVendasUltimasSemanaValue: TFloatField;
//QryProdutoEstoqueLabel: TWideStringField;

   // QryValorVendaPorClienteLabel: TWideStringField;
   // Qry10ProdutosMaisVendidos: TZQuery;

  //  QryVendasUltimasSemanaLabel: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DTMGrafico: TDTMGrafico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDTMConexao;

{$R *.dfm}

end.
