unit UItemPedido;

interface

type TItemPedido = class

private

// atributos e m�todos privados
 FNUM_PEDIDO :Integer;
 FCODIGO_PRODUTO :Integer;
 FQUANTIDADE : Integer;
 FVLR_UNITARIO: Currency;
 FVLR_TOTAL: Currency;

protected

// atributos e m�todos protegidos

Public

// atibutos e m�todos p�blicos

  property NUM_PEDIDO   :Integer  read FNUM_PEDIDO   write FNUM_PEDIDO;
  property CODIGO_PRODUTO   :Integer  read FCODIGO_PRODUTO   write FCODIGO_PRODUTO;
  property QUANTIDADE   :Integer  read FQUANTIDADE   write FQUANTIDADE;
  property VLR_UNITARIO   :Currency  read FVLR_UNITARIO   write FVLR_UNITARIO;
  property VLR_TOTAL   :Currency  read FVLR_TOTAL   write FVLR_TOTAL;

end;

implementation

end.
