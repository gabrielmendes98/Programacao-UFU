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
public class TestePilha { 
    Pilha p = new Pilha(3);
    public static void main (String args[]) {
        try { 
            new TestePilha();
        }
        catch (Exception e) { 
            System.out.println("Erro no main!");
        }
        finally { 
            System.out.println("finally"); 
        } 
    }
    //public TestePilha () throws PilhaExcecao { try { a(); } catch (PilhaExcecao e) { System.out.println("Erro de pilha!");} }
    //void a() throws PilhaExcecao { p.push(1); p.push(2); for (int i=0; i<=3; i++) System.out.println(" " + p.pop()); }
    
    //public TestePilha () throws PilhaExcecao { try { b(); } catch (PilhaCheiaExcecao e) { System.out.println("Erro de pilha cheia!"); } catch (PilhaVaziaExcecao e) { System.out.println("Erro de pilha vazia"); } }
    //void b() throws PilhaExcecao { p.push(1); p.push(2); p.push(3); p.push(4); for (int i=0; i<=4; i++) System.out.println(" " + p.pop());}
    
    public TestePilha () throws PilhaExcecao {
        c(); 
    }
    void c() throws PilhaExcecao {
        p.push(p.top());
        System.out.println("Fim de C"); 
    }
}
