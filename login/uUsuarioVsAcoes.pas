unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmUsuarioVsAcoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    grdUsuarios: TDBGrid;
    grdAcoes: TDBGrid;
    QryUsuario: TZQuery;
    QryAcoes: TZQuery;
    DtsAcoes: TDataSource;
    dtsUsuario: TDataSource;
    btnFechar: TBitBtn;
    QryUsuariousuarioID: TIntegerField;
    QryUsuarioNome: TWideStringField;
    QryAcoesusuarioId: TIntegerField;
    QryAcoesacaoAcessoId: TIntegerField;
    QryAcoesdescricao: TWideStringField;
    QryAcoesativo: TSmallintField;

    procedure btnFecharClick(Sender: TObject);
    procedure QryUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grdAcoesDblClick(Sender: TObject);
    procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure SelecionarAcoesAcessoPorUsuario;
  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

{$R *.dfm}

uses uDTMConexao;

procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDblClick(Sender: TObject);
var Qry:TZQuery;
    bmRegistroAtual:TBookmark;
    ativo: integer;
begin
  try

   if QryAcoes.FieldByName('ativo').AsInteger = 0 then ativo := 1 else ativo := 0;  // se no banco estiver false, setar para true

    //showMessage(BoolToStr(not ativo));
  ///showMessage('1');

    bmRegistroAtual := QryAcoes.GetBookMark;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=DtmPrincipal.ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE usuariosAcaoAcesso '+
                '   SET ativo=:ativo '+
                ' WHERE usuarioId=:usuarioId '+
                '   AND acaoAcessoId=:acaoAcessoId ');
    Qry.ParamByName('usuarioId').AsInteger    :=QryAcoes.FieldByName('usuarioId').AsInteger;
    Qry.ParamByName('acaoAcessoId').AsInteger :=QryAcoes.FieldByName('acaoAcessoId').AsInteger;
    Qry.ParamByName('ativo').AsInteger        := ativo;
    Try
      DtmPrincipal.ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      DtmPrincipal.ConexaoDB.Commit;
    Except
      DtmPrincipal.ConexaoDB.Rollback;
    End;

  finally
    SelecionarAcoesAcessoPorUsuario;
    QryAcoes.GotoBookMark(bmRegistroAtual);
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var ativo : boolean;
begin

 if QryAcoes.FieldByName('ativo').AsInteger = 0 then ativo:=false else ativo:=true;

  If not ativo then
  begin
    TDBGrid(Sender).Canvas.Font.Color:= clWhite;
    TDBGrid(Sender).Canvas.Brush.Color:=clRed
  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
  Try
    QryUsuario.DisableControls;
    QryUsuario.Open;
    SelecionarAcoesAcessoPorUsuario;
  Finally
    QryUsuario.EnableControls;
  End;
end;

procedure TfrmUsuarioVsAcoes.QryUsuarioAfterScroll(DataSet: TDataSet);
begin
  SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
begin
  QryAcoes.Close;
  QryAcoes.ParamByName('usuarioId').AsInteger := QryUsuario.FieldByName('usuarioID').AsInteger;
  QryAcoes.Open;
end;

end.
