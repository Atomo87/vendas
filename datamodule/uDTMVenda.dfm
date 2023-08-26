object dtmVendas: TdtmVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 284
  Width = 596
  object QryCliente: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    AutoCalcFields = False
    SQL.Strings = (
      'select clienteId,'
      '       nome'
      'from clientes')
    Params = <>
    Left = 100
    Top = 32
    object QryClienteclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryClientenome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object dtsCliente: TDataSource
    DataSet = QryCliente
    Left = 172
    Top = 32
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'SELECT produtoId,'
      #9'   nome,'
      #9'   valor,'
      #9'   quantidade'
      '  FROM produtos'
      ''
      '')
    Params = <>
    Left = 92
    Top = 97
    object QryProdutosprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryProdutosvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
    end
    object QryProdutosquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
  end
  object dtsProduto: TDataSource
    DataSet = QryProdutos
    Left = 180
    Top = 97
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 40
    object cdsItensVendaprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object cdsItensVendanomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'nomeProduto'
      Size = 60
    end
    object cdsItensVendaquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cdsItensVendavalorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valorUnitario'
      DisplayFormat = '#0.00'
    end
    object cdsItensVendavalorTotalProduto: TFloatField
      DisplayLabel = 'Valor Total do Produto'
      FieldName = 'valorTotalProduto'
      DisplayFormat = '#0.00'
    end
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 328
    Top = 40
  end
end
