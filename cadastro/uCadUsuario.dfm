inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 346
  ClientWidth = 730
  ExplicitWidth = 736
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 730
    Height = 299
    ExplicitWidth = 730
    ExplicitHeight = 299
    inherited tabListagem: TTabSheet
      ExplicitWidth = 722
      ExplicitHeight = 271
      inherited pnlListagemTopo: TPanel
        Width = 722
        ExplicitWidth = 722
      end
      inherited grdListagem: TDBGrid
        Width = 722
        Height = 205
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioID'
            Width = 166
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 514
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 722
      ExplicitHeight = 271
      object edtUsuarioId: TLabeledEdit
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
        Width = 689
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        MaxLength = 50
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 140
        Width = 369
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        MaxLength = 40
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 299
    Width = 730
    ExplicitTop = 299
    ExplicitWidth = 730
    inherited btnFechar: TBitBtn
      Left = 651
      ExplicitLeft = 651
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited dtsListagem: TDataSource
    Left = 564
    Top = 56
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT usuarioID,'
      '       nome,'
      #9'     senha'
      '  FROM usuarios')
    Left = 508
    Top = 48
    object QryListagemusuarioID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioID'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object QryListagemsenha: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Required = True
      Size = 40
    end
  end
end
