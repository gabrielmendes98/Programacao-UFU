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
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.WindowConstants;

/**
 *
 * @author GABRIEL
 */
public class CadastraDuplas extends JFrame{
    public CadastraDuplas (Cadastros c){
        //Cadastros c = new Cadastros();
        
        final JButton botaoCadastro = new JButton("Cadastrar Dupla"); //botão de cadastro
        final JButton botaoListaDuplas = new JButton("Listar Dupla"); //botão de listar duplas
        final JButton botaoListaJogadores = new JButton("Lista Jogadores"); //botao de listar jogadores cadastrados

        final JLabel jogador1 = new JLabel("Jogador1: ");
        final JTextField campoTexto = new JTextField(10); //texto
        campoTexto.setText("");
        final JLabel jogador2 = new JLabel("Jogador2: ");
        final JTextField campoTexto2 = new JTextField(10); //texto
        campoTexto2.setText("");

        final JFrame janela = new JFrame ("Cadastro"); //janela
        janela.setSize(200,185);
        JPanel painel = new JPanel(); // adiciona componentes
        painel.add (jogador1);
        painel.add (campoTexto);
        painel.add (jogador2);
        painel.add (campoTexto2);
        painel.add (botaoListaJogadores);
        painel.add (botaoCadastro);
        painel.add (botaoListaDuplas);
        
        botaoCadastro.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                int i, j=1, avalia=0, posj1=0, posj2=0;
                Dupla d = new Dupla();
                //d.jogador1.setNome(campoTexto.getText());
                //d.jogador2.setNome(campoTexto2.getText());
                
                for (i=0; i<c.jogador.size();i++){
                    if (campoTexto.getText().equals(c.jogador.get(i).getNome()) && c.jogador.get(i).esta_em_dupla == 0){
                        d.jogador1.setNome(campoTexto.getText());
                        posj1=i;
                        j=0;
                        avalia++;
                        break;
                    }
                }
                if(j==1)
                    JOptionPane.showMessageDialog(null, "Erro, jogador 1 nao encontrado ou ja esta em uma dupla");
                for (i=0; i<c.jogador.size();i++){
                    if (campoTexto2.getText().equals(c.jogador.get(i).getNome()) && c.jogador.get(i).esta_em_dupla == 0){
                        d.jogador2.setNome(campoTexto2.getText());
                        posj2=i;
                        j=0;
                        avalia++;
                        break;
                    }
                }
                if(j==1)
                    JOptionPane.showMessageDialog(null, "Erro, jogador 2 nao encontrado ou ja esta em uma dupla");

                if(avalia == 2){
                    c.adicionaDupla(d);
                    c.jogador.get(posj1).esta_em_dupla = 1;
                    c.jogador.get(posj2).esta_em_dupla = 1;
                }
                else
                    JOptionPane.showMessageDialog(null, "Nao foi possivel cadastrar dupla");
                
                campoTexto.setText("");
                campoTexto2.setText("");
            }
        });
        
        botaoListaDuplas.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                JOptionPane.showMessageDialog(null, c.listaDuplasCadastradas());
            }
        });
        
        botaoListaJogadores.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                JOptionPane.showMessageDialog(null, c.listaJogadoresCadastrados());
            }
        });
        
        janela.getContentPane().add(painel);
        janela.setVisible(true);
        //janela.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);  
    }
}
