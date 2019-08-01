/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package questao2p2;

import java.awt.event.*;
import javax.swing.*;
import static javax.swing.WindowConstants.EXIT_ON_CLOSE;

/**
 *
 * @author GABRIEL
 */
public class Janela {
    final JButton direita;
    final JButton esquerda;
    final JTextField texto1;
    final JTextField texto2;
    final JFrame janela;
    final JPanel painel;
    public Janela(){
        direita = new JButton(">>");
        esquerda = new JButton("<<");
        texto1 = new JTextField(3);
        texto2 = new JTextField(3);
        texto1.setText("1");
        texto2.setText("2");
        
        painel = new JPanel();
        janela = new JFrame("");
        janela.setSize(215,100);
        
        painel.add(direita);
        painel.add(texto1);
        painel.add(texto2);
        painel.add(esquerda);
        
        direita.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                texto2.setText(texto1.getText());
            }
        });
        
        esquerda.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                texto1.setText(texto2.getText());
            }
        });
        
        janela.add(painel);
        janela.setVisible(true);
        janela.setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    
    public static void main(String[] args) {
         new Janela();
    }
}
