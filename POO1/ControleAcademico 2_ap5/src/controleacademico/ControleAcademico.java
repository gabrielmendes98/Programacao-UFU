/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleacademico;

import academico.dominio.cursos.Disciplina;
import academico.dominio.cursos.GradeCurricular;
import academico.dominio.matriculas.Semestre;
import academico.dominio.pessoas.Professor;
import academico.dominio.pessoas.Aluno;

import javax.swing.JOptionPane;

/**
 *
 * @author Marcelo
 */
public class ControleAcademico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String mat1 = JOptionPane.showInputDialog("digite o nome da materia 1: ");
        String mat2 = JOptionPane.showInputDialog("digite o nome da materia 2: ");
        String mat3 = JOptionPane.showInputDialog("digite o nome da materia 3: ");
        
        Disciplina pp = new Disciplina(mat1);
        Disciplina aed1 = new Disciplina(mat2);
        Disciplina poo1 = new Disciplina(mat3);
        
        pp.prerequisito=mat2;
        
        GradeCurricular grade = new GradeCurricular();
        grade.incluiDisciplina(pp);
        //pp.incluiNaGrade(grade); Seria um bad smell: feature envy
        grade.incluiDisciplina(aed1);
        grade.incluiDisciplina(poo1);
        Professor profMarcelo = new Professor("Marcelo", "FACOM");
        Aluno alunoSeverino = new Aluno("Severino", grade);
        
        OfertaTurma ofertaPP = new OfertaTurma(2015, Semestre.SEGUNDO, pp);
        alunoSeverino.hist().matriculaDisciplina(ofertaPP); // tenta matricular em pp sem ter passado em aed1, nao é possivel.

        OfertaTurma ofertaAED1 = new OfertaTurma(2016, Semestre.PRIMEIRO, aed1);
        alunoSeverino.hist().matriculaDisciplina(ofertaAED1);
        
        OfertaTurma ofertaPOO1 = new OfertaTurma(2016, Semestre.PRIMEIRO, poo1);
        alunoSeverino.hist().matriculaDisciplina(ofertaPOO1);
        
        alunoSeverino.hist().verificaSeFormou();
        alunoSeverino.hist().registraResultado(aed1, 60); 
        System.out.println("\nPassou em " + mat2);
      
        alunoSeverino.hist().verificaSeFormou();
        alunoSeverino.hist().registraResultado(poo1, 60);
        System.out.println("\nPassou em " + mat3);
       
        alunoSeverino.hist().matriculaDisciplina(ofertaPP); // matricula em pp após ter passado em aed1
        
        alunoSeverino.hist().verificaSeFormou();
        alunoSeverino.hist().registraResultado(pp, 60);
        System.out.println("\nPassou em " + mat1);
        
        System.out.println("O aluno " + alunoSeverino.name() + " esta' " + (alunoSeverino.hist().verificaSeFormou() ? "formado!" : "ainda cursando"));
    }
    
}
