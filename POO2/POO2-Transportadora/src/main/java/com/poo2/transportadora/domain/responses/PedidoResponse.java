package com.poo2.transportadora.domain.responses;

import com.poo2.transportadora.domain.requests.PedidoRequest;
import com.poo2.transportadora.domain.veiculo.Veiculo;

public class PedidoResponse {
    private Veiculo veiculo;
    private Double valorEmPontos;
    private Double valor;
    private PedidoRequest pedido;

    public PedidoResponse(){

    }

    public PedidoResponse(Veiculo veiculo, Double valorEmPontos, Double valor, PedidoRequest pedido) {
        this.veiculo = veiculo;
        this.valorEmPontos = valorEmPontos;
        this.valor = valor;
        this.pedido = pedido;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public Double getValorEmPontos() {
        return valorEmPontos;
    }

    public void setValorEmPontos(Double valorEmPontos) {
        this.valorEmPontos = valorEmPontos;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public PedidoRequest getPedido() {
        return pedido;
    }

    public void setPedido(PedidoRequest pedido) {
        this.pedido = pedido;
    }
}
