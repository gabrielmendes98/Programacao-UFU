/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucaoprova;

import java.util.Vector;

public class Loja {
    Vector<Produto> produtos = new Vector<Produto>();
    
    void adicionaProduto(Produto p){
        produtos.add(p);
    }
    
    int venda(String nome, int qtd){
        for(Produto x : produtos)
            if(x.descricao.equals(nome)){
                x.venda(qtd);
                return x.preco*qtd;
            }
        System.out.println("Produto nao encontrado");
        return 0;
    }
    
    void reposicao(String nome, int qtd){
        for(Produto x : produtos)
            if(x.descricao.equals(nome)){
                x.reposicao(qtd);
                return;
            }
        System.out.println("Produto nao encontrado");
    }
    
    int estoque(String nome){
        for(Produto x : produtos)
            if(x.descricao.equals(nome)){
                return x.qtd;
            }
        System.out.println("Produto nao encontrado");
        return 0;
    }
    
    void imprimePrecos(){
        for(Produto x : produtos)
            System.out.println(x.descricao + ": R$ " + x.preco);
    }
    
    void imprimeEstoque(){
        for(Produto x : produtos)
            System.out.println(x.descricao + " em estoque: " + x.qtd);
    }
}
