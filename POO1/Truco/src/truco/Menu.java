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
import javax.swing.JPanel;
import javax.swing.WindowConstants;

/**
 *
 * @author GABRIEL
 */
public class Menu extends JFrame {
    public Menu(){
        Cadastros c = new Cadastros();
        
        final JButton botaoCadastro1 = new JButton("Cadastra Jogadores"); //botão de cadastro
        final JButton botaoCadastro2 = new JButton("Cadastra Duplas"); //botão de cadastro
        
        
        final JFrame janela = new JFrame ("Cadastro"); //janela
        janela.setSize(200,160);
        JPanel painel = new JPanel(); // adiciona componentes
        painel.add (botaoCadastro1);
        painel.add (botaoCadastro2);
        
        
        botaoCadastro1.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                CadastraJogadores cadastraJogadores = new CadastraJogadores(c);
            }
        });
        
        botaoCadastro2.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                CadastraDuplas d = new CadastraDuplas(c);
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
        janela.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);  
    }
}
