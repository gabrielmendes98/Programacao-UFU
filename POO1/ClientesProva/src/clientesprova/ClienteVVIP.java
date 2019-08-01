/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientesprova;

/**
 *
 * @author GABRIEL
 */
public class ClienteVVIP extends Cliente{
    private String gerente;
    public ClienteVVIP(String n, String e, String g){
        super(n,e);
        this.gerente = g;
    }
    
    @Override
    public void imprimeMensagem(){
        System.out.println(getNome() + "\n" + getEndereco() + "\n");
        System.out.println(getNome() + ", \n  Quanta alegria em te convidar a tomar um cafézinho com o nosso gerente " + gerente + ". Estaremos em promoção no dia 23/07 e convidamos você a aproveitar 50% de desconto em toda nossa loja.");
    }
}
