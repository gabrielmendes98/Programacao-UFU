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
public class ClienteVIP extends Cliente{
    public ClienteVIP(String n, String e){
        super(n,e);
    }
    
    @Override
    public void imprimeMensagem(){
        System.out.println(getNome() + "\n" + getEndereco() + "\n");
        System.out.println("Prezado(a) " + getNome() + ", \n  estaremos em promoção no dia 23/07 e convidamos você a aproveitar 30% de desconto em toda nossa loja.");
    }
}
