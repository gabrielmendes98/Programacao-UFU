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
public class AfazerNaoMarcado {
    private String descricao;
    private boolean feito;
    
    public AfazerNaoMarcado(String d){
        this.descricao = d;
        this.feito = false;
    }
    
    public String getDesc(){
        return descricao;
    }
    
    public boolean getFeito(){
        return feito;
    }
    
    void setFeito(){
        this.feito = true;
    }
    
    public void imprime(){
        System.out.println(descricao);
        if (feito == true)
            System.out.println("Feito");
        else
            System.out.println("Nao feito");
    }
    
}
