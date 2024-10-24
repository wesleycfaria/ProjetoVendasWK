object DmDados: TDmDados
  Height = 533
  Width = 695
  object Conexao: TFDConnection
    TxOptions.Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    LoginPrompt = False
    Left = 576
    Top = 16
  end
  object DriverMySQL: TFDPhysMySQLDriverLink
    VendorLib = 
      'D:\Desenvolvimento\projetoVendas\libmysql.dll'
    Left = 640
    Top = 16
  end
  object tb_cliente: TFDTable
    IndexFieldNames = 'codigo'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'bdteste.cliente'
    TableName = 'bdteste.cliente'
    Left = 24
    Top = 24
    object tb_clientecodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tb_clientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object tb_clientecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 255
    end
    object tb_clienteuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 2
    end
  end
  object Dts_cliente: TDataSource
    DataSet = tb_cliente
    Left = 96
    Top = 24
  end
  object tb_pedidosgeral: TFDTable
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'bdteste.pedidosgeral'
    TableName = 'bdteste.pedidosgeral'
    Left = 64
    Top = 184
  end
  object tb_produtos: TFDTable
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'bdteste.produtos'
    TableName = 'bdteste.produtos'
    Left = 32
    Top = 104
  end
  object tb_pedidos_produtos: TFDTable
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'bdteste.produtos'
    TableName = 'bdteste.produtos'
    Left = 54
    Top = 256
  end
  object Dts_produtos: TDataSource
    DataSet = tb_produtos
    Left = 112
    Top = 104
  end
  object Dts_pedidosgeral: TDataSource
    DataSet = tb_pedidosgeral
    Left = 208
    Top = 184
  end
  object Dts_pedidos_produtos: TDataSource
    DataSet = tb_pedidos_produtos
    Left = 176
    Top = 256
  end
  object FDTransaction1: TFDTransaction
    Options.Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Connection = Conexao
    Left = 608
    Top = 72
  end
end
