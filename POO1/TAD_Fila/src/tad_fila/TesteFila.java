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
public class TesteFila {
    Fila f = new Fila(10);
    public static void main(String[] args) {
       Fila f = new Fila(10);
       try{
           new TesteFila();
       }
       catch(Exception e){
           System.out.println("Erro no main");
       }
       finally{
           System.out.println("Fim.");
       }
    }
    
    public TesteFila() throws FilaExcecao{
        try{
            for(int i=1;i<=10;i++)
                f.enfileira(i);
            
            System.out.println("Tenta desempilhar");
            
            for(int i=0;i<=10;i++)
                f.desenfileira();
        }
        catch(FilaCheiaExcecao e){ System.out.println("Fila Cheia"); }
        catch(FilaVaziaExcecao e){ System.out.println("Fila Vazia"); }
    }

}
