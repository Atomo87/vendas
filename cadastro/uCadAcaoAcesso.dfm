inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#227'o de Acesso'
  ClientHeight = 437
  ClientWidth = 810
  ExplicitWidth = 816
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 810
    Height = 390
    ExplicitWidth = 810
    ExplicitHeight = 390
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 802
      ExplicitHeight = 362
      inherited pnlListagemTopo: TPanel
        Width = 802
        ExplicitWidth = 802
      end
      inherited grdListagem: TDBGrid
        Width = 802
        Height = 296
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 354
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Width = 318
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 802
      ExplicitHeight = 362
      object edtAcaoAcessoId: TLabeledEdit
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
        Width = 769
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 152
        Width = 521
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 390
    Width = 810
    ExplicitTop = 390
    ExplicitWidth = 810
    inherited btnFechar: TBitBtn
      Left = 731
      ExplicitLeft = 731
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT acaoAcessoId,'
      '       descricao,'
      '       chave'
      '  FROM acaoAcesso')
    Left = 684
    object QryListagemacaoAcessoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoAcessoId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
  inherited dtsListagem: TDataSource
    Left = 740
  end
end
