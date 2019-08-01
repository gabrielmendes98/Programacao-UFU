/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prova2;

/**
 *
 * @author GABRIEL
 */
public class ClienteVIP {
    private final String nome;
    private final String endereco;
    
    public ClienteVIP(String n, String e){
        nome = n;
        endereco = e;
    }
    
    public String getNome(){
        return nome;
    }
    
    public String getEndereco(){
        return endereco;
    }
    
    public void imprimeBase(){
        System.out.println(nome);
        System.out.println(endereco + "\n");
    }
    
    public void imprimeCarta(){
        imprimeBase();
        System.out.println("Prezado(a) "+ nome +", estaremos em promoção no dia 23/07 e convidamos você a aproveitar 30% de desconto em toda nossa loja.");
    }
}
