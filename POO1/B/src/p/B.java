/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p;

public class B {
    A vetor[] = new A[2];
    public void g(){
        System.out.println(vetor[0].f());
        System.out.println(vetor[1].f());
    }
    public static void main (String args[]){
        B b1 = new B();
        b1.g();
    }
}
