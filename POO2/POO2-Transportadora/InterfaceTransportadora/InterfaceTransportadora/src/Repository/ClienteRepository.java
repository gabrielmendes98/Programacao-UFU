/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repository;

import cliente.Cliente;
import cliente.ClienteOuro;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Gabriel
 */
public class ClienteRepository {

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;
    
    private void stabilishConection(){
    try{
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/Transportadora", "root1", "root");
            statement = (Statement) connection.createStatement();
           
        } catch(Exception e) {
            e.printStackTrace();   
        }
    }
    
    public ClienteRepository() {
        stabilishConection();
    }
    
    public Cliente getbyCpf(String cpf){
        try {
            //resultSet = statement.executeQuery("insert into cliente (nome, cpfoucnpj, tipocliente, pontos, idlocalidade, idpedidos) values('yan', '10837316618', 'OURO', 10, 3, 1)");
            resultSet = statement.executeQuery("select * from cliente where cpfoucnpj = "+cpf);   
            if(resultSet.getString("tipocliente")=="OURO"){
                Cliente cliente = new ClienteOuro();
                cliente.setIdCliente(resultSet.getInt(0));
                cliente.setNome(resultSet.getString(1));
                cliente.setCpfOuCnpj(resultSet.getString(2));
                cliente.setPontos(resultSet.getDouble(3));
                return cliente;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void insertCliente(Cliente cliente){
        String nome = cliente.getNome();
        String cpfOuCnpj = cliente.getCpfOuCnpj();
        String Tipo = "BRONZE";
        Double pontos = 0.0;
        try {
            statement.executeUpdate("insert into cliente (nome, cpfoucnpj, tipocliente, pontos, idlocalidade, idpedidos) values('" + nome + "','" + cpfOuCnpj + "','BRONZE', 0, 3, 1)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
