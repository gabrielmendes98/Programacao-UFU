/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleacademico;

/**
 *
 * @author Marcelo
 */
public class Aluno {
    String nome;
    GradeCurricular grade;
    Historico historico;
    
    Aluno (String n, GradeCurricular g) {
        nome = n;
        grade = g;
        historico = new Historico(this);
    }
}
