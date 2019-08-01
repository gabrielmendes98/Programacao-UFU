/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package janelasimples;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author GABRIEL
 */
public class JanelaSimples {
 public JanelaSimples() {
     
 final JButton botaoLimpa = new JButton("Limpa"); //botão
 final JTextField campoTexto = new JTextField(10); //texto
 campoTexto.setText("Java");
 final JFrame janela = new JFrame ("Janela Simples"); //janela
 janela.setSize(500,200);
 JPanel painel = new JPanel(); // adiciona componentes
 painel.add (botaoLimpa);
 painel.add (campoTexto);
 
 janela.getContentPane().add(painel);
 //Quando o usuário clicar no botao, limpa o campo de texto
 
 botaoLimpa.addActionListener (new ActionListener() {
 public void actionPerformed (ActionEvent e) {
 campoTexto.setText("");
 }
 });
 janela.setVisible(true);
 }
 public static void main(String[] args) {
 new JanelaSimples();
 }
}
