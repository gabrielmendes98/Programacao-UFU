/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

/**
 *
 * @author GABRIEL
 */
public class Teste {
    public static void main(String[] args) {
       Teste t = new Teste();
       t.f();
    }
    void f(){
        System.out.println("testef");
        Teste.g();
    }
    void g(){
        System.out.println("testeg");
    }
}
