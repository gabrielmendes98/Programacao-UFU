/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cadastro;

/**
 *
 * @author GABRIEL
 */
public class Pessoa {
   private String nome;
   private String telefone;
   
   public Pessoa(){
   }
   
   public String getNome(){
    return nome;
   }
   
   public void setNome(String name){
    nome = name;
   }
   
   public void setTelefone(String tel){
       telefone = tel;
   }
   
   public void imprime(){
       System.out.println(nome);
       System.out.println(telefone);
   }
}