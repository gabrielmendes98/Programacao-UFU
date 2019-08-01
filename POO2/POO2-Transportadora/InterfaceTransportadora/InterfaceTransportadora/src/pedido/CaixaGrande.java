package pedido;

import com.poo2.transportadora.domain.enums.TipoItem;

import java.util.List;

public class CaixaGrande extends AdicionaDecorator {
    Pedido pedido;

    public CaixaGrande(Pedido pedido){
        this.pedido = pedido;
    }

    @Override
    public List<TipoItem> verificatipos() {
        pedido.setCidadeAtual("udi");
        return pedido.verificatipos();
    }

}




