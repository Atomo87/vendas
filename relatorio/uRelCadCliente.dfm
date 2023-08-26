object frmRelCadCliente: TfrmRelCadCliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Cliente'
  ClientHeight = 851
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dtsCliente
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
        Width = 205
        Height = 24
        Caption = 'Listagem de Cliente'
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
      Top = 134
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
    object RLBand1: TRLBand
      Left = 38
      Top = 116
      Width = 718
      Height = 18
      object RLDBText1: TRLDBText
        Left = 3
        Top = 0
        Width = 52
        Height = 16
        DataField = 'clienteId'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 76
        Top = 0
        Width = 38
        Height = 16
        DataField = 'Nome'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 341
        Top = 0
        Width = 35
        Height = 16
        DataField = 'email'
        DataSource = dtsCliente
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 666
        Top = 0
        Width = 49
        Height = 16
        Alignment = taRightJustify
        DataField = 'telefone'
        DataSource = dtsCliente
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 96
      Width = 718
      Height = 20
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 20
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel5: TRLLabel
          Left = 76
          Top = 1
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
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
        end
        object RLLabel6: TRLLabel
          Left = 341
          Top = 1
          Width = 40
          Height = 16
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 655
          Top = 1
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Telefone'
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
  end
  object dtsCliente: TDataSource
    DataSet = QryClientes
    Left = 640
    Top = 192
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 592
    Top = 248
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 593
    Top = 304
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 593
    Top = 360
  end
  object QryClientes: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    SQL.Strings = (
      'Select * from clientes')
    Params = <>
    Left = 600
    Top = 448
    object QryClientesclienteId: TIntegerField
      FieldName = 'clienteId'
      Required = True
    end
    object QryClientesnome: TWideStringField
      FieldName = 'nome'
      Size = 60
    end
    object QryClientesendereco: TWideStringField
      FieldName = 'endereco'
      Size = 60
    end
    object QryClientescidade: TWideStringField
      FieldName = 'cidade'
      Size = 50
    end
    object QryClientesbairro: TWideStringField
      FieldName = 'bairro'
      Size = 40
    end
    object QryClientesestado: TWideStringField
      FieldName = 'estado'
      Size = 2
    end
    object QryClientescep: TWideStringField
      FieldName = 'cep'
      Size = 10
    end
    object QryClientestelefone: TWideStringField
      FieldName = 'telefone'
      Size = 14
    end
    object QryClientesemail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object QryClientesdataNascimento: TDateTimeField
      FieldName = 'dataNascimento'
    end
  end
end
