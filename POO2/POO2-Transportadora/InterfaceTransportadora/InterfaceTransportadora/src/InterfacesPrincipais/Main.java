/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfacesPrincipais;

import InterfacesSecundarias.adicionarVeiculo;
import Repository.ClienteRepository;
import cliente.Cliente;
import cliente.ClienteBronze;
import cliente.ClienteOuro;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Gabriel
 */
public class Main {
    public static void main(String args[]) {
//        new Home().setVisible(true);
        
        ClienteRepository clienteRepository = new ClienteRepository();
        //Cliente cliente = clienteRepository.getbyCpf("10837316618");
        //System.out.println(cliente.toString());
        Cliente cliente = new ClienteBronze();
        cliente.setCpfOuCnpj("1111");
        cliente.setNome("yanlucas");
        clienteRepository.insertCliente(cliente);
//          
    }
}
