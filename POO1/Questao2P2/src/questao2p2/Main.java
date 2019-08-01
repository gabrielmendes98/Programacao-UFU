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
public class Main {
    public static void main(String[] args) {
         Agenda a = new Agenda();
         AfazerNaoMarcado af1 = new AfazerNaoMarcado("Aula Pratica");
         AfazerMarcado af2 = new AfazerMarcado("Trabalho Truco", "13/12/17 - 11:00", "13/12/17 - 11:30");
         
         af2.setFeito();
         
         a.addAgenda(af1);
         a.addAgenda(af2);
         a.imprime();
    }
}
