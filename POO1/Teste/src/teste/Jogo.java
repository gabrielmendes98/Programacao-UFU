/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.util.Vector;

/**
 *
 * @author GABRIEL
 */
public class Jogo {
    Vector<Jogador> jogadores = new Vector<Jogador>();
    
    void adicionaJogador(Jogador j){
        jogadores.add(j);
    }
    
    boolean verificaSeGanhou(){
        int i;
        for (i=0;i<this.jogadores.size();i++){
            if(this.jogadores.get(i).pontos()>=30)
                return true;
        }
        return false;
    }
    
    String maiorPontuacao(){
        int i,maior;
        String name;
        String name_ = "";
        maior = this.jogadores.get(0).pontos();
        name = this.jogadores.get(0).nome();
        for (i=1;i<this.jogadores.size();i++){
            if(maior<this.jogadores.get(i).pontos()){
                name = this.jogadores.get(i).nome();
                maior = this.jogadores.get(i).pontos();
            }
        }
        for (i=0;i<this.jogadores.size();i++){
            if(this.jogadores.get(0).pontos()>=30)
                name_ = name_ + this.jogadores.get(i).nome() + " - ";
        }
        return name_;
    }
}
