/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calculadora;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author GABRIEL
 */
public class Calculadora {

    public Calculadora (){
        final JFrame janela = new JFrame ("Calculadora");
        janela.setSize(200,160);
        
        
        final JTextField campoTexto = new JTextField(20); //texto
        campoTexto.setText("");
        
        final JButton botao7 = new JButton("7");
        final JButton botao8 = new JButton("8");
        final JButton botao9 = new JButton("9");
        final JButton botao4 = new JButton("4");
        final JButton botao5 = new JButton("5");
        final JButton botao6 = new JButton("6");
        final JButton botao1 = new JButton("1");
        final JButton botao2 = new JButton("2");
        final JButton botao3 = new JButton("3");
        final JButton botao0 = new JButton("0");
        final JButton botaoSoma = new JButton("+");
        final JButton botaoSub = new JButton("-");
        final JButton botaoMult = new JButton("*");
        final JButton botaoDiv = new JButton("/");
        final JButton botaoIgual = new JButton("=");
        final JButton botaoClear = new JButton("Clear");
        
        JButton botaoFalso1 = new JButton ("  ");
        botaoFalso1.setEnabled(false); 
        JButton botaoFalso2 = new JButton ("  ");
        botaoFalso2.setEnabled(false); 
        
        JPanel painel = new JPanel(); // adiciona componentes
        painel.add (campoTexto);
        painel.add (botao7);
        painel.add (botao8);
        painel.add (botao9);
        painel.add (botaoSoma);
        painel.add (botao4);
        painel.add (botao5);
        painel.add (botao6);
        painel.add (botaoSub);
        painel.add (botao1);
        painel.add (botao2);
        painel.add (botao3);
        painel.add (botaoMult);
        painel.add (botaoFalso1);
        painel.add (botao0);
        painel.add (botaoFalso2);
        painel.add (botaoDiv);
        painel.add (botaoClear);
        painel.add (botaoIgual);
        
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
    }
    public static void main(String[] args) {
        new Calculadora();
    }
    
}
