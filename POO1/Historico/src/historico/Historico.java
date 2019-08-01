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

import java.util.Vector;

public class Historico {

    Vector<Disciplina> listaDisciplinas = new Vector<Disciplina>();

    void matriculaDisciplina (Disciplina d) {

        listaDisciplinas.add(d);

    }

    void imprime () {

        System.out.println("Historico do Aluno");

        for (Disciplina d: listaDisciplinas)

            d.imprime();          

    }

}