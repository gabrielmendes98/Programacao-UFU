/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleeventos;

/**
 *
 * @author GABRIEL
 */
public class ApresentadorArtigo extends Apresentador {
    public ApresentadorArtigo(String n, Evento e, String t) {
        super(n,e,t);
    }   
    
    public String certificado () {
        return "Declaramos que " + getNome() + " apresentou o Artigo " +
        getTitulo() + " no " + getEvento().getNome();
    }
}
