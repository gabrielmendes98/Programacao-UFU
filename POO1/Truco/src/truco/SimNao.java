/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 *
 * @author GABRIEL
 */
public class SimNao {
    public SimNao(){
        final JFrame janela = new JFrame ("Proposta"); //janela
        janela.setSize(200,300);
        JPanel painel = new JPanel();
        
        final JButton aceitar = new JButton("Aceitar");
        final JButton recusar = new JButton("Recusar");
        
        painel.add(aceitar);
        painel.add(recusar);
        
        aceitar.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                //aumenta valor da rodada
                //muda o valor das proximas janelas
            }
        });
        
        recusar.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                //reinicia partida
                //pega valor da rodada na pontuacao da dupla
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
    }
}
