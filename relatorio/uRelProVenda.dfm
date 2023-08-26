object frmRelProVenda: TfrmRelProVenda
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 851
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 9
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dtsVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 58
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 17
        Width = 77
        Height = 24
        Caption = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 41
        Width = 718
        Height = 17
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 257
      Width = 718
      Height = 39
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 16
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 663
        Top = 16
        Width = 25
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 701
        Top = 16
        Width = 16
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 689
        Top = 16
        Width = 12
        Height = 16
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 610
        Top = 16
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 96
      Width = 718
      Height = 113
      DataFields = 'vendaId'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLDBText5: TRLDBText
          Left = 54
          Top = 0
          Width = 47
          Height = 16
          DataField = 'vendaId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLLabel8: TRLLabel
          Left = 0
          Top = 0
          Width = 52
          Height = 16
          Caption = 'VENDA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 19
        Width = 718
        Height = 18
        object RLDBText1: TRLDBText
          Left = 57
          Top = 0
          Width = 52
          Height = 16
          Alignment = taRightJustify
          DataField = 'clienteId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 117
          Top = 0
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 650
          Top = 0
          Width = 66
          Height = 16
          Alignment = taRightJustify
          DataField = 'dataVenda'
          DataSource = dtsVenda
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 3
          Top = 0
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 109
          Top = -1
          Width = 8
          Height = 16
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 605
          Top = 0
          Width = 41
          Height = 16
          Alignment = taRightJustify
          Caption = 'Data: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 37
        Width = 718
        Height = 64
        DataSource = dtsVendasItens
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 21
          BandType = btHeader
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object RLLabel10: TRLLabel
            Left = 9
            Top = 4
            Width = 77
            Height = 16
            Caption = 'PRODUTOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel11: TRLLabel
            Left = 376
            Top = 4
            Width = 78
            Height = 16
            Alignment = taRightJustify
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel12: TRLLabel
            Left = 499
            Top = 3
            Width = 92
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel13: TRLLabel
            Left = 641
            Top = 4
            Width = 74
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 21
          Width = 718
          Height = 16
          object RLDBText3: TRLDBText
            Left = -2
            Top = -1
            Width = 57
            Height = 16
            Alignment = taRightJustify
            DataField = 'produtoId'
            DataSource = dtsVendasItens
            Text = ''
          end
          object RLLabel4: TRLLabel
            Left = 63
            Top = -1
            Width = 8
            Height = 16
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLDBText6: TRLDBText
            Left = 71
            Top = -1
            Width = 38
            Height = 16
            DataField = 'Nome'
            DataSource = dtsVendasItens
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 387
            Top = -1
            Width = 67
            Height = 16
            Alignment = taRightJustify
            DataField = 'quantidade'
            DataSource = dtsVendasItens
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 517
            Top = -1
            Width = 74
            Height = 16
            Alignment = taRightJustify
            DataField = 'valorUnitario'
            DataSource = dtsVendasItens
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 641
            Top = -1
            Width = 74
            Height = 16
            Alignment = taRightJustify
            DataField = 'totalProduto'
            DataSource = dtsVendasItens
            Text = ''
          end
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 209
      Width = 718
      Height = 48
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 613
        Top = 25
        Width = 105
        Height = 16
        Alignment = taRightJustify
        DataField = 'totalVenda'
        DataSource = dtsVenda
        Info = riSum
        Text = ''
      end
      object RLDraw4: TRLDraw
        Left = 483
        Top = 14
        Width = 235
        Height = 12
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 504
        Top = 25
        Width = 101
        Height = 16
        Caption = 'Total da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object QryVendas: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      #9'SELECT vendas.vendaId,'
      #9'       vendas.clienteId,'
      #9#9'     clientes.nome,'
      '   '#9#9'   vendas.dataVenda,'
      #9'  '#9'   vendas.totalVenda'
      #9'  FROM vendas'
      
        #9'       INNER JOIN clientes on clientes.clienteId = vendas.clien' +
        'teId'
      '   WHERE vendas.vendaId =:vendaId'
      '')
    Params = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    Left = 528
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    object QryVendasvendaId: TIntegerField
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object QryVendasclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object QryVendasnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object QryVendasdataVenda: TDateTimeField
      FieldName = 'dataVenda'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QryVendastotalVenda: TFloatField
      FieldName = 'totalVenda'
      Required = True
      DisplayFormat = '#0.00'
    end
  end
  object dtsVenda: TDataSource
    DataSet = QryVendas
    Left = 600
    Top = 368
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 568
    Top = 520
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 569
    Top = 576
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 569
    Top = 632
  end
  object QryVendasItens: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'SELECT vendasItens.vendaId,'
      '       vendasItens.produtoId,'
      #9'     produtos.Nome,'
      #9'     vendasItens.quantidade,'
      #9'     vendasItens.valorUnitario,'
      #9'     vendasItens.totalProduto'
      '  FROM vendasItens'
      
        '       INNER JOIN produtos on produtos.produtoId = vendasItens.p' +
        'rodutoId'
      ' WHERE vendasItens.vendaId =:vendaId'
      ' ORDER BY vendasItens.produtoId')
    Params = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    Left = 536
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vendaId'
        ParamType = ptInput
        Value = 1
      end>
    object QryVendasItensvendaId: TIntegerField
      FieldName = 'vendaId'
      Required = True
    end
    object QryVendasItensprodutoId: TIntegerField
      FieldName = 'produtoId'
      Required = True
    end
    object QryVendasItensNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object QryVendasItensquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object QryVendasItensvalorUnitario: TFloatField
      FieldName = 'valorUnitario'
      Required = True
    end
    object QryVendasItenstotalProduto: TFloatField
      FieldName = 'totalProduto'
      Required = True
    end
  end
  object dtsVendasItens: TDataSource
    DataSet = QryVendasItens
    Left = 608
    Top = 448
  end
end
