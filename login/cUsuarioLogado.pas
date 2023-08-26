unit cUsuarioLogado;

interface

 uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  uDtmConexao, ZAbstractRODataset, ZAbstractDataset, ZDataset, uEnum,
  RxToolEdit, RxCurrEdit, ZAbstractConnection, ZConnection;

type
  TUsuarioLogado = class
  private
    F_usuarioId:Integer;
    F_nome:String;
    F_senha: string;

  public
 class function TenhoAcesso(aUsuarioId: Integer; aChave: String; aConexao: TZConnection): Boolean; static;
  published
    property codigo        :Integer    read F_usuarioId      write F_usuarioId;
    property nome          :string     read F_nome           write F_nome;
    property senha         :string     read F_senha          write F_senha;
  end;

implementation

class function TUsuarioLogado.TenhoAcesso(aUsuarioId:Integer; aChave:String; aConexao: TZConnection):Boolean;
var Qry:TZQuery;
begin
  try
    Result:=true;
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId '+
                '  FROM usuariosAcaoAcesso '+
                ' WHERE usuarioId=:usuarioId  '+
                '   AND acaoAcessoId=(SELECT acaoAcessoId FROM acaoAcesso WHERE chave=:chave LIMIT 1)'+
                '   AND ativo=1');
    Qry.ParamByName('usuarioId').AsInteger       :=aUsuarioId;
    Qry.ParamByName('chave').AsString            :=aChave;

    Qry.Open;

    if Qry.IsEmpty then
       Result:=false

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;


   Result:=true;

end;


end.

