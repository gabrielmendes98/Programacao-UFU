/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prova2;

/**
 *
 * @author GABRIEL
 */
public class Prova2 {
    public static void main(String[] args) {
        Loja l = new Loja();
        ClienteVIP c1 = new ClienteVIP("Joao da Silva", "Rua Sapucai, 10. Uberlandia – MG");
        ClienteVVIP c2 = new ClienteVVIP("Michael Jackson", "Wonderland St., 100. Los Angeles – CA", "Edgar Fidalgo");
        l.adicionaCliente(c1);
        l.adicionaCliente(c2);
        l.imprimeMalaDireta();
    }
}
