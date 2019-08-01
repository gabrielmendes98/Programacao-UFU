/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cadastro;

import java.util.Vector;

/**
 *
 * @author GABRIEL
 */
public class Cadastrados {
    Vector<Pessoa> pessoa = new Vector<Pessoa>();
            
    void adicionaPessoa (Pessoa d) {
        pessoa.add(d);
    }
    
    void imprime(){
        for(Pessoa p: pessoa)
            p.imprime();
    }
    
    public String listaCadastrados(){
        String lista="Nomes cadastrados:\n";
        for(Pessoa p: pessoa)
            lista+=p.getNome()+"\n";
        return lista;
    }
    
}
