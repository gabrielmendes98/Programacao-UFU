package com.poo2.transportadora.domain.veiculo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;


//TODO AO CHEGAR EM UMA CIDADE, CASO EXISTA PEDIDO QUE DEVE SER ENTREGADO NELA, RETIRAR O PEDIDO COMO OBSERVADOR E MUDAR STATUS, ETC, LIBERAR PESO
@Document
public class Rota {
    @Id
    private String idRota;
    private List<String> cidades;

    public Rota(){

    }

    public Rota(String idRota, List<String> cidades) {
        this.idRota = idRota;
        this.cidades = cidades;
    }

    public String getIdRota() {
        return idRota;
    }

    public void setIdRota(String idRota) {
        this.idRota = idRota;
    }

    public List<String> getCidades() {
        return cidades;
    }

    public void setCidades(List<String> cidades) {
        this.cidades = cidades;
    }
}
