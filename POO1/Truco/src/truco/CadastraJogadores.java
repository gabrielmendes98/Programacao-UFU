/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truco;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.WindowConstants;

/**
 *
 * @author GABRIEL
 */
public class CadastraJogadores extends JFrame{
    public CadastraJogadores(Cadastros c){
        //Cadastros c = new Cadastros();
        
        final JButton botaoCadastro = new JButton("Cadastrar Jogador"); //botão de cadastro
        final JButton botaoLista = new JButton("Listar Jogadores"); //botão de listar

        final JLabel seuNome = new JLabel("Nome: ");
        final JTextField campoTexto = new JTextField(10); //texto
        campoTexto.setText("");

        final JFrame janela = new JFrame ("Cadastro"); //janela
        janela.setSize(200,135);
        JPanel painel = new JPanel(); // adiciona componentes
        painel.add (seuNome);
        painel.add (campoTexto);
        painel.add (botaoCadastro);
        painel.add (botaoLista);
        
        botaoCadastro.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                Jogador p = new Jogador();
                p.setNome(campoTexto.getText());
                c.adicionaJogador(p);
                campoTexto.setText("");
            }
        });
        
        botaoLista.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                JOptionPane.showMessageDialog(null, c.listaJogadoresCadastrados());
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
        //janela.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);  
    }
}
