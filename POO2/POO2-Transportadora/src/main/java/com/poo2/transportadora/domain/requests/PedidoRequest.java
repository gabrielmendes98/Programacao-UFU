package com.poo2.transportadora.domain.requests;

import com.poo2.transportadora.domain.enums.StatusPedido;
import com.poo2.transportadora.domain.enums.TipoItem;
import com.poo2.transportadora.domain.pedido.ItemPedido;
import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.veiculo.Veiculo;

import java.util.List;

public class PedidoRequest {
    private String cidadeDestino;
    private String cidadePartida;
    private Double pesoTotal;
    private List<TipoItem> tipoItems;

    public String getCidadeDestino() {
        return cidadeDestino;
    }

    public void setCidadeDestino(String cidadeDestino) {
        this.cidadeDestino = cidadeDestino;
    }

    public String getCidadePartida() {
        return cidadePartida;
    }

    public void setCidadePartida(String cidadePartida) {
        this.cidadePartida = cidadePartida;
    }

    public Double getPesoTotal() {
        return pesoTotal;
    }

    public PedidoRequest(){

    }

    public PedidoRequest(String cidadeDestino, String cidadePartida, Double pesoTotal, List<TipoItem> tipoItems) {
        this.cidadeDestino = cidadeDestino;
        this.cidadePartida = cidadePartida;
        this.pesoTotal = pesoTotal;
        this.tipoItems = tipoItems;
    }

    public Pedido toPedido(){
        Pedido pedido = new ItemPedido();
        pedido.setCidadeDestino(cidadeDestino);
        pedido.setCidadePartida(cidadePartida);
        pedido.setIdPedido(null);
        pedido.setStatusPedido(StatusPedido.ENVIADO);
        //TODO AJUSTAR AQUI PARA ARMAZENAR UMA STRING COM A DATA DE HOJE
//        pedido.setDataPedido();
        //pedido.setDataPrevistaDeEntrega();
        pedido.setPesoTotal(pesoTotal);
        pedido.setTipoItems(tipoItems);
        return pedido;
    }

    public void setPesoTotal(Double pesoTotal) {
        this.pesoTotal = pesoTotal;
    }

    public List<TipoItem> getTipoItems() {
        return tipoItems;
    }

    public void setTipoItems(List<TipoItem> tipoItems) {
        this.tipoItems = tipoItems;
    }
}
