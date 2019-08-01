/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package questao2p2;

/**
 *
 * @author GABRIEL
 */
public class TestePilha { 
    Pilha p = new Pilha(3);
    public static void main (String args[]) throws PilhaExcecao { 
        try { 
            new TestePilha(); 
            System.out.println("Conclui TestePilha");
        } 
        catch (PilhaCheiaExcecao e) { 
            System.out.println("Erro no main!");
        } 
        finally { 
            System.out.println("finally");
        } 
        System.out.println("Fim main"); 
    }
    
    public TestePilha () throws PilhaExcecao { c(); }
    
    void c() throws PilhaExcecao { p.push(p.top()); System.out.println("Fim de C"); }
    
    class Pilha { int pilha[]; int top; Pilha (int n) { pilha = new int[n]; top=-1; } int top () throws PilhaVaziaExcecao { if (vazia()) throw new PilhaVaziaExcecao(); return pilha[top]; } boolean vazia () { return top == -1; } boolean cheia () { return top == pilha.length-1; } void push (int x) throws PilhaCheiaExcecao { if (cheia()) throw new PilhaCheiaExcecao(); pilha[++top] = x; } int pop () throws PilhaVaziaExcecao { if (vazia()) throw new PilhaVaziaExcecao(); return pilha[top--]; } } class PilhaExcecao extends Exception {} class PilhaVaziaExcecao extends PilhaExcecao {} class PilhaCheiaExcecao extends PilhaExcecao {}
}

