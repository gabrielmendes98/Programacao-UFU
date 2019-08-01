/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author GABRIEL
 */
public class OpcoesJogador {
    public OpcoesJogador(Jogador j){
        final JFrame janela = new JFrame ("Jogador x"); //janela
        janela.setSize(200,300);
        JPanel painel = new JPanel();
        
        final JButton carta1 = new JButton(j.c1.getNumero() + " de " + j.c1.getNaipe());
        final JButton carta2 = new JButton(j.c2.getNumero()+ " de " + j.c2.getNaipe());
        final JButton carta3 = new JButton(j.c3.getNumero()+ " de " + j.c3.getNaipe());
        final JButton truco = new JButton("Truco");
        final JButton correr = new JButton("Correr");
        
        painel.add(carta1);
        painel.add(carta2);
        painel.add(carta3);
        painel.add(truco);
        painel.add(correr);
        
        botaoListaDuplas.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                JOptionPane.showMessageDialog(null, c.listaDuplasCadastradas());
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
    }
}
