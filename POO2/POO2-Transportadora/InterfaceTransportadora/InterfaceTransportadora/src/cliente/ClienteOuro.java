package cliente;

import com.poo2.transportadora.domain.enums.TipoCliente;
import pedido.Pedido;

public class ClienteOuro extends Cliente {
    public ClienteOuro(){
        this.setTipoCliente(TipoCliente.OURO);
    }


    @Override
    public void ganhaPontos(Pedido pedido) {
        Double pontosGanhos = pedido.getValorEmPontos()/2.0;
        this.setPontos(this.getPontos()+pontosGanhos);
    }


}
