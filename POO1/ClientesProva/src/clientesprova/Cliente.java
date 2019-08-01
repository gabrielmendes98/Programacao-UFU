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
public class Cliente {
    private String nome;
    private String endereco;
    
    public Cliente(String n, String e){
        this.nome = n;
        this.endereco = e;
    }
    
    public String getNome(){
        return nome;
    }
    
    public String getEndereco(){
        return endereco;
    }
    
    public void imprimeMensagem(){
        System.out.println(nome + "\n" + endereco);
    }
}
