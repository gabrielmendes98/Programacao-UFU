/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resolucaoprova;

/**
 *
 * @author GABRIEL
 */
public class ResolucaoProva {
    public static void main(String[] args) {
        Produto p1 = new Produto("Bola");
        Produto p2 = new Produto("Tenis");
        Loja l = new Loja();
        
        p1.preco=25;
        p1.qtd=20;
        p2.preco=100;
        p2.qtd=10;
        
        l.adicionaProduto(p1);
        l.adicionaProduto(p2);  
        
        int total;
        
        total = l.venda("Bola", 10);
        total += l.venda("Tenis", 3);
        System.out.println("Preco total das vendas: R$ " + total);
        
        l.reposicao("Bola", 5);
        
        l.imprimePrecos();
        l.imprimeEstoque();
    }
}
