/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package questao2p2;

/**
 *
 * @author GABRIEL
 */
public class AfazerMarcado extends AfazerNaoMarcado{
    String inicio;
    String termino;
    public AfazerMarcado(String d, String i, String t){
        super(d);
        this.inicio=i;
        this.termino=t;
    }
    
    @Override
    public void imprime(){
        System.out.println(getDesc());
        System.out.println("Inicio: "+inicio);
        System.out.println("Termino: "+termino);
        if (getFeito() == true)
            System.out.println("Feito");
        else
            System.out.println("Nao feito");
    }
}
