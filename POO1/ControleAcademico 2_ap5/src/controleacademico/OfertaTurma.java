/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleacademico;
import academico.dominio.cursos.Disciplina;
import academico.dominio.matriculas.Semestre;
import academico.dominio.pessoas.Professor;
import academico.dominio.pessoas.Aluno;
import java.util.*;
/**
 *
 * @author Marcelo
 */
public class OfertaTurma {
    private int ano;
    private Semestre semestre;
    private Disciplina disciplina;
    private Vector<MatriculaAluno> alunosMatriculados;
    private Professor  professor;
    
    public OfertaTurma (int ano, Semestre s, Disciplina d) {
        this.ano = ano;
        this.semestre = s;
        this.disciplina = d; 
        alunosMatriculados = new Vector<MatriculaAluno>();
    }
    void matriculaAluno (MatriculaAluno m) {
        alunosMatriculados.add(m);
    }
    
    void cancelaMatricula (Aluno a) {
        alunosMatriculados.remove(a);
    }
    
    public void vinculaProfessor (Professor p) {
        professor = p;
        professor.ficaAlocadoTurma(this);
    }    

    String nomeDisciplina() {
        return this.disciplina.getNome();
    }
    
    public Disciplina disciplina(){
        return disciplina;
    }
}
