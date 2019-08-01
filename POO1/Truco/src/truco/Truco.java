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
public class Truco {

    public static void main(String[] args) {
        Jogador j1 = new Jogador();
        j1.c1.setNumero("Rei");
        j1.c2.setNumero("Dama");
        j1.c3.setNumero("As");
        
        j1.c1.setNaipe("Ouros");
        j1.c2.setNaipe("Ouros");
        j1.c3.setNaipe("Ouros");
        
        Menu m = new Menu();
        OpcoesJogador j = new OpcoesJogador(j1);
    }
    
}
