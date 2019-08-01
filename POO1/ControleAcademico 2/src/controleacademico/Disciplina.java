/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleacademico;
import java.util.*;
/**
 *
 * @author Marcelo
 */
public class Disciplina {
    String nome;
    String prerequisito = "0";
    
    Disciplina (String nome) {
        this.nome = nome;
    }
    

    String getNome() {
        return nome;
    }
}
