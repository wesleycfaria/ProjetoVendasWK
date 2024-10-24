program ProjetoVendas;

uses
  Vcl.Forms,
  UPrincipal in 'fontes\UPrincipal.pas' {frmPrincipal},
  UDm in 'fontes\UDm.pas' {DmDados: TDataModule},
  UItemPedido in 'fontes\UItemPedido.pas',
  UPedido in 'fontes\UPedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ProjetoVendas';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
