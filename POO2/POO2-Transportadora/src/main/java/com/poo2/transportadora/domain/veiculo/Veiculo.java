package com.poo2.transportadora.domain.veiculo;

import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.enums.StatusVeiculo;
import com.poo2.transportadora.domain.enums.TipoItem;
import com.poo2.transportadora.domain.enums.TipoVeiculo;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Document
public abstract class Veiculo implements Subject, Serializable {
    private  static final long serialVersionUID = 1L;

    protected Veiculo next;

    @Id
    private String idVeiculo;
    private String modelo;
    private String placa;
    private String marca;
    private String ultimaRevisao;
    private List<TipoItem> tipoItemsCarregados;
    private Double pesoMaximo;
    private Double pesoAtual;
    private String cidadeAtual;
    private Rota rota;
    private StatusVeiculo statusVeiculo;
    private TipoVeiculo tipoVeiculo;
    private List<Pedido> pedidosCarregados;

    @Override
    public void addObserver(Pedido pedido) {
        pedidosCarregados.add(pedido);
    }

    @Override
    public void removeObserver(Pedido pedido) {
        int index = pedidosCarregados.indexOf( pedido );
        if( index > -1 ){
            pedidosCarregados.remove( pedido );
        }
    }

    @Override
    public void notifyObservers() { /* MÉTODO ONDE HÁ A COMUNICAÇÃO DA MUDANCA DE ESTADO */
        for( Pedido o :pedidosCarregados ){
            o.update(cidadeAtual);
        }
    }

    public void setNext(Veiculo next) {
        if(this.next == null)
            this.next = next;
        else
            this.next.setNext(next);
    }

    /**
     * Aloca um pedido no veiculo, somando o peso do veiculo e adicionando um pedido na lista de pedidos carregado
     * @param pedido
     */
    public void alocaPedido(Pedido pedido){
        addObserver(pedido);
        this.pesoAtual = this.pesoAtual + pedido.getPesoTotal();
    }

    /**
     * Retorna um veiculo disponivel para realizar a entrega
     * @param pedido
     * @return
     */
    public Veiculo buscaVeiculo(Pedido pedido) {
        if(podeEfetuarEntrega(pedido))
            return this;
        if(next==null)
            return null;
        return next.buscaVeiculo(pedido);
    }

    /**
     * Verifica se o veiculo pode efetuar a entrega
     * @param pedido
     * @return
     */
    //TODO ADICIONAR VERIFICACAP DE SERVIÇO DE PREFERENCIA DE UM PEDIDO(EXPRESS, SARVE, NORMAL)
    //TODO ACERTAR ESSA PARTE COMENTADA AQUI
    private boolean podeEfetuarEntrega(Pedido pedido) {
        if (pedido.getPesoTotal() + pesoAtual < pesoMaximo)
            if (verificaTipos(pedido.getTipoItems()))
                if(/*cidadeAtual == pedido.getCidadePartida() &&*/ verificaDestinos(pedido.getCidadeDestino()))
                    return true;
        return false;
    }

    /**
     * Verifica se o veiculo carrega os tipo dados
     * @param tipoItems
     * @return
     */
    private boolean verificaTipos(List<TipoItem> tipoItems) {

        List<Boolean> list = new ArrayList<>();
        for(TipoItem s : tipoItems){
            if(tipoItemsCarregados.contains(s)){
                list.add(true);
            }
            else {
                list.add(false);
            }
        }
        if (list.contains(false)){
            return false;
        }
        return true;
    }

    /**
     * Verifica se o veiculo ira para o destino dado
     * @param cidadeDestino
     * @return
     */
    private boolean verificaDestinos(String cidadeDestino){
        Integer indexCidadeAtual;
        Integer indexCidadeDestino;
        indexCidadeDestino = rota.getCidades().indexOf(cidadeDestino);
        indexCidadeAtual = rota.getCidades().indexOf(cidadeAtual);

        if(indexCidadeDestino>indexCidadeAtual && statusVeiculo == StatusVeiculo.INDO){
            return true;
        } else if(indexCidadeDestino<indexCidadeAtual && statusVeiculo == StatusVeiculo.VOLTANDO){
            return true;
        }
        return false;
    }


    public Veiculo(){
    }

    public Veiculo(Veiculo next, Double pesoMaximo, String idVeiculo, String modelo, String placa, String marca, String ultimaRevisao, List<TipoItem> tipoItemsCarregados, Double pesoAtual, String cidadeAtual, Rota rota, StatusVeiculo statusVeiculo, TipoVeiculo tipoVeiculo, List<Pedido> pedidosCarregados) {
        this.next = next;
        this.pesoMaximo = pesoMaximo;
        this.idVeiculo = idVeiculo;
        this.modelo = modelo;
        this.placa = placa;
        this.marca = marca;
        this.ultimaRevisao = ultimaRevisao;
        this.tipoItemsCarregados = tipoItemsCarregados;
        this.pesoAtual = pesoAtual;
        this.cidadeAtual = cidadeAtual;
        this.statusVeiculo = statusVeiculo;
        this.tipoVeiculo = tipoVeiculo;
        this.pedidosCarregados = pedidosCarregados;
    }

    public Veiculo getNext() {
        return next;
    }

    public Double getPesoMaximo() {
        return pesoMaximo;
    }

    public void setPesoMaximo(Double pesoMaximo) {
        this.pesoMaximo = pesoMaximo;
    }

    public String getIdVeiculo() {
        return idVeiculo;
    }

    public void setIdVeiculo(String idVeiculo) {
        this.idVeiculo = idVeiculo;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getUltimaRevisao() {
        return ultimaRevisao;
    }

    public void setUltimaRevisao(String ultimaRevisao) {
        this.ultimaRevisao = ultimaRevisao;
    }

    public List<TipoItem> getTipoItemsCarregados() {
        return tipoItemsCarregados;
    }

    public void setTipoItemsCarregados(List<TipoItem> tipoItemsCarregados) {
        this.tipoItemsCarregados = tipoItemsCarregados;
    }

    public Double getPesoAtual() {
        return pesoAtual;
    }

    public void setPesoAtual(Double pesoAtual) {
        this.pesoAtual = pesoAtual;
    }

    public String getCidadeAtual() {
        return cidadeAtual;
    }

    public void setCidadeAtual(String cidadeAtual) {
        this.cidadeAtual = cidadeAtual;
    }

    /**
     * Ao trocar de cidade o veiculo notifica os pedidos atualizando a cidade atual dele "RASTREAMENTO"
     * @param cidadeAtual
     */
    public void mudaCidade(String cidadeAtual){
        this.cidadeAtual = cidadeAtual;
        notifyObservers();
    }

    public Rota getRota() {
        return rota;
    }

    public void setRota(Rota rota) {
        this.rota = rota;
    }

    public StatusVeiculo getStatusVeiculo() {
        return statusVeiculo;
    }

    public void setStatusVeiculo(StatusVeiculo statusVeiculo) {
        this.statusVeiculo = statusVeiculo;
    }

    public TipoVeiculo getTipoVeiculo() {
        return tipoVeiculo;
    }

    public void setTipoVeiculo(TipoVeiculo tipoVeiculo) {
        this.tipoVeiculo = tipoVeiculo;
    }

    public List<Pedido> getPedidosCarregados() {
        return pedidosCarregados;
    }

    public void setPedidosCarregados(List<Pedido> pedidosCarregados) {
        this.pedidosCarregados = pedidosCarregados;
    }
}
