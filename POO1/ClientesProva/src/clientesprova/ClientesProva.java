/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientesprova;

/**
 *
 * @author GABRIEL
 */
public class ClientesProva {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cliente c = new ClienteVIP("Joao da silva", "oi");
        Cliente c2 = new ClienteVVIP("Michael", "olar", "Edgar");
        Loja l = new Loja();
        l.adicionaCliente(c);
        l.adicionaCliente(c2);
        l.imprimeMalaDireta();
        
    }
    
}
