inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 421
  ClientWidth = 783
  ExplicitWidth = 789
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 783
    Height = 374
    ExplicitWidth = 783
    ExplicitHeight = 374
    inherited tabListagem: TTabSheet
      ExplicitWidth = 775
      ExplicitHeight = 346
      inherited pnlListagemTopo: TPanel
        Width = 775
        ExplicitWidth = 775
      end
      inherited grdListagem: TDBGrid
        Width = 775
        Height = 280
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 449
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitTop = 22
      ExplicitWidth = 775
      ExplicitHeight = 346
      object edtCategoriaId: TLabeledEdit
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 96
        Width = 481
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 374
    Width = 783
    ExplicitTop = 374
    ExplicitWidth = 783
    inherited btnFechar: TBitBtn
      Left = 705
      ExplicitLeft = 705
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT categoriaId,'
      '       descricao '
      '  FROM categorias')
    Left = 668
    Top = 24
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  inherited dtsListagem: TDataSource
    Left = 724
    Top = 24
  end
end
