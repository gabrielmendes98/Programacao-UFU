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
public class Baralho {
    //cria vetor do baralho
    Cartas[] monte;
    public void geraBaralho() {
        //determina quantidade de posicoes do baralho
        monte = new Cartas[40];
        
        //4 de espada
        monte[0].setValor(0);
        monte[0].setNumero("4");
        monte[0].setNaipe("Espada");
        monte[0].setImagem("4_espada");
        //4 de copas
	monte[0].setValor(0);
        monte[0].setNumero("4");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("4_copas");	
        //4 de ouros
	monte[0].setValor(0);
        monte[0].setNumero("4");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("4_ouros");
        
        
        //5 de espadas
	monte[0].setValor(1);
        monte[0].setNumero("5");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("5_espadas");
        //5 de copas
	monte[0].setValor(1);
        monte[0].setNumero("5");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("5_copas");
        //5 de ouros
	monte[0].setValor(1);
        monte[0].setNumero("5");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("5_ouros");
        //5 de paus
	monte[0].setValor(1);
        monte[0].setNumero("5");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("5_paus");
        
        
        //6 de espadas
	monte[0].setValor(2);
        monte[0].setNumero("6");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("6_espadas");
        //6 de copas
	monte[0].setValor(2);
        monte[0].setNumero("6");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("6_copas");
        //6 de ouros
	monte[0].setValor(2);
        monte[0].setNumero("6");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("6_ouros");
        //6 de paus
	monte[0].setValor(2);
        monte[0].setNumero("6");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("6_paus");

        
        //7 de espadas
	monte[0].setValor(3);
        monte[0].setNumero("7");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("7_espadas");
        //7 de paus
	monte[0].setValor(3);
        monte[0].setNumero("7");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("7_paus");
        
        
        //Dama de espadas
        monte[0].setValor(4);
        monte[0].setNumero("Dama");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("dama_espadas");        
        //Dama de ouros
        monte[0].setValor(4);
        monte[0].setNumero("Dama");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("dama_ouros");        
        //Dama de copas
        monte[0].setValor(4);
        monte[0].setNumero("Dama");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("dama_copas");        
        //Dama de paus
        monte[0].setValor(4);
        monte[0].setNumero("Dama");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("dama_paus");
        
        
        //Valete de espadas
        monte[0].setValor(5);
        monte[0].setNumero("Valete");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("valete_espadas");        
        //Valete de ouros
        monte[0].setValor(5);
        monte[0].setNumero("Valete");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("valete_ouros");        
        //Valete de copas
        monte[0].setValor(5);
        monte[0].setNumero("Valete");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("valete_copas");        
        //Valete de paus
        monte[0].setValor(5);
        monte[0].setNumero("Valete");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("valete_paus");
        
        
        //Rei de espadas
        monte[0].setValor(6);
        monte[0].setNumero("Rei");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("rei_espadas");        
        //Rei de ouros
        monte[0].setValor(6);
        monte[0].setNumero("Rei");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("rei_ouros");        
        //Rei de copas
        monte[0].setValor(6);
        monte[0].setNumero("Rei");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("rei_copas");        
        //Rei de paus
        monte[0].setValor(6);
        monte[0].setNumero("Rei");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("rei_paus");
        
        
        //As de copas
	monte[0].setValor(7);
        monte[0].setNumero("As");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("As_copas");
        //As de ouros
	monte[0].setValor(7);
        monte[0].setNumero("As");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("As_ouros");
        //As de Paus
	monte[0].setValor(7);
        monte[0].setNumero("As");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("As_paus");
        
        
        //2 de espadas
        monte[0].setValor(8);
        monte[0].setNumero("2");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("2_espadas");        
        //2 de ouros
        monte[0].setValor(8);
        monte[0].setNumero("2");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("2_ouros");        
        //2 de copas
        monte[0].setValor(8);
        monte[0].setNumero("2");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("2_copas");        
        //2 de paus
        monte[0].setValor(8);
        monte[0].setNumero("2");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("2_paus");
        
        
        //3 de espadas
        monte[0].setValor(9);
        monte[0].setNumero("3");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("3_espadas");       
        //3 de ouros
        monte[0].setValor(9);
        monte[0].setNumero("3");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("3_ouros");    
        //3 de copas
        monte[0].setValor(9);
        monte[0].setNumero("3");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("3_copas");
        //3 de paus
        monte[0].setValor(9);
        monte[0].setNumero("3");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("3_paus");


        //4 de Paus (zap)
	monte[0].setValor(13);
        monte[0].setNumero("4");
        monte[0].setNaipe("Paus");
        monte[0].setImagem("4_paus");
        //7 de copas
	monte[0].setValor(12);
        monte[0].setNumero("7");
        monte[0].setNaipe("Copas");
        monte[0].setImagem("7_copas");
        //As de espadas
	monte[0].setValor(11);
        monte[0].setNumero("As");
        monte[0].setNaipe("Espadas");
        monte[0].setImagem("As_espadas");
        //7 de ouros
	monte[0].setValor(10);
        monte[0].setNumero("7");
        monte[0].setNaipe("Ouros");
        monte[0].setImagem("7_ouros");

    }
}
