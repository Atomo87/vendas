object frmRelProVendaPorData: TfrmRelProVendaPorData
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas por Data'
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
        Width = 291
        Height = 24
        Caption = 'Listagem de Venda por Data'
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
      DataFields = 'dataVenda'
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
          Left = 46
          Top = 0
          Width = 66
          Height = 16
          DataField = 'dataVenda'
          DataSource = dtsVenda
          Text = ''
        end
        object RLLabel8: TRLLabel
          Left = 0
          Top = 0
          Width = 43
          Height = 16
          Caption = 'DATA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 19
        Width = 718
        Height = 20
        BandType = btColumnHeader
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 1
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 76
          Top = 1
          Width = 110
          Height = 16
          Caption = 'Nome do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 612
          Top = 1
          Width = 103
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 39
        Width = 718
        Height = 18
        object RLDBText1: TRLDBText
          Left = 3
          Top = 0
          Width = 52
          Height = 16
          DataField = 'clienteId'
          DataSource = dtsVenda
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 76
          Top = -1
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
          DataField = 'totalVenda'
          DataSource = dtsVenda
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 57
        Width = 718
        Height = 40
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 610
          Top = 17
          Width = 105
          Height = 16
          Alignment = taRightJustify
          DataField = 'totalVenda'
          DataSource = dtsVenda
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 480
          Top = 6
          Width = 235
          Height = 12
          DrawKind = dkLine
        end
        object RLLabel10: TRLLabel
          Left = 496
          Top = 17
          Width = 98
          Height = 16
          Caption = 'Total por Data:'
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
        Width = 79
        Height = 16
        Caption = 'Total Geral:'
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
      '  SELECT vendas.vendaId,'
      #9'       vendas.clienteId,'
      #9#9'     clientes.nome,'
      #9#9'     vendas.dataVenda,'
      #9#9'     vendas.totalVenda'
      #9'  FROM vendas'
      
        #9'       INNER JOIN clientes on clientes.clienteId = vendas.clien' +
        'teId'
      '   WHERE vendas.dataVenda BETWEEN :DataInicio AND :DataFim'
      #9' ORDER BY vendas.dataVenda, vendas.clienteId')
    Params = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/10/2018'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '31/10/2018'
      end>
    Left = 520
    Top = 464
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptInput
        Value = '01/10/2018'
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptInput
        Value = '31/10/2018'
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
    end
    object QryVendastotalVenda: TFloatField
      FieldName = 'totalVenda'
      Required = True
    end
  end
  object dtsVenda: TDataSource
    DataSet = QryVendas
    Left = 616
    Top = 464
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
end
