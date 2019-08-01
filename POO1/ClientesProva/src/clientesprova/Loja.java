/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientesprova;

import java.util.Vector;

/**
 *
 * @author GABRIEL
 */
public class Loja {
    Vector<Cliente> cliente = new Vector<Cliente>();
    
    public void adicionaCliente(Cliente c){
            cliente.add(c);
    }
    
    public void imprimeMalaDireta(){
        for(Cliente c: cliente){
            System.out.println("\n--------------------");
            c.imprimeMensagem();
        }
        System.out.println("--------------------");
    }
}
