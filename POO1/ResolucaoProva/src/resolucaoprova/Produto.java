/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucaoprova;
public class Produto {
    String descricao;
    int qtd;
    int preco;
    
    public Produto(String nome){
        this.descricao = nome;
    }
    
    void venda(int qtd){
        this.qtd = this.qtd - qtd;
    }
    
    void reposicao(int qtd){
        this.qtd = this.qtd + qtd;
    }
}
