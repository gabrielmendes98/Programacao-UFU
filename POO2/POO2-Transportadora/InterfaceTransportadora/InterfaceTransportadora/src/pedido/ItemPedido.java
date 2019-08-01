package pedido;

import com.poo2.transportadora.domain.enums.TipoItem;

import java.util.ArrayList;
import java.util.List;

public class ItemPedido extends Pedido {
    
    @Override
    public List<TipoItem> verificatipos() {
        return new ArrayList<>();
    }
}
