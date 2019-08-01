/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

/**
 *
 * @author GABRIEL
 */
public class Dupla {
    Jogador jogador1 = new Jogador();
    Jogador jogador2 = new Jogador();
    int quedas_ganhas=0;
    int quedas_jogadas=0;
    
    void cadastraJogadores (Jogador j1, Jogador j2){
        this.jogador1 = j1;
        this.jogador2 = j2;
    }
    
    void adicionaQueda(){
        this.quedas_jogadas++;
    }
    
    void adicionaQuedaGanha(){
        this.quedas_jogadas++;
        this.quedas_ganhas++;
    }
}
