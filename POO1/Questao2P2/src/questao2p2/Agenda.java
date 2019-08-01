/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package questao2p2;

import java.util.Vector;

/**
 *
 * @author GABRIEL
 */
public class Agenda {
    Vector<AfazerNaoMarcado> afazer = new Vector<AfazerNaoMarcado>();
    
    void addAgenda(AfazerNaoMarcado a){
        afazer.add(a);
    }
    
    void imprime(){
        for(AfazerNaoMarcado a: afazer){
            a.imprime();
            System.out.print("\n");
        }
    }
}
