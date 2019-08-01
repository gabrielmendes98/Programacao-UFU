package com.poo2.transportadora.domain.veiculo;

import com.poo2.transportadora.domain.enums.TipoItem;

import java.util.List;

public class VeiculoPequeno extends Veiculo {

    public VeiculoPequeno(){

    }

    public VeiculoPequeno(List<TipoItem> tipoItems, Rota rota, String cidadeAtual, Double pesoAtual, Double pesoMaximo){
        this.setTipoItemsCarregados(tipoItems);
        this.setRota(rota);
        this.setCidadeAtual(cidadeAtual);
        this.setPesoAtual(pesoAtual);
        this.setPesoMaximo(pesoMaximo);
    }
}
