package com.poo2.transportadora.domain.veiculo;

import com.poo2.transportadora.domain.pedido.Pedido;

public interface Subject {
    public void addObserver(Pedido pedido);
    public void removeObserver(Pedido pedido);
    public void notifyObservers();
}
