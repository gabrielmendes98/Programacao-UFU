package com.poo2.transportadora.domain.cliente;

import com.poo2.transportadora.domain.enums.TipoCliente;
import com.poo2.transportadora.domain.pedido.Pedido;

public class ClientePrata extends Cliente {
    public ClientePrata(){
        setTipoCliente(TipoCliente.PRATA);
    }

    @Override
    public void ganhaPontos(Pedido pedido) {
        Double pontosGanhos = pedido.getValoEmPontos()/3;
        this.setPontos(this.getPontos()+pontosGanhos);
    }


}
