/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cadastro;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author GABRIEL
 */
public class Cadastro {
    
    public Cadastro(){
        
        Cadastrados c = new Cadastrados();
        
        ImageIcon imgCadastro = new ImageIcon("C:\\Users\\GABRIEL\\Desktop\\rei_copas.png");
        final JButton botaoCadastro = new JButton(imgCadastro); //botão de cadastro
        botaoCadastro.setSize(150, 50);
        ImageIcon imgLista = new ImageIcon("C:\\Users\\GABRIEL\\Desktop\\listar2.png");
        final JButton botaoLista = new JButton(imgLista); //botão de listar

        final JLabel seuNome = new JLabel("     Nome: ");
        final JTextField campoTexto = new JTextField(10); //texto
        campoTexto.setText("");
        
        final JLabel seuTelefone = new JLabel("Telefone: ");
        final JTextField campoTexto2 = new JTextField(10); //texto
        campoTexto2.setText("");

        final JFrame janela = new JFrame ("Cadastro"); //janela
        janela.setSize(200,160);
        JPanel painel = new JPanel(); // adiciona componentes
        painel.add (seuNome);
        painel.add (campoTexto);
        painel.add (seuTelefone);
        painel.add (campoTexto2);
        painel.add (botaoCadastro);
        painel.add (botaoLista);
        
        botaoCadastro.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                Pessoa p = new Pessoa();
                p.setNome(campoTexto.getText());
                p.setTelefone(campoTexto2.getText());
                c.adicionaPessoa(p);
                campoTexto.setText("");
                campoTexto2.setText("");
            }
        });
        
        botaoLista.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                JOptionPane.showMessageDialog(null, c.listaCadastrados());
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
    }
    public static void main(String[] args) {
        new Cadastro();
    }
    
}
