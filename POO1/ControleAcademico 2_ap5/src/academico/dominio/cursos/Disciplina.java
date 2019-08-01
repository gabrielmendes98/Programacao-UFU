/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.dominio.cursos;
import java.util.*;
/**
 *
 * @author Marcelo
 */
public class Disciplina {
    private String nome;
    public String prerequisito = "0";
    
    public Disciplina (String nome) {
        this.nome = nome;
    }
    
    public String getNome() {
        return nome;
    }
}
