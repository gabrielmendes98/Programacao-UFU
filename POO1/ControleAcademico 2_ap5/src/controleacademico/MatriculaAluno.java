package controleacademico;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import academico.dominio.matriculas.*;
import academico.dominio.cursos.*;
import academico.dominio.pessoas.*;

/*
import academico.dominio.pessoas.Aluno;
import controleacademico.Disciplina;
import controleacademico.OfertaTurma;
import controleacademico.StatusMatriculaDisciplina;

/**
 *
 * @author Marcelo
 */
public class MatriculaAluno {
    private Aluno aluno;
    private OfertaTurma oferta;
    private StatusMatriculaDisciplina  status;
    private float nota;
    
    MatriculaAluno (Aluno a, OfertaTurma o) {
        aluno = a;
        oferta = o;
        status = StatusMatriculaDisciplina.CURSANDO;
    }
    
    Aluno alunoMatriculado () {
        return aluno;
    }
    
    OfertaTurma turmaMatriculada() {
        return oferta;
    }
    
    void registraNota (float n) {
        this.nota = n;
        if (this.nota >= 60)
            status = StatusMatriculaDisciplina.APROVADA;
        else
            status = StatusMatriculaDisciplina.REPROVADA;            
    }
    
    void trancaMatricula () {
        this.status = StatusMatriculaDisciplina.TRANCADA;
    }    
    
    boolean aprovado (Disciplina d) {
        return d.getNome().equals(oferta.nomeDisciplina()) && status == StatusMatriculaDisciplina.APROVADA;
    }
    
    public OfertaTurma oferta(){
        return oferta;
    } 
    
    public StatusMatriculaDisciplina status(){
        return status;
    } 
}
