package com.poo2.transportadora.domain.constantes;


import com.poo2.transportadora.repository.ConstantesDAORepository;

import org.springframework.beans.factory.annotation.Autowired;

//Calculo de preço funcionando
public class Constantes {

    @Autowired
    private ConstantesDAORepository constantesDAORepository;

    private static Constantes instanciaunica = null;

    private Double realPorDistanciaExpress10;
    private Double realPorDistanciaSarve;
    private Double realPorDistanciaNormal;

    private Double multiplicadorTipoRadioativoEToxico;
    private Double multiplicadorTipoInflamavel;
    private Double multiplicadorTipoNormalELiquido;

    private Double taxaConversaoReiasPontos;

    private Constantes(){

    }

    public static Constantes getInstance(){
        if(instanciaunica == null){
            instanciaunica = new Constantes();
        }
        return instanciaunica;
    }

    public Double getRealPorDistanciaExpress10() {
        return realPorDistanciaExpress10;
    }

    public Double getRealPorDistanciaSarve() {
        return realPorDistanciaSarve;
    }

    public Double getRealPorDistanciaNormal() {
        return realPorDistanciaNormal;
    }

    public Double getMultiplicadorTipoRadioativoEToxico() {
        return multiplicadorTipoRadioativoEToxico;
    }

    public Double getMultiplicadorTipoInflamavel() {
        return multiplicadorTipoInflamavel;
    }

    public Double getMultiplicadorTipoNormalELiquido() {
        return multiplicadorTipoNormalELiquido;
    }

    public void setRealPorDistanciaExpress10(Double realPorDistanciaExpress10) {
        this.realPorDistanciaExpress10 = realPorDistanciaExpress10;
    }

    public void setRealPorDistanciaSarve(Double realPorDistanciaSarve) {
        this.realPorDistanciaSarve = realPorDistanciaSarve;
    }

    public void setRealPorDistanciaNormal(Double realPorDistanciaNormal) {
        this.realPorDistanciaNormal = realPorDistanciaNormal;
    }

    public void setMultiplicadorTipoRadioativoEToxico(Double multiplicadorTipoRadioativoEToxico) {
        this.multiplicadorTipoRadioativoEToxico = multiplicadorTipoRadioativoEToxico;
    }

    public void setMultiplicadorTipoInflamavel(Double multiplicadorTipoInflamavel) {
        this.multiplicadorTipoInflamavel = multiplicadorTipoInflamavel;
    }

    public void setMultiplicadorTipoNormalELiquido(Double multiplicadorTipoNormalELiquido) {
        this.multiplicadorTipoNormalELiquido = multiplicadorTipoNormalELiquido;
    }

    public Double getTaxaConversaoReiasPontos() {
        return taxaConversaoReiasPontos;
    }

    public void setTaxaConversaoReiasPontos(Double taxaConversaoReiasPontos) {
        this.taxaConversaoReiasPontos = taxaConversaoReiasPontos;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Constantes{");
        sb.append("realPorDistanciaExpress10=").append(realPorDistanciaExpress10);
        sb.append(", realPorDistanciaSarve=").append(realPorDistanciaSarve);
        sb.append(", realPorDistanciaNormal=").append(realPorDistanciaNormal);
        sb.append(", multiplicadorTipoRadioativoEToxico=").append(multiplicadorTipoRadioativoEToxico);
        sb.append(", multiplicadorTipoInflamavel=").append(multiplicadorTipoInflamavel);
        sb.append(", multiplicadorTipoNormalELiquido=").append(multiplicadorTipoNormalELiquido);
        sb.append('}');
        return sb.toString();
    }
}

