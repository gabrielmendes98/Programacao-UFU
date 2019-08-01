package com.poo2.transportadora.domain.cliente;

import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.enums.TipoCliente;

public class ClienteOuro extends Cliente {
    public ClienteOuro(){
        setTipoCliente(TipoCliente.OURO);
    }

    @Override
    public void ganhaPontos(Pedido pedido) {
        Double pontosGanhos = pedido.getValoEmPontos()/2;
        this.setPontos(this.getPontos()+pontosGanhos);
    }


}
