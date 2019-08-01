/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pilhateste;

/**
 *
 * @author GABRIEL
 */
class Pilha { 
    int pilha[]; 
    int top; 
    Pilha (int n){
        pilha = new int[n]; 
        top=-1;
    }
    
    int top () throws PilhaVaziaExcecao{ 
        if (vazia()) throw new PilhaVaziaExcecao(); 
        return pilha[top]; 
    } 
    
    boolean vazia (){ 
        return top == -1; 
    } 
    
    boolean cheia (){
        return top == pilha.length-1; 
    } 
    
    void push (int x) throws PilhaCheiaExcecao{ 
        if (cheia()) throw new PilhaCheiaExcecao();
        pilha[++top] = x;
    } 
    
    int pop () throws PilhaVaziaExcecao{
        if (vazia()) throw new PilhaVaziaExcecao();
        return pilha[top--];
    }
}
