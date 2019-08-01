/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

import java.util.Vector;

/**
 *
 * @author GABRIEL
 */
public class Jogador {
    private String nome;
    int esta_em_dupla = 0;
    Cartas c1 = new Cartas();
    Cartas c2 = new Cartas();
    Cartas c3 = new Cartas();
    //vetor de cartas
    
    public String getNome(){
        return nome;
    }
    
    public void setNome(String name){
        nome = name;
    }
}
