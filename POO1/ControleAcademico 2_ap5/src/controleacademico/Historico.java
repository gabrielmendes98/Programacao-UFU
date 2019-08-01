/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleacademico;
import academico.dominio.cursos.Disciplina;
import academico.dominio.matriculas.StatusMatriculaDisciplina;
import academico.dominio.pessoas.Aluno;
import java.util.*;
/**
 *
 * @author Marcelo
 */
public class Historico {
    private ArrayList<MatriculaAluno> disciplinasMatriculadas;
    private Aluno aluno;
     
    public Historico (Aluno a) {
         aluno = a;
         disciplinasMatriculadas = new ArrayList<MatriculaAluno>();
    }
    
    void matriculaDisciplina (OfertaTurma oferta) {
        if("0".equals(oferta.disciplina().prerequisito)){
             MatriculaAluno m = new MatriculaAluno (aluno, oferta);
             this.disciplinasMatriculadas.add(m);
             oferta.matriculaAluno(m);
        }
        else{
            for(int i=0;i<aluno.grade().disciplinas.size();i++){
                if(aluno.grade().disciplinas.get(i).getNome().equals(oferta.disciplina().prerequisito) && constaAprovacao(aluno.grade().disciplinas.get(i))){
                    MatriculaAluno m = new MatriculaAluno (aluno, oferta);
                    this.disciplinasMatriculadas.add(m);
                    oferta.matriculaAluno(m);
                    return;
                }          
            }
            System.out.println("Nao eh possivel matricular em " + oferta.nomeDisciplina() + " nao aprovado em " + oferta.disciplina().prerequisito);
        }
    }
     
    boolean constaAprovacao (Disciplina d) {
         for (MatriculaAluno m: disciplinasMatriculadas) {
             if (m.aprovado(d))
                 return true;
         }
         return false;
    }
    
    void registraResultado (Disciplina d, int nota) {
        for (MatriculaAluno m: disciplinasMatriculadas) {
            if (m.oferta().nomeDisciplina().equals(d.getNome()) && m.status() == StatusMatriculaDisciplina.CURSANDO)
                m.registraNota(nota);
        }
    } 
    
    boolean verificaSeFormou () {
        int i,formou=0;
        for(i=0;i<aluno.grade().disciplinas.size();i++){
            if (constaAprovacao(aluno.grade().disciplinas.get(i)))
                formou++;
            else
                System.out.println("O Aluno "+ aluno.name() + " ainda precisa cursar a disciplina " + aluno.grade().disciplinas.get(i).getNome());
        }
                
        return aluno.grade().disciplinas.size()==formou;
    }
}
    