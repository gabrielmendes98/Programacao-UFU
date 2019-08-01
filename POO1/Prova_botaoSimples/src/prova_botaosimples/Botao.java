/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prova_botaosimples;

import java.awt.FlowLayout;
import java.awt.event.*;
import javax.swing.*;

public class Botao {
    int valor = 0;
    final JButton botaoMenos;
    final JButton botaoMais;
    final JTextField texto;
    final JFrame janela;
    final JPanel painel;
    public Botao(){
        botaoMenos = new JButton("--");
        botaoMais = new JButton("++");
        texto = new JTextField(3);
        texto.setText("0");
        painel = new JPanel();
        janela = new JFrame("+-");
        janela.setSize(165,80);
        //((FlowLayout)painel.getLayout()).setVgap(0); 
        painel.add(botaoMenos);
        painel.add(texto);
        painel.add(botaoMais);
        
        
        botaoMenos.addActionListener(new ActionListener(){
            public void actionPerformed (ActionEvent e){
                valor = Integer.valueOf(texto.getText()) - 1;
                texto.setText(Integer.toString(valor));
            }
        });
        
        botaoMais.addActionListener(new ActionListener(){
            public void actionPerformed (ActionEvent e){
                valor = Integer.valueOf(texto.getText()) + 1;
                texto.setText(Integer.toString(valor));
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
        janela.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}
