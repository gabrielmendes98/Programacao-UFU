/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

/**
 *
 * @author GABRIEL
 */
public class Jogador {
    private String nome;
    private int pontos=0;
    
    public Jogador(String nome){
        this.nome = nome;
    }
    
    public String nome(){
        return nome;
    }
    
    public int pontos(){
        return pontos;
    }
    
    public void AtualizaPontos(int pontos){
        this.pontos += pontos;
    }
    
    void jogaDado(){
        this.AtualizaPontos((int)(Math.random()*6)+1);
    }
}
