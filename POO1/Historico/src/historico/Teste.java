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
public class Teste {
    public static void main (String args[]) {
        Disciplina d1 = new Disciplina("POO1");
        Disciplina d2 = new Disciplina("AED2");

        Aluno a1 = new Aluno();

        a1.nome = "Gabriel";
        a1.curso = "BCC";
        a1.numeroDeMatricula = "11621BCC015";
        a1.h.matriculaDisciplina(d1);
        a1.h.matriculaDisciplina(d2);

        a1.imprime();
    }
}