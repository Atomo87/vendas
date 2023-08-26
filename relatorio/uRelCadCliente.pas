unit uRelCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport, RLFilters,
  RLPDFFilter, RLXLSFilter, RLXLSXFilter;

type
  TfrmRelCadCliente = class(TForm)
  {
    QryCliente: TZQuery;
    QryClienteclienteId: TIntegerField;
    QryClienteNome: TWideStringField;
    QryClienteemail: TWideStringField;
    QryClientetelefone: TWideStringField;
              }
    dtsCliente: TDataSource;
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLXLSXFilter1: TRLXLSXFilter;
    RLXLSFilter1: TRLXLSFilter;

    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    QryClientes: TZQuery;
    QryClientesclienteId: TIntegerField;
    QryClientesnome: TWideStringField;
    QryClientesendereco: TWideStringField;
    QryClientescidade: TWideStringField;
    QryClientesbairro: TWideStringField;
    QryClientesestado: TWideStringField;
    QryClientescep: TWideStringField;
    QryClientestelefone: TWideStringField;
    QryClientesemail: TWideStringField;
    QryClientesdataNascimento: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadCliente: TfrmRelCadCliente;

implementation

{$R *.dfm}


procedure TfrmRelCadCliente.FormCreate(Sender: TObject);
begin
  QryClientes.Open;
end;

procedure TfrmRelCadCliente.FormDestroy(Sender: TObject);
begin
  QryClientes.Close;
end;

end.
