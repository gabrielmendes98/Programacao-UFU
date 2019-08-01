/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tad_fila;

/**
 *
 * @author GABRIEL
 */
public class Fila {
    int[] fila;
    int tamanho;
    public Fila(int n){
        fila = new int[n];
        tamanho = -1;
    }
    
    int finalFila() throws FilaVaziaExcecao{
        if(vazia())
            throw new FilaVaziaExcecao();
        return fila[tamanho];
    }
    
    boolean vazia(){
        return tamanho == -1;
    }
    
    boolean cheia(){
        return tamanho == fila.length-1;
    }
    
    void enfileira(int n) throws FilaCheiaExcecao{
        if(cheia())
            throw new FilaCheiaExcecao();
        tamanho++;
        fila[tamanho]=n;
    }
    
    int desenfileira() throws FilaVaziaExcecao{
        if(vazia())
            throw new FilaVaziaExcecao();
        int aux;
        aux = fila[tamanho];
        tamanho--;
        return aux;
    }
}
