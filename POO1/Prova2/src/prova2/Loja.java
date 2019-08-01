/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prova2;
import java.util.Vector;

/**
 *
 * @author GABRIEL
 */
public class Loja {
    Vector <ClienteVIP> cliente = new Vector <ClienteVIP>();
    String separador = "\n--------------------------\n";
    int i;
    
    public void adicionaCliente(ClienteVIP c){
        cliente.add(c);
    }
    
    public void imprimeMalaDireta(){
        for(i=0; i<cliente.size() && cliente.get(i)!= null; i++){
            System.out.print(separador);
            cliente.get(i).imprimeCarta();
        }
        System.out.println(separador);
    }
}
