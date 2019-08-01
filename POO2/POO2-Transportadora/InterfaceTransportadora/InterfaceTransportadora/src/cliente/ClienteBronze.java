package cliente;

import pedido.Pedido;
import com.poo2.transportadora.domain.enums.TipoCliente;

public class ClienteBronze extends Cliente {

    
    public ClienteBronze(){
        this.setTipoCliente(TipoCliente.BRONZE);
    }

    @Override
    public void ganhaPontos(Pedido pedido) {
        Double pontosGanhos = pedido.getValorEmPontos()/3.0;
           this.setPontos(this.getPontos()+pontosGanhos);
    }




}          
