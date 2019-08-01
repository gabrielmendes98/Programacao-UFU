/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.dominio.pessoas;

import academico.dominio.cursos.GradeCurricular;
import controleacademico.Historico;

/**
 *
 * @author Marcelo
 */
public class Aluno {
    private String nome;
    private GradeCurricular grade;
    private Historico historico;
    
    public Aluno (String n, GradeCurricular g) {
        nome = n;
        grade = g;
        historico = new Historico(this);
    }
    
    public Historico hist(){
        return historico;
    }
    
    public String name(){
        return nome;
    }
    
    public GradeCurricular grade(){
        return grade;
    }
}
