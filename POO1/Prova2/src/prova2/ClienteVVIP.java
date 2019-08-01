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
public class ClienteVVIP extends ClienteVIP {
    
    private final String gerente;
    
    public ClienteVVIP(String n, String e, String g){
        super(n,e);
        gerente = g;
    }
    
    public void imprimeCarta(){
        imprimeBase();
        System.out.println(getNome() + ", Quanta alegria em te convidar a tomar um cafézinho com o nosso gerente " + gerente + ". Estaremos em promoção no dia 23/07 e convidamos você a aproveitar 50% de desconto em toda nossa loja.");
    }
}
