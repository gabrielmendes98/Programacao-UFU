/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package historico;

/**
 *
 * @author a11621BCC015
 */
public class Aluno {
    String numeroDeMatricula;
    String nome, curso;
    Historico h = new Historico();
    
    void imprime () {
        
    System.out.println("Nome: " + nome); 
    System.out.println("Matricula: " + numeroDeMatricula); 
    System.out.println("Curso: " + curso); 
    h.imprime();
    }

}