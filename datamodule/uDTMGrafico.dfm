object DTMGrafico: TDTMGrafico
  OldCreateOrder = False
  Height = 588
  Width = 928
  object QryProdutoEstoque: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      
        'SELECT CONCAT(CAST(produtoId as CHAR)," - ",nome) AS Label, Quan' +
        'tidade AS Value FROM produtos')
    Params = <>
    Left = 49
    Top = 26
    object QryProdutoEstoqueLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 74
    end
    object QryProdutoEstoqueValue: TFloatField
      FieldName = 'Value'
    end
  end
  object QryValorVendaPorCliente: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      
        '  SELECT CONCAT(CAST(vendas.clienteID as CHAR),'#39' - '#39',clientes.no' +
        'me ) AS Label, SUM(vendas.totalVenda) AS Value'
      '  FROM Vendas '
      
        ' INNER JOIN clientes ON (vendas.clienteId = clientes.clienteId) ' +
        ' '
      'AND CAST(vendas.dataVenda AS DATE)  '
      'BETWEEN DATE(DATE_SUB(NOW(), INTERVAL 7 day))'
      ' and DATE(NOW()) GROUP BY Vendas.clienteId')
    Params = <>
    Left = 279
    Top = 26
    object QryValorVendaPorClienteLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 74
    end
    object QryValorVendaPorClienteValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object Qry10ProdutosMaisVendidos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      
        'SELECT  CONCAT(CAST(vi.produtoId AS CHAR),'#39' - '#39',p.nome) AS Label' +
        ', SUM(vi.totalProduto) AS Value'
      '  FROM vendasItens as vi'
      '       INNER JOIN produtos AS P ON p.produtoId = vi.produtoId'
      ' GROUP BY vi.produtoId, p.nome limit 10')
    Params = <>
    Left = 271
    Top = 114
    object Qry10ProdutosMaisVendidosLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 74
    end
    object Qry10ProdutosMaisVendidosValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
  object QryVendasUltimasSemana: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      
        ' SELECT DATE_FORMAT(vendas.dataVenda, '#39'%d/%m/%Y'#39') AS Label, SUM(' +
        'vendas.totalVenda) AS Value'
      '     FROM Vendas'
      
        #9'WHERE CAST(vendas.dataVenda AS DATE)   BETWEEN DATE(DATE_SUB(NO' +
        'W(), INTERVAL 7 day))'
      ' and DATE(NOW()) '
      '    GROUP BY Vendas.dataVenda')
    Params = <>
    Left = 53
    Top = 114
    object QryVendasUltimasSemanaLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 10
    end
    object QryVendasUltimasSemanaValue: TFloatField
      FieldName = 'Value'
      ReadOnly = True
    end
  end
end