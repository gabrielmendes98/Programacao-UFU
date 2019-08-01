package com.poo2.transportadora.domain.pedido;

import com.poo2.transportadora.domain.enums.TipoItem;
import pedido.Pedido1;

public class PedidoDecorator implements Pedido1 {

    public Pedido1 pedido1;

    public PedidoDecorator(Pedido1 pedido1){
        this.pedido1 = pedido1;
    }

    @Override
    public void montar(TipoItem tipoItem) {
        this.pedido1.montar(tipoItem);
    }
}
