/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package botao3;

import java.awt.event.*;
import javax.swing.*;
import static javax.swing.JFrame.EXIT_ON_CLOSE;

/**
 *
 * @author GABRIEL
 */
public class Botao{
	final JButton botaoMenos;
	final JButton botaoMais;
	final JFrame janela;
	final JPanel painel;
	final JTextField texto;
	int valor=0;
	public Botao(){
		botaoMenos = new JButton("--");
		botaoMais = new JButton("++");
		texto = new JTextField(3);
		texto.setText("0");
		janela = new JFrame("+-");
		janela.setSize(200,200);
		painel = new JPanel();

		
		painel.add(botaoMenos);
		painel.add(texto);
		painel.add(botaoMais);

		botaoMenos.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				valor = Integer.valueOf(texto.getText()) - 1;
				texto.setText(String.valueOf(valor));
			}
		});

		botaoMais.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				valor = Integer.valueOf(texto.getText()) + 1;
				texto.setText(String.valueOf(valor));
			}
		});

		janela.add(painel);
		janela.setVisible(true);
		janela.setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
}