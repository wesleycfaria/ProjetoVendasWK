unit UDm;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Def;

type
  TDmDados = class(TDataModule)
    Conexao: TFDConnection;
    DriverMySQL: TFDPhysMySQLDriverLink;
    tb_clientes: TFDTable;
    tb_clientescodigo: TFDAutoIncField;
    tb_clientesnome: TStringField;
    tb_clientescidade: TStringField;
    tb_clientesuf: TStringField;
    Dts_clientes: TDataSource;
    tb_pedidos_dados_gerais: TFDTable;
    tb_produtos: TFDTable;
    tb_pedidos_produtos: TFDTable;
    Dts_produtos: TDataSource;
    Dts_pedidos_dados_gerais: TDataSource;
    Dts_pedidos_produtos: TDataSource;
    FDTransaction1: TFDTransaction;

    constructor Create;
    destructor Destroy; override;

    function GetConnection: TFDConnection;
    procedure PegaConfig;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDmDados.Create();
var
  IniFile: TIniFile;
  ConfigFilePath: string;
begin
  Conexao := TFDConnection.Create(nil);

  ConfigFilePath := ExtractFilePath(ParamStr(0)) + 'config.ini';

  IniFile := TIniFile.Create(ConfigFilePath);
  try
    //FDPhysMySQLDriverLink1.VendorLib := IniFile.ReadString('Database', 'VendorLib', '');
    Conexao.Params.DriverID := IniFile.ReadString('Database', 'DriverID', '');
    Conexao.DriverName := 'MySql';
    Conexao.Params.Database := IniFile.ReadString('Database', 'Database', '');
    Conexao.Params.UserName := IniFile.ReadString('Database', 'UserName', '');
    Conexao.Params.Password := IniFile.ReadString('Database', 'Password', '');
    Conexao.Params.Add('Server=' + IniFile.ReadString('Database', 'Server', ''));
    Conexao.Params.Add('Port=' + IniFile.ReadString('Database', 'Port', ''));
    Conexao.Connected := True;
  finally
    IniFile.Free;
  end;

end;

destructor TDmDados.Destroy;
begin
  Conexao.Free;
  inherited;
end;

function TDmDados.GetConnection: TFDConnection;
begin
  Result := Conexao;
end;

procedure TDmDados.PegaConfig;
var
  IniFile: TIniFile;
  ConfigFilePath: string;

begin

  ConfigFilePath := ExtractFilePath(ParamStr(0)) + 'config.ini';

  IniFile := TIniFile.Create(ConfigFilePath);
  try
    //FDPhysMySQLDriverLink1.VendorLib := IniFile.ReadString('Database', 'VendorLib', '');
    Conexao.Params.DriverID := IniFile.ReadString('Database', 'DriverID', '');
    Conexao.DriverName := 'MySql';
    Conexao.Params.Database := IniFile.ReadString('Database', 'Database', '');
    Conexao.Params.UserName := IniFile.ReadString('Database', 'UserName', '');
    Conexao.Params.Password := IniFile.ReadString('Database', 'Password', '');
    Conexao.Params.Add('Server=' + IniFile.ReadString('Database', 'Server', ''));
    Conexao.Params.Add('Port=' + IniFile.ReadString('Database', 'Port', ''));
    Conexao.Connected := True;
  finally
    IniFile.Free;
  end;

end;

end.
