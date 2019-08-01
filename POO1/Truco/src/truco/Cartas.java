/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

/**
 *
 * @author GABRIEL
 */
public class Cartas {
    private int valor; //Valor de compargação das cartas
    private String numero; //Numeração da carta
    private String naipe; //Naipe das cartas
    private String imagem; //Campo para armazenar link da imagem

    
    public int getValor() {
        return valor;
    }

    
    public void setValor(int valor) {
        this.valor = valor;
    }

    
    public String getNumero() {
        return numero;
    }

    
    public void setNumero(String numero) {
        this.numero = numero;
    }

    
    public String getNaipe() {
        return naipe;
    }

    
    public void setNaipe(String naipe) {
        this.naipe = naipe;
    }

    
    public String getImagem() {
        return imagem;
    }

    
    public void setImagem(String imagem) {
        this.imagem = imagem;
    }
}