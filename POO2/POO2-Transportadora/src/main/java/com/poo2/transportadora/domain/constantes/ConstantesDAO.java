package com.poo2.transportadora.domain.constantes;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Objects;


//TODO ANTES DE CALCULAR O VALOR DE UM PEDIDO ATUALIZAR AS CONSTANTES COM OS VALORES DO BANCO DE DADOS
@Document
public class ConstantesDAO implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private String id;

    private Double realPorDistanciaExpress10;
    private Double realPorDistanciaSarve;
    private Double realPorDistanciaNormal;
    private Double multiplicadorTipoRadioativoEToxico;
    private Double multiplicadorTipoInflamavel;
    private Double multiplicadorTipoNormalELiquido;
    private Double taxaConversaoReiasPontos;

    public ConstantesDAO(){

    }

    public ConstantesDAO(String id, Double realPorDistanciaExpress10, Double realPorDistanciaSarve, Double realPorDistanciaNormal, Double multiplicadorTipoRadioativoEToxico, Double multiplicadorTipoInflamavel, Double multiplicadorTipoNormalELiquido, Double taxaConversaoReiasPontos) {
        Id = id;
        this.realPorDistanciaExpress10 = realPorDistanciaExpress10;
        this.realPorDistanciaSarve = realPorDistanciaSarve;
        this.realPorDistanciaNormal = realPorDistanciaNormal;
        this.multiplicadorTipoRadioativoEToxico = multiplicadorTipoRadioativoEToxico;
        this.multiplicadorTipoInflamavel = multiplicadorTipoInflamavel;
        this.multiplicadorTipoNormalELiquido = multiplicadorTipoNormalELiquido;
        this.taxaConversaoReiasPontos = taxaConversaoReiasPontos;
    }


    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public Double getRealPorDistanciaExpress10() {
        return realPorDistanciaExpress10;
    }

    public void setRealPorDistanciaExpress10(Double realPorDistanciaExpress10) {
        this.realPorDistanciaExpress10 = realPorDistanciaExpress10;
    }

    public Double getRealPorDistanciaSarve() {
        return realPorDistanciaSarve;
    }

    public void setRealPorDistanciaSarve(Double realPorDistanciaSarve) {
        this.realPorDistanciaSarve = realPorDistanciaSarve;
    }

    public Double getRealPorDistanciaNormal() {
        return realPorDistanciaNormal;
    }

    public void setRealPorDistanciaNormal(Double realPorDistanciaNormal) {
        this.realPorDistanciaNormal = realPorDistanciaNormal;
    }

    public Double getMultiplicadorTipoRadioativoEToxico() {
        return multiplicadorTipoRadioativoEToxico;
    }

    public void setMultiplicadorTipoRadioativoEToxico(Double multiplicadorTipoRadioativoEToxico) {
        this.multiplicadorTipoRadioativoEToxico = multiplicadorTipoRadioativoEToxico;
    }

    public Double getMultiplicadorTipoInflamavel() {
        return multiplicadorTipoInflamavel;
    }

    public void setMultiplicadorTipoInflamavel(Double multiplicadorTipoInflamavel) {
        this.multiplicadorTipoInflamavel = multiplicadorTipoInflamavel;
    }

    public Double getMultiplicadorTipoNormalELiquido() {
        return multiplicadorTipoNormalELiquido;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ConstantesDAO that = (ConstantesDAO) o;
        return Objects.equals(Id, that.Id) &&
                Objects.equals(realPorDistanciaExpress10, that.realPorDistanciaExpress10) &&
                Objects.equals(realPorDistanciaSarve, that.realPorDistanciaSarve) &&
                Objects.equals(realPorDistanciaNormal, that.realPorDistanciaNormal) &&
                Objects.equals(multiplicadorTipoRadioativoEToxico, that.multiplicadorTipoRadioativoEToxico) &&
                Objects.equals(multiplicadorTipoInflamavel, that.multiplicadorTipoInflamavel) &&
                Objects.equals(multiplicadorTipoNormalELiquido, that.multiplicadorTipoNormalELiquido);
    }

    @Override
    public int hashCode() {
        return Objects.hash(Id, realPorDistanciaExpress10, realPorDistanciaSarve, realPorDistanciaNormal, multiplicadorTipoRadioativoEToxico, multiplicadorTipoInflamavel, multiplicadorTipoNormalELiquido);
    }
}