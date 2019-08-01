package com.poo2.transportadora.domain.requests;

import com.poo2.transportadora.domain.cliente.*;
import com.poo2.transportadora.domain.enums.TipoCliente;
import com.poo2.transportadora.domain.pedido.Pedido;

import java.util.List;

public class ClienteRequest {
    private String nome;
    private String cpfOuCnpj;
    private Double pontos;
    private Localidade localidade;
    private List<Pedido> pedidoList;
    private TipoCliente tipoCliente;

    public ClienteRequest() {
    }

    public ClienteRequest(String nome, String cpfOuCnpj, Double pontos, Localidade localidade, List<Pedido> pedidoList, TipoCliente tipoCliente) {
        this.nome = nome;
        this.cpfOuCnpj = cpfOuCnpj;
        this.pontos = pontos;
        this.localidade = localidade;
        this.pedidoList = pedidoList;
        this.tipoCliente = tipoCliente;
    }

    public Cliente toCliente(ClienteRequest clienteRequest, TipoCliente tipoCliente){
        if(tipoCliente == TipoCliente.BRONZE){
            Cliente cliente = new ClienteBronze();
            setCliente(clienteRequest,cliente);
            return cliente;
        }
        if(tipoCliente == TipoCliente.PRATA){
            Cliente cliente = new ClientePrata();
            setCliente(clienteRequest,cliente);
            return cliente;
        }
        if(tipoCliente == TipoCliente.OURO){
            Cliente cliente = new ClienteOuro();
            setCliente(clienteRequest,cliente);
            return cliente;
        }
        return null;
    }

    private void setCliente(ClienteRequest clienteRequest, Cliente cliente){
        cliente.setPontos(0.0);
        cliente.setIdCliente(null);
        cliente.setLocalidade(clienteRequest.getLocalidade());
        cliente.setNome(clienteRequest.getNome());
        cliente.setPedidos(clienteRequest.pedidoList);
        cliente.setCpfOuCnpj(clienteRequest.getCpfOuCnpj());
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

    public List<Pedido> getPedidoList() {
        return pedidoList;
    }

    public void setPedidoList(List<Pedido> pedidoList) {
        this.pedidoList = pedidoList;
    }

    public TipoCliente getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(TipoCliente tipoCliente) {
        this.tipoCliente = tipoCliente;
    }
}
