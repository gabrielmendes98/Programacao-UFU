package com.poo2.transportadora.domain.cliente;

import com.poo2.transportadora.domain.enums.TipoCliente;
import com.poo2.transportadora.domain.pedido.Pedido;

public class ClienteBronze extends Cliente {
    public ClienteBronze(){
        setTipoCliente(TipoCliente.BRONZE);
    }

    @Override
    public void ganhaPontos(Pedido pedido) {
        Double pontosGanhos = pedido.getValoEmPontos()/3;
        this.setPontos(this.getPontos()+pontosGanhos);
    }


}
