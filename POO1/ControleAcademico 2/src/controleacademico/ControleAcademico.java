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
public class ControleAcademico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Disciplina pp = new Disciplina("PP");
        Disciplina aed1 = new Disciplina("AED1");
        Disciplina poo1 = new Disciplina("POO1");
        
        pp.prerequisito="AED1";
        
        GradeCurricular grade = new GradeCurricular();
        grade.incluiDisciplina(pp);
        //pp.incluiNaGrade(grade); Seria um bad smell: feature envy
        grade.incluiDisciplina(aed1);
        grade.incluiDisciplina(poo1);
        Professor profMarcelo = new Professor("Marcelo", "FACOM");
        Aluno alunoSeverino = new Aluno("Severino", grade);
        
        OfertaTurma ofertaPP = new OfertaTurma(2015, Semestre.SEGUNDO, pp);
        alunoSeverino.historico.matriculaDisciplina(ofertaPP); // tenta matricular em pp sem ter passado em aed1, nao é possivel.

        OfertaTurma ofertaAED1 = new OfertaTurma(2016, Semestre.PRIMEIRO, aed1);
        alunoSeverino.historico.matriculaDisciplina(ofertaAED1);
        
        OfertaTurma ofertaPOO1 = new OfertaTurma(2016, Semestre.PRIMEIRO, poo1);
        alunoSeverino.historico.matriculaDisciplina(ofertaPOO1);
        
        alunoSeverino.historico.verificaSeFormou();
        alunoSeverino.historico.registraResultado(aed1, 60); 
        System.out.println("\nPassou em aed1");
      
        alunoSeverino.historico.verificaSeFormou();
        alunoSeverino.historico.registraResultado(poo1, 60);
        System.out.println("\nPassou em poo1");
       
        alunoSeverino.historico.matriculaDisciplina(ofertaPP); // matricula em pp após ter passado em aed1
        
        alunoSeverino.historico.verificaSeFormou();
        alunoSeverino.historico.registraResultado(pp, 60);
        System.out.println("\nPassou em pp");
        
        System.out.println("O aluno " + alunoSeverino.nome + " esta' " + (alunoSeverino.historico.verificaSeFormou() ? "formado!" : "ainda cursando"));
    }
    
}
