package calculadora2;

 import javax.swing.JFrame;
 import javax.swing.JPanel;
 import javax.swing.JButton;
 import javax.swing.JTextField;
 import java.awt.BorderLayout;
 import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import javax.swing.WindowConstants;
 public class Calculadora2 extends JFrame
 {
     final JPanel pn1, pn2;
     final JButton bt0, bt1, bt2, bt3, bt4, bt5, bt6, bt7, bt8, bt9, btFalso1, btFalso2, botaoSoma, botaoSub, botaoMult, botaoDiv, botaoIgual;
     final JButton btClear;
     final JTextField tf1;
     final BorderLayout bl1;
     final GridLayout gl1,gl2;
     double valor1,valor2;
     String sinal;
     public Calculadora2()
     {
           super("Calculadora");
           pn1 = new JPanel();
           pn2 = new JPanel();
           bt0 = new JButton("0");
           bt1 = new JButton("1");
           bt2 = new JButton("2");
           bt3 = new JButton("3");
           bt4 = new JButton("4");
           bt5 = new JButton("5");
           bt6 = new JButton("6");
           bt7 = new JButton("7");
           bt8 = new JButton("8");
           bt9 = new JButton("9");
           btFalso1 = new JButton("  ");
           btFalso1.setEnabled(false); 
           btFalso2 = new JButton("  ");
           btFalso2.setEnabled(false); 
           
           botaoSoma = new JButton("+");
           botaoSub = new JButton("-");
           botaoMult = new JButton("*");
           botaoDiv = new JButton("/");
           botaoIgual = new JButton("=");
           btClear = new JButton("Clear");
           
           
           tf1 = new JTextField();
           bl1 = new BorderLayout();
           gl1 = new GridLayout(4, 3);
           gl2 = new GridLayout(5, 1);
           this.setLayout(bl1);
           this.add(tf1, BorderLayout.NORTH);
           this.add(pn1, BorderLayout.CENTER);
           this.add(pn2, BorderLayout.EAST);
           this.add(btClear, BorderLayout.SOUTH);
           
           
           pn1.setLayout(gl1);
           pn1.add(bt7);
           pn1.add(bt8);
           pn1.add(bt9);
           pn1.add(bt4);
           pn1.add(bt5);
           pn1.add(bt6);
           pn1.add(bt1);
           pn1.add(bt2);
           pn1.add(bt3);
           pn1.add(btFalso1);
           pn1.add(bt0);
           pn1.add(btFalso2);
           
           pn2.setLayout(gl2);
           pn2.add(botaoSoma);
           pn2.add(botaoSub);
           pn2.add(botaoMult);
           pn2.add(botaoDiv);
           pn2.add(botaoIgual);
           
           bt0.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"0");
            }
           });
           bt1.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"1");
            }
           });
           bt2.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"2");
            }
           });
           bt3.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"3");
            }
           });
           bt4.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"4");
            }
           });
           bt5.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"5");
            }
           });
           bt6.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"6");
            }
           });
           bt7.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"7");
            }
           });
           bt8.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"8");
            }
           });
           bt9.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText(tf1.getText()+"9");
            }
           });
           botaoSoma.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                valor1 = Double.parseDouble(tf1.getText());
                tf1.setText("");
                sinal = "+";
            }
           });
           botaoSub.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                valor1 = Double.parseDouble(tf1.getText());
                tf1.setText("");
                sinal = "-";
            }
           });
           botaoDiv.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                valor1 = Double.parseDouble(tf1.getText());
                tf1.setText("");
                sinal = "/";
            }
           });
           botaoMult.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                valor1 = Double.parseDouble(tf1.getText());
                tf1.setText("");
                sinal = "*";
            }
           });
           btClear.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                tf1.setText("");
                valor1=0;
                valor2=0;
                sinal="";
            }
           });
           botaoIgual.addActionListener (new ActionListener() {
            public void actionPerformed (ActionEvent e) {
                valor2 = Double.parseDouble(tf1.getText());
                if (sinal == "+")
                    tf1.setText(String.valueOf(valor1+valor2));
                else if (sinal == "-")
                    tf1.setText(String.valueOf(valor1-valor2));
                else if (sinal == "*")
                    tf1.setText(String.valueOf(valor1*valor2));
                else if (sinal == "/")
                    tf1.setText(String.valueOf(valor1/valor2));
                else
                    tf1.setText(tf1.getText());
            }
           });
           
           this.pack();
           this.setVisible(true);
           setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);  
           
     }
     public static void main(String[] args)
     {
            new Calculadora2();
      }
 }