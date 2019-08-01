package com.poo2.transportadora.domain.responses;

import com.poo2.transportadora.domain.cliente.Cliente;
import com.poo2.transportadora.domain.cliente.Localidade;
import com.poo2.transportadora.domain.enums.TipoCliente;
import com.poo2.transportadora.domain.pedido.Pedido;

import java.util.List;

public class ClienteResponse {
    private String nome;
    private String cpfOuCnpj;
    private Double pontos;
    private Localidade localidade;
    private List<Pedido> pedidos;
    private TipoCliente tipoCliente;

    public ClienteResponse(){

    }

    public ClienteResponse(Cliente cliente){
        this.cpfOuCnpj = cliente.getCpfOuCnpj();
        this.localidade = cliente.getLocalidade();
        this.nome = cliente.getNome();
        this.pedidos = cliente.getPedidos();
        this.pontos = cliente.getPontos();
        this.tipoCliente = cliente.getTipoCliente();
    }

    public ClienteResponse(String nome, String cpfOuCnpj, Double pontos, Localidade localidade, List<Pedido> pedidos, TipoCliente tipoCliente) {
        this.nome = nome;
        this.cpfOuCnpj = cpfOuCnpj;
        this.pontos = pontos;
        this.localidade = localidade;
        this.pedidos = pedidos;
        this.tipoCliente = tipoCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpfOuCnpj() {
        return cpfOuCnpj;
    }

    public void setCpfOuCnpj(String cpfOuCnpj) {
        this.cpfOuCnpj = cpfOuCnpj;
    }

    public Double getPontos() {
        return pontos;
    }

    public void setPontos(Double pontos) {
        this.pontos = pontos;
    }

    public Localidade getLocalidade() {
        return localidade;
    }

    public void setLocalidade(Localidade localidade) {
        this.localidade = localidade;
    }

    public List<Pedido> getPedidos() {
        return pedidos;
    }

    public void setPedidos(List<Pedido> pedidos) {
        this.pedidos = pedidos;
    }

    public TipoCliente getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(TipoCliente tipoCliente) {
        this.tipoCliente = tipoCliente;
    }
}
