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
public class Cadastros {
    Vector<Jogador> jogador = new Vector<Jogador>();
    Vector<Dupla> dupla = new Vector<Dupla>();
            
    void adicionaJogador (Jogador j) {
        jogador.add(j);
    }
    
    public String listaJogadoresCadastrados(){
        String lista="Jogadores cadastrados:\n";
        for(Jogador j: jogador)
            lista+=j.getNome()+"\n";
        return lista;
    }
    
    void adicionaDupla (Dupla d){
        dupla.add(d);
    }
    
    public String listaDuplasCadastradas(){
        int i=1;
        String lista="Duplas cadastradas:\n";
        for(Dupla d: dupla){
            lista+="Dupla " + i + ":\n" ;
            lista+=d.jogador1.getNome() + " & ";
            lista+=d.jogador2.getNome() + "\n";
            i++;
        }
        return lista;
    }
}
