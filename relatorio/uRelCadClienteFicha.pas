unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport, RLFilters,
  RLPDFFilter, RLXLSFilter, RLXLSXFilter, Vcl.Imaging.pngimage;

type
  TfrmRelCadClienteFicha = class(TForm)
    QryCliente: TZQuery;
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
    RLXLSXFilter1: TRLXLSXFilter;
    RLXLSFilter1: TRLXLSFilter;
    QryClienteclienteId: TIntegerField;
    QryClienteNome: TWideStringField;
    QryClienteemail: TWideStringField;
    QryClientetelefone: TWideStringField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    QryClientecep: TWideStringField;
    QryClienteendereco: TWideStringField;
    QryClientebairro: TWideStringField;
    QryClientecidade: TWideStringField;
    QryClienteestado: TWideStringField;
    QryClientedataNascimento: TDateTimeField;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText10: TRLDBText;
    RLDraw3: TRLDraw;
    RLImage1: TRLImage;
    RLAngleLabel1: TRLAngleLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadClienteFicha: TfrmRelCadClienteFicha;

implementation

{$R *.dfm}


procedure TfrmRelCadClienteFicha.FormCreate(Sender: TObject);
begin
  QryCliente.Open;
end;

procedure TfrmRelCadClienteFicha.FormDestroy(Sender: TObject);
begin
  QryCliente.Close;
end;

end.
