inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 403
  ClientWidth = 825
  ExplicitWidth = 831
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 825
    Height = 356
    ExplicitWidth = 825
    ExplicitHeight = 356
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 817
      ExplicitHeight = 328
      inherited pnlListagemTopo: TPanel
        Width = 817
        ExplicitWidth = 817
      end
      inherited grdListagem: TDBGrid
        Width = 817
        Height = 262
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 346
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 817
      ExplicitHeight = 328
      object Label1: TLabel
        Left = 518
        Top = 70
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label2: TLabel
        Left = 518
        Top = 169
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label3: TLabel
        Left = 8
        Top = 264
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object edtClienteId: TLabeledEdit
        Tag = 1
        Left = 8
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 89
        Width = 481
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtCEP: TMaskEdit
        Left = 518
        Top = 89
        Width = 258
        Height = 21
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  .   -   '
      end
      object edtEndereco: TLabeledEdit
        Left = 8
        Top = 137
        Width = 481
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Left = 518
        Top = 137
        Width = 258
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 4
      end
      object edtCidade: TLabeledEdit
        Left = 8
        Top = 185
        Width = 481
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 5
      end
      object edtTelefone: TMaskEdit
        Left = 518
        Top = 185
        Width = 255
        Height = 21
        EditMask = '(99) 9999-9999;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '(  )     -    '
      end
      object edtEmail: TLabeledEdit
        Left = 8
        Top = 233
        Width = 481
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 7
      end
      object edtDataNascimento: TDateEdit
        Left = 8
        Top = 283
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 8
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 356
    Width = 825
    ExplicitTop = 356
    ExplicitWidth = 825
    inherited btnFechar: TBitBtn
      Left = 746
      ExplicitLeft = 746
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'select clienteId,'
      '       nome,'
      '       endereco,'
      '       cidade,'
      '       bairro,'
      '       estado,'
      '       cep,'
      '       telefone,'
      '       email,'
      '       datanascimento'
      'from clientes')
    Left = 668
    Top = 16
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object QryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemestado: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 2
    end
    object QryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagememail: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdatanascimento: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'datanascimento'
    end
  end
  inherited dtsListagem: TDataSource
    Left = 748
    Top = 16
  end
end
