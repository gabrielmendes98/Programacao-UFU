package veiculo;

import pedido.Pedido;

public interface Subject {
    public void addObserver(Pedido pedido);
    public void removeObserver(Pedido pedido);
    public void notifyObservers();
}
